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
                                        STA ram_для_2000
                                        LDA #$06    ; отобразить фон и спрайты слева
                                        STA $2001
                                        STA ram_для_2001
                                        JSR sub_скопировать_на_батарейку
                                        JSR sub_0x01EE81_выключить_NMI
                                        JSR sub_0x01EF74_очистка_фона_и_спрайтов
                                        JSR sub_подготовка_палитры_vt03
                                        LDA #$00
                                        STA ram_pos_X_lo_скролл
                                        STA ram_pos_X_hi_скролл
                                        STA ram_pos_Y_lo_скролл
                                        STA ram_pos_Y_hi_скролл
                                        STA $4016
                                        LDA #$40
                                        STA $4017
                                        LDA #$0F
                                        STA $4015
                                        LDA #con_nmi_irq_вкл
                                        STA ram_флаг_nmi
                                        LDA #$00    ; vertical mirroring
                                        STA $A000
                                        LDX ram_счетчик_кадров
                                        LDA ram_0700,X
                                        ORA #$25
                                        STA ram_рандом
                                        LDA ram_0701,X
                                        ORA #$25
                                        STA ram_рандом + 1
                                        JSR sub_0x01EF64_убрать_полоску_слева_на_экране
                                        JSR sub_0x01EF1A_очистить_0057_00F8
                                        JSR sub_очистка_страниц_оперативки
                                        LDA #$88
                                        STA ram_для_2000
                                        STA $2000
                                        LDA #$18
                                        STA ram_для_2001
                                        STA $2001
                                        LDA #$FF
                                        STA ram_байт_2006_hi_атрибуты
                                        STA ram_байт_2006_hi_графика
                                        STA ram_байт_2006_hi_палитра
                                        STA ram_флаг_гола
                                        STA ram_раунд_плей_офф
                                        LDA #con_bg_pal + $42
                                        STA ram_номер_палитры_фона
                                        STA ram_номер_палитры_фона + 1
                                        LDA #con_spr_pal + $00
                                        STA ram_номер_палитры_спрайтов
                                        STA ram_номер_палитры_спрайтов + 1
                                        STA ram_номер_палитры_спрайтов + 2
                                        STA ram_номер_палитры_спрайтов + 3
                                        JSR sub_0x01D046
                                        LDA #> $22E3
                                        STA ram_0607__2006_hi
                                        STA ram_0610__2006_hi
                                        LDA #< $22E3
                                        STA ram_0608__2006_lo
                                        STA ram_060F__2006_lo
                                        LDA #$F8    ; закрыть буфер
                                        STA ram_буфер_имени_игрока + 4
                                        STA ram_0617_буфер + 5
                                        LDA #con_script_логотип
                                        STA ram_script
                                        LDA #con_subscr_logo_подг_экр_лого
                                        STA ram_subscript
                                        STA $E000
                                        LDA #$00
                                        STA ram_btn_press + 2   ; bzk оно надо?
                                        LDA #$F0
                                        STA ram_ограничитель_Y_спрайтов
                                        LDA #$F2    ; DMA
                                        STA ram_DMA_xx_RTS
                                        LDA #$60    ; RTS
                                        STA ram_DMA_xx_RTS + 2
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
@bra_цикл_копирования_на_батарейку:
                                        LDA (ram_0000),Y
                                        STA (ram_0002),Y
                                        INY
                                        BNE @bra_цикл_копирования_на_батарейку
                                        INC ram_0001
                                        INC ram_0003
                                        DEX
                                        BNE @bra_цикл_копирования_на_батарейку
                                        RTS
                                        
                                        
                                        
sub_подготовка_палитры_vt03:
                                        BIT $2002
                                        LDA #> $3F00
                                        STA $2006
                                        LDA #< $3F00
                                        STA $2006
                                        LDX #$00    ; запись в диапазон 3F00-3FFF
@bra_цикл_записи_индексов_палитры:
                                        LDA tbl_0000_номера_палитры,X
                                        STA $2007
                                        INX
                                        BNE @bra_цикл_записи_индексов_палитры
                                        LDA #< tbl_0000_начальная_палитра
                                        STA ram_000C
                                        LDA #> tbl_0000_начальная_палитра
                                        STA ram_000D
                                        LDX #$00
@bra_цикл_записи_rgb:
                                        ;STX $401B
                                        LDY #$00
                                        LDA (ram_000C),Y
                                        STA ram_color_R,X
                                        ;STA $401B
                                        INY
                                        LDA (ram_000C),Y
                                        STA ram_color_G,X
                                        ;STA $401B
                                        INY
                                        LDA (ram_000C),Y
                                        STA ram_color_B,X
                                        ;STA $401B
                                        LDA ram_000C
                                        CLC
                                        ADC #$03
                                        STA ram_000C
                                        BCC @bra_not_overflow
                                        INC ram_000D
@bra_not_overflow:
                                        INX
                                        BNE @bra_цикл_записи_rgb
                                        RTS

tbl_0000_номера_палитры:
    .incbin "incbin/3F00_3FFF.bin"

tbl_0000_начальная_палитра:
    .incbin "incbin/default_RGB.bin"



sub_очистка_страниц_оперативки:
                                        LDA #$07
                                        STA ram_000D
                                        LDA #$00
                                        STA ram_000C
                                        TAY
                                        LDX #$FA
@bra_очистка_0200_07FF:
                                        STA (ram_000C),Y
                                        INY
                                        BNE @bra_очистка_0200_07FF
                                        DEC ram_000D
                                        INX
                                        BNE @bra_очистка_0200_07FF
                                        LDX #$7F
@bra_очистка_0100_017F:
                                        STA ram_0100,X
                                        DEX
                                        BPL @bra_очистка_0100_017F
                                        RTS



.segment "BANK_07_ID"
                                        .byte con_prg_bank + $07   ; BFFF



