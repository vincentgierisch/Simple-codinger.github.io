---
layout: post
title: Warum dich der Computer in Brettspielen (fast) immer schlagen wird (Machine Learning)
excerpt_separator: <!--more-->
---
*Dieser Artikel ist eine Fortsetzung. Den Ursprünglichen findest du [hier](../boardGames/).*\
Im letzten Artikel habe ich besprochen, wie der Computer den besten Zug in einem Vier Gewinnt Spiel finden kann.
Diese Methoden haben immer mithilfe eines Suchbaumes zukünftige Spielsituationen analysiert, um so an den besten Zug zu kommen.\
Nun wollen wir uns mal ansehen, wie wir mit der Hilfe von Machine Learning (Maschinelles Lernen) den besten Zug finden können.
<!--more-->

## Was ist maschinelles Lernen?
Das maschinelles Lernen ist wohl einer der interessantesten Teilbereiche der künstlichen Intelligenz.
Hierfür wird der Computer trainiert um eine bestimmte Aufgabe zu lösen. Bei diesem Training sammelt der Computer Erfahrung.
Diese Erfahrung kann er später nutzen, um die Aufgaben, für die er trainiert worden ist, selbstständig zu lösen.\
Also ähnlich wie bei uns Menschen.

Jedoch kann der Computer seinen Erfahrungsschatz nicht nutzen um ihn auf andere Aufgabengebiete zu übertragen.
Das bleibt bis jetzt nur den (meisten) Menschen vorbehalten. Ein Kollege hat da mal ein gutes Beispiel formuliert:
"Eine KI die darauf trainiert wird eine breite Treppe hochzugehen, kann das auch noch, wenn einer das Licht ausmacht.
Wenn man sie jedoch plötzlich auf eine Wendeltreppe stellt, wird sie gegen die Wand laufen."

Man kann maschinelles Lernen in drei große Bereiche einteilen: 
* Überwachtes Lernen
* Unüberwachtes Lernen
* Bestärkendes Lernen

Diese unterscheiden sich hauptsächlich in der Art des Trainings.
Wir wollen uns in diesem Artikel den Bereich bestärkendes Lernen (engl.: reinforcement learning) genauer ansehen.
