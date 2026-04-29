Moin, Silke

    ldr     R0,=VariableA   ; Anw01 ; VariableA wurde im Speicher als Beef im Hexa Format definiter und wird in den Speicher R0 gespeichert.
    ldrb    R2,[R0]         ; Anw02 ; hier wird der 1. Byte des Speichers R0 (be) in den Speicher R2 geladen un gespeichert.
    ldrb    R3,[R0,#1]      ; Anw03 ; hier wird der 2. Byte des Speichers R0 (ef) in den Speicher R2 geladen un gespeichert.
    lsl     R2, #8          ; Anw04 ; hier werden die Nullen um 8 Bit = 2 Byte nach links verschoben.
    orr     R2, R3          ; Anw05 ; hier werden durch dir Funktion orr R2 und R3 zusammengeführt und kombiniert.
    strh    R2,[R0]         ; Anw06 ; hier wird das Ergebnis des o.g. Operations in den Speicher R2 gespeichert.