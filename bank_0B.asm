.segment "BANK_0B"
.include "copy_bank_ram.inc"
.include "copy_bank_val.inc"



.segment "BANK_0B_ID"
                                        .byte con_prg_bank + $0B   ; 



