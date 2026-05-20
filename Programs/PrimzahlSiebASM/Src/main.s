Moin liebe Silke,

wir würden hierfür zuerst einen Sieb-Array über 1001 Bytes für alle Zahlen von 0 bis 1000 und einen Primzahlen-Array in gleicher Größe, denn wir wissen zu aktuellen Zeit noch nicht wieviele Zahlen wir als Primzahlen gelten. 
Wir setzen den Index der Felder 2 bis 1000 auf 1 (ist Primzahl) und setzen die jeweiliegen Index auf 0, die keine Primzahl sind.
Wir fangen bei 2 an und alle vielfachen (also +2) von von 2 bis 1000 werden gestrichen. Dann überprüfen wir mit 3 und 5 und 7 weiter und streichen die jeweiliegen Vielfachen dieser Zahlen. 
Es sollen dann alle Zahlen, die nicht gestrichen wurden, bis Wurzel 1000 = 31,63 überprüft werden.

Pseude Beispiel:

Alle Werte im Feld isPrime auf 1 setzen
- isPrime[0] = 0, isPrime[1] = 0

Sieb:
- Für i = 2 bis sqrt(1000):
- Wenn isPrime[i] == 1:
- Beginne bei j = i * i
- Streiche alle Vielfachen: j += i
- Setze isPrime[j] = 0

Speichern:
- Durchlaufe das Feld isPrime
- Wenn isPrime[i] == 1:
- Speichere i in primeList

Aber ich wüsste nicht, wie ich diesen ABlauf in Assembler umschreiben kann.

LG