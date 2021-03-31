.segment "BANK_0C"
.include "copy_bank_ram.inc"
.include "copy_bank_val.inc"



.segment "BANK_0C_ID"
    .byte con_prg_bank + $0C   ; 



