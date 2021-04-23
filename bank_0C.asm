.segment "BANK_0C"
.include "copy_bank_ram.inc"
.include "copy_bank_val.inc"



.export sub_0x000001_обновить_палитру_фона



sub_0x000001_обновить_палитру_фона:
                                        LDA ram_номер_палитры_фона
                                        BMI @bra_пропустить_1
                                        LDX #$00
                                        JSR sub_0004_обработать_палитру_фона
@bra_пропустить_1:
                                        LDA ram_номер_палитры_фона + 1
                                        BMI @bra_пропустить_2
                                        LDX #$01
                                        JSR sub_0004_обработать_палитру_фона
@bra_пропустить_2:
                                        RTS



sub_0004_обработать_палитру_фона:
                                        LDA ram_номер_палитры_фона,X
                                        ORA #$80
                                        STA ram_номер_палитры_фона,X
                                        ASL
                                        TAY
                                        LDA tbl_0004_палитра_фона,Y
                                        STA ram_000C
                                        LDA tbl_0004_палитра_фона + 1,Y
                                        STA ram_000D
                                        TXA
                                        ASL
                                        TAY
                                        LDA tbl_0004_индексы_палитры_фона,Y
                                        STA ram_00F8
                                        LDA tbl_0004_индексы_палитры_фона + 1,Y
                                        STA ram_00F9
                                        LDA #$00
                                        STA ram_000E
@bra_цикл_чтения_и_записи_rgb:
                                        LDY ram_000E
                                        LDA (ram_00F8),Y
                                        TAX
                                        LDY #$00
                                        LDA (ram_000C),Y
                                        STA ram_color_R,X
                                        INY
                                        LDA (ram_000C),Y
                                        STA ram_color_G,X
                                        INY
                                        LDA (ram_000C),Y
                                        STA ram_color_B,X
                                        LDA ram_000C
                                        CLC
                                        ADC #$03
                                        STA ram_000C
                                        BCC @bra_not_overflow
                                        INC ram_000D
@bra_not_overflow:
                                        INC ram_000E
                                        LDA ram_000E
                                        CMP #$20
                                        BNE @bra_цикл_чтения_и_записи_rgb
                                        LDA ram_pal_buffer
                                        TAX
                                        CLC
                                        ADC #$20
                                        STA ram_pal_buffer
                                        LDY #$00
@bra_цикл_записи_в_буфер:
                                        LDA (ram_00F8),Y
                                        STA ram_pal_buffer + 1,X
                                        INX
                                        INY
                                        CPY #$20
                                        BNE @bra_цикл_записи_в_буфер
                                        RTS
                                        
                                        
                                        
tbl_0004_индексы_палитры_фона:
                                        .word _off002_палитра_00
                                        .word _off002_палитра_01

_off002_палитра_00:
    .incbin "incbin/3F00_3FFF.bin", $00, $20    ; 3F00-3F1F

_off002_палитра_01:
    .incbin "incbin/3F00_3FFF.bin", $20, $20    ; 3F20-3F3F



tbl_0004_палитра_фона:
                                        .word _off001_палитра_фона_00
                                        .word _off001_палитра_фона_01
                                        .word _off001_палитра_фона_02
                                        .word _off001_палитра_фона_03
                                        .word _off001_палитра_фона_04
                                        .word _off001_палитра_фона_05
                                        .word _off001_палитра_фона_06
                                        .word _off001_палитра_фона_07
                                        .word _off001_палитра_фона_08
                                        .word _off001_палитра_фона_09
                                        .word _off001_палитра_фона_0A
                                        .word _off001_палитра_фона_0B
                                        .word _off001_палитра_фона_0C
                                        .word _off001_палитра_фона_0D
                                        .word _off001_палитра_фона_0E
                                        .word _off001_палитра_фона_0F
                                        .word _off001_палитра_фона_10
                                        .word _off001_палитра_фона_11
                                        .word _off001_палитра_фона_12
                                        .word _off001_палитра_фона_13
                                        .word _off001_палитра_фона_14
                                        .word _off001_палитра_фона_15
                                        .word _off001_палитра_фона_16
                                        .word _off001_палитра_фона_17
                                        .word _off001_палитра_фона_18
                                        .word _off001_палитра_фона_19
                                        .word _off001_палитра_фона_1A
                                        .word _off001_палитра_фона_1B
                                        .word _off001_палитра_фона_1C
                                        .word _off001_палитра_фона_1D
                                        .word _off001_палитра_фона_1E
                                        .word _off001_палитра_фона_1F


