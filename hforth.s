.segment "ZPSAVE"
.segment "STARTUP"

.include "macros.s"

.data
MSG1:   .byte   $48,$46,$00

.code

    CLRSCR
;    STROUT MSG1
    ldy   >(MSG1)
    lda   <(MSG1)
    jsr   $CB1E

    rts
