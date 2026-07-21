require "bibtex"

# Parses publications.bib at the site root into site.data['publications'],
# so pages can list it like any other Jekyll data file.
module Jekyll
  class PublicationsGenerator < Generator
    safe true
    priority :low

    MONTHS = {
      "jan" => 1, "feb" => 2, "mar" => 3, "apr" => 4, "may" => 5, "jun" => 6,
      "jul" => 7, "aug" => 8, "sep" => 9, "oct" => 10, "nov" => 11, "dec" => 12
    }.freeze

    MONTH_NAMES = %w[
      January February March April May June
      July August September October November December
    ].freeze

    def generate(site)
      bib_path = File.join(site.source, "publications.bib")
      return unless File.exist?(bib_path)

      # strip: false keeps line breaks in field values (BibTeX otherwise
      # collapses them to a single space) so the abstract can be split
      # back into paragraphs on the line breaks the .bib file already has.
      entries = BibTeX.open(bib_path, strip: false).select { |e| e.is_a?(BibTeX::Entry) }

      publications = entries.map do |entry|
        month_num = parse_month(entry)

        {
          "key"      => entry.key.to_s,
          "type"     => entry.type.to_s,
          "title"    => field(entry, :title),
          "authors"  => format_authors(entry),
          "year"     => field(entry, :year),
          "month"    => month_num,
          "month_name" => month_num ? MONTH_NAMES[month_num - 1] : nil,
          "venue"    => field(entry, :journal) || field(entry, :booktitle) || field(entry, :publisher) || field(entry, :school),
          "url"      => format_url(entry),
          "abstract" => abstract_paragraphs(entry)
        }
      end

      publications.sort_by! { |pub| [-pub["year"].to_i, -(pub["month"] || 0)] }

      site.data["publications"] = publications
    end

    private

    def parse_month(entry)
      month = field(entry, :month)
      return nil unless month

      MONTHS[month.downcase[0, 3]]
    end

    # Field access on BibTeX::Entry raises NoMethodError instead of
    # returning nil when the field isn't set for that entry, so every
    # lookup has to go through field? first.
    def field(entry, name)
      return nil unless entry.field?(name)

      clean(entry.send(name))
    end

    # Collapses line breaks/whitespace for ordinary single-line fields
    # (title, venue, ...); abstracts are handled separately so their
    # paragraph breaks survive.
    def clean(value)
      return nil if value.nil?
      text = value.to_s.strip.gsub(/\s*\n\s*/, " ")
      text.empty? ? nil : text
    end

    def abstract_paragraphs(entry)
      raw = if entry.field?(:abstract)
              entry.abstract.to_s
            elsif entry.field?(:note)
              entry.note.to_s
            end
      return [] unless raw

      raw.split(/\n+/).map { |paragraph| paragraph.strip.gsub(/\s+/, " ") }.reject(&:empty?)
    end

    def format_authors(entry)
      return nil unless entry.field?(:author)

      entry.author.map { |name| [name.first, name.last].reject(&:nil?).join(" ") }.join(", ")
    end

    def format_url(entry)
      return field(entry, :url) if entry.field?(:url)
      return "https://doi.org/#{field(entry, :doi)}" if entry.field?(:doi)

      nil
    end
  end
end
