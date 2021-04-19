.segment "BANK_09"
.include "copy_bank_ram.inc"
.include "copy_bank_val.inc"



.export _off000_screen_00
.export _off000_screen_01
.export _off000_screen_02
.export _off000_screen_03
.export _off000_screen_04
.export _off000_screen_06
.export _off000_screen_08
.export _off000_screen_09
.export _off000_screen_0A
.export _off000_screen_0B
.export _off000_screen_0C
.export _off000_screen_0D
.export _off000_screen_0E
.export _off000_screen_0F



_off000_screen_00:
    .incbin "incbin/screens/screen_00.bin" ; 

_off000_screen_01:
    .incbin "incbin/screens/screen_01.bin" ; 

_off000_screen_02:
    .incbin "incbin/screens/screen_02.bin" ; 

_off000_screen_03:
    .incbin "incbin/screens/screen_03.bin" ; 

_off000_screen_04:
    .incbin "incbin/screens/screen_04.bin" ; 

_off000_screen_06:
    .incbin "incbin/screens/screen_06.bin" ; 

_off000_screen_08:
    .incbin "incbin/screens/screen_08.bin" ; 

_off000_screen_09:
    .incbin "incbin/screens/screen_09.bin" ; 

_off000_screen_0A:
    .incbin "incbin/screens/screen_0A.bin" ; 

_off000_screen_0B:
    .incbin "incbin/screens/screen_0B.bin" ; 

_off000_screen_0C:
    .incbin "incbin/screens/screen_0C.bin" ; 

_off000_screen_0D:
    .incbin "incbin/screens/screen_0D.bin" ; 

_off000_screen_0E:
    .incbin "incbin/screens/screen_0E.bin" ; 

_off000_screen_0F:
    .incbin "incbin/screens/screen_0F.bin" ; 
