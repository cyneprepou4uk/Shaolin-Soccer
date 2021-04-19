.segment "BANK_0B"
.include "copy_bank_ram.inc"
.include "copy_bank_val.inc"



.export _off000_screen_30
;.export _off000_screen_31
;.export _off000_screen_32
;.export _off000_screen_33
;.export _off000_screen_34
;.export _off000_screen_35
;.export _off000_screen_36
.export _off000_screen_37
;.export _off000_screen_38
.export _off000_screen_39
;.export _off000_screen_3A
.export _off000_screen_3B
;.export _off000_screen_3C
.export _off000_screen_3D
.export _off000_screen_3E
;.export _off000_screen_3F


_off000_screen_30:
    .incbin "incbin/screens/screen_30.bin" ; 

;_off000_screen_31:
;    .incbin "incbin/screens/screen_31.bin" ; 

;_off000_screen_32:
;    .incbin "incbin/screens/screen_32.bin" ; 

;_off000_screen_33:
;    .incbin "incbin/screens/screen_33.bin" ; 

;_off000_screen_34:
;    .incbin "incbin/screens/screen_34.bin" ; 

;_off000_screen_35:
;    .incbin "incbin/screens/screen_35.bin" ; 

;_off000_screen_36:
;    .incbin "incbin/screens/screen_36.bin" ; 

_off000_screen_37:
    .incbin "incbin/screens/screen_37.bin" ; 

;_off000_screen_38:
;    .incbin "incbin/screens/screen_38.bin" ; 

_off000_screen_39:
    .incbin "incbin/screens/screen_39.bin" ; 

;_off000_screen_3A:
;    .incbin "incbin/screens/screen_3A.bin" ; 

_off000_screen_3B:
    .incbin "incbin/screens/screen_3B.bin" ; 

;_off000_screen_3C:
;    .incbin "incbin/screens/screen_3C.bin" ; 

_off000_screen_3D:
    .incbin "incbin/screens/screen_3D.bin" ; 

_off000_screen_3E:
    .incbin "incbin/screens/screen_3E.bin" ; 

;_off000_screen_3F:
;    .incbin "incbin/screens/screen_3F.bin" ; 
