.segment "BANK_0A"
.include "copy_bank_ram.inc"
.include "copy_bank_val.inc"



.export _off000_screen_13
.export _off000_screen_14
.export _off000_screen_15
.export _off000_screen_1C
.export _off000_screen_1D
.export _off000_screen_1E
.export _off000_screen_1F
.export _off000_screen_20
.export _off000_screen_21
.export _off000_screen_22
.export _off000_screen_23
.export _off000_screen_24



_off000_screen_13:
    .incbin "incbin/screens/screen_13.bin" ; 

_off000_screen_14:
    .incbin "incbin/screens/screen_14.bin" ; 

_off000_screen_15:
    .incbin "incbin/screens/screen_15.bin" ; 

_off000_screen_1C:
    .incbin "incbin/screens/screen_1C.bin" ; 

_off000_screen_1D:
    .incbin "incbin/screens/screen_1D.bin" ; 

_off000_screen_1E:
    .incbin "incbin/screens/screen_1E.bin" ; 

_off000_screen_1F:
    .incbin "incbin/screens/screen_1F.bin" ; 

_off000_screen_20:
    .incbin "incbin/screens/screen_20.bin" ; 

_off000_screen_21:
    .incbin "incbin/screens/screen_21.bin" ; 

_off000_screen_22:
    .incbin "incbin/screens/screen_22.bin" ; 

_off000_screen_23:
    .incbin "incbin/screens/screen_23.bin" ; 

_off000_screen_24:
    .incbin "incbin/screens/screen_24.bin" ; 
