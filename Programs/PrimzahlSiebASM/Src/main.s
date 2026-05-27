Moin liebe Silke,

wir würden hierfür zuerst einen Sieb-Array über 1001 Bytes für alle Zahlen von 0 bis 1000 und einen Primzahlen-Array in gleicher Größe, denn wir wissen zu aktuellen Zeit noch nicht wieviele Zahlen wir als Primzahlen gelten. 
Wir setzen den Index der Felder 2 bis 1000 auf 1 (ist Primzahl) und setzen die jeweiliegen Index auf 0, die keine Primzahl sind.
Wir fangen bei 2 an und alle vielfachen (also +2) von von 2 bis 1000 werden gestrichen. Dann überprüfen wir mit 3 und 5 und 7 weiter und streichen die jeweiliegen Vielfachen dieser Zahlen. 
Es sollen dann alle Zahlen, die nicht gestrichen wurden, bis Wurzel 1000 = 31,63 überprüft werden.

Pseude Beispiel:

for (i = 2; i * i <= N; i++) {
    if (isPrime[i] == 0) {
        for (j = i * i; j <= N; j += i) {
            isPrime[j] = 1;
        }
    }
}

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

Nachtrag zur Aufgabe 5:

Pseudo

for (i = 2; i * i <= N; i++) {
    if (isPrime[i] == 0) {
        for (j = i * i; j <= N; j += i) {
            isPrime[j] = 1;
        }
    }
}

Konzept:
1. Erstelle eine Liste von Zahlen von 2 bis 1000.
2. Starte mit der ersten Zahl in der Liste (2).
3. Markiere alle Vielfachen dieser Zahl als nicht prim.
4. Gehe zur nächsten nicht markierten Zahl in der Liste.
5. Wiederhole die Schritte 3 und 4, bis du das Ende der Liste erreichst.

Von 2 bis 1000 sind es 999 Elemente, die wir mit 999*4 Bytes SPeicher reservieren.

.data
isPrime: .space 999          @ 999 Bytes für das Array =isPrime reserviert, da 2 bis 1000 999 Arrays entsprechen-

Nun die 1. For-Schleife beginnend mit Variable i = 2, bis i <= 1000, und wiederhole bei jedem Durchgang um +1 also i++

// Java-Schleife for (int i = 2; i <=1000; i++)

for1:
ldr r4, =isPrime       @Basis-Adresse von Array isPrime[]
mov r1, #2          @ Setze r1 auf 2 (der Startwert). i=2

until1:
mul r2, r1, r1
cmp r2, #1000       @ Prüfe: r1 * r1 = r2 <= 1000
bls do1                 @ springe zur do1 solange bis r2 kleiner als 1000
b endfor1                @ Wenn r2 > 1000, beende die Schleife

do1:
    add r3, r4, r1          @äussere Schleife in der do1-Anweisung. Addiert das Ergebnis ins Register r3 von dem Wert r1 mit dem Wert r4 des Array
    ldrb r5 [r3]            @Array-Zugriff. r4 = Startadresse im Arbeistspreicher und r1 ist der aktuelle Index i. Wir laden dieses eine Byte.
    cmp r5 #0               @Wenn r5 eine Primzahl bzw isPrimzahl[i] == 0
    bne do3                 @wenn r5 = 0, springe zur Schleife do3.

do2:                        @for (j = i * i; j <= 1000; j += i)
    mul r6, r1, r1          @start von j = i*i ins Register 6
    cmp r6, #1000          @prüfen ob j<= 1000
    bgt do3                 @ wenn j grösser 1000, dann zu do3-Schleife
    add r7, r4, r6          @innere Schleife in der do2-Anweisung. Addiert das Ergebnis ins Register r3 von dem Wert r6 mit dem Wert r4 des Array
    mov r7, #1
    strb r7 [r6]            
    add r6, r6, r1          @j = j+i
    b do2

do3:
add r1, r1 #1               @i++
b until1                    @zurück zur äußßeren Schleife.