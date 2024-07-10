---
layout: post
title: Wie sicher sind meine Nachrichten?
published: true
excerpt_separator: <!--more-->
---
In diesem Artikel möchte ich etwas über die stille Heldin der Kommunikation reden.\
**Die Verschlüsselung.**\
Diese stellt sicher, dass Nachrichten nur von den Personen gelesen werden können, die diese lesen sollen.

<!--more-->
Ich weiß nicht, wie es dem Rest der Menschheit geht, aber ich fühle mich wohler, 
wenn ich im Glauben bin, dass meine WhatsApp-Nachrichten bzw. meine E-Mails nur von dem Empfänger und mir gelesen werden können.
Nicht dass sich so ein aufregendes Leben hätte, aber es lässt mich doch besser einschlafen in der Nacht.

Um uns den heutigen Verschlüsselungstechniken zu nähern, lasst uns zunächst einen kurzen Ausflug über die Techniken der letzten Jahrhunderte machen.

# Eine kurze Geschichte der Verschlüsselung
## Skytale
Wahrscheinlich ist die erste Verschlüsselung wesentlich älter, jedoch will ich die erste Station bei der Skytale Chiffre machen.
Diese Technik wurde bereits vor 2500 Jahren in Sparta eingesetzt um Nachrichten an Generäle auf dem Schlachtfeld zu übermitteln.\
Der Name Skytale kommt dabei aus dem Altgriechischem und bedeutet so viel wie "Stock" oder auch "Stab".
Es wurde ein Stab genommen und in zwei Hälften getrennt. Die eine erste Hälfte bekam nun der Sender, die zweite der Empfänger.
Sollte nun eine Nachricht übermittelt werden, wurde ein Streifen Leder um den Stab gewickelt. Die Nachricht konnte nun auf eine Seite des Stabs geschrieben werden.
Der Rest des Streifens wurde anschließend mit zufällig gewählten Buchstaben aufgefüllt.

<a title="CrypTool-Projekt, www.cryptool.org, CC BY-SA 3.0 &lt;https://creativecommons.org/licenses/by-sa/3.0&gt;, via Wikimedia Commons" href="https://commons.wikimedia.org/wiki/File:Skytale3d_de.png"><img width="512" alt="Skytale3d de" src="https://upload.wikimedia.org/wikipedia/commons/0/06/Skytale3d_de.png?20080627172257"></a>

Auf dem obigen Bild ist eine Skytale abgebildet. Die entschlüsselte Nachricht lautet: "Karl ist der Verräter".
Wenn jedoch der Bote überfallen wird, kann nur das Lederband ohne den Stab sichergestellt werden.
Die Botschaft die auf dem Lederband zu lesen ist, ist: "KSVEJSIDWGATETOPWENQRDRENPKWETLERRNISFRBIRAB".\
Um dieses Wirrwarr an Buchstaben zu entschlüsseln, ist eben der Stab oder ein Stab mit demselben Durchmesser, der zum Schreiben benutzt wurde, zwingen erforderlich.

## Ceasar Chiffre
Springen wir ein ca. 400 Jahre weiter. Nach Rom. Genauer gesagt zu Gaius Julius Cäsar.
Es wird angenommen, dass Julius Caesar für seine militärische Korrespondenz die Caesar Chiffre verwendet hat.
Wahrscheinlich hieß sie damals nicht so, aber sei es drum.\
Die Caesar Chiffre zeichnet sich dadurch aus, dass jeder Buchstabe des Alphabets um eine bestimmte Anzahl nach rechts verschoben wird.

$$
\begin{smallmatrix}
A & B & C & D & E & F & G & H & I & J & K & L & M & N & O & P & Q & R & S & T & U & V & W & X & Y & Z \\
I & J & K & L & M & N & O & P & Q & R & S & T & U & V & W & X & Y & Z & A & B & C & D & E & F & G & H 
\end{smallmatrix}
$$

In der obigen Abbildung wird eine Ceasar Chiffre mit dem Schlüssel $A = I$ dargestellt. Das bedeutet, dass jedes A durch ein I ersetzt wird, jedes B durch ein J, jedes C durch ein K und so weiter.
Wenn nun die Nachricht "Auch du, mein Sohn" verschlüsselt versendet werden soll, lautet die verschlüsselte Nachricht "ICKPLCUMQVAWPV".\
Soll die Nachricht jetzt wieder entschlüsselt werden, kann die oben aufgestellte Tabelle von unten nach oben angewandt werden. Das bedeutet, man sucht den Buchstaben in der unteren Zeile und ersetzt ihn mit der oberen.\
Der Schlüssel der Ceasar Chiffre ist also die Anzahl, um wie viel das Alphabet nach rechts verschoben wird.

Ein offensichtliches Problem dieses Verschlüsselungsverfahrens ist, dass es nur 25 Schlüssel gibt. Das bedeutet, man kann leicht alle möglichen Schlüssel ausprobieren, um so an die Nachricht zu kommen.

## Zweiter Weltkrieg
Machen wir wieder einen deutlich größeren Zeitsprung. In die Zeit des zweiten Weltrkrieges.\
Da alle Parteien davon ausgehen mussten, dass ihre Funksprüche abgehört werden, mussten diese verschlüsselt werden.
Nazi-Deutschland benutzte für die Verschlüsselung die Enigma.\
Die Enigma ähnelt vom Aussehen einer Schreibmaschine. Für jeden Buchstaben den man eintippt, leuchtet ein anderer Buchstabe auf.
So konnte man seine Nachricht eingeben und die Buchstaben die dabei aufleuchten ergaben die verschlüsselte Nachricht.\
Den Vorgang der Verschlüsselung kann man sich ähnlich zur Ceasar-Chiffre vorstellen. Jedoch ist das Verschlüsselungsalphabet (unten) willkürlich angeordnet.
Verantwortlich für die Anordnung des Verschlüsselungsalphabets waren zwei Bestandteile. 
Mehrere Walzen innerhalb der Maschine, sowie ein Steckbrett, welches für jeden Stecker zwei Buchstaben miteinander vertauscht hat. 
Wurde ein Buchstabe auf der Tastatur angeschlagen, haben sich die Walzen in eine neue Stellung gebracht und so das Verschlüsselungsalphabet wieder "durchgemischt".

![EnigmaMachine](/images/enigma.jpg){:width="700" style="display:block; margin-left:auto; margin-right:auto"}

Um die Nachricht zu entschlüsseln brauchte der Empfänger ebenfalls eine Enigma. 
Auch mussten die Walzenstellung sowie die Anordnung des Steckbrettes die selbe sein, wie die, die zur Verschlüsselung benutzt worden ist. 
Anschließend konnten die einzelnen Buchstaben der verschlüsselten Nachricht eingegeben werden. Die Buchstaben, die dabei aufleuchteten, konnten zur ursprünglichen Nachricht zusammengesetzt werden.\
Der Schlüssel den die Enigma benutzte war also die Stellung der Walzen und die Einstellung des Steckbretts. Diese wurden in einem Schlüsselbuch der Wehrmacht festgehalten.

## Kalter Krieg
<!-- Einmalverschlüsselung -->
<!-- Später beschreiben was bei den einzelnen Techniken der Schlüssel ist -->

**Danke fürs Lesen, bleibt neugierig**
