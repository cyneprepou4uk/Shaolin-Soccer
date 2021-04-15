.segment "BANK_08"
.include "copy_bank_ram.inc"
.include "copy_bank_val.inc"



.export _off000_screen_05
.export _off000_screen_07
.export _off000_screen_16
.export _off000_screen_17
.export _off000_screen_18
.export _off000_screen_19
.export _off000_screen_1A
.export _off000_screen_1B



_off000_screen_05:
    .incbin "incbin/screens/screen_05.bin" ; 

_off000_screen_07:
    .incbin "incbin/screens/screen_07.bin" ; 

_off000_screen_16:
    .incbin "incbin/screens/screen_16.bin" ; 

_off000_screen_17:
    .incbin "incbin/screens/screen_17.bin" ; 

_off000_screen_18:
    .incbin "incbin/screens/screen_18.bin" ; 

_off000_screen_19:
    .incbin "incbin/screens/screen_19.bin" ; 

_off000_screen_1A:
    .incbin "incbin/screens/screen_1A.bin" ; 

_off000_screen_1B:
    .incbin "incbin/screens/screen_1B.bin" ; 