_off001_палитра_фона_00:
    .incbin "incbin/palette/background/00.bin"  ; 

_off001_палитра_фона_01:
    .incbin "incbin/palette/background/01.bin"  ; 

_off001_палитра_фона_02:
    .incbin "incbin/palette/background/02.bin"  ; 

_off001_палитра_фона_03:
    .incbin "incbin/palette/background/03.bin"  ; 

_off001_палитра_фона_04:
    .incbin "incbin/palette/background/04.bin"  ; 

_off001_палитра_фона_05:
    .incbin "incbin/palette/background/05.bin"  ; 

_off001_палитра_фона_06:
    .incbin "incbin/palette/background/06.bin"  ; 

_off001_палитра_фона_07:
    .incbin "incbin/palette/background/07.bin"  ; 

_off001_палитра_фона_08:
    .incbin "incbin/palette/background/08.bin"  ; 

_off001_палитра_фона_09:
    .incbin "incbin/palette/background/09.bin"  ; 

_off001_палитра_фона_0A:
    .incbin "incbin/palette/background/0A.bin"  ; 

_off001_палитра_фона_0B:
    .incbin "incbin/palette/background/0B.bin"  ; 

_off001_палитра_фона_0C:
    .incbin "incbin/palette/background/0C.bin"  ; 

_off001_палитра_фона_0D:
    .incbin "incbin/palette/background/0D.bin"  ; 

_off001_палитра_фона_0E:
    .incbin "incbin/palette/background/0E.bin"  ; 

_off001_палитра_фона_0F:
    .incbin "incbin/palette/background/0F.bin"  ; 

_off001_палитра_фона_10:
    .incbin "incbin/palette/background/10.bin"  ; 

_off001_палитра_фона_11:
    .incbin "incbin/palette/background/11.bin"  ; 

_off001_палитра_фона_12:
    .incbin "incbin/palette/background/12.bin"  ; 

_off001_палитра_фона_13:
    .incbin "incbin/palette/background/13.bin"  ; 

_off001_палитра_фона_14:
    .incbin "incbin/palette/background/14.bin"  ; 

_off001_палитра_фона_15:
    .incbin "incbin/palette/background/15.bin"  ; 

_off001_палитра_фона_16:
    .incbin "incbin/palette/background/16.bin"  ; 

_off001_палитра_фона_17:
    .incbin "incbin/palette/background/17.bin"  ; 

_off001_палитра_фона_18:
    .incbin "incbin/palette/background/18.bin"  ; 

_off001_палитра_фона_19:
    .incbin "incbin/palette/background/19.bin"  ; 

_off001_палитра_фона_1A:
    .incbin "incbin/palette/background/1A.bin"  ; 

_off001_палитра_фона_1B:
    .incbin "incbin/palette/background/1B.bin"  ; 

_off001_палитра_фона_1C:
    .incbin "incbin/palette/background/1C.bin"  ; 

_off001_палитра_фона_1D:
    .incbin "incbin/palette/background/1D.bin"  ; 

_off001_палитра_фона_1E:
    .incbin "incbin/palette/background/1E.bin"  ; 

_off001_палитра_фона_1F:
    .incbin "incbin/palette/background/1F.bin"  ; 



.segment "BANK_0C_ID"
                                        .byte con_prg_bank + $0C   ; BFFF