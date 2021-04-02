.segment "BANK_0E"
.include "copy_bank_ram.inc"
.include "copy_bank_val.inc"
; батарейка, используется лишь половина банка 8000-9FFF


                                        .byte "++++++++++++++++"
                                        .byte "  PRG-NVRAM by  "
                                        .byte " Cyneprepou4uk  "
                                        .byte "++++++++++++++++"



.segment "BANK_0E_ID"
                                        .byte con_prg_bank + $0E   ; BFFF



