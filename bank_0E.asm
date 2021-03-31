.segment "BANK_0E"
.include "copy_bank_ram.inc"
.include "copy_bank_val.inc"



.segment "BANK_0E_ID"
    .byte con_prg_bank + $0E   ; 



