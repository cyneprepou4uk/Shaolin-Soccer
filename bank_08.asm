.segment "BANK_08"
.include "copy_bank_ram.inc"
.include "copy_bank_val.inc"



.export _off000_screen_05
.export _off000_screen_07
.export _off000_screen_10
.export _off000_screen_11
.export _off000_screen_12



_off000_screen_05:
    .incbin "incbin/screens/screen_05.bin" ; 

_off000_screen_07:
    .incbin "incbin/screens/screen_07.bin" ; 

_off000_screen_10:
    .incbin "incbin/screens/screen_10.bin" ; 

_off000_screen_11:
    .incbin "incbin/screens/screen_11.bin" ; 

_off000_screen_12:
    .incbin "incbin/screens/screen_12.bin" ; 
