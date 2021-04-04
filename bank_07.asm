.segment "BANK_07_sram"
.include "copy_bank_ram.inc"
.include "copy_bank_val.inc"
; батарейка 8000-9FFF
; инициализация ресета A000-BFFF



.export sub_0x000000_RESET_init



                                        .byte "++++++++++++++++"
                                        .byte "  PRG-NVRAM by  "
                                        .byte " Cyneprepou4uk  "
                                        .byte "++++++++++++++++"



.segment "BANK_07_A000"

sub_0x000000_RESET_init:
                                        LDA #$08    ; спрайты в 1000-1FFF, выключить NMI
                                        STA $2000
                                        STA ram_for_2000
                                        LDA #$06    ; отобразить фон и спрайты слева
                                        STA $2001
                                        STA ram_for_2001
                                        JSR sub_скопировать_на_батарейку
                                        JSR sub_0x01EE81_disable_NMI
                                        JSR sub_0x01EF74_очистка_фона_и_спрайтов
;                                        JSR sub_подготовка_палитры_vt03
                                        LDA #$00
                                        STA ram_pos_X_lo_scroll
                                        STA ram_pos_X_hi_scroll
                                        STA ram_pos_Y_lo_scroll
                                        STA ram_pos_Y_hi_scroll
                                        STA $4016
                                        LDA #$40
                                        STA $4017
                                        LDA #$0F
                                        STA $4015
                                        LDA #con_nmi_irq_вкл
                                        STA ram_NMI_flag
                                        LDA #$00    ; vertical mirroring
                                        STA $A000
                                        LDX ram_frame_cnt
                                        LDA ram_0700,X
                                        ORA #$25
                                        STA ram_random
                                        LDA ram_0701,X
                                        ORA #$25
                                        STA ram_random + 1
                                        JSR sub_0x01EF64_убрать_полоску_слева_на_экране
                                        JSR sub_0x01EF1A_clear_0057_00F8
                                        JSR sub_очистка_страниц_оперативки
                                        LDA #$8C
                                        STA ram_for_2000
                                        STA $2000
                                        LDA #$18
                                        STA ram_for_2001
                                        STA $2001
                                        LDA #$FF
                                        STA ram_байт_2006_hi_атрибуты
                                        STA ram_байт_2006_hi_графика
                                        STA ram_байт_2006_hi_палитра
                                        STA ram_флаг_гола
                                        STA ram_054A
                                        LDA #$42
                                        STA ram_palette_id_bg
                                        STA ram_palette_id_bg + 1
                                        LDA #$00
                                        STA ram_palette_id_spr
                                        STA ram_palette_id_spr + 1
                                        STA ram_palette_id_spr + 2
                                        STA ram_palette_id_spr + 3
                                        JSR sub_0x01D046
                                        LDA #$22
                                        STA ram_0607
                                        STA ram_0610
                                        LDA #$E3
                                        STA ram_0608
                                        STA ram_060F
                                        LDA #$F8
                                        STA ram_0615
                                        STA ram_061C
                                        LDA #con_script_логотип
                                        STA ram_script
                                        LDA #$00
                                        STA ram_subscript
                                        STA $E000
                                        LDA #$00
                                        STA ram_btn_press + 2   ; bzk оно надо?
                                        LDA #$F0
                                        STA ram_limit_spr_Y
                                        LDA #$01
                                        STA ram_скорость_игры
                                        RTS
                                        
                                        
                                        
sub_скопировать_на_батарейку:
                                        LDA #$80    ; разрешение записи в батарейку
                                        STA $A001
                                        LDY #$00    ; младший байт адреса чтения и записи, Y = 00 будет использован
                                        STY ram_0000
                                        STY ram_0002
                                        LDA #$80    ; начало чтения с 8000 из банка
                                        STA ram_0001
                                        LDA #$60    ; начало записи в 6000 на батарейку
                                        STA ram_0003
                                        LDX #$20    ; скопировать 32 страницы
@цикл_копирования_на_батарейку:
                                        LDA (ram_0000),Y
                                        STA (ram_0002),Y
                                        INY
                                        BNE @цикл_копирования_на_батарейку
                                        INC ram_0001
                                        INC ram_0003
                                        DEX
                                        BNE @цикл_копирования_на_батарейку
                                        RTS
                                        
                                        
                                        
sub_подготовка_палитры_vt03:
                                        BIT $2002
                                        LDA #> $3F00
                                        STA $2006
                                        LDA #< $3F00
                                        STA $2006
                                        LDX #$00    ; запись 00-FF в палитру 3F00-3FFF
@цикл_записи_индексов_палитры:
                                        STX $2007
                                        INX
                                        BNE @цикл_записи_индексов_палитры
                                        RTS



sub_очистка_страниц_оперативки:
                                        LDA #$07
                                        STA ram_000D
                                        LDA #$00
                                        STA ram_000C
                                        TAY
                                        LDX #$FA
@очистка_0200_07FF:
                                        STA (ram_000C),Y
                                        INY
                                        BNE @очистка_0200_07FF
                                        DEC ram_000D
                                        INX
                                        BNE @очистка_0200_07FF
                                        LDX #$7F
@очистка_0100_017F:
                                        STA ram_0100,X
                                        DEX
                                        BPL @очистка_0100_017F
                                        RTS



.segment "BANK_07_ID"
                                        .byte con_prg_bank + $07   ; BFFF



