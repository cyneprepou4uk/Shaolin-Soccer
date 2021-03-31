.segment "BANK_08"
.include "copy_bank_ram.inc"
.include "copy_bank_val.inc"



.segment "BANK_08_ID"
    .byte con_prg_bank + $08   ; 



