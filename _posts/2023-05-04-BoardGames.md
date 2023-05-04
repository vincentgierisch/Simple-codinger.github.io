---
layout: post
title: Warum dich Computer der in Brettspielen (fast) immer schlagen wird
excerpt_separator: <!--more-->
---
In diesem Artikel werde ich versuchen euch ein paar Taktiken zu erklären, die ein Computer anwendet um euch in einem Brettspiel zu besiegen.\
Es war eher ein ruhiger Abend in der WG, als eine Freundin (fast schon aus dem nichts) ein 4-Gewinnt-Spiel aus ihrer Handtasche zog.\
Als wir ein paar Runden gespielt haben wurde mir eines klar: Ich war richtig schlecht darin. Und damit meine ich nicht, dass ich ein paar Spiele verloren habe, nein, ich habe soweit ich weis kein einziges gewonnen.
<!--more-->
Nach dieser Niederlage gab es logischerweise nur eine handvoll von Optionen: Aus der WG ausziehen und irgendwo ein neues Leben anfangen, ein paar Stunden hinsetzen und eine Taktik für 4-Gewinnt aneignen, oder ein paar Wochen/Monate hinsetzten und einen Algorithmus entwickeln, der jeden Profi in 4-Gewinnt schlägt.\
Klar, dass man sich als Informatiker für die letzte Variante entscheidet. Wobei die erste Variante auch sehr verlockend war.

Noch eine Anmerkungen an die Leute die jetzt behaupten: "Nur weil du das Program geschrieben hast, dass einen Spieler besiegt, hast du doch nicht den Spieler geschlagen".
Ich würde behaupten, dass diese Beziehung hier transitiv ist. Also ja, wenn mein Program den Spieler schlägt, habe ich den Spieler geschlagen.

## Einleitung
Kurz zur Wiederholung: Wie spielt man 4-Gewinnt?

![ConnectFourBoard](/images/boardGame/connectFour.png){:width="500" style="display:block; margin-left:auto; margin-right:auto"}

Hier abgebildet ist ein handelsübliches 4-Gewinnt-Spiel. Ein blaues Brett und gelbe bzw. rote Spielsteine. Das Brett ist 6 Felder hoch und 7 breit.
Das Brett hat oben Öffnungen, sodass Spielsteine hineingeworfen werden können.
Das Spiel wird mit zwei Spieler gespielt. Ein Spieler bekommt die roten, der andere die gelben Spielsteine.\
Im Spielverlauf werfen die Spieler abwechselnd ihre Steine in das Brett. Gewonnen hat der Spieler, der als Erstes 4 seiner eigenen Spielsteine in eine Linie bringt. Die Linie darf darbei nicht von anderen Steinen unterbrochen sein. Es ist jedoch egal, ob die Line horizontal, vertikal oder schräg verläuft.\
Es kann jedoch auch passieren, dass kein Spieler gewinnt und das Brett bereits voll mit Spielsteinen besetzt ist. Ein klassiches Unentschieden also.

## Ein bisschen Mathematik 
Um nun dem Computer das Spielen beizubringen, müssen wir uns erstmal die Informationen ansehen, die wir haben. Anschließend alle ünnötigen Informationen wegstreichen und die übrigen schön aufbereiten.\
Was habe wir also?

Ein Spielbrett mit einigen oder keinen (am Anfang) Spielsteinen darin. Einen Haufen roter Steine und einen Haufen gelber Steine.\
Ist es wichtig zu wissen, wie viele roter bzw. gelber Spielsteine noch übrig sind? Nein, denn wir wissen, dass in einem ordentlichen Spiel soviel Steine vorhanden sind, dass wir ein Unentschieden Spielen können.
Das bedeutet, dass wir immer einen Spielstein zur Hand haben, wenn ein Zug möglich ist.\
Jetzt haben wir also nur noch das Spielbrett mitsamt den Steinen darin. Diese Informationen können wir als Zustand $$S_i$$ bezeichnen. Hier steht *i* für die Anzahl der bisher getätigten Züge, bzw. genauer gesagt, die Anzahl der Zustände die es vor dem momentanen Zustand gab.\
Ein Beispiel: der erste Zustand ist $$S_0$$, das leere Brett, kein Stein wurde bis jetzt hineingeworfen. Wenn der erste Spieler einen Stein hineinwirft, ändert sich der Zustand des Spiels von $$S_0$$ zu $$S_1$$.\
Wie viele Zustände kann es in einem Spiel maximal geben? Es können ja maximal soviele Züge getätigt werden, wie das Spielbrett Felder hat. Also 7x6. Zustand $$S_{42}$$ ist somit aufjeden Fall ein letzter Zustand, oder auch *Endzustand* genannt.\
Die nächste Frage ist, wie können wir unsere Zustände schön darstellen.
Da wir Informatiker auch einen leichten Hang zur Mathematik haben, möchte ich das Spielbrett jetzt erstmal in die Zahlenwelt holen.

**Danke fürs lesen, bleibt neugierig**
