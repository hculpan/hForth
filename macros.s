.ifndef   _TEXT_ROUTINES_S_

.define   _TEXT_ROUTINES_S_

.define   BLACK       0
.define   WHITE       1
.define   RED         2
.define   CYAN        3
.define   VIOLET      4
.define   GREEN       5
.define   BLUE        6
.define   YELLOW      7
.define   ORANGE      8
.define   BROWN       9
.define   LIGHTRED    10
.define   DARKGRAY    11
.define   GRAY        12
.define   LIGHTGREEN  13
.define   LIGHTBLUE   14
.define   LIGHTGRAY   15

.code

.macro CLRSCR
  jsr   $E55F
.endmacro

.macro WRTCHAR char
  lda char
  jsr $FFD2
.endmacro

.macro STROUT addr
  ldy   <addr
  lda   >addr
  jsr   $CB1E
.endmacro

.endif
