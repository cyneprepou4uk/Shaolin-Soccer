.segment "BANK_0A"
.include "copy_bank_ram.inc"
.include "copy_bank_val.inc"



.segment "BANK_0A_ID"
                                        .byte con_prg_bank + $0A   ; 



