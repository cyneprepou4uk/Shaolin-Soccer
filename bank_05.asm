.segment "BANK_05"
.include "copy_bank_ram.inc"
.include "copy_bank_val.inc"
; 0x014010-0x01800F



.export loc_0x014010_menu_script
.export loc_0x014013
.export loc_0x014016
.export loc_0x014019
.export loc_0x01401C



; не перемещать начальные прыжки, они должны быть в пределах 8000-80FF
loc_0x014010_menu_script:
C D 0 J - - 0x014010 05:8000: 4C 55 80  JMP loc_8055_menu_script

loc_0x014013:
C - - J - - 0x014013 05:8003: 4C 38 BD  JMP loc_BD38_рожи

loc_0x014016:
C - - J - - 0x014016 05:8006: 4C B0 BD  JMP loc_BDB0

loc_0x014019:
C - - J - - 0x014019 05:8009: 4C 47 BB  JMP loc_BB47

loc_0x01401C:
C - - J - - 0x01401C 05:800C: 4C 84 BB  JMP loc_BB84



loc_8055_menu_script: ;  а инфа?
C D 0 - - - 0x014065 05:8055: A5 59     LDA ram_subscript
C - - - - - 0x014067 05:8057: 20 53 C0  JSR sub_0x01EC9F_jump_to_pointers_after_JSR
- D 0 - I - 0x01406A 05:805A: 83 80     .word ofs_8083_00_переход_от_скрипта_логотипа_к_скрипту_меню
- D 0 - I - 0x01406C 05:805C: 8B 80     .word ofs_808B_01_главное_меню
- D 0 - I - 0x01406E 05:805E: 91 80     .word ofs_8091_02_выбор_соперника_на_прохождение
- D 0 - I - 0x014070 05:8060: 97 80     .word ofs_8097_03_экран_VS
- D 0 - I - 0x014072 05:8062: 9D 80     .word ofs_809D_04_раздевалка
- D 0 - I - 0x014074 05:8064: A3 80     .word ofs_80A3_05_выбор_команд
- D 0 - I - 0x014076 05:8066: A9 80     .word ofs_80A9_06_выбор_погоды
- D 0 - I - 0x014078 05:8068: AF 80     .word ofs_80AF_07_расстановка
- D 0 - I - 0x01407A 05:806A: B5 80     .word ofs_80B5_08_прогноз_погоды
- D 0 - I - 0x01407C 05:806C: BB 80     .word ofs_80BB_09_турнирная_таблица
- D 0 - I - 0x01407E 05:806E: C1 80     .word ofs_80C1_0A_параметры_игрока_японии
- D 0 - I - 0x014080 05:8070: C7 80     .word ofs_80C7_0B_выбор_музыки
- - - - - - 0x014082 05:8072: CD 80     .word ofs_80CD_0C
- D 0 - I - 0x014084 05:8074: CD 80     .word ofs_80CD_0D_весь_состав_японии
- D 0 - I - 0x014086 05:8076: D3 80     .word ofs_80D3_0E
- - - - - - 0x014088 05:8078: D9 80     .word ofs_80D9_0F



ofs_8083_00_переход_от_скрипта_логотипа_к_скрипту_меню:
C - - J - - 0x014093 05:8083: A9 01     LDA #$01
C - - - - - 0x014095 05:8085: 8D 59 00  STA ram_subscript
C - - - - - 0x014098 05:8088: 4C 7A 80  RTS



ofs_80BB_09_турнирная_таблица:
C - - J - - 0x0140CB 05:80BB: 20 93 88  JSR sub_8893
C - - - - - 0x0140CE 05:80BE: 4C 7A 80  RTS



ofs_80C1_0A_параметры_игрока_японии:
C - - J - - 0x0140D1 05:80C1: 20 81 A2  JSR sub_A281
C - - - - - 0x0140D4 05:80C4: 4C 7A 80  RTS



ofs_80C7_0B_выбор_музыки:
C - - J - - 0x0140D7 05:80C7: 20 76 A5  JSR sub_A576_экран_выбора_музыки
C - - - - - 0x0140DA 05:80CA: 4C 7A 80  RTS



ofs_80CD_0C:
ofs_80CD_0D_весь_состав_японии:
C - - J - - 0x0140DD 05:80CD: 20 78 A7  JSR sub_A778
C - - - - - 0x0140E0 05:80D0: 4C 7A 80  RTS



ofs_80D3_0E:
C - - J - - 0x0140E3 05:80D3: 20 B2 B2  JSR sub_B2B2
C - - - - - 0x0140E6 05:80D6: 4C 7A 80  RTS



ofs_80D9_0F:
- - - - - - 0x0140E9 05:80D9: 20 7C B4  JSR sub_B47C
- - - - - - 0x0140EC 05:80DC: 4C 7A 80  RTS



sub_80DF:
C - - - - - 0x0140EF 05:80DF: A9 80     LDA #con_nmi_disable_irq
C - - - - - 0x0140F1 05:80E1: 85 4F     STA ram_NMI_flag
C - - - - - 0x0140F3 05:80E3: A9 00     LDA #$00
C - - - - - 0x0140F5 05:80E5: 8D EC 00  STA ram_pos_X_lo_scroll     ; bzk опт, общая подпрограмма очистки скролла, найти остальные места
C - - - - - 0x0140F8 05:80E8: 8D ED 00  STA ram_pos_X_hi_scroll
C - - - - - 0x0140FB 05:80EB: 8D EE 00  STA ram_pos_Y_lo_scroll
C - - - - - 0x0140FE 05:80EE: 8D EF 00  STA ram_pos_Y_hi_scroll
C - - - - - 0x014101 05:80F1: 8D F0 00  STA ram_pos_X_lo_camera
C - - - - - 0x014104 05:80F4: 8D F1 00  STA ram_pos_X_hi_camera
C - - - - - 0x014107 05:80F7: 8D F2 00  STA ram_pos_Y_lo_camera
C - - - - - 0x01410A 05:80FA: 8D F3 00  STA ram_pos_Y_hi_camera
C - - - - - 0x01410D 05:80FD: 8D E6 05  STA ram_скорость_игры
C - - - - - 0x014110 05:8100: 8D C9 05  STA ram_счетчик_опций
C - - - - - 0x014113 05:8103: 8D CE 05  STA ram_05CE
C - - - - - 0x014116 05:8106: A9 F0     LDA #$F0
C - - - - - 0x014118 05:8108: 8D 56 00  STA ram_limit_spr_Y
C - - - - - 0x01411B 05:810B: AC 59 00  LDY ram_subscript
C - - - - - 0x01411E 05:810E: B9 6E 81  LDA tbl_816E_экраны,Y
C - - - - - 0x014121 05:8111: 30 5A     BMI bra_816D_RTS
C - - - - - 0x014123 05:8113: 20 68 C0  JSR sub_0x01E838_отрисовать_статичный_экран
C - - - - - 0x014126 05:8116: 20 62 C0  JSR sub_0x01EF64_убрать_полоску_слева_на_экране
C - - - - - 0x014129 05:8119: 20 59 C0  JSR sub_0x01D05F
C - - - - - 0x01412C 05:811C: A2 0C     LDX #$0C
bra_811E_loop:
C - - - - - 0x01412E 05:811E: A9 00     LDA #$00
C - - - - - 0x014130 05:8120: 9D 59 04  STA ram_movement_id_player,X
C - - - - - 0x014133 05:8123: 9D 86 04  STA ram_игрок_состояние,X
C - - - - - 0x014136 05:8126: 9D A3 04  STA ram_направление_движения,X
C - - - - - 0x014139 05:8129: 9D B0 04  STA ram_смена_угла_движения,X
C - - - - - 0x01413C 05:812C: 9D E8 03  STA ram_spd_X_lo_player,X
C - - - - - 0x01413F 05:812F: 9D F6 03  STA ram_spd_X_hi_player,X
C - - - - - 0x014142 05:8132: 9D 04 04  STA ram_spd_Y_lo_player,X
C - - - - - 0x014145 05:8135: 9D 12 04  STA ram_spd_Y_hi_player,X
C - - - - - 0x014148 05:8138: 9D 20 04  STA ram_spd_Z_lo_player,X
C - - - - - 0x01414B 05:813B: 9D 2E 04  STA ram_spd_Z_hi_player,X
C - - - - - 0x01414E 05:813E: 9D 01 03  STA ram_pos_X_sub_player,X
C - - - - - 0x014151 05:8141: 9D 14 03  STA ram_pos_X_lo_player,X
C - - - - - 0x014154 05:8144: 9D 27 03  STA ram_pos_X_hi_player,X
C - - - - - 0x014157 05:8147: 9D 3A 03  STA ram_pos_Y_sub_player,X
C - - - - - 0x01415A 05:814A: 9D 4D 03  STA ram_pos_Y_lo_player,X
C - - - - - 0x01415D 05:814D: 9D 60 03  STA ram_pos_Y_hi_player,X
C - - - - - 0x014160 05:8150: 9D 73 03  STA ram_pos_Z_sub_player,X
C - - - - - 0x014163 05:8153: 9D 86 03  STA ram_pos_Z_lo_player,X
C - - - - - 0x014166 05:8156: 9D 99 03  STA ram_pos_Z_hi_player,X
C - - - - - 0x014169 05:8159: 9D 4A 04  STA ram_gravity_hi_player,X
C - - - - - 0x01416C 05:815C: 9D 3C 04  STA ram_gravity_lo_player,X
C - - - - - 0x01416F 05:815F: A9 FF     LDA #$FF
C - - - - - 0x014171 05:8161: 9D 79 04  STA ram_action_id_player,X
C - - - - - 0x014174 05:8164: CA        DEX
C - - - - - 0x014175 05:8165: 10 B7     BPL bra_811E_loop
C - - - - - 0x014177 05:8167: A5 59     LDA ram_subscript
C - - - - - 0x014179 05:8169: 09 80     ORA #$80
C - - - - - 0x01417B 05:816B: 85 59     STA ram_subscript
bra_816D_RTS:
C - - - - - 0x01417D 05:816D: 60        RTS



tbl_816E_экраны:
- - - - - - 0x01417E 05:816E: FF        .byte $FF   ; 
- D 0 - - - 0x01417F 05:816F: 02        .byte $02   ; главное меню
- D 0 - - - 0x014180 05:8170: 03        .byte $03   ; выбор из таблицы команды на матч в режиме прохождения
- D 0 - - - 0x014181 05:8171: 0B        .byte $0B   ; экран VS
- D 0 - - - 0x014182 05:8172: 04        .byte $04   ; экран раздевалки со всеми опциями
- D 0 - - - 0x014183 05:8173: 06        .byte $06   ; экран с выбором команд
- D 0 - - - 0x014184 05:8174: 07        .byte $07   ; экран с выбором погоды
- D 0 - - - 0x014185 05:8175: 05        .byte $05   ; экран с расстановкой
- D 0 - - - 0x014186 05:8176: 08        .byte $08   ; экран с информацией о погоде
- D 0 - - - 0x014187 05:8177: 0D        .byte $0D   ; экран со статистикой против 12 команд, вход через раздевалку
- D 0 - - - 0x014188 05:8178: 0C        .byte $0C   ; экран с хатарактеристиками выбранного японца
- D 0 - - - 0x014189 05:8179: 09        .byte $09   ; экран с выбором музыки
- - - - - - 0x01418A 05:817A: 0F        .byte $0F   ; хз, предположительно какой-то экран раздевалки
- D 0 - - - 0x01418B 05:817B: 0A        .byte $0A   ; экран со всеми 12 игроками японии, можно с ними побазарить
- - - - - - 0x01418C 05:817C: 14        .byte $14   ; 
- - - - - - 0x01418D 05:817D: 15        .byte $15   ; турнирная сетка



sub_817E_конвертация_нажатых_кнопок_в_индекс:
C - - - - - 0x01418E 05:817E: A5 08     LDA ram_btn_press
C - - - - - 0x014190 05:8180: 29 30     AND #con_btns_SS
C - - - - - 0x014192 05:8182: F0 0E     BEQ bra_8192_not_Start_or_Select
C - - - - - 0x014194 05:8184: 29 10     AND #con_btn_Start
C - - - - - 0x014196 05:8186: F0 05     BEQ bra_818D_it_is_Select
C - - - - - 0x014198 05:8188: A9 01     LDA #$01    ; Start
C - - - - - 0x01419A 05:818A: 4C CF 81  BNE bra_81CF_запись_кнопки
bra_818D_it_is_Select:
- - - - - - 0x01419D 05:818D: A9 02     LDA #$02    ; Select
- - - - - - 0x01419F 05:818F: 4C CF 81  BNE bra_81CF_запись_кнопки
bra_8192_not_Start_or_Select:
C - - - - - 0x0141A2 05:8192: AC CC 05  LDY ram_счетчик_смен
C - - - - - 0x0141A5 05:8195: B9 08 00  LDA ram_btn_press,Y
C - - - - - 0x0141A8 05:8198: 30 06     BMI bra_81A0_pressed_A
C - - - - - 0x0141AA 05:819A: 0A        ASL
C - - - - - 0x0141AB 05:819B: 30 08     BMI bra_81A5_pressed_B
C - - - - - 0x0141AD 05:819D: 4C AA 81  JMP loc_81AA_not_A_or_B
bra_81A0_pressed_A:
C - - - - - 0x0141B0 05:81A0: A9 03     LDA #$03    ; A
C - - - - - 0x0141B2 05:81A2: 4C CF 81  BNE bra_81CF_запись_кнопки
bra_81A5_pressed_B:
C - - - - - 0x0141B5 05:81A5: A9 04     LDA #$04    ; B
C - - - - - 0x0141B7 05:81A7: 4C CF 81  BNE bra_81CF_запись_кнопки
loc_81AA_not_A_or_B:
C D 0 - - - 0x0141BA 05:81AA: B9 08 00  LDA ram_btn_press,Y
C - - - - - 0x0141BD 05:81AD: 4A        LSR
C - - - - - 0x0141BE 05:81AE: B0 1D     BCS bra_81CD_pressed_Right
C - - - - - 0x0141C0 05:81B0: 4A        LSR
C - - - - - 0x0141C1 05:81B1: B0 15     BCS bra_81C8_pressed_Left
C - - - - - 0x0141C3 05:81B3: 4A        LSR
C - - - - - 0x0141C4 05:81B4: B0 0D     BCS bra_81C3_pressed_Down
C - - - - - 0x0141C6 05:81B6: 4A        LSR
C - - - - - 0x0141C7 05:81B7: B0 05     BCS bra_81BE_pressed_Up
C - - - - - 0x0141C9 05:81B9: A9 00     LDA #$00
C - - - - - 0x0141CB 05:81BB: 4C CF 81  BEQ bra_81CF_запись_кнопки
bra_81BE_pressed_Up:
C - - - - - 0x0141CE 05:81BE: A9 05     LDA #$05    ; Up
C - - - - - 0x0141D0 05:81C0: 4C CF 81  BNE bra_81CF_запись_кнопки
bra_81C3_pressed_Down:
C - - - - - 0x0141D3 05:81C3: A9 06     LDA #$06    ; Down
C - - - - - 0x0141D5 05:81C5: 4C CF 81  BNE bra_81CF_запись_кнопки
bra_81C8_pressed_Left:
C - - - - - 0x0141D8 05:81C8: A9 07     LDA #$07    ; Left
C - - - - - 0x0141DA 05:81CA: 4C CF 81  BNE bra_81CF_запись_кнопки
bra_81CD_pressed_Right:
C - - - - - 0x0141DD 05:81CD: A9 08     LDA #$08    ; Right
bra_81CF_запись_кнопки:
C D 0 - - - 0x0141DF 05:81CF: 8D CD 05  STA ram_btn_menu
C - - - - - 0x0141E2 05:81D2: 60        RTS



sub_81D3_конвертация_индексов_Dpad_в_05:
; нужно если выбор подпрограммы не зависит от нажатия стороны
C - - - - - 0x0141E3 05:81D3: AD CD 05  LDA ram_btn_menu
C - - - - - 0x0141E6 05:81D6: C9 05     CMP #$05
C - - - - - 0x0141E8 05:81D8: 90 02     BCC bra_81DC_RTS
C - - - - - 0x0141EA 05:81DA: A9 05     LDA #$05
bra_81DC_RTS:
C - - - - - 0x0141EC 05:81DC: 60        RTS



sub_81DD:
C - - - - - 0x0141ED 05:81DD: AD CD 05  LDA ram_btn_menu
C - - - - - 0x0141F0 05:81E0: C9 05     CMP #$05
C - - - - - 0x0141F2 05:81E2: 90 20     BCC bra_8204_RTS
C - - - - - 0x0141F4 05:81E4: 38        SEC
C - - - - - 0x0141F5 05:81E5: E9 05     SBC #$05
C - - - - - 0x0141F7 05:81E7: 85 1C     STA ram_001C
C - - - - - 0x0141F9 05:81E9: 8A        TXA
C - - - - - 0x0141FA 05:81EA: 29 01     AND #$01
C - - - - - 0x0141FC 05:81EC: A8        TAY
C - - - - - 0x0141FD 05:81ED: B9 CA 05  LDA ram_номер_опции,Y
C - - - - - 0x014200 05:81F0: 0A        ASL
C - - - - - 0x014201 05:81F1: 0A        ASL
C - - - - - 0x014202 05:81F2: 65 1C     ADC ram_001C
C - - - - - 0x014204 05:81F4: A8        TAY
C - - - - - 0x014205 05:81F5: B1 2E     LDA (ram_002E),Y
C - - - - - 0x014207 05:81F7: 85 1C     STA ram_001C
C - - - - - 0x014209 05:81F9: 8A        TXA
C - - - - - 0x01420A 05:81FA: 29 01     AND #$01
C - - - - - 0x01420C 05:81FC: A8        TAY
C - - - - - 0x01420D 05:81FD: A5 1C     LDA ram_001C
bra_81FF_infinite_loop:
C - - - - - 0x01420F 05:81FF: 30 FE     BMI bra_81FF_infinite_loop
C - - - - - 0x014211 05:8201: 99 CA 05  STA ram_номер_опции,Y
bra_8204_RTS:
C - - - - - 0x014214 05:8204: 60        RTS



sub_8205_read_pointers_after_JSR:
C - - - - - 0x014215 05:8205: AD C9 05  LDA ram_счетчик_опций
C - - - - - 0x014218 05:8208: 0A        ASL
C - - - - - 0x014219 05:8209: 0A        ASL
C - - - - - 0x01421A 05:820A: A8        TAY
C - - - - - 0x01421B 05:820B: 18        CLC
C - - - - - 0x01421C 05:820C: 68        PLA
C - - - - - 0x01421D 05:820D: 69 01     ADC #$01
C - - - - - 0x01421F 05:820F: 85 30     STA ram_0030
C - - - - - 0x014221 05:8211: 68        PLA
C - - - - - 0x014222 05:8212: 69 00     ADC #$00
C - - - - - 0x014224 05:8214: 85 31     STA ram_0031
C - - - - - 0x014226 05:8216: B1 30     LDA (ram_0030),Y
C - - - - - 0x014228 05:8218: 85 2C     STA ram_002C
C - - - - - 0x01422A 05:821A: C8        INY
C - - - - - 0x01422B 05:821B: B1 30     LDA (ram_0030),Y
C - - - - - 0x01422D 05:821D: 85 2D     STA ram_002D
C - - - - - 0x01422F 05:821F: C8        INY
C - - - - - 0x014230 05:8220: B1 30     LDA (ram_0030),Y
C - - - - - 0x014232 05:8222: 85 2E     STA ram_002E
C - - - - - 0x014234 05:8224: C8        INY
C - - - - - 0x014235 05:8225: B1 30     LDA (ram_0030),Y
C - - - - - 0x014237 05:8227: 85 2F     STA ram_002F
C - - - - - 0x014239 05:8229: 60        RTS



sub_822A:
C - - - - - 0x01423A 05:822A: 8A        TXA
C - - - - - 0x01423B 05:822B: 29 01     AND #$01
C - - - - - 0x01423D 05:822D: A8        TAY
C - - - - - 0x01423E 05:822E: B9 CA 05  LDA ram_номер_опции,Y
C - - - - - 0x014241 05:8231: 0A        ASL
C - - - - - 0x014242 05:8232: A8        TAY
C - - - - - 0x014243 05:8233: B1 2C     LDA (ram_002C),Y
C - - - - - 0x014245 05:8235: 9D 14 03  STA ram_pos_X_lo_player,X
C - - - - - 0x014248 05:8238: C8        INY
C - - - - - 0x014249 05:8239: B1 2C     LDA (ram_002C),Y
C - - - - - 0x01424B 05:823B: C9 20     CMP #$20
C - - - - - 0x01424D 05:823D: 90 02     BCC bra_8241
C - - - - - 0x01424F 05:823F: E9 02     SBC #$02
bra_8241:
C - - - - - 0x014251 05:8241: 9D 4D 03  STA ram_pos_Y_lo_player,X
C - - - - - 0x014254 05:8244: A9 00     LDA #$00
C - - - - - 0x014256 05:8246: 9D 27 03  STA ram_pos_X_hi_player,X
C - - - - - 0x014259 05:8249: 9D 60 03  STA ram_pos_Y_hi_player,X
C - - - - - 0x01425C 05:824C: A0 00     LDY #$00
bra_824E_loop:
C - - - - - 0x01425E 05:824E: 1E 14 03  ASL ram_pos_X_lo_player,X
C - - - - - 0x014261 05:8251: 3E 27 03  ROL ram_pos_X_hi_player,X
C - - - - - 0x014264 05:8254: 1E 4D 03  ASL ram_pos_Y_lo_player,X
C - - - - - 0x014267 05:8257: 3E 60 03  ROL ram_pos_Y_hi_player,X
C - - - - - 0x01426A 05:825A: C8        INY
C - - - - - 0x01426B 05:825B: C0 03     CPY #$03
C - - - - - 0x01426D 05:825D: 90 EF     BCC bra_824E_loop
C - - - - - 0x01426F 05:825F: AD CE 05  LDA ram_05CE
C - - - - - 0x014272 05:8262: 29 0F     AND #$0F
C - - - - - 0x014274 05:8264: 18        CLC
C - - - - - 0x014275 05:8265: 7D 14 03  ADC ram_pos_X_lo_player,X
C - - - - - 0x014278 05:8268: 9D 14 03  STA ram_pos_X_lo_player,X
C - - - - - 0x01427B 05:826B: BD 27 03  LDA ram_pos_X_hi_player,X
C - - - - - 0x01427E 05:826E: 69 00     ADC #$00
C - - - - - 0x014280 05:8270: 9D 27 03  STA ram_pos_X_hi_player,X
C - - - - - 0x014283 05:8273: 18        CLC
C - - - - - 0x014284 05:8274: BD 4D 03  LDA ram_pos_Y_lo_player,X
C - - - - - 0x014287 05:8277: 69 07     ADC #$07
C - - - - - 0x014289 05:8279: 9D 4D 03  STA ram_pos_Y_lo_player,X
C - - - - - 0x01428C 05:827C: BD 60 03  LDA ram_pos_Y_hi_player,X
C - - - - - 0x01428F 05:827F: 69 00     ADC #$00
C - - - - - 0x014291 05:8281: 9D 60 03  STA ram_pos_Y_hi_player,X
C - - - - - 0x014294 05:8284: A9 00     LDA #$00
C - - - - - 0x014296 05:8286: 9D 86 03  STA ram_pos_Z_lo_player,X
C - - - - - 0x014299 05:8289: 9D 99 03  STA ram_pos_Z_hi_player,X
C - - - - - 0x01429C 05:828C: 60        RTS



sub_828D:
C - - - - - 0x01429D 05:828D: 85 1C     STA ram_001C
C - - - - - 0x01429F 05:828F: 8A        TXA
C - - - - - 0x0142A0 05:8290: 29 01     AND #$01
C - - - - - 0x0142A2 05:8292: A8        TAY
C - - - - - 0x0142A3 05:8293: B9 CA 05  LDA ram_номер_опции,Y
C - - - - - 0x0142A6 05:8296: 0A        ASL
C - - - - - 0x0142A7 05:8297: 30 11     BMI bra_82AA
C - - - - - 0x0142A9 05:8299: AD 00 03  LDA ram_frame_cnt
C - - - - - 0x0142AC 05:829C: 29 03     AND #$03
C - - - - - 0x0142AE 05:829E: F0 0A     BEQ bra_82AA
C - - - - - 0x0142B0 05:82A0: A5 1C     LDA ram_001C
C - - - - - 0x0142B2 05:82A2: 09 80     ORA #$80
C - - - - - 0x0142B4 05:82A4: 9D 74 00  STA ram_animation_id_player,X
C - - - - - 0x0142B7 05:82A7: 4C AF 82  RTS
bra_82AA:
C - - - - - 0x0142BA 05:82AA: A9 7F     LDA #$7F
C - - - - - 0x0142BC 05:82AC: 9D 74 00  STA ram_animation_id_player,X
C D 0 - - - 0x0142BF 05:82AF: 60        RTS



sub_82AF:
                                        LDA #$02
                                        BNE bra_82B4
                                        
sub_82B0:
C - - - - - 0x0142C0 05:82B0: 29 01     AND #$01
C - - - - - 0x0142C2 05:82B2: 09 DC     ORA #$DC
bra_82B4:
C D 0 - - - 0x0142C4 05:82B4: 85 1C     STA ram_001C
C - - - - - 0x0142C6 05:82B6: 20 F4 82  JSR sub_82F4
C - - - - - 0x0142C9 05:82B9: 8A        TXA
C - - - - - 0x0142CA 05:82BA: 29 01     AND #$01
C - - - - - 0x0142CC 05:82BC: A8        TAY
C - - - - - 0x0142CD 05:82BD: B9 CA 05  LDA ram_номер_опции,Y
C - - - - - 0x0142D0 05:82C0: 98        TYA
C - - - - - 0x0142D1 05:82C1: F0 17     BEQ bra_82DA
C - - - - - 0x0142D3 05:82C3: A5 1C     LDA ram_001C
C - - - - - 0x0142D5 05:82C5: 8D B9 06  STA ram_буфер_графики
C - - - - - 0x0142D8 05:82C8: A9 01     LDA #$01
C - - - - - 0x0142DA 05:82CA: 8D B8 06  STA ram_счетчик_буфера_графики
C - - - - - 0x0142DD 05:82CD: A5 30     LDA ram_0030
C - - - - - 0x0142DF 05:82CF: 8D B7 06  STA ram_байт_2006_lo_графика
C - - - - - 0x0142E2 05:82D2: A5 31     LDA ram_0031
C - - - - - 0x0142E4 05:82D4: 8D B6 06  STA ram_байт_2006_hi_графика
C - - - - - 0x0142E7 05:82D7: 4C EE 82  RTS
bra_82DA:
C - - - - - 0x0142EA 05:82DA: A5 1C     LDA ram_001C
C - - - - - 0x0142EC 05:82DC: 8D 96 06  STA ram_буфер_атрибутов
C - - - - - 0x0142EF 05:82DF: A9 01     LDA #$01
C - - - - - 0x0142F1 05:82E1: 8D 95 06  STA ram_счетчик_буфера_атрибутов
C - - - - - 0x0142F4 05:82E4: A5 30     LDA ram_0030
C - - - - - 0x0142F6 05:82E6: 8D 94 06  STA ram_байт_2006_lo_атрибуты
C - - - - - 0x0142F9 05:82E9: A5 31     LDA ram_0031
C - - - - - 0x0142FB 05:82EB: 8D 93 06  STA ram_байт_2006_hi_атрибуты
C D 0 - - - 0x0142FE 05:82EE: 60        RTS



sub_82F4:
C - - - - - 0x014304 05:82F4: 8A        TXA
C - - - - - 0x014305 05:82F5: 29 01     AND #$01
C - - - - - 0x014307 05:82F7: A8        TAY
C - - - - - 0x014308 05:82F8: B9 CA 05  LDA ram_номер_опции,Y
C - - - - - 0x01430B 05:82FB: 0A        ASL
C - - - - - 0x01430C 05:82FC: A8        TAY
C - - - - - 0x01430D 05:82FD: B1 2C     LDA (ram_002C),Y
C - - - - - 0x01430F 05:82FF: 29 1F     AND #$1F
C - - - - - 0x014311 05:8301: 85 1D     STA ram_001D
C - - - - - 0x014313 05:8303: B1 2C     LDA (ram_002C),Y
C - - - - - 0x014315 05:8305: 29 20     AND #$20
C - - - - - 0x014317 05:8307: 85 31     STA ram_0031
C - - - - - 0x014319 05:8309: C8        INY
C - - - - - 0x01431A 05:830A: B1 2C     LDA (ram_002C),Y
C - - - - - 0x01431C 05:830C: 29 1F     AND #$1F
C - - - - - 0x01431E 05:830E: 85 30     STA ram_0030
C - - - - - 0x014320 05:8310: B1 2C     LDA (ram_002C),Y
C - - - - - 0x014322 05:8312: 29 20     AND #$20
C - - - - - 0x014324 05:8314: 0A        ASL
C - - - - - 0x014325 05:8315: 05 31     ORA ram_0031
C - - - - - 0x014327 05:8317: 05 30     ORA ram_0030
C - - - - - 0x014329 05:8319: 85 30     STA ram_0030
C - - - - - 0x01432B 05:831B: A9 00     LDA #$00
C - - - - - 0x01432D 05:831D: 85 31     STA ram_0031
C - - - - - 0x01432F 05:831F: A0 00     LDY #$00
bra_8321_loop:
C - - - - - 0x014331 05:8321: 06 30     ASL ram_0030
C - - - - - 0x014333 05:8323: 26 31     ROL ram_0031
C - - - - - 0x014335 05:8325: C8        INY
C - - - - - 0x014336 05:8326: C0 05     CPY #$05
C - - - - - 0x014338 05:8328: 90 F7     BCC bra_8321_loop
C - - - - - 0x01433A 05:832A: 18        CLC
C - - - - - 0x01433B 05:832B: A5 1D     LDA ram_001D
C - - - - - 0x01433D 05:832D: 65 30     ADC ram_0030
C - - - - - 0x01433F 05:832F: 85 30     STA ram_0030
C - - - - - 0x014341 05:8331: A9 20     LDA #$20
C - - - - - 0x014343 05:8333: 65 31     ADC ram_0031
C - - - - - 0x014345 05:8335: 85 31     STA ram_0031
C - - - - - 0x014347 05:8337: 60        RTS



ofs_808B_01_главное_меню:
C - - - - - 0x014348 05:8338: A5 59     LDA ram_subscript
C - - - - - 0x01434A 05:833A: 30 06     BMI bra_8342
C - - - - - 0x01434C 05:833C: 20 DF 80  JSR sub_80DF
C - - - - - 0x01434F 05:833F: 20 55 83  JSR sub_8355
bra_8342:
C - - - - - 0x014352 05:8342: 20 93 85  JSR sub_8593
C - - - - - 0x014355 05:8345: AD C9 05  LDA ram_счетчик_опций
C - - - - - 0x014358 05:8348: 20 53 C0  JSR sub_0x01EC9F_jump_to_pointers_after_JSR
- D 0 - I - 0x01435B 05:834B: CA 83     .word ofs_83CA_00
- D 0 - I - 0x01435D 05:834D: DE 83     .word ofs_83DE_01
- D 0 - I - 0x01435F 05:834F: 75 84     .word ofs_8475_02
- D 0 - I - 0x014361 05:8351: B8 84     .word ofs_84B8_03
- D 0 - I - 0x014363 05:8353: FD 84     .word ofs_84FD_04



sub_8355:
C - - - - - 0x014365 05:8355: A9 FF     LDA #$FF
C - - - - - 0x014367 05:8357: 8D CA 05  STA ram_номер_опции
C - - - - - 0x01436A 05:835A: A9 00     LDA #$00
C - - - - - 0x01436C 05:835C: 8D CC 05  STA ram_счетчик_смен
C - - - - - 0x01436F 05:835F: 8D 61 00  STA ram_0061
C - - - - - 0x014372 05:8362: 8D 62 00  STA ram_0062
C - - - - - 0x014375 05:8365: 8D 2A 05  STA ram_флаг_владения_мячом_ком
C - - - - - 0x014378 05:8368: 8D 2B 05  STA ram_флаг_владения_мячом_ком + 1
C - - - - - 0x01437B 05:836B: 8D 2C 05  STA ram_номер_команды
C - - - - - 0x01437E 05:836E: 8D 2D 05  STA ram_номер_команды + 1
C - - - - - 0x014381 05:8371: 8D 5C 05  STA ram_лицо_игрока
C - - - - - 0x014384 05:8374: A9 05     LDA #$05
C - - - - - 0x014386 05:8376: 8D 63 00  STA ram_0063
C - - - - - 0x014389 05:8379: A9 01     LDA #$01
C - - - - - 0x01438B 05:837B: 8D 6D 00  STA ram_006D
C - - - - - 0x01438E 05:837E: 8D AE 05  STA ram_palette_id_spr
C - - - - - 0x014391 05:8381: 8D AF 05  STA ram_palette_id_spr + 1
C - - - - - 0x014394 05:8384: 8D 59 04  STA ram_movement_id_player
C - - - - - 0x014397 05:8387: 8D 65 04  STA ram_movement_id_ball
C - - - - - 0x01439A 05:838A: A9 80     LDA #$80
C - - - - - 0x01439C 05:838C: 8D 14 03  STA ram_pos_X_lo_player
C - - - - - 0x01439F 05:838F: A9 8C     LDA #$8C
C - - - - - 0x0143A1 05:8391: 8D 20 03  STA ram_pos_X_lo_ball
C - - - - - 0x0143A4 05:8394: A9 A4     LDA #$A4
C - - - - - 0x0143A6 05:8396: 8D 4D 03  STA ram_pos_Y_lo_player
C - - - - - 0x0143A9 05:8399: A9 A5     LDA #$A5
C - - - - - 0x0143AB 05:839B: 8D 59 03  STA ram_pos_Y_lo_ball
C - - - - - 0x0143AE 05:839E: 20 41 80  JSR sub_0x01C297
C - - - - - 0x0143B1 05:83A1: 20 14 80  JSR sub_0x01C2AE
C - - - - - 0x0143B4 05:83A4: A2 26     LDX #$26
C - - - - - 0x0143B6 05:83A6: 8E B8 05  STX ram_банк_спрайтов
C - - - - - 0x0143B9 05:83A9: E8        INX
C - - - - - 0x0143BA 05:83AA: 8E B9 05  STX ram_банк_спрайтов + 1
C - - - - - 0x0143BD 05:83AD: A2 20     LDX #$20
C - - - - - 0x0143BF 05:83AF: 8E BA 05  STX ram_банк_спрайтов + 2
C - - - - - 0x0143C2 05:83B2: A2 09     LDX #$09
C - - - - - 0x0143C4 05:83B4: 8E BB 05  STX ram_банк_спрайтов + 3
C - - - - - 0x0143C7 05:83B7: 20 0B C0  JSR sub_0x01EEAA_базовые_банки_спрайтов
C - - - - - 0x0143CA 05:83BA: A9 02     LDA #con_music_menu
C - - - - - 0x0143CC 05:83BC: 20 02 C0  JSR sub_0x01C2F4_play_sound
C - - - - - 0x0143CF 05:83BF: A2 09     LDX #$09
C - - - - - 0x0143D1 05:83C1: A9 00     LDA #$00
bra_83C3_loop:
C - - - - - 0x0143D3 05:83C3: 9D 6E 04  STA ram_046E,X
C - - - - - 0x0143D6 05:83C6: CA        DEX
C - - - - - 0x0143D7 05:83C7: 10 FA     BPL bra_83C3_loop
C - - - - - 0x0143D9 05:83C9: 60        RTS



ofs_83CA_00:
C - - J - - 0x0143DA 05:83CA: AD B2 05  LDA ram_flag_brightness
C - - - - - 0x0143DD 05:83CD: 10 03     BPL bra_83D2
C - - - - - 0x0143DF 05:83CF: EE C9 05  INC ram_счетчик_опций
bra_83D2:
C - - - - - 0x0143E2 05:83D2: 20 5C C0  JSR sub_0x01D083
C - - - - - 0x0143E5 05:83D5: 20 41 80  JSR sub_0x01C297
C - - - - - 0x0143E8 05:83D8: 20 14 80  JSR sub_0x01C2AE
C - - - - - 0x0143EB 05:83DB: 4C 74 84  RTS



ofs_83DE_01:
C - - J - - 0x0143EE 05:83DE: A2 02     LDX #$02
C - - - - - 0x0143F0 05:83E0: AD CA 05  LDA ram_номер_опции
C - - - - - 0x0143F3 05:83E3: 10 09     BPL bra_83EE
C - - - - - 0x0143F5 05:83E5: 20 0C 86  JSR sub_860C
C - - - - - 0x0143F8 05:83E8: 20 73 86  JSR sub_8673
C - - - - - 0x0143FB 05:83EB: 20 EF 82  JSR sub_82AF
bra_83EE:
C - - - - - 0x0143FE 05:83EE: 20 7E 81  JSR sub_817E_конвертация_нажатых_кнопок_в_индекс
C - - - - - 0x014401 05:83F1: 20 D3 81  JSR sub_81D3_конвертация_индексов_Dpad_в_05
C - - - - - 0x014404 05:83F4: 20 53 C0  JSR sub_0x01EC9F_jump_to_pointers_after_JSR
- D 0 - I - 0x014407 05:83F7: 55 84     .word ofs_8455_00_nothing
- D 0 - I - 0x014409 05:83F9: 03 84     .word ofs_8403_01_Start
- - - - - - 0x01440B 05:83FB: 55 84     .word ofs_8455_02_Select
- D 0 - I - 0x01440D 05:83FD: 0E 84     .word ofs_840E_03_A
- - - - - - 0x01440F 05:83FF: 3D 84     .word ofs_843D_04_B
- D 0 - I - 0x014411 05:8401: 4A 84     .word ofs_844A_05_Dpad



ofs_8403_01_Start:
ofs_8403_03_A:
C - - J - - 0x014413 05:8403: A9 33     LDA #con_sfx_yes
C - - - - - 0x014415 05:8405: 20 02 C0  JSR sub_0x01C2F4_play_sound
C - - - - - 0x014418 05:8408: 20 AA 86  JSR sub_86AA
C - - - - - 0x01441B 05:840B: 4C 55 84  JMP loc_8455



ofs_840E_03_A:
C - - J - - 0x01441E 05:840E: A9 33     LDA #con_sfx_yes
C - - - - - 0x014420 05:8410: 20 02 C0  JSR sub_0x01C2F4_play_sound
C - - - - - 0x014423 05:8413: A9 11     LDA #$11    ; кунио базарит
C - - - - - 0x014425 05:8415: 8D 79 04  STA ram_action_id_player
C - - - - - 0x014428 05:8418: A2 02     LDX #$02
C - - - - - 0x01442A 05:841A: A9 00     LDA #$00
C - - - - - 0x01442C 05:841C: 20 B0 82  JSR sub_82B0
C - - - - - 0x01442F 05:841F: A9 FF     LDA #$FF
C - - - - - 0x014431 05:8421: 8D CA 05  STA ram_номер_опции
C - - - - - 0x014434 05:8424: AD C9 05  LDA ram_счетчик_опций
C - - - - - 0x014437 05:8427: C9 02     CMP #$02
C - - - - - 0x014439 05:8429: D0 0C     BNE bra_8437
C - - - - - 0x01443B 05:842B: A5 57     LDA ram_option_mode_difficulty
C - - - - - 0x01443D 05:842D: 10 08     BPL bra_8437    ; если не режим прохождения
C - - - - - 0x01443F 05:842F: A9 04     LDA #$04
C - - - - - 0x014441 05:8431: 8D C9 05  STA ram_счетчик_опций
C - - - - - 0x014444 05:8434: 4C 55 84  JMP loc_8455
bra_8437:
C - - - - - 0x014447 05:8437: EE C9 05  INC ram_счетчик_опций
C - - - - - 0x01444A 05:843A: 4C 55 84  JMP loc_8455



loc_843D:
ofs_843D_04_B:
C D 0 - - - 0x01444D 05:843D: A9 34     LDA #con_sfx_no
C - - - - - 0x01444F 05:843F: 20 02 C0  JSR sub_0x01C2F4_play_sound
C - - - - - 0x014452 05:8442: A9 11     LDA #$11    ; кунио базарит
C - - - - - 0x014454 05:8444: 8D 79 04  STA ram_action_id_player
C - - - - - 0x014457 05:8447: 4C 55 84  JMP loc_8455



ofs_844A_05_Dpad:
C - - J - - 0x01445A 05:844A: A9 32     LDA #con_sfx_move_cursor
C - - - - - 0x01445C 05:844C: 20 02 C0  JSR sub_0x01C2F4_play_sound
C - - - - - 0x01445F 05:844F: 20 DD 81  JSR sub_81DD
C - - - - - 0x014462 05:8452: 20 73 86  JSR sub_8673
loc_8455:
ofs_8455_00_nothing:
ofs_8455_02_Select:
C D 0 J - - 0x014465 05:8455: AD CA 05  LDA ram_номер_опции
C - - - - - 0x014468 05:8458: 30 14     BMI bra_846E
C - - - - - 0x01446A 05:845A: A2 02     LDX #$02
C - - - - - 0x01446C 05:845C: 20 2A 82  JSR sub_822A
C - - - - - 0x01446F 05:845F: AD C9 05  LDA ram_счетчик_опций
C - - - - - 0x014472 05:8462: 29 04     AND #$04
C - - - - - 0x014474 05:8464: F0 02     BEQ bra_8468
C - - - - - 0x014476 05:8466: A9 01     LDA #$01
bra_8468:
C - - - - - 0x014478 05:8468: 20 8D 82  JSR sub_828D
C - - - - - 0x01447B 05:846B: 20 65 C0  JSR sub_0x01EB9C
bra_846E:
C - - - - - 0x01447E 05:846E: 20 41 80  JSR sub_0x01C297
C - - - - - 0x014481 05:8471: 20 14 80  JSR sub_0x01C2AE
C D 0 - - - 0x014484 05:8474: 60        RTS



ofs_8475_02:
C - - J - - 0x014485 05:8475: A2 02     LDX #$02
C - - - - - 0x014487 05:8477: AD CA 05  LDA ram_номер_опции
C - - - - - 0x01448A 05:847A: 10 09     BPL bra_8485
C - - - - - 0x01448C 05:847C: 20 3A 86  JSR sub_863A
C - - - - - 0x01448F 05:847F: 20 8F 86  JSR sub_868F
C - - - - - 0x014492 05:8482: 20 EF 82  JSR sub_82AF
bra_8485:
C - - - - - 0x014495 05:8485: 20 7E 81  JSR sub_817E_конвертация_нажатых_кнопок_в_индекс
C - - - - - 0x014498 05:8488: 20 D3 81  JSR sub_81D3_конвертация_индексов_Dpad_в_05
C - - - - - 0x01449B 05:848B: 20 53 C0  JSR sub_0x01EC9F_jump_to_pointers_after_JSR
- D 0 - I - 0x01449E 05:848E: 55 84     .word ofs_8455_00_nothing
- D 0 - I - 0x0144A0 05:8490: 03 84     .word ofs_8403_01_Start
- - - - - - 0x0144A2 05:8492: 55 84     .word ofs_8455_02_Select
- D 0 - I - 0x0144A4 05:8494: 0E 84     .word ofs_840E_03_A
- D 0 - I - 0x0144A6 05:8496: 9A 84     .word ofs_849A_04_B
- D 0 - I - 0x0144A8 05:8498: AA 84     .word ofs_84AA_05_Dpad



ofs_849A_04_B:
C - - J - - 0x0144AA 05:849A: A2 02     LDX #$02
C - - - - - 0x0144AC 05:849C: 20 EF 82  JSR sub_82AF
C - - - - - 0x0144AF 05:849F: A9 FF     LDA #$FF
C - - - - - 0x0144B1 05:84A1: 8D CA 05  STA ram_номер_опции
C - - - - - 0x0144B4 05:84A4: CE C9 05  DEC ram_счетчик_опций
C - - - - - 0x0144B7 05:84A7: 4C 3D 84  JMP loc_843D



ofs_84AA_05_Dpad:
C - - J - - 0x0144BA 05:84AA: A9 32     LDA #con_sfx_move_cursor
C - - - - - 0x0144BC 05:84AC: 20 02 C0  JSR sub_0x01C2F4_play_sound
C - - - - - 0x0144BF 05:84AF: 20 DD 81  JSR sub_81DD
C - - - - - 0x0144C2 05:84B2: 20 8F 86  JSR sub_868F
C - - - - - 0x0144C5 05:84B5: 4C 55 84  JMP loc_8455



ofs_84B8_03:
C - - J - - 0x0144C8 05:84B8: A2 02     LDX #$02
C - - - - - 0x0144CA 05:84BA: AD CA 05  LDA ram_номер_опции
C - - - - - 0x0144CD 05:84BD: 10 09     BPL bra_84C8
C - - - - - 0x0144CF 05:84BF: 20 6B 86  JSR sub_866B
C - - - - - 0x0144D2 05:84C2: 20 A0 86  JSR sub_86A0
C - - - - - 0x0144D5 05:84C5: 20 EF 82  JSR sub_82AF
bra_84C8:
C - - - - - 0x0144D8 05:84C8: 20 7E 81  JSR sub_817E_конвертация_нажатых_кнопок_в_индекс
C - - - - - 0x0144DB 05:84CB: 20 D3 81  JSR sub_81D3_конвертация_индексов_Dpad_в_05
C - - - - - 0x0144DE 05:84CE: 20 53 C0  JSR sub_0x01EC9F_jump_to_pointers_after_JSR
- D 0 - I - 0x0144E1 05:84D1: 55 84     .word ofs_8455_00_nothing
- D 0 - I - 0x0144E3 05:84D3: 03 84     .word ofs_8403_01_Start
- - - - - - 0x0144E5 05:84D5: 55 84     .word ofs_8455_02_Select
- D 0 - I - 0x0144E7 05:84D7: 03 84     .word ofs_8403_03_A
- D 0 - I - 0x0144E9 05:84D9: DD 84     .word ofs_84DD_04_B
- D 0 - I - 0x0144EB 05:84DB: EF 84     .word ofs_84EF_05_Dpad



ofs_84DD_04_B:
C - - J - - 0x0144ED 05:84DD: A2 02     LDX #$02
C - - - - - 0x0144EF 05:84DF: A9 00     LDA #$00
C - - - - - 0x0144F1 05:84E1: 20 B0 82  JSR sub_82B0
C - - - - - 0x0144F4 05:84E4: CE C9 05  DEC ram_счетчик_опций
C - - - - - 0x0144F7 05:84E7: A9 FF     LDA #$FF
C - - - - - 0x0144F9 05:84E9: 8D CA 05  STA ram_номер_опции
C - - - - - 0x0144FC 05:84EC: 4C 3D 84  JMP loc_843D



ofs_84EF_05_Dpad:
C - - J - - 0x0144FF 05:84EF: A9 32     LDA #con_sfx_move_cursor
C - - - - - 0x014501 05:84F1: 20 02 C0  JSR sub_0x01C2F4_play_sound
C - - - - - 0x014504 05:84F4: 20 DD 81  JSR sub_81DD
C - - - - - 0x014507 05:84F7: 20 A0 86  JSR sub_86A0
C - - - - - 0x01450A 05:84FA: 4C 55 84  JMP loc_8455



ofs_84FD_04:
C - - J - - 0x01450D 05:84FD: A2 02     LDX #$02
C - - - - - 0x01450F 05:84FF: AD CA 05  LDA ram_номер_опции
C - - - - - 0x014512 05:8502: 10 05     BPL bra_8509
C - - - - - 0x014514 05:8504: A9 00     LDA #$00
C - - - - - 0x014516 05:8506: 8D CA 05  STA ram_номер_опции
bra_8509:
C - - - - - 0x014519 05:8509: 20 7E 81  JSR sub_817E_конвертация_нажатых_кнопок_в_индекс
C - - - - - 0x01451C 05:850C: 20 53 C0  JSR sub_0x01EC9F_jump_to_pointers_after_JSR
- D 0 - I - 0x01451F 05:850F: 55 84     .word ofs_8455_00_nothing
- D 0 - I - 0x014521 05:8511: 03 84     .word ofs_8403_01_Start
- - - - - - 0x014523 05:8513: 55 84     .word ofs_8455_02_Select
- D 0 - I - 0x014525 05:8515: 21 85     .word ofs_8521_03_A
- - - - - - 0x014527 05:8517: 33 85     .word ofs_8533_04_B
- D 0 - I - 0x014529 05:8519: 40 85     .word ofs_8540_05_Up
- D 0 - I - 0x01452B 05:851B: 68 85     .word ofs_8568_06_Down
- D 0 - I - 0x01452D 05:851D: 74 85     .word ofs_8574_07_Left
- D 0 - I - 0x01452F 05:851F: 84 85     .word ofs_8584_08_Right



ofs_8521_03_A:
C - - J - - 0x014531 05:8521: A9 33     LDA #con_sfx_yes
C - - - - - 0x014533 05:8523: 20 02 C0  JSR sub_0x01C2F4_play_sound
C - - - - - 0x014536 05:8526: A9 FF     LDA #$FF
C - - - - - 0x014538 05:8528: 8D CA 05  STA ram_номер_опции
C - - - - - 0x01453B 05:852B: A9 03     LDA #$03
C - - - - - 0x01453D 05:852D: 8D C9 05  STA ram_счетчик_опций
C - - - - - 0x014540 05:8530: 4C 55 84  JMP loc_8455



ofs_8533_04_B:
- - - - - - 0x014543 05:8533: A9 FF     LDA #$FF
- - - - - - 0x014545 05:8535: 8D CA 05  STA ram_номер_опции
- - - - - - 0x014548 05:8538: A9 02     LDA #$02
- - - - - - 0x01454A 05:853A: 8D C9 05  STA ram_счетчик_опций
- - - - - - 0x01454D 05:853D: 4C 3D 84  JMP loc_843D



ofs_8540_05_Up:
C - - J - - 0x014550 05:8540: AC CA 05  LDY ram_номер_опции
C - - - - - 0x014553 05:8543: 18        CLC
C - - - - - 0x014554 05:8544: B9 6E 04  LDA ram_046E,Y
C - - - - - 0x014557 05:8547: 69 01     ADC #$01
loc_8549:
C D 0 - - - 0x014559 05:8549: 29 0F     AND #$0F
C - - - - - 0x01455B 05:854B: 99 6E 04  STA ram_046E,Y
C - - - - - 0x01455E 05:854E: 20 79 8A  JSR sub_8A79
C - - - - - 0x014561 05:8551: A9 0C     LDA #$0C
C - - - - - 0x014563 05:8553: 8D 95 06  STA ram_счетчик_буфера_атрибутов
C - - - - - 0x014566 05:8556: A9 0F     LDA #< $210F
C - - - - - 0x014568 05:8558: 8D 94 06  STA ram_байт_2006_lo_атрибуты
C - - - - - 0x01456B 05:855B: A9 21     LDA #> $210F
C - - - - - 0x01456D 05:855D: 8D 93 06  STA ram_байт_2006_hi_атрибуты
loc_8560:
C D 0 - - - 0x014570 05:8560: A9 32     LDA #con_sfx_move_cursor
C - - - - - 0x014572 05:8562: 20 02 C0  JSR sub_0x01C2F4_play_sound
C - - - - - 0x014575 05:8565: 4C 55 84  JMP loc_8455



ofs_8568_06_Down:
C - - J - - 0x014578 05:8568: AC CA 05  LDY ram_номер_опции
C - - - - - 0x01457B 05:856B: 38        SEC
C - - - - - 0x01457C 05:856C: B9 6E 04  LDA ram_046E,Y
C - - - - - 0x01457F 05:856F: E9 01     SBC #$01
C - - - - - 0x014581 05:8571: 4C 49 85  JMP loc_8549



ofs_8574_07_Left:
C - - J - - 0x014584 05:8574: 38        SEC
C - - - - - 0x014585 05:8575: AD CA 05  LDA ram_номер_опции
C - - - - - 0x014588 05:8578: E9 01     SBC #$01
C - - - - - 0x01458A 05:857A: 10 02     BPL bra_857E_запись_номера_опции
C - - - - - 0x01458C 05:857C: A9 09     LDA #$09
bra_857E_запись_номера_опции:
loc_857E:
C D 0 - - - 0x01458E 05:857E: 8D CA 05  STA ram_номер_опции
C - - - - - 0x014591 05:8581: 4C 60 85  JMP loc_8560



ofs_8584_08_Right:
C - - J - - 0x014594 05:8584: 18        CLC
C - - - - - 0x014595 05:8585: AD CA 05  LDA ram_номер_опции
C - - - - - 0x014598 05:8588: 69 01     ADC #$01
C - - - - - 0x01459A 05:858A: C9 0A     CMP #$0A
C - - - - - 0x01459C 05:858C: 90 F0     BCC bra_857E_запись_номера_опции
C - - - - - 0x01459E 05:858E: A9 00     LDA #$00
C - - - - - 0x0145A0 05:8590: 4C 7E 85  JMP loc_857E



sub_8593:
C - - - - - 0x0145A3 05:8593: 20 05 82  JSR sub_8205_read_pointers_after_JSR
- D 0 - I - 0x0145A6 05:8596: DE 85     .word off_85DE_00
- D 0 - I - 0x0145A8 05:8598: AA 85     .word off_85AA_01
- D 0 - I - 0x0145AA 05:859A: DE 85     .word off_85DE_02
- D 0 - I - 0x0145AC 05:859C: AA 85     .word off_85AA_03
- D 0 - I - 0x0145AE 05:859E: E4 85     .word off_85E4_04
- D 0 - I - 0x0145B0 05:85A0: B6 85     .word off_85B6_05
- D 0 - I - 0x0145B2 05:85A2: F2 85     .word off_85F2_06
- D 0 - I - 0x0145B4 05:85A4: D2 85     .word off_85D2_07
- D 0 - I - 0x0145B6 05:85A6: F8 85     .word off_85F8_08
- D 0 - I - 0x0145B8 05:85A8: AA 85     .word off_85AA_09

off_85AA_01:
off_85AA_03:
off_85AA_09:
- D 0 - I - 0x0145BA 05:85AA: 02        .byte $02   ; 
- D 0 - I - 0x0145BB 05:85AB: 01        .byte $01   ; 
- - - - - - 0x0145BC 05:85AC: 00        .byte $00   ; 
- D 0 - I - 0x0145BD 05:85AD: 00        .byte $00   ; 
- D 0 - I - 0x0145BE 05:85AE: 00        .byte $00   ; 
- D 0 - I - 0x0145BF 05:85AF: 02        .byte $02   ; 
- - - - - - 0x0145C0 05:85B0: 01        .byte $01   ; 
- D 0 - I - 0x0145C1 05:85B1: 01        .byte $01   ; 
- D 0 - I - 0x0145C2 05:85B2: 01        .byte $01   ; 
- D 0 - I - 0x0145C3 05:85B3: 00        .byte $00   ; 
- - - - - - 0x0145C4 05:85B4: 02        .byte $02   ; 
- - - - - - 0x0145C5 05:85B5: 02        .byte $02   ; 



off_85B6_05:
- - - - - - 0x0145C6 05:85B6: 00        .byte $00   ; 
- - - - - - 0x0145C7 05:85B7: 00        .byte $00   ; 
- D 0 - I - 0x0145C8 05:85B8: 01        .byte $01   ; 
- D 0 - I - 0x0145C9 05:85B9: 01        .byte $01   ; 
- - - - - - 0x0145CA 05:85BA: 01        .byte $01   ; 
- - - - - - 0x0145CB 05:85BB: 01        .byte $01   ; 
- D 0 - I - 0x0145CC 05:85BC: 00        .byte $00   ; 
- - - - - - 0x0145CD 05:85BD: 00        .byte $00   ; 
- - - - - - 0x0145CE 05:85BE: 02        .byte $02   ; 
- D 0 - I - 0x0145CF 05:85BF: 02        .byte $02   ; 
- D 0 - I - 0x0145D0 05:85C0: 04        .byte $04   ; 
- D 0 - I - 0x0145D1 05:85C1: 03        .byte $03   ; 
- - - - - - 0x0145D2 05:85C2: 03        .byte $03   ; 
- - - - - - 0x0145D3 05:85C3: 03        .byte $03   ; 
- D 0 - I - 0x0145D4 05:85C4: 02        .byte $02   ; 
- D 0 - I - 0x0145D5 05:85C5: 04        .byte $04   ; 
- - - - - - 0x0145D6 05:85C6: 04        .byte $04   ; 
- - - - - - 0x0145D7 05:85C7: 04        .byte $04   ; 
- D 0 - I - 0x0145D8 05:85C8: 03        .byte $03   ; 
- D 0 - I - 0x0145D9 05:85C9: 02        .byte $02   ; 
- - - - - - 0x0145DA 05:85CA: 05        .byte $05   ; 
- - - - - - 0x0145DB 05:85CB: 05        .byte $05   ; 
- D 0 - I - 0x0145DC 05:85CC: 06        .byte $06   ; 
- D 0 - I - 0x0145DD 05:85CD: 06        .byte $06   ; 
- - - - - - 0x0145DE 05:85CE: 06        .byte $06   ; 
- - - - - - 0x0145DF 05:85CF: 06        .byte $06   ; 
- D 0 - I - 0x0145E0 05:85D0: 05        .byte $05   ; 
- D 0 - I - 0x0145E1 05:85D1: 05        .byte $05   ; 



off_85D2_07:
- - - - - - 0x0145E2 05:85D2: 00        .byte $00   ; 
- - - - - - 0x0145E3 05:85D3: 00        .byte $00   ; 
- D 0 - I - 0x0145E4 05:85D4: 02        .byte $02   ; 
- D 0 - I - 0x0145E5 05:85D5: 01        .byte $01   ; 
- - - - - - 0x0145E6 05:85D6: 01        .byte $01   ; 
- - - - - - 0x0145E7 05:85D7: 01        .byte $01   ; 
- D 0 - I - 0x0145E8 05:85D8: 00        .byte $00   ; 
- D 0 - I - 0x0145E9 05:85D9: 02        .byte $02   ; 
- - - - - - 0x0145EA 05:85DA: 02        .byte $02   ; 
- - - - - - 0x0145EB 05:85DB: 02        .byte $02   ; 
- D 0 - I - 0x0145EC 05:85DC: 01        .byte $01   ; 
- D 0 - I - 0x0145ED 05:85DD: 00        .byte $00   ; 



off_85DE_00:
off_85DE_02:
- D 0 - I - 0x0145EE 05:85DE: 07        .byte $07   ; 
- D 0 - I - 0x0145EF 05:85DF: 06        .byte $06   ; 
- D 0 - I - 0x0145F0 05:85E0: 07        .byte $07   ; 
- D 0 - I - 0x0145F1 05:85E1: 0B        .byte $0B   ; 
- D 0 - I - 0x0145F2 05:85E2: 07        .byte $07   ; 
- D 0 - I - 0x0145F3 05:85E3: 0E        .byte $0E   ; 



off_85E4_04:
- D 0 - I - 0x0145F4 05:85E4: 11        .byte $11   ; 
- D 0 - I - 0x0145F5 05:85E5: 06        .byte $06   ; 
- D 0 - I - 0x0145F6 05:85E6: 14        .byte $14   ; 
- D 0 - I - 0x0145F7 05:85E7: 06        .byte $06   ; 
- D 0 - I - 0x0145F8 05:85E8: 11        .byte $11   ; 
- D 0 - I - 0x0145F9 05:85E9: 0B        .byte $0B   ; 
- D 0 - I - 0x0145FA 05:85EA: 14        .byte $14   ; 
- D 0 - I - 0x0145FB 05:85EB: 0B        .byte $0B   ; 
- D 0 - I - 0x0145FC 05:85EC: 17        .byte $17   ; 
- D 0 - I - 0x0145FD 05:85ED: 0B        .byte $0B   ; 
- D 0 - I - 0x0145FE 05:85EE: 11        .byte $11   ; 
- D 0 - I - 0x0145FF 05:85EF: 0E        .byte $0E   ; 
- D 0 - I - 0x014600 05:85F0: 14        .byte $14   ; 
- D 0 - I - 0x014601 05:85F1: 0E        .byte $0E   ; 



off_85F2_06:
- D 0 - I - 0x014602 05:85F2: 07        .byte $07   ; 
- D 0 - I - 0x014603 05:85F3: 1A        .byte $1A   ; 
- D 0 - I - 0x014604 05:85F4: 0E        .byte $0E   ; 
- D 0 - I - 0x014605 05:85F5: 1A        .byte $1A   ; 
- D 0 - I - 0x014606 05:85F6: 14        .byte $14   ; 
- D 0 - I - 0x014607 05:85F7: 1A        .byte $1A   ; 



off_85F8_08:
- D 0 - I - 0x014608 05:85F8: 0F        .byte $0F   ; 
- D 0 - I - 0x014609 05:85F9: 07        .byte $07   ; 
- D 0 - I - 0x01460A 05:85FA: 10        .byte $10   ; 
- D 0 - I - 0x01460B 05:85FB: 07        .byte $07   ; 
- D 0 - I - 0x01460C 05:85FC: 11        .byte $11   ; 
- D 0 - I - 0x01460D 05:85FD: 07        .byte $07   ; 
- D 0 - I - 0x01460E 05:85FE: 13        .byte $13   ; 
- D 0 - I - 0x01460F 05:85FF: 07        .byte $07   ; 
- D 0 - I - 0x014610 05:8600: 14        .byte $14   ; 
- D 0 - I - 0x014611 05:8601: 07        .byte $07   ; 
- D 0 - I - 0x014612 05:8602: 15        .byte $15   ; 
- D 0 - I - 0x014613 05:8603: 07        .byte $07   ; 
- D 0 - I - 0x014614 05:8604: 17        .byte $17   ; 
- D 0 - I - 0x014615 05:8605: 07        .byte $07   ; 
- D 0 - I - 0x014616 05:8606: 18        .byte $18   ; 
- D 0 - I - 0x014617 05:8607: 07        .byte $07   ; 
- D 0 - I - 0x014618 05:8608: 19        .byte $19   ; 
- D 0 - I - 0x014619 05:8609: 07        .byte $07   ; 
- D 0 - I - 0x01461A 05:860A: 1A        .byte $1A   ; 
- D 0 - I - 0x01461B 05:860B: 07        .byte $07   ; 



sub_860C:
C - - - - - 0x01461C 05:860C: A5 57     LDA ram_option_mode_difficulty
C - - - - - 0x01461E 05:860E: 10 05     BPL bra_8615_not_walkthrough
C - - - - - 0x014620 05:8610: A9 00     LDA #$00
C - - - - - 0x014622 05:8612: 4C 34 86  JMP loc_8634_запись_номера_опции
bra_8615_not_walkthrough:
C - - - - - 0x014625 05:8615: 0A        ASL
C - - - - - 0x014626 05:8616: 10 05     BPL bra_861D_not_minibattle
C - - - - - 0x014628 05:8618: A9 01     LDA #$01
C - - - - - 0x01462A 05:861A: 4C 34 86  JMP loc_8634_запись_номера_опции
bra_861D_not_minibattle:
C - - - - - 0x01462D 05:861D: 0A        ASL
C - - - - - 0x01462E 05:861E: 10 06     BPL bra_8626_not_pk
- - - - - - 0x014630 05:8620: 18        CLC
- - - - - - 0x014631 05:8621: A9 02     LDA #$02
- - - - - - 0x014633 05:8623: 4C 34 86  JMP loc_8634_запись_номера_опции
bra_8626_not_pk:
C - - - - - 0x014636 05:8626: 0A        ASL
C - - - - - 0x014637 05:8627: 10 05     BPL bra_862E
- - - - - - 0x014639 05:8629: A9 03     LDA #$03    ; bzk мусор, других опций нету
- - - - - - 0x01463B 05:862B: 4C 34 86  JMP loc_8634_запись_номера_опции
bra_862E:
C - - - - - 0x01463E 05:862E: A9 01     LDA #$01
C - - - - - 0x014640 05:8630: 85 57     STA ram_option_mode_difficulty
C - - - - - 0x014642 05:8632: A9 00     LDA #$00
loc_8634_запись_номера_опции:
C D 0 - - - 0x014644 05:8634: 29 07     AND #$07
C - - - - - 0x014646 05:8636: 8D CA 05  STA ram_номер_опции
C - - - - - 0x014649 05:8639: 60        RTS



sub_863A:
C - - - - - 0x01464A 05:863A: A5 5D     LDA ram_players_cnt
C - - - - - 0x01464C 05:863C: D0 04     BNE bra_8642
- - - - - - 0x01464E 05:863E: A9 01     LDA #$01
- - - - - - 0x014650 05:8640: 85 5D     STA ram_players_cnt
bra_8642:
C - - - - - 0x014652 05:8642: A0 00     LDY #$00
C - - - - - 0x014654 05:8644: A5 57     LDA ram_option_mode_difficulty
loc_8646_loop:
C D 0 - - - 0x014656 05:8646: 30 05     BMI bra_864D
C - - - - - 0x014658 05:8648: C8        INY
C - - - - - 0x014659 05:8649: 0A        ASL
C - - - - - 0x01465A 05:864A: 4C 46 86  JMP loc_8646_loop
bra_864D:
C - - - - - 0x01465D 05:864D: 98        TYA
C - - - - - 0x01465E 05:864E: 0A        ASL
C - - - - - 0x01465F 05:864F: 0A        ASL
C - - - - - 0x014660 05:8650: 65 5D     ADC ram_players_cnt
C - - - - - 0x014662 05:8652: A8        TAY
C - - - - - 0x014663 05:8653: 88        DEY
C - - - - - 0x014664 05:8654: B9 5B 86  LDA tbl_865B,Y
C - - - - - 0x014667 05:8657: 8D CA 05  STA ram_номер_опции
C - - - - - 0x01466A 05:865A: 60        RTS



tbl_865B:
- D 0 - - - 0x01466B 05:865B: 00        .byte $00   ; 
- - - - - - 0x01466C 05:865C: 01        .byte $01   ; 
- - - - - - 0x01466D 05:865D: 01        .byte $01   ; 
- - - - - - 0x01466E 05:865E: 01        .byte $01   ; 
- - - - - - 0x01466F 05:865F: 02        .byte $02   ; 
- D 0 - - - 0x014670 05:8660: 02        .byte $02   ; 
- D 0 - - - 0x014671 05:8661: 03        .byte $03   ; 
- D 0 - - - 0x014672 05:8662: 04        .byte $04   ; 
- D 0 - - - 0x014673 05:8663: 05        .byte $05   ; 
- D 0 - - - 0x014674 05:8664: 06        .byte $06   ; 
- - - - - - 0x014675 05:8665: 06        .byte $06   ; 
- - - - - - 0x014676 05:8666: 06        .byte $06   ; 
- - - - - - 0x014677 05:8667: 07        .byte $07   ; 
- - - - - - 0x014678 05:8668: 07        .byte $07   ; 
- - - - - - 0x014679 05:8669: 07        .byte $07   ; 
- - - - - - 0x01467A 05:866A: 07        .byte $07   ; 



sub_866B:
C - - - - - 0x01467B 05:866B: A5 57     LDA ram_option_mode_difficulty
C - - - - - 0x01467D 05:866D: 29 03     AND #$03
C - - - - - 0x01467F 05:866F: 8D CA 05  STA ram_номер_опции
C - - - - - 0x014682 05:8672: 60        RTS



sub_8673:
C - - - - - 0x014683 05:8673: AD CA 05  LDA ram_номер_опции
C - - - - - 0x014686 05:8676: 0A        ASL
C - - - - - 0x014687 05:8677: A8        TAY
C - - - - - 0x014688 05:8678: A5 57     LDA ram_option_mode_difficulty
C - - - - - 0x01468A 05:867A: 29 0F     AND #$0F
C - - - - - 0x01468C 05:867C: 19 87 86  ORA tbl_8687,Y
C - - - - - 0x01468F 05:867F: 85 57     STA ram_option_mode_difficulty
C - - - - - 0x014691 05:8681: B9 88 86  LDA tbl_8687 + 1,Y
C - - - - - 0x014694 05:8684: 85 5D     STA ram_players_cnt
C - - - - - 0x014696 05:8686: 60        RTS



tbl_8687:
- D 0 - - - 0x014697 05:8687: 80        .byte con_gm_walkthrough
- D 0 - - - 0x014698 05:8688: 01        .byte $01   ; 

- D 0 - - - 0x014699 05:8689: 40        .byte con_gm_minibattle
- D 0 - - - 0x01469A 05:868A: 02        .byte $02   ; 

- D 0 - - - 0x01469B 05:868B: 20        .byte con_gm_penalty
- D 0 - - - 0x01469C 05:868C: 01        .byte $01   ; 

- - - - - - 0x01469D 05:868D: 10        .byte $10   ; 
- - - - - - 0x01469E 05:868E: 01        .byte $01   ; 



sub_868F:
C - - - - - 0x01469F 05:868F: AC CA 05  LDY ram_номер_опции
C - - - - - 0x0146A2 05:8692: B9 98 86  LDA tbl_8698_количество_игроков,Y
C - - - - - 0x0146A5 05:8695: 85 5D     STA ram_players_cnt
C - - - - - 0x0146A7 05:8697: 60        RTS



tbl_8698_количество_игроков:
- D 0 - - - 0x0146A8 05:8698: 01        .byte $01   ; 
- D 0 - - - 0x0146A9 05:8699: 02        .byte $02   ; 
- D 0 - - - 0x0146AA 05:869A: 02        .byte $02   ; 
- D 0 - - - 0x0146AB 05:869B: 03        .byte $03   ; 
- D 0 - - - 0x0146AC 05:869C: 04        .byte $04   ; 
- D 0 - - - 0x0146AD 05:869D: 01        .byte $01   ; 
- D 0 - - - 0x0146AE 05:869E: 02        .byte $02   ; 
- - - - - - 0x0146AF 05:869F: 01        .byte $01   ; 



sub_86A0:
C - - - - - 0x0146B0 05:86A0: A5 57     LDA ram_option_mode_difficulty
C - - - - - 0x0146B2 05:86A2: 29 F8     AND #$F8
C - - - - - 0x0146B4 05:86A4: 0D CA 05  ORA ram_номер_опции
C - - - - - 0x0146B7 05:86A7: 85 57     STA ram_option_mode_difficulty
C - - - - - 0x0146B9 05:86A9: 60        RTS



sub_86AA:
C - - - - - 0x0146BA 05:86AA: 20 44 C0  JSR sub_0x01D057
C - - - - - 0x0146BD 05:86AD: 20 4A C0  JSR sub_0x01D072
C - - - - - 0x0146C0 05:86B0: 20 13 B9  JSR sub_B913
C - - - - - 0x0146C3 05:86B3: A0 00     LDY #$00
C - - - - - 0x0146C5 05:86B5: A9 00     LDA #$00
C - - - - - 0x0146C7 05:86B7: 8D 2A 05  STA ram_флаг_владения_мячом_ком
C - - - - - 0x0146CA 05:86BA: 8D 2B 05  STA ram_флаг_владения_мячом_ком + 1
bra_86BD_loop:
C - - - - - 0x0146CD 05:86BD: 99 32 05  STA ram_player_id,Y
C - - - - - 0x0146D0 05:86C0: C8        INY
C - - - - - 0x0146D1 05:86C1: 99 32 05  STA ram_player_id,Y
C - - - - - 0x0146D4 05:86C4: C8        INY
C - - - - - 0x0146D5 05:86C5: 18        CLC
C - - - - - 0x0146D6 05:86C6: 69 01     ADC #$01
C - - - - - 0x0146D8 05:86C8: C0 0C     CPY #$0C
C - - - - - 0x0146DA 05:86CA: 90 F1     BCC bra_86BD_loop
C - - - - - 0x0146DC 05:86CC: A5 57     LDA ram_option_mode_difficulty
C - - - - - 0x0146DE 05:86CE: 10 09     BPL bra_86D9_not_walkthrough
C - - - - - 0x0146E0 05:86D0: A0 03     LDY #$03
C - - - - - 0x0146E2 05:86D2: 8C 3A 05  STY ram_player_id + 8
C - - - - - 0x0146E5 05:86D5: C8        INY
C - - - - - 0x0146E6 05:86D6: 8C 38 05  STY ram_player_id + 6
bra_86D9_not_walkthrough:
C - - - - - 0x0146E9 05:86D9: A9 FF     LDA #$FF
C - - - - - 0x0146EB 05:86DB: 8D 4A 05  STA ram_054A
C - - - - - 0x0146EE 05:86DE: A0 00     LDY #$00
C - - - - - 0x0146F0 05:86E0: A9 08     LDA #$08
bra_86E2_loop:
C - - - - - 0x0146F2 05:86E2: 99 D5 05  STA ram_05D5,Y
C - - - - - 0x0146F5 05:86E5: 99 50 06  STA ram_позиция_управление,Y
C - - - - - 0x0146F8 05:86E8: C8        INY
C - - - - - 0x0146F9 05:86E9: C0 0C     CPY #$0C
C - - - - - 0x0146FB 05:86EB: 90 F5     BCC bra_86E2_loop
C - - - - - 0x0146FD 05:86ED: A9 55     LDA #$55
C - - - - - 0x0146FF 05:86EF: 8D D3 05  STA ram_05D3
C - - - - - 0x014702 05:86F2: 8D D4 05  STA ram_05D4
C - - - - - 0x014705 05:86F5: A0 00     LDY #$00
C - - - - - 0x014707 05:86F7: A5 57     LDA ram_option_mode_difficulty
C - - - - - 0x014709 05:86F9: 30 09     BMI bra_8704    ; если режим прохождения
C - - - - - 0x01470B 05:86FB: C8        INY
C - - - - - 0x01470C 05:86FC: 0A        ASL
C - - - - - 0x01470D 05:86FD: 30 05     BMI bra_8704    ; если минибатл
C - - - - - 0x01470F 05:86FF: C8        INY
C - - - - - 0x014710 05:8700: 0A        ASL
C - - - - - 0x014711 05:8701: 30 01     BMI bra_8704    ; если пенальти
- - - - - - 0x014713 05:8703: C8        INY
bra_8704:
C - - - - - 0x014717 05:8707: B9 12 87  LDA #con_script_menu
C - - - - - 0x01471A 05:870A: 85 58     STA ram_script
C - - - - - 0x01471C 05:870C: B9 13 87  LDA tbl_8712,Y
C - - - - - 0x01471F 05:870F: 85 59     STA ram_subscript
C - - - - - 0x014721 05:8711: 60        RTS



tbl_8712:
- D 0 - - - 0x014723 05:8713: 0E        .byte $0E   ; 00 режим прохождения
- D 0 - - - 0x014725 05:8715: 05        .byte $05   ; 01 минибатл
- D 0 - - - 0x014727 05:8717: 05        .byte $05   ; 02 пенальти
- - - - - - 0x014729 05:8719: 06        .byte $06   ; 03 bzk мусор?



ofs_8091_02_выбор_соперника_на_прохождение:
C - - - - - 0x01472A 05:871A: A5 59     LDA ram_subscript
C - - - - - 0x01472C 05:871C: 30 06     BMI bra_8724
C - - - - - 0x01472E 05:871E: 20 DF 80  JSR sub_80DF
C - - - - - 0x014731 05:8721: 20 31 87  JSR sub_8731
bra_8724:
C - - - - - 0x014734 05:8724: 20 DC 87  JSR sub_87DC
C - - - - - 0x014737 05:8727: AD C9 05  LDA ram_счетчик_опций
C - - - - - 0x01473A 05:872A: 20 53 C0  JSR sub_0x01EC9F_jump_to_pointers_after_JSR
- D 0 - I - 0x01473D 05:872D: 5D 87     .word ofs_875D_00
- D 0 - I - 0x01473F 05:872F: 6B 87     .word ofs_876B_01



sub_8731:
C - - - - - 0x014741 05:8731: A9 FF     LDA #$FF
C - - - - - 0x014743 05:8733: 8D CA 05  STA ram_номер_опции
C - - - - - 0x014746 05:8736: A9 05     LDA #$05
C - - - - - 0x014748 05:8738: 8D 61 00  STA ram_0061
C - - - - - 0x01474B 05:873B: A9 00     LDA #$00
C - - - - - 0x01474D 05:873D: 8D 2C 05  STA ram_номер_команды
C - - - - - 0x014750 05:8740: A9 01     LDA #$01
C - - - - - 0x014752 05:8742: 8D AE 05  STA ram_palette_id_spr
C - - - - - 0x014755 05:8745: 8D AF 05  STA ram_palette_id_spr + 1
C - - - - - 0x014758 05:8748: A2 26     LDX #$26
C - - - - - 0x01475A 05:874A: 8E B8 05  STX ram_банк_спрайтов
C - - - - - 0x01475D 05:874D: E8        INX
C - - - - - 0x01475E 05:874E: 8E B9 05  STX ram_банк_спрайтов + 1
C - - - - - 0x014761 05:8751: 20 0B C0  JSR sub_0x01EEAA_базовые_банки_спрайтов
C - - - - - 0x014764 05:8754: 20 53 89  JSR sub_8953
C - - - - - 0x014767 05:8757: A9 0A     LDA #con_music_walkthrough
C - - - - - 0x014769 05:8759: 20 02 C0  JSR sub_0x01C2F4_play_sound
C - - - - - 0x01476C 05:875C: 60        RTS



ofs_875D_00:
C - - J - - 0x01476D 05:875D: AD B2 05  LDA ram_flag_brightness
C - - - - - 0x014770 05:8760: 10 03     BPL bra_8765
C - - - - - 0x014772 05:8762: EE C9 05  INC ram_счетчик_опций
bra_8765:
C - - - - - 0x014775 05:8765: 20 5C C0  JSR sub_0x01D083
C - - - - - 0x014778 05:8768: 4C DB 87  RTS



ofs_876B_01:
C - - J - - 0x01477B 05:876B: A2 00     LDX #$00
C - - - - - 0x01477D 05:876D: AD CA 05  LDA ram_номер_опции
C - - - - - 0x014780 05:8770: 10 08     BPL bra_877A
C - - - - - 0x014782 05:8772: 20 2F 88  JSR sub_882F
C - - - - - 0x014785 05:8775: 20 D0 88  JSR sub_88D0
C - - - - - 0x014788 05:8778: A2 00     LDX #$00
bra_877A:
C - - - - - 0x01478A 05:877A: 20 7E 81  JSR sub_817E_конвертация_нажатых_кнопок_в_индекс
C - - - - - 0x01478D 05:877D: 20 53 C0  JSR sub_0x01EC9F_jump_to_pointers_after_JSR
- D 0 - I - 0x014790 05:8780: CB 87     .word ofs_87CB_00_nothing
- D 0 - I - 0x014792 05:8782: 92 87     .word ofs_8792_01_Start
- - - - - - 0x014794 05:8784: CB 87     .word ofs_87CB_02_Select
- D 0 - I - 0x014796 05:8786: 92 87     .word ofs_8792_03_A
- - - - - - 0x014798 05:8788: A5 87     .word ofs_87A5_04_B
- D 0 - I - 0x01479A 05:878A: AD 87     .word ofs_87AD_05_Up
- D 0 - I - 0x01479C 05:878C: AD 87     .word ofs_87AD_06_Down
- D 0 - I - 0x01479E 05:878E: C0 87     .word ofs_87C0_07_Left
- D 0 - I - 0x0147A0 05:8790: C0 87     .word ofs_87C0_08_Right



ofs_8792_01_Start:
ofs_8792_03_A:
C - - J - - 0x0147A2 05:8792: 20 68 88  JSR sub_8868
C - - - - - 0x0147A5 05:8795: 90 34     BCC bra_87CB
C - - - - - 0x0147A7 05:8797: A9 33     LDA #con_sfx_yes
C - - - - - 0x0147A9 05:8799: 20 02 C0  JSR sub_0x01C2F4_play_sound
C - - - - - 0x0147AC 05:879C: 20 4F 88  JSR sub_884F
C - - - - - 0x0147AF 05:879F: 20 85 88  JSR sub_8885
C - - - - - 0x0147B2 05:87A2: 4C CB 87  JMP loc_87CB



ofs_87A5_04_B:
- - - - - - 0x0147B5 05:87A5: A9 34     LDA #con_sfx_no
- - - - - - 0x0147B7 05:87A7: 20 02 C0  JSR sub_0x01C2F4_play_sound
- - - - - - 0x0147BA 05:87AA: 4C CB 87  JMP loc_87CB



ofs_87AD_05_Up:
ofs_87AD_06_Down:
C - - J - - 0x0147BD 05:87AD: A9 32     LDA #con_sfx_move_cursor
C - - - - - 0x0147BF 05:87AF: 20 02 C0  JSR sub_0x01C2F4_play_sound
C - - - - - 0x0147C2 05:87B2: 20 FF 88  JSR sub_88FF
C - - - - - 0x0147C5 05:87B5: A2 00     LDX #$00
C - - - - - 0x0147C7 05:87B7: 20 DD 81  JSR sub_81DD
C - - - - - 0x0147CA 05:87BA: 20 D0 88  JSR sub_88D0
C - - - - - 0x0147CD 05:87BD: 4C CB 87  JMP loc_87CB



ofs_87C0_07_Left:
ofs_87C0_08_Right:
C - - J - - 0x0147D0 05:87C0: A9 32     LDA #con_sfx_move_cursor
C - - - - - 0x0147D2 05:87C2: 20 02 C0  JSR sub_0x01C2F4_play_sound
C - - - - - 0x0147D5 05:87C5: 20 DD 81  JSR sub_81DD
C - - - - - 0x0147D8 05:87C8: 4C CB 87  JMP loc_87CB



bra_87CB:
loc_87CB:
ofs_87CB_00_nothing:
ofs_87CB_02_Select:
C D 0 J - - 0x0147DB 05:87CB: A2 00     LDX #$00
C - - - - - 0x0147DD 05:87CD: 20 2A 82  JSR sub_822A
C - - - - - 0x0147E0 05:87D0: A9 00     LDA #$00
C - - - - - 0x0147E2 05:87D2: 20 8D 82  JSR sub_828D
C - - - - - 0x0147E5 05:87D5: 20 65 C0  JSR sub_0x01EB9C
C - - - - - 0x0147E8 05:87D8: 20 14 80  JSR sub_0x01C2AE
C D 0 - - - 0x0147EB 05:87DB: 60        RTS



sub_87DC:
C - - - - - 0x0147EC 05:87DC: 20 05 82  JSR sub_8205_read_pointers_after_JSR
- D 0 - I - 0x0147EF 05:87DF: 17 88     .word off_8817_00
- D 0 - I - 0x0147F1 05:87E1: E7 87     .word off_87E7_01
- D 0 - I - 0x0147F3 05:87E3: 17 88     .word off_8817_02
- D 0 - I - 0x0147F5 05:87E5: E7 87     .word off_87E7_03

off_87E7_01:
off_87E7_03:
- - - - - - 0x0147F7 05:87E7: 03        .byte $03   ; 
- D 0 - I - 0x0147F8 05:87E8: 01        .byte $01   ; 
- D 0 - I - 0x0147F9 05:87E9: 08        .byte $08   ; 
- D 0 - I - 0x0147FA 05:87EA: 04        .byte $04   ; 
- D 0 - I - 0x0147FB 05:87EB: 00        .byte $00   ; 
- D 0 - I - 0x0147FC 05:87EC: 02        .byte $02   ; 
- D 0 - I - 0x0147FD 05:87ED: 09        .byte $09   ; 
- D 0 - I - 0x0147FE 05:87EE: 05        .byte $05   ; 
- D 0 - I - 0x0147FF 05:87EF: 01        .byte $01   ; 
- D 0 - I - 0x014800 05:87F0: 03        .byte $03   ; 
- D 0 - I - 0x014801 05:87F1: 0A        .byte $0A   ; 
- D 0 - I - 0x014802 05:87F2: 06        .byte $06   ; 
- D 0 - I - 0x014803 05:87F3: 02        .byte $02   ; 
- D 0 - I - 0x014804 05:87F4: 00        .byte $00   ; 
- D 0 - I - 0x014805 05:87F5: 0B        .byte $0B   ; 
- D 0 - I - 0x014806 05:87F6: 07        .byte $07   ; 
- D 0 - I - 0x014807 05:87F7: 07        .byte $07   ; 
- D 0 - I - 0x014808 05:87F8: 05        .byte $05   ; 
- D 0 - I - 0x014809 05:87F9: 00        .byte $00   ; 
- D 0 - I - 0x01480A 05:87FA: 08        .byte $08   ; 
- D 0 - I - 0x01480B 05:87FB: 04        .byte $04   ; 
- D 0 - I - 0x01480C 05:87FC: 06        .byte $06   ; 
- D 0 - I - 0x01480D 05:87FD: 01        .byte $01   ; 
- D 0 - I - 0x01480E 05:87FE: 09        .byte $09   ; 
- D 0 - I - 0x01480F 05:87FF: 05        .byte $05   ; 
- D 0 - I - 0x014810 05:8800: 07        .byte $07   ; 
- D 0 - I - 0x014811 05:8801: 02        .byte $02   ; 
- D 0 - I - 0x014812 05:8802: 0A        .byte $0A   ; 
- D 0 - I - 0x014813 05:8803: 06        .byte $06   ; 
- D 0 - I - 0x014814 05:8804: 04        .byte $04   ; 
- D 0 - I - 0x014815 05:8805: 03        .byte $03   ; 
- D 0 - I - 0x014816 05:8806: 0B        .byte $0B   ; 
- - - - - - 0x014817 05:8807: 0B        .byte $0B   ; 
- D 0 - I - 0x014818 05:8808: 09        .byte $09   ; 
- D 0 - I - 0x014819 05:8809: 04        .byte $04   ; 
- D 0 - I - 0x01481A 05:880A: 00        .byte $00   ; 
- D 0 - I - 0x01481B 05:880B: 08        .byte $08   ; 
- D 0 - I - 0x01481C 05:880C: 0A        .byte $0A   ; 
- D 0 - I - 0x01481D 05:880D: 05        .byte $05   ; 
- D 0 - I - 0x01481E 05:880E: 01        .byte $01   ; 
- D 0 - I - 0x01481F 05:880F: 09        .byte $09   ; 
- D 0 - I - 0x014820 05:8810: 0B        .byte $0B   ; 
- D 0 - I - 0x014821 05:8811: 06        .byte $06   ; 
- D 0 - I - 0x014822 05:8812: 02        .byte $02   ; 
- - - - - - 0x014823 05:8813: 0A        .byte $0A   ; 
- D 0 - I - 0x014824 05:8814: 08        .byte $08   ; 
- D 0 - I - 0x014825 05:8815: 07        .byte $07   ; 
- D 0 - I - 0x014826 05:8816: 03        .byte $03   ; 



off_8817_00:
off_8817_02:
- D 0 - I - 0x014827 05:8817: 0D        .byte $0D   ; 
- D 0 - I - 0x014828 05:8818: 06        .byte $06   ; 
- D 0 - I - 0x014829 05:8819: 0D        .byte $0D   ; 
- D 0 - I - 0x01482A 05:881A: 0B        .byte $0B   ; 
- D 0 - I - 0x01482B 05:881B: 0D        .byte $0D   ; 
- D 0 - I - 0x01482C 05:881C: 10        .byte $10   ; 
- D 0 - I - 0x01482D 05:881D: 0D        .byte $0D   ; 
- D 0 - I - 0x01482E 05:881E: 15        .byte $15   ; 
- D 0 - I - 0x01482F 05:881F: 14        .byte $14   ; 
- D 0 - I - 0x014830 05:8820: 06        .byte $06   ; 
- D 0 - I - 0x014831 05:8821: 14        .byte $14   ; 
- D 0 - I - 0x014832 05:8822: 0B        .byte $0B   ; 
- D 0 - I - 0x014833 05:8823: 14        .byte $14   ; 
- D 0 - I - 0x014834 05:8824: 10        .byte $10   ; 
- D 0 - I - 0x014835 05:8825: 14        .byte $14   ; 
- D 0 - I - 0x014836 05:8826: 15        .byte $15   ; 
- D 0 - I - 0x014837 05:8827: 19        .byte $19   ; 
- D 0 - I - 0x014838 05:8828: 06        .byte $06   ; 
- D 0 - I - 0x014839 05:8829: 19        .byte $19   ; 
- D 0 - I - 0x01483A 05:882A: 0B        .byte $0B   ; 
- D 0 - I - 0x01483B 05:882B: 19        .byte $19   ; 
- D 0 - I - 0x01483C 05:882C: 10        .byte $10   ; 
- D 0 - I - 0x01483D 05:882D: 19        .byte $19   ; 
- D 0 - I - 0x01483E 05:882E: 15        .byte $15   ; 



sub_882F:
C - - - - - 0x01483F 05:882F: A0 00     LDY #$00
C - - - - - 0x014841 05:8831: AD 2D 05  LDA ram_номер_команды + 1
C - - - - - 0x014844 05:8834: 29 0F     AND #$0F
C - - - - - 0x014846 05:8836: 85 1C     STA ram_001C
bra_8838_loop:
C - - - - - 0x014848 05:8838: B9 F9 89  LDA tbl_89F9,Y
C - - - - - 0x01484B 05:883B: 29 0F     AND #$0F
C - - - - - 0x01484D 05:883D: C5 1C     CMP ram_001C
C - - - - - 0x01484F 05:883F: F0 08     BEQ bra_8849
C - - - - - 0x014851 05:8841: C8        INY
C - - - - - 0x014852 05:8842: C8        INY
C - - - - - 0x014853 05:8843: C0 18     CPY #$18
C - - - - - 0x014855 05:8845: 90 F1     BCC bra_8838_loop
C - - - - - 0x014857 05:8847: A0 00     LDY #$00
bra_8849:
C - - - - - 0x014859 05:8849: 98        TYA
C - - - - - 0x01485A 05:884A: 4A        LSR
C - - - - - 0x01485B 05:884B: 8D CA 05  STA ram_номер_опции
C - - - - - 0x01485E 05:884E: 60        RTS



sub_884F:
C - - - - - 0x01485F 05:884F: AD CA 05  LDA ram_номер_опции
C - - - - - 0x014862 05:8852: 0A        ASL
C - - - - - 0x014863 05:8853: A8        TAY
C - - - - - 0x014864 05:8854: B9 F9 89  LDA tbl_89F9,Y
C - - - - - 0x014867 05:8857: 09 80     ORA #$80
C - - - - - 0x014869 05:8859: 8D 2D 05  STA ram_номер_команды + 1
C - - - - - 0x01486C 05:885C: 29 0F     AND #$0F
C - - - - - 0x01486E 05:885E: 4A        LSR
C - - - - - 0x01486F 05:885F: 4A        LSR
C - - - - - 0x014870 05:8860: A8        TAY
C - - - - - 0x014871 05:8861: B9 D1 A6  LDA tbl_A6D1,Y
C - - - - - 0x014874 05:8864: 8D 5A 05  STA ram_music_id
C - - - - - 0x014877 05:8867: 60        RTS



sub_8868:
C - - - - - 0x014878 05:8868: AD CA 05  LDA ram_номер_опции
C - - - - - 0x01487B 05:886B: 0A        ASL
C - - - - - 0x01487C 05:886C: A8        TAY
C - - - - - 0x01487D 05:886D: B9 FA 89  LDA tbl_89FA,Y
C - - - - - 0x014880 05:8870: A8        TAY
C - - - - - 0x014881 05:8871: B9 3E 05  LDA ram_053E,Y
C - - - - - 0x014884 05:8874: 29 03     AND #$03
C - - - - - 0x014886 05:8876: C9 03     CMP #$03
C - - - - - 0x014888 05:8878: D0 09     BNE bra_8883
- - - - - - 0x01488A 05:887A: A9 34     LDA #con_sfx_no
- - - - - - 0x01488C 05:887C: 20 02 C0  JSR sub_0x01C2F4_play_sound
- - - - - - 0x01488F 05:887F: 18        CLC
- - - - - - 0x014890 05:8880: 4C 84 88  RTS
bra_8883:
C - - - - - 0x014893 05:8883: 38        SEC
C - - - - - 0x014894 05:8884: 60        RTS



sub_8885:
C - - - - - 0x014895 05:8885: 20 44 C0  JSR sub_0x01D057
C - - - - - 0x014898 05:8888: 20 4A C0  JSR sub_0x01D072
C - - - - - 0x01489B 05:888B: 20 47 BB  JSR sub_BB47
C - - - - - 0x01489E 05:888E: A9 03     LDA #$03
C - - - - - 0x0148A0 05:8890: 85 59     STA ram_subscript
C - - - - - 0x0148A2 05:8892: 60        RTS



sub_8893:
C - - - - - 0x0148A3 05:8893: A5 59     LDA ram_subscript
C - - - - - 0x0148A5 05:8895: 30 0B     BMI bra_88A2
C - - - - - 0x0148A7 05:8897: 20 DF 80  JSR sub_80DF
C - - - - - 0x0148AA 05:889A: 20 53 89  JSR sub_8953
C - - - - - 0x0148AD 05:889D: A9 02     LDA #con_music_menu
C - - - - - 0x0148AF 05:889F: 20 02 C0  JSR sub_0x01C2F4_play_sound
bra_88A2:
C - - - - - 0x0148B2 05:88A2: AD C9 05  LDA ram_счетчик_опций
C - - - - - 0x0148B5 05:88A5: 20 53 C0  JSR sub_0x01EC9F_jump_to_pointers_after_JSR
- D 0 - I - 0x0148B8 05:88A8: AC 88     .word ofs_88AC_00
- D 0 - I - 0x0148BA 05:88AA: BA 88     .word ofs_88BA_01



ofs_88AC_00:
C - - J - - 0x0148BC 05:88AC: AD B2 05  LDA ram_flag_brightness
C - - - - - 0x0148BF 05:88AF: 10 03     BPL bra_88B4
C - - - - - 0x0148C1 05:88B1: EE C9 05  INC ram_счетчик_опций
bra_88B4:
C - - - - - 0x0148C4 05:88B4: 20 5C C0  JSR sub_0x01D083
C - - - - - 0x0148C7 05:88B7: 4C CF 88  RTS



ofs_88BA_01:
C - - J - - 0x0148CA 05:88BA: A5 08     LDA ram_btn_press
C - - - - - 0x0148CC 05:88BC: 29 F0     AND #con_btns__ABSS
C - - - - - 0x0148CE 05:88BE: F0 0F     BEQ bra_88CF_RTS
C - - - - - 0x0148D0 05:88C0: A9 33     LDA #con_sfx_yes
C - - - - - 0x0148D2 05:88C2: 20 02 C0  JSR sub_0x01C2F4_play_sound
C - - - - - 0x0148D5 05:88C5: 20 44 C0  JSR sub_0x01D057
C - - - - - 0x0148D8 05:88C8: 20 4A C0  JSR sub_0x01D072
C - - - - - 0x0148DB 05:88CB: A9 04     LDA #$04
C - - - - - 0x0148DD 05:88CD: 85 59     STA ram_subscript
bra_88CF_RTS:
C D 0 - - - 0x0148DF 05:88CF: 60        RTS



sub_88D0:
C - - - - - 0x0148E0 05:88D0: AD CA 05  LDA ram_номер_опции
C - - - - - 0x0148E3 05:88D3: 29 03     AND #$03
C - - - - - 0x0148E5 05:88D5: 0A        ASL
C - - - - - 0x0148E6 05:88D6: A8        TAY
C - - - - - 0x0148E7 05:88D7: B9 2B 89  LDA tbl_892B,Y
C - - - - - 0x0148EA 05:88DA: 85 30     STA ram_0030
C - - - - - 0x0148EC 05:88DC: B9 2C 89  LDA tbl_892B + 1,Y
C - - - - - 0x0148EF 05:88DF: 85 31     STA ram_0031
C - - - - - 0x0148F1 05:88E1: A2 00     LDX #$00
bra_88E3_loop:
C - - - - - 0x0148F3 05:88E3: B9 3F 89  LDA tbl_893F,Y
C - - - - - 0x0148F6 05:88E6: 9D B9 06  STA ram_буфер_графики,X
C - - - - - 0x0148F9 05:88E9: E8        INX
C - - - - - 0x0148FA 05:88EA: 8A        TXA
C - - - - - 0x0148FB 05:88EB: 29 07     AND #$07
C - - - - - 0x0148FD 05:88ED: D0 01     BNE bra_88F0
C - - - - - 0x0148FF 05:88EF: C8        INY
bra_88F0:
C - - - - - 0x014900 05:88F0: E0 10     CPX #$10
C - - - - - 0x014902 05:88F2: 90 EF     BCC bra_88E3_loop
C - - - - - 0x014904 05:88F4: A0 02     LDY #$02
bra_88F6_loop:
C - - - - - 0x014906 05:88F6: B1 30     LDA (ram_0030),Y
C - - - - - 0x014908 05:88F8: 99 B6 06  STA ram_байт_2006_hi_графика,Y
C - - - - - 0x01490B 05:88FB: 88        DEY
C - - - - - 0x01490C 05:88FC: 10 F8     BPL bra_88F6_loop
C - - - - - 0x01490E 05:88FE: 60        RTS



sub_88FF:
C - - - - - 0x01490F 05:88FF: 84 44     STY ram_0044
C - - - - - 0x014911 05:8901: AD CA 05  LDA ram_номер_опции
C - - - - - 0x014914 05:8904: 29 03     AND #$03
C - - - - - 0x014916 05:8906: 0A        ASL
C - - - - - 0x014917 05:8907: A8        TAY
C - - - - - 0x014918 05:8908: B9 2B 89  LDA tbl_892B,Y
C - - - - - 0x01491B 05:890B: 85 30     STA ram_0030
C - - - - - 0x01491D 05:890D: B9 2C 89  LDA tbl_892B + 1,Y
C - - - - - 0x014920 05:8910: 85 31     STA ram_0031
C - - - - - 0x014922 05:8912: A2 00     LDX #$00
bra_8914_loop:
C - - - - - 0x014924 05:8914: A9 FF     LDA #$FF
C - - - - - 0x014926 05:8916: 9D 96 06  STA ram_буфер_атрибутов,X
C - - - - - 0x014929 05:8919: E8        INX
C - - - - - 0x01492A 05:891A: E0 10     CPX #$10
C - - - - - 0x01492C 05:891C: 90 F6     BCC bra_8914_loop
C - - - - - 0x01492E 05:891E: A0 02     LDY #$02
bra_8920_loop:
C - - - - - 0x014930 05:8920: B1 30     LDA (ram_0030),Y
C - - - - - 0x014932 05:8922: 99 93 06  STA ram_байт_2006_hi_атрибуты,Y
C - - - - - 0x014935 05:8925: 88        DEY
C - - - - - 0x014936 05:8926: 10 F8     BPL bra_8920_loop
C - - - - - 0x014938 05:8928: A4 44     LDY ram_0044
C - - - - - 0x01493A 05:892A: 60        RTS



tbl_892B:
- D 0 - - - 0x01493B 05:892B: 33 89     .word off_8933_00
- D 0 - - - 0x01493D 05:892D: 36 89     .word off_8936_01
- D 0 - - - 0x01493F 05:892F: 39 89     .word off_8939_02
- D 0 - - - 0x014941 05:8931: 3C 89     .word off_893C_03

off_8933_00:
- D 0 - I - 0x014943 05:8933: 23        .byte $23   ; 
- D 0 - I - 0x014944 05:8934: C8        .byte $C8   ; 
- D 0 - I - 0x014945 05:8935: 10        .byte $10   ; 

off_8936_01:
- D 0 - I - 0x014946 05:8936: 23        .byte $23   ; 
- D 0 - I - 0x014947 05:8937: D0        .byte $D0   ; 
- D 0 - I - 0x014948 05:8938: 10        .byte $10   ; 

off_8939_02:
- D 0 - I - 0x014949 05:8939: 23        .byte $23   ; 
- D 0 - I - 0x01494A 05:893A: D8        .byte $D8   ; 
- D 0 - I - 0x01494B 05:893B: 10        .byte $10   ; 

off_893C_03:
- D 0 - I - 0x01494C 05:893C: 23        .byte $23   ; 
- D 0 - I - 0x01494D 05:893D: E0        .byte $E0   ; 
- D 0 - I - 0x01494E 05:893E: 10        .byte $10   ; 



tbl_893F:
- D 0 - - - 0x01494F 05:893F: AA        .byte $AA   ; 
- D 0 - - - 0x014950 05:8940: FA        .byte $FA   ; 
- D 0 - - - 0x014951 05:8941: AF        .byte $AF   ; 
- D 0 - - - 0x014952 05:8942: FA        .byte $FA   ; 
- D 0 - - - 0x014953 05:8943: AF        .byte $AF   ; 
- D 0 - - - 0x014954 05:8944: AA        .byte $AA   ; 
- D 0 - - - 0x014955 05:8945: FF        .byte $FF   ; 
- D 0 - - - 0x014956 05:8946: AA        .byte $AA   ; 



sub_8947:
- - - - - - 0x014957 05:8947: 20 11 C0  JSR sub_0x01ECB9
- - - - - - 0x01495A 05:894A: 20 17 C0  JSR sub_0x01EE81_disable_NMI
- - - - - - 0x01495D 05:894D: 20 1D C0  JSR sub_0x01ECD1_скрыть_фон_и_спрайты_за_полоской_слева
- - - - - - 0x014960 05:8950: 4C 9E 89  JMP loc_899E



sub_8953:
C - - - - - 0x014963 05:8953: 20 11 C0  JSR sub_0x01ECB9
C - - - - - 0x014966 05:8956: 20 17 C0  JSR sub_0x01EE81_disable_NMI
C - - - - - 0x014969 05:8959: 20 1D C0  JSR sub_0x01ECD1_скрыть_фон_и_спрайты_за_полоской_слева
C - - - - - 0x01496C 05:895C: A2 00     LDX #$00
bra_895E_loop:
C - - - - - 0x01496E 05:895E: 8A        TXA
C - - - - - 0x01496F 05:895F: 0A        ASL
C - - - - - 0x014970 05:8960: A8        TAY
C - - - - - 0x014971 05:8961: B9 FA 89  LDA tbl_89FA,Y
C - - - - - 0x014974 05:8964: A8        TAY
C - - - - - 0x014975 05:8965: B9 3E 05  LDA ram_053E,Y
C - - - - - 0x014978 05:8968: 85 1C     STA ram_001C
C - - - - - 0x01497A 05:896A: 29 03     AND #$03
C - - - - - 0x01497C 05:896C: F0 2B     BEQ bra_8999
C - - - - - 0x01497E 05:896E: 85 1D     STA ram_001D
C - - - - - 0x014980 05:8970: 8A        TXA
C - - - - - 0x014981 05:8971: 0A        ASL
C - - - - - 0x014982 05:8972: A8        TAY
C - - - - - 0x014983 05:8973: AD 02 20  LDA $2002
C - - - - - 0x014986 05:8976: B9 E2 89  LDA tbl_89E1_ppu + 1,Y
C - - - - - 0x014989 05:8979: 8D 06 20  STA $2006
C - - - - - 0x01498C 05:897C: B9 E1 89  LDA tbl_89E1_ppu,Y
C - - - - - 0x01498F 05:897F: 8D 06 20  STA $2006
C - - - - - 0x014992 05:8982: A0 00     LDY #$00
bra_8984_loop:
C - - - - - 0x014994 05:8984: A5 1C     LDA ram_001C
C - - - - - 0x014996 05:8986: 10 05     BPL bra_898D
C - - - - - 0x014998 05:8988: A9 16     LDA #$16
C - - - - - 0x01499A 05:898A: 4C 8F 89  JMP loc_898F
bra_898D:
- - - - - - 0x01499D 05:898D: A9 17     LDA #$17
loc_898F:
C D 0 - - - 0x01499F 05:898F: 8D 07 20  STA $2007
C - - - - - 0x0149A2 05:8992: 06 1C     ASL ram_001C
C - - - - - 0x0149A4 05:8994: C8        INY
C - - - - - 0x0149A5 05:8995: C4 1D     CPY ram_001D
C - - - - - 0x0149A7 05:8997: 90 EB     BCC bra_8984_loop
bra_8999:
C - - - - - 0x0149A9 05:8999: E8        INX
C - - - - - 0x0149AA 05:899A: E0 0C     CPX #$0C
C - - - - - 0x0149AC 05:899C: 90 C0     BCC bra_895E_loop
loc_899E:
C - - - - - 0x0149AE 05:899E: AD 58 05  LDA ram_0558
C - - - - - 0x0149B1 05:89A1: 20 11 8A  JSR sub_8A11
C - - - - - 0x0149B4 05:89A4: A0 00     LDY #$00
C - - - - - 0x0149B6 05:89A6: 20 34 8A  JSR sub_8A34
C - - - - - 0x0149B9 05:89A9: AD 57 05  LDA ram_0557
C - - - - - 0x0149BC 05:89AC: 20 11 8A  JSR sub_8A11
C - - - - - 0x0149BF 05:89AF: A0 02     LDY #$02
C - - - - - 0x0149C1 05:89B1: 20 34 8A  JSR sub_8A34
C - - - - - 0x0149C4 05:89B4: AD 55 05  LDA ram_0555
C - - - - - 0x0149C7 05:89B7: 20 11 8A  JSR sub_8A11
C - - - - - 0x0149CA 05:89BA: A0 04     LDY #$04
C - - - - - 0x0149CC 05:89BC: 20 34 8A  JSR sub_8A34
C - - - - - 0x0149CF 05:89BF: 20 A5 B8  JSR sub_B8A5
C - - - - - 0x0149D2 05:89C2: 20 6D 8A  JSR sub_8A6D
C - - - - - 0x0149D5 05:89C5: 20 79 8A  JSR sub_8A79
C - - - - - 0x0149D8 05:89C8: A9 0C     LDA #$0C
C - - - - - 0x0149DA 05:89CA: 8D 95 06  STA ram_счетчик_буфера_атрибутов
C - - - - - 0x0149DD 05:89CD: A9 6B     LDA #< $236B
C - - - - - 0x0149DF 05:89CF: 8D 94 06  STA ram_байт_2006_lo_атрибуты
C - - - - - 0x0149E2 05:89D2: A9 23     LDA #> $236B
C - - - - - 0x0149E4 05:89D4: 8D 93 06  STA ram_байт_2006_hi_атрибуты
C - - - - - 0x0149E7 05:89D7: 20 6B C0  JSR sub_0x01EFBD_write_buffers_to_ppu
C - - - - - 0x0149EA 05:89DA: 20 1A C0  JSR sub_0x01ECDB_отобразить_фон_и_спрайты
C - - - - - 0x0149ED 05:89DD: 20 14 C0  JSR sub_0x01EE75_enable_NMI
C - - - - - 0x0149F0 05:89E0: 60        RTS



tbl_89E1_ppu:
- D 0 - - - 0x0149F1 05:89E1: EE 20     .word $20EE
- - - - - - 0x0149F3 05:89E3: 8E 21     .word $218E
- - - - - - 0x0149F5 05:89E5: 2E 22     .word $222E
- - - - - - 0x0149F7 05:89E7: CE 22     .word $22CE
- - - - - - 0x0149F9 05:89E9: F5 20     .word $20F5
- - - - - - 0x0149FB 05:89EB: 95 21     .word $2195
- - - - - - 0x0149FD 05:89ED: 35 22     .word $2235
- - - - - - 0x0149FF 05:89EF: D5 22     .word $22D5
- - - - - - 0x014A01 05:89F1: FA 20     .word $20FA
- - - - - - 0x014A03 05:89F3: 9A 21     .word $219A
- - - - - - 0x014A05 05:89F5: 3A 22     .word $223A
- - - - - - 0x014A07 05:89F7: DA 22     .word $22DA



tbl_89F9:
- D 0 - - - 0x014A09 05:89F9: 41        .byte $41   ; 
tbl_89FA:
- D 0 - - - 0x014A0A 05:89FA: 00        .byte $00   ; 
- D 0 - - - 0x014A0B 05:89FB: 07        .byte $07   ; 
- D 0 - - - 0x014A0C 05:89FC: 05        .byte $05   ; 
- D 0 - - - 0x014A0D 05:89FD: 0E        .byte $0E   ; 
- D 0 - - - 0x014A0E 05:89FE: 0A        .byte $0A   ; 
- D 0 - - - 0x014A0F 05:89FF: 4A        .byte $4A   ; 
- D 0 - - - 0x014A10 05:8A00: 07        .byte $07   ; 
- D 0 - - - 0x014A11 05:8A01: 43        .byte $43   ; 
- D 0 - - - 0x014A12 05:8A02: 02        .byte $02   ; 
- D 0 - - - 0x014A13 05:8A03: 45        .byte $45   ; 
- D 0 - - - 0x014A14 05:8A04: 03        .byte $03   ; 
- D 0 - - - 0x014A15 05:8A05: 0D        .byte $0D   ; 
- D 0 - - - 0x014A16 05:8A06: 09        .byte $09   ; 
- D 0 - - - 0x014A17 05:8A07: 0B        .byte $0B   ; 
- D 0 - - - 0x014A18 05:8A08: 08        .byte $08   ; 
- D 0 - - - 0x014A19 05:8A09: 02        .byte $02   ; 
- D 0 - - - 0x014A1A 05:8A0A: 01        .byte $01   ; 
- D 0 - - - 0x014A1B 05:8A0B: 46        .byte $46   ; 
- D 0 - - - 0x014A1C 05:8A0C: 04        .byte $04   ; 
- D 0 - - - 0x014A1D 05:8A0D: 4F        .byte $4F   ; 
- D 0 - - - 0x014A1E 05:8A0E: 0B        .byte $0B   ; 
- D 0 - - - 0x014A1F 05:8A0F: 09        .byte $09   ; 
- D 0 - - - 0x014A20 05:8A10: 06        .byte $06   ; 



sub_8A11:
C - - - - - 0x014A21 05:8A11: 85 30     STA ram_0030
C - - - - - 0x014A23 05:8A13: A9 00     LDA #$00
C - - - - - 0x014A25 05:8A15: 85 31     STA ram_0031
C - - - - - 0x014A27 05:8A17: 85 32     STA ram_0032
loc_8A19:
bra_8A19_loop:
C - - - - - 0x014A29 05:8A19: 38        SEC
C - - - - - 0x014A2A 05:8A1A: A5 30     LDA ram_0030
C - - - - - 0x014A2C 05:8A1C: E9 0A     SBC #$0A
C - - - - - 0x014A2E 05:8A1E: B0 01     BCS bra_8A21
C - - - - - 0x014A30 05:8A20: 60        RTS
bra_8A21:
C - - - - - 0x014A31 05:8A21: 85 30     STA ram_0030
C - - - - - 0x014A33 05:8A23: E6 31     INC ram_0031
C - - - - - 0x014A35 05:8A25: A5 31     LDA ram_0031
C - - - - - 0x014A37 05:8A27: C9 0A     CMP #$0A
C - - - - - 0x014A39 05:8A29: 90 EE     BCC bra_8A19_loop
- - - - - - 0x014A3B 05:8A2B: A9 00     LDA #$00
- - - - - - 0x014A3D 05:8A2D: 85 31     STA ram_0031
- - - - - - 0x014A3F 05:8A2F: E6 32     INC ram_0032
- - - - - - 0x014A41 05:8A31: 4C 19 8A  JMP loc_8A19



sub_8A34:
C - - - - - 0x014A44 05:8A34: AD 02 20  LDA $2002
C - - - - - 0x014A47 05:8A37: B9 68 8A  LDA tbl_8A67_ppu + 1,Y
C - - - - - 0x014A4A 05:8A3A: 8D 06 20  STA $2006
C - - - - - 0x014A4D 05:8A3D: B9 67 8A  LDA tbl_8A67_ppu,Y
C - - - - - 0x014A50 05:8A40: 8D 06 20  STA $2006
C - - - - - 0x014A53 05:8A43: A9 00     LDA #$00
C - - - - - 0x014A55 05:8A45: 85 21     STA ram_0021
C - - - - - 0x014A57 05:8A47: A5 30     LDA ram_0030
C - - - - - 0x014A59 05:8A49: 09 80     ORA #$80
C - - - - - 0x014A5B 05:8A4B: 85 30     STA ram_0030
C - - - - - 0x014A5D 05:8A4D: A0 02     LDY #$02
bra_8A4F_loop:
C - - - - - 0x014A5F 05:8A4F: B9 30 00  LDA ram_0030,Y
C - - - - - 0x014A62 05:8A52: D0 08     BNE bra_8A5C
C - - - - - 0x014A64 05:8A54: 24 21     BIT ram_0021
C - - - - - 0x014A66 05:8A56: 30 06     BMI bra_8A5E
C - - - - - 0x014A68 05:8A58: A9 02     LDA #$02
C - - - - - 0x014A6A 05:8A5A: D0 04     BNE bra_8A60
bra_8A5C:
C - - - - - 0x014A6C 05:8A5C: C6 21     DEC ram_0021
bra_8A5E:
C - - - - - 0x014A6E 05:8A5E: 09 80     ORA #$80
bra_8A60:
C - - - - - 0x014A70 05:8A60: 8D 07 20  STA $2007
C - - - - - 0x014A73 05:8A63: 88        DEY
C - - - - - 0x014A74 05:8A64: 10 E9     BPL bra_8A4F_loop
C - - - - - 0x014A76 05:8A66: 60        RTS

tbl_8A67_ppu:
- D 0 - - - 0x014A77 05:8A67: 2A 23     .word $232A
- D 0 - - - 0x014A79 05:8A69: 30 23     .word $2330
- D 0 - - - 0x014A7B 05:8A6B: 36 23     .word $2336



sub_8A6D:
C - - - - - 0x014A7D 05:8A6D: A0 09     LDY #$09
bra_8A6F_loop:
C - - - - - 0x014A7F 05:8A6F: B9 2C 00  LDA ram_002C,Y
C - - - - - 0x014A82 05:8A72: 99 6E 04  STA ram_046E,Y
C - - - - - 0x014A85 05:8A75: 88        DEY
C - - - - - 0x014A86 05:8A76: 10 F7     BPL bra_8A6F_loop
C - - - - - 0x014A88 05:8A78: 60        RTS



sub_8A79:
C - - - - - 0x014A89 05:8A79: A2 00     LDX #$00
C - - - - - 0x014A8B 05:8A7B: A0 00     LDY #$00
C - - - - - 0x014A8D 05:8A7D: A9 03     LDA #$03
C - - - - - 0x014A8F 05:8A7F: 85 1C     STA ram_001C
C - - - - - 0x014A91 05:8A81: 20 A8 8A  JSR sub_8AA8
C - - - - - 0x014A94 05:8A84: 20 B7 8A  JSR sub_8AB7
C - - - - - 0x014A97 05:8A87: A9 06     LDA #$06
C - - - - - 0x014A99 05:8A89: 85 1C     STA ram_001C
C - - - - - 0x014A9B 05:8A8B: 20 A8 8A  JSR sub_8AA8
C - - - - - 0x014A9E 05:8A8E: 20 B7 8A  JSR sub_8AB7
C - - - - - 0x014AA1 05:8A91: A9 0A     LDA #$0A
C - - - - - 0x014AA3 05:8A93: 85 1C     STA ram_001C
C - - - - - 0x014AA5 05:8A95: 20 A8 8A  JSR sub_8AA8
C - - - - - 0x014AA8 05:8A98: A9 0C     LDA #$0C
C - - - - - 0x014AAA 05:8A9A: 8D 95 06  STA ram_счетчик_буфера_атрибутов
C - - - - - 0x014AAD 05:8A9D: A9 6B     LDA #< $236B
C - - - - - 0x014AAF 05:8A9F: 8D 94 06  STA ram_байт_2006_lo_атрибуты
C - - - - - 0x014AB2 05:8AA2: A9 23     LDA #> $236B
C - - - - - 0x014AB4 05:8AA4: 8D 93 06  STA ram_байт_2006_hi_атрибуты
C - - - - - 0x014AB7 05:8AA7: 60        RTS



sub_8AA8:
bra_8AA8_loop:
C - - - - - 0x014AB8 05:8AA8: B9 6E 04  LDA ram_046E,Y
C - - - - - 0x014ABB 05:8AAB: 09 80     ORA #$80
C - - - - - 0x014ABD 05:8AAD: 9D 96 06  STA ram_буфер_атрибутов,X
C - - - - - 0x014AC0 05:8AB0: E8        INX
C - - - - - 0x014AC1 05:8AB1: C8        INY
C - - - - - 0x014AC2 05:8AB2: C4 1C     CPY ram_001C
C - - - - - 0x014AC4 05:8AB4: 90 F2     BCC bra_8AA8_loop
C - - - - - 0x014AC6 05:8AB6: 60        RTS



sub_8AB7:
C - - - - - 0x014AC7 05:8AB7: A9 FF     LDA #$FF
C - - - - - 0x014AC9 05:8AB9: 9D 96 06  STA ram_буфер_атрибутов,X
C - - - - - 0x014ACC 05:8ABC: E8        INX
C - - - - - 0x014ACD 05:8ABD: 60        RTS



ofs_80A3_05_выбор_команд:
C - - - - - 0x014ACE 05:8ABE: A5 59     LDA ram_subscript
C - - - - - 0x014AD0 05:8AC0: 30 06     BMI bra_8AC8
C - - - - - 0x014AD2 05:8AC2: 20 DF 80  JSR sub_80DF
C - - - - - 0x014AD5 05:8AC5: 20 D5 8A  JSR sub_8AD5
bra_8AC8:
C - - - - - 0x014AD8 05:8AC8: 20 73 8C  JSR sub_8C73
C - - - - - 0x014ADB 05:8ACB: AD C9 05  LDA ram_счетчик_опций
C - - - - - 0x014ADE 05:8ACE: 20 53 C0  JSR sub_0x01EC9F_jump_to_pointers_after_JSR
- D 0 - I - 0x014AE1 05:8AD1: 6E 8B     .word ofs_8B6E_00
- D 0 - I - 0x014AE3 05:8AD3: 80 8B     .word ofs_8B80_01



sub_8AD5:
C - - - - - 0x014AE5 05:8AD5: A9 00     LDA #$00
C - - - - - 0x014AE7 05:8AD7: 8D CA 05  STA ram_номер_опции
C - - - - - 0x014AEA 05:8ADA: 8D 80 00  STA ram_animation_id_ball
C - - - - - 0x014AED 05:8ADD: A9 06     LDA #$06
C - - - - - 0x014AEF 05:8ADF: 8D CB 05  STA ram_номер_опции + 1
C - - - - - 0x014AF2 05:8AE2: A9 05     LDA #$05
C - - - - - 0x014AF4 05:8AE4: 8D 63 00  STA ram_0063
C - - - - - 0x014AF7 05:8AE7: 8D 64 00  STA ram_0064
C - - - - - 0x014AFA 05:8AEA: A9 01     LDA #$01
C - - - - - 0x014AFC 05:8AEC: 8D 6D 00  STA ram_006D
C - - - - - 0x014AFF 05:8AEF: 8D AE 05  STA ram_palette_id_spr
C - - - - - 0x014B02 05:8AF2: A2 08     LDX #$08
C - - - - - 0x014B04 05:8AF4: 8E B8 05  STX ram_банк_спрайтов
C - - - - - 0x014B07 05:8AF7: E8        INX
C - - - - - 0x014B08 05:8AF8: 8E BB 05  STX ram_банк_спрайтов + 3
C - - - - - 0x014B0B 05:8AFB: 20 38 BD  JSR sub_BD38_рожи
C - - - - - 0x014B0E 05:8AFE: 20 B0 BD  JSR sub_BDB0
C - - - - - 0x014B11 05:8B01: 20 0B C0  JSR sub_0x01EEAA_базовые_банки_спрайтов
C - - - - - 0x014B14 05:8B04: A2 00     LDX #$00
bra_8B06:
C - - - - - 0x014B16 05:8B06: A9 00     LDA #$00
C - - - - - 0x014B18 05:8B08: 9D 61 00  STA ram_0061,X
C - - - - - 0x014B1B 05:8B0B: 9D 27 03  STA ram_pos_X_hi_player,X
C - - - - - 0x014B1E 05:8B0E: 9D 60 03  STA ram_pos_Y_hi_player,X
C - - - - - 0x014B21 05:8B11: 9D 86 03  STA ram_pos_Z_lo_player,X
C - - - - - 0x014B24 05:8B14: 9D 99 03  STA ram_pos_Z_hi_player,X
C - - - - - 0x014B27 05:8B17: 9D E8 03  STA ram_spd_X_lo_player,X
C - - - - - 0x014B2A 05:8B1A: 9D F6 03  STA ram_spd_X_hi_player,X
C - - - - - 0x014B2D 05:8B1D: 9D 04 04  STA ram_spd_Y_lo_player,X
C - - - - - 0x014B30 05:8B20: 9D 12 04  STA ram_spd_Y_hi_player,X
C - - - - - 0x014B33 05:8B23: 9D 20 04  STA ram_spd_Z_lo_player,X
C - - - - - 0x014B36 05:8B26: 9D 2E 04  STA ram_spd_Z_hi_player,X
C - - - - - 0x014B39 05:8B29: A9 FF     LDA #$FF
C - - - - - 0x014B3B 05:8B2B: 9D 79 04  STA ram_action_id_player,X
C - - - - - 0x014B3E 05:8B2E: A9 01     LDA #$01
C - - - - - 0x014B40 05:8B30: 9D 59 04  STA ram_movement_id_player,X
C - - - - - 0x014B43 05:8B33: 8A        TXA
C - - - - - 0x014B44 05:8B34: 0A        ASL
C - - - - - 0x014B45 05:8B35: A8        TAY
C - - - - - 0x014B46 05:8B36: B9 7C 8B  LDA tbl_8B7C,Y
C - - - - - 0x014B49 05:8B39: 9D 14 03  STA ram_pos_X_lo_player,X
C - - - - - 0x014B4C 05:8B3C: B9 7D 8B  LDA tbl_8B7D,Y
C - - - - - 0x014B4F 05:8B3F: 9D 4D 03  STA ram_pos_Y_lo_player,X
C - - - - - 0x014B52 05:8B42: E8        INX
C - - - - - 0x014B53 05:8B43: E0 02     CPX #$02
C - - - - - 0x014B55 05:8B45: 90 BF     BCC bra_8B06
C - - - - - 0x014B57 05:8B47: A9 00     LDA #$00
C - - - - - 0x014B59 05:8B49: 8D D6 04  STA ram_игрок_с_мячом
C - - - - - 0x014B5C 05:8B4C: 8D A3 04  STA ram_направление_движения
C - - - - - 0x014B5F 05:8B4F: A9 80     LDA #$80
C - - - - - 0x014B61 05:8B51: 8D A4 04  STA ram_направление_движения + 1
C - - - - - 0x014B64 05:8B54: 8D 20 03  STA ram_pos_X_lo_ball
C - - - - - 0x014B67 05:8B57: A9 D0     LDA #$D0
C - - - - - 0x014B69 05:8B59: 8D 59 03  STA ram_pos_Y_lo_ball
C - - - - - 0x014B6C 05:8B5C: A9 00     LDA #$00
C - - - - - 0x014B6E 05:8B5E: 8D 33 03  STA ram_pos_X_hi_ball
C - - - - - 0x014B71 05:8B61: 8D 6C 03  STA ram_pos_Y_hi_ball
C - - - - - 0x014B74 05:8B64: 8D 92 03  STA ram_pos_Z_lo_ball
C - - - - - 0x014B77 05:8B67: 8D A5 03  STA ram_pos_Z_hi_ball
C - - - - - 0x014B7A 05:8B6A: 20 0A 8D  JSR sub_8D0A
C - - - - - 0x014B7D 05:8B6D: 60        RTS



ofs_8B6E_00:
C - - J - - 0x014B7E 05:8B6E: AD B2 05  LDA ram_flag_brightness
C - - - - - 0x014B81 05:8B71: 10 03     BPL bra_8B76
C - - - - - 0x014B83 05:8B73: EE C9 05  INC ram_счетчик_опций
bra_8B76:
C - - - - - 0x014B86 05:8B76: 20 5C C0  JSR sub_0x01D083
C - - - - - 0x014B89 05:8B79: 4C 2D 8C  JMP loc_8C2D



tbl_8B7C:
- D 0 - - - 0x014B8C 05:8B7C: 40        .byte $40   ; 
tbl_8B7D:
- D 0 - - - 0x014B8D 05:8B7D: D0        .byte $D0   ; 
- D 0 - - - 0x014B8E 05:8B7E: C0        .byte $C0   ; 
- D 0 - - - 0x014B8F 05:8B7F: D0        .byte $D0   ; 



ofs_8B80_01:
C - - J - - 0x014B90 05:8B80: A5 57     LDA ram_option_mode_difficulty
C - - - - - 0x014B92 05:8B82: 29 20     AND #con_gm_penalty
C - - - - - 0x014B94 05:8B84: F0 13     BEQ bra_8B99
C - - - - - 0x014B96 05:8B86: A5 5D     LDA ram_players_cnt
C - - - - - 0x014B98 05:8B88: C9 01     CMP #$01
C - - - - - 0x014B9A 05:8B8A: D0 0D     BNE bra_8B99
C - - - - - 0x014B9C 05:8B8C: A9 00     LDA #$00
C - - - - - 0x014B9E 05:8B8E: 85 09     STA ram_btn_press + 1
C - - - - - 0x014BA0 05:8B90: AD CA 05  LDA ram_номер_опции
C - - - - - 0x014BA3 05:8B93: 10 04     BPL bra_8B99
C - - - - - 0x014BA5 05:8B95: A5 08     LDA ram_btn_press
C - - - - - 0x014BA7 05:8B97: 85 09     STA ram_btn_press + 1
bra_8B99:
C - - - - - 0x014BA9 05:8B99: A0 00     LDY #$00
C - - - - - 0x014BAB 05:8B9B: A2 02     LDX #$02
loc_8B9D:
C D 0 - - - 0x014BAD 05:8B9D: 8C CC 05  STY ram_счетчик_смен
C - - - - - 0x014BB0 05:8BA0: AD CA 05  LDA ram_номер_опции
C - - - - - 0x014BB3 05:8BA3: 2D CB 05  AND ram_номер_опции + 1
C - - - - - 0x014BB6 05:8BA6: 30 1D     BMI bra_8BC5
C - - - - - 0x014BB8 05:8BA8: 20 7E 81  JSR sub_817E_конвертация_нажатых_кнопок_в_индекс
C - - - - - 0x014BBB 05:8BAB: 20 53 C0  JSR sub_0x01EC9F_jump_to_pointers_after_JSR
- D 0 - I - 0x014BBE 05:8BAE: 16 8C     .word ofs_8C16_00_nothing
- D 0 - I - 0x014BC0 05:8BB0: C0 8B     .word ofs_8BC0_01_Start
- - - - - - 0x014BC2 05:8BB2: 16 8C     .word ofs_8C16_02_Select
- D 0 - I - 0x014BC4 05:8BB4: CE 8B     .word ofs_8BCE_03_A
- D 0 - I - 0x014BC6 05:8BB6: EB 8B     .word ofs_8BEB_04_B
- D 0 - I - 0x014BC8 05:8BB8: 06 8C     .word ofs_8C06_05_Up
- D 0 - I - 0x014BCA 05:8BBA: 06 8C     .word ofs_8C06_06_Down
- D 0 - I - 0x014BCC 05:8BBC: 06 8C     .word ofs_8C06_07_Left
- D 0 - I - 0x014BCE 05:8BBE: 06 8C     .word ofs_8C06_08_Right



ofs_8BC0_01_Start:
C - - J - - 0x014BD0 05:8BC0: A9 33     LDA #con_sfx_yes
C - - - - - 0x014BD2 05:8BC2: 20 02 C0  JSR sub_0x01C2F4_play_sound
bra_8BC5:
C - - - - - 0x014BD5 05:8BC5: 20 C6 8C  JSR sub_8CC6
C - - - - - 0x014BD8 05:8BC8: 20 EE 8C  JSR sub_8CEE
C - - - - - 0x014BDB 05:8BCB: 4C 2D 8C  JMP loc_8C2D



ofs_8BCE_03_A:
C - - J - - 0x014BDE 05:8BCE: AC CC 05  LDY ram_счетчик_смен
C - - - - - 0x014BE1 05:8BD1: B9 CA 05  LDA ram_номер_опции,Y
C - - - - - 0x014BE4 05:8BD4: 30 40     BMI bra_8C16
C - - - - - 0x014BE6 05:8BD6: A9 33     LDA #con_sfx_yes
C - - - - - 0x014BE8 05:8BD8: 20 02 C0  JSR sub_0x01C2F4_play_sound
C - - - - - 0x014BEB 05:8BDB: B9 CA 05  LDA ram_номер_опции,Y
C - - - - - 0x014BEE 05:8BDE: 09 80     ORA #$80
C - - - - - 0x014BF0 05:8BE0: 99 CA 05  STA ram_номер_опции,Y
C - - - - - 0x014BF3 05:8BE3: A9 00     LDA #$00
C - - - - - 0x014BF5 05:8BE5: 20 B0 82  JSR sub_82B0
C - - - - - 0x014BF8 05:8BE8: 4C 16 8C  JMP loc_8C16



ofs_8BEB_04_B:
C - - J - - 0x014BFB 05:8BEB: A9 34     LDA #con_sfx_no
C - - - - - 0x014BFD 05:8BED: 20 02 C0  JSR sub_0x01C2F4_play_sound
C - - - - - 0x014C00 05:8BF0: AC CC 05  LDY ram_счетчик_смен
C - - - - - 0x014C03 05:8BF3: B9 CA 05  LDA ram_номер_опции,Y
C - - - - - 0x014C06 05:8BF6: 10 1E     BPL bra_8C16
- - - - - - 0x014C08 05:8BF8: B9 CA 05  LDA ram_номер_опции,Y
- - - - - - 0x014C0B 05:8BFB: 29 7F     AND #$7F
- - - - - - 0x014C0D 05:8BFD: 99 CA 05  STA ram_номер_опции,Y
- - - - - - 0x014C10 05:8C00: 20 EF 82  JSR sub_82AF
- - - - - - 0x014C13 05:8C03: 4C 16 8C  JMP loc_8C16



ofs_8C06_05_Up:
ofs_8C06_06_Down:
ofs_8C06_07_Left:
ofs_8C06_08_Right:
C - - J - - 0x014C16 05:8C06: AC CC 05  LDY ram_счетчик_смен
C - - - - - 0x014C19 05:8C09: B9 CA 05  LDA ram_номер_опции,Y
C - - - - - 0x014C1C 05:8C0C: 30 08     BMI bra_8C16
C - - - - - 0x014C1E 05:8C0E: A9 32     LDA #con_sfx_move_cursor
C - - - - - 0x014C20 05:8C10: 20 02 C0  JSR sub_0x01C2F4_play_sound
C - - - - - 0x014C23 05:8C13: 20 DD 81  JSR sub_81DD
bra_8C16:
loc_8C16:
ofs_8C16_00_nothing:
ofs_8C16_02_Select:
C D 0 J - - 0x014C26 05:8C16: 20 2A 82  JSR sub_822A
C - - - - - 0x014C29 05:8C19: A9 0D     LDA #$0D
C - - - - - 0x014C2B 05:8C1B: 20 8D 82  JSR sub_828D
C - - - - - 0x014C2E 05:8C1E: 20 65 C0  JSR sub_0x01EB9C
C - - - - - 0x014C31 05:8C21: E8        INX
C - - - - - 0x014C32 05:8C22: AC CC 05  LDY ram_счетчик_смен
C - - - - - 0x014C35 05:8C25: C8        INY
C - - - - - 0x014C36 05:8C26: C0 02     CPY #$02
C - - - - - 0x014C38 05:8C28: B0 03     BCS bra_8C2D
C - - - - - 0x014C3A 05:8C2A: 4C 9D 8B  JMP loc_8B9D
bra_8C2D:
loc_8C2D:
C - - - - - 0x014C40 05:8C30: 20 41 80  JSR sub_0x01C297
C - - - - - 0x014C43 05:8C33: 20 14 80  JSR sub_0x01C2AE
C - - - - - 0x014C46 05:8C36: 20 0B C0  JSR sub_0x01EEAA_базовые_банки_спрайтов
C - - - - - 0x014C49 05:8C39: AD 66 00  LDA ram_0066
C - - - - - 0x014C4C 05:8C3C: 8D B9 05  STA ram_банк_спрайтов + 1
C - - - - - 0x014C4F 05:8C3F: AD 67 00  LDA ram_0067
C - - - - - 0x014C52 05:8C42: 8D BA 05  STA ram_банк_спрайтов + 2
C - - - - - 0x014C55 05:8C45: 20 38 BD  JSR sub_BD38_рожи
C - - - - - 0x014C58 05:8C48: AD 66 00  LDA ram_0066
C - - - - - 0x014C5B 05:8C4B: 48        PHA
C - - - - - 0x014C5C 05:8C4C: AD 67 00  LDA ram_0067
C - - - - - 0x014C5F 05:8C4F: 48        PHA
C - - - - - 0x014C60 05:8C50: AD B9 05  LDA ram_банк_спрайтов + 1
C - - - - - 0x014C63 05:8C53: 8D 66 00  STA ram_0066
C - - - - - 0x014C66 05:8C56: AD BA 05  LDA ram_банк_спрайтов + 2
C - - - - - 0x014C69 05:8C59: 8D 67 00  STA ram_0067
C - - - - - 0x014C6C 05:8C5C: 68        PLA
C - - - - - 0x014C6D 05:8C5D: 8D BA 05  STA ram_банк_спрайтов + 2
C - - - - - 0x014C70 05:8C60: 68        PLA
C - - - - - 0x014C71 05:8C61: 8D B9 05  STA ram_банк_спрайтов + 1
C - - - - - 0x014C74 05:8C64: 20 C6 8C  JSR sub_8CC6
C - - - - - 0x014C77 05:8C67: 20 B0 BD  JSR sub_BDB0
C - - - - - 0x014C7A 05:8C6A: 20 6E C0  JSR sub_0x01D0E5_запись_палитры_в_буфер_с_учетом_яркости
C - - - - - 0x014C7D 05:8C6D: A9 3F     LDA #$3F
C - - - - - 0x014C7F 05:8C6F: 8D D9 06  STA ram_байт_2006_hi_палитра
C - - - - - 0x014C82 05:8C72: 60        RTS



sub_8C73:
C - - - - - 0x014C83 05:8C73: 20 05 82  JSR sub_8205_read_pointers_after_JSR
- D 0 - I - 0x014C86 05:8C76: AE 8C     .word off_8CAE_00
- D 0 - I - 0x014C88 05:8C78: 7E 8C     .word off_8C7E_01
- D 0 - I - 0x014C8A 05:8C7A: AE 8C     .word off_8CAE_02
- D 0 - I - 0x014C8C 05:8C7C: 7E 8C     .word off_8C7E_03

off_8C7E_01:
off_8C7E_03:
- D 0 - I - 0x014C8E 05:8C7E: 05        .byte $05   ; 
- D 0 - I - 0x014C8F 05:8C7F: 01        .byte $01   ; 
- D 0 - I - 0x014C90 05:8C80: 05        .byte $05   ; 
- D 0 - I - 0x014C91 05:8C81: 01        .byte $01   ; 
- D 0 - I - 0x014C92 05:8C82: 00        .byte $00   ; 
- D 0 - I - 0x014C93 05:8C83: 02        .byte $02   ; 
- D 0 - I - 0x014C94 05:8C84: 00        .byte $00   ; 
- D 0 - I - 0x014C95 05:8C85: 02        .byte $02   ; 
- D 0 - I - 0x014C96 05:8C86: 01        .byte $01   ; 
- D 0 - I - 0x014C97 05:8C87: 03        .byte $03   ; 
- D 0 - I - 0x014C98 05:8C88: 01        .byte $01   ; 
- D 0 - I - 0x014C99 05:8C89: 03        .byte $03   ; 
- D 0 - I - 0x014C9A 05:8C8A: 02        .byte $02   ; 
- D 0 - I - 0x014C9B 05:8C8B: 04        .byte $04   ; 
- - - - - - 0x014C9C 05:8C8C: 02        .byte $02   ; 
- D 0 - I - 0x014C9D 05:8C8D: 04        .byte $04   ; 
- D 0 - I - 0x014C9E 05:8C8E: 03        .byte $03   ; 
- D 0 - I - 0x014C9F 05:8C8F: 05        .byte $05   ; 
- - - - - - 0x014CA0 05:8C90: 03        .byte $03   ; 
- D 0 - I - 0x014CA1 05:8C91: 05        .byte $05   ; 
- D 0 - I - 0x014CA2 05:8C92: 04        .byte $04   ; 
- D 0 - I - 0x014CA3 05:8C93: 00        .byte $00   ; 
- D 0 - I - 0x014CA4 05:8C94: 04        .byte $04   ; 
- D 0 - I - 0x014CA5 05:8C95: 00        .byte $00   ; 
- D 0 - I - 0x014CA6 05:8C96: 0B        .byte $0B   ; 
- D 0 - I - 0x014CA7 05:8C97: 07        .byte $07   ; 
- D 0 - I - 0x014CA8 05:8C98: 0B        .byte $0B   ; 
- D 0 - I - 0x014CA9 05:8C99: 07        .byte $07   ; 
- D 0 - I - 0x014CAA 05:8C9A: 06        .byte $06   ; 
- D 0 - I - 0x014CAB 05:8C9B: 08        .byte $08   ; 
- D 0 - I - 0x014CAC 05:8C9C: 06        .byte $06   ; 
- D 0 - I - 0x014CAD 05:8C9D: 08        .byte $08   ; 
- D 0 - I - 0x014CAE 05:8C9E: 07        .byte $07   ; 
- D 0 - I - 0x014CAF 05:8C9F: 09        .byte $09   ; 
- D 0 - I - 0x014CB0 05:8CA0: 07        .byte $07   ; 
- D 0 - I - 0x014CB1 05:8CA1: 09        .byte $09   ; 
- D 0 - I - 0x014CB2 05:8CA2: 08        .byte $08   ; 
- D 0 - I - 0x014CB3 05:8CA3: 0A        .byte $0A   ; 
- D 0 - I - 0x014CB4 05:8CA4: 08        .byte $08   ; 
- D 0 - I - 0x014CB5 05:8CA5: 0A        .byte $0A   ; 
- D 0 - I - 0x014CB6 05:8CA6: 09        .byte $09   ; 
- D 0 - I - 0x014CB7 05:8CA7: 0B        .byte $0B   ; 
- D 0 - I - 0x014CB8 05:8CA8: 09        .byte $09   ; 
- D 0 - I - 0x014CB9 05:8CA9: 0B        .byte $0B   ; 
- D 0 - I - 0x014CBA 05:8CAA: 0A        .byte $0A   ; 
- D 0 - I - 0x014CBB 05:8CAB: 06        .byte $06   ; 
- D 0 - I - 0x014CBC 05:8CAC: 0A        .byte $0A   ; 
- D 0 - I - 0x014CBD 05:8CAD: 06        .byte $06   ; 



off_8CAE_00:
off_8CAE_02:
- D 0 - I - 0x014CBE 05:8CAE: 06        .byte $06   ; 
- D 0 - I - 0x014CBF 05:8CAF: 08        .byte $08   ; 
- D 0 - I - 0x014CC0 05:8CB0: 06        .byte $06   ; 
- D 0 - I - 0x014CC1 05:8CB1: 0A        .byte $0A   ; 
- D 0 - I - 0x014CC2 05:8CB2: 06        .byte $06   ; 
- D 0 - I - 0x014CC3 05:8CB3: 0C        .byte $0C   ; 
- D 0 - I - 0x014CC4 05:8CB4: 06        .byte $06   ; 
- D 0 - I - 0x014CC5 05:8CB5: 0E        .byte $0E   ; 
- D 0 - I - 0x014CC6 05:8CB6: 06        .byte $06   ; 
- D 0 - I - 0x014CC7 05:8CB7: 10        .byte $10   ; 
- D 0 - I - 0x014CC8 05:8CB8: 06        .byte $06   ; 
- D 0 - I - 0x014CC9 05:8CB9: 12        .byte $12   ; 
- D 0 - I - 0x014CCA 05:8CBA: 13        .byte $13   ; 
- D 0 - I - 0x014CCB 05:8CBB: 08        .byte $08   ; 
- D 0 - I - 0x014CCC 05:8CBC: 13        .byte $13   ; 
- D 0 - I - 0x014CCD 05:8CBD: 0A        .byte $0A   ; 
- D 0 - I - 0x014CCE 05:8CBE: 13        .byte $13   ; 
- D 0 - I - 0x014CCF 05:8CBF: 0C        .byte $0C   ; 
- D 0 - I - 0x014CD0 05:8CC0: 13        .byte $13   ; 
- D 0 - I - 0x014CD1 05:8CC1: 0E        .byte $0E   ; 
- D 0 - I - 0x014CD2 05:8CC2: 13        .byte $13   ; 
- D 0 - I - 0x014CD3 05:8CC3: 10        .byte $10   ; 
- D 0 - I - 0x014CD4 05:8CC4: 13        .byte $13   ; 
- D 0 - I - 0x014CD5 05:8CC5: 12        .byte $12   ; 



sub_8CC6:
C - - - - - 0x014CD6 05:8CC6: A2 00     LDX #$00
bra_8CC8_loop:
C - - - - - 0x014CD8 05:8CC8: BD CA 05  LDA ram_номер_опции,X
C - - - - - 0x014CDB 05:8CCB: 29 0F     AND #$0F
C - - - - - 0x014CDD 05:8CCD: A8        TAY
C - - - - - 0x014CDE 05:8CCE: B9 FE 8C  LDA tbl_8CFE,Y
C - - - - - 0x014CE1 05:8CD1: 9D 2C 05  STA ram_номер_команды,X
C - - - - - 0x014CE4 05:8CD4: E8        INX
C - - - - - 0x014CE5 05:8CD5: E0 02     CPX #$02
C - - - - - 0x014CE7 05:8CD7: 90 EF     BCC bra_8CC8_loop
C - - - - - 0x014CE9 05:8CD9: A5 57     LDA ram_option_mode_difficulty
C - - - - - 0x014CEB 05:8CDB: 29 20     AND #con_gm_penalty
C - - - - - 0x014CED 05:8CDD: F0 0E     BEQ bra_8CED_RTS
C - - - - - 0x014CEF 05:8CDF: A5 5D     LDA ram_players_cnt
C - - - - - 0x014CF1 05:8CE1: C9 01     CMP #$01
C - - - - - 0x014CF3 05:8CE3: D0 08     BNE bra_8CED_RTS
C - - - - - 0x014CF5 05:8CE5: AD 2D 05  LDA ram_номер_команды + 1
C - - - - - 0x014CF8 05:8CE8: 09 80     ORA #$80
C - - - - - 0x014CFA 05:8CEA: 8D 2D 05  STA ram_номер_команды + 1
bra_8CED_RTS:
C - - - - - 0x014CFD 05:8CED: 60        RTS



sub_8CEE:
C - - - - - 0x014CFE 05:8CEE: 20 44 C0  JSR sub_0x01D057
C - - - - - 0x014D01 05:8CF1: 20 4A C0  JSR sub_0x01D072
C - - - - - 0x014D04 05:8CF4: A9 00     LDA #$00
C - - - - - 0x014D06 05:8CF6: 8D CC 05  STA ram_счетчик_смен
C - - - - - 0x014D09 05:8CF9: A9 06     LDA #$06
C - - - - - 0x014D0B 05:8CFB: 85 59     STA ram_subscript
C - - - - - 0x014D0D 05:8CFD: 60        RTS



tbl_8CFE:
- D 0 - - - 0x014D0E 05:8CFE: 00        .byte $00   ; 
- D 0 - - - 0x014D0F 05:8CFF: 0B        .byte $0B   ; 
- D 0 - - - 0x014D10 05:8D00: 09        .byte $09   ; 
- D 0 - - - 0x014D11 05:8D01: 0E        .byte $0E   ; 
- D 0 - - - 0x014D12 05:8D02: 0D        .byte $0D   ; 
- D 0 - - - 0x014D13 05:8D03: 07        .byte $07   ; 
- D 0 - - - 0x014D14 05:8D04: 00        .byte $00   ; 
- D 0 - - - 0x014D15 05:8D05: 0B        .byte $0B   ; 
- D 0 - - - 0x014D16 05:8D06: 09        .byte $09   ; 
- D 0 - - - 0x014D17 05:8D07: 0E        .byte $0E   ; 
- D 0 - - - 0x014D18 05:8D08: 0D        .byte $0D   ; 
- D 0 - - - 0x014D19 05:8D09: 07        .byte $07   ; 



sub_8D0A:
C - - - - - 0x014D1A 05:8D0A: 20 11 C0  JSR sub_0x01ECB9
C - - - - - 0x014D1D 05:8D0D: 20 17 C0  JSR sub_0x01EE81_disable_NMI
C - - - - - 0x014D20 05:8D10: 20 1D C0  JSR sub_0x01ECD1_скрыть_фон_и_спрайты_за_полоской_слева
C - - - - - 0x014D23 05:8D13: 24 57     BIT ram_option_mode_difficulty
C - - - - - 0x014D25 05:8D15: 70 0B     BVS bra_8D22_minibattle
C - - - - - 0x014D27 05:8D17: A0 04     LDY #$04
bra_8D19_loop:
C - - - - - 0x014D29 05:8D19: B9 61 8D  LDA tbl_8D61,Y
C - - - - - 0x014D2C 05:8D1C: 99 93 06  STA ram_байт_2006_hi_атрибуты,Y
C - - - - - 0x014D2F 05:8D1F: 88        DEY
C - - - - - 0x014D30 05:8D20: 10 F7     BPL bra_8D19_loop
bra_8D22_minibattle:
C - - - - - 0x014D32 05:8D22: A5 5D     LDA ram_players_cnt
C - - - - - 0x014D34 05:8D24: 09 80     ORA #$80
C - - - - - 0x014D36 05:8D26: 8D B9 06  STA ram_буфер_графики
C - - - - - 0x014D39 05:8D29: A0 02     LDY #$02
bra_8D2B_loop:
C - - - - - 0x014D3B 05:8D2B: B9 66 8D  LDA tbl_8D66,Y
C - - - - - 0x014D3E 05:8D2E: 99 B6 06  STA ram_байт_2006_hi_графика,Y
C - - - - - 0x014D41 05:8D31: 88        DEY
C - - - - - 0x014D42 05:8D32: 10 F7     BPL bra_8D2B_loop
C - - - - - 0x014D44 05:8D34: A5 5D     LDA ram_players_cnt
C - - - - - 0x014D46 05:8D36: 0A        ASL
C - - - - - 0x014D47 05:8D37: A8        TAY
C - - - - - 0x014D48 05:8D38: B9 69 8D  LDA tbl_8D69,Y
C - - - - - 0x014D4B 05:8D3B: 85 2C     STA ram_002C
C - - - - - 0x014D4D 05:8D3D: B9 6A 8D  LDA tbl_8D69 + 1,Y
C - - - - - 0x014D50 05:8D40: 85 2D     STA ram_002D
C - - - - - 0x014D52 05:8D42: A0 02     LDY #$02
C - - - - - 0x014D54 05:8D44: B1 2C     LDA (ram_002C),Y
C - - - - - 0x014D56 05:8D46: 18        CLC
C - - - - - 0x014D57 05:8D47: 69 03     ADC #$03
C - - - - - 0x014D59 05:8D49: A8        TAY
bra_8D4A_loop:
C - - - - - 0x014D5A 05:8D4A: B1 2C     LDA (ram_002C),Y
C - - - - - 0x014D5C 05:8D4C: 99 D9 06  STA ram_байт_2006_hi_палитра,Y
C - - - - - 0x014D5F 05:8D4F: 88        DEY
C - - - - - 0x014D60 05:8D50: 10 F8     BPL bra_8D4A_loop
C - - - - - 0x014D62 05:8D52: 20 6B C0  JSR sub_0x01EFBD_write_buffers_to_ppu
C - - - - - 0x014D65 05:8D55: 20 1A C0  JSR sub_0x01ECDB_отобразить_фон_и_спрайты
C - - - - - 0x014D68 05:8D58: 20 14 C0  JSR sub_0x01EE75_enable_NMI
C - - - - - 0x014D6B 05:8D5B: A9 02     LDA #con_music_menu
C - - - - - 0x014D6D 05:8D5D: 20 02 C0  JSR sub_0x01C2F4_play_sound
C - - - - - 0x014D70 05:8D60: 60        RTS



tbl_8D61:
- D 0 - - - 0x014D71 05:8D61: 20        .byte $20   ; 
- D 0 - - - 0x014D72 05:8D62: 6A        .byte $6A   ; 
- D 0 - - - 0x014D73 05:8D63: 02        .byte $02   ; 
- D 0 - - - 0x014D74 05:8D64: 9D        .byte $9D   ; 
- D 0 - - - 0x014D75 05:8D65: 9F        .byte $9F   ; 



tbl_8D66:
- D 0 - - - 0x014D76 05:8D66: 20        .byte $20   ; 
- D 0 - - - 0x014D77 05:8D67: 74        .byte $74   ; 
- D 0 - - - 0x014D78 05:8D68: 01        .byte $01   ; 



tbl_8D69:
- - - - - - 0x014D79 05:8D69: 73 8D     .word off_8D73_00
- D 0 - - - 0x014D7B 05:8D6B: 73 8D     .word off_8D73_01
- D 0 - - - 0x014D7D 05:8D6D: 85 8D     .word off_8D85_02
- D 0 - - - 0x014D7F 05:8D6F: 97 8D     .word off_8D97_03
- D 0 - - - 0x014D81 05:8D71: A9 8D     .word off_8DA9_04

off_8D73_00:
off_8D73_01:
- D 0 - I - 0x014D83 05:8D73: 20        .byte $20   ; 
- D 0 - I - 0x014D84 05:8D74: CA        .byte $CA   ; 
- D 0 - I - 0x014D85 05:8D75: 0F        .byte $0F   ; 
- D 0 - I - 0x014D86 05:8D76: 02        .byte $02   ; 
- D 0 - I - 0x014D87 05:8D77: 02        .byte $02   ; 
- D 0 - I - 0x014D88 05:8D78: 02        .byte $02   ; 
- D 0 - I - 0x014D89 05:8D79: 02        .byte $02   ; 
- D 0 - I - 0x014D8A 05:8D7A: 02        .byte $02   ; 
- D 0 - I - 0x014D8B 05:8D7B: 02        .byte $02   ; 
- D 0 - I - 0x014D8C 05:8D7C: 02        .byte $02   ; 
- D 0 - I - 0x014D8D 05:8D7D: 02        .byte $02   ; 
- D 0 - I - 0x014D8E 05:8D7E: 02        .byte $02   ; 
- D 0 - I - 0x014D8F 05:8D7F: 02        .byte $02   ; 
- D 0 - I - 0x014D90 05:8D80: 8C        .byte $8C   ; 
- D 0 - I - 0x014D91 05:8D81: 9D        .byte $9D   ; 
- D 0 - I - 0x014D92 05:8D82: 3D        .byte $3D   ; 
- D 0 - I - 0x014D93 05:8D83: 02        .byte $02   ; 
- D 0 - I - 0x014D94 05:8D84: 02        .byte $02   ; 



off_8D85_02:
- D 0 - I - 0x014D95 05:8D85: 20        .byte $20   ; 
- D 0 - I - 0x014D96 05:8D86: CA        .byte $CA   ; 
- D 0 - I - 0x014D97 05:8D87: 0F        .byte $0F   ; 
- D 0 - I - 0x014D98 05:8D88: 02        .byte $02   ; 
- D 0 - I - 0x014D99 05:8D89: 02        .byte $02   ; 
- D 0 - I - 0x014D9A 05:8D8A: 02        .byte $02   ; 
- D 0 - I - 0x014D9B 05:8D8B: 02        .byte $02   ; 
- D 0 - I - 0x014D9C 05:8D8C: 02        .byte $02   ; 
- D 0 - I - 0x014D9D 05:8D8D: 02        .byte $02   ; 
- D 0 - I - 0x014D9E 05:8D8E: 02        .byte $02   ; 
- D 0 - I - 0x014D9F 05:8D8F: 02        .byte $02   ; 
- D 0 - I - 0x014DA0 05:8D90: 02        .byte $02   ; 
- D 0 - I - 0x014DA1 05:8D91: 02        .byte $02   ; 
- D 0 - I - 0x014DA2 05:8D92: 82        .byte $82   ; 
- D 0 - I - 0x014DA3 05:8D93: 9D        .byte $9D   ; 
- D 0 - I - 0x014DA4 05:8D94: 02        .byte $02   ; 
- D 0 - I - 0x014DA5 05:8D95: 02        .byte $02   ; 
- D 0 - I - 0x014DA6 05:8D96: 02        .byte $02   ; 



off_8D97_03:
- D 0 - I - 0x014DA7 05:8D97: 20        .byte $20   ; 
- D 0 - I - 0x014DA8 05:8D98: CA        .byte $CA   ; 
- D 0 - I - 0x014DA9 05:8D99: 0F        .byte $0F   ; 
- D 0 - I - 0x014DAA 05:8D9A: 83        .byte $83   ; 
- D 0 - I - 0x014DAB 05:8D9B: 9D        .byte $9D   ; 
- D 0 - I - 0x014DAC 05:8D9C: 02        .byte $02   ; 
- D 0 - I - 0x014DAD 05:8D9D: 02        .byte $02   ; 
- D 0 - I - 0x014DAE 05:8D9E: 02        .byte $02   ; 
- D 0 - I - 0x014DAF 05:8D9F: 02        .byte $02   ; 
- D 0 - I - 0x014DB0 05:8DA0: 02        .byte $02   ; 
- D 0 - I - 0x014DB1 05:8DA1: 02        .byte $02   ; 
- D 0 - I - 0x014DB2 05:8DA2: 02        .byte $02   ; 
- D 0 - I - 0x014DB3 05:8DA3: 02        .byte $02   ; 
- D 0 - I - 0x014DB4 05:8DA4: 82        .byte $82   ; 
- D 0 - I - 0x014DB5 05:8DA5: 9D        .byte $9D   ; 
- D 0 - I - 0x014DB6 05:8DA6: 02        .byte $02   ; 
- D 0 - I - 0x014DB7 05:8DA7: 02        .byte $02   ; 
- D 0 - I - 0x014DB8 05:8DA8: 02        .byte $02   ; 



off_8DA9_04:
- D 0 - I - 0x014DB9 05:8DA9: 20        .byte $20   ; 
- D 0 - I - 0x014DBA 05:8DAA: CA        .byte $CA   ; 
- D 0 - I - 0x014DBB 05:8DAB: 0F        .byte $0F   ; 
- D 0 - I - 0x014DBC 05:8DAC: 83        .byte $83   ; 
- D 0 - I - 0x014DBD 05:8DAD: 9D        .byte $9D   ; 
- D 0 - I - 0x014DBE 05:8DAE: 02        .byte $02   ; 
- D 0 - I - 0x014DBF 05:8DAF: 02        .byte $02   ; 
- D 0 - I - 0x014DC0 05:8DB0: 02        .byte $02   ; 
- D 0 - I - 0x014DC1 05:8DB1: 02        .byte $02   ; 
- D 0 - I - 0x014DC2 05:8DB2: 02        .byte $02   ; 
- D 0 - I - 0x014DC3 05:8DB3: 02        .byte $02   ; 
- D 0 - I - 0x014DC4 05:8DB4: 02        .byte $02   ; 
- D 0 - I - 0x014DC5 05:8DB5: 02        .byte $02   ; 
- D 0 - I - 0x014DC6 05:8DB6: 82        .byte $82   ; 
- D 0 - I - 0x014DC7 05:8DB7: 9D        .byte $9D   ; 
- D 0 - I - 0x014DC8 05:8DB8: 02        .byte $02   ; 
- D 0 - I - 0x014DC9 05:8DB9: 84        .byte $84   ; 
- D 0 - I - 0x014DCA 05:8DBA: 9D        .byte $9D   ; 



ofs_8097_03_экран_VS:
C - - - - - 0x014DCC 05:8DBC: A5 59     LDA ram_subscript
C - - - - - 0x014DCE 05:8DBE: 30 06     BMI bra_8DC6
C - - - - - 0x014DD0 05:8DC0: 20 DF 80  JSR sub_80DF
C - - - - - 0x014DD3 05:8DC3: 20 D0 8D  JSR sub_8DD0_экран_vs
bra_8DC6:
C - - - - - 0x014DD6 05:8DC6: AD C9 05  LDA ram_счетчик_опций
C - - - - - 0x014DD9 05:8DC9: 20 53 C0  JSR sub_0x01EC9F_jump_to_pointers_after_JSR
- D 0 - I - 0x014DDC 05:8DCC: FD 8D     .word ofs_8DFD_00
- D 0 - I - 0x014DDE 05:8DCE: 08 8E     .word ofs_8E08_01



sub_8DD0_экран_vs:
C - - - - - 0x014DE0 05:8DD0: A2 28     LDX #$28
C - - - - - 0x014DE2 05:8DD2: 8E B8 05  STX ram_банк_спрайтов
C - - - - - 0x014DE5 05:8DD5: E8        INX
C - - - - - 0x014DE6 05:8DD6: 8E B9 05  STX ram_банк_спрайтов + 1
C - - - - - 0x014DE9 05:8DD9: E8        INX
C - - - - - 0x014DEA 05:8DDA: 8E BA 05  STX ram_банк_спрайтов + 2
C - - - - - 0x014DED 05:8DDD: E8        INX
C - - - - - 0x014DEE 05:8DDE: 8E BB 05  STX ram_банк_спрайтов + 3
C - - - - - 0x014DF1 05:8DE1: 20 0B C0  JSR sub_0x01EEAA_базовые_банки_спрайтов
C - - - - - 0x014DF4 05:8DE4: A9 00     LDA #$00
C - - - - - 0x014DF6 05:8DE6: 8D 5D 05  STA ram_лицо_игрока + 1
C - - - - - 0x014DF9 05:8DE9: 8D 5F 05  STA ram_лицо_игрока + 3
C - - - - - 0x014DFC 05:8DEC: A9 38     LDA #$38
C - - - - - 0x014DFE 05:8DEE: 8D D2 05  STA ram_05D2
C - - - - - 0x014E01 05:8DF1: 20 3C 8E  JSR sub_8E3C
C - - - - - 0x014E04 05:8DF4: 20 79 8F  JSR sub_8F79
C - - - - - 0x014E07 05:8DF7: A9 08     LDA #con_music_screen_vs
C - - - - - 0x014E09 05:8DF9: 20 02 C0  JSR sub_0x01C2F4_play_sound
C - - - - - 0x014E0C 05:8DFC: 60        RTS



ofs_8DFD_00:
C - - J - - 0x014E0D 05:8DFD: AD B2 05  LDA ram_flag_brightness
C - - - - - 0x014E10 05:8E00: 10 03     BPL bra_8E05
C - - - - - 0x014E12 05:8E02: EE C9 05  INC ram_счетчик_опций
bra_8E05:
C - - - - - 0x014E15 05:8E05: 4C 32 8E  JMP loc_8E32



ofs_8E08_01:
C - - J - - 0x014E18 05:8E08: 2C B2 05  BIT ram_flag_brightness
C - - - - - 0x014E1B 05:8E0B: 10 25     BPL bra_8E32
C - - - - - 0x014E1D 05:8E0D: 50 06     BVC bra_8E15
C - - - - - 0x014E1F 05:8E0F: 20 73 8F  JSR sub_8F73
C - - - - - 0x014E22 05:8E12: 4C 3B 8E  RTS
bra_8E15:
C - - - - - 0x014E25 05:8E15: A5 08     LDA ram_btn_press
C - - - - - 0x014E27 05:8E17: 29 10     AND #con_btn_Start
C - - - - - 0x014E29 05:8E19: F0 0B     BEQ bra_8E26
C - - - - - 0x014E2B 05:8E1B: A9 33     LDA #con_sfx_yes
C - - - - - 0x014E2D 05:8E1D: 20 02 C0  JSR sub_0x01C2F4_play_sound
bra_8E20:
C - - - - - 0x014E30 05:8E20: 20 44 C0  JSR sub_0x01D057
C - - - - - 0x014E33 05:8E23: 4C 32 8E  JMP loc_8E32
bra_8E26:
C - - - - - 0x014E36 05:8E26: AD 00 03  LDA ram_frame_cnt
C - - - - - 0x014E39 05:8E29: 29 0F     AND #$0F
C - - - - - 0x014E3B 05:8E2B: D0 05     BNE bra_8E32
C - - - - - 0x014E3D 05:8E2D: CE D2 05  DEC ram_05D2
C - - - - - 0x014E40 05:8E30: 30 EE     BMI bra_8E20
bra_8E32:
loc_8E32:
C D 0 - - - 0x014E42 05:8E32: 20 E5 8E  JSR sub_8EE5
C - - - - - 0x014E45 05:8E35: 20 14 80  JSR sub_0x01C2AE
C - - - - - 0x014E48 05:8E38: 20 5C C0  JSR sub_0x01D083
C D 0 - - - 0x014E4B 05:8E3B: 60        RTS



sub_8E3C:
C - - - - - 0x014E4C 05:8E3C: A2 00     LDX #$00
bra_8E3E_loop:
C - - - - - 0x014E4E 05:8E3E: 86 43     STX ram_0043
C - - - - - 0x014E50 05:8E40: E0 02     CPX #$02
C - - - - - 0x014E52 05:8E42: B0 15     BCS bra_8E59
C - - - - - 0x014E54 05:8E44: BD 2C 05  LDA ram_номер_команды,X
C - - - - - 0x014E57 05:8E47: 29 0F     AND #$0F
C - - - - - 0x014E59 05:8E49: A8        TAY
C - - - - - 0x014E5A 05:8E4A: B9 C3 8E  LDA tbl_8EC3,Y
C - - - - - 0x014E5D 05:8E4D: 9D AE 05  STA ram_palette_id_spr,X
C - - - - - 0x014E60 05:8E50: B9 B3 8E  LDA tbl_8EB3,Y
C - - - - - 0x014E63 05:8E53: BC FB 8E  LDY tbl_8EFB,X
C - - - - - 0x014E66 05:8E56: 99 74 00  STA ram_animation_id_player,Y
bra_8E59:
C - - - - - 0x014E69 05:8E59: BC FB 8E  LDY tbl_8EFB,X
C - - - - - 0x014E6C 05:8E5C: A9 06     LDA #$06
C - - - - - 0x014E6E 05:8E5E: 99 61 00  STA ram_0061,Y
C - - - - - 0x014E71 05:8E61: 8A        TXA
C - - - - - 0x014E72 05:8E62: 0A        ASL
C - - - - - 0x014E73 05:8E63: 0A        ASL
C - - - - - 0x014E74 05:8E64: AA        TAX
C - - - - - 0x014E75 05:8E65: BD D5 8E  LDA tbl_8ED5,X
C - - - - - 0x014E78 05:8E68: 99 14 03  STA ram_pos_X_lo_player,Y
C - - - - - 0x014E7B 05:8E6B: BD D6 8E  LDA tbl_8ED5 + 1,X
C - - - - - 0x014E7E 05:8E6E: 99 27 03  STA ram_pos_X_hi_player,Y
C - - - - - 0x014E81 05:8E71: BD D7 8E  LDA tbl_8ED5 + 2,X
C - - - - - 0x014E84 05:8E74: 99 4D 03  STA ram_pos_Y_lo_player,Y
C - - - - - 0x014E87 05:8E77: BD D8 8E  LDA tbl_8ED5 + 3,X
C - - - - - 0x014E8A 05:8E7A: 99 60 03  STA ram_pos_Y_hi_player,Y
C - - - - - 0x014E8D 05:8E7D: A6 43     LDX ram_0043
C - - - - - 0x014E8F 05:8E7F: E8        INX
C - - - - - 0x014E90 05:8E80: E0 04     CPX #$04
C - - - - - 0x014E92 05:8E82: 90 BA     BCC bra_8E3E_loop
C - - - - - 0x014E94 05:8E84: A9 01     LDA #$01
C - - - - - 0x014E96 05:8E86: 8D 5C 04  STA ram_movement_id_player + 3
C - - - - - 0x014E99 05:8E89: AD 29 05  LDA ram_опция_материк
C - - - - - 0x014E9C 05:8E8C: 0A        ASL
C - - - - - 0x014E9D 05:8E8D: 6D 29 05  ADC ram_опция_материк
C - - - - - 0x014EA0 05:8E90: A8        TAY
C - - - - - 0x014EA1 05:8E91: B9 A4 8E  LDA tbl_8EA4,Y
C - - - - - 0x014EA4 05:8E94: 8D 5A 04  STA ram_movement_id_player + 1
C - - - - - 0x014EA7 05:8E97: B9 A5 8E  LDA tbl_8EA4 + 1,Y
C - - - - - 0x014EAA 05:8E9A: 8D B0 05  STA ram_palette_id_spr + 2
C - - - - - 0x014EAD 05:8E9D: B9 A6 8E  LDA tbl_8EA4 + 2,Y
C - - - - - 0x014EB0 05:8EA0: 8D B1 05  STA ram_palette_id_spr + 3
C - - - - - 0x014EB3 05:8EA3: 60        RTS



tbl_8EA4:
; 00
- D 0 - - - 0x014EB4 05:8EA4: 04        .byte $04   ; 
- D 0 - - - 0x014EB5 05:8EA5: 24        .byte $24   ; 
- D 0 - - - 0x014EB6 05:8EA6: 24        .byte $24   ; 
; 01
- D 0 - - - 0x014EB7 05:8EA7: 03        .byte $03   ; 
- D 0 - - - 0x014EB8 05:8EA8: 23        .byte $23   ; 
- D 0 - - - 0x014EB9 05:8EA9: 23        .byte $23   ; 
; 02
- D 0 - - - 0x014EBA 05:8EAA: 04        .byte $04   ; 
- D 0 - - - 0x014EBB 05:8EAB: 25        .byte $25   ; 
- D 0 - - - 0x014EBC 05:8EAC: 25        .byte $25   ; 
; 03
- D 0 - - - 0x014EBD 05:8EAD: 02        .byte $02   ; 
- D 0 - - - 0x014EBE 05:8EAE: 1A        .byte $1A   ; 
- D 0 - - - 0x014EBF 05:8EAF: 1B        .byte $1B   ; 
; 04 bzk мусор? лишний материк
- - - - - - 0x014EC0 05:8EB0: 03        .byte $03   ; 
- - - - - - 0x014EC1 05:8EB1: 23        .byte $23   ; 
- - - - - - 0x014EC2 05:8EB2: 23        .byte $23   ; 



tbl_8EB3:
- D 0 - - - 0x014EC3 05:8EB3: 8C        .byte $8C   ; 
- D 0 - - - 0x014EC4 05:8EB4: 80        .byte $80   ; 
- D 0 - - - 0x014EC5 05:8EB5: 81        .byte $81   ; 
- D 0 - - - 0x014EC6 05:8EB6: 82        .byte $82   ; 
- - - - - - 0x014EC7 05:8EB7: 8C        .byte $8C   ; 
- D 0 - - - 0x014EC8 05:8EB8: 83        .byte $83   ; 
- D 0 - - - 0x014EC9 05:8EB9: 84        .byte $84   ; 
- D 0 - - - 0x014ECA 05:8EBA: 85        .byte $85   ; 
- - - - - - 0x014ECB 05:8EBB: 8C        .byte $8C   ; 
- D 0 - - - 0x014ECC 05:8EBC: 86        .byte $86   ; 
- D 0 - - - 0x014ECD 05:8EBD: 87        .byte $87   ; 
- D 0 - - - 0x014ECE 05:8EBE: 88        .byte $88   ; 
- - - - - - 0x014ECF 05:8EBF: 8C        .byte $8C   ; 
- D 0 - - - 0x014ED0 05:8EC0: 89        .byte $89   ; 
- D 0 - - - 0x014ED1 05:8EC1: 8A        .byte $8A   ; 
- D 0 - - - 0x014ED2 05:8EC2: 8B        .byte $8B   ; 



tbl_8EC3:
- D 0 - - - 0x014ED3 05:8EC3: 15        .byte $15   ; 
- D 0 - - - 0x014ED4 05:8EC4: 15        .byte $15   ; 
- D 0 - - - 0x014ED5 05:8EC5: 15        .byte $15   ; 
- D 0 - - - 0x014ED6 05:8EC6: 15        .byte $15   ; 
- - - - - - 0x014ED7 05:8EC7: 15        .byte $15   ; 
- D 0 - - - 0x014ED8 05:8EC8: 17        .byte $17   ; 
- D 0 - - - 0x014ED9 05:8EC9: 17        .byte $17   ; 
- D 0 - - - 0x014EDA 05:8ECA: 17        .byte $17   ; 
- - - - - - 0x014EDB 05:8ECB: 15        .byte $15   ; 
- D 0 - - - 0x014EDC 05:8ECC: 17        .byte $17   ; 
- D 0 - - - 0x014EDD 05:8ECD: 15        .byte $15   ; 
- D 0 - - - 0x014EDE 05:8ECE: 16        .byte $16   ; 
- - - - - - 0x014EDF 05:8ECF: 15        .byte $15   ; 
- D 0 - - - 0x014EE0 05:8ED0: 19        .byte $19   ; 
- D 0 - - - 0x014EE1 05:8ED1: 18        .byte $18   ; 
- D 0 - - - 0x014EE2 05:8ED2: 16        .byte $16   ; 
- - - - - - 0x014EE3 05:8ED3: 00        .byte $00   ; 
- - - - - - 0x014EE4 05:8ED4: 00        .byte $00   ; 



tbl_8ED5:
; 00
- D 0 - - - 0x014EE5 05:8ED5: 40 00     .word $0040
- D 0 - - - 0x014EE7 05:8ED7: 97 00     .word $0097
; 01
- D 0 - - - 0x014EE9 05:8ED9: B8 00     .word $00B8
- D 0 - - - 0x014EEB 05:8EDB: 97 00     .word $0097
; 02
- D 0 - - - 0x014EED 05:8EDD: 20 01     .word $0120
- D 0 - - - 0x014EEF 05:8EDF: C8 00     .word $00C8
; 03
- D 0 - - - 0x014EF1 05:8EE1: 20 01     .word $0120
- D 0 - - - 0x014EF3 05:8EE3: C8 00     .word $00C8



sub_8EE5:
C - - - - - 0x014EF5 05:8EE5: A2 00     LDX #$00
bra_8EE7_loop:
C - - - - - 0x014EF7 05:8EE7: 86 43     STX ram_0043
C - - - - - 0x014EF9 05:8EE9: BD FB 8E  LDA tbl_8EFB,X
C - - - - - 0x014EFC 05:8EEC: AA        TAX
C - - - - - 0x014EFD 05:8EED: 20 FF 8E  JSR sub_8EFF
C - - - - - 0x014F00 05:8EF0: 20 65 C0  JSR sub_0x01EB9C
C - - - - - 0x014F03 05:8EF3: A6 43     LDX ram_0043
C - - - - - 0x014F05 05:8EF5: E8        INX
C - - - - - 0x014F06 05:8EF6: E0 04     CPX #$04
C - - - - - 0x014F08 05:8EF8: 90 ED     BCC bra_8EE7_loop
C - - - - - 0x014F0A 05:8EFA: 60        RTS



tbl_8EFB:
- D 0 - - - 0x014F0B 05:8EFB: 0C        .byte $0C   ; 
- D 0 - - - 0x014F0C 05:8EFC: 00        .byte $00   ; 
- D 0 - - - 0x014F0D 05:8EFD: 01        .byte $01   ; 
- D 0 - - - 0x014F0E 05:8EFE: 03        .byte $03   ; 



sub_8EFF:
C - - - - - 0x014F0F 05:8EFF: BD 59 04  LDA ram_movement_id_player,X
C - - - - - 0x014F12 05:8F02: 20 53 C0  JSR sub_0x01EC9F_jump_to_pointers_after_JSR
- D 0 - I - 0x014F15 05:8F05: 0F 8F     .word _общий_RTS
- D 0 - I - 0x014F17 05:8F07: 10 8F     .word ofs_8F10_01
- D 0 - I - 0x014F19 05:8F09: 40 8F     .word ofs_8F40_02
- D 0 - I - 0x014F1B 05:8F0B: 40 8F     .word ofs_8F40_03
- D 0 - I - 0x014F1D 05:8F0D: 40 8F     .word ofs_8F40_04



ofs_8F10_01:
C - - J - - 0x014F20 05:8F10: 8A        TXA
C - - - - - 0x014F21 05:8F11: A8        TAY
C - - - - - 0x014F22 05:8F12: 88        DEY
C - - - - - 0x014F23 05:8F13: 88        DEY
C - - - - - 0x014F24 05:8F14: B9 14 03  LDA ram_pos_X_lo_player,Y
C - - - - - 0x014F27 05:8F17: 9D 14 03  STA ram_pos_X_lo_player,X
C - - - - - 0x014F2A 05:8F1A: B9 27 03  LDA ram_pos_X_hi_player,Y
C - - - - - 0x014F2D 05:8F1D: 9D 27 03  STA ram_pos_X_hi_player,X
C - - - - - 0x014F30 05:8F20: B9 4D 03  LDA ram_pos_Y_lo_player,Y
C - - - - - 0x014F33 05:8F23: 9D 4D 03  STA ram_pos_Y_lo_player,X
C - - - - - 0x014F36 05:8F26: B9 60 03  LDA ram_pos_Y_hi_player,Y
C - - - - - 0x014F39 05:8F29: 9D 60 03  STA ram_pos_Y_hi_player,X
C - - - - - 0x014F3C 05:8F2C: B9 86 03  LDA ram_pos_Z_lo_player,Y
C - - - - - 0x014F3F 05:8F2F: 9D 86 03  STA ram_pos_Z_lo_player,X
C - - - - - 0x014F42 05:8F32: B9 99 03  LDA ram_pos_Z_hi_player,Y
C - - - - - 0x014F45 05:8F35: 9D 99 03  STA ram_pos_Z_hi_player,X
C - - - - - 0x014F48 05:8F38: B9 74 00  LDA ram_animation_id_player,Y
C - - - - - 0x014F4B 05:8F3B: 95 74     STA ram_animation_id_player,X
C - - - - - 0x014F4D 05:8F3D: F6 74     INC ram_animation_id_player,X
C - - - - - 0x014F4F 05:8F3F: 60        RTS



ofs_8F40_02:
ofs_8F40_03:
ofs_8F40_04:
C - - J - - 0x014F50 05:8F40: BD 59 04  LDA ram_movement_id_player,X
C - - - - - 0x014F53 05:8F43: 30 0D     BMI bra_8F52
C - - - - - 0x014F55 05:8F45: 09 80     ORA #$80
C - - - - - 0x014F57 05:8F47: 9D 59 04  STA ram_movement_id_player,X
C - - - - - 0x014F5A 05:8F4A: A9 00     LDA #$00
C - - - - - 0x014F5C 05:8F4C: 9D 87 00  STA ram_timer_animation_player,X
C - - - - - 0x014F5F 05:8F4F: 9D 94 00  STA ram_номер_кадра_анимации,X
bra_8F52:
C - - - - - 0x014F62 05:8F52: 20 CF 8F  JSR sub_8FCF
C - - - - - 0x014F65 05:8F55: BD 59 04  LDA ram_movement_id_player,X
C - - - - - 0x014F68 05:8F58: 38        SEC
C - - - - - 0x014F69 05:8F59: E9 02     SBC #$02
C - - - - - 0x014F6B 05:8F5B: 0A        ASL
C - - - - - 0x014F6C 05:8F5C: A8        TAY
C - - - - - 0x014F6D 05:8F5D: B9 6D 8F  LDA tbl_8F6D_spd_X,Y
C - - - - - 0x014F70 05:8F60: 9D E8 03  STA ram_spd_X_lo_player,X
C - - - - - 0x014F73 05:8F63: B9 6E 8F  LDA tbl_8F6D_spd_X + 1,Y
C - - - - - 0x014F76 05:8F66: 9D F6 03  STA ram_spd_X_hi_player,X
C - - - - - 0x014F79 05:8F69: 20 1E 80  JSR sub_0x01C25C
C - - - - - 0x014F7C 05:8F6C: 60        RTS



tbl_8F6D_spd_X:
- D 0 - - - 0x014F7D 05:8F6D: 80 FF     .word $FF80
- D 0 - - - 0x014F7F 05:8F6F: A0 FF     .word $FFA0
- D 0 - - - 0x014F81 05:8F71: C0 FF     .word $FFC0



sub_8F73:   ; bzk опт
C - - - - - 0x014F83 05:8F73: A9 04     LDA #$04
C - - - - - 0x014F85 05:8F75: 8D 59 00  STA ram_subscript
C - - - - - 0x014F88 05:8F78: 60        RTS



sub_8F79:
C - - - - - 0x014F89 05:8F79: 20 11 C0  JSR sub_0x01ECB9
C - - - - - 0x014F8C 05:8F7C: 20 17 C0  JSR sub_0x01EE81_disable_NMI
C - - - - - 0x014F8F 05:8F7F: 20 1D C0  JSR sub_0x01ECD1_скрыть_фон_и_спрайты_за_полоской_слева
C - - - - - 0x014F92 05:8F82: A2 00     LDX #$00
C - - - - - 0x014F94 05:8F84: 86 1C     STX ram_001C
bra_8F86_loop:
C - - - - - 0x014F96 05:8F86: BD 2C 05  LDA ram_номер_команды,X
C - - - - - 0x014F99 05:8F89: 29 0F     AND #$0F
C - - - - - 0x014F9B 05:8F8B: 0A        ASL
C - - - - - 0x014F9C 05:8F8C: A8        TAY
C - - - - - 0x014F9D 05:8F8D: B9 AF 8F  LDA tbl_8FAF,Y
C - - - - - 0x014FA0 05:8F90: 9D AC 05  STA ram_palette_id_bg,X
C - - - - - 0x014FA3 05:8F93: B9 B0 8F  LDA tbl_8FB0,Y
C - - - - - 0x014FA6 05:8F96: 8D BD 05  STA ram_банк_фона + 1
C - - - - - 0x014FA9 05:8F99: E8        INX
C - - - - - 0x014FAA 05:8F9A: E0 02     CPX #$02
C - - - - - 0x014FAC 05:8F9C: 90 E8     BCC bra_8F86_loop
C - - - - - 0x014FAE 05:8F9E: 20 9F BE  JSR sub_BE9F
C - - - - - 0x014FB1 05:8FA1: 20 FA BE  JSR sub_BEFA
C - - - - - 0x014FB4 05:8FA4: 20 1A C0  JSR sub_0x01ECDB_отобразить_фон_и_спрайты
C - - - - - 0x014FB7 05:8FA7: 20 14 C0  JSR sub_0x01EE75_enable_NMI
C - - - - - 0x014FBA 05:8FAA: 60        RTS



tbl_8FAF:
- D 0 - - - 0x014FBF 05:8FAF: 1C        .byte $1C   ; 
tbl_8FB0:
- D 0 - - - 0x014FC0 05:8FB0: 68        .byte $68   ; 
- D 0 - - - 0x014FC1 05:8FB1: 23        .byte $23   ; 
- D 0 - - - 0x014FC2 05:8FB2: 68        .byte $68   ; 
- D 0 - - - 0x014FC3 05:8FB3: 22        .byte $22   ; 
- D 0 - - - 0x014FC4 05:8FB4: 68        .byte $68   ; 
- D 0 - - - 0x014FC5 05:8FB5: 24        .byte $24   ; 
- D 0 - - - 0x014FC6 05:8FB6: 6A        .byte $6A   ; 
- - - - - - 0x014FC7 05:8FB7: 1C        .byte $1C   ; 
- - - - - - 0x014FC8 05:8FB8: 68        .byte $68   ; 
- D 0 - - - 0x014FC9 05:8FB9: 26        .byte $26   ; 
- D 0 - - - 0x014FCA 05:8FBA: 6A        .byte $6A   ; 
- D 0 - - - 0x014FCB 05:8FBB: 25        .byte $25   ; 
- D 0 - - - 0x014FCC 05:8FBC: 6A        .byte $6A   ; 
- D 0 - - - 0x014FCD 05:8FBD: 1D        .byte $1D   ; 
- D 0 - - - 0x014FCE 05:8FBE: 68        .byte $68   ; 
- - - - - - 0x014FCF 05:8FBF: 1C        .byte $1C   ; 
- - - - - - 0x014FD0 05:8FC0: 68        .byte $68   ; 
- D 0 - - - 0x014FD1 05:8FC1: 20        .byte $20   ; 
- D 0 - - - 0x014FD2 05:8FC2: 68        .byte $68   ; 
- D 0 - - - 0x014FD3 05:8FC3: 28        .byte $28   ; 
- D 0 - - - 0x014FD4 05:8FC4: 6A        .byte $6A   ; 
- D 0 - - - 0x014FD5 05:8FC5: 21        .byte $21   ; 
- D 0 - - - 0x014FD6 05:8FC6: 68        .byte $68   ; 
- - - - - - 0x014FD7 05:8FC7: 1C        .byte $1C   ; 
- - - - - - 0x014FD8 05:8FC8: 68        .byte $68   ; 
- D 0 - - - 0x014FD9 05:8FC9: 1F        .byte $1F   ; 
- D 0 - - - 0x014FDA 05:8FCA: 68        .byte $68   ; 
- D 0 - - - 0x014FDB 05:8FCB: 1E        .byte $1E   ; 
- D 0 - - - 0x014FDC 05:8FCC: 68        .byte $68   ; 
- D 0 - - - 0x014FDD 05:8FCD: 27        .byte $27   ; 
- D 0 - - - 0x014FDE 05:8FCE: 6A        .byte $6A   ; 



sub_8FCF:
C - - - - - 0x014FDF 05:8FCF: AD E0 8F  LDA tbl_8FE0
C - - - - - 0x014FE2 05:8FD2: 85 30     STA ram_0030
C - - - - - 0x014FE4 05:8FD4: AD E1 8F  LDA tbl_8FE0 + 1
C - - - - - 0x014FE7 05:8FD7: 85 31     STA ram_0031
C - - - - - 0x014FE9 05:8FD9: BD 59 04  LDA ram_movement_id_player,X
C - - - - - 0x014FEC 05:8FDC: 20 56 C0  JSR sub_0x01CECD_вычислить_анимацию
C - - - - - 0x014FEF 05:8FDF: 60        RTS



tbl_8FE0:   ; bzk опт
- D 0 - - - 0x014FF0 05:8FE0: E2 8F     .word tbl_8FE2

tbl_8FE2:
- - - - - - 0x014FF2 05:8FE2: EC 8F     .word off_8FEC_00
- - - - - - 0x014FF4 05:8FE4: EC 8F     .word off_8FEC_01
- D 0 - I - 0x014FF6 05:8FE6: ED 8F     .word off_8FED_02
- D 0 - I - 0x014FF8 05:8FE8: EF 8F     .word off_8FEF_03
- D 0 - I - 0x014FFA 05:8FEA: F4 8F     .word off_8FF4_04

off_8FEC_00:
off_8FEC_01:
- - - - - - 0x014FFC 05:8FEC: FF        .byte $FF   ; 



off_8FED_02:
- D 0 - I - 0x014FFD 05:8FED: 00        .byte $00   ; 
- D 0 - I - 0x014FFE 05:8FEE: 8D        .byte $8D   ; 
off_8FEF_03:
- D 0 - I - 0x014FFF 05:8FEF: 08        .byte $08   ; 
- D 0 - I - 0x015000 05:8FF0: 8F        .byte $8F   ; 
- D 0 - I - 0x015001 05:8FF1: 08        .byte $08   ; 
- D 0 - I - 0x015002 05:8FF2: 91        .byte $91   ; 
- D 0 - I - 0x015003 05:8FF3: FE        .byte $FE   ; 



off_8FF4_04:
- D 0 - I - 0x015004 05:8FF4: 08        .byte $08   ; 
- D 0 - I - 0x015005 05:8FF5: 93        .byte $93   ; 
- D 0 - I - 0x015006 05:8FF6: 08        .byte $08   ; 
- D 0 - I - 0x015007 05:8FF7: 95        .byte $95   ; 
- D 0 - I - 0x015008 05:8FF8: FE        .byte $FE   ; 



ofs_809D_04_раздевалка:
C - - - - - 0x015009 05:8FF9: A5 59     LDA ram_subscript
C - - - - - 0x01500B 05:8FFB: 30 12     BMI bra_900F
C - - - - - 0x01500D 05:8FFD: 20 DF 80  JSR sub_80DF
C - - - - - 0x015010 05:9000: 24 57     BIT ram_option_mode_difficulty
C - - - - - 0x015012 05:9002: 50 08     BVC bra_900C_not_minibattle
C - - - - - 0x015014 05:9004: A9 13     LDA #$13    ; экран раздевалки без некоторых опций
C - - - - - 0x015016 05:9006: 20 68 C0  JSR sub_0x01E838_отрисовать_статичный_экран
C - - - - - 0x015019 05:9009: 20 CD 92  JSR sub_92CD
bra_900C_not_minibattle:
C - - - - - 0x01501C 05:900C: 20 1C 90  JSR sub_901C
bra_900F:
C - - - - - 0x01501F 05:900F: 20 C7 90  JSR sub_90C7
C - - - - - 0x015022 05:9012: AD C9 05  LDA ram_счетчик_опций
C - - - - - 0x015025 05:9015: 20 53 C0  JSR sub_0x01EC9F_jump_to_pointers_after_JSR
- D 0 - I - 0x015028 05:9018: 60 90     .word ofs_9060_00
- D 0 - I - 0x01502A 05:901A: 6E 90     .word ofs_906E_01



sub_901C:
C - - - - - 0x01502C 05:901C: A9 FF     LDA #$FF
C - - - - - 0x01502E 05:901E: 8D CA 05  STA ram_номер_опции
C - - - - - 0x015031 05:9021: A9 05     LDA #$05
C - - - - - 0x015033 05:9023: 8D 61 00  STA ram_0061
C - - - - - 0x015036 05:9026: 8D 62 00  STA ram_0062
C - - - - - 0x015039 05:9029: 8D 64 00  STA ram_0064
C - - - - - 0x01503C 05:902C: A9 00     LDA #$00
C - - - - - 0x01503E 05:902E: 8D EC 00  STA ram_pos_X_lo_scroll
C - - - - - 0x015041 05:9031: 8D ED 00  STA ram_pos_X_hi_scroll
C - - - - - 0x015044 05:9034: 8D EE 00  STA ram_pos_Y_lo_scroll
C - - - - - 0x015047 05:9037: 8D EF 00  STA ram_pos_Y_hi_scroll
C - - - - - 0x01504A 05:903A: 8D F0 00  STA ram_pos_X_lo_camera
C - - - - - 0x01504D 05:903D: 8D F1 00  STA ram_pos_X_hi_camera
C - - - - - 0x015050 05:9040: 8D F2 00  STA ram_pos_Y_lo_camera
C - - - - - 0x015053 05:9043: 8D F3 00  STA ram_pos_Y_hi_camera
C - - - - - 0x015056 05:9046: 20 02 91  JSR sub_9102
C - - - - - 0x015059 05:9049: A2 26     LDX #$26
C - - - - - 0x01505B 05:904B: 8E B8 05  STX ram_банк_спрайтов
C - - - - - 0x01505E 05:904E: E8        INX
C - - - - - 0x01505F 05:904F: 8E B9 05  STX ram_банк_спрайтов + 1
C - - - - - 0x015062 05:9052: A9 11     LDA #$11
C - - - - - 0x015064 05:9054: 8D BB 05  STA ram_банк_спрайтов + 3
C - - - - - 0x015067 05:9057: 20 0B C0  JSR sub_0x01EEAA_базовые_банки_спрайтов
C - - - - - 0x01506A 05:905A: A9 02     LDA #con_music_menu
C - - - - - 0x01506C 05:905C: 20 02 C0  JSR sub_0x01C2F4_play_sound
C - - - - - 0x01506F 05:905F: 60        RTS



ofs_9060_00:
C - - J - - 0x015070 05:9060: AD B2 05  LDA ram_flag_brightness
C - - - - - 0x015073 05:9063: 10 03     BPL bra_9068
C - - - - - 0x015075 05:9065: EE C9 05  INC ram_счетчик_опций
bra_9068:
C - - - - - 0x015078 05:9068: 20 5C C0  JSR sub_0x01D083
C - - - - - 0x01507B 05:906B: 4C A9 90  JMP loc_90A9



ofs_906E_01:
C - - J - - 0x01507E 05:906E: A2 00     LDX #$00
C - - - - - 0x015080 05:9070: AD CA 05  LDA ram_номер_опции
C - - - - - 0x015083 05:9073: 10 03     BPL bra_9078
C - - - - - 0x015085 05:9075: 20 FC 90  JSR sub_90FC
bra_9078:
C - - - - - 0x015088 05:9078: 20 7E 81  JSR sub_817E_конвертация_нажатых_кнопок_в_индекс
C - - - - - 0x01508B 05:907B: 20 53 C0  JSR sub_0x01EC9F_jump_to_pointers_after_JSR
- D 0 - I - 0x01508E 05:907E: A9 90     .word ofs_90A9_00_nothing
- D 0 - I - 0x015090 05:9080: 90 90     .word ofs_9090_01_Start
- - - - - - 0x015092 05:9082: A9 90     .word ofs_90A9_02_Select
- D 0 - I - 0x015094 05:9084: 90 90     .word ofs_9090_03_A
- D 0 - I - 0x015096 05:9086: 96 90     .word ofs_9096_04_B
- D 0 - I - 0x015098 05:9088: A1 90     .word ofs_90A1_05_Up
- D 0 - I - 0x01509A 05:908A: A1 90     .word ofs_90A1_06_Down
- D 0 - I - 0x01509C 05:908C: A1 90     .word ofs_90A1_07_Left
- D 0 - I - 0x01509E 05:908E: A1 90     .word ofs_90A1_08_Right



ofs_9090_01_Start:
ofs_9090_03_A:
C - - J - - 0x0150A0 05:9090: 20 4D 92  JSR sub_924D
C - - - - - 0x0150A3 05:9093: 4C A9 90  JMP loc_90A9



ofs_9096_04_B:
C - - J - - 0x0150A6 05:9096: A9 34     LDA #con_sfx_no
C - - - - - 0x0150A8 05:9098: 20 02 C0  JSR sub_0x01C2F4_play_sound
C - - - - - 0x0150AB 05:909B: 20 FC 90  JSR sub_90FC
C - - - - - 0x0150AE 05:909E: 4C A9 90  JMP loc_90A9



ofs_90A1_05_Up:
ofs_90A1_06_Down:
ofs_90A1_07_Left:
ofs_90A1_08_Right:
C - - J - - 0x0150B1 05:90A1: A9 32     LDA #con_sfx_move_cursor
C - - - - - 0x0150B3 05:90A3: 20 02 C0  JSR sub_0x01C2F4_play_sound
C - - - - - 0x0150B6 05:90A6: 20 DD 81  JSR sub_81DD
loc_90A9:
ofs_90A9_00_nothing:
ofs_90A9_02_Select:
C D 0 - - - 0x0150B9 05:90A9: A2 00     LDX #$00
C - - - - - 0x0150BB 05:90AB: 20 2A 82  JSR sub_822A
C - - - - - 0x0150BE 05:90AE: A9 00     LDA #$00
C - - - - - 0x0150C0 05:90B0: 20 8D 82  JSR sub_828D
C - - - - - 0x0150C3 05:90B3: 20 65 C0  JSR sub_0x01EB9C
C - - - - - 0x0150C6 05:90B6: E8        INX
bra_90B7:
C - - - - - 0x0150C7 05:90B7: 20 94 91  JSR sub_9194
C - - - - - 0x0150CA 05:90BA: 20 65 C0  JSR sub_0x01EB9C
C - - - - - 0x0150CD 05:90BD: E8        INX
C - - - - - 0x0150CE 05:90BE: E8        INX
C - - - - - 0x0150CF 05:90BF: E0 04     CPX #$04
C - - - - - 0x0150D1 05:90C1: 90 F4     BCC bra_90B7
C - - - - - 0x0150D3 05:90C3: 20 14 80  JSR sub_0x01C2AE
C - - - - - 0x0150D6 05:90C6: 60        RTS



sub_90C7:
C - - - - - 0x0150D7 05:90C7: 20 05 82  JSR sub_8205_read_pointers_after_JSR
- D 0 - I - 0x0150DA 05:90CA: EE 90     .word off_90EE_00
- D 0 - I - 0x0150DC 05:90CC: D2 90     .word off_90D2_01
- D 0 - I - 0x0150DE 05:90CE: EE 90     .word off_90EE_02
- D 0 - I - 0x0150E0 05:90D0: D2 90     .word off_90D2_03

off_90D2_01:
off_90D2_03:
- D 0 - I - 0x0150E2 05:90D2: 02        .byte $02   ; 
- D 0 - I - 0x0150E3 05:90D3: 01        .byte $01   ; 
- - - - - - 0x0150E4 05:90D4: 03        .byte $03   ; 
- D 0 - I - 0x0150E5 05:90D5: 03        .byte $03   ; 
- D 0 - I - 0x0150E6 05:90D6: 00        .byte $00   ; 
- D 0 - I - 0x0150E7 05:90D7: 02        .byte $02   ; 
- - - - - - 0x0150E8 05:90D8: 04        .byte $04   ; 
- D 0 - I - 0x0150E9 05:90D9: 04        .byte $04   ; 
- D 0 - I - 0x0150EA 05:90DA: 01        .byte $01   ; 
- D 0 - I - 0x0150EB 05:90DB: 00        .byte $00   ; 
- D 0 - I - 0x0150EC 05:90DC: 06        .byte $06   ; 
- D 0 - I - 0x0150ED 05:90DD: 06        .byte $06   ; 
- - - - - - 0x0150EE 05:90DE: 06        .byte $06   ; 
- D 0 - I - 0x0150EF 05:90DF: 04        .byte $04   ; 
- D 0 - I - 0x0150F0 05:90E0: 00        .byte $00   ; 
- D 0 - I - 0x0150F1 05:90E1: 00        .byte $00   ; 
- D 0 - I - 0x0150F2 05:90E2: 03        .byte $03   ; 
- D 0 - I - 0x0150F3 05:90E3: 05        .byte $05   ; 
- D 0 - I - 0x0150F4 05:90E4: 01        .byte $01   ; 
- - - - - - 0x0150F5 05:90E5: 01        .byte $01   ; 
- D 0 - I - 0x0150F6 05:90E6: 04        .byte $04   ; 
- D 0 - I - 0x0150F7 05:90E7: 06        .byte $06   ; 
- - - - - - 0x0150F8 05:90E8: 02        .byte $02   ; 
- D 0 - I - 0x0150F9 05:90E9: 02        .byte $02   ; 
- D 0 - I - 0x0150FA 05:90EA: 05        .byte $05   ; 
- D 0 - I - 0x0150FB 05:90EB: 03        .byte $03   ; 
- D 0 - I - 0x0150FC 05:90EC: 02        .byte $02   ; 
- D 0 - I - 0x0150FD 05:90ED: 02        .byte $02   ; 



off_90EE_00:
off_90EE_02:
- D 0 - I - 0x0150FE 05:90EE: 05        .byte $05   ; 
- D 0 - I - 0x0150FF 05:90EF: 12        .byte $12   ; 
- D 0 - I - 0x015100 05:90F0: 05        .byte $05   ; 
- D 0 - I - 0x015101 05:90F1: 14        .byte $14   ; 
- D 0 - I - 0x015102 05:90F2: 05        .byte $05   ; 
- D 0 - I - 0x015103 05:90F3: 18        .byte $18   ; 
- D 0 - I - 0x015104 05:90F4: 11        .byte $11   ; 
- D 0 - I - 0x015105 05:90F5: 12        .byte $12   ; 
- D 0 - I - 0x015106 05:90F6: 11        .byte $11   ; 
- D 0 - I - 0x015107 05:90F7: 14        .byte $14   ; 
- D 0 - I - 0x015108 05:90F8: 11        .byte $11   ; 
- D 0 - I - 0x015109 05:90F9: 16        .byte $16   ; 
- D 0 - I - 0x01510A 05:90FA: 11        .byte $11   ; 
- D 0 - I - 0x01510B 05:90FB: 18        .byte $18   ; 



sub_90FC:
C - - - - - 0x01510C 05:90FC: A9 02     LDA #$02
C - - - - - 0x01510E 05:90FE: 8D CA 05  STA ram_номер_опции
C - - - - - 0x015111 05:9101: 60        RTS



sub_9102:
C - - - - - 0x015112 05:9102: AE CC 05  LDX ram_счетчик_смен
C - - - - - 0x015115 05:9105: BD 2C 05  LDA ram_номер_команды,X
C - - - - - 0x015118 05:9108: 29 0F     AND #$0F
C - - - - - 0x01511A 05:910A: F0 02     BEQ bra_910E
C - - - - - 0x01511C 05:910C: A9 0C     LDA #$0C
bra_910E:
C - - - - - 0x01511E 05:910E: 18        CLC
C - - - - - 0x01511F 05:910F: 7D 32 05  ADC ram_player_id,X
C - - - - - 0x015122 05:9112: 8D 5D 05  STA ram_лицо_игрока + 1
C - - - - - 0x015125 05:9115: BD 2C 05  LDA ram_номер_команды,X
C - - - - - 0x015128 05:9118: 29 0F     AND #$0F
C - - - - - 0x01512A 05:911A: 0A        ASL
C - - - - - 0x01512B 05:911B: A8        TAY
C - - - - - 0x01512C 05:911C: B9 F6 BD  LDA tbl_BDF6,Y
C - - - - - 0x01512F 05:911F: 8D BA 05  STA ram_банк_спрайтов + 2
C - - - - - 0x015132 05:9122: B9 D6 BD  LDA tbl_BDD6,Y
C - - - - - 0x015135 05:9125: 8D B0 05  STA ram_palette_id_spr + 2
C - - - - - 0x015138 05:9128: AD CC 05  LDA ram_счетчик_смен
C - - - - - 0x01513B 05:912B: D0 06     BNE bra_9133
C - - - - - 0x01513D 05:912D: AD B0 05  LDA ram_palette_id_spr + 2
C - - - - - 0x015140 05:9130: 4C 36 91  JMP loc_9136
bra_9133:
C - - - - - 0x015143 05:9133: B9 D7 BD  LDA tbl_BDD7,Y
loc_9136:
C D 0 - - - 0x015146 05:9136: 8D B1 05  STA ram_palette_id_spr + 3
C - - - - - 0x015149 05:9139: A9 01     LDA #$01
C - - - - - 0x01514B 05:913B: 8D AE 05  STA ram_palette_id_spr
C - - - - - 0x01514E 05:913E: 8D AF 05  STA ram_palette_id_spr + 1
C - - - - - 0x015151 05:9141: A0 00     LDY #$00
C - - - - - 0x015153 05:9143: A2 00     LDX #$00
C - - - - - 0x015155 05:9145: AD 2E 05  LDA ram_счет_команды
C - - - - - 0x015158 05:9148: CD 2F 05  CMP ram_счет_команды + 1
C - - - - - 0x01515B 05:914B: F0 04     BEQ bra_9151
C - - - - - 0x01515D 05:914D: C8        INY
C - - - - - 0x01515E 05:914E: 90 01     BCC bra_9151
C - - - - - 0x015160 05:9150: C8        INY
bra_9151:
C - - - - - 0x015161 05:9151: 98        TYA
C - - - - - 0x015162 05:9152: 0A        ASL
C - - - - - 0x015163 05:9153: 0A        ASL
C - - - - - 0x015164 05:9154: A8        TAY
C - - - - - 0x015165 05:9155: AD CC 05  LDA ram_счетчик_смен
C - - - - - 0x015168 05:9158: F0 02     BEQ bra_915C
C - - - - - 0x01516A 05:915A: C8        INY
C - - - - - 0x01516B 05:915B: C8        INY
bra_915C:
C - - - - - 0x01516C 05:915C: B9 84 91  LDA tbl_9184,Y
C - - - - - 0x01516F 05:915F: 9D 5A 04  STA ram_movement_id_player + 1,X
C - - - - - 0x015172 05:9162: BD 90 91  LDA tbl_9190,X
C - - - - - 0x015175 05:9165: 9D 15 03  STA ram_pos_X_lo_player + 1,X
C - - - - - 0x015178 05:9168: BD 91 91  LDA tbl_9191,X
C - - - - - 0x01517B 05:916B: 9D 4E 03  STA ram_pos_Y_lo_player + 1,X
C - - - - - 0x01517E 05:916E: A9 00     LDA #$00
C - - - - - 0x015180 05:9170: 9D 28 03  STA ram_pos_X_hi_player + 1,X
C - - - - - 0x015183 05:9173: 9D 61 03  STA ram_pos_Y_hi_player + 1,X
C - - - - - 0x015186 05:9176: 9D 87 03  STA ram_pos_Z_lo_player + 1,X
C - - - - - 0x015189 05:9179: 9D 9A 03  STA ram_pos_Z_hi_player + 1,X
C - - - - - 0x01518C 05:917C: E8        INX
C - - - - - 0x01518D 05:917D: E8        INX
C - - - - - 0x01518E 05:917E: C8        INY
C - - - - - 0x01518F 05:917F: E0 04     CPX #$04
C - - - - - 0x015191 05:9181: 90 D9     BCC bra_915C
C - - - - - 0x015193 05:9183: 60        RTS



tbl_9184:
- D 0 - - - 0x015194 05:9184: 01        .byte $01   ; 
- D 0 - - - 0x015195 05:9185: 04        .byte $04   ; 
- D 0 - - - 0x015196 05:9186: 01        .byte $01   ; 
- D 0 - - - 0x015197 05:9187: 04        .byte $04   ; 
- D 0 - - - 0x015198 05:9188: 03        .byte $03   ; 
- D 0 - - - 0x015199 05:9189: 06        .byte $06   ; 
- D 0 - - - 0x01519A 05:918A: 02        .byte $02   ; 
- D 0 - - - 0x01519B 05:918B: 05        .byte $05   ; 
- D 0 - - - 0x01519C 05:918C: 02        .byte $02   ; 
- D 0 - - - 0x01519D 05:918D: 05        .byte $05   ; 
- D 0 - - - 0x01519E 05:918E: 03        .byte $03   ; 
- D 0 - - - 0x01519F 05:918F: 06        .byte $06   ; 



tbl_9190:
- D 0 - - - 0x0151A0 05:9190: 64        .byte $64   ; 
tbl_9191:
- D 0 - - - 0x0151A1 05:9191: 72        .byte $72   ; 
- D 0 - - - 0x0151A2 05:9192: 3C        .byte $3C   ; 
- D 0 - - - 0x0151A3 05:9193: 74        .byte $74   ; 



sub_9194:
C - - - - - 0x0151A4 05:9194: BD 59 04  LDA ram_movement_id_player,X
C - - - - - 0x0151A7 05:9197: 20 53 C0  JSR sub_0x01EC9F_jump_to_pointers_after_JSR
- - - - - - 0x0151AA 05:919A: AE 91     .word _общий_RTS
- D 0 - I - 0x0151AC 05:919C: AF 91     .word ofs_91AF_01
- D 0 - I - 0x0151AE 05:919E: AF 91     .word ofs_91AF_02
- D 0 - I - 0x0151B0 05:91A0: AF 91     .word ofs_91AF_03
- D 0 - I - 0x0151B2 05:91A2: AF 91     .word ofs_91AF_04
- D 0 - I - 0x0151B4 05:91A4: AF 91     .word ofs_91AF_05
- D 0 - I - 0x0151B6 05:91A6: AF 91     .word ofs_91AF_06
- D 0 - I - 0x0151B8 05:91A8: AF 91     .word ofs_91AF_07
- D 0 - I - 0x0151BA 05:91AA: AF 91     .word ofs_91AF_08
- D 0 - I - 0x0151BC 05:91AC: AF 91     .word ofs_91AF_09


; bzk
ofs_91AF_01:
ofs_91AF_02:
ofs_91AF_03:
ofs_91AF_04:
ofs_91AF_05:
ofs_91AF_06:
ofs_91AF_07:
ofs_91AF_08:
ofs_91AF_09:
C - - J - - 0x0151BF 05:91AF: BD 59 04  LDA ram_movement_id_player,X
C - - - - - 0x0151C2 05:91B2: 30 03     BMI bra_91B7
C - - - - - 0x0151C4 05:91B4: 20 BB 91  JSR sub_91BB
bra_91B7:
C - - - - - 0x0151C7 05:91B7: 20 D5 91  JSR sub_91D5
C - - - - - 0x0151CA 05:91BA: 60        RTS



sub_91BB:
C - - - - - 0x0151CB 05:91BB: 09 80     ORA #$80
C - - - - - 0x0151CD 05:91BD: 9D 59 04  STA ram_movement_id_player,X
C - - - - - 0x0151D0 05:91C0: A9 00     LDA #$00
C - - - - - 0x0151D2 05:91C2: 9D 87 00  STA ram_timer_animation_player,X
C - - - - - 0x0151D5 05:91C5: 9D 94 00  STA ram_номер_кадра_анимации,X
C - - - - - 0x0151D8 05:91C8: 9D 6C 04  STA ram_animation_type_player,X
C - - - - - 0x0151DB 05:91CB: 60        RTS



ofs_91CC:
- - - - - - 0x0151DC 05:91CC: BD 59 04  LDA ram_movement_id_player,X
- - - - - - 0x0151DF 05:91CF: 29 7F     AND #$7F
- - - - - - 0x0151E1 05:91D1: 9D 59 04  STA ram_movement_id_player,X
- - - - - - 0x0151E4 05:91D4: 60        RTS



sub_91D5:
C - - - - - 0x0151E5 05:91D5: AD F0 91  LDA tbl_91F0
C - - - - - 0x0151E8 05:91D8: 85 30     STA ram_0030
C - - - - - 0x0151EA 05:91DA: AD F1 91  LDA tbl_91F0 + 1
C - - - - - 0x0151ED 05:91DD: 85 31     STA ram_0031
C - - - - - 0x0151EF 05:91DF: AD F2 91  LDA tbl_91F2
C - - - - - 0x0151F2 05:91E2: 85 32     STA ram_0032
C - - - - - 0x0151F4 05:91E4: AD F3 91  LDA tbl_91F2 + 1
C - - - - - 0x0151F7 05:91E7: 85 33     STA ram_0033
C - - - - - 0x0151F9 05:91E9: BD 59 04  LDA ram_movement_id_player,X
C D 0 - I - 0x0151FC 05:91EC: 20 56 C0  JSR sub_0x01CECD_вычислить_анимацию
C - - - - - 0x0151FF 05:91EF: 60        RTS



tbl_91F0:
- D 0 - - - 0x015200 05:91F0: F4 91     .word tbl_91F4

tbl_91F2:
- D 0 - - - 0x015202 05:91F2: CC 91     .word ofs_91CC

tbl_91F4:
- - - - - - 0x015204 05:91F4: 08 92     .word off_9208_00
- D 0 - I - 0x015206 05:91F6: 08 92     .word off_9208_01
- D 0 - I - 0x015208 05:91F8: 1A 92     .word off_921A_02
- D 0 - I - 0x01520A 05:91FA: 24 92     .word off_9224_03
- D 0 - I - 0x01520C 05:91FC: 0D 92     .word off_920D_04
- D 0 - I - 0x01520E 05:91FE: 1F 92     .word off_921F_05
- D 0 - I - 0x015210 05:9200: 29 92     .word off_9229_06
- D 0 - I - 0x015212 05:9202: 2E 92     .word off_922E_07
- D 0 - I - 0x015214 05:9204: 33 92     .word off_9233_08
- D 0 - I - 0x015216 05:9206: 44 92     .word off_9244_09



off_9208_00:
off_9208_01:
- D 0 - I - 0x015218 05:9208: 09        .byte $09   ; 
- D 0 - I - 0x015219 05:9209: 82        .byte $82   ; 
- D 0 - I - 0x01521A 05:920A: 09        .byte $09   ; 
- D 0 - I - 0x01521B 05:920B: 83        .byte $83   ; 
- D 0 - I - 0x01521C 05:920C: FE        .byte $FE   ; 



off_920D_04:
- D 0 - I - 0x01521D 05:920D: 20        .byte $20   ; 
- D 0 - I - 0x01521E 05:920E: 8E        .byte $8E   ; 
- D 0 - I - 0x01521F 05:920F: 06        .byte $06   ; 
- D 0 - I - 0x015220 05:9210: 8F        .byte $8F   ; 
- D 0 - I - 0x015221 05:9211: 06        .byte $06   ; 
- D 0 - I - 0x015222 05:9212: 8E        .byte $8E   ; 
- D 0 - I - 0x015223 05:9213: 06        .byte $06   ; 
- D 0 - I - 0x015224 05:9214: 8F        .byte $8F   ; 
- D 0 - I - 0x015225 05:9215: 06        .byte $06   ; 
- D 0 - I - 0x015226 05:9216: 8E        .byte $8E   ; 
- D 0 - I - 0x015227 05:9217: 06        .byte $06   ; 
- D 0 - I - 0x015228 05:9218: 8F        .byte $8F   ; 
- D 0 - I - 0x015229 05:9219: FE        .byte $FE   ; 



off_921A_02:
- D 0 - I - 0x01522A 05:921A: 08        .byte $08   ; 
- D 0 - I - 0x01522B 05:921B: 86        .byte $86   ; 
- D 0 - I - 0x01522C 05:921C: 18        .byte $18   ; 
- D 0 - I - 0x01522D 05:921D: 87        .byte $87   ; 
- D 0 - I - 0x01522E 05:921E: FE        .byte $FE   ; 



off_921F_05:
- D 0 - I - 0x01522F 05:921F: 08        .byte $08   ; 
- D 0 - I - 0x015230 05:9220: 92        .byte $92   ; 
- D 0 - I - 0x015231 05:9221: 18        .byte $18   ; 
- D 0 - I - 0x015232 05:9222: 93        .byte $93   ; 
- D 0 - I - 0x015233 05:9223: FE        .byte $FE   ; 



off_9224_03:
- D 0 - I - 0x015234 05:9224: 09        .byte $09   ; 
- D 0 - I - 0x015235 05:9225: 84        .byte $84   ; 
- D 0 - I - 0x015236 05:9226: 09        .byte $09   ; 
- D 0 - I - 0x015237 05:9227: 85        .byte $85   ; 
- D 0 - I - 0x015238 05:9228: FE        .byte $FE   ; 



off_9229_06:
- D 0 - I - 0x015239 05:9229: 04        .byte $04   ; 
- D 0 - I - 0x01523A 05:922A: 90        .byte $90   ; 
- D 0 - I - 0x01523B 05:922B: 04        .byte $04   ; 
- D 0 - I - 0x01523C 05:922C: 91        .byte $91   ; 
- D 0 - I - 0x01523D 05:922D: FE        .byte $FE   ; 



off_922E_07:
- D 0 - I - 0x01523E 05:922E: 14        .byte $14   ; 
- D 0 - I - 0x01523F 05:922F: 87        .byte $87   ; 
- D 0 - I - 0x015240 05:9230: 14        .byte $14   ; 
- D 0 - I - 0x015241 05:9231: 8A        .byte $8A   ; 
- D 0 - I - 0x015242 05:9232: FE        .byte $FE   ; 



off_9233_08:
- D 0 - I - 0x015243 05:9233: 06        .byte $06   ; 
- D 0 - I - 0x015244 05:9234: 9B        .byte $9B   ; 
- D 0 - I - 0x015245 05:9235: 06        .byte $06   ; 
- D 0 - I - 0x015246 05:9236: 9C        .byte $9C   ; 
- D 0 - I - 0x015247 05:9237: 06        .byte $06   ; 
- D 0 - I - 0x015248 05:9238: 9B        .byte $9B   ; 
- D 0 - I - 0x015249 05:9239: 06        .byte $06   ; 
- D 0 - I - 0x01524A 05:923A: 9C        .byte $9C   ; 
- D 0 - I - 0x01524B 05:923B: 06        .byte $06   ; 
- D 0 - I - 0x01524C 05:923C: 9B        .byte $9B   ; 
- D 0 - I - 0x01524D 05:923D: 06        .byte $06   ; 
- D 0 - I - 0x01524E 05:923E: 9C        .byte $9C   ; 
- D 0 - I - 0x01524F 05:923F: 36        .byte $36   ; 
- D 0 - I - 0x015250 05:9240: 9B        .byte $9B   ; 
- D 0 - I - 0x015251 05:9241: 15        .byte $15   ; 
- D 0 - I - 0x015252 05:9242: 9D        .byte $9D   ; 
- D 0 - I - 0x015253 05:9243: FE        .byte $FE   ; 



off_9244_09:
- D 0 - I - 0x015254 05:9244: 10        .byte $10   ; 
- D 0 - I - 0x015255 05:9245: 80        .byte $80   ; 
- D 0 - I - 0x015256 05:9246: 10        .byte $10   ; 
- D 0 - I - 0x015257 05:9247: 9E        .byte $9E   ; 
- D 0 - I - 0x015258 05:9248: 10        .byte $10   ; 
- D 0 - I - 0x015259 05:9249: 80        .byte $80   ; 
- D 0 - I - 0x01525A 05:924A: 10        .byte $10   ; 
- D 0 - I - 0x01525B 05:924B: 9F        .byte $9F   ; 
- D 0 - I - 0x01525C 05:924C: FE        .byte $FE   ; 



sub_924D:
C - - - - - 0x01525D 05:924D: AC CC 05  LDY ram_счетчик_смен
C - - - - - 0x015260 05:9250: B9 32 05  LDA ram_player_id,Y
C - - - - - 0x015263 05:9253: 8D D1 05  STA ram_05D1
C - - - - - 0x015266 05:9256: AD CA 05  LDA ram_номер_опции
C - - - - - 0x015269 05:9259: 0A        ASL
C - - - - - 0x01526A 05:925A: A8        TAY
C - - - - - 0x01526B 05:925B: A5 57     LDA ram_option_mode_difficulty
C - - - - - 0x01526D 05:925D: 30 01     BMI bra_9260_walkthrough
C - - - - - 0x01526F 05:925F: C8        INY
bra_9260_walkthrough:
C - - - - - 0x015270 05:9260: B9 BF 92  LDA tbl_92BF,Y
C - - - - - 0x015273 05:9263: 10 0B     BPL bra_9270
C - - - - - 0x015275 05:9265: 0A        ASL
C - - - - - 0x015276 05:9266: 10 08     BPL bra_9270
C - - - - - 0x015278 05:9268: A9 34     LDA #con_sfx_no
C - - - - - 0x01527A 05:926A: 20 02 C0  JSR sub_0x01C2F4_play_sound
C - - - - - 0x01527D 05:926D: 4C BE 92  RTS
bra_9270:
C - - - - - 0x015280 05:9270: 84 44     STY ram_0044
C - - - - - 0x015282 05:9272: A9 33     LDA #con_sfx_yes
C - - - - - 0x015284 05:9274: 20 02 C0  JSR sub_0x01C2F4_play_sound
C - - - - - 0x015287 05:9277: 20 44 C0  JSR sub_0x01D057
C - - - - - 0x01528A 05:927A: 20 4A C0  JSR sub_0x01D072
C - - - - - 0x01528D 05:927D: A4 44     LDY ram_0044
C - - - - - 0x01528F 05:927F: B9 BF 92  LDA tbl_92BF,Y
C - - - - - 0x015292 05:9282: F0 17     BEQ bra_929B
C - - - - - 0x015294 05:9284: 30 2A     BMI bra_92B0
C - - - - - 0x015296 05:9286: C9 09     CMP #$09
C - - - - - 0x015298 05:9288: D0 07     BNE bra_9291
C - - - - - 0x01529A 05:928A: AC 4A 05  LDY ram_054A
C - - - - - 0x01529D 05:928D: 30 02     BMI bra_9291
- - - - - - 0x01529F 05:928F: A9 0F     LDA #$0F
bra_9291:
C - - - - - 0x0152A1 05:9291: 85 59     STA ram_subscript
C - - - - - 0x0152A3 05:9293: A9 04     LDA #$04
C - - - - - 0x0152A5 05:9295: 8D 5B 00  STA ram_for_0059
C - - - - - 0x0152A8 05:9298: 4C BE 92  RTS
bra_929B:
C - - - - - 0x0152AB 05:929B: 20 7D C0  JSR sub_0x01C345
C - - - - - 0x0152AE 05:929E: A9 00     LDA #$00    ; con_script_gameplay
C - - - - - 0x0152B0 05:92A0: 8D CC 05  STA ram_счетчик_смен
C - - - - - 0x0152B3 05:92A3: 85 58     STA ram_script
C - - - - - 0x0152B5 05:92A5: 85 59     STA ram_subscript
C - - - - - 0x0152B7 05:92A7: 20 84 BB  JSR sub_BB84
C - - - - - 0x0152BA 05:92AA: 20 0F 80  JSR sub_0x01C263_выставить_базовые_параметры_игроков
C - - - - - 0x0152BD 05:92AD: 4C BE 92  RTS
bra_92B0:
C - - - - - 0x0152C0 05:92B0: AD CC 05  LDA ram_счетчик_смен
C - - - - - 0x0152C3 05:92B3: D0 E6     BNE bra_929B
C - - - - - 0x0152C5 05:92B5: EE CC 05  INC ram_счетчик_смен
C - - - - - 0x0152C8 05:92B8: A5 59     LDA ram_subscript
C - - - - - 0x0152CA 05:92BA: 29 7F     AND #$7F
C - - - - - 0x0152CC 05:92BC: 85 59     STA ram_subscript
C D 0 - - - 0x0152CE 05:92BE: 60        RTS



tbl_92BF:
- D 0 - - - 0x0152CF 05:92BF: 07        .byte $07   ; 
- D 0 - - - 0x0152D0 05:92C0: 07        .byte $07   ; 
- D 0 - - - 0x0152D1 05:92C1: 0D        .byte $0D   ; 
- D 0 - - - 0x0152D2 05:92C2: FF        .byte $FF   ; 
- D 0 - - - 0x0152D3 05:92C3: 00        .byte $00   ; 
- D 0 - - - 0x0152D4 05:92C4: 80        .byte $80   ; 
- D 0 - - - 0x0152D5 05:92C5: 08        .byte $08   ; 
- D 0 - - - 0x0152D6 05:92C6: 08        .byte $08   ; 
- D 0 - - - 0x0152D7 05:92C7: 09        .byte $09   ; 
- D 0 - - - 0x0152D8 05:92C8: FF        .byte $FF   ; 
- D 0 - - - 0x0152D9 05:92C9: 0A        .byte $0A   ; 
- D 0 - - - 0x0152DA 05:92CA: FF        .byte $FF   ; 
- D 0 - - - 0x0152DB 05:92CB: 0B        .byte $0B   ; 
- D 0 - - - 0x0152DC 05:92CC: 0B        .byte $0B   ; 



sub_92CD:
C - - - - - 0x0152DD 05:92CD: AC CC 05  LDY ram_счетчик_смен
C - - - - - 0x0152E0 05:92D0: B9 2C 05  LDA ram_номер_команды,Y
C - - - - - 0x0152E3 05:92D3: 29 0F     AND #$0F
C - - - - - 0x0152E5 05:92D5: 0A        ASL
C - - - - - 0x0152E6 05:92D6: A8        TAY
C - - - - - 0x0152E7 05:92D7: B9 13 93  LDA tbl_9313,Y
C - - - - - 0x0152EA 05:92DA: 85 30     STA ram_0030
C - - - - - 0x0152EC 05:92DC: B9 14 93  LDA tbl_9313 + 1,Y
C - - - - - 0x0152EF 05:92DF: 85 31     STA ram_0031
C - - - - - 0x0152F1 05:92E1: A9 FF     LDA #$FF
C - - - - - 0x0152F3 05:92E3: 85 1C     STA ram_001C
C - - - - - 0x0152F5 05:92E5: A0 DA     LDY #$DA
C - - - - - 0x0152F7 05:92E7: 84 1D     STY ram_001D
C - - - - - 0x0152F9 05:92E9: C8        INY
C - - - - - 0x0152FA 05:92EA: 84 1E     STY ram_001E
C - - - - - 0x0152FC 05:92EC: A9 06     LDA #$06
C - - - - - 0x0152FE 05:92EE: 85 1F     STA ram_001F
C - - - - - 0x015300 05:92F0: 8D 95 06  STA ram_счетчик_буфера_атрибутов
C - - - - - 0x015303 05:92F3: 8D B8 06  STA ram_счетчик_буфера_графики
C - - - - - 0x015306 05:92F6: 20 91 AD  JSR sub_AD91
C - - - - - 0x015309 05:92F9: A5 1F     LDA ram_001F
C - - - - - 0x01530B 05:92FB: A9 4B     LDA #$4B
C - - - - - 0x01530D 05:92FD: 8D 94 06  STA ram_байт_2006_lo_атрибуты
C - - - - - 0x015310 05:9300: A9 6B     LDA #$6B
C - - - - - 0x015312 05:9302: 8D B7 06  STA ram_байт_2006_lo_графика
C - - - - - 0x015315 05:9305: A9 20     LDA #$20
C - - - - - 0x015317 05:9307: 8D 93 06  STA ram_байт_2006_hi_атрибуты
C - - - - - 0x01531A 05:930A: 8D B6 06  STA ram_байт_2006_hi_графика
bra_930D:
C - - - - - 0x01531D 05:930D: AD 93 06  LDA ram_байт_2006_hi_атрибуты
C - - - - - 0x015320 05:9310: 10 FB     BPL bra_930D
C - - - - - 0x015322 05:9312: 60        RTS



tbl_9313:
- D 0 - - - 0x015323 05:9313: 33 93     .word off_9333_00_япония
- - - - - - 0x015325 05:9315: 39 93     .word off_9339_01
- - - - - - 0x015327 05:9317: 39 93     .word off_9339_02
- - - - - - 0x015329 05:9319: 39 93     .word off_9339_03
- - - - - - 0x01532B 05:931B: 39 93     .word off_9339_04
- - - - - - 0x01532D 05:931D: 39 93     .word off_9339_05
- - - - - - 0x01532F 05:931F: 39 93     .word off_9339_06
- D 0 - - - 0x015331 05:9321: 39 93     .word off_9339_07
- - - - - - 0x015333 05:9323: 3F 93     .word off_933F_08
- D 0 - - - 0x015335 05:9325: 3F 93     .word off_933F_09
- - - - - - 0x015337 05:9327: 45 93     .word off_9345_0A
- D 0 - - - 0x015339 05:9329: 45 93     .word off_9345_0B
- - - - - - 0x01533B 05:932B: 4B 93     .word off_934B_0C
- D 0 - - - 0x01533D 05:932D: 4B 93     .word off_934B_0D
- D 0 - - - 0x01533F 05:932F: 51 93     .word off_9351_0E
- - - - - - 0x015341 05:9331: 57 93     .word off_9357_0F



off_9333_00_япония:
- D 0 - I - 0x015343 05:9333: B9        .byte $B9   ; 
- D 0 - I - 0x015344 05:9334: D0        .byte $D0   ; 
- D 0 - I - 0x015345 05:9335: AA        .byte $AA   ; 
- D 0 - I - 0x015346 05:9336: B3        .byte $B3   ; 
- D 0 - I - 0x015347 05:9337: 8F        .byte $8F   ; 
- D 0 - I - 0x015348 05:9338: 8C        .byte $8C   ; 



off_9339_01:
off_9339_02:
off_9339_03:
off_9339_04:
off_9339_05:
off_9339_06:
off_9339_07:
- D 0 - I - 0x015349 05:9339: A7        .byte $A7   ; 
- D 0 - I - 0x01534A 05:933A: C3        .byte $C3   ; 
- D 0 - I - 0x01534B 05:933B: CA        .byte $CA   ; 
- D 0 - I - 0x01534C 05:933C: D9        .byte $D9   ; 
- D 0 - I - 0x01534D 05:933D: CF        .byte $CF   ; 
- D 0 - I - 0x01534E 05:933E: FF        .byte $FF   ; 



off_933F_08:
off_933F_09:
- D 0 - I - 0x01534F 05:933F: 35        .byte $35   ; 
- D 0 - I - 0x015350 05:9340: A3        .byte $A3   ; 
- D 0 - I - 0x015351 05:9341: B3        .byte $B3   ; 
- D 0 - I - 0x015352 05:9342: FF        .byte $FF   ; 
- D 0 - I - 0x015353 05:9343: FF        .byte $FF   ; 
- D 0 - I - 0x015354 05:9344: FF        .byte $FF   ; 



off_9345_0A:
off_9345_0B:
- D 0 - I - 0x015355 05:9345: A3        .byte $A3   ; 
- D 0 - I - 0x015356 05:9346: B1        .byte $B1   ; 
- D 0 - I - 0x015357 05:9347: C9        .byte $C9   ; 
- D 0 - I - 0x015358 05:9348: A2        .byte $A2   ; 
- D 0 - I - 0x015359 05:9349: FF        .byte $FF   ; 
- D 0 - I - 0x01535A 05:934A: FF        .byte $FF   ; 



off_934B_0C:
off_934B_0D:
- D 0 - I - 0x01535B 05:934B: 3D        .byte $3D   ; 
- D 0 - I - 0x01535C 05:934C: C8        .byte $C8   ; 
- D 0 - I - 0x01535D 05:934D: 2D        .byte $2D   ; 
- D 0 - I - 0x01535E 05:934E: CA        .byte $CA   ; 
- D 0 - I - 0x01535F 05:934F: FF        .byte $FF   ; 
- D 0 - I - 0x015360 05:9350: FF        .byte $FF   ; 



off_9351_0E:
- D 0 - I - 0x015361 05:9351: A2        .byte $A2   ; 
- D 0 - I - 0x015362 05:9352: CA        .byte $CA   ; 
- D 0 - I - 0x015363 05:9353: 2F        .byte $2F   ; 
- D 0 - I - 0x015364 05:9354: CF        .byte $CF   ; 
- D 0 - I - 0x015365 05:9355: B2        .byte $B2   ; 
- D 0 - I - 0x015366 05:9356: CF        .byte $CF   ; 


; bzk мусор
off_9357_0F:
ofs_80A9_06_выбор_погоды:
C - - - - - 0x015367 05:9357: A5 59     LDA ram_subscript
C - - - - - 0x015369 05:9359: 30 06     BMI bra_9361
C - - - - - 0x01536B 05:935B: 20 DF 80  JSR sub_80DF
C - - - - - 0x01536E 05:935E: 20 96 93  JSR sub_9396
bra_9361:
C - - - - - 0x015371 05:9361: 20 C2 94  JSR sub_94C2
C - - - - - 0x015374 05:9364: AD F0 00  LDA ram_pos_X_lo_camera     ; bzk опт, подпрограмма 0x01CAFE
C - - - - - 0x015377 05:9367: 8D EC 00  STA ram_pos_X_lo_scroll
C - - - - - 0x01537A 05:936A: AD F1 00  LDA ram_pos_X_hi_camera
C - - - - - 0x01537D 05:936D: 8D ED 00  STA ram_pos_X_hi_scroll
C - - - - - 0x015380 05:9370: AD F2 00  LDA ram_pos_Y_lo_camera
C - - - - - 0x015383 05:9373: 8D EE 00  STA ram_pos_Y_lo_scroll
C - - - - - 0x015386 05:9376: AD F3 00  LDA ram_pos_Y_hi_camera
C - - - - - 0x015389 05:9379: 8D EF 00  STA ram_pos_Y_hi_scroll
C - - - - - 0x01538C 05:937C: AD C9 05  LDA ram_счетчик_опций
C - - - - - 0x01538F 05:937F: 20 53 C0  JSR sub_0x01EC9F_jump_to_pointers_after_JSR
- D 0 - I - 0x015392 05:9382: 03 94     .word ofs_9403_00
- - - - - - 0x015394 05:9384: 03 94     .word ofs_9403_01
- D 0 - I - 0x015396 05:9386: 14 94     .word ofs_9414_02
- D 0 - I - 0x015398 05:9388: 14 94     .word ofs_9414_03
- D 0 - I - 0x01539A 05:938A: 14 94     .word ofs_9414_04
- D 0 - I - 0x01539C 05:938C: 14 94     .word ofs_9414_05
- D 0 - I - 0x01539E 05:938E: 14 94     .word ofs_9414_06
- D 0 - I - 0x0153A0 05:9390: 14 94     .word ofs_9414_07
- D 0 - I - 0x0153A2 05:9392: 14 94     .word ofs_9414_08
- D 0 - I - 0x0153A4 05:9394: 14 94     .word ofs_9414_09



sub_9396:
C - - - - - 0x0153A6 05:9396: A9 FF     LDA #$FF
C - - - - - 0x0153A8 05:9398: 8D CA 05  STA ram_номер_опции
C - - - - - 0x0153AB 05:939B: A9 7F     LDA #$7F
C - - - - - 0x0153AD 05:939D: 8D 74 00  STA ram_animation_id_player
C - - - - - 0x0153B0 05:93A0: 8D 75 00  STA ram_animation_id_player + 1
C - - - - - 0x0153B3 05:93A3: 8D 76 00  STA ram_animation_id_player + 2
C - - - - - 0x0153B6 05:93A6: 8D 77 00  STA ram_animation_id_player + 3
C - - - - - 0x0153B9 05:93A9: A9 05     LDA #$05
C - - - - - 0x0153BB 05:93AB: 8D 61 00  STA ram_0061
C - - - - - 0x0153BE 05:93AE: 8D 62 00  STA ram_0062
C - - - - - 0x0153C1 05:93B1: A9 01     LDA #$01
C - - - - - 0x0153C3 05:93B3: 8D AE 05  STA ram_palette_id_spr
C - - - - - 0x0153C6 05:93B6: 8D AF 05  STA ram_palette_id_spr + 1
C - - - - - 0x0153C9 05:93B9: 8D B0 05  STA ram_palette_id_spr + 2
C - - - - - 0x0153CC 05:93BC: 8D B1 05  STA ram_palette_id_spr + 3
C - - - - - 0x0153CF 05:93BF: A2 26     LDX #$26
C - - - - - 0x0153D1 05:93C1: 8E B8 05  STX ram_банк_спрайтов
C - - - - - 0x0153D4 05:93C4: E8        INX
C - - - - - 0x0153D5 05:93C5: 8E B9 05  STX ram_банк_спрайтов + 1
C - - - - - 0x0153D8 05:93C8: 20 0B C0  JSR sub_0x01EEAA_базовые_банки_спрайтов
C - - - - - 0x0153DB 05:93CB: AD C9 05  LDA ram_счетчик_опций
C - - - - - 0x0153DE 05:93CE: 48        PHA
C - - - - - 0x0153DF 05:93CF: 20 11 C0  JSR sub_0x01ECB9
C - - - - - 0x0153E2 05:93D2: 20 17 C0  JSR sub_0x01EE81_disable_NMI
C - - - - - 0x0153E5 05:93D5: 20 1D C0  JSR sub_0x01ECD1_скрыть_фон_и_спрайты_за_полоской_слева
C - - - - - 0x0153E8 05:93D8: A9 02     LDA #$02
C - - - - - 0x0153EA 05:93DA: 8D C9 05  STA ram_счетчик_опций
bra_93DD:
C - - - - - 0x0153ED 05:93DD: 20 5D 95  JSR sub_955D_опции_погоды
C - - - - - 0x0153F0 05:93E0: 20 AA 96  JSR sub_96AA
C - - - - - 0x0153F3 05:93E3: 20 6B C0  JSR sub_0x01EFBD_write_buffers_to_ppu
C - - - - - 0x0153F6 05:93E6: EE C9 05  INC ram_счетчик_опций
C - - - - - 0x0153F9 05:93E9: AD C9 05  LDA ram_счетчик_опций
C - - - - - 0x0153FC 05:93EC: C9 0A     CMP #$0A
C - - - - - 0x0153FE 05:93EE: 90 ED     BCC bra_93DD
C - - - - - 0x015400 05:93F0: 20 1A C0  JSR sub_0x01ECDB_отобразить_фон_и_спрайты
C - - - - - 0x015403 05:93F3: 20 14 C0  JSR sub_0x01EE75_enable_NMI
C - - - - - 0x015406 05:93F6: 68        PLA
C - - - - - 0x015407 05:93F7: 8D C9 05  STA ram_счетчик_опций
C - - - - - 0x01540A 05:93FA: 20 5D 95  JSR sub_955D_опции_погоды
C - - - - - 0x01540D 05:93FD: A9 02     LDA #con_music_menu
C - - - - - 0x01540F 05:93FF: 20 02 C0  JSR sub_0x01C2F4_play_sound
C - - - - - 0x015412 05:9402: 60        RTS



ofs_9403_00:
ofs_9403_01:
C - - J - - 0x015413 05:9403: AD B2 05  LDA ram_flag_brightness
C - - - - - 0x015416 05:9406: 10 06     BPL bra_940E
C - - - - - 0x015418 05:9408: EE C9 05  INC ram_счетчик_опций
C - - - - - 0x01541B 05:940B: EE C9 05  INC ram_счетчик_опций
bra_940E:
C - - - - - 0x01541E 05:940E: 20 5C C0  JSR sub_0x01D083
C - - - - - 0x015421 05:9411: 4C 9A 94  JMP loc_949A



ofs_9414_02:
ofs_9414_03:
ofs_9414_04:
ofs_9414_05:
ofs_9414_06:
ofs_9414_07:
ofs_9414_08:
ofs_9414_09:
C - - J - - 0x015424 05:9414: A2 00     LDX #$00
C - - - - - 0x015426 05:9416: AD CA 05  LDA ram_номер_опции
C - - - - - 0x015429 05:9419: 10 05     BPL bra_9420
- - - - - - 0x01542B 05:941B: A9 00     LDA #$00
- - - - - - 0x01542D 05:941D: 8D CA 05  STA ram_номер_опции
bra_9420:
C - - - - - 0x015430 05:9420: 20 7E 81  JSR sub_817E_конвертация_нажатых_кнопок_в_индекс
C - - - - - 0x015433 05:9423: 20 53 C0  JSR sub_0x01EC9F_jump_to_pointers_after_JSR
- D 0 - I - 0x015436 05:9426: 9A 94     .word ofs_949A_00_nothing
- D 0 - I - 0x015438 05:9428: 38 94     .word ofs_9438_01_Start
- - - - - - 0x01543A 05:942A: 9A 94     .word ofs_949A_02_Select
- D 0 - I - 0x01543C 05:942C: 43 94     .word ofs_9443_03_A
- - - - - - 0x01543E 05:942E: 56 94     .word ofs_9456_04_B
- D 0 - I - 0x015440 05:9430: 6F 94     .word ofs_946F_05_Up
- D 0 - I - 0x015442 05:9432: 80 94     .word ofs_9480_06_Down
- D 0 - I - 0x015444 05:9434: 5E 94     .word ofs_945E_07_Left
- D 0 - I - 0x015446 05:9436: 5E 94     .word ofs_945E_08_Right



ofs_9438_01_Start:
C - - J - - 0x015448 05:9438: A9 33     LDA #con_sfx_yes
C - - - - - 0x01544A 05:943A: 20 02 C0  JSR sub_0x01C2F4_play_sound
bra_943D:
C - - - - - 0x01544D 05:943D: 20 C3 97  JSR sub_97C3
C - - - - - 0x015450 05:9440: 4C 9A 94  JMP loc_949A



ofs_9443_03_A:
C - - J - - 0x015453 05:9443: A9 33     LDA #con_sfx_yes
C - - - - - 0x015455 05:9445: 20 02 C0  JSR sub_0x01C2F4_play_sound
C - - - - - 0x015458 05:9448: AD C9 05  LDA ram_счетчик_опций
C - - - - - 0x01545B 05:944B: C9 04     CMP #$04
C - - - - - 0x01545D 05:944D: F0 EE     BEQ bra_943D
C - - - - - 0x01545F 05:944F: C9 09     CMP #$09
C - - - - - 0x015461 05:9451: F0 EA     BEQ bra_943D
C - - - - - 0x015463 05:9453: 4C 85 94  JMP loc_9485



ofs_9456_04_B:
- - - - - - 0x015466 05:9456: A9 34     LDA #con_sfx_no
- - - - - - 0x015468 05:9458: 20 02 C0  JSR sub_0x01C2F4_play_sound
- - - - - - 0x01546B 05:945B: 4C 74 94  JMP loc_9474



ofs_945E_07_Left:
ofs_945E_08_Right:
C - - J - - 0x01546E 05:945E: A9 32     LDA #con_sfx_move_cursor
C - - - - - 0x015470 05:9460: 20 02 C0  JSR sub_0x01C2F4_play_sound
C - - - - - 0x015473 05:9463: 20 DD 81  JSR sub_81DD
C - - - - - 0x015476 05:9466: 20 E6 95  JSR sub_95E6
C - - - - - 0x015479 05:9469: 20 AA 96  JSR sub_96AA
C - - - - - 0x01547C 05:946C: 4C 9A 94  JMP loc_949A



ofs_946F_05_Up:
C - - J - - 0x01547F 05:946F: A9 32     LDA #con_sfx_move_cursor
C - - - - - 0x015481 05:9471: 20 02 C0  JSR sub_0x01C2F4_play_sound
loc_9474:
C - - - - - 0x015484 05:9474: 20 E6 95  JSR sub_95E6
C - - - - - 0x015487 05:9477: AC C9 05  LDY ram_счетчик_опций
C - - - - - 0x01548A 05:947A: B9 AE 94  LDA tbl_94AE,Y
C - - - - - 0x01548D 05:947D: 4C 8E 94  JMP loc_948E



ofs_9480_06_Down:
C - - J - - 0x015490 05:9480: A9 32     LDA #con_sfx_move_cursor
C - - - - - 0x015492 05:9482: 20 02 C0  JSR sub_0x01C2F4_play_sound
loc_9485:
C D 0 - - - 0x015495 05:9485: 20 E6 95  JSR sub_95E6
C - - - - - 0x015498 05:9488: AC C9 05  LDY ram_счетчик_опций
C - - - - - 0x01549B 05:948B: B9 B8 94  LDA tbl_94B8,Y
loc_948E:
C D 0 - - - 0x01549E 05:948E: 8D C9 05  STA ram_счетчик_опций
C - - - - - 0x0154A1 05:9491: 20 5D 95  JSR sub_955D_опции_погоды
C - - - - - 0x0154A4 05:9494: 20 05 9C  JSR sub_9C05
C - - - - - 0x0154A7 05:9497: 4C AD 94  RTS



loc_949A:
ofs_949A_00_nothing:
ofs_949A_02_Select:
C D 0 - - - 0x0154AA 05:949A: 20 05 9C  JSR sub_9C05
C - - - - - 0x0154AD 05:949D: A2 00     LDX #$00
C - - - - - 0x0154AF 05:949F: 20 2A 82  JSR sub_822A
C - - - - - 0x0154B2 05:94A2: A9 00     LDA #$00
C - - - - - 0x0154B4 05:94A4: 20 8D 82  JSR sub_828D
C - - - - - 0x0154B7 05:94A7: 20 65 C0  JSR sub_0x01EB9C
C - - - - - 0x0154BA 05:94AA: 20 14 80  JSR sub_0x01C2AE
C D 0 - - - 0x0154BD 05:94AD: 60        RTS



tbl_94AE:
- - - - - - 0x0154BE 05:94AE: 00        .byte $00   ; 
- - - - - - 0x0154BF 05:94AF: 00        .byte $00   ; 
- - - - - - 0x0154C0 05:94B0: 02        .byte $02   ; 
- - - - - - 0x0154C1 05:94B1: 02        .byte $02   ; 
- - - - - - 0x0154C2 05:94B2: 03        .byte $03   ; 
- D 0 - - - 0x0154C3 05:94B3: 04        .byte $04   ; 
- - - - - - 0x0154C4 05:94B4: 05        .byte $05   ; 
- - - - - - 0x0154C5 05:94B5: 06        .byte $06   ; 
- - - - - - 0x0154C6 05:94B6: 07        .byte $07   ; 
- - - - - - 0x0154C7 05:94B7: 08        .byte $08   ; 



tbl_94B8:
- - - - - - 0x0154C8 05:94B8: 00        .byte $00   ; 
- - - - - - 0x0154C9 05:94B9: 00        .byte $00   ; 
- D 0 - - - 0x0154CA 05:94BA: 03        .byte $03   ; 
- D 0 - - - 0x0154CB 05:94BB: 04        .byte $04   ; 
- D 0 - - - 0x0154CC 05:94BC: 05        .byte $05   ; 
- D 0 - - - 0x0154CD 05:94BD: 06        .byte $06   ; 
- D 0 - - - 0x0154CE 05:94BE: 07        .byte $07   ; 
- D 0 - - - 0x0154CF 05:94BF: 08        .byte $08   ; 
- D 0 - - - 0x0154D0 05:94C0: 09        .byte $09   ; 
- - - - - - 0x0154D1 05:94C1: 09        .byte $09   ; 



sub_94C2:
C - - - - - 0x0154D2 05:94C2: 20 05 82  JSR sub_8205_read_pointers_after_JSR
- D 0 - I - 0x0154D5 05:94C5: 1D 95     .word off_951D_00
- D 0 - I - 0x0154D7 05:94C7: ED 94     .word off_94ED_01
- - - - - - 0x0154D9 05:94C9: 1D 95     .word off_951D_02
- - - - - - 0x0154DB 05:94CB: ED 94     .word off_94ED_03
- D 0 - I - 0x0154DD 05:94CD: 1D 95     .word off_951D_04
- D 0 - I - 0x0154DF 05:94CF: ED 94     .word off_94ED_05
- D 0 - I - 0x0154E1 05:94D1: 25 95     .word off_9525_06
- D 0 - I - 0x0154E3 05:94D3: FD 94     .word off_94FD_07
- D 0 - I - 0x0154E5 05:94D5: 2B 95     .word off_952B_08
- D 0 - I - 0x0154E7 05:94D7: ED 94     .word off_94ED_09
- D 0 - I - 0x0154E9 05:94D9: 33 95     .word off_9533_0A
- D 0 - I - 0x0154EB 05:94DB: 09 95     .word off_9509_0B
- D 0 - I - 0x0154ED 05:94DD: 3D 95     .word off_953D_0C
- D 0 - I - 0x0154EF 05:94DF: 09 95     .word off_9509_0D
- D 0 - I - 0x0154F1 05:94E1: 47 95     .word off_9547_0E
- D 0 - I - 0x0154F3 05:94E3: FD 94     .word off_94FD_0F
- D 0 - I - 0x0154F5 05:94E5: 4D 95     .word off_954D_10
- D 0 - I - 0x0154F7 05:94E7: ED 94     .word off_94ED_11
- D 0 - I - 0x0154F9 05:94E9: 55 95     .word off_9555_12
- D 0 - I - 0x0154FB 05:94EB: ED 94     .word off_94ED_13



off_94ED_01:
off_94ED_03:
off_94ED_05:
off_94ED_09:
off_94ED_11:
off_94ED_13:
- - - - - - 0x0154FD 05:94ED: 00        .byte $00   ; 
- - - - - - 0x0154FE 05:94EE: 00        .byte $00   ; 
- D 0 - I - 0x0154FF 05:94EF: 00        .byte $00   ; 
- D 0 - I - 0x015500 05:94F0: 01        .byte $01   ; 
- - - - - - 0x015501 05:94F1: 00        .byte $00   ; 
- - - - - - 0x015502 05:94F2: 00        .byte $00   ; 
- D 0 - I - 0x015503 05:94F3: 00        .byte $00   ; 
- D 0 - I - 0x015504 05:94F4: 02        .byte $02   ; 
- - - - - - 0x015505 05:94F5: 00        .byte $00   ; 
- - - - - - 0x015506 05:94F6: 00        .byte $00   ; 
- D 0 - I - 0x015507 05:94F7: 01        .byte $01   ; 
- D 0 - I - 0x015508 05:94F8: 03        .byte $03   ; 
- - - - - - 0x015509 05:94F9: 00        .byte $00   ; 
- - - - - - 0x01550A 05:94FA: 00        .byte $00   ; 
- D 0 - I - 0x01550B 05:94FB: 02        .byte $02   ; 
- D 0 - I - 0x01550C 05:94FC: 03        .byte $03   ; 



off_94FD_07:
off_94FD_0F:
- - - - - - 0x01550D 05:94FD: 00        .byte $00   ; 
- - - - - - 0x01550E 05:94FE: 00        .byte $00   ; 
- D 0 - I - 0x01550F 05:94FF: 00        .byte $00   ; 
- D 0 - I - 0x015510 05:9500: 01        .byte $01   ; 
- - - - - - 0x015511 05:9501: 00        .byte $00   ; 
- - - - - - 0x015512 05:9502: 00        .byte $00   ; 
- D 0 - I - 0x015513 05:9503: 00        .byte $00   ; 
- D 0 - I - 0x015514 05:9504: 02        .byte $02   ; 
- - - - - - 0x015515 05:9505: 00        .byte $00   ; 
- - - - - - 0x015516 05:9506: 00        .byte $00   ; 
- D 0 - I - 0x015517 05:9507: 01        .byte $01   ; 
- D 0 - I - 0x015518 05:9508: 02        .byte $02   ; 



off_9509_0B:
off_9509_0D:
- - - - - - 0x015519 05:9509: 00        .byte $00   ; 
- - - - - - 0x01551A 05:950A: 00        .byte $00   ; 
- - - - - - 0x01551B 05:950B: 00        .byte $00   ; 
- D 0 - I - 0x01551C 05:950C: 01        .byte $01   ; 
- - - - - - 0x01551D 05:950D: 00        .byte $00   ; 
- - - - - - 0x01551E 05:950E: 00        .byte $00   ; 
- D 0 - I - 0x01551F 05:950F: 00        .byte $00   ; 
- D 0 - I - 0x015520 05:9510: 02        .byte $02   ; 
- - - - - - 0x015521 05:9511: 00        .byte $00   ; 
- - - - - - 0x015522 05:9512: 00        .byte $00   ; 
- D 0 - I - 0x015523 05:9513: 01        .byte $01   ; 
- D 0 - I - 0x015524 05:9514: 03        .byte $03   ; 
- - - - - - 0x015525 05:9515: 00        .byte $00   ; 
- - - - - - 0x015526 05:9516: 00        .byte $00   ; 
- D 0 - I - 0x015527 05:9517: 02        .byte $02   ; 
- D 0 - I - 0x015528 05:9518: 04        .byte $04   ; 
- - - - - - 0x015529 05:9519: 00        .byte $00   ; 
- - - - - - 0x01552A 05:951A: 00        .byte $00   ; 
- D 0 - I - 0x01552B 05:951B: 03        .byte $03   ; 
- - - - - - 0x01552C 05:951C: 04        .byte $04   ; 



off_951D_00:
off_951D_02:
off_951D_04:
- D 0 - I - 0x01552D 05:951D: 05        .byte $05   ; 
- D 0 - I - 0x01552E 05:951E: 07        .byte $07   ; 
- D 0 - I - 0x01552F 05:951F: 0A        .byte $0A   ; 
- D 0 - I - 0x015530 05:9520: 07        .byte $07   ; 
- D 0 - I - 0x015531 05:9521: 10        .byte $10   ; 
- D 0 - I - 0x015532 05:9522: 07        .byte $07   ; 
- D 0 - I - 0x015533 05:9523: 16        .byte $16   ; 
- D 0 - I - 0x015534 05:9524: 07        .byte $07   ; 



off_9525_06:
- D 0 - I - 0x015535 05:9525: 0A        .byte $0A   ; 
- D 0 - I - 0x015536 05:9526: 0F        .byte $0F   ; 
- D 0 - I - 0x015537 05:9527: 0E        .byte $0E   ; 
- D 0 - I - 0x015538 05:9528: 0F        .byte $0F   ; 
- D 0 - I - 0x015539 05:9529: 12        .byte $12   ; 
- D 0 - I - 0x01553A 05:952A: 0F        .byte $0F   ; 



off_952B_08:
- D 0 - I - 0x01553B 05:952B: 05        .byte $05   ; 
- D 0 - I - 0x01553C 05:952C: 17        .byte $17   ; 
- D 0 - I - 0x01553D 05:952D: 0B        .byte $0B   ; 
- D 0 - I - 0x01553E 05:952E: 17        .byte $17   ; 
- D 0 - I - 0x01553F 05:952F: 11        .byte $11   ; 
- D 0 - I - 0x015540 05:9530: 17        .byte $17   ; 
- D 0 - I - 0x015541 05:9531: 16        .byte $16   ; 
- D 0 - I - 0x015542 05:9532: 17        .byte $17   ; 



off_9533_0A:
- D 0 - I - 0x015543 05:9533: 04        .byte $04   ; 
- D 0 - I - 0x015544 05:9534: 29        .byte $29   ; 
- D 0 - I - 0x015545 05:9535: 08        .byte $08   ; 
- D 0 - I - 0x015546 05:9536: 29        .byte $29   ; 
- D 0 - I - 0x015547 05:9537: 0D        .byte $0D   ; 
- D 0 - I - 0x015548 05:9538: 29        .byte $29   ; 
- D 0 - I - 0x015549 05:9539: 12        .byte $12   ; 
- D 0 - I - 0x01554A 05:953A: 29        .byte $29   ; 
- D 0 - I - 0x01554B 05:953B: 17        .byte $17   ; 
- D 0 - I - 0x01554C 05:953C: 29        .byte $29   ; 



off_953D_0C:
- D 0 - I - 0x01554D 05:953D: 04        .byte $04   ; 
- D 0 - I - 0x01554E 05:953E: 2D        .byte $2D   ; 
- D 0 - I - 0x01554F 05:953F: 08        .byte $08   ; 
- D 0 - I - 0x015550 05:9540: 2D        .byte $2D   ; 
- D 0 - I - 0x015551 05:9541: 0D        .byte $0D   ; 
- D 0 - I - 0x015552 05:9542: 2D        .byte $2D   ; 
- D 0 - I - 0x015553 05:9543: 12        .byte $12   ; 
- D 0 - I - 0x015554 05:9544: 2D        .byte $2D   ; 
- D 0 - I - 0x015555 05:9545: 17        .byte $17   ; 
- D 0 - I - 0x015556 05:9546: 2D        .byte $2D   ; 



off_9547_0E:
- D 0 - I - 0x015557 05:9547: 0B        .byte $0B   ; 
- D 0 - I - 0x015558 05:9548: 31        .byte $31   ; 
- D 0 - I - 0x015559 05:9549: 0E        .byte $0E   ; 
- D 0 - I - 0x01555A 05:954A: 31        .byte $31   ; 
- D 0 - I - 0x01555B 05:954B: 12        .byte $12   ; 
- D 0 - I - 0x01555C 05:954C: 31        .byte $31   ; 



off_954D_10:
- D 0 - I - 0x01555D 05:954D: 06        .byte $06   ; 
- D 0 - I - 0x01555E 05:954E: 35        .byte $35   ; 
- D 0 - I - 0x01555F 05:954F: 0A        .byte $0A   ; 
- D 0 - I - 0x015560 05:9550: 35        .byte $35   ; 
- D 0 - I - 0x015561 05:9551: 0F        .byte $0F   ; 
- D 0 - I - 0x015562 05:9552: 35        .byte $35   ; 
- D 0 - I - 0x015563 05:9553: 14        .byte $14   ; 
- D 0 - I - 0x015564 05:9554: 35        .byte $35   ; 



off_9555_12:
- D 0 - I - 0x015565 05:9555: 06        .byte $06   ; 
- D 0 - I - 0x015566 05:9556: 39        .byte $39   ; 
- D 0 - I - 0x015567 05:9557: 0A        .byte $0A   ; 
- D 0 - I - 0x015568 05:9558: 39        .byte $39   ; 
- D 0 - I - 0x015569 05:9559: 0F        .byte $0F   ; 
- D 0 - I - 0x01556A 05:955A: 39        .byte $39   ; 
- D 0 - I - 0x01556B 05:955B: 14        .byte $14   ; 
- D 0 - I - 0x01556C 05:955C: 39        .byte $39   ; 



sub_955D_опции_погоды:
; вызывается при смещении курсора погоды вверх/вниз
C - - - - - 0x01556D 05:955D: AD C9 05  LDA ram_счетчик_опций
C - - - - - 0x015570 05:9560: 20 53 C0  JSR sub_0x01EC9F_jump_to_pointers_after_JSR
- D 0 - I - 0x015573 05:9563: 77 95     .word _общий_RTS
- - - - - - 0x015575 05:9565: 77 95     .word _общий_RTS
- D 0 - I - 0x015577 05:9567: 78 95     .word ofs_9578_02_материк
- D 0 - I - 0x015579 05:9569: 83 95     .word ofs_9583_03_поверхность
- D 0 - I - 0x01557B 05:956B: 8E 95     .word ofs_958E_04_влажность
- D 0 - I - 0x01557D 05:956D: A5 95     .word ofs_95A5_05_дождь
- D 0 - I - 0x01557F 05:956F: B0 95     .word ofs_95B0_06_ветер
- D 0 - I - 0x015581 05:9571: BF 95     .word ofs_95BF_07_направление
- D 0 - I - 0x015583 05:9573: CA 95     .word ofs_95CA_08_молния
- D 0 - I - 0x015585 05:9575: D7 95     .word ofs_95D7_09_смерч



ofs_9578_02_материк:
C - - J - - 0x015588 05:9578: AD 29 05  LDA ram_опция_материк
C - - - - - 0x01558B 05:957B: 29 03     AND #$03
C - - - - - 0x01558D 05:957D: 8D CA 05  STA ram_номер_опции
C - - - - - 0x015590 05:9580: 4C 77 95  RTS



ofs_9583_03_поверхность:
C - - J - - 0x015593 05:9583: AD FB 05  LDA ram_опция_поверхность_влажность
C - - - - - 0x015596 05:9586: 29 0F     AND #$0F
C - - - - - 0x015598 05:9588: 8D CA 05  STA ram_номер_опции
C - - - - - 0x01559B 05:958B: 4C 77 95  RTS



ofs_958E_04_влажность:
C - - J - - 0x01559E 05:958E: AD FB 05  LDA ram_опция_поверхность_влажность
C - - - - - 0x0155A1 05:9591: 4A        LSR
C - - - - - 0x0155A2 05:9592: 4A        LSR
C - - - - - 0x0155A3 05:9593: 4A        LSR
C - - - - - 0x0155A4 05:9594: 4A        LSR
C - - - - - 0x0155A5 05:9595: A8        TAY
C - - - - - 0x0155A6 05:9596: B9 9F 95  LDA tbl_959F,Y
C - - - - - 0x0155A9 05:9599: 8D CA 05  STA ram_номер_опции
C - - - - - 0x0155AC 05:959C: 4C 77 95  RTS

tbl_959F:
- D 0 - - - 0x0155AF 05:959F: 00        .byte $00   ; 
- D 0 - - - 0x0155B0 05:95A0: 01        .byte $01   ; 
- - - - - - 0x0155B1 05:95A1: 01        .byte $01   ; 
- - - - - - 0x0155B2 05:95A2: 02        .byte $02   ; 
- - - - - - 0x0155B3 05:95A3: 02        .byte $02   ; 
- - - - - - 0x0155B4 05:95A4: 03        .byte $03   ; 



ofs_95A5_05_дождь:
C - - J - - 0x0155B5 05:95A5: AD 94 04  LDA ram_опция_дождь_ветер
C - - - - - 0x0155B8 05:95A8: 29 0F     AND #$0F
C - - - - - 0x0155BA 05:95AA: 8D CA 05  STA ram_номер_опции
C - - - - - 0x0155BD 05:95AD: 4C 77 95  RTS



ofs_95B0_06_ветер:
C - - J - - 0x0155C0 05:95B0: AD 94 04  LDA ram_опция_дождь_ветер
C - - - - - 0x0155C3 05:95B3: 29 F0     AND #$F0
C - - - - - 0x0155C5 05:95B5: 4A        LSR
C - - - - - 0x0155C6 05:95B6: 4A        LSR
C - - - - - 0x0155C7 05:95B7: 4A        LSR
C - - - - - 0x0155C8 05:95B8: 4A        LSR
C - - - - - 0x0155C9 05:95B9: 8D CA 05  STA ram_номер_опции
C - - - - - 0x0155CC 05:95BC: 4C 77 95  RTS



ofs_95BF_07_направление:
C - - J - - 0x0155CF 05:95BF: AD 95 04  LDA ram_направление_молния_смерч
C - - - - - 0x0155D2 05:95C2: 29 03     AND #$03
C - - - - - 0x0155D4 05:95C4: 8D CA 05  STA ram_номер_опции
C - - - - - 0x0155D7 05:95C7: 4C 77 95  RTS



ofs_95CA_08_молния:
C - - J - - 0x0155DA 05:95CA: AD 95 04  LDA ram_направление_молния_смерч
C - - - - - 0x0155DD 05:95CD: 29 0C     AND #$0C
C - - - - - 0x0155DF 05:95CF: 4A        LSR
C - - - - - 0x0155E0 05:95D0: 4A        LSR
C - - - - - 0x0155E1 05:95D1: 8D CA 05  STA ram_номер_опции
C - - - - - 0x0155E4 05:95D4: 4C 77 95  RTS



ofs_95D7_09_смерч:
C - - J - - 0x0155E7 05:95D7: AD 95 04  LDA ram_направление_молния_смерч
C - - - - - 0x0155EA 05:95DA: 29 30     AND #$30
C - - - - - 0x0155EC 05:95DC: 4A        LSR
C - - - - - 0x0155ED 05:95DD: 4A        LSR
C - - - - - 0x0155EE 05:95DE: 4A        LSR
C - - - - - 0x0155EF 05:95DF: 4A        LSR
C - - - - - 0x0155F0 05:95E0: 8D CA 05  STA ram_номер_опции
C - - - - - 0x0155F3 05:95E3: 4C 77 95  RTS



sub_95E6:
C - - - - - 0x0155F6 05:95E6: AD C9 05  LDA ram_счетчик_опций
C - - - - - 0x0155F9 05:95E9: 20 53 C0  JSR sub_0x01EC9F_jump_to_pointers_after_JSR
- - - - - - 0x0155FC 05:95EC: 00 96     .word _общий_RTS
- - - - - - 0x0155FE 05:95EE: 00 96     .word _общий_RTS
- D 0 - I - 0x015600 05:95F0: 01 96     .word ofs_9601_02
- D 0 - I - 0x015602 05:95F2: 0C 96     .word ofs_960C_03
- D 0 - I - 0x015604 05:95F4: 1A 96     .word ofs_961A_04
- D 0 - I - 0x015606 05:95F6: 32 96     .word ofs_9632_05
- D 0 - I - 0x015608 05:95F8: 48 96     .word ofs_9648_06
- D 0 - I - 0x01560A 05:95FA: 62 96     .word ofs_9662_07
- D 0 - I - 0x01560C 05:95FC: 78 96     .word ofs_9678_08
- D 0 - I - 0x01560E 05:95FE: 90 96     .word ofs_9690_09



ofs_9601_02:
C - - J - - 0x015611 05:9601: AD CA 05  LDA ram_номер_опции
C - - - - - 0x015614 05:9604: 29 03     AND #$03
C - - - - - 0x015616 05:9606: 8D 29 05  STA ram_опция_материк
C - - - - - 0x015619 05:9609: 4C 00 96  RTS



ofs_960C_03:
C - - J - - 0x01561C 05:960C: AD FB 05  LDA ram_опция_поверхность_влажность
C - - - - - 0x01561F 05:960F: 29 F0     AND #$F0
C - - - - - 0x015621 05:9611: 0D CA 05  ORA ram_номер_опции
C - - - - - 0x015624 05:9614: 8D FB 05  STA ram_опция_поверхность_влажность
C - - - - - 0x015627 05:9617: 4C 00 96  RTS



ofs_961A_04:
C - - J - - 0x01562A 05:961A: AD CA 05  LDA ram_номер_опции
C - - - - - 0x01562D 05:961D: 29 03     AND #$03
C - - - - - 0x01562F 05:961F: A8        TAY
C - - - - - 0x015630 05:9620: AD FB 05  LDA ram_опция_поверхность_влажность
C - - - - - 0x015633 05:9623: 29 0F     AND #$0F
C - - - - - 0x015635 05:9625: 19 2E 96  ORA tbl_962E,Y
C - - - - - 0x015638 05:9628: 8D FB 05  STA ram_опция_поверхность_влажность
C - - - - - 0x01563B 05:962B: 4C 00 96  RTS

tbl_962E:
- D 0 - - - 0x01563E 05:962E: 00        .byte $00   ; 
- D 0 - - - 0x01563F 05:962F: 10        .byte $10   ; 
- D 0 - - - 0x015640 05:9630: 40        .byte $40   ; 
- D 0 - - - 0x015641 05:9631: 50        .byte $50   ; 



ofs_9632_05:
C - - J - - 0x015642 05:9632: AD 94 04  LDA ram_опция_дождь_ветер
C - - - - - 0x015645 05:9635: 29 F0     AND #$F0
C - - - - - 0x015647 05:9637: 8D 94 04  STA ram_опция_дождь_ветер
C - - - - - 0x01564A 05:963A: AD CA 05  LDA ram_номер_опции
C - - - - - 0x01564D 05:963D: 29 0F     AND #$0F
C - - - - - 0x01564F 05:963F: 0D 94 04  ORA ram_опция_дождь_ветер
C - - - - - 0x015652 05:9642: 8D 94 04  STA ram_опция_дождь_ветер
C - - - - - 0x015655 05:9645: 4C 00 96  RTS



ofs_9648_06:
C - - J - - 0x015658 05:9648: AD 94 04  LDA ram_опция_дождь_ветер
C - - - - - 0x01565B 05:964B: 29 0F     AND #$0F
C - - - - - 0x01565D 05:964D: 8D 94 04  STA ram_опция_дождь_ветер
C - - - - - 0x015660 05:9650: AD CA 05  LDA ram_номер_опции
C - - - - - 0x015663 05:9653: 29 0F     AND #$0F
C - - - - - 0x015665 05:9655: 0A        ASL
C - - - - - 0x015666 05:9656: 0A        ASL
C - - - - - 0x015667 05:9657: 0A        ASL
C - - - - - 0x015668 05:9658: 0A        ASL
C - - - - - 0x015669 05:9659: 0D 94 04  ORA ram_опция_дождь_ветер
C - - - - - 0x01566C 05:965C: 8D 94 04  STA ram_опция_дождь_ветер
C - - - - - 0x01566F 05:965F: 4C 00 96  RTS



ofs_9662_07:
C - - J - - 0x015672 05:9662: AD 95 04  LDA ram_направление_молния_смерч
C - - - - - 0x015675 05:9665: 29 FC     AND #$FC
C - - - - - 0x015677 05:9667: 8D 95 04  STA ram_направление_молния_смерч
C - - - - - 0x01567A 05:966A: AD CA 05  LDA ram_номер_опции
C - - - - - 0x01567D 05:966D: 29 03     AND #$03
C - - - - - 0x01567F 05:966F: 0D 95 04  ORA ram_направление_молния_смерч
C - - - - - 0x015682 05:9672: 8D 95 04  STA ram_направление_молния_смерч
C - - - - - 0x015685 05:9675: 4C 00 96  RTS



ofs_9678_08:
C - - J - - 0x015688 05:9678: AD 95 04  LDA ram_направление_молния_смерч
C - - - - - 0x01568B 05:967B: 29 F3     AND #$F3
C - - - - - 0x01568D 05:967D: 8D 95 04  STA ram_направление_молния_смерч
C - - - - - 0x015690 05:9680: AD CA 05  LDA ram_номер_опции
C - - - - - 0x015693 05:9683: 29 03     AND #$03
C - - - - - 0x015695 05:9685: 0A        ASL
C - - - - - 0x015696 05:9686: 0A        ASL
C - - - - - 0x015697 05:9687: 0D 95 04  ORA ram_направление_молния_смерч
C - - - - - 0x01569A 05:968A: 8D 95 04  STA ram_направление_молния_смерч
C - - - - - 0x01569D 05:968D: 4C 00 96  RTS



ofs_9690_09:
C - - J - - 0x0156A0 05:9690: AD 95 04  LDA ram_направление_молния_смерч
C - - - - - 0x0156A3 05:9693: 29 CF     AND #$CF
C - - - - - 0x0156A5 05:9695: 8D 95 04  STA ram_направление_молния_смерч
C - - - - - 0x0156A8 05:9698: AD CA 05  LDA ram_номер_опции
C - - - - - 0x0156AB 05:969B: 29 03     AND #$03
C - - - - - 0x0156AD 05:969D: 0A        ASL
C - - - - - 0x0156AE 05:969E: 0A        ASL
C - - - - - 0x0156AF 05:969F: 0A        ASL
C - - - - - 0x0156B0 05:96A0: 0A        ASL
C - - - - - 0x0156B1 05:96A1: 0D 95 04  ORA ram_направление_молния_смерч
C - - - - - 0x0156B4 05:96A4: 8D 95 04  STA ram_направление_молния_смерч
C - - - - - 0x0156B7 05:96A7: 4C 00 96  RTS



sub_96AA:
C - - - - - 0x0156BA 05:96AA: AD C9 05  LDA ram_счетчик_опций
C - - - - - 0x0156BD 05:96AD: 0A        ASL
C - - - - - 0x0156BE 05:96AE: A8        TAY
C - - - - - 0x0156BF 05:96AF: B9 F7 96  LDA tbl_96F7,Y
C - - - - - 0x0156C2 05:96B2: 85 32     STA ram_0032
C - - - - - 0x0156C4 05:96B4: B9 F8 96  LDA tbl_96F7 + 1,Y
C - - - - - 0x0156C7 05:96B7: 85 33     STA ram_0033
C - - - - - 0x0156C9 05:96B9: AD CA 05  LDA ram_номер_опции
C - - - - - 0x0156CC 05:96BC: 0A        ASL
C - - - - - 0x0156CD 05:96BD: 0A        ASL
C - - - - - 0x0156CE 05:96BE: 0A        ASL
C - - - - - 0x0156CF 05:96BF: A8        TAY
C - - - - - 0x0156D0 05:96C0: A2 00     LDX #$00
bra_96C2:
C - - - - - 0x0156D2 05:96C2: B1 32     LDA (ram_0032),Y
C - - - - - 0x0156D4 05:96C4: 9D B9 06  STA ram_буфер_графики,X
C - - - - - 0x0156D7 05:96C7: E8        INX
C - - - - - 0x0156D8 05:96C8: C8        INY
C - - - - - 0x0156D9 05:96C9: E0 08     CPX #$08
C - - - - - 0x0156DB 05:96CB: 90 F5     BCC bra_96C2
C - - - - - 0x0156DD 05:96CD: AD C9 05  LDA ram_счетчик_опций
C - - - - - 0x0156E0 05:96D0: 38        SEC
C - - - - - 0x0156E1 05:96D1: E9 02     SBC #$02
C - - - - - 0x0156E3 05:96D3: 0A        ASL
C - - - - - 0x0156E4 05:96D4: A8        TAY
C - - - - - 0x0156E5 05:96D5: A9 08     LDA #$08
C - - - - - 0x0156E7 05:96D7: 8D B8 06  STA ram_счетчик_буфера_графики
C - - - - - 0x0156EA 05:96DA: B9 E7 96  LDA tbl_96E7,Y
C - - - - - 0x0156ED 05:96DD: 8D B7 06  STA ram_байт_2006_lo_графика
C - - - - - 0x0156F0 05:96E0: B9 E8 96  LDA tbl_96E8,Y
C - - - - - 0x0156F3 05:96E3: 8D B6 06  STA ram_байт_2006_hi_графика
C - - - - - 0x0156F6 05:96E6: 60        RTS



tbl_96E7:
- D 0 - - - 0x0156F7 05:96E7: C8        .byte $C8   ; 
tbl_96E8:
- D 0 - - - 0x0156F8 05:96E8: 23        .byte $23   ; 
- D 0 - - - 0x0156F9 05:96E9: D8        .byte $D8   ; 
- D 0 - - - 0x0156FA 05:96EA: 23        .byte $23   ; 
- D 0 - - - 0x0156FB 05:96EB: E8        .byte $E8   ; 
- D 0 - - - 0x0156FC 05:96EC: 23        .byte $23   ; 
- D 0 - - - 0x0156FD 05:96ED: D0        .byte $D0   ; 
- D 0 - - - 0x0156FE 05:96EE: 2B        .byte $2B   ; 
- D 0 - - - 0x0156FF 05:96EF: D8        .byte $D8   ; 
- D 0 - - - 0x015700 05:96F0: 2B        .byte $2B   ; 
- D 0 - - - 0x015701 05:96F1: E0        .byte $E0   ; 
- D 0 - - - 0x015702 05:96F2: 2B        .byte $2B   ; 
- D 0 - - - 0x015703 05:96F3: E8        .byte $E8   ; 
- D 0 - - - 0x015704 05:96F4: 2B        .byte $2B   ; 
- D 0 - - - 0x015705 05:96F5: F0        .byte $F0   ; 
- D 0 - - - 0x015706 05:96F6: 2B        .byte $2B   ; 



tbl_96F7:
- - - - - - 0x015707 05:96F7: 0B 97     .word off_970B_00
- - - - - - 0x015709 05:96F9: 0B 97     .word off_970B_01
- D 0 - - - 0x01570B 05:96FB: 0B 97     .word off_970B_02
- D 0 - - - 0x01570D 05:96FD: 2B 97     .word off_972B_03
- D 0 - - - 0x01570F 05:96FF: 43 97     .word off_9743_04
- D 0 - - - 0x015711 05:9701: 63 97     .word off_9763_05
- D 0 - - - 0x015713 05:9703: 63 97     .word off_9763_06
- D 0 - - - 0x015715 05:9705: 8B 97     .word off_978B_07
- D 0 - - - 0x015717 05:9707: A3 97     .word off_97A3_08
- D 0 - - - 0x015719 05:9709: A3 97     .word off_97A3_09

off_970B_00:
off_970B_01:
off_970B_02:
- D 0 - I - 0x01571B 05:970B: AA        .byte $AA   ; 
- D 0 - I - 0x01571C 05:970C: AA        .byte $AA   ; 
- D 0 - I - 0x01571D 05:970D: EA        .byte $EA   ; 
- D 0 - I - 0x01571E 05:970E: FA        .byte $FA   ; 
- D 0 - I - 0x01571F 05:970F: FA        .byte $FA   ; 
- D 0 - I - 0x015720 05:9710: FA        .byte $FA   ; 
- D 0 - I - 0x015721 05:9711: FA        .byte $FA   ; 
- D 0 - I - 0x015722 05:9712: AA        .byte $AA   ; 
- D 0 - I - 0x015723 05:9713: AA        .byte $AA   ; 
- D 0 - I - 0x015724 05:9714: FA        .byte $FA   ; 
- D 0 - I - 0x015725 05:9715: BA        .byte $BA   ; 
- D 0 - I - 0x015726 05:9716: AA        .byte $AA   ; 
- D 0 - I - 0x015727 05:9717: FA        .byte $FA   ; 
- D 0 - I - 0x015728 05:9718: FA        .byte $FA   ; 
- D 0 - I - 0x015729 05:9719: FA        .byte $FA   ; 
- D 0 - I - 0x01572A 05:971A: AA        .byte $AA   ; 
- D 0 - I - 0x01572B 05:971B: AA        .byte $AA   ; 
- D 0 - I - 0x01572C 05:971C: FA        .byte $FA   ; 
- D 0 - I - 0x01572D 05:971D: FA        .byte $FA   ; 
- D 0 - I - 0x01572E 05:971E: FA        .byte $FA   ; 
- D 0 - I - 0x01572F 05:971F: AA        .byte $AA   ; 
- D 0 - I - 0x015730 05:9720: EA        .byte $EA   ; 
- D 0 - I - 0x015731 05:9721: FA        .byte $FA   ; 
- D 0 - I - 0x015732 05:9722: AA        .byte $AA   ; 
- D 0 - I - 0x015733 05:9723: AA        .byte $AA   ; 
- D 0 - I - 0x015734 05:9724: FA        .byte $FA   ; 
- D 0 - I - 0x015735 05:9725: FA        .byte $FA   ; 
- D 0 - I - 0x015736 05:9726: FA        .byte $FA   ; 
- D 0 - I - 0x015737 05:9727: FA        .byte $FA   ; 
- D 0 - I - 0x015738 05:9728: BA        .byte $BA   ; 
- D 0 - I - 0x015739 05:9729: AA        .byte $AA   ; 
- D 0 - I - 0x01573A 05:972A: AA        .byte $AA   ; 



off_972B_03:
- D 0 - I - 0x01573B 05:972B: AA        .byte $AA   ; 
- D 0 - I - 0x01573C 05:972C: AA        .byte $AA   ; 
- D 0 - I - 0x01573D 05:972D: AA        .byte $AA   ; 
- D 0 - I - 0x01573E 05:972E: EA        .byte $EA   ; 
- D 0 - I - 0x01573F 05:972F: FA        .byte $FA   ; 
- D 0 - I - 0x015740 05:9730: FA        .byte $FA   ; 
- D 0 - I - 0x015741 05:9731: AA        .byte $AA   ; 
- D 0 - I - 0x015742 05:9732: AA        .byte $AA   ; 
- D 0 - I - 0x015743 05:9733: AA        .byte $AA   ; 
- D 0 - I - 0x015744 05:9734: AA        .byte $AA   ; 
- D 0 - I - 0x015745 05:9735: FA        .byte $FA   ; 
- D 0 - I - 0x015746 05:9736: BA        .byte $BA   ; 
- D 0 - I - 0x015747 05:9737: EA        .byte $EA   ; 
- D 0 - I - 0x015748 05:9738: FA        .byte $FA   ; 
- D 0 - I - 0x015749 05:9739: AA        .byte $AA   ; 
- D 0 - I - 0x01574A 05:973A: AA        .byte $AA   ; 
- D 0 - I - 0x01574B 05:973B: AA        .byte $AA   ; 
- D 0 - I - 0x01574C 05:973C: AA        .byte $AA   ; 
- D 0 - I - 0x01574D 05:973D: FA        .byte $FA   ; 
- D 0 - I - 0x01574E 05:973E: FA        .byte $FA   ; 
- D 0 - I - 0x01574F 05:973F: BA        .byte $BA   ; 
- D 0 - I - 0x015750 05:9740: AA        .byte $AA   ; 
- D 0 - I - 0x015751 05:9741: AA        .byte $AA   ; 
- D 0 - I - 0x015752 05:9742: AA        .byte $AA   ; 



off_9743_04:
- D 0 - I - 0x015753 05:9743: AA        .byte $AA   ; 
- D 0 - I - 0x015754 05:9744: AA        .byte $AA   ; 
- D 0 - I - 0x015755 05:9745: AA        .byte $AA   ; 
- D 0 - I - 0x015756 05:9746: FA        .byte $FA   ; 
- D 0 - I - 0x015757 05:9747: FA        .byte $FA   ; 
- D 0 - I - 0x015758 05:9748: FA        .byte $FA   ; 
- D 0 - I - 0x015759 05:9749: FA        .byte $FA   ; 
- D 0 - I - 0x01575A 05:974A: AA        .byte $AA   ; 
- D 0 - I - 0x01575B 05:974B: AA        .byte $AA   ; 
- D 0 - I - 0x01575C 05:974C: FA        .byte $FA   ; 
- D 0 - I - 0x01575D 05:974D: FA        .byte $FA   ; 
- D 0 - I - 0x01575E 05:974E: AA        .byte $AA   ; 
- D 0 - I - 0x01575F 05:974F: FA        .byte $FA   ; 
- D 0 - I - 0x015760 05:9750: FA        .byte $FA   ; 
- D 0 - I - 0x015761 05:9751: FA        .byte $FA   ; 
- D 0 - I - 0x015762 05:9752: AA        .byte $AA   ; 
- D 0 - I - 0x015763 05:9753: AA        .byte $AA   ; 
- D 0 - I - 0x015764 05:9754: FA        .byte $FA   ; 
- D 0 - I - 0x015765 05:9755: FA        .byte $FA   ; 
- D 0 - I - 0x015766 05:9756: FA        .byte $FA   ; 
- D 0 - I - 0x015767 05:9757: AA        .byte $AA   ; 
- D 0 - I - 0x015768 05:9758: EA        .byte $EA   ; 
- D 0 - I - 0x015769 05:9759: FA        .byte $FA   ; 
- D 0 - I - 0x01576A 05:975A: AA        .byte $AA   ; 
- D 0 - I - 0x01576B 05:975B: AA        .byte $AA   ; 
- D 0 - I - 0x01576C 05:975C: FA        .byte $FA   ; 
- D 0 - I - 0x01576D 05:975D: FA        .byte $FA   ; 
- D 0 - I - 0x01576E 05:975E: FA        .byte $FA   ; 
- D 0 - I - 0x01576F 05:975F: FA        .byte $FA   ; 
- D 0 - I - 0x015770 05:9760: BA        .byte $BA   ; 
- D 0 - I - 0x015771 05:9761: AA        .byte $AA   ; 
- D 0 - I - 0x015772 05:9762: AA        .byte $AA   ; 



off_9763_05:
off_9763_06:
- D 0 - I - 0x015773 05:9763: AA        .byte $AA   ; 
- D 0 - I - 0x015774 05:9764: AA        .byte $AA   ; 
- D 0 - I - 0x015775 05:9765: AF        .byte $AF   ; 
- D 0 - I - 0x015776 05:9766: AF        .byte $AF   ; 
- D 0 - I - 0x015777 05:9767: AF        .byte $AF   ; 
- D 0 - I - 0x015778 05:9768: AF        .byte $AF   ; 
- D 0 - I - 0x015779 05:9769: AF        .byte $AF   ; 
- D 0 - I - 0x01577A 05:976A: AA        .byte $AA   ; 
- D 0 - I - 0x01577B 05:976B: AA        .byte $AA   ; 
- D 0 - I - 0x01577C 05:976C: AF        .byte $AF   ; 
- D 0 - I - 0x01577D 05:976D: AA        .byte $AA   ; 
- D 0 - I - 0x01577E 05:976E: AF        .byte $AF   ; 
- D 0 - I - 0x01577F 05:976F: AF        .byte $AF   ; 
- D 0 - I - 0x015780 05:9770: AF        .byte $AF   ; 
- D 0 - I - 0x015781 05:9771: AF        .byte $AF   ; 
- D 0 - I - 0x015782 05:9772: AA        .byte $AA   ; 
- D 0 - I - 0x015783 05:9773: AA        .byte $AA   ; 
- D 0 - I - 0x015784 05:9774: AF        .byte $AF   ; 
- D 0 - I - 0x015785 05:9775: AF        .byte $AF   ; 
- D 0 - I - 0x015786 05:9776: AA        .byte $AA   ; 
- D 0 - I - 0x015787 05:9777: AE        .byte $AE   ; 
- D 0 - I - 0x015788 05:9778: AF        .byte $AF   ; 
- D 0 - I - 0x015789 05:9779: AF        .byte $AF   ; 
- D 0 - I - 0x01578A 05:977A: AA        .byte $AA   ; 
- D 0 - I - 0x01578B 05:977B: AA        .byte $AA   ; 
- D 0 - I - 0x01578C 05:977C: AF        .byte $AF   ; 
- D 0 - I - 0x01578D 05:977D: AF        .byte $AF   ; 
- D 0 - I - 0x01578E 05:977E: AF        .byte $AF   ; 
- D 0 - I - 0x01578F 05:977F: AB        .byte $AB   ; 
- D 0 - I - 0x015790 05:9780: AA        .byte $AA   ; 
- D 0 - I - 0x015791 05:9781: AF        .byte $AF   ; 
- D 0 - I - 0x015792 05:9782: AA        .byte $AA   ; 
- D 0 - I - 0x015793 05:9783: AA        .byte $AA   ; 
- D 0 - I - 0x015794 05:9784: AF        .byte $AF   ; 
- D 0 - I - 0x015795 05:9785: AF        .byte $AF   ; 
- D 0 - I - 0x015796 05:9786: AF        .byte $AF   ; 
- D 0 - I - 0x015797 05:9787: AF        .byte $AF   ; 
- D 0 - I - 0x015798 05:9788: AF        .byte $AF   ; 
- D 0 - I - 0x015799 05:9789: AA        .byte $AA   ; 
- D 0 - I - 0x01579A 05:978A: AA        .byte $AA   ; 



off_978B_07:
- D 0 - I - 0x01579B 05:978B: AA        .byte $AA   ; 
- D 0 - I - 0x01579C 05:978C: AA        .byte $AA   ; 
- D 0 - I - 0x01579D 05:978D: AA        .byte $AA   ; 
- D 0 - I - 0x01579E 05:978E: AE        .byte $AE   ; 
- D 0 - I - 0x01579F 05:978F: AF        .byte $AF   ; 
- D 0 - I - 0x0157A0 05:9790: AA        .byte $AA   ; 
- D 0 - I - 0x0157A1 05:9791: AA        .byte $AA   ; 
- D 0 - I - 0x0157A2 05:9792: AA        .byte $AA   ; 
- D 0 - I - 0x0157A3 05:9793: AA        .byte $AA   ; 
- D 0 - I - 0x0157A4 05:9794: AA        .byte $AA   ; 
- D 0 - I - 0x0157A5 05:9795: AA        .byte $AA   ; 
- D 0 - I - 0x0157A6 05:9796: AB        .byte $AB   ; 
- D 0 - I - 0x0157A7 05:9797: AE        .byte $AE   ; 
- D 0 - I - 0x0157A8 05:9798: AA        .byte $AA   ; 
- D 0 - I - 0x0157A9 05:9799: AA        .byte $AA   ; 
- D 0 - I - 0x0157AA 05:979A: AA        .byte $AA   ; 
- D 0 - I - 0x0157AB 05:979B: AA        .byte $AA   ; 
- D 0 - I - 0x0157AC 05:979C: AA        .byte $AA   ; 
- D 0 - I - 0x0157AD 05:979D: AA        .byte $AA   ; 
- D 0 - I - 0x0157AE 05:979E: AF        .byte $AF   ; 
- D 0 - I - 0x0157AF 05:979F: AB        .byte $AB   ; 
- D 0 - I - 0x0157B0 05:97A0: AA        .byte $AA   ; 
- D 0 - I - 0x0157B1 05:97A1: AA        .byte $AA   ; 
- D 0 - I - 0x0157B2 05:97A2: AA        .byte $AA   ; 



off_97A3_08:
off_97A3_09:
- D 0 - I - 0x0157B3 05:97A3: AA        .byte $AA   ; 
- D 0 - I - 0x0157B4 05:97A4: AA        .byte $AA   ; 
- D 0 - I - 0x0157B5 05:97A5: AE        .byte $AE   ; 
- D 0 - I - 0x0157B6 05:97A6: AF        .byte $AF   ; 
- D 0 - I - 0x0157B7 05:97A7: AF        .byte $AF   ; 
- D 0 - I - 0x0157B8 05:97A8: AF        .byte $AF   ; 
- D 0 - I - 0x0157B9 05:97A9: AF        .byte $AF   ; 
- D 0 - I - 0x0157BA 05:97AA: AA        .byte $AA   ; 
- D 0 - I - 0x0157BB 05:97AB: AA        .byte $AA   ; 
- D 0 - I - 0x0157BC 05:97AC: AF        .byte $AF   ; 
- D 0 - I - 0x0157BD 05:97AD: AB        .byte $AB   ; 
- D 0 - I - 0x0157BE 05:97AE: AA        .byte $AA   ; 
- D 0 - I - 0x0157BF 05:97AF: AF        .byte $AF   ; 
- D 0 - I - 0x0157C0 05:97B0: AF        .byte $AF   ; 
- D 0 - I - 0x0157C1 05:97B1: AF        .byte $AF   ; 
- D 0 - I - 0x0157C2 05:97B2: AA        .byte $AA   ; 
- D 0 - I - 0x0157C3 05:97B3: AA        .byte $AA   ; 
- D 0 - I - 0x0157C4 05:97B4: AF        .byte $AF   ; 
- D 0 - I - 0x0157C5 05:97B5: AF        .byte $AF   ; 
- D 0 - I - 0x0157C6 05:97B6: AF        .byte $AF   ; 
- D 0 - I - 0x0157C7 05:97B7: AA        .byte $AA   ; 
- D 0 - I - 0x0157C8 05:97B8: AF        .byte $AF   ; 
- D 0 - I - 0x0157C9 05:97B9: AF        .byte $AF   ; 
- D 0 - I - 0x0157CA 05:97BA: AA        .byte $AA   ; 
- D 0 - I - 0x0157CB 05:97BB: AA        .byte $AA   ; 
- D 0 - I - 0x0157CC 05:97BC: AF        .byte $AF   ; 
- D 0 - I - 0x0157CD 05:97BD: AF        .byte $AF   ; 
- D 0 - I - 0x0157CE 05:97BE: AF        .byte $AF   ; 
- D 0 - I - 0x0157CF 05:97BF: AF        .byte $AF   ; 
- D 0 - I - 0x0157D0 05:97C0: AA        .byte $AA   ; 
- D 0 - I - 0x0157D1 05:97C1: AA        .byte $AA   ; 
- D 0 - I - 0x0157D2 05:97C2: AA        .byte $AA   ; 



sub_97C3:
C - - - - - 0x0157D3 05:97C3: 20 44 C0  JSR sub_0x01D057
C - - - - - 0x0157D6 05:97C6: 20 4A C0  JSR sub_0x01D072
C - - - - - 0x0157D9 05:97C9: AD F2 05  LDA ram_поле_банк_фона
C - - - - - 0x0157DC 05:97CC: 29 0F     AND #$0F
C - - - - - 0x0157DE 05:97CE: 8D F2 05  STA ram_поле_банк_фона
C - - - - - 0x0157E1 05:97D1: 20 47 BB  JSR sub_BB47
C - - - - - 0x0157E4 05:97D4: 20 84 BB  JSR sub_BB84
C - - - - - 0x0157E7 05:97D7: 20 0F 80  JSR sub_0x01C263_выставить_базовые_параметры_игроков
C - - - - - 0x0157EA 05:97DA: AC 29 05  LDY ram_опция_материк
C - - - - - 0x0157ED 05:97DD: B9 D1 A6  LDA tbl_A6D1,Y
C - - - - - 0x0157F0 05:97E0: 8D 5A 05  STA ram_music_id
C - - - - - 0x0157F3 05:97E3: A0 00     LDY #$00
C - - - - - 0x0157F5 05:97E5: 24 57     BIT ram_option_mode_difficulty
C - - - - - 0x0157F7 05:97E7: 70 06     BVS bra_97EF_minibattle
C - - - - - 0x0157F9 05:97E9: A9 00     LDA #con_script_gameplay
C - - - - - 0x0157FB 05:97EB: 85 58     STA ram_script
C - - - - - 0x0157FD 05:97ED: F0 02     BEQ bra_97F1
bra_97EF_minibattle:
C - - - - - 0x0157FF 05:97EF: A9 03     LDA #$03
bra_97F1:   ; A = 00
C - - - - - 0x015801 05:97F1: 8D 59 00  STA ram_subscript
C - - - - - 0x015804 05:97F4: 60        RTS



ofs_80AF_07_расстановка:
C - - - - - 0x015805 05:97F5: A5 59     LDA ram_subscript
C - - - - - 0x015807 05:97F7: 30 06     BMI bra_97FF
C - - - - - 0x015809 05:97F9: 20 DF 80  JSR sub_80DF
C - - - - - 0x01580C 05:97FC: 20 2C 98  JSR sub_982C
bra_97FF:
C - - - - - 0x01580F 05:97FF: 20 1D 9B  JSR sub_9B1D
C - - - - - 0x015812 05:9802: AD F0 00  LDA ram_pos_X_lo_camera     ; bzk опт, подпрограмма 0x01CAFE
C - - - - - 0x015815 05:9805: 8D EC 00  STA ram_pos_X_lo_scroll
C - - - - - 0x015818 05:9808: AD F1 00  LDA ram_pos_X_hi_camera
C - - - - - 0x01581B 05:980B: 8D ED 00  STA ram_pos_X_hi_scroll
C - - - - - 0x01581E 05:980E: AD F2 00  LDA ram_pos_Y_lo_camera
C - - - - - 0x015821 05:9811: 8D EE 00  STA ram_pos_Y_lo_scroll
C - - - - - 0x015824 05:9814: AD F3 00  LDA ram_pos_Y_hi_camera
C - - - - - 0x015827 05:9817: 8D EF 00  STA ram_pos_Y_hi_scroll
C - - - - - 0x01582A 05:981A: AD C9 05  LDA ram_счетчик_опций
C - - - - - 0x01582D 05:981D: 20 53 C0  JSR sub_0x01EC9F_jump_to_pointers_after_JSR
- D 0 - I - 0x015830 05:9820: B8 98     .word ofs_98B8_00
- D 0 - I - 0x015832 05:9822: C6 98     .word ofs_98C6_01
- D 0 - I - 0x015834 05:9824: 34 99     .word ofs_9934_02
- D 0 - I - 0x015836 05:9826: 96 99     .word ofs_9996_03
- D 0 - I - 0x015838 05:9828: F5 99     .word ofs_99F5_04
- D 0 - I - 0x01583A 05:982A: AD 9A     .word ofs_9AAD_05



sub_982C:
C - - - - - 0x01583C 05:982C: A5 57     LDA ram_option_mode_difficulty
C - - - - - 0x01583E 05:982E: 30 11     BMI bra_9841    ; если режим прохождения
C - - - - - 0x015840 05:9830: AC CC 05  LDY ram_счетчик_смен
C - - - - - 0x015843 05:9833: B9 2C 05  LDA ram_номер_команды,Y
C - - - - - 0x015846 05:9836: 29 0F     AND #$0F
C - - - - - 0x015848 05:9838: A8        TAY
C - - - - - 0x015849 05:9839: B9 A8 98  LDA tbl_98A8,Y
C - - - - - 0x01584C 05:983C: 30 03     BMI bra_9841
C - - - - - 0x01584E 05:983E: 20 68 C0  JSR sub_0x01E838_отрисовать_статичный_экран
bra_9841:
C - - - - - 0x015851 05:9841: 20 EB 9F  JSR sub_9FEB
C - - - - - 0x015854 05:9844: A9 FF     LDA #$FF
C - - - - - 0x015856 05:9846: 8D CA 05  STA ram_номер_опции
C - - - - - 0x015859 05:9849: 8D CB 05  STA ram_номер_опции + 1
C - - - - - 0x01585C 05:984C: A2 00     LDX #$00
C - - - - - 0x01585E 05:984E: A9 05     LDA #$05
bra_9850:
C - - - - - 0x015860 05:9850: 9D 61 00  STA ram_0061,X
C - - - - - 0x015863 05:9853: E8        INX
C - - - - - 0x015864 05:9854: E0 0D     CPX #$0D
C - - - - - 0x015866 05:9856: 90 F8     BCC bra_9850
C - - - - - 0x015868 05:9858: AE CC 05  LDX ram_счетчик_смен
C - - - - - 0x01586B 05:985B: BD 30 05  LDA ram_team_formation,X
C - - - - - 0x01586E 05:985E: 29 03     AND #$03
C - - - - - 0x015870 05:9860: 9D 30 05  STA ram_team_formation,X
C - - - - - 0x015873 05:9863: A2 00     LDX #$00
bra_9865:
C - - - - - 0x015875 05:9865: 8A        TXA
C - - - - - 0x015876 05:9866: 0D CC 05  ORA ram_счетчик_смен
C - - - - - 0x015879 05:9869: AA        TAX
C - - - - - 0x01587A 05:986A: 20 59 9D  JSR sub_9D59_рожи
C - - - - - 0x01587D 05:986D: E8        INX
C - - - - - 0x01587E 05:986E: E0 0C     CPX #$0C
C - - - - - 0x015880 05:9870: 90 F3     BCC bra_9865
C - - - - - 0x015882 05:9872: AE CC 05  LDX ram_счетчик_смен
C - - - - - 0x015885 05:9875: BD 2C 05  LDA ram_номер_команды,X
C - - - - - 0x015888 05:9878: 29 0F     AND #$0F
C - - - - - 0x01588A 05:987A: 0A        ASL
C - - - - - 0x01588B 05:987B: A8        TAY
C - - - - - 0x01588C 05:987C: B9 F6 BD  LDA tbl_BDF6,Y
C - - - - - 0x01588F 05:987F: 8D BA 05  STA ram_банк_спрайтов + 2
C - - - - - 0x015892 05:9882: B9 D6 BD  LDA tbl_BDD6,Y
C - - - - - 0x015895 05:9885: 8D AE 05  STA ram_palette_id_spr
C - - - - - 0x015898 05:9888: 8D AF 05  STA ram_palette_id_spr + 1
C - - - - - 0x01589B 05:988B: 8D B0 05  STA ram_palette_id_spr + 2
C - - - - - 0x01589E 05:988E: 8D B1 05  STA ram_palette_id_spr + 3
C - - - - - 0x0158A1 05:9891: A2 26     LDX #$26
C - - - - - 0x0158A3 05:9893: 8E B8 05  STX ram_банк_спрайтов
C - - - - - 0x0158A6 05:9896: E8        INX
C - - - - - 0x0158A7 05:9897: 8E B9 05  STX ram_банк_спрайтов + 1
C - - - - - 0x0158AA 05:989A: A9 09     LDA #$09
C - - - - - 0x0158AC 05:989C: 8D BB 05  STA ram_банк_спрайтов + 3
C - - - - - 0x0158AF 05:989F: 20 0B C0  JSR sub_0x01EEAA_базовые_банки_спрайтов
C - - - - - 0x0158B2 05:98A2: A9 02     LDA #con_music_menu
C - - - - - 0x0158B4 05:98A4: 20 02 C0  JSR sub_0x01C2F4_play_sound
C - - - - - 0x0158B7 05:98A7: 60        RTS



tbl_98A8:
- D 0 - - - 0x0158B8 05:98A8: 1B        .byte $1B   ; 
- - - - - - 0x0158B9 05:98A9: FF        .byte $FF   ; 
- - - - - - 0x0158BA 05:98AA: FF        .byte $FF   ; 
- - - - - - 0x0158BB 05:98AB: FF        .byte $FF   ; 
- - - - - - 0x0158BC 05:98AC: FF        .byte $FF   ; 
- - - - - - 0x0158BD 05:98AD: FF        .byte $FF   ; 
- - - - - - 0x0158BE 05:98AE: FF        .byte $FF   ; 
- D 0 - - - 0x0158BF 05:98AF: 1A        .byte $1A   ; 
- - - - - - 0x0158C0 05:98B0: FF        .byte $FF   ; 
- - - - - - 0x0158C1 05:98B1: 17        .byte $17   ; 
- - - - - - 0x0158C2 05:98B2: FF        .byte $FF   ; 
- D 0 - - - 0x0158C3 05:98B3: 16        .byte $16   ; 
- - - - - - 0x0158C4 05:98B4: FF        .byte $FF   ; 
- D 0 - - - 0x0158C5 05:98B5: 19        .byte $19   ; 
- D 0 - - - 0x0158C6 05:98B6: 18        .byte $18   ; 
- - - - - - 0x0158C7 05:98B7: FF        .byte $FF   ; 



ofs_98B8_00:
C - - J - - 0x0158C8 05:98B8: AD B2 05  LDA ram_flag_brightness
C - - - - - 0x0158CB 05:98BB: 10 03     BPL bra_98C0
C - - - - - 0x0158CD 05:98BD: EE C9 05  INC ram_счетчик_опций
bra_98C0:
C - - - - - 0x0158D0 05:98C0: 20 5C C0  JSR sub_0x01D083
C - - - - - 0x0158D3 05:98C3: 4C 2D 99  JMP loc_992D



ofs_98C6_01:
C - - J - - 0x0158D6 05:98C6: A2 0C     LDX #$0C
C - - - - - 0x0158D8 05:98C8: AD CA 05  LDA ram_номер_опции
C - - - - - 0x0158DB 05:98CB: 10 09     BPL bra_98D6
C - - - - - 0x0158DD 05:98CD: 20 6C 9C  JSR sub_9C6C
C - - - - - 0x0158E0 05:98D0: 20 EF 82  JSR sub_82AF
C - - - - - 0x0158E3 05:98D3: 20 9B 9D  JSR sub_9D9B
bra_98D6:
C - - - - - 0x0158E6 05:98D6: A2 0C     LDX #$0C
C - - - - - 0x0158E8 05:98D8: 20 7E 81  JSR sub_817E_конвертация_нажатых_кнопок_в_индекс
C - - - - - 0x0158EB 05:98DB: 20 D3 81  JSR sub_81D3_конвертация_индексов_Dpad_в_05
C - - - - - 0x0158EE 05:98DE: 20 53 C0  JSR sub_0x01EC9F_jump_to_pointers_after_JSR
- D 0 - I - 0x0158F1 05:98E1: 2D 99     .word ofs_992D_00_nothing
- - - - - - 0x0158F3 05:98E3: ED 98     .word ofs_98ED_01_Start
- - - - - - 0x0158F5 05:98E5: 2D 99     .word ofs_992D_02_Select
- D 0 - I - 0x0158F7 05:98E7: F8 98     .word ofs_98F8_03_A
- - - - - - 0x0158F9 05:98E9: 18 99     .word ofs_9918_04_B
- D 0 - I - 0x0158FB 05:98EB: 20 99     .word ofs_9920_05_Dpad



ofs_98ED_01_Start:
- - - - - - 0x0158FD 05:98ED: A9 33     LDA #con_sfx_yes
- - - - - - 0x0158FF 05:98EF: 20 02 C0  JSR sub_0x01C2F4_play_sound
- - - - - - 0x015902 05:98F2: 20 90 9D  JSR sub_9D90
- - - - - - 0x015905 05:98F5: 4C 33 99  RTS



ofs_98F8_03_A:
C - - J - - 0x015908 05:98F8: A9 33     LDA #con_sfx_yes
C - - - - - 0x01590A 05:98FA: 20 02 C0  JSR sub_0x01C2F4_play_sound
C - - - - - 0x01590D 05:98FD: A9 00     LDA #$00
C - - - - - 0x01590F 05:98FF: 20 B0 82  JSR sub_82B0
C - - - - - 0x015912 05:9902: 20 1F 9D  JSR sub_9D1F
C - - - - - 0x015915 05:9905: EE C9 05  INC ram_счетчик_опций
C - - - - - 0x015918 05:9908: AD CA 05  LDA ram_номер_опции
C - - - - - 0x01591B 05:990B: F0 03     BEQ bra_9910
C - - - - - 0x01591D 05:990D: EE C9 05  INC ram_счетчик_опций
bra_9910:
C - - - - - 0x015920 05:9910: A9 FF     LDA #$FF
C - - - - - 0x015922 05:9912: 8D CA 05  STA ram_номер_опции
C - - - - - 0x015925 05:9915: 4C 2D 99  JMP loc_992D



ofs_9918_04_B:
- - - - - - 0x015928 05:9918: A9 34     LDA #con_sfx_no
- - - - - - 0x01592A 05:991A: 20 02 C0  JSR sub_0x01C2F4_play_sound
- - - - - - 0x01592D 05:991D: 4C 2D 99  JMP loc_992D



ofs_9920_05_Dpad:
C - - J - - 0x015930 05:9920: AD CA 05  LDA ram_номер_опции
C - - - - - 0x015933 05:9923: 49 01     EOR #$01
C - - - - - 0x015935 05:9925: 8D CA 05  STA ram_номер_опции
C - - - - - 0x015938 05:9928: A9 32     LDA #con_sfx_move_cursor
C - - - - - 0x01593A 05:992A: 20 02 C0  JSR sub_0x01C2F4_play_sound
loc_992D:
ofs_992D_00_nothing:
ofs_992D_02_Select:
C D 0 - - - 0x01593D 05:992D: 20 05 9C  JSR sub_9C05
C - - - - - 0x015940 05:9930: 20 E2 9B  JSR sub_9BE2
C D 0 - - - 0x015943 05:9933: 60        RTS



ofs_9934_02:
C - - J - - 0x015944 05:9934: A2 0C     LDX #$0C
C - - - - - 0x015946 05:9936: AD CA 05  LDA ram_номер_опции
C - - - - - 0x015949 05:9939: 10 06     BPL bra_9941
C - - - - - 0x01594B 05:993B: 20 83 9C  JSR sub_9C83
C - - - - - 0x01594E 05:993E: 20 EF 82  JSR sub_82AF
bra_9941:
C - - - - - 0x015951 05:9941: 20 7E 81  JSR sub_817E_конвертация_нажатых_кнопок_в_индекс
C - - - - - 0x015954 05:9944: 20 D3 81  JSR sub_81D3_конвертация_индексов_Dpad_в_05
C - - - - - 0x015957 05:9947: 20 53 C0  JSR sub_0x01EC9F_jump_to_pointers_after_JSR
- D 0 - I - 0x01595A 05:994A: 2D 99     .word ofs_992D_00_nothing
- - - - - - 0x01595C 05:994C: ED 98     .word ofs_98ED_01_Start
- - - - - - 0x01595E 05:994E: 2D 99     .word ofs_992D_02_Select
- D 0 - I - 0x015960 05:9950: 56 99     .word ofs_9956_03_A
- - - - - - 0x015962 05:9952: 6B 99     .word ofs_996B_04_B
- D 0 - I - 0x015964 05:9954: 82 99     .word ofs_9982_05_Dpad



ofs_9956_03_A:
C - - J - - 0x015966 05:9956: A9 33     LDA #con_sfx_yes
C - - - - - 0x015968 05:9958: 20 02 C0  JSR sub_0x01C2F4_play_sound
C - - - - - 0x01596B 05:995B: A9 00     LDA #$00
C - - - - - 0x01596D 05:995D: 20 B0 82  JSR sub_82B0
C - - - - - 0x015970 05:9960: EE C9 05  INC ram_счетчик_опций
C - - - - - 0x015973 05:9963: A9 FF     LDA #$FF
C - - - - - 0x015975 05:9965: 8D CA 05  STA ram_номер_опции
C - - - - - 0x015978 05:9968: 4C 2D 99  JMP loc_992D



ofs_996B_04_B:
- - - - - - 0x01597B 05:996B: A9 34     LDA #con_sfx_no
- - - - - - 0x01597D 05:996D: 20 02 C0  JSR sub_0x01C2F4_play_sound
- - - - - - 0x015980 05:9970: A9 00     LDA #$00
- - - - - - 0x015982 05:9972: 20 B0 82  JSR sub_82B0
- - - - - - 0x015985 05:9975: A9 FF     LDA #$FF
- - - - - - 0x015987 05:9977: 8D CA 05  STA ram_номер_опции
- - - - - - 0x01598A 05:997A: A9 01     LDA #$01
- - - - - - 0x01598C 05:997C: 8D C9 05  STA ram_счетчик_опций
- - - - - - 0x01598F 05:997F: 4C 2D 99  JMP loc_992D



ofs_9982_05_Dpad:
C - - J - - 0x015992 05:9982: A9 32     LDA #con_sfx_move_cursor
C - - - - - 0x015994 05:9984: 20 02 C0  JSR sub_0x01C2F4_play_sound
C - - - - - 0x015997 05:9987: 20 7B A0  JSR sub_A07B
C - - - - - 0x01599A 05:998A: 20 DD 81  JSR sub_81DD
C - - - - - 0x01599D 05:998D: 20 54 A0  JSR sub_A054
C - - - - - 0x0159A0 05:9990: 20 39 9D  JSR sub_9D39
C - - - - - 0x0159A3 05:9993: 4C 2D 99  JMP loc_992D



ofs_9996_03:
C - - J - - 0x0159A6 05:9996: A2 0C     LDX #$0C
C - - - - - 0x0159A8 05:9998: AD CA 05  LDA ram_номер_опции
C - - - - - 0x0159AB 05:999B: 10 09     BPL bra_99A6
C - - - - - 0x0159AD 05:999D: 20 7C 9C  JSR sub_9C7C
C - - - - - 0x0159B0 05:99A0: 20 EF 82  JSR sub_82AF
C - - - - - 0x0159B3 05:99A3: 20 A0 9D  JSR sub_9DA0
bra_99A6:
C - - - - - 0x0159B6 05:99A6: 20 7E 81  JSR sub_817E_конвертация_нажатых_кнопок_в_индекс
C - - - - - 0x0159B9 05:99A9: 20 D3 81  JSR sub_81D3_конвертация_индексов_Dpad_в_05
C - - - - - 0x0159BC 05:99AC: 20 53 C0  JSR sub_0x01EC9F_jump_to_pointers_after_JSR
- D 0 - I - 0x0159BF 05:99AF: 2D 99     .word ofs_992D_00_nothing
- - - - - - 0x0159C1 05:99B1: ED 98     .word ofs_98ED_01_Start
- - - - - - 0x0159C3 05:99B3: 2D 99     .word ofs_992D_02_Select
- D 0 - I - 0x0159C5 05:99B5: BB 99     .word ofs_99BB_03_A
- D 0 - I - 0x0159C7 05:99B7: DB 99     .word ofs_99DB_04_B
- D 0 - I - 0x0159C9 05:99B9: 20 99     .word ofs_9920_05_Dpad



ofs_99BB_03_A:
C - - J - - 0x0159CB 05:99BB: A9 33     LDA #con_sfx_yes
C - - - - - 0x0159CD 05:99BD: 20 02 C0  JSR sub_0x01C2F4_play_sound
C - - - - - 0x0159D0 05:99C0: A9 00     LDA #$00
C - - - - - 0x0159D2 05:99C2: 20 B0 82  JSR sub_82B0
C - - - - - 0x0159D5 05:99C5: EE C9 05  INC ram_счетчик_опций
C - - - - - 0x0159D8 05:99C8: AD CA 05  LDA ram_номер_опции
C - - - - - 0x0159DB 05:99CB: F0 03     BEQ bra_99D0
C - - - - - 0x0159DD 05:99CD: EE C9 05  INC ram_счетчик_опций
bra_99D0:
C - - - - - 0x0159E0 05:99D0: A9 FF     LDA #$FF
C - - - - - 0x0159E2 05:99D2: 8D CA 05  STA ram_номер_опции
C - - - - - 0x0159E5 05:99D5: 8D CB 05  STA ram_номер_опции + 1
C - - - - - 0x0159E8 05:99D8: 4C 2D 99  JMP loc_992D



ofs_99DB_04_B:
C - - J - - 0x0159EB 05:99DB: A9 34     LDA #con_sfx_no
C - - - - - 0x0159ED 05:99DD: 20 02 C0  JSR sub_0x01C2F4_play_sound
C - - - - - 0x0159F0 05:99E0: A9 00     LDA #$00
C - - - - - 0x0159F2 05:99E2: 20 B0 82  JSR sub_82B0
C - - - - - 0x0159F5 05:99E5: 20 2B 9D  JSR sub_9D2B
C - - - - - 0x0159F8 05:99E8: A9 FF     LDA #$FF
C - - - - - 0x0159FA 05:99EA: 8D CA 05  STA ram_номер_опции
C - - - - - 0x0159FD 05:99ED: A9 01     LDA #$01
C - - - - - 0x0159FF 05:99EF: 8D C9 05  STA ram_счетчик_опций
C - - - - - 0x015A02 05:99F2: 4C 2D 99  JMP loc_992D



ofs_99F5_04:
C - - J - - 0x015A05 05:99F5: AD CB 05  LDA ram_номер_опции + 1
C - - - - - 0x015A08 05:99F8: 10 06     BPL bra_9A00
C - - - - - 0x015A0A 05:99FA: 20 8F 9C  JSR sub_9C8F
C - - - - - 0x015A0D 05:99FD: 20 95 9C  JSR sub_9C95
bra_9A00:
C - - - - - 0x015A10 05:9A00: A2 0C     LDX #$0C
C - - - - - 0x015A12 05:9A02: 20 7E 81  JSR sub_817E_конвертация_нажатых_кнопок_в_индекс
C - - - - - 0x015A15 05:9A05: 20 53 C0  JSR sub_0x01EC9F_jump_to_pointers_after_JSR
- D 0 - I - 0x015A18 05:9A08: 2D 99     .word ofs_992D_00_nothing
- - - - - - 0x015A1A 05:9A0A: 1A 9A     .word ofs_9A1A_01_Start
- - - - - - 0x015A1C 05:9A0C: 2D 99     .word ofs_992D_02_Select
- D 0 - I - 0x015A1E 05:9A0E: 1A 9A     .word ofs_9A1A_03_A
- D 0 - I - 0x015A20 05:9A10: 63 9A     .word ofs_9A63_04_B
- D 0 - I - 0x015A22 05:9A12: 7E 9A     .word ofs_9A7E_05_Up
- D 0 - I - 0x015A24 05:9A14: 7E 9A     .word ofs_9A7E_06_Down
- D 0 - I - 0x015A26 05:9A16: A4 9A     .word ofs_9AA4_07_Left
- D 0 - I - 0x015A28 05:9A18: A4 9A     .word ofs_9AA4_08_Right



ofs_9A1A_01_Start:
ofs_9A1A_03_A:
C - - J - - 0x015A2A 05:9A1A: AD CB 05  LDA ram_номер_опции + 1
C - - - - - 0x015A2D 05:9A1D: C9 06     CMP #$06
C - - - - - 0x015A2F 05:9A1F: D0 12     BNE bra_9A33
C - - - - - 0x015A31 05:9A21: A9 33     LDA #con_sfx_yes
C - - - - - 0x015A33 05:9A23: 20 02 C0  JSR sub_0x01C2F4_play_sound
C - - - - - 0x015A36 05:9A26: A9 05     LDA #$05
C - - - - - 0x015A38 05:9A28: 8D C9 05  STA ram_счетчик_опций
C - - - - - 0x015A3B 05:9A2B: A9 FF     LDA #$FF
C - - - - - 0x015A3D 05:9A2D: 8D CA 05  STA ram_номер_опции
C - - - - - 0x015A40 05:9A30: 4C 2D 99  JMP loc_992D
bra_9A33:
C - - - - - 0x015A43 05:9A33: 20 43 9D  JSR sub_9D43
C - - - - - 0x015A46 05:9A36: 20 73 9D  JSR sub_9D73
C - - - - - 0x015A49 05:9A39: B0 08     BCS bra_9A43
C - - - - - 0x015A4B 05:9A3B: A9 34     LDA #con_sfx_no
C - - - - - 0x015A4D 05:9A3D: 20 02 C0  JSR sub_0x01C2F4_play_sound
C - - - - - 0x015A50 05:9A40: 4C 2D 99  JMP loc_992D
bra_9A43:
C - - - - - 0x015A53 05:9A43: A9 33     LDA #con_sfx_yes
C - - - - - 0x015A55 05:9A45: 20 02 C0  JSR sub_0x01C2F4_play_sound
C - - - - - 0x015A58 05:9A48: 20 60 9E  JSR sub_9E60
C - - - - - 0x015A5B 05:9A4B: EE CB 05  INC ram_номер_опции + 1
C - - - - - 0x015A5E 05:9A4E: AD CB 05  LDA ram_номер_опции + 1
C - - - - - 0x015A61 05:9A51: C9 06     CMP #$06
C - - - - - 0x015A63 05:9A53: F0 06     BEQ bra_9A5B
C - - - - - 0x015A65 05:9A55: 20 95 9C  JSR sub_9C95
C - - - - - 0x015A68 05:9A58: 4C 2D 99  JMP loc_992D
bra_9A5B:
C - - - - - 0x015A6B 05:9A5B: A9 FF     LDA #$FF
C - - - - - 0x015A6D 05:9A5D: 8D CA 05  STA ram_номер_опции
C - - - - - 0x015A70 05:9A60: 4C 2D 99  JMP loc_992D



ofs_9A63_04_B:
C - - J - - 0x015A73 05:9A63: A9 34     LDA #con_sfx_no
C - - - - - 0x015A75 05:9A65: 20 02 C0  JSR sub_0x01C2F4_play_sound
C - - - - - 0x015A78 05:9A68: 38        SEC
C - - - - - 0x015A79 05:9A69: AD CB 05  LDA ram_номер_опции + 1
C - - - - - 0x015A7C 05:9A6C: E9 01     SBC #$01
C - - - - - 0x015A7E 05:9A6E: 10 02     BPL bra_9A72
C - - - - - 0x015A80 05:9A70: A9 00     LDA #$00
bra_9A72:
C - - - - - 0x015A82 05:9A72: 8D CB 05  STA ram_номер_опции + 1
C - - - - - 0x015A85 05:9A75: 20 95 9C  JSR sub_9C95
C - - - - - 0x015A88 05:9A78: 20 9C 9E  JSR sub_9E9C
C - - - - - 0x015A8B 05:9A7B: 4C 2D 99  JMP loc_992D



ofs_9A7E_05_Up:
ofs_9A7E_06_Down:
C - - J - - 0x015A8E 05:9A7E: AD CB 05  LDA ram_номер_опции + 1
C - - - - - 0x015A91 05:9A81: C9 06     CMP #$06
C - - - - - 0x015A93 05:9A83: F0 1C     BEQ bra_9AA1
C - - - - - 0x015A95 05:9A85: 24 57     BIT ram_option_mode_difficulty
C - - - - - 0x015A97 05:9A87: 30 0B     BMI bra_9A94_walkthrough
C - - - - - 0x015A99 05:9A89: AD CA 05  LDA ram_номер_опции
C - - - - - 0x015A9C 05:9A8C: 49 01     EOR #$01
C - - - - - 0x015A9E 05:9A8E: 8D CA 05  STA ram_номер_опции
C - - - - - 0x015AA1 05:9A91: 4C 99 9A  JMP loc_9A99
bra_9A94_walkthrough:
C - - - - - 0x015AA4 05:9A94: A2 0C     LDX #$0C
C - - - - - 0x015AA6 05:9A96: 20 DD 81  JSR sub_81DD
loc_9A99:
C D 0 - - - 0x015AA9 05:9A99: 20 43 9D  JSR sub_9D43
C - - - - - 0x015AAC 05:9A9C: A9 32     LDA #con_sfx_move_cursor
C - - - - - 0x015AAE 05:9A9E: 20 02 C0  JSR sub_0x01C2F4_play_sound
bra_9AA1:
C - - - - - 0x015AB1 05:9AA1: 4C 2D 99  JMP loc_992D



ofs_9AA4_07_Left:
ofs_9AA4_08_Right:
C - - J - - 0x015AB4 05:9AA4: AD CB 05  LDA ram_номер_опции + 1
C - - - - - 0x015AB7 05:9AA7: C9 06     CMP #$06
C - - - - - 0x015AB9 05:9AA9: F0 F6     BEQ bra_9AA1
C - - - - - 0x015ABB 05:9AAB: D0 E7     BNE bra_9A94_walkthrough



ofs_9AAD_05:
C - - J - - 0x015ABD 05:9AAD: A2 0C     LDX #$0C
C - - - - - 0x015ABF 05:9AAF: AD CA 05  LDA ram_номер_опции
C - - - - - 0x015AC2 05:9AB2: 10 08     BPL bra_9ABC
C - - - - - 0x015AC4 05:9AB4: A9 00     LDA #$00
C - - - - - 0x015AC6 05:9AB6: 8D CA 05  STA ram_номер_опции
C - - - - - 0x015AC9 05:9AB9: 20 B3 9C  JSR sub_9CB3
bra_9ABC:
C - - - - - 0x015ACC 05:9ABC: 20 7E 81  JSR sub_817E_конвертация_нажатых_кнопок_в_индекс
C - - - - - 0x015ACF 05:9ABF: 20 53 C0  JSR sub_0x01EC9F_jump_to_pointers_after_JSR
- D 0 - I - 0x015AD2 05:9AC2: 2D 99     .word ofs_992D_00_nothing
- D 0 - I - 0x015AD4 05:9AC4: D4 9A     .word ofs_9AD4_01_Start
- - - - - - 0x015AD6 05:9AC6: 2D 99     .word ofs_992D_02_Select
- D 0 - I - 0x015AD8 05:9AC8: DF 9A     .word ofs_9ADF_03_A
- D 0 - I - 0x015ADA 05:9ACA: F9 9A     .word ofs_9AF9_04_B
- - - - - - 0x015ADC 05:9ACC: 03 9B     .word ofs_9B03_05_Up
- D 0 - I - 0x015ADE 05:9ACE: 03 9B     .word ofs_9B03_06_Down
- D 0 - I - 0x015AE0 05:9AD0: 14 9B     .word ofs_9B14_07_Left
- D 0 - I - 0x015AE2 05:9AD2: 14 9B     .word ofs_9B14_08_Right



ofs_9AD4_01_Start:
C - - J - - 0x015AE4 05:9AD4: A9 33     LDA #con_sfx_yes
C - - - - - 0x015AE6 05:9AD6: 20 02 C0  JSR sub_0x01C2F4_play_sound
bra_9AD9:
C - - - - - 0x015AE9 05:9AD9: 20 90 9D  JSR sub_9D90
C - - - - - 0x015AEC 05:9ADC: 4C 33 99  RTS



ofs_9ADF_03_A:
C - - J - - 0x015AEF 05:9ADF: A9 33     LDA #con_sfx_yes
C - - - - - 0x015AF1 05:9AE1: 20 02 C0  JSR sub_0x01C2F4_play_sound
C - - - - - 0x015AF4 05:9AE4: AC CA 05  LDY ram_номер_опции
C - - - - - 0x015AF7 05:9AE7: C0 09     CPY #$09
C - - - - - 0x015AF9 05:9AE9: B0 EE     BCS bra_9AD9
C - - - - - 0x015AFB 05:9AEB: A9 06     LDA #$06
loc_9AED:
C D 0 - - - 0x015AFD 05:9AED: 8D CD 05  STA ram_btn_menu
C - - - - - 0x015B00 05:9AF0: 20 DD 81  JSR sub_81DD
C - - - - - 0x015B03 05:9AF3: 20 B3 9C  JSR sub_9CB3
C - - - - - 0x015B06 05:9AF6: 4C 2D 99  JMP loc_992D



ofs_9AF9_04_B:
C - - J - - 0x015B09 05:9AF9: A9 34     LDA #con_sfx_no
C - - - - - 0x015B0B 05:9AFB: 20 02 C0  JSR sub_0x01C2F4_play_sound
C - - - - - 0x015B0E 05:9AFE: A9 05     LDA #$05
C - - - - - 0x015B10 05:9B00: 4C ED 9A  JMP loc_9AED



ofs_9B03_05_Up:
ofs_9B03_06_Down:
C - - J - - 0x015B13 05:9B03: 20 DD 81  JSR sub_81DD
C - - - - - 0x015B16 05:9B06: 20 B3 9C  JSR sub_9CB3
loc_9B09:
C D 0 - - - 0x015B19 05:9B09: A9 32     LDA #con_sfx_move_cursor
C - - - - - 0x015B1B 05:9B0B: 20 02 C0  JSR sub_0x01C2F4_play_sound
C - - - - - 0x015B1E 05:9B0E: 20 64 9F  JSR sub_9F64
C - - - - - 0x015B21 05:9B11: 4C 2D 99  JMP loc_992D



ofs_9B14_07_Left:
ofs_9B14_08_Right:
C - - J - - 0x015B24 05:9B14: 20 DD 81  JSR sub_81DD
C - - - - - 0x015B27 05:9B17: 20 EA 9C  JSR sub_9CEA
C - - - - - 0x015B2A 05:9B1A: 4C 09 9B  JMP loc_9B09



sub_9B1D:
C - - - - - 0x015B2D 05:9B1D: 20 05 82  JSR sub_8205_read_pointers_after_JSR
- D 0 - I - 0x015B30 05:9B20: A4 9B     .word off_9BA4_00
- D 0 - I - 0x015B32 05:9B22: 38 9B     .word off_9B38_01
- D 0 - I - 0x015B34 05:9B24: A4 9B     .word off_9BA4_02
- D 0 - I - 0x015B36 05:9B26: 38 9B     .word off_9B38_03
- D 0 - I - 0x015B38 05:9B28: A8 9B     .word off_9BA8_04
- D 0 - I - 0x015B3A 05:9B2A: 38 9B     .word off_9B38_05
- D 0 - I - 0x015B3C 05:9B2C: AE 9B     .word off_9BAE_06
- D 0 - I - 0x015B3E 05:9B2E: 38 9B     .word off_9B38_07
- D 0 - I - 0x015B40 05:9B30: B2 9B     .word off_9BB2_08
- D 0 - I - 0x015B42 05:9B32: 44 9B     .word off_9B44_09
- D 0 - I - 0x015B44 05:9B34: CA 9B     .word off_9BCA_0A
- D 0 - I - 0x015B46 05:9B36: 74 9B     .word off_9B74_0B

off_9B38_01:
off_9B38_03:
off_9B38_05:
off_9B38_07:
- D 0 - I - 0x015B48 05:9B38: 02        .byte $02   ; 
- D 0 - I - 0x015B49 05:9B39: 01        .byte $01   ; 
- D 0 - I - 0x015B4A 05:9B3A: 00        .byte $00   ; 
- D 0 - I - 0x015B4B 05:9B3B: 00        .byte $00   ; 
- D 0 - I - 0x015B4C 05:9B3C: 00        .byte $00   ; 
- D 0 - I - 0x015B4D 05:9B3D: 02        .byte $02   ; 
- D 0 - I - 0x015B4E 05:9B3E: 01        .byte $01   ; 
- D 0 - I - 0x015B4F 05:9B3F: 01        .byte $01   ; 
- D 0 - I - 0x015B50 05:9B40: 01        .byte $01   ; 
- D 0 - I - 0x015B51 05:9B41: 00        .byte $00   ; 
- D 0 - I - 0x015B52 05:9B42: 02        .byte $02   ; 
- D 0 - I - 0x015B53 05:9B43: 02        .byte $02   ; 



off_9B44_09:
- D 0 - I - 0x015B54 05:9B44: 03        .byte $03   ; 
- D 0 - I - 0x015B55 05:9B45: 01        .byte $01   ; 
- D 0 - I - 0x015B56 05:9B46: 08        .byte $08   ; 
- D 0 - I - 0x015B57 05:9B47: 04        .byte $04   ; 
- D 0 - I - 0x015B58 05:9B48: 00        .byte $00   ; 
- D 0 - I - 0x015B59 05:9B49: 02        .byte $02   ; 
- - - - - - 0x015B5A 05:9B4A: 09        .byte $09   ; 
- D 0 - I - 0x015B5B 05:9B4B: 05        .byte $05   ; 
- D 0 - I - 0x015B5C 05:9B4C: 01        .byte $01   ; 
- D 0 - I - 0x015B5D 05:9B4D: 03        .byte $03   ; 
- D 0 - I - 0x015B5E 05:9B4E: 0A        .byte $0A   ; 
- D 0 - I - 0x015B5F 05:9B4F: 06        .byte $06   ; 
- D 0 - I - 0x015B60 05:9B50: 02        .byte $02   ; 
- D 0 - I - 0x015B61 05:9B51: 00        .byte $00   ; 
- D 0 - I - 0x015B62 05:9B52: 0B        .byte $0B   ; 
- D 0 - I - 0x015B63 05:9B53: 07        .byte $07   ; 
- D 0 - I - 0x015B64 05:9B54: 07        .byte $07   ; 
- D 0 - I - 0x015B65 05:9B55: 05        .byte $05   ; 
- D 0 - I - 0x015B66 05:9B56: 00        .byte $00   ; 
- D 0 - I - 0x015B67 05:9B57: 08        .byte $08   ; 
- D 0 - I - 0x015B68 05:9B58: 04        .byte $04   ; 
- D 0 - I - 0x015B69 05:9B59: 06        .byte $06   ; 
- D 0 - I - 0x015B6A 05:9B5A: 01        .byte $01   ; 
- D 0 - I - 0x015B6B 05:9B5B: 09        .byte $09   ; 
- D 0 - I - 0x015B6C 05:9B5C: 05        .byte $05   ; 
- D 0 - I - 0x015B6D 05:9B5D: 07        .byte $07   ; 
- D 0 - I - 0x015B6E 05:9B5E: 02        .byte $02   ; 
- D 0 - I - 0x015B6F 05:9B5F: 0A        .byte $0A   ; 
- D 0 - I - 0x015B70 05:9B60: 06        .byte $06   ; 
- D 0 - I - 0x015B71 05:9B61: 04        .byte $04   ; 
- D 0 - I - 0x015B72 05:9B62: 03        .byte $03   ; 
- D 0 - I - 0x015B73 05:9B63: 0B        .byte $0B   ; 
- D 0 - I - 0x015B74 05:9B64: 0B        .byte $0B   ; 
- D 0 - I - 0x015B75 05:9B65: 09        .byte $09   ; 
- D 0 - I - 0x015B76 05:9B66: 04        .byte $04   ; 
- D 0 - I - 0x015B77 05:9B67: 00        .byte $00   ; 
- D 0 - I - 0x015B78 05:9B68: 08        .byte $08   ; 
- D 0 - I - 0x015B79 05:9B69: 0A        .byte $0A   ; 
- D 0 - I - 0x015B7A 05:9B6A: 05        .byte $05   ; 
- D 0 - I - 0x015B7B 05:9B6B: 01        .byte $01   ; 
- D 0 - I - 0x015B7C 05:9B6C: 09        .byte $09   ; 
- D 0 - I - 0x015B7D 05:9B6D: 0B        .byte $0B   ; 
- D 0 - I - 0x015B7E 05:9B6E: 06        .byte $06   ; 
- D 0 - I - 0x015B7F 05:9B6F: 02        .byte $02   ; 
- D 0 - I - 0x015B80 05:9B70: 0A        .byte $0A   ; 
- D 0 - I - 0x015B81 05:9B71: 08        .byte $08   ; 
- D 0 - I - 0x015B82 05:9B72: 07        .byte $07   ; 
- D 0 - I - 0x015B83 05:9B73: 03        .byte $03   ; 



off_9B74_0B:
- D 0 - I - 0x015B84 05:9B74: 00        .byte $00   ; 
- D 0 - I - 0x015B85 05:9B75: 03        .byte $03   ; 
- D 0 - I - 0x015B86 05:9B76: 00        .byte $00   ; 
- D 0 - I - 0x015B87 05:9B77: 01        .byte $01   ; 
- D 0 - I - 0x015B88 05:9B78: 00        .byte $00   ; 
- D 0 - I - 0x015B89 05:9B79: 03        .byte $03   ; 
- D 0 - I - 0x015B8A 05:9B7A: 00        .byte $00   ; 
- D 0 - I - 0x015B8B 05:9B7B: 02        .byte $02   ; 
- - - - - - 0x015B8C 05:9B7C: 00        .byte $00   ; 
- D 0 - I - 0x015B8D 05:9B7D: 03        .byte $03   ; 
- D 0 - I - 0x015B8E 05:9B7E: 01        .byte $01   ; 
- D 0 - I - 0x015B8F 05:9B7F: 02        .byte $02   ; 
- - - - - - 0x015B90 05:9B80: 00        .byte $00   ; 
- D 0 - I - 0x015B91 05:9B81: 06        .byte $06   ; 
- D 0 - I - 0x015B92 05:9B82: 03        .byte $03   ; 
- D 0 - I - 0x015B93 05:9B83: 04        .byte $04   ; 
- D 0 - I - 0x015B94 05:9B84: 00        .byte $00   ; 
- D 0 - I - 0x015B95 05:9B85: 06        .byte $06   ; 
- D 0 - I - 0x015B96 05:9B86: 03        .byte $03   ; 
- D 0 - I - 0x015B97 05:9B87: 05        .byte $05   ; 
- D 0 - I - 0x015B98 05:9B88: 00        .byte $00   ; 
- D 0 - I - 0x015B99 05:9B89: 06        .byte $06   ; 
- D 0 - I - 0x015B9A 05:9B8A: 04        .byte $04   ; 
- D 0 - I - 0x015B9B 05:9B8B: 05        .byte $05   ; 
- - - - - - 0x015B9C 05:9B8C: 03        .byte $03   ; 
- D 0 - I - 0x015B9D 05:9B8D: 09        .byte $09   ; 
- D 0 - I - 0x015B9E 05:9B8E: 06        .byte $06   ; 
- D 0 - I - 0x015B9F 05:9B8F: 07        .byte $07   ; 
- D 0 - I - 0x015BA0 05:9B90: 03        .byte $03   ; 
- D 0 - I - 0x015BA1 05:9B91: 09        .byte $09   ; 
- D 0 - I - 0x015BA2 05:9B92: 06        .byte $06   ; 
- D 0 - I - 0x015BA3 05:9B93: 08        .byte $08   ; 
- - - - - - 0x015BA4 05:9B94: 03        .byte $03   ; 
- D 0 - I - 0x015BA5 05:9B95: 09        .byte $09   ; 
- D 0 - I - 0x015BA6 05:9B96: 07        .byte $07   ; 
- D 0 - I - 0x015BA7 05:9B97: 08        .byte $08   ; 
- D 0 - I - 0x015BA8 05:9B98: 06        .byte $06   ; 
- - - - - - 0x015BA9 05:9B99: 09        .byte $09   ; 
- D 0 - I - 0x015BAA 05:9B9A: 09        .byte $09   ; 
- D 0 - I - 0x015BAB 05:9B9B: 0A        .byte $0A   ; 
- - - - - - 0x015BAC 05:9B9C: 06        .byte $06   ; 
- - - - - - 0x015BAD 05:9B9D: 09        .byte $09   ; 
- D 0 - I - 0x015BAE 05:9B9E: 09        .byte $09   ; 
- D 0 - I - 0x015BAF 05:9B9F: 0B        .byte $0B   ; 
- - - - - - 0x015BB0 05:9BA0: 06        .byte $06   ; 
- - - - - - 0x015BB1 05:9BA1: 09        .byte $09   ; 
- D 0 - I - 0x015BB2 05:9BA2: 0A        .byte $0A   ; 
- D 0 - I - 0x015BB3 05:9BA3: 0B        .byte $0B   ; 



off_9BA4_00:
off_9BA4_02:
- D 0 - I - 0x015BB4 05:9BA4: 17        .byte $17   ; 
- D 0 - I - 0x015BB5 05:9BA5: 03        .byte $03   ; 
- D 0 - I - 0x015BB6 05:9BA6: 1A        .byte $1A   ; 
- D 0 - I - 0x015BB7 05:9BA7: 03        .byte $03   ; 



off_9BA8_04:
- D 0 - I - 0x015BB8 05:9BA8: 18        .byte $18   ; 
- D 0 - I - 0x015BB9 05:9BA9: 0A        .byte $0A   ; 
- D 0 - I - 0x015BBA 05:9BAA: 18        .byte $18   ; 
- D 0 - I - 0x015BBB 05:9BAB: 0C        .byte $0C   ; 
- D 0 - I - 0x015BBC 05:9BAC: 18        .byte $18   ; 
- D 0 - I - 0x015BBD 05:9BAD: 0E        .byte $0E   ; 



off_9BAE_06:
- D 0 - I - 0x015BBE 05:9BAE: 17        .byte $17   ; 
- D 0 - I - 0x015BBF 05:9BAF: 11        .byte $11   ; 
- D 0 - I - 0x015BC0 05:9BB0: 1A        .byte $1A   ; 
- D 0 - I - 0x015BC1 05:9BB1: 11        .byte $11   ; 



off_9BB2_08:
- D 0 - I - 0x015BC2 05:9BB2: 03        .byte $03   ; 
- D 0 - I - 0x015BC3 05:9BB3: 14        .byte $14   ; 
- D 0 - I - 0x015BC4 05:9BB4: 03        .byte $03   ; 
- D 0 - I - 0x015BC5 05:9BB5: 16        .byte $16   ; 
- D 0 - I - 0x015BC6 05:9BB6: 03        .byte $03   ; 
- D 0 - I - 0x015BC7 05:9BB7: 18        .byte $18   ; 
- D 0 - I - 0x015BC8 05:9BB8: 03        .byte $03   ; 
- D 0 - I - 0x015BC9 05:9BB9: 1A        .byte $1A   ; 
- D 0 - I - 0x015BCA 05:9BBA: 0C        .byte $0C   ; 
- D 0 - I - 0x015BCB 05:9BBB: 14        .byte $14   ; 
- D 0 - I - 0x015BCC 05:9BBC: 0C        .byte $0C   ; 
- D 0 - I - 0x015BCD 05:9BBD: 16        .byte $16   ; 
- D 0 - I - 0x015BCE 05:9BBE: 0C        .byte $0C   ; 
- D 0 - I - 0x015BCF 05:9BBF: 18        .byte $18   ; 
- D 0 - I - 0x015BD0 05:9BC0: 0C        .byte $0C   ; 
- D 0 - I - 0x015BD1 05:9BC1: 1A        .byte $1A   ; 
- D 0 - I - 0x015BD2 05:9BC2: 15        .byte $15   ; 
- D 0 - I - 0x015BD3 05:9BC3: 14        .byte $14   ; 
- D 0 - I - 0x015BD4 05:9BC4: 15        .byte $15   ; 
- D 0 - I - 0x015BD5 05:9BC5: 16        .byte $16   ; 
- D 0 - I - 0x015BD6 05:9BC6: 15        .byte $15   ; 
- D 0 - I - 0x015BD7 05:9BC7: 18        .byte $18   ; 
- D 0 - I - 0x015BD8 05:9BC8: 15        .byte $15   ; 
- D 0 - I - 0x015BD9 05:9BC9: 1A        .byte $1A   ; 



off_9BCA_0A:
- D 0 - I - 0x015BDA 05:9BCA: 03        .byte $03   ; 
- D 0 - I - 0x015BDB 05:9BCB: 29        .byte $29   ; 
- D 0 - I - 0x015BDC 05:9BCC: 0D        .byte $0D   ; 
- D 0 - I - 0x015BDD 05:9BCD: 29        .byte $29   ; 
- D 0 - I - 0x015BDE 05:9BCE: 14        .byte $14   ; 
- D 0 - I - 0x015BDF 05:9BCF: 29        .byte $29   ; 
- D 0 - I - 0x015BE0 05:9BD0: 03        .byte $03   ; 
- D 0 - I - 0x015BE1 05:9BD1: 2D        .byte $2D   ; 
- D 0 - I - 0x015BE2 05:9BD2: 0D        .byte $0D   ; 
- D 0 - I - 0x015BE3 05:9BD3: 2D        .byte $2D   ; 
- D 0 - I - 0x015BE4 05:9BD4: 14        .byte $14   ; 
- D 0 - I - 0x015BE5 05:9BD5: 2D        .byte $2D   ; 
- D 0 - I - 0x015BE6 05:9BD6: 03        .byte $03   ; 
- D 0 - I - 0x015BE7 05:9BD7: 35        .byte $35   ; 
- D 0 - I - 0x015BE8 05:9BD8: 0D        .byte $0D   ; 
- D 0 - I - 0x015BE9 05:9BD9: 35        .byte $35   ; 
- D 0 - I - 0x015BEA 05:9BDA: 14        .byte $14   ; 
- D 0 - I - 0x015BEB 05:9BDB: 35        .byte $35   ; 
- D 0 - I - 0x015BEC 05:9BDC: 03        .byte $03   ; 
- D 0 - I - 0x015BED 05:9BDD: 39        .byte $39   ; 
- D 0 - I - 0x015BEE 05:9BDE: 0D        .byte $0D   ; 
- D 0 - I - 0x015BEF 05:9BDF: 39        .byte $39   ; 
- D 0 - I - 0x015BF0 05:9BE0: 14        .byte $14   ; 
- D 0 - I - 0x015BF1 05:9BE1: 39        .byte $39   ; 



sub_9BE2:
C - - - - - 0x015BF2 05:9BE2: AD CA 05  LDA ram_номер_опции
C - - - - - 0x015BF5 05:9BE5: 30 0D     BMI bra_9BF4
C - - - - - 0x015BF7 05:9BE7: A2 0C     LDX #$0C
C - - - - - 0x015BF9 05:9BE9: 20 2A 82  JSR sub_822A
C - - - - - 0x015BFC 05:9BEC: A9 00     LDA #$00
C - - - - - 0x015BFE 05:9BEE: 20 8D 82  JSR sub_828D
C - - - - - 0x015C01 05:9BF1: 20 65 C0  JSR sub_0x01EB9C
bra_9BF4:
C - - - - - 0x015C04 05:9BF4: A2 00     LDX #$00
bra_9BF6_loop:
C - - - - - 0x015C06 05:9BF6: 20 C2 9D  JSR sub_9DC2_рожи_в_расстановке
C - - - - - 0x015C09 05:9BF9: 20 65 C0  JSR sub_0x01EB9C
C - - - - - 0x015C0C 05:9BFC: E8        INX
C - - - - - 0x015C0D 05:9BFD: E0 0C     CPX #$0C
C - - - - - 0x015C0F 05:9BFF: 90 F5     BCC bra_9BF6_loop
C - - - - - 0x015C11 05:9C01: 20 14 80  JSR sub_0x01C2AE
C - - - - - 0x015C14 05:9C04: 60        RTS



sub_9C05:
C - - - - - 0x015C15 05:9C05: AD C9 05  LDA ram_счетчик_опций
C - - - - - 0x015C18 05:9C08: C9 05     CMP #$05
C - - - - - 0x015C1A 05:9C0A: 90 26     BCC bra_9C32
C - - - - - 0x015C1C 05:9C0C: AD F2 00  LDA ram_pos_Y_lo_camera
C - - - - - 0x015C1F 05:9C0F: D0 07     BNE bra_9C18
C - - - - - 0x015C21 05:9C11: AD F3 00  LDA ram_pos_Y_hi_camera
C - - - - - 0x015C24 05:9C14: C9 01     CMP #$01
C - - - - - 0x015C26 05:9C16: F0 53     BEQ bra_9C6B_RTS
bra_9C18:
C - - - - - 0x015C28 05:9C18: 18        CLC
C - - - - - 0x015C29 05:9C19: AD F2 00  LDA ram_pos_Y_lo_camera
C - - - - - 0x015C2C 05:9C1C: 69 04     ADC #$04
C - - - - - 0x015C2E 05:9C1E: 8D F2 00  STA ram_pos_Y_lo_camera
C - - - - - 0x015C31 05:9C21: C9 F0     CMP #$F0
C - - - - - 0x015C33 05:9C23: 90 46     BCC bra_9C6B_RTS
C - - - - - 0x015C35 05:9C25: A9 00     LDA #$00
C - - - - - 0x015C37 05:9C27: 8D F2 00  STA ram_pos_Y_lo_camera
C - - - - - 0x015C3A 05:9C2A: A9 01     LDA #$01
C - - - - - 0x015C3C 05:9C2C: 8D F3 00  STA ram_pos_Y_hi_camera
C - - - - - 0x015C3F 05:9C2F: 4C 6B 9C  RTS
bra_9C32:
C - - - - - 0x015C42 05:9C32: AD F2 00  LDA ram_pos_Y_lo_camera
C - - - - - 0x015C45 05:9C35: D0 05     BNE bra_9C3C
C - - - - - 0x015C47 05:9C37: AD F3 00  LDA ram_pos_Y_hi_camera
C - - - - - 0x015C4A 05:9C3A: F0 2F     BEQ bra_9C6B_RTS
bra_9C3C:
C - - - - - 0x015C4C 05:9C3C: 38        SEC
C - - - - - 0x015C4D 05:9C3D: AD F2 00  LDA ram_pos_Y_lo_camera
C - - - - - 0x015C50 05:9C40: E9 04     SBC #$04
C - - - - - 0x015C52 05:9C42: 8D F2 00  STA ram_pos_Y_lo_camera
C - - - - - 0x015C55 05:9C45: C9 F0     CMP #$F0
C - - - - - 0x015C57 05:9C47: 90 0E     BCC bra_9C57
C - - - - - 0x015C59 05:9C49: E9 10     SBC #$10
C - - - - - 0x015C5B 05:9C4B: 8D F2 00  STA ram_pos_Y_lo_camera
C - - - - - 0x015C5E 05:9C4E: 38        SEC
C - - - - - 0x015C5F 05:9C4F: AD F3 00  LDA ram_pos_Y_hi_camera
C - - - - - 0x015C62 05:9C52: E9 01     SBC #$01
C - - - - - 0x015C64 05:9C54: 8D F3 00  STA ram_pos_Y_hi_camera
bra_9C57:
C - - - - - 0x015C67 05:9C57: AD F3 00  LDA ram_pos_Y_hi_camera
C - - - - - 0x015C6A 05:9C5A: 30 07     BMI bra_9C63
C - - - - - 0x015C6C 05:9C5C: D0 0D     BNE bra_9C6B_RTS
C - - - - - 0x015C6E 05:9C5E: AD F2 00  LDA ram_pos_Y_lo_camera
C - - - - - 0x015C71 05:9C61: D0 08     BNE bra_9C6B_RTS
bra_9C63:
C - - - - - 0x015C73 05:9C63: A9 00     LDA #$00
C - - - - - 0x015C75 05:9C65: 8D F2 00  STA ram_pos_Y_lo_camera
C - - - - - 0x015C78 05:9C68: 8D F3 00  STA ram_pos_Y_hi_camera
bra_9C6B_RTS:
C D 0 - - - 0x015C7B 05:9C6B: 60        RTS



sub_9C6C:
C - - - - - 0x015C7C 05:9C6C: AD CB 05  LDA ram_номер_опции + 1
C - - - - - 0x015C7F 05:9C6F: 10 05     BPL bra_9C76
C - - - - - 0x015C81 05:9C71: A9 03     LDA #$03
C - - - - - 0x015C83 05:9C73: 8D CB 05  STA ram_номер_опции + 1
bra_9C76:
loc_9C76:
C D 0 - - - 0x015C86 05:9C76: 29 01     AND #$01
C - - - - - 0x015C88 05:9C78: 8D CA 05  STA ram_номер_опции
C - - - - - 0x015C8B 05:9C7B: 60        RTS



sub_9C7C:
C - - - - - 0x015C8C 05:9C7C: AD CB 05  LDA ram_номер_опции + 1
C - - - - - 0x015C8F 05:9C7F: 4A        LSR
C - - - - - 0x015C90 05:9C80: 4C 76 9C  JMP loc_9C76



sub_9C83:
C - - - - - 0x015C93 05:9C83: AC CC 05  LDY ram_счетчик_смен
C - - - - - 0x015C96 05:9C86: B9 30 05  LDA ram_team_formation,Y
C - - - - - 0x015C99 05:9C89: 29 03     AND #$03
C - - - - - 0x015C9B 05:9C8B: 8D CA 05  STA ram_номер_опции
C - - - - - 0x015C9E 05:9C8E: 60        RTS



sub_9C8F:
C - - - - - 0x015C9F 05:9C8F: A9 00     LDA #$00
C - - - - - 0x015CA1 05:9C91: 8D CB 05  STA ram_номер_опции + 1
C - - - - - 0x015CA4 05:9C94: 60        RTS



sub_9C95:
C - - - - - 0x015CA5 05:9C95: AD CB 05  LDA ram_номер_опции + 1
C - - - - - 0x015CA8 05:9C98: 0A        ASL
C - - - - - 0x015CA9 05:9C99: 0D CC 05  ORA ram_счетчик_смен
C - - - - - 0x015CAC 05:9C9C: AA        TAX
C - - - - - 0x015CAD 05:9C9D: BD 32 05  LDA ram_player_id,X
C - - - - - 0x015CB0 05:9CA0: A0 00     LDY #$00
bra_9CA2_loop:
C - - - - - 0x015CB2 05:9CA2: D9 2E 9F  CMP tbl_9F2E,Y
C - - - - - 0x015CB5 05:9CA5: F0 07     BEQ bra_9CAE
C - - - - - 0x015CB7 05:9CA7: C8        INY
C - - - - - 0x015CB8 05:9CA8: C0 0C     CPY #$0C
C - - - - - 0x015CBA 05:9CAA: 90 F6     BCC bra_9CA2_loop
- - - - - - 0x015CBC 05:9CAC: A0 00     LDY #$00
bra_9CAE:
C - - - - - 0x015CBE 05:9CAE: 98        TYA
C - - - - - 0x015CBF 05:9CAF: 8D CA 05  STA ram_номер_опции
C - - - - - 0x015CC2 05:9CB2: 60        RTS



sub_9CB3:
C - - - - - 0x015CC3 05:9CB3: AC CC 05  LDY ram_счетчик_смен
C - - - - - 0x015CC6 05:9CB6: B9 D3 05  LDA ram_05D3,Y
C - - - - - 0x015CC9 05:9CB9: 85 1C     STA ram_001C
C - - - - - 0x015CCB 05:9CBB: AC CA 05  LDY ram_номер_опции
C - - - - - 0x015CCE 05:9CBE: B9 DE 9C  LDA tbl_9CDE,Y
C - - - - - 0x015CD1 05:9CC1: A8        TAY
loc_9CC2:
C D 0 - - - 0x015CD2 05:9CC2: F0 08     BEQ bra_9CCC
C - - - - - 0x015CD4 05:9CC4: 46 1C     LSR ram_001C
C - - - - - 0x015CD6 05:9CC6: 46 1C     LSR ram_001C
C - - - - - 0x015CD8 05:9CC8: 88        DEY
C - - - - - 0x015CD9 05:9CC9: 4C C2 9C  JMP loc_9CC2
bra_9CCC:
C - - - - - 0x015CDC 05:9CCC: A5 1C     LDA ram_001C
C - - - - - 0x015CDE 05:9CCE: 29 03     AND #$03
C - - - - - 0x015CE0 05:9CD0: C9 03     CMP #$03
C - - - - - 0x015CE2 05:9CD2: D0 02     BNE bra_9CD6
- - - - - - 0x015CE4 05:9CD4: A9 00     LDA #$00
bra_9CD6:
C - - - - - 0x015CE6 05:9CD6: 18        CLC
C - - - - - 0x015CE7 05:9CD7: 6D CA 05  ADC ram_номер_опции
C - - - - - 0x015CEA 05:9CDA: 8D CA 05  STA ram_номер_опции
C - - - - - 0x015CED 05:9CDD: 60        RTS



tbl_9CDE:
- D 0 - - - 0x015CEE 05:9CDE: 00        .byte $00   ; 
- - - - - - 0x015CEF 05:9CDF: 00        .byte $00   ; 
- - - - - - 0x015CF0 05:9CE0: 00        .byte $00   ; 
- D 0 - - - 0x015CF1 05:9CE1: 01        .byte $01   ; 
- - - - - - 0x015CF2 05:9CE2: 01        .byte $01   ; 
- - - - - - 0x015CF3 05:9CE3: 01        .byte $01   ; 
- D 0 - - - 0x015CF4 05:9CE4: 02        .byte $02   ; 
- - - - - - 0x015CF5 05:9CE5: 02        .byte $02   ; 
- - - - - - 0x015CF6 05:9CE6: 02        .byte $02   ; 
- D 0 - - - 0x015CF7 05:9CE7: 03        .byte $03   ; 
- - - - - - 0x015CF8 05:9CE8: 03        .byte $03   ; 
- - - - - - 0x015CF9 05:9CE9: 03        .byte $03   ; 



sub_9CEA:
C - - - - - 0x015CFA 05:9CEA: AD CA 05  LDA ram_номер_опции
C - - - - - 0x015CFD 05:9CED: 0A        ASL
C - - - - - 0x015CFE 05:9CEE: A8        TAY
C - - - - - 0x015CFF 05:9CEF: B9 07 9D  LDA tbl_9D07,Y
C - - - - - 0x015D02 05:9CF2: 85 1C     STA ram_001C
C - - - - - 0x015D04 05:9CF4: B9 08 9D  LDA tbl_9D08,Y
C - - - - - 0x015D07 05:9CF7: 85 1D     STA ram_001D
C - - - - - 0x015D09 05:9CF9: AC CC 05  LDY ram_счетчик_смен
C - - - - - 0x015D0C 05:9CFC: B9 D3 05  LDA ram_05D3,Y
C - - - - - 0x015D0F 05:9CFF: 25 1C     AND ram_001C
C - - - - - 0x015D11 05:9D01: 05 1D     ORA ram_001D
C - - - - - 0x015D13 05:9D03: 99 D3 05  STA ram_05D3,Y
C - - - - - 0x015D16 05:9D06: 60        RTS



tbl_9D07:
- D 0 - - - 0x015D17 05:9D07: FC        .byte $FC   ; 
tbl_9D08:
- D 0 - - - 0x015D18 05:9D08: 00        .byte $00   ; 
- D 0 - - - 0x015D19 05:9D09: FC        .byte $FC   ; 
- D 0 - - - 0x015D1A 05:9D0A: 01        .byte $01   ; 
- D 0 - - - 0x015D1B 05:9D0B: FC        .byte $FC   ; 
- D 0 - - - 0x015D1C 05:9D0C: 02        .byte $02   ; 
- D 0 - - - 0x015D1D 05:9D0D: F3        .byte $F3   ; 
- D 0 - - - 0x015D1E 05:9D0E: 00        .byte $00   ; 
- D 0 - - - 0x015D1F 05:9D0F: F3        .byte $F3   ; 
- D 0 - - - 0x015D20 05:9D10: 04        .byte $04   ; 
- D 0 - - - 0x015D21 05:9D11: F3        .byte $F3   ; 
- D 0 - - - 0x015D22 05:9D12: 08        .byte $08   ; 
- D 0 - - - 0x015D23 05:9D13: CF        .byte $CF   ; 
- D 0 - - - 0x015D24 05:9D14: 00        .byte $00   ; 
- D 0 - - - 0x015D25 05:9D15: CF        .byte $CF   ; 
- D 0 - - - 0x015D26 05:9D16: 10        .byte $10   ; 
- D 0 - - - 0x015D27 05:9D17: CF        .byte $CF   ; 
- D 0 - - - 0x015D28 05:9D18: 20        .byte $20   ; 
- D 0 - - - 0x015D29 05:9D19: 3F        .byte $3F   ; 
- D 0 - - - 0x015D2A 05:9D1A: 00        .byte $00   ; 
- D 0 - - - 0x015D2B 05:9D1B: 3F        .byte $3F   ; 
- D 0 - - - 0x015D2C 05:9D1C: 40        .byte $40   ; 
- D 0 - - - 0x015D2D 05:9D1D: 3F        .byte $3F   ; 
- D 0 - - - 0x015D2E 05:9D1E: 80        .byte $80   ; 



sub_9D1F:
C - - - - - 0x015D2F 05:9D1F: AD CB 05  LDA ram_номер_опции + 1
C - - - - - 0x015D32 05:9D22: 29 FE     AND #$FE
C - - - - - 0x015D34 05:9D24: 0D CA 05  ORA ram_номер_опции
C - - - - - 0x015D37 05:9D27: 8D CB 05  STA ram_номер_опции + 1
C - - - - - 0x015D3A 05:9D2A: 60        RTS



sub_9D2B:
C - - - - - 0x015D3B 05:9D2B: AD CB 05  LDA ram_номер_опции + 1
C - - - - - 0x015D3E 05:9D2E: 29 FD     AND #$FD
C - - - - - 0x015D40 05:9D30: 6A        ROR
C - - - - - 0x015D41 05:9D31: 0D CA 05  ORA ram_номер_опции
C - - - - - 0x015D44 05:9D34: 2A        ROL
C - - - - - 0x015D45 05:9D35: 8D CB 05  STA ram_номер_опции + 1
C - - - - - 0x015D48 05:9D38: 60        RTS



sub_9D39:
C - - - - - 0x015D49 05:9D39: AC CC 05  LDY ram_счетчик_смен
C - - - - - 0x015D4C 05:9D3C: AD CA 05  LDA ram_номер_опции
C - - - - - 0x015D4F 05:9D3F: 99 30 05  STA ram_team_formation,Y
C - - - - - 0x015D52 05:9D42: 60        RTS



sub_9D43:
C - - - - - 0x015D53 05:9D43: AD CB 05  LDA ram_номер_опции + 1
C - - - - - 0x015D56 05:9D46: 0A        ASL
C - - - - - 0x015D57 05:9D47: 0D CC 05  ORA ram_счетчик_смен
C - - - - - 0x015D5A 05:9D4A: AA        TAX
C - - - - - 0x015D5B 05:9D4B: AD CA 05  LDA ram_номер_опции
C - - - - - 0x015D5E 05:9D4E: A8        TAY
C - - - - - 0x015D5F 05:9D4F: B9 2E 9F  LDA tbl_9F2E,Y
C - - - - - 0x015D62 05:9D52: 9D 32 05  STA ram_player_id,X
C - - - - - 0x015D65 05:9D55: 20 59 9D  JSR sub_9D59_рожи
C - - - - - 0x015D68 05:9D58: 60        RTS



sub_9D59_рожи:
C - - - - - 0x015D69 05:9D59: AC CC 05  LDY ram_счетчик_смен
C - - - - - 0x015D6C 05:9D5C: B9 2C 05  LDA ram_номер_команды,Y
C - - - - - 0x015D6F 05:9D5F: 29 0F     AND #$0F
C - - - - - 0x015D71 05:9D61: F0 02     BEQ bra_9D65_это_япония
C - - - - - 0x015D73 05:9D63: A9 0C     LDA #$0C
bra_9D65_это_япония:
C - - - - - 0x015D75 05:9D65: 18        CLC
C - - - - - 0x015D76 05:9D66: 7D 32 05  ADC ram_player_id,X
C - - - - - 0x015D79 05:9D69: A8        TAY
C - - - - - 0x015D7A 05:9D6A: 8A        TXA
C - - - - - 0x015D7B 05:9D6B: 09 01     ORA #$01
C - - - - - 0x015D7D 05:9D6D: AA        TAX
C - - - - - 0x015D7E 05:9D6E: 98        TYA
C - - - - - 0x015D7F 05:9D6F: 9D 5C 05  STA ram_лицо_игрока,X
C - - - - - 0x015D82 05:9D72: 60        RTS



sub_9D73:
C - - - - - 0x015D83 05:9D73: AD CB 05  LDA ram_номер_опции + 1
C - - - - - 0x015D86 05:9D76: 0A        ASL
C - - - - - 0x015D87 05:9D77: 0D CC 05  ORA ram_счетчик_смен
C - - - - - 0x015D8A 05:9D7A: A8        TAY
C - - - - - 0x015D8B 05:9D7B: B9 32 05  LDA ram_player_id,Y
C - - - - - 0x015D8E 05:9D7E: 85 1C     STA ram_001C
bra_9D80_loop:
C - - - - - 0x015D90 05:9D80: 88        DEY
C - - - - - 0x015D91 05:9D81: 88        DEY
C - - - - - 0x015D92 05:9D82: 30 0A     BMI bra_9D8E
C - - - - - 0x015D94 05:9D84: B9 32 05  LDA ram_player_id,Y
C - - - - - 0x015D97 05:9D87: C5 1C     CMP ram_001C
C - - - - - 0x015D99 05:9D89: D0 F5     BNE bra_9D80_loop
C - - - - - 0x015D9B 05:9D8B: 18        CLC
C - - - - - 0x015D9C 05:9D8C: 90 01     BCC bra_9D8F_RTS
bra_9D8E:
C - - - - - 0x015D9E 05:9D8E: 38        SEC
bra_9D8F_RTS:
C - - - - - 0x015D9F 05:9D8F: 60        RTS



sub_9D90:
C - - - - - 0x015DA0 05:9D90: 20 44 C0  JSR sub_0x01D057
C - - - - - 0x015DA3 05:9D93: 20 4A C0  JSR sub_0x01D072
C - - - - - 0x015DA6 05:9D96: A9 04     LDA #$04
C - - - - - 0x015DA8 05:9D98: 85 59     STA ram_subscript
C - - - - - 0x015DAA 05:9D9A: 60        RTS



sub_9D9B:
C - - - - - 0x015DAB 05:9D9B: A0 00     LDY #$00
C - - - - - 0x015DAD 05:9D9D: 4C A2 9D  JMP loc_9DA2



sub_9DA0:
C - - - - - 0x015DB0 05:9DA0: A0 02     LDY #$02
loc_9DA2:
C D 0 - - - 0x015DB2 05:9DA2: B9 BF 9D  LDA tbl_9DBF,Y
C - - - - - 0x015DB5 05:9DA5: 8D BA 06  STA ram_буфер_графики + 1
C - - - - - 0x015DB8 05:9DA8: B9 BE 9D  LDA tbl_9DBE,Y
C - - - - - 0x015DBB 05:9DAB: 8D B9 06  STA ram_буфер_графики
C - - - - - 0x015DBE 05:9DAE: A9 02     LDA #$02
C - - - - - 0x015DC0 05:9DB0: 8D B8 06  STA ram_счетчик_буфера_графики
C - - - - - 0x015DC3 05:9DB3: A9 44     LDA #< $2144
C - - - - - 0x015DC5 05:9DB5: 8D B7 06  STA ram_байт_2006_lo_графика
C - - - - - 0x015DC8 05:9DB8: A9 21     LDA #> $2144
C - - - - - 0x015DCA 05:9DBA: 8D B6 06  STA ram_байт_2006_hi_графика
C - - - - - 0x015DCD 05:9DBD: 60        RTS

tbl_9DBE:
- D 0 - - - 0x015DCE 05:9DBE: 9E        .byte $9E   ; 
tbl_9DBF:
- D 0 - - - 0x015DCF 05:9DBF: 9F        .byte $9F   ; 
- D 0 - - - 0x015DD0 05:9DC0: 02        .byte $02   ; 
- D 0 - - - 0x015DD1 05:9DC1: 02        .byte $02   ; 



sub_9DC2_рожи_в_расстановке:
C - - - - - 0x015DD2 05:9DC2: AC CC 05  LDY ram_счетчик_смен
C - - - - - 0x015DD5 05:9DC5: B9 30 05  LDA ram_team_formation,Y
C - - - - - 0x015DD8 05:9DC8: 0A        ASL
C - - - - - 0x015DD9 05:9DC9: 79 30 05  ADC ram_team_formation,Y
C - - - - - 0x015DDC 05:9DCC: 0A        ASL
C - - - - - 0x015DDD 05:9DCD: 85 1C     STA ram_001C
C - - - - - 0x015DDF 05:9DCF: 8A        TXA
C - - - - - 0x015DE0 05:9DD0: 4A        LSR
C - - - - - 0x015DE1 05:9DD1: 18        CLC
C - - - - - 0x015DE2 05:9DD2: 65 1C     ADC ram_001C
C - - - - - 0x015DE4 05:9DD4: 85 1C     STA ram_001C
C - - - - - 0x015DE6 05:9DD6: A8        TAY
C - - - - - 0x015DE7 05:9DD7: B9 08 9F  LDA tbl_9F08,Y
C - - - - - 0x015DEA 05:9DDA: 0A        ASL
C - - - - - 0x015DEB 05:9DDB: A8        TAY
C - - - - - 0x015DEC 05:9DDC: B9 1A 9F  LDA tbl_9F1A,Y
C - - - - - 0x015DEF 05:9DDF: 9D 14 03  STA ram_pos_X_lo_player,X
C - - - - - 0x015DF2 05:9DE2: B9 1B 9F  LDA tbl_9F1B,Y
C - - - - - 0x015DF5 05:9DE5: 9D 4D 03  STA ram_pos_Y_lo_player,X
C - - - - - 0x015DF8 05:9DE8: 8A        TXA
C - - - - - 0x015DF9 05:9DE9: 29 01     AND #$01
C - - - - - 0x015DFB 05:9DEB: D0 35     BNE bra_9E22
C - - - - - 0x015DFD 05:9DED: A4 1C     LDY ram_001C
C - - - - - 0x015DFF 05:9DEF: B9 F6 9E  LDA tbl_9EF6,Y
C - - - - - 0x015E02 05:9DF2: 9D 74 00  STA ram_animation_id_player,X
C - - - - - 0x015E05 05:9DF5: C9 88     CMP #$88
C - - - - - 0x015E07 05:9DF7: D0 0C     BNE bra_9E05
C - - - - - 0x015E09 05:9DF9: AD C9 05  LDA ram_счетчик_опций
C - - - - - 0x015E0C 05:9DFC: C9 03     CMP #$03
C - - - - - 0x015E0E 05:9DFE: B0 05     BCS bra_9E05
C - - - - - 0x015E10 05:9E00: A9 7F     LDA #$7F
C - - - - - 0x015E12 05:9E02: 9D 74 00  STA ram_animation_id_player,X
bra_9E05:
C - - - - - 0x015E15 05:9E05: AD C9 05  LDA ram_счетчик_опций
C - - - - - 0x015E18 05:9E08: C9 04     CMP #$04
C - - - - - 0x015E1A 05:9E0A: D0 53     BNE bra_9E5F_RTS
C - - - - - 0x015E1C 05:9E0C: 8A        TXA
C - - - - - 0x015E1D 05:9E0D: 4A        LSR
C - - - - - 0x015E1E 05:9E0E: CD CB 05  CMP ram_номер_опции + 1
C - - - - - 0x015E21 05:9E11: D0 4C     BNE bra_9E5F_RTS
C - - - - - 0x015E23 05:9E13: AD 00 03  LDA ram_frame_cnt
C - - - - - 0x015E26 05:9E16: 29 03     AND #$03
C - - - - - 0x015E28 05:9E18: D0 45     BNE bra_9E5F_RTS
C - - - - - 0x015E2A 05:9E1A: A9 7F     LDA #$7F
C - - - - - 0x015E2C 05:9E1C: 9D 74 00  STA ram_animation_id_player,X
C - - - - - 0x015E2F 05:9E1F: 4C 5F 9E  RTS
bra_9E22:
C - - - - - 0x015E32 05:9E22: A9 00     LDA #$00
C - - - - - 0x015E34 05:9E24: 85 1D     STA ram_001D
C - - - - - 0x015E36 05:9E26: A5 57     LDA ram_option_mode_difficulty
C - - - - - 0x015E38 05:9E28: 10 18     BPL bra_9E42    ; если не режим прохождения
C - - - - - 0x015E3A 05:9E2A: BD 5C 05  LDA ram_лицо_игрока,X
C - - - - - 0x015E3D 05:9E2D: 0A        ASL
C - - - - - 0x015E3E 05:9E2E: A8        TAY
C - - - - - 0x015E3F 05:9E2F: B9 DB 9E  LDA tbl_9EDB,Y
C - - - - - 0x015E42 05:9E32: 30 0E     BMI bra_9E42
C - - - - - 0x015E44 05:9E34: E6 1D     INC ram_001D
C - - - - - 0x015E46 05:9E36: B9 DC 9E  LDA tbl_9EDC,Y
C - - - - - 0x015E49 05:9E39: A4 1C     LDY ram_001C
C - - - - - 0x015E4B 05:9E3B: D9 F6 9E  CMP tbl_9EF6,Y
C - - - - - 0x015E4E 05:9E3E: F0 02     BEQ bra_9E42
C - - - - - 0x015E50 05:9E40: E6 1D     INC ram_001D
bra_9E42:
C - - - - - 0x015E52 05:9E42: A4 1D     LDY ram_001D
C - - - - - 0x015E54 05:9E44: B9 F3 9E  LDA tbl_9EF3,Y
C - - - - - 0x015E57 05:9E47: 9D 74 00  STA ram_animation_id_player,X
C - - - - - 0x015E5A 05:9E4A: AD C9 05  LDA ram_счетчик_опций
C - - - - - 0x015E5D 05:9E4D: C9 04     CMP #$04
C - - - - - 0x015E5F 05:9E4F: D0 0E     BNE bra_9E5F_RTS
C - - - - - 0x015E61 05:9E51: 8A        TXA
C - - - - - 0x015E62 05:9E52: 4A        LSR
C - - - - - 0x015E63 05:9E53: CD CB 05  CMP ram_номер_опции + 1
C - - - - - 0x015E66 05:9E56: 90 07     BCC bra_9E5F_RTS
C - - - - - 0x015E68 05:9E58: F0 05     BEQ bra_9E5F_RTS
C - - - - - 0x015E6A 05:9E5A: A9 7F     LDA #$7F
C - - - - - 0x015E6C 05:9E5C: 9D 74 00  STA ram_animation_id_player,X
bra_9E5F_RTS:
C D 0 - - - 0x015E6F 05:9E5F: 60        RTS



sub_9E60:
C - - - - - 0x015E70 05:9E60: A2 0C     LDX #$0C
C - - - - - 0x015E72 05:9E62: 20 F4 82  JSR sub_82F4
C - - - - - 0x015E75 05:9E65: AC CC 05  LDY ram_счетчик_смен
C - - - - - 0x015E78 05:9E68: B9 30 05  LDA ram_team_formation,Y
C - - - - - 0x015E7B 05:9E6B: 0A        ASL
C - - - - - 0x015E7C 05:9E6C: A8        TAY
C - - - - - 0x015E7D 05:9E6D: B9 3A 9F  LDA tbl_9F3A,Y
C - - - - - 0x015E80 05:9E70: 85 32     STA ram_0032
C - - - - - 0x015E82 05:9E72: B9 3B 9F  LDA tbl_9F3A + 1,Y
C - - - - - 0x015E85 05:9E75: 85 33     STA ram_0033
C - - - - - 0x015E87 05:9E77: AD CB 05  LDA ram_номер_опции + 1
C - - - - - 0x015E8A 05:9E7A: 0A        ASL
C - - - - - 0x015E8B 05:9E7B: A8        TAY
C - - - - - 0x015E8C 05:9E7C: B1 32     LDA (ram_0032),Y
C - - - - - 0x015E8E 05:9E7E: 8D BB 06  STA ram_буфер_графики + 2
C - - - - - 0x015E91 05:9E81: C8        INY
C - - - - - 0x015E92 05:9E82: B1 32     LDA (ram_0032),Y
C - - - - - 0x015E94 05:9E84: 8D BA 06  STA ram_буфер_графики + 1
loc_9E87:
C D 0 - - - 0x015E97 05:9E87: A9 02     LDA #$02
C - - - - - 0x015E99 05:9E89: 8D B9 06  STA ram_буфер_графики
C - - - - - 0x015E9C 05:9E8C: A9 03     LDA #$03
C - - - - - 0x015E9E 05:9E8E: 8D B8 06  STA ram_счетчик_буфера_графики
C - - - - - 0x015EA1 05:9E91: A5 30     LDA ram_0030
C - - - - - 0x015EA3 05:9E93: 8D B7 06  STA ram_байт_2006_lo_графика
C - - - - - 0x015EA6 05:9E96: A5 31     LDA ram_0031
C - - - - - 0x015EA8 05:9E98: 8D B6 06  STA ram_байт_2006_hi_графика
C - - - - - 0x015EAB 05:9E9B: 60        RTS



sub_9E9C:
C - - - - - 0x015EAC 05:9E9C: A2 0C     LDX #$0C
C - - - - - 0x015EAE 05:9E9E: 20 F4 82  JSR sub_82F4
C - - - - - 0x015EB1 05:9EA1: A9 02     LDA #$02
C - - - - - 0x015EB3 05:9EA3: 8D BB 06  STA ram_буфер_графики + 2
C - - - - - 0x015EB6 05:9EA6: AC CC 05  LDY ram_счетчик_смен
C - - - - - 0x015EB9 05:9EA9: B9 2C 05  LDA ram_номер_команды,Y
C - - - - - 0x015EBC 05:9EAC: 29 0F     AND #$0F
C - - - - - 0x015EBE 05:9EAE: F0 09     BEQ bra_9EB9
C - - - - - 0x015EC0 05:9EB0: 18        CLC
C - - - - - 0x015EC1 05:9EB1: AD CA 05  LDA ram_номер_опции
C - - - - - 0x015EC4 05:9EB4: 69 0C     ADC #$0C
C - - - - - 0x015EC6 05:9EB6: A8        TAY
C - - - - - 0x015EC7 05:9EB7: D0 03     BNE bra_9EBC
bra_9EB9:
C - - - - - 0x015EC9 05:9EB9: AC CA 05  LDY ram_номер_опции
bra_9EBC:
C - - - - - 0x015ECC 05:9EBC: B9 C5 9E  LDA tbl_9EC5,Y
C - - - - - 0x015ECF 05:9EBF: 8D BA 06  STA ram_буфер_графики + 1
C - - - - - 0x015ED2 05:9EC2: 4C 87 9E  JMP loc_9E87

tbl_9EC5:
- D 0 - - - 0x015ED5 05:9EC5: 98        .byte $98   ; 
- D 0 - - - 0x015ED6 05:9EC6: 91        .byte $91   ; 
- D 0 - - - 0x015ED7 05:9EC7: 93        .byte $93   ; 
- D 0 - - - 0x015ED8 05:9EC8: 96        .byte $96   ; 
- D 0 - - - 0x015ED9 05:9EC9: 97        .byte $97   ; 
- D 0 - - - 0x015EDA 05:9ECA: 92        .byte $92   ; 
- - - - - - 0x015EDB 05:9ECB: 94        .byte $94   ; 
- - - - - - 0x015EDC 05:9ECC: 9A        .byte $9A   ; 
- D 0 - - - 0x015EDD 05:9ECD: 99        .byte $99   ; 
- D 0 - - - 0x015EDE 05:9ECE: 90        .byte $90   ; 
- - - - - - 0x015EDF 05:9ECF: 95        .byte $95   ; 
- - - - - - 0x015EE0 05:9ED0: 9B        .byte $9B   ; 
- D 0 - - - 0x015EE1 05:9ED1: 90        .byte $90   ; 
- D 0 - - - 0x015EE2 05:9ED2: 93        .byte $93   ; 
- - - - - - 0x015EE3 05:9ED3: 00        .byte $00   ; 
- - - - - - 0x015EE4 05:9ED4: 00        .byte $00   ; 
- D 0 - - - 0x015EE5 05:9ED5: 91        .byte $91   ; 
- D 0 - - - 0x015EE6 05:9ED6: 94        .byte $94   ; 
- - - - - - 0x015EE7 05:9ED7: 00        .byte $00   ; 
- - - - - - 0x015EE8 05:9ED8: 00        .byte $00   ; 
- D 0 - - - 0x015EE9 05:9ED9: 92        .byte $92   ; 
- D 0 - - - 0x015EEA 05:9EDA: 95        .byte $95   ; 



tbl_9EDB:
- D 0 - - - 0x015EEB 05:9EDB: 00        .byte $00   ; 
tbl_9EDC:
- D 0 - - - 0x015EEC 05:9EDC: 8A        .byte $8A   ; 
- D 0 - - - 0x015EED 05:9EDD: FF        .byte $FF   ; 
- - - - - - 0x015EEE 05:9EDE: 8B        .byte $8B   ; 
- D 0 - - - 0x015EEF 05:9EDF: 00        .byte $00   ; 
- D 0 - - - 0x015EF0 05:9EE0: 8B        .byte $8B   ; 
- D 0 - - - 0x015EF1 05:9EE1: FF        .byte $FF   ; 
- - - - - - 0x015EF2 05:9EE2: 89        .byte $89   ; 
- D 0 - - - 0x015EF3 05:9EE3: 00        .byte $00   ; 
- D 0 - - - 0x015EF4 05:9EE4: 89        .byte $89   ; 
- D 0 - - - 0x015EF5 05:9EE5: FF        .byte $FF   ; 
- - - - - - 0x015EF6 05:9EE6: 88        .byte $88   ; 
- D 0 - - - 0x015EF7 05:9EE7: FF        .byte $FF   ; 
- - - - - - 0x015EF8 05:9EE8: 89        .byte $89   ; 
- D 0 - - - 0x015EF9 05:9EE9: 00        .byte $00   ; 
- D 0 - - - 0x015EFA 05:9EEA: 8A        .byte $8A   ; 
- D 0 - - - 0x015EFB 05:9EEB: FF        .byte $FF   ; 
- - - - - - 0x015EFC 05:9EEC: 8A        .byte $8A   ; 
- D 0 - - - 0x015EFD 05:9EED: FF        .byte $FF   ; 
- - - - - - 0x015EFE 05:9EEE: 8A        .byte $8A   ; 
- D 0 - - - 0x015EFF 05:9EEF: 00        .byte $00   ; 
- D 0 - - - 0x015F00 05:9EF0: 8B        .byte $8B   ; 
- D 0 - - - 0x015F01 05:9EF1: 00        .byte $00   ; 
- D 0 - - - 0x015F02 05:9EF2: 88        .byte $88   ; 



tbl_9EF3:
- D 0 - - - 0x015F03 05:9EF3: 8C        .byte $8C   ; 
- D 0 - - - 0x015F04 05:9EF4: 94        .byte $94   ; 
- D 0 - - - 0x015F05 05:9EF5: 95        .byte $95   ; 



tbl_9EF6:
- D 0 - - - 0x015F06 05:9EF6: 8A        .byte $8A   ; 
- D 0 - - - 0x015F07 05:9EF7: 8B        .byte $8B   ; 
- D 0 - - - 0x015F08 05:9EF8: 8B        .byte $8B   ; 
- D 0 - - - 0x015F09 05:9EF9: 89        .byte $89   ; 
- D 0 - - - 0x015F0A 05:9EFA: 89        .byte $89   ; 
- D 0 - - - 0x015F0B 05:9EFB: 88        .byte $88   ; 
- D 0 - - - 0x015F0C 05:9EFC: 8A        .byte $8A   ; 
- D 0 - - - 0x015F0D 05:9EFD: 8B        .byte $8B   ; 
- D 0 - - - 0x015F0E 05:9EFE: 8B        .byte $8B   ; 
- D 0 - - - 0x015F0F 05:9EFF: 8A        .byte $8A   ; 
- D 0 - - - 0x015F10 05:9F00: 89        .byte $89   ; 
- D 0 - - - 0x015F11 05:9F01: 88        .byte $88   ; 
- D 0 - - - 0x015F12 05:9F02: 8A        .byte $8A   ; 
- D 0 - - - 0x015F13 05:9F03: 8B        .byte $8B   ; 
- D 0 - - - 0x015F14 05:9F04: 8A        .byte $8A   ; 
- D 0 - - - 0x015F15 05:9F05: 89        .byte $89   ; 
- D 0 - - - 0x015F16 05:9F06: 89        .byte $89   ; 
- D 0 - - - 0x015F17 05:9F07: 88        .byte $88   ; 



tbl_9F08:
- D 0 - - - 0x015F18 05:9F08: 05        .byte $05   ; 
- D 0 - - - 0x015F19 05:9F09: 07        .byte $07   ; 
- D 0 - - - 0x015F1A 05:9F0A: 09        .byte $09   ; 
- D 0 - - - 0x015F1B 05:9F0B: 01        .byte $01   ; 
- D 0 - - - 0x015F1C 05:9F0C: 03        .byte $03   ; 
- D 0 - - - 0x015F1D 05:9F0D: 00        .byte $00   ; 
- D 0 - - - 0x015F1E 05:9F0E: 06        .byte $06   ; 
- D 0 - - - 0x015F1F 05:9F0F: 07        .byte $07   ; 
- D 0 - - - 0x015F20 05:9F10: 09        .byte $09   ; 
- D 0 - - - 0x015F21 05:9F11: 04        .byte $04   ; 
- D 0 - - - 0x015F22 05:9F12: 02        .byte $02   ; 
- D 0 - - - 0x015F23 05:9F13: 00        .byte $00   ; 
- D 0 - - - 0x015F24 05:9F14: 06        .byte $06   ; 
- D 0 - - - 0x015F25 05:9F15: 08        .byte $08   ; 
- D 0 - - - 0x015F26 05:9F16: 04        .byte $04   ; 
- D 0 - - - 0x015F27 05:9F17: 01        .byte $01   ; 
- D 0 - - - 0x015F28 05:9F18: 03        .byte $03   ; 
- D 0 - - - 0x015F29 05:9F19: 00        .byte $00   ; 



tbl_9F1A:
- D 0 - - - 0x015F2A 05:9F1A: 30        .byte $30   ; 
tbl_9F1B:
- D 0 - - - 0x015F2B 05:9F1B: 57        .byte $57   ; 
- D 0 - - - 0x015F2C 05:9F1C: 50        .byte $50   ; 
- D 0 - - - 0x015F2D 05:9F1D: 3F        .byte $3F   ; 
- D 0 - - - 0x015F2E 05:9F1E: 50        .byte $50   ; 
- D 0 - - - 0x015F2F 05:9F1F: 57        .byte $57   ; 
- D 0 - - - 0x015F30 05:9F20: 50        .byte $50   ; 
- D 0 - - - 0x015F31 05:9F21: 6F        .byte $6F   ; 
- D 0 - - - 0x015F32 05:9F22: 78        .byte $78   ; 
- D 0 - - - 0x015F33 05:9F23: 3F        .byte $3F   ; 
- D 0 - - - 0x015F34 05:9F24: 78        .byte $78   ; 
- D 0 - - - 0x015F35 05:9F25: 57        .byte $57   ; 
- D 0 - - - 0x015F36 05:9F26: 78        .byte $78   ; 
- D 0 - - - 0x015F37 05:9F27: 6F        .byte $6F   ; 
- D 0 - - - 0x015F38 05:9F28: A0        .byte $A0   ; 
- D 0 - - - 0x015F39 05:9F29: 3F        .byte $3F   ; 
- D 0 - - - 0x015F3A 05:9F2A: A0        .byte $A0   ; 
- D 0 - - - 0x015F3B 05:9F2B: 57        .byte $57   ; 
- D 0 - - - 0x015F3C 05:9F2C: A0        .byte $A0   ; 
- D 0 - - - 0x015F3D 05:9F2D: 6F        .byte $6F   ; 



tbl_9F2E:
- D 0 - - - 0x015F3E 05:9F2E: 00        .byte $00   ; 
- D 0 - - - 0x015F3F 05:9F2F: 03        .byte $03   ; 
- D 0 - - - 0x015F40 05:9F30: 06        .byte $06   ; 
- D 0 - - - 0x015F41 05:9F31: 09        .byte $09   ; 
- D 0 - - - 0x015F42 05:9F32: 01        .byte $01   ; 
- D 0 - - - 0x015F43 05:9F33: 04        .byte $04   ; 
- D 0 - - - 0x015F44 05:9F34: 07        .byte $07   ; 
- D 0 - - - 0x015F45 05:9F35: 0A        .byte $0A   ; 
- D 0 - - - 0x015F46 05:9F36: 02        .byte $02   ; 
- D 0 - - - 0x015F47 05:9F37: 05        .byte $05   ; 
- D 0 - - - 0x015F48 05:9F38: 08        .byte $08   ; 
- D 0 - - - 0x015F49 05:9F39: 0B        .byte $0B   ; 



tbl_9F3A:
- D 0 - - - 0x015F4A 05:9F3A: 40 9F     .word off_9F40_00
- D 0 - - - 0x015F4C 05:9F3C: 4C 9F     .word off_9F4C_01
- D 0 - - - 0x015F4E 05:9F3E: 58 9F     .word off_9F58_02

off_9F40_00:
- D 0 - I - 0x015F50 05:9F40: 18        .byte $18   ; 
- D 0 - I - 0x015F51 05:9F41: 17        .byte $17   ; 
- D 0 - I - 0x015F52 05:9F42: 1A        .byte $1A   ; 
- D 0 - I - 0x015F53 05:9F43: 19        .byte $19   ; 
- D 0 - I - 0x015F54 05:9F44: 1A        .byte $1A   ; 
- D 0 - I - 0x015F55 05:9F45: 19        .byte $19   ; 
- D 0 - I - 0x015F56 05:9F46: 16        .byte $16   ; 
- D 0 - I - 0x015F57 05:9F47: 15        .byte $15   ; 
- D 0 - I - 0x015F58 05:9F48: 16        .byte $16   ; 
- D 0 - I - 0x015F59 05:9F49: 15        .byte $15   ; 
- D 0 - I - 0x015F5A 05:9F4A: 14        .byte $14   ; 
- D 0 - I - 0x015F5B 05:9F4B: 13        .byte $13   ; 



off_9F4C_01:
- D 0 - I - 0x015F5C 05:9F4C: 18        .byte $18   ; 
- D 0 - I - 0x015F5D 05:9F4D: 17        .byte $17   ; 
- D 0 - I - 0x015F5E 05:9F4E: 1A        .byte $1A   ; 
- D 0 - I - 0x015F5F 05:9F4F: 19        .byte $19   ; 
- D 0 - I - 0x015F60 05:9F50: 1A        .byte $1A   ; 
- D 0 - I - 0x015F61 05:9F51: 19        .byte $19   ; 
- D 0 - I - 0x015F62 05:9F52: 18        .byte $18   ; 
- D 0 - I - 0x015F63 05:9F53: 17        .byte $17   ; 
- D 0 - I - 0x015F64 05:9F54: 16        .byte $16   ; 
- D 0 - I - 0x015F65 05:9F55: 15        .byte $15   ; 
- D 0 - I - 0x015F66 05:9F56: 14        .byte $14   ; 
- D 0 - I - 0x015F67 05:9F57: 13        .byte $13   ; 



off_9F58_02:
- D 0 - I - 0x015F68 05:9F58: 18        .byte $18   ; 
- D 0 - I - 0x015F69 05:9F59: 17        .byte $17   ; 
- D 0 - I - 0x015F6A 05:9F5A: 1A        .byte $1A   ; 
- D 0 - I - 0x015F6B 05:9F5B: 19        .byte $19   ; 
- D 0 - I - 0x015F6C 05:9F5C: 18        .byte $18   ; 
- D 0 - I - 0x015F6D 05:9F5D: 17        .byte $17   ; 
- D 0 - I - 0x015F6E 05:9F5E: 16        .byte $16   ; 
- D 0 - I - 0x015F6F 05:9F5F: 15        .byte $15   ; 
- D 0 - I - 0x015F70 05:9F60: 16        .byte $16   ; 
- D 0 - I - 0x015F71 05:9F61: 15        .byte $15   ; 
- D 0 - I - 0x015F72 05:9F62: 14        .byte $14   ; 
- D 0 - I - 0x015F73 05:9F63: 13        .byte $13   ; 



sub_9F64:
C - - - - - 0x015F74 05:9F64: AD CA 05  LDA ram_номер_опции
C - - - - - 0x015F77 05:9F67: 0A        ASL
C - - - - - 0x015F78 05:9F68: 0A        ASL
C - - - - - 0x015F79 05:9F69: 0A        ASL
C - - - - - 0x015F7A 05:9F6A: A8        TAY
C - - - - - 0x015F7B 05:9F6B: B9 8B 9F  LDA tbl_9F8B,Y
C - - - - - 0x015F7E 05:9F6E: 8D 94 06  STA ram_байт_2006_lo_атрибуты
C - - - - - 0x015F81 05:9F71: A9 07     LDA #$07
C - - - - - 0x015F83 05:9F73: 8D 95 06  STA ram_счетчик_буфера_атрибутов
C - - - - - 0x015F86 05:9F76: A2 00     LDX #$00
bra_9F78:
C - - - - - 0x015F88 05:9F78: B9 8C 9F  LDA tbl_9F8C,Y
C - - - - - 0x015F8B 05:9F7B: 9D 96 06  STA ram_буфер_атрибутов,X
C - - - - - 0x015F8E 05:9F7E: E8        INX
C - - - - - 0x015F8F 05:9F7F: C8        INY
C - - - - - 0x015F90 05:9F80: EC 95 06  CPX ram_счетчик_буфера_атрибутов
C - - - - - 0x015F93 05:9F83: 90 F3     BCC bra_9F78
C - - - - - 0x015F95 05:9F85: A9 2B     LDA #$2B
C - - - - - 0x015F97 05:9F87: 8D 93 06  STA ram_байт_2006_hi_атрибуты
C - - - - - 0x015F9A 05:9F8A: 60        RTS



tbl_9F8B:
- D 0 - - - 0x015F9B 05:9F8B: D1        .byte $D1   ; 
tbl_9F8C:
- D 0 - - - 0x015F9C 05:9F8C: AA        .byte $AA   ; 
- D 0 - - - 0x015F9D 05:9F8D: AA        .byte $AA   ; 
- D 0 - - - 0x015F9E 05:9F8E: AF        .byte $AF   ; 
- D 0 - - - 0x015F9F 05:9F8F: AF        .byte $AF   ; 
- D 0 - - - 0x015FA0 05:9F90: AF        .byte $AF   ; 
- D 0 - - - 0x015FA1 05:9F91: AF        .byte $AF   ; 
- D 0 - - - 0x015FA2 05:9F92: AA        .byte $AA   ; 
- D 0 - - - 0x015FA3 05:9F93: D1        .byte $D1   ; 
- D 0 - - - 0x015FA4 05:9F94: AF        .byte $AF   ; 
- D 0 - - - 0x015FA5 05:9F95: AF        .byte $AF   ; 
- D 0 - - - 0x015FA6 05:9F96: AA        .byte $AA   ; 
- D 0 - - - 0x015FA7 05:9F97: AA        .byte $AA   ; 
- D 0 - - - 0x015FA8 05:9F98: AF        .byte $AF   ; 
- D 0 - - - 0x015FA9 05:9F99: AF        .byte $AF   ; 
- D 0 - - - 0x015FAA 05:9F9A: AA        .byte $AA   ; 
- D 0 - - - 0x015FAB 05:9F9B: D1        .byte $D1   ; 
- D 0 - - - 0x015FAC 05:9F9C: AF        .byte $AF   ; 
- D 0 - - - 0x015FAD 05:9F9D: AF        .byte $AF   ; 
- D 0 - - - 0x015FAE 05:9F9E: AF        .byte $AF   ; 
- D 0 - - - 0x015FAF 05:9F9F: AF        .byte $AF   ; 
- D 0 - - - 0x015FB0 05:9FA0: AA        .byte $AA   ; 
- D 0 - - - 0x015FB1 05:9FA1: AA        .byte $AA   ; 
- D 0 - - - 0x015FB2 05:9FA2: AA        .byte $AA   ; 
- D 0 - - - 0x015FB3 05:9FA3: D9        .byte $D9   ; 
- D 0 - - - 0x015FB4 05:9FA4: AA        .byte $AA   ; 
- D 0 - - - 0x015FB5 05:9FA5: AA        .byte $AA   ; 
- D 0 - - - 0x015FB6 05:9FA6: AF        .byte $AF   ; 
- D 0 - - - 0x015FB7 05:9FA7: AF        .byte $AF   ; 
- D 0 - - - 0x015FB8 05:9FA8: AF        .byte $AF   ; 
- D 0 - - - 0x015FB9 05:9FA9: AF        .byte $AF   ; 
- D 0 - - - 0x015FBA 05:9FAA: AA        .byte $AA   ; 
- D 0 - - - 0x015FBB 05:9FAB: D9        .byte $D9   ; 
- D 0 - - - 0x015FBC 05:9FAC: AF        .byte $AF   ; 
- D 0 - - - 0x015FBD 05:9FAD: AF        .byte $AF   ; 
- D 0 - - - 0x015FBE 05:9FAE: AA        .byte $AA   ; 
- D 0 - - - 0x015FBF 05:9FAF: AA        .byte $AA   ; 
- D 0 - - - 0x015FC0 05:9FB0: AF        .byte $AF   ; 
- D 0 - - - 0x015FC1 05:9FB1: AF        .byte $AF   ; 
- D 0 - - - 0x015FC2 05:9FB2: AA        .byte $AA   ; 
- D 0 - - - 0x015FC3 05:9FB3: D9        .byte $D9   ; 
- D 0 - - - 0x015FC4 05:9FB4: AF        .byte $AF   ; 
- D 0 - - - 0x015FC5 05:9FB5: AF        .byte $AF   ; 
- D 0 - - - 0x015FC6 05:9FB6: AF        .byte $AF   ; 
- D 0 - - - 0x015FC7 05:9FB7: AF        .byte $AF   ; 
- D 0 - - - 0x015FC8 05:9FB8: AA        .byte $AA   ; 
- D 0 - - - 0x015FC9 05:9FB9: AA        .byte $AA   ; 
- D 0 - - - 0x015FCA 05:9FBA: AA        .byte $AA   ; 
- D 0 - - - 0x015FCB 05:9FBB: E9        .byte $E9   ; 
- D 0 - - - 0x015FCC 05:9FBC: AA        .byte $AA   ; 
- D 0 - - - 0x015FCD 05:9FBD: AA        .byte $AA   ; 
- D 0 - - - 0x015FCE 05:9FBE: AF        .byte $AF   ; 
- D 0 - - - 0x015FCF 05:9FBF: AF        .byte $AF   ; 
- D 0 - - - 0x015FD0 05:9FC0: AF        .byte $AF   ; 
- D 0 - - - 0x015FD1 05:9FC1: AF        .byte $AF   ; 
- D 0 - - - 0x015FD2 05:9FC2: AA        .byte $AA   ; 
- D 0 - - - 0x015FD3 05:9FC3: E9        .byte $E9   ; 
- D 0 - - - 0x015FD4 05:9FC4: AF        .byte $AF   ; 
- D 0 - - - 0x015FD5 05:9FC5: AF        .byte $AF   ; 
- D 0 - - - 0x015FD6 05:9FC6: AA        .byte $AA   ; 
- D 0 - - - 0x015FD7 05:9FC7: AA        .byte $AA   ; 
- D 0 - - - 0x015FD8 05:9FC8: AF        .byte $AF   ; 
- D 0 - - - 0x015FD9 05:9FC9: AF        .byte $AF   ; 
- D 0 - - - 0x015FDA 05:9FCA: AA        .byte $AA   ; 
- D 0 - - - 0x015FDB 05:9FCB: E9        .byte $E9   ; 
- D 0 - - - 0x015FDC 05:9FCC: AF        .byte $AF   ; 
- D 0 - - - 0x015FDD 05:9FCD: AF        .byte $AF   ; 
- D 0 - - - 0x015FDE 05:9FCE: AF        .byte $AF   ; 
- D 0 - - - 0x015FDF 05:9FCF: AF        .byte $AF   ; 
- D 0 - - - 0x015FE0 05:9FD0: AA        .byte $AA   ; 
- D 0 - - - 0x015FE1 05:9FD1: AA        .byte $AA   ; 
- D 0 - - - 0x015FE2 05:9FD2: AA        .byte $AA   ; 
- D 0 - - - 0x015FE3 05:9FD3: F1        .byte $F1   ; 
- D 0 - - - 0x015FE4 05:9FD4: AA        .byte $AA   ; 
- D 0 - - - 0x015FE5 05:9FD5: AA        .byte $AA   ; 
- D 0 - - - 0x015FE6 05:9FD6: AF        .byte $AF   ; 
- D 0 - - - 0x015FE7 05:9FD7: AF        .byte $AF   ; 
- D 0 - - - 0x015FE8 05:9FD8: AF        .byte $AF   ; 
- D 0 - - - 0x015FE9 05:9FD9: AF        .byte $AF   ; 
- D 0 - - - 0x015FEA 05:9FDA: AA        .byte $AA   ; 
- D 0 - - - 0x015FEB 05:9FDB: F1        .byte $F1   ; 
- D 0 - - - 0x015FEC 05:9FDC: AF        .byte $AF   ; 
- D 0 - - - 0x015FED 05:9FDD: AF        .byte $AF   ; 
- D 0 - - - 0x015FEE 05:9FDE: AA        .byte $AA   ; 
- D 0 - - - 0x015FEF 05:9FDF: AA        .byte $AA   ; 
- D 0 - - - 0x015FF0 05:9FE0: AF        .byte $AF   ; 
- D 0 - - - 0x015FF1 05:9FE1: AF        .byte $AF   ; 
- D 0 - - - 0x015FF2 05:9FE2: AA        .byte $AA   ; 
- D 0 - - - 0x015FF3 05:9FE3: F1        .byte $F1   ; 
- D 0 - - - 0x015FF4 05:9FE4: AF        .byte $AF   ; 
- D 0 - - - 0x015FF5 05:9FE5: AF        .byte $AF   ; 
- D 0 - - - 0x015FF6 05:9FE6: AF        .byte $AF   ; 
- D 0 - - - 0x015FF7 05:9FE7: AF        .byte $AF   ; 
- D 0 - - - 0x015FF8 05:9FE8: AA        .byte $AA   ; 
- D 0 - - - 0x015FF9 05:9FE9: AA        .byte $AA   ; 
- D 0 - - - 0x015FFA 05:9FEA: AA        .byte $AA   ; 



sub_9FEB:
C - - - - - 0x015FFB 05:9FEB: AD C9 05  LDA ram_счетчик_опций
C - - - - - 0x015FFE 05:9FEE: 48        PHA
C - - - - - 0x015FFF 05:9FEF: 20 11 C0  JSR sub_0x01ECB9
C - - - - - 0x016002 05:9FF2: 20 17 C0  JSR sub_0x01EE81_disable_NMI
C - - - - - 0x016005 05:9FF5: 20 1D C0  JSR sub_0x01ECD1_скрыть_фон_и_спрайты_за_полоской_слева
C - - - - - 0x016008 05:9FF8: 20 A0 A0  JSR sub_A0A0
C - - - - - 0x01600B 05:9FFB: A9 03     LDA #$03
C - - - - - 0x01600D 05:9FFD: 8D C9 05  STA ram_счетчик_опций
bra_A000:
C D 1 - - - 0x016010 05:A000: 20 1D 9B  JSR sub_9B1D
C - - - - - 0x016013 05:A003: A9 01     LDA #$01
C - - - - - 0x016015 05:A005: 8D CA 05  STA ram_номер_опции
C - - - - - 0x016018 05:A008: AD C9 05  LDA ram_счетчик_опций
C - - - - - 0x01601B 05:A00B: C9 02     CMP #$02
C - - - - - 0x01601D 05:A00D: D0 06     BNE bra_A015
C - - - - - 0x01601F 05:A00F: 20 83 9C  JSR sub_9C83
C - - - - - 0x016022 05:A012: 20 54 A0  JSR sub_A054
bra_A015:
C - - - - - 0x016025 05:A015: A2 00     LDX #$00
C - - - - - 0x016027 05:A017: A9 00     LDA #$00
C - - - - - 0x016029 05:A019: 20 B0 82  JSR sub_82B0
C - - - - - 0x01602C 05:A01C: 20 6B C0  JSR sub_0x01EFBD_write_buffers_to_ppu
C - - - - - 0x01602F 05:A01F: CE C9 05  DEC ram_счетчик_опций
C - - - - - 0x016032 05:A022: D0 DC     BNE bra_A000
C - - - - - 0x016034 05:A024: A9 00     LDA #$00
C - - - - - 0x016036 05:A026: 8D C9 05  STA ram_счетчик_опций
bra_A029:
C - - - - - 0x016039 05:A029: AC C9 05  LDY ram_счетчик_опций
C - - - - - 0x01603C 05:A02C: B9 50 A0  LDA tbl_A050,Y
C - - - - - 0x01603F 05:A02F: 8D CA 05  STA ram_номер_опции
C - - - - - 0x016042 05:A032: 20 B3 9C  JSR sub_9CB3
C - - - - - 0x016045 05:A035: 20 64 9F  JSR sub_9F64
C - - - - - 0x016048 05:A038: 20 6B C0  JSR sub_0x01EFBD_write_buffers_to_ppu
C - - - - - 0x01604B 05:A03B: EE C9 05  INC ram_счетчик_опций
C - - - - - 0x01604E 05:A03E: AD C9 05  LDA ram_счетчик_опций
C - - - - - 0x016051 05:A041: C9 04     CMP #$04
C - - - - - 0x016053 05:A043: 90 E4     BCC bra_A029
C - - - - - 0x016055 05:A045: 20 1A C0  JSR sub_0x01ECDB_отобразить_фон_и_спрайты
C - - - - - 0x016058 05:A048: 20 14 C0  JSR sub_0x01EE75_enable_NMI
C - - - - - 0x01605B 05:A04B: 68        PLA
C - - - - - 0x01605C 05:A04C: 8D C9 05  STA ram_счетчик_опций
C - - - - - 0x01605F 05:A04F: 60        RTS



tbl_A050:
- D 1 - - - 0x016060 05:A050: 00        .byte $00   ; 
- D 1 - - - 0x016061 05:A051: 03        .byte $03   ; 
- D 1 - - - 0x016062 05:A052: 06        .byte $06   ; 
- D 1 - - - 0x016063 05:A053: 09        .byte $09   ; 



sub_A054:
C - - - - - 0x016064 05:A054: AD CA 05  LDA ram_номер_опции
C - - - - - 0x016067 05:A057: 29 0F     AND #$0F
C - - - - - 0x016069 05:A059: 0A        ASL
C - - - - - 0x01606A 05:A05A: A8        TAY
C - - - - - 0x01606B 05:A05B: 18        CLC
C - - - - - 0x01606C 05:A05C: A9 1B     LDA #$1B
C - - - - - 0x01606E 05:A05E: 6D CC 05  ADC ram_счетчик_смен
C - - - - - 0x016071 05:A061: 8D B9 06  STA ram_буфер_графики
C - - - - - 0x016074 05:A064: A9 1F     LDA #$1F
C - - - - - 0x016076 05:A066: 8D BA 06  STA ram_буфер_графики + 1
C - - - - - 0x016079 05:A069: A9 02     LDA #$02
C - - - - - 0x01607B 05:A06B: 8D B8 06  STA ram_счетчик_буфера_графики
C - - - - - 0x01607E 05:A06E: B9 9A A0  LDA tbl_A09A,Y
C - - - - - 0x016081 05:A071: 8D B7 06  STA ram_байт_2006_lo_графика
C - - - - - 0x016084 05:A074: B9 9B A0  LDA tbl_A09B,Y
C - - - - - 0x016087 05:A077: 8D B6 06  STA ram_байт_2006_hi_графика
C - - - - - 0x01608A 05:A07A: 60        RTS



sub_A07B:
C - - - - - 0x01608B 05:A07B: AD CA 05  LDA ram_номер_опции
C - - - - - 0x01608E 05:A07E: 29 0F     AND #$0F
C - - - - - 0x016090 05:A080: 0A        ASL
C - - - - - 0x016091 05:A081: A8        TAY
C - - - - - 0x016092 05:A082: A9 02     LDA #$02
C - - - - - 0x016094 05:A084: 8D 96 06  STA ram_буфер_атрибутов
C - - - - - 0x016097 05:A087: 8D 97 06  STA ram_буфер_атрибутов + 1
C - - - - - 0x01609A 05:A08A: 8D 95 06  STA ram_счетчик_буфера_атрибутов
C - - - - - 0x01609D 05:A08D: B9 9A A0  LDA tbl_A09A,Y
C - - - - - 0x0160A0 05:A090: 8D 94 06  STA ram_байт_2006_lo_атрибуты
C - - - - - 0x0160A3 05:A093: B9 9B A0  LDA tbl_A09B,Y
C - - - - - 0x0160A6 05:A096: 8D 93 06  STA ram_байт_2006_hi_атрибуты
C - - - - - 0x0160A9 05:A099: 60        RTS

tbl_A09A:
- D 1 - - - 0x0160AA 05:A09A: 2D        .byte $2D   ; 
tbl_A09B:
- D 1 - - - 0x0160AB 05:A09B: 21        .byte $21   ; 
- D 1 - - - 0x0160AC 05:A09C: 8D        .byte $8D   ; 
- D 1 - - - 0x0160AD 05:A09D: 21        .byte $21   ; 
- D 1 - - - 0x0160AE 05:A09E: 8D        .byte $8D   ; 
- D 1 - - - 0x0160AF 05:A09F: 21        .byte $21   ; 



sub_A0A0:
C - - - - - 0x0160B0 05:A0A0: A5 5D     LDA ram_players_cnt
C - - - - - 0x0160B2 05:A0A2: C9 02     CMP #$02
C - - - - - 0x0160B4 05:A0A4: 90 30     BCC bra_A0D6_RTS
C - - - - - 0x0160B6 05:A0A6: 38        SEC
C - - - - - 0x0160B7 05:A0A7: E9 02     SBC #$02
C - - - - - 0x0160B9 05:A0A9: 85 1C     STA ram_001C
C - - - - - 0x0160BB 05:A0AB: 0A        ASL
C - - - - - 0x0160BC 05:A0AC: 65 1C     ADC ram_001C
C - - - - - 0x0160BE 05:A0AE: A8        TAY
C - - - - - 0x0160BF 05:A0AF: 24 57     BIT ram_option_mode_difficulty
C - - - - - 0x0160C1 05:A0B1: 30 07     BMI bra_A0BA    ; если режим прохождения
C - - - - - 0x0160C3 05:A0B3: C8        INY
C - - - - - 0x0160C4 05:A0B4: AD CC 05  LDA ram_счетчик_смен
C - - - - - 0x0160C7 05:A0B7: F0 01     BEQ bra_A0BA
C - - - - - 0x0160C9 05:A0B9: C8        INY
bra_A0BA:
C - - - - - 0x0160CA 05:A0BA: B9 D7 A0  LDA tbl_A0D7,Y
C - - - - - 0x0160CD 05:A0BD: 30 17     BMI bra_A0D6_RTS
C - - - - - 0x0160CF 05:A0BF: 8D DC 06  STA ram_буфер_палитры
C - - - - - 0x0160D2 05:A0C2: A9 1F     LDA #$1F
C - - - - - 0x0160D4 05:A0C4: 8D DD 06  STA ram_буфер_палитры + 1
C - - - - - 0x0160D7 05:A0C7: A9 02     LDA #$02
C - - - - - 0x0160D9 05:A0C9: 8D DB 06  STA ram_счетчик_буфера_палитры
C - - - - - 0x0160DC 05:A0CC: A9 24     LDA #< $2124
C - - - - - 0x0160DE 05:A0CE: 8D DA 06  STA ram_байт_2006_lo_палитра
C - - - - - 0x0160E1 05:A0D1: A9 21     LDA #> $2124
C - - - - - 0x0160E3 05:A0D3: 8D D9 06  STA ram_байт_2006_hi_палитра
bra_A0D6_RTS:
C - - - - - 0x0160E6 05:A0D6: 60        RTS

tbl_A0D7:
- - - - - - 0x0160E7 05:A0D7: 1C        .byte $1C   ; 
- D 1 - - - 0x0160E8 05:A0D8: FF        .byte $FF   ; 
- - - - - - 0x0160E9 05:A0D9: FF        .byte $FF   ; 
- - - - - - 0x0160EA 05:A0DA: FF        .byte $FF   ; 
- D 1 - - - 0x0160EB 05:A0DB: 1D        .byte $1D   ; 
- - - - - - 0x0160EC 05:A0DC: FF        .byte $FF   ; 
- - - - - - 0x0160ED 05:A0DD: FF        .byte $FF   ; 
- D 1 - - - 0x0160EE 05:A0DE: 1D        .byte $1D   ; 
- D 1 - - - 0x0160EF 05:A0DF: 1E        .byte $1E   ; 



ofs_80B5_08_прогноз_погоды:
C - - - - - 0x0160F0 05:A0E0: A5 59     LDA ram_subscript
C - - - - - 0x0160F2 05:A0E2: 30 06     BMI bra_A0EA
C - - - - - 0x0160F4 05:A0E4: 20 DF 80  JSR sub_80DF
C - - - - - 0x0160F7 05:A0E7: 20 F4 A0  JSR sub_A0F4
bra_A0EA:
C - - - - - 0x0160FA 05:A0EA: AD C9 05  LDA ram_счетчик_опций
C - - - - - 0x0160FD 05:A0ED: 20 53 C0  JSR sub_0x01EC9F_jump_to_pointers_after_JSR
- D 1 - I - 0x016100 05:A0F0: 34 A1     .word ofs_A134_00
- D 1 - I - 0x016102 05:A0F2: 42 A1     .word ofs_A142_01



sub_A0F4:
C - - - - - 0x016104 05:A0F4: A9 05     LDA #$05
C - - - - - 0x016106 05:A0F6: 8D 61 00  STA ram_0061
C - - - - - 0x016109 05:A0F9: A9 08     LDA #$08
C - - - - - 0x01610B 05:A0FB: 8D 59 04  STA ram_movement_id_player
C - - - - - 0x01610E 05:A0FE: A9 01     LDA #$01
C - - - - - 0x016110 05:A100: 8D AE 05  STA ram_palette_id_spr
C - - - - - 0x016113 05:A103: 8D AF 05  STA ram_palette_id_spr + 1
C - - - - - 0x016116 05:A106: A2 26     LDX #$26
C - - - - - 0x016118 05:A108: 8E B8 05  STX ram_банк_спрайтов
C - - - - - 0x01611B 05:A10B: E8        INX
C - - - - - 0x01611C 05:A10C: 8E B9 05  STX ram_банк_спрайтов + 1
C - - - - - 0x01611F 05:A10F: 20 0B C0  JSR sub_0x01EEAA_базовые_банки_спрайтов
C - - - - - 0x016122 05:A112: A9 28     LDA #$28
C - - - - - 0x016124 05:A114: 8D 14 03  STA ram_pos_X_lo_player
C - - - - - 0x016127 05:A117: A9 B8     LDA #$B8
C - - - - - 0x016129 05:A119: 8D 4D 03  STA ram_pos_Y_lo_player
C - - - - - 0x01612C 05:A11C: 20 11 C0  JSR sub_0x01ECB9
C - - - - - 0x01612F 05:A11F: 20 17 C0  JSR sub_0x01EE81_disable_NMI
C - - - - - 0x016132 05:A122: 20 1D C0  JSR sub_0x01ECD1_скрыть_фон_и_спрайты_за_полоской_слева
C - - - - - 0x016135 05:A125: 20 6A A1  JSR sub_A16A
C - - - - - 0x016138 05:A128: 20 1A C0  JSR sub_0x01ECDB_отобразить_фон_и_спрайты
C - - - - - 0x01613B 05:A12B: 20 14 C0  JSR sub_0x01EE75_enable_NMI
C - - - - - 0x01613E 05:A12E: A9 02     LDA #con_music_menu
C - - - - - 0x016140 05:A130: 20 02 C0  JSR sub_0x01C2F4_play_sound
C - - - - - 0x016143 05:A133: 60        RTS



ofs_A134_00:
C - - J - - 0x016144 05:A134: AD B2 05  LDA ram_flag_brightness
C - - - - - 0x016147 05:A137: 10 03     BPL bra_A13C
C - - - - - 0x016149 05:A139: EE C9 05  INC ram_счетчик_опций
bra_A13C:
C - - - - - 0x01614C 05:A13C: 20 5C C0  JSR sub_0x01D083
C - - - - - 0x01614F 05:A13F: 4C 53 A1  JMP loc_A153



ofs_A142_01:
C - - J - - 0x016152 05:A142: AE CC 05  LDX ram_счетчик_смен
C - - - - - 0x016155 05:A145: B5 08     LDA ram_btn_press,X
C - - - - - 0x016157 05:A147: 29 F0     AND #con_btns__ABSS
C - - - - - 0x016159 05:A149: F0 08     BEQ bra_A153
C - - - - - 0x01615B 05:A14B: A9 33     LDA #con_sfx_yes
C - - - - - 0x01615D 05:A14D: 20 02 C0  JSR sub_0x01C2F4_play_sound
C - - - - - 0x016160 05:A150: 20 5F A1  JSR sub_A15F
bra_A153:
loc_A153:
C D 1 - - - 0x016163 05:A153: A2 00     LDX #$00
C - - - - - 0x016165 05:A155: 20 94 91  JSR sub_9194
C - - - - - 0x016168 05:A158: 20 65 C0  JSR sub_0x01EB9C
C - - - - - 0x01616B 05:A15B: 20 14 80  JSR sub_0x01C2AE
C - - - - - 0x01616E 05:A15E: 60        RTS



sub_A15F:
C - - - - - 0x01616F 05:A15F: 20 44 C0  JSR sub_0x01D057
C - - - - - 0x016172 05:A162: 20 4A C0  JSR sub_0x01D072
C - - - - - 0x016175 05:A165: A9 04     LDA #$04
C - - - - - 0x016177 05:A167: 85 59     STA ram_subscript
C - - - - - 0x016179 05:A169: 60        RTS



sub_A16A:
C - - - - - 0x01617A 05:A16A: 20 65 BF  JSR sub_BF65
C - - - - - 0x01617D 05:A16D: 20 2A BF  JSR sub_BF2A
C - - - - - 0x016180 05:A170: AD 03 06  LDA ram_0603
C - - - - - 0x016183 05:A173: 29 E0     AND #$E0
C - - - - - 0x016185 05:A175: 4A        LSR
C - - - - - 0x016186 05:A176: 4A        LSR
C - - - - - 0x016187 05:A177: 4A        LSR
C - - - - - 0x016188 05:A178: 4A        LSR
C - - - - - 0x016189 05:A179: A8        TAY
C - - - - - 0x01618A 05:A17A: B9 3B A2  LDA tbl_A23B,Y
C - - - - - 0x01618D 05:A17D: 8D 96 06  STA ram_буфер_атрибутов
C - - - - - 0x016190 05:A180: B9 3C A2  LDA tbl_A23C,Y
C - - - - - 0x016193 05:A183: 8D 97 06  STA ram_буфер_атрибутов + 1
C - - - - - 0x016196 05:A186: A9 02     LDA #$02
C - - - - - 0x016198 05:A188: 8D 95 06  STA ram_счетчик_буфера_атрибутов
C - - - - - 0x01619B 05:A18B: 8D B8 06  STA ram_счетчик_буфера_графики
C - - - - - 0x01619E 05:A18E: A9 19     LDA #< $2219
C - - - - - 0x0161A0 05:A190: 8D 94 06  STA ram_байт_2006_lo_атрибуты
C - - - - - 0x0161A3 05:A193: A9 22     LDA #> $2219
C - - - - - 0x0161A5 05:A195: 8D 93 06  STA ram_байт_2006_hi_атрибуты
C - - - - - 0x0161A8 05:A198: AD 95 04  LDA ram_направление_молния_смерч
C - - - - - 0x0161AB 05:A19B: 29 03     AND #$03
C - - - - - 0x0161AD 05:A19D: 0A        ASL
C - - - - - 0x0161AE 05:A19E: A8        TAY
C - - - - - 0x0161AF 05:A19F: B9 4B A2  LDA tbl_A24B,Y
C - - - - - 0x0161B2 05:A1A2: 8D B9 06  STA ram_буфер_графики
C - - - - - 0x0161B5 05:A1A5: B9 4C A2  LDA tbl_A24C,Y
C - - - - - 0x0161B8 05:A1A8: 8D BA 06  STA ram_буфер_графики + 1
C - - - - - 0x0161BB 05:A1AB: A9 5A     LDA #< $225A
C - - - - - 0x0161BD 05:A1AD: 8D B7 06  STA ram_байт_2006_lo_графика
C - - - - - 0x0161C0 05:A1B0: A9 22     LDA #> $225A
C - - - - - 0x0161C2 05:A1B2: 8D B6 06  STA ram_байт_2006_hi_графика
C - - - - - 0x0161C5 05:A1B5: 20 6B C0  JSR sub_0x01EFBD_write_buffers_to_ppu
C - - - - - 0x0161C8 05:A1B8: AD 94 04  LDA ram_опция_дождь_ветер
C - - - - - 0x0161CB 05:A1BB: 29 70     AND #$70
C - - - - - 0x0161CD 05:A1BD: 4A        LSR
C - - - - - 0x0161CE 05:A1BE: A8        TAY
C - - - - - 0x0161CF 05:A1BF: A2 00     LDX #$00
bra_A1C1:
C - - - - - 0x0161D1 05:A1C1: B9 51 A2  LDA tbl_A251,Y
C - - - - - 0x0161D4 05:A1C4: 9D 96 06  STA ram_буфер_атрибутов,X
C - - - - - 0x0161D7 05:A1C7: B9 55 A2  LDA tbl_A255,Y
C - - - - - 0x0161DA 05:A1CA: 9D B9 06  STA ram_буфер_графики,X
C - - - - - 0x0161DD 05:A1CD: C8        INY
C - - - - - 0x0161DE 05:A1CE: E8        INX
C - - - - - 0x0161DF 05:A1CF: E0 04     CPX #$04
C - - - - - 0x0161E1 05:A1D1: 90 EE     BCC bra_A1C1
C - - - - - 0x0161E3 05:A1D3: A9 04     LDA #$04
C - - - - - 0x0161E5 05:A1D5: 8D 95 06  STA ram_счетчик_буфера_атрибутов
C - - - - - 0x0161E8 05:A1D8: 8D B8 06  STA ram_счетчик_буфера_графики
C - - - - - 0x0161EB 05:A1DB: A9 78     LDA #$78
C - - - - - 0x0161ED 05:A1DD: 8D 94 06  STA ram_байт_2006_lo_атрибуты
C - - - - - 0x0161F0 05:A1E0: A9 98     LDA #$98
C - - - - - 0x0161F2 05:A1E2: 8D B7 06  STA ram_байт_2006_lo_графика
C - - - - - 0x0161F5 05:A1E5: A9 22     LDA #$22
C - - - - - 0x0161F7 05:A1E7: 8D 93 06  STA ram_байт_2006_hi_атрибуты
C - - - - - 0x0161FA 05:A1EA: 8D B6 06  STA ram_байт_2006_hi_графика
C - - - - - 0x0161FD 05:A1ED: 85 2D     STA ram_002D
C - - - - - 0x0161FF 05:A1EF: A9 D8     LDA #$D8
C - - - - - 0x016201 05:A1F1: 85 2C     STA ram_002C
C - - - - - 0x016203 05:A1F3: 20 6B C0  JSR sub_0x01EFBD_write_buffers_to_ppu
C - - - - - 0x016206 05:A1F6: AD 95 04  LDA ram_направление_молния_смерч
C - - - - - 0x016209 05:A1F9: 29 0C     AND #$0C
C - - - - - 0x01620B 05:A1FB: F0 12     BEQ bra_A20F
- - - - - - 0x01620D 05:A1FD: A0 00     LDY #$00
- - - - - - 0x01620F 05:A1FF: 20 1C A2  JSR sub_A21C
- - - - - - 0x016212 05:A202: 18        CLC
- - - - - - 0x016213 05:A203: A5 2C     LDA ram_002C
- - - - - - 0x016215 05:A205: 69 40     ADC #$40
- - - - - - 0x016217 05:A207: 85 2C     STA ram_002C
- - - - - - 0x016219 05:A209: A5 2D     LDA ram_002D
- - - - - - 0x01621B 05:A20B: 69 00     ADC #$00
- - - - - - 0x01621D 05:A20D: 85 2D     STA ram_002D
bra_A20F:
C - - - - - 0x01621F 05:A20F: AD 95 04  LDA ram_направление_молния_смерч
C - - - - - 0x016222 05:A212: 29 30     AND #$30
C - - - - - 0x016224 05:A214: F0 05     BEQ bra_A21B_RTS
C - - - - - 0x016226 05:A216: A0 04     LDY #$04
C - - - - - 0x016228 05:A218: 20 1C A2  JSR sub_A21C
bra_A21B_RTS:
C - - - - - 0x01622B 05:A21B: 60        RTS



sub_A21C:
C - - - - - 0x01622C 05:A21C: A2 00     LDX #$00
bra_A21E:
C - - - - - 0x01622E 05:A21E: B9 79 A2  LDA tbl_A279,Y
C - - - - - 0x016231 05:A221: 9D 96 06  STA ram_буфер_атрибутов,X
C - - - - - 0x016234 05:A224: C8        INY
C - - - - - 0x016235 05:A225: E8        INX
C - - - - - 0x016236 05:A226: E0 04     CPX #$04
C - - - - - 0x016238 05:A228: 90 F4     BCC bra_A21E
C - - - - - 0x01623A 05:A22A: 8E 95 06  STX ram_счетчик_буфера_атрибутов
C - - - - - 0x01623D 05:A22D: A5 2C     LDA ram_002C
C - - - - - 0x01623F 05:A22F: 8D 94 06  STA ram_байт_2006_lo_атрибуты
C - - - - - 0x016242 05:A232: A5 2D     LDA ram_002D
C - - - - - 0x016244 05:A234: 8D 93 06  STA ram_байт_2006_hi_атрибуты
C - - - - - 0x016247 05:A237: 20 6B C0  JSR sub_0x01EFBD_write_buffers_to_ppu
C - - - - - 0x01624A 05:A23A: 60        RTS



tbl_A23B:
- D 1 - - - 0x01624B 05:A23B: 02        .byte $02   ; 
tbl_A23C:
- D 1 - - - 0x01624C 05:A23C: 80        .byte $80   ; 
- D 1 - - - 0x01624D 05:A23D: 81        .byte $81   ; 
- D 1 - - - 0x01624E 05:A23E: 80        .byte $80   ; 
- D 1 - - - 0x01624F 05:A23F: 82        .byte $82   ; 
- D 1 - - - 0x016250 05:A240: 80        .byte $80   ; 
- - - - - - 0x016251 05:A241: 85        .byte $85   ; 
- - - - - - 0x016252 05:A242: 80        .byte $80   ; 
- - - - - - 0x016253 05:A243: 86        .byte $86   ; 
- - - - - - 0x016254 05:A244: 80        .byte $80   ; 
- - - - - - 0x016255 05:A245: 87        .byte $87   ; 
- - - - - - 0x016256 05:A246: 80        .byte $80   ; 
- - - - - - 0x016257 05:A247: 88        .byte $88   ; 
- - - - - - 0x016258 05:A248: 80        .byte $80   ; 
- - - - - - 0x016259 05:A249: 89        .byte $89   ; 
- - - - - - 0x01625A 05:A24A: 80        .byte $80   ; 



tbl_A24B:
- D 1 - - - 0x01625B 05:A24B: FF        .byte $FF   ; 
tbl_A24C:
- D 1 - - - 0x01625C 05:A24C: 20        .byte $20   ; 
- - - - - - 0x01625D 05:A24D: E4        .byte $E4   ; 
- - - - - - 0x01625E 05:A24E: E5        .byte $E5   ; 
- - - - - - 0x01625F 05:A24F: FF        .byte $FF   ; 
- - - - - - 0x016260 05:A250: 1C        .byte $1C   ; 



tbl_A251:
- D 1 - - - 0x016261 05:A251: FF        .byte $FF   ; 
- D 1 - - - 0x016262 05:A252: FF        .byte $FF   ; 
- D 1 - - - 0x016263 05:A253: FF        .byte $FF   ; 
- D 1 - - - 0x016264 05:A254: FF        .byte $FF   ; 
tbl_A255:
- D 1 - - - 0x016265 05:A255: FF        .byte $FF   ; 
- D 1 - - - 0x016266 05:A256: FF        .byte $FF   ; 
- D 1 - - - 0x016267 05:A257: B6        .byte $B6   ; 
- D 1 - - - 0x016268 05:A258: AD        .byte $AD   ; 
- - - - - - 0x016269 05:A259: FF        .byte $FF   ; 
- - - - - - 0x01626A 05:A25A: FF        .byte $FF   ; 
- - - - - - 0x01626B 05:A25B: FF        .byte $FF   ; 
- - - - - - 0x01626C 05:A25C: FF        .byte $FF   ; 
- - - - - - 0x01626D 05:A25D: FF        .byte $FF   ; 
- - - - - - 0x01626E 05:A25E: C7        .byte $C7   ; 
- - - - - - 0x01626F 05:A25F: CD        .byte $CD   ; 
- - - - - - 0x016270 05:A260: A3        .byte $A3   ; 
- - - - - - 0x016271 05:A261: FF        .byte $FF   ; 
- - - - - - 0x016272 05:A262: FF        .byte $FF   ; 
- - - - - - 0x016273 05:A263: FF        .byte $FF   ; 
- - - - - - 0x016274 05:A264: FF        .byte $FF   ; 
- - - - - - 0x016275 05:A265: FF        .byte $FF   ; 
- - - - - - 0x016276 05:A266: BD        .byte $BD   ; 
- - - - - - 0x016277 05:A267: B3        .byte $B3   ; 
- - - - - - 0x016278 05:A268: A4        .byte $A4   ; 
- D 1 - - - 0x016279 05:A269: FF        .byte $FF   ; 
- D 1 - - - 0x01627A 05:A26A: FF        .byte $FF   ; 
- D 1 - - - 0x01627B 05:A26B: FF        .byte $FF   ; 
- D 1 - - - 0x01627C 05:A26C: FF        .byte $FF   ; 
- D 1 - - - 0x01627D 05:A26D: FF        .byte $FF   ; 
- D 1 - - - 0x01627E 05:A26E: B3        .byte $B3   ; 
- D 1 - - - 0x01627F 05:A26F: C7        .byte $C7   ; 
- D 1 - - - 0x016280 05:A270: A3        .byte $A3   ; 
- - - - - - 0x016281 05:A271: FF        .byte $FF   ; 
- - - - - - 0x016282 05:A272: FF        .byte $FF   ; 
- - - - - - 0x016283 05:A273: DB        .byte $DB   ; 
- - - - - - 0x016284 05:A274: FF        .byte $FF   ; 
- - - - - - 0x016285 05:A275: B5        .byte $B5   ; 
- - - - - - 0x016286 05:A276: D0        .byte $D0   ; 
- - - - - - 0x016287 05:A277: BD        .byte $BD   ; 
- - - - - - 0x016288 05:A278: A4        .byte $A4   ; 



tbl_A279:
- - - - - - 0x016289 05:A279: A7        .byte $A7   ; 
- - - - - - 0x01628A 05:A27A: C1        .byte $C1   ; 
- - - - - - 0x01628B 05:A27B: B6        .byte $B6   ; 
- - - - - - 0x01628C 05:A27C: C9        .byte $C9   ; 
- D 1 - - - 0x01628D 05:A27D: B1        .byte $B1   ; 
- D 1 - - - 0x01628E 05:A27E: B3        .byte $B3   ; 
- D 1 - - - 0x01628F 05:A27F: C0        .byte $C0   ; 
- D 1 - - - 0x016290 05:A280: A8        .byte $A8   ; 



sub_A281:
C - - - - - 0x016291 05:A281: A5 59     LDA ram_subscript
C - - - - - 0x016293 05:A283: 30 06     BMI bra_A28B
C - - - - - 0x016295 05:A285: 20 DF 80  JSR sub_80DF
C - - - - - 0x016298 05:A288: 20 95 A2  JSR sub_A295
bra_A28B:
C - - - - - 0x01629B 05:A28B: AD C9 05  LDA ram_счетчик_опций
C - - - - - 0x01629E 05:A28E: 20 53 C0  JSR sub_0x01EC9F_jump_to_pointers_after_JSR
- D 1 - I - 0x0162A1 05:A291: C5 A2     .word ofs_A2C5_00
- D 1 - I - 0x0162A3 05:A293: D0 A2     .word ofs_A2D0_01



sub_A295:
C - - - - - 0x0162A5 05:A295: A9 00     LDA #$00
C - - - - - 0x0162A7 05:A297: 8D 2C 05  STA ram_номер_команды
C - - - - - 0x0162AA 05:A29A: 20 38 BD  JSR sub_BD38_рожи
C - - - - - 0x0162AD 05:A29D: 20 0B C0  JSR sub_0x01EEAA_базовые_банки_спрайтов
C - - - - - 0x0162B0 05:A2A0: AD D1 05  LDA ram_05D1
C - - - - - 0x0162B3 05:A2A3: 8D 5C 05  STA ram_лицо_игрока
C - - - - - 0x0162B6 05:A2A6: A9 FF     LDA #$FF
C - - - - - 0x0162B8 05:A2A8: 8D CA 05  STA ram_номер_опции
C - - - - - 0x0162BB 05:A2AB: 20 F7 A2  JSR sub_A2F7
C - - - - - 0x0162BE 05:A2AE: 20 1F A3  JSR sub_A31F
C - - - - - 0x0162C1 05:A2B1: 18        CLC
C - - - - - 0x0162C2 05:A2B2: AD D1 05  LDA ram_05D1
C - - - - - 0x0162C5 05:A2B5: 69 01     ADC #$01
C - - - - - 0x0162C7 05:A2B7: 8D 06 06  STA ram_0606
C - - - - - 0x0162CA 05:A2BA: A9 80     LDA #$80
C - - - - - 0x0162CC 05:A2BC: 8D 04 06  STA ram_0604
C - - - - - 0x0162CF 05:A2BF: A9 02     LDA #con_music_menu
C - - - - - 0x0162D1 05:A2C1: 20 02 C0  JSR sub_0x01C2F4_play_sound
C - - - - - 0x0162D4 05:A2C4: 60        RTS



ofs_A2C5_00:
C - - J - - 0x0162D5 05:A2C5: AD B2 05  LDA ram_flag_brightness
C - - - - - 0x0162D8 05:A2C8: 10 03     BPL bra_A2CD
C - - - - - 0x0162DA 05:A2CA: EE C9 05  INC ram_счетчик_опций
bra_A2CD:
C - - - - - 0x0162DD 05:A2CD: 4C E8 A2  JMP loc_A2E8



ofs_A2D0_01:
C - - J - - 0x0162E0 05:A2D0: 2C B2 05  BIT ram_flag_brightness
C - - - - - 0x0162E3 05:A2D3: 10 13     BPL bra_A2E8
C - - - - - 0x0162E5 05:A2D5: 50 06     BVC bra_A2DD
C - - - - - 0x0162E7 05:A2D7: 20 18 A3  JSR sub_A318
C - - - - - 0x0162EA 05:A2DA: 4C F6 A2  RTS
bra_A2DD:
C - - - - - 0x0162ED 05:A2DD: 20 71 C0  JSR sub_0x01C327
C - - - - - 0x0162F0 05:A2E0: AD 05 06  LDA ram_0605
C - - - - - 0x0162F3 05:A2E3: 30 03     BMI bra_A2E8
C - - - - - 0x0162F5 05:A2E5: 20 44 C0  JSR sub_0x01D057
bra_A2E8:
loc_A2E8:
C D 1 - - - 0x0162F8 05:A2E8: A2 00     LDX #$00
C - - - - - 0x0162FA 05:A2EA: 20 94 91  JSR sub_9194
C - - - - - 0x0162FD 05:A2ED: 20 65 C0  JSR sub_0x01EB9C
C - - - - - 0x016300 05:A2F0: 20 14 80  JSR sub_0x01C2AE
C - - - - - 0x016303 05:A2F3: 20 5C C0  JSR sub_0x01D083
C D 1 - - - 0x016306 05:A2F6: 60        RTS



sub_A2F7:
C - - - - - 0x016307 05:A2F7: A2 00     LDX #$00
C - - - - - 0x016309 05:A2F9: A9 00     LDA #$00
C - - - - - 0x01630B 05:A2FB: 9D 74 00  STA ram_animation_id_player,X
C - - - - - 0x01630E 05:A2FE: 9D 61 00  STA ram_0061,X
C - - - - - 0x016311 05:A301: 8A        TXA
C - - - - - 0x016312 05:A302: 0A        ASL
C - - - - - 0x016313 05:A303: A8        TAY
C - - - - - 0x016314 05:A304: B9 16 A3  LDA tbl_A316,Y
C - - - - - 0x016317 05:A307: 9D 14 03  STA ram_pos_X_lo_player,X
C - - - - - 0x01631A 05:A30A: B9 17 A3  LDA tbl_A317,Y
C - - - - - 0x01631D 05:A30D: 9D 4D 03  STA ram_pos_Y_lo_player,X
C - - - - - 0x016320 05:A310: A9 09     LDA #$09
C - - - - - 0x016322 05:A312: 9D 59 04  STA ram_movement_id_player,X
C - - - - - 0x016325 05:A315: 60        RTS

; bzk
tbl_A316:
- D 1 - - - 0x016326 05:A316: 3C        .byte $3C   ; 
tbl_A317:
- D 1 - - - 0x016327 05:A317: 60        .byte $60   ; 



sub_A318:
C - - - - - 0x016328 05:A318: AD 5B 00  LDA ram_for_0059
C - - - - - 0x01632B 05:A31B: 8D 59 00  STA ram_subscript
C - - - - - 0x01632E 05:A31E: 60        RTS



sub_A31F:
C - - - - - 0x01632F 05:A31F: 20 11 C0  JSR sub_0x01ECB9
C - - - - - 0x016332 05:A322: 20 17 C0  JSR sub_0x01EE81_disable_NMI
C - - - - - 0x016335 05:A325: 20 1D C0  JSR sub_0x01ECD1_скрыть_фон_и_спрайты_за_полоской_слева
C - - - - - 0x016338 05:A328: AD D1 05  LDA ram_05D1
C - - - - - 0x01633B 05:A32B: 0A        ASL
C - - - - - 0x01633C 05:A32C: 0A        ASL
C - - - - - 0x01633D 05:A32D: 0A        ASL
C - - - - - 0x01633E 05:A32E: 38        SEC
C - - - - - 0x01633F 05:A32F: ED D1 05  SBC ram_05D1
C - - - - - 0x016342 05:A332: 85 2B     STA ram_002B
C - - - - - 0x016344 05:A334: A8        TAY
C - - - - - 0x016345 05:A335: B9 3C A4  LDA tbl_A43C,Y
C - - - - - 0x016348 05:A338: 20 11 8A  JSR sub_8A11
C - - - - - 0x01634B 05:A33B: A5 31     LDA ram_0031
C - - - - - 0x01634D 05:A33D: 09 80     ORA #$80
C - - - - - 0x01634F 05:A33F: 8D 96 06  STA ram_буфер_атрибутов
C - - - - - 0x016352 05:A342: A5 30     LDA ram_0030
C - - - - - 0x016354 05:A344: 09 80     ORA #$80
C - - - - - 0x016356 05:A346: 8D 97 06  STA ram_буфер_атрибутов + 1
C - - - - - 0x016359 05:A349: B9 3D A4  LDA tbl_A43D,Y
C - - - - - 0x01635C 05:A34C: 20 11 8A  JSR sub_8A11
C - - - - - 0x01635F 05:A34F: A5 31     LDA ram_0031
C - - - - - 0x016361 05:A351: 09 80     ORA #$80
C - - - - - 0x016363 05:A353: 8D B9 06  STA ram_буфер_графики
C - - - - - 0x016366 05:A356: A5 30     LDA ram_0030
C - - - - - 0x016368 05:A358: 09 80     ORA #$80
C - - - - - 0x01636A 05:A35A: 8D BA 06  STA ram_буфер_графики + 1
C - - - - - 0x01636D 05:A35D: B9 3E A4  LDA tbl_A43E,Y
C - - - - - 0x016370 05:A360: 20 11 8A  JSR sub_8A11
C - - - - - 0x016373 05:A363: A5 31     LDA ram_0031
C - - - - - 0x016375 05:A365: 09 80     ORA #$80
C - - - - - 0x016377 05:A367: 8D DC 06  STA ram_буфер_палитры
C - - - - - 0x01637A 05:A36A: A5 30     LDA ram_0030
C - - - - - 0x01637C 05:A36C: 09 80     ORA #$80
C - - - - - 0x01637E 05:A36E: 8D DD 06  STA ram_буфер_палитры + 1
C - - - - - 0x016381 05:A371: A9 02     LDA #$02
C - - - - - 0x016383 05:A373: 8D 95 06  STA ram_счетчик_буфера_атрибутов
C - - - - - 0x016386 05:A376: 8D B8 06  STA ram_счетчик_буфера_графики
C - - - - - 0x016389 05:A379: 8D DB 06  STA ram_счетчик_буфера_палитры
C - - - - - 0x01638C 05:A37C: A9 F9     LDA #< $20F9
C - - - - - 0x01638E 05:A37E: 8D 94 06  STA ram_байт_2006_lo_атрибуты
C - - - - - 0x016391 05:A381: A9 20     LDA #> $20F9
C - - - - - 0x016393 05:A383: 8D 93 06  STA ram_байт_2006_hi_атрибуты
C - - - - - 0x016396 05:A386: A9 39     LDA #$39
C - - - - - 0x016398 05:A388: 8D B7 06  STA ram_байт_2006_lo_графика
C - - - - - 0x01639B 05:A38B: A9 79     LDA #$79
C - - - - - 0x01639D 05:A38D: 8D DA 06  STA ram_байт_2006_lo_палитра
C - - - - - 0x0163A0 05:A390: A9 21     LDA #$21
C - - - - - 0x0163A2 05:A392: 8D B6 06  STA ram_байт_2006_hi_графика
C - - - - - 0x0163A5 05:A395: 8D D9 06  STA ram_байт_2006_hi_палитра
C - - - - - 0x0163A8 05:A398: 20 6B C0  JSR sub_0x01EFBD_write_buffers_to_ppu
C - - - - - 0x0163AB 05:A39B: A4 2B     LDY ram_002B
C - - - - - 0x0163AD 05:A39D: B9 3F A4  LDA tbl_A43F,Y
C - - - - - 0x0163B0 05:A3A0: 8D DC 06  STA ram_буфер_палитры
C - - - - - 0x0163B3 05:A3A3: A9 01     LDA #$01
C - - - - - 0x0163B5 05:A3A5: 8D DB 06  STA ram_счетчик_буфера_палитры
C - - - - - 0x0163B8 05:A3A8: A9 B9     LDA #< $21B9
C - - - - - 0x0163BA 05:A3AA: 8D DA 06  STA ram_байт_2006_lo_палитра
C - - - - - 0x0163BD 05:A3AD: A9 21     LDA #> $21B9
C - - - - - 0x0163BF 05:A3AF: 8D D9 06  STA ram_байт_2006_hi_палитра
C - - - - - 0x0163C2 05:A3B2: AD D1 05  LDA ram_05D1
C - - - - - 0x0163C5 05:A3B5: 20 FF B1  JSR sub_B1FF
C - - - - - 0x0163C8 05:A3B8: A9 05     LDA #$05
C - - - - - 0x0163CA 05:A3BA: 85 1F     STA ram_001F
C - - - - - 0x0163CC 05:A3BC: A9 C4     LDA #$C4
C - - - - - 0x0163CE 05:A3BE: 85 34     STA ram_0034
C - - - - - 0x0163D0 05:A3C0: A9 21     LDA #$21
C - - - - - 0x0163D2 05:A3C2: 85 35     STA ram_0035
C - - - - - 0x0163D4 05:A3C4: 20 0D A4  JSR sub_A40D
C - - - - - 0x0163D7 05:A3C7: A9 D2     LDA #$D2
C - - - - - 0x0163D9 05:A3C9: 85 34     STA ram_0034
C - - - - - 0x0163DB 05:A3CB: A9 21     LDA #$21
C - - - - - 0x0163DD 05:A3CD: 85 35     STA ram_0035
C - - - - - 0x0163DF 05:A3CF: A9 02     LDA #$02
C - - - - - 0x0163E1 05:A3D1: 85 2A     STA ram_002A
bra_A3D3:
C - - - - - 0x0163E3 05:A3D3: A4 2B     LDY ram_002B
C - - - - - 0x0163E5 05:A3D5: B9 40 A4  LDA tbl_A440,Y
C - - - - - 0x0163E8 05:A3D8: 30 2C     BMI bra_A406
C - - - - - 0x0163EA 05:A3DA: 0A        ASL
C - - - - - 0x0163EB 05:A3DB: 79 40 A4  ADC tbl_A440,Y
C - - - - - 0x0163EE 05:A3DE: 0A        ASL
C - - - - - 0x0163EF 05:A3DF: 0A        ASL
C - - - - - 0x0163F0 05:A3E0: 6D 90 A4  ADC tbl_A490
C - - - - - 0x0163F3 05:A3E3: 85 30     STA ram_0030
C - - - - - 0x0163F5 05:A3E5: A9 00     LDA #$00
C - - - - - 0x0163F7 05:A3E7: 6D 91 A4  ADC tbl_A490 + 1
C - - - - - 0x0163FA 05:A3EA: 85 31     STA ram_0031
C - - - - - 0x0163FC 05:A3EC: A9 0C     LDA #$0C
C - - - - - 0x0163FE 05:A3EE: 85 1F     STA ram_001F
C - - - - - 0x016400 05:A3F0: 20 0D A4  JSR sub_A40D
C - - - - - 0x016403 05:A3F3: 18        CLC
C - - - - - 0x016404 05:A3F4: A5 34     LDA ram_0034
C - - - - - 0x016406 05:A3F6: 69 40     ADC #$40
C - - - - - 0x016408 05:A3F8: 85 34     STA ram_0034
C - - - - - 0x01640A 05:A3FA: A5 35     LDA ram_0035
C - - - - - 0x01640C 05:A3FC: 69 00     ADC #$00
C - - - - - 0x01640E 05:A3FE: 85 35     STA ram_0035
C - - - - - 0x016410 05:A400: E6 2B     INC ram_002B
C - - - - - 0x016412 05:A402: C6 2A     DEC ram_002A
C - - - - - 0x016414 05:A404: 10 CD     BPL bra_A3D3
bra_A406:
C - - - - - 0x016416 05:A406: 20 1A C0  JSR sub_0x01ECDB_отобразить_фон_и_спрайты
C - - - - - 0x016419 05:A409: 20 14 C0  JSR sub_0x01EE75_enable_NMI
C - - - - - 0x01641C 05:A40C: 60        RTS



sub_A40D:
C - - - - - 0x01641D 05:A40D: A9 FF     LDA #$FF
C - - - - - 0x01641F 05:A40F: 85 1C     STA ram_001C
C - - - - - 0x016421 05:A411: A0 DA     LDY #$DA
C - - - - - 0x016423 05:A413: 84 1D     STY ram_001D
C - - - - - 0x016425 05:A415: C8        INY
C - - - - - 0x016426 05:A416: 84 1E     STY ram_001E
C - - - - - 0x016428 05:A418: 20 91 AD  JSR sub_AD91
C - - - - - 0x01642B 05:A41B: A5 1F     LDA ram_001F
C - - - - - 0x01642D 05:A41D: 8D 95 06  STA ram_счетчик_буфера_атрибутов
C - - - - - 0x016430 05:A420: 8D B8 06  STA ram_счетчик_буфера_графики
C - - - - - 0x016433 05:A423: 18        CLC
C - - - - - 0x016434 05:A424: A5 34     LDA ram_0034
C - - - - - 0x016436 05:A426: 8D 94 06  STA ram_байт_2006_lo_атрибуты
C - - - - - 0x016439 05:A429: 69 20     ADC #$20
C - - - - - 0x01643B 05:A42B: 8D B7 06  STA ram_байт_2006_lo_графика
C - - - - - 0x01643E 05:A42E: A5 35     LDA ram_0035
C - - - - - 0x016440 05:A430: 8D 93 06  STA ram_байт_2006_hi_атрибуты
C - - - - - 0x016443 05:A433: 69 00     ADC #$00
C - - - - - 0x016445 05:A435: 8D B6 06  STA ram_байт_2006_hi_графика
C - - - - - 0x016448 05:A438: 20 6B C0  JSR sub_0x01EFBD_write_buffers_to_ppu
C - - - - - 0x01644B 05:A43B: 60        RTS



tbl_A43C:
- D 1 - - - 0x01644C 05:A43C: 32        .byte $32   ; 
tbl_A43D:
- D 1 - - - 0x01644D 05:A43D: 15        .byte $15   ; 
tbl_A43E:
- D 1 - - - 0x01644E 05:A43E: 19        .byte $19   ; 
tbl_A43F:
- D 1 - - - 0x01644F 05:A43F: 8B        .byte $8B   ; 
tbl_A440:
- D 1 - - - 0x016450 05:A440: 0F        .byte $0F   ; 
- D 1 - - - 0x016451 05:A441: 01        .byte $01   ; 
- D 1 - - - 0x016452 05:A442: FF        .byte $FF   ; 
- D 1 - - - 0x016453 05:A443: 32        .byte $32   ; 
- D 1 - - - 0x016454 05:A444: 18        .byte $18   ; 
- D 1 - - - 0x016455 05:A445: 14        .byte $14   ; 
- D 1 - - - 0x016456 05:A446: 8A        .byte $8A   ; 
- D 1 - - - 0x016457 05:A447: 0E        .byte $0E   ; 
- D 1 - - - 0x016458 05:A448: 05        .byte $05   ; 
- D 1 - - - 0x016459 05:A449: FF        .byte $FF   ; 
- D 1 - - - 0x01645A 05:A44A: 37        .byte $37   ; 
- D 1 - - - 0x01645B 05:A44B: 1B        .byte $1B   ; 
- D 1 - - - 0x01645C 05:A44C: 0F        .byte $0F   ; 
- D 1 - - - 0x01645D 05:A44D: 8B        .byte $8B   ; 
- D 1 - - - 0x01645E 05:A44E: 10        .byte $10   ; 
- D 1 - - - 0x01645F 05:A44F: 02        .byte $02   ; 
- D 1 - - - 0x016460 05:A450: FF        .byte $FF   ; 
- D 1 - - - 0x016461 05:A451: 3C        .byte $3C   ; 
- D 1 - - - 0x016462 05:A452: 18        .byte $18   ; 
- D 1 - - - 0x016463 05:A453: 14        .byte $14   ; 
- D 1 - - - 0x016464 05:A454: 8D        .byte $8D   ; 
- D 1 - - - 0x016465 05:A455: 08        .byte $08   ; 
- D 1 - - - 0x016466 05:A456: 01        .byte $01   ; 
- D 1 - - - 0x016467 05:A457: FF        .byte $FF   ; 
- D 1 - - - 0x016468 05:A458: 2D        .byte $2D   ; 
- D 1 - - - 0x016469 05:A459: 18        .byte $18   ; 
- D 1 - - - 0x01646A 05:A45A: 14        .byte $14   ; 
- D 1 - - - 0x01646B 05:A45B: 8B        .byte $8B   ; 
- D 1 - - - 0x01646C 05:A45C: 09        .byte $09   ; 
- D 1 - - - 0x01646D 05:A45D: 04        .byte $04   ; 
- D 1 - - - 0x01646E 05:A45E: FF        .byte $FF   ; 
- D 1 - - - 0x01646F 05:A45F: 3C        .byte $3C   ; 
- D 1 - - - 0x016470 05:A460: 15        .byte $15   ; 
- D 1 - - - 0x016471 05:A461: 14        .byte $14   ; 
- D 1 - - - 0x016472 05:A462: 8C        .byte $8C   ; 
- D 1 - - - 0x016473 05:A463: 07        .byte $07   ; 
- D 1 - - - 0x016474 05:A464: 00        .byte $00   ; 
- D 1 - - - 0x016475 05:A465: 03        .byte $03   ; 
- D 1 - - - 0x016476 05:A466: 2D        .byte $2D   ; 
- D 1 - - - 0x016477 05:A467: 0F        .byte $0F   ; 
- D 1 - - - 0x016478 05:A468: 14        .byte $14   ; 
- D 1 - - - 0x016479 05:A469: 8D        .byte $8D   ; 
- D 1 - - - 0x01647A 05:A46A: 0A        .byte $0A   ; 
- D 1 - - - 0x01647B 05:A46B: 06        .byte $06   ; 
- D 1 - - - 0x01647C 05:A46C: FF        .byte $FF   ; 
- D 1 - - - 0x01647D 05:A46D: 32        .byte $32   ; 
- D 1 - - - 0x01647E 05:A46E: 0F        .byte $0F   ; 
- D 1 - - - 0x01647F 05:A46F: 0F        .byte $0F   ; 
- D 1 - - - 0x016480 05:A470: 8B        .byte $8B   ; 
- D 1 - - - 0x016481 05:A471: 0B        .byte $0B   ; 
- D 1 - - - 0x016482 05:A472: 00        .byte $00   ; 
- D 1 - - - 0x016483 05:A473: FF        .byte $FF   ; 
- D 1 - - - 0x016484 05:A474: 32        .byte $32   ; 
- D 1 - - - 0x016485 05:A475: 1B        .byte $1B   ; 
- D 1 - - - 0x016486 05:A476: 0F        .byte $0F   ; 
- D 1 - - - 0x016487 05:A477: 8C        .byte $8C   ; 
- D 1 - - - 0x016488 05:A478: 0C        .byte $0C   ; 
- D 1 - - - 0x016489 05:A479: 01        .byte $01   ; 
- D 1 - - - 0x01648A 05:A47A: FF        .byte $FF   ; 
- D 1 - - - 0x01648B 05:A47B: 2D        .byte $2D   ; 
- D 1 - - - 0x01648C 05:A47C: 15        .byte $15   ; 
- D 1 - - - 0x01648D 05:A47D: 0F        .byte $0F   ; 
- D 1 - - - 0x01648E 05:A47E: 8D        .byte $8D   ; 
- D 1 - - - 0x01648F 05:A47F: 0D        .byte $0D   ; 
- D 1 - - - 0x016490 05:A480: 01        .byte $01   ; 
- D 1 - - - 0x016491 05:A481: FF        .byte $FF   ; 
- D 1 - - - 0x016492 05:A482: 41        .byte $41   ; 
- D 1 - - - 0x016493 05:A483: 15        .byte $15   ; 
- D 1 - - - 0x016494 05:A484: 14        .byte $14   ; 
- D 1 - - - 0x016495 05:A485: 8B        .byte $8B   ; 
- D 1 - - - 0x016496 05:A486: 11        .byte $11   ; 
- D 1 - - - 0x016497 05:A487: 00        .byte $00   ; 
- D 1 - - - 0x016498 05:A488: FF        .byte $FF   ; 
- D 1 - - - 0x016499 05:A489: 41        .byte $41   ; 
- D 1 - - - 0x01649A 05:A48A: 18        .byte $18   ; 
- D 1 - - - 0x01649B 05:A48B: 19        .byte $19   ; 
- D 1 - - - 0x01649C 05:A48C: 8D        .byte $8D   ; 
- D 1 - - - 0x01649D 05:A48D: 12        .byte $12   ; 
- D 1 - - - 0x01649E 05:A48E: 03        .byte $03   ; 
- D 1 - - - 0x01649F 05:A48F: 06        .byte $06   ; 



tbl_A490:
- D 1 - - - 0x0164A0 05:A490: 92 A4     .word tbl_A492

tbl_A492:
- D 1 - I - 0x0164A2 05:A492: BC        .byte $BC   ; 
- D 1 - I - 0x0164A3 05:A493: D0        .byte $D0   ; 
- D 1 - I - 0x0164A4 05:A494: AC        .byte $AC   ; 
- D 1 - I - 0x0164A5 05:A495: B3        .byte $B3   ; 
- D 1 - I - 0x0164A6 05:A496: 35        .byte $35   ; 
- D 1 - I - 0x0164A7 05:A497: C9        .byte $C9   ; 
- D 1 - I - 0x0164A8 05:A498: 3D        .byte $3D   ; 
- D 1 - I - 0x0164A9 05:A499: CA        .byte $CA   ; 
- D 1 - I - 0x0164AA 05:A49A: FF        .byte $FF   ; 
- D 1 - I - 0x0164AB 05:A49B: FF        .byte $FF   ; 
- D 1 - I - 0x0164AC 05:A49C: FF        .byte $FF   ; 
- D 1 - I - 0x0164AD 05:A49D: FF        .byte $FF   ; 
- D 1 - I - 0x0164AE 05:A49E: 3B        .byte $3B   ; 
- D 1 - I - 0x0164AF 05:A49F: A9        .byte $A9   ; 
- D 1 - I - 0x0164B0 05:A4A0: CB        .byte $CB   ; 
- D 1 - I - 0x0164B1 05:A4A1: B3        .byte $B3   ; 
- D 1 - I - 0x0164B2 05:A4A2: A2        .byte $A2   ; 
- D 1 - I - 0x0164B3 05:A4A3: B1        .byte $B1   ; 
- D 1 - I - 0x0164B4 05:A4A4: D0        .byte $D0   ; 
- D 1 - I - 0x0164B5 05:A4A5: A9        .byte $A9   ; 
- D 1 - I - 0x0164B6 05:A4A6: FF        .byte $FF   ; 
- D 1 - I - 0x0164B7 05:A4A7: FF        .byte $FF   ; 
- D 1 - I - 0x0164B8 05:A4A8: FF        .byte $FF   ; 
- D 1 - I - 0x0164B9 05:A4A9: FF        .byte $FF   ; 
- D 1 - I - 0x0164BA 05:A4AA: B5        .byte $B5   ; 
- D 1 - I - 0x0164BB 05:A4AB: CA        .byte $CA   ; 
- D 1 - I - 0x0164BC 05:A4AC: B9        .byte $B9   ; 
- D 1 - I - 0x0164BD 05:A4AD: D9        .byte $D9   ; 
- D 1 - I - 0x0164BE 05:A4AE: 35        .byte $35   ; 
- D 1 - I - 0x0164BF 05:A4AF: A8        .byte $A8   ; 
- D 1 - I - 0x0164C0 05:A4B0: D0        .byte $D0   ; 
- D 1 - I - 0x0164C1 05:A4B1: A9        .byte $A9   ; 
- D 1 - I - 0x0164C2 05:A4B2: FF        .byte $FF   ; 
- D 1 - I - 0x0164C3 05:A4B3: FF        .byte $FF   ; 
- D 1 - I - 0x0164C4 05:A4B4: FF        .byte $FF   ; 
- D 1 - I - 0x0164C5 05:A4B5: FF        .byte $FF   ; 
- D 1 - I - 0x0164C6 05:A4B6: B5        .byte $B5   ; 
- D 1 - I - 0x0164C7 05:A4B7: CA        .byte $CA   ; 
- D 1 - I - 0x0164C8 05:A4B8: B9        .byte $B9   ; 
- D 1 - I - 0x0164C9 05:A4B9: D9        .byte $D9   ; 
- D 1 - I - 0x0164CA 05:A4BA: 35        .byte $35   ; 
- D 1 - I - 0x0164CB 05:A4BB: 6B        .byte $6B   ; 
- D 1 - I - 0x0164CC 05:A4BC: CF        .byte $CF   ; 
- D 1 - I - 0x0164CD 05:A4BD: B2        .byte $B2   ; 
- D 1 - I - 0x0164CE 05:A4BE: FF        .byte $FF   ; 
- D 1 - I - 0x0164CF 05:A4BF: FF        .byte $FF   ; 
- D 1 - I - 0x0164D0 05:A4C0: FF        .byte $FF   ; 
- D 1 - I - 0x0164D1 05:A4C1: FF        .byte $FF   ; 
- D 1 - I - 0x0164D2 05:A4C2: 35        .byte $35   ; 
- D 1 - I - 0x0164D3 05:A4C3: C9        .byte $C9   ; 
- D 1 - I - 0x0164D4 05:A4C4: CA        .byte $CA   ; 
- D 1 - I - 0x0164D5 05:A4C5: A2        .byte $A2   ; 
- D 1 - I - 0x0164D6 05:A4C6: B1        .byte $B1   ; 
- D 1 - I - 0x0164D7 05:A4C7: D0        .byte $D0   ; 
- D 1 - I - 0x0164D8 05:A4C8: A9        .byte $A9   ; 
- D 1 - I - 0x0164D9 05:A4C9: FF        .byte $FF   ; 
- D 1 - I - 0x0164DA 05:A4CA: FF        .byte $FF   ; 
- D 1 - I - 0x0164DB 05:A4CB: FF        .byte $FF   ; 
- D 1 - I - 0x0164DC 05:A4CC: FF        .byte $FF   ; 
- D 1 - I - 0x0164DD 05:A4CD: FF        .byte $FF   ; 
- D 1 - I - 0x0164DE 05:A4CE: B3        .byte $B3   ; 
- D 1 - I - 0x0164DF 05:A4CF: 3B        .byte $3B   ; 
- D 1 - I - 0x0164E0 05:A4D0: C3        .byte $C3   ; 
- D 1 - I - 0x0164E1 05:A4D1: 27        .byte $27   ; 
- D 1 - I - 0x0164E2 05:A4D2: A5        .byte $A5   ; 
- D 1 - I - 0x0164E3 05:A4D3: AD        .byte $AD   ; 
- D 1 - I - 0x0164E4 05:A4D4: FF        .byte $FF   ; 
- D 1 - I - 0x0164E5 05:A4D5: FF        .byte $FF   ; 
- D 1 - I - 0x0164E6 05:A4D6: FF        .byte $FF   ; 
- D 1 - I - 0x0164E7 05:A4D7: FF        .byte $FF   ; 
- D 1 - I - 0x0164E8 05:A4D8: FF        .byte $FF   ; 
- D 1 - I - 0x0164E9 05:A4D9: FF        .byte $FF   ; 
- D 1 - I - 0x0164EA 05:A4DA: B5        .byte $B5   ; 
- D 1 - I - 0x0164EB 05:A4DB: C9        .byte $C9   ; 
- D 1 - I - 0x0164EC 05:A4DC: 6D        .byte $6D   ; 
- D 1 - I - 0x0164ED 05:A4DD: CA        .byte $CA   ; 
- D 1 - I - 0x0164EE 05:A4DE: A2        .byte $A2   ; 
- D 1 - I - 0x0164EF 05:A4DF: A9        .byte $A9   ; 
- D 1 - I - 0x0164F0 05:A4E0: AF        .byte $AF   ; 
- D 1 - I - 0x0164F1 05:A4E1: CA        .byte $CA   ; 
- D 1 - I - 0x0164F2 05:A4E2: FF        .byte $FF   ; 
- D 1 - I - 0x0164F3 05:A4E3: FF        .byte $FF   ; 
- D 1 - I - 0x0164F4 05:A4E4: FF        .byte $FF   ; 
- D 1 - I - 0x0164F5 05:A4E5: FF        .byte $FF   ; 
- D 1 - I - 0x0164F6 05:A4E6: C3        .byte $C3   ; 
- D 1 - I - 0x0164F7 05:A4E7: 27        .byte $27   ; 
- D 1 - I - 0x0164F8 05:A4E8: 35        .byte $35   ; 
- D 1 - I - 0x0164F9 05:A4E9: C8        .byte $C8   ; 
- D 1 - I - 0x0164FA 05:A4EA: A3        .byte $A3   ; 
- D 1 - I - 0x0164FB 05:A4EB: 3D        .byte $3D   ; 
- D 1 - I - 0x0164FC 05:A4EC: AD        .byte $AD   ; 
- D 1 - I - 0x0164FD 05:A4ED: D2        .byte $D2   ; 
- D 1 - I - 0x0164FE 05:A4EE: D9        .byte $D9   ; 
- D 1 - I - 0x0164FF 05:A4EF: B5        .byte $B5   ; 
- D 1 - I - 0x016500 05:A4F0: FF        .byte $FF   ; 
- D 1 - I - 0x016501 05:A4F1: FF        .byte $FF   ; 
- D 1 - I - 0x016502 05:A4F2: BC        .byte $BC   ; 
- D 1 - I - 0x016503 05:A4F3: C3        .byte $C3   ; 
- D 1 - I - 0x016504 05:A4F4: C4        .byte $C4   ; 
- D 1 - I - 0x016505 05:A4F5: 29        .byte $29   ; 
- D 1 - I - 0x016506 05:A4F6: C8        .byte $C8   ; 
- D 1 - I - 0x016507 05:A4F7: AD        .byte $AD   ; 
- D 1 - I - 0x016508 05:A4F8: D2        .byte $D2   ; 
- D 1 - I - 0x016509 05:A4F9: D9        .byte $D9   ; 
- D 1 - I - 0x01650A 05:A4FA: B5        .byte $B5   ; 
- D 1 - I - 0x01650B 05:A4FB: FF        .byte $FF   ; 
- D 1 - I - 0x01650C 05:A4FC: FF        .byte $FF   ; 
- D 1 - I - 0x01650D 05:A4FD: FF        .byte $FF   ; 
- D 1 - I - 0x01650E 05:A4FE: 35        .byte $35   ; 
- D 1 - I - 0x01650F 05:A4FF: A7        .byte $A7   ; 
- D 1 - I - 0x016510 05:A500: CF        .byte $CF   ; 
- D 1 - I - 0x016511 05:A501: BF        .byte $BF   ; 
- D 1 - I - 0x016512 05:A502: A4        .byte $A4   ; 
- D 1 - I - 0x016513 05:A503: AD        .byte $AD   ; 
- D 1 - I - 0x016514 05:A504: D2        .byte $D2   ; 
- D 1 - I - 0x016515 05:A505: D9        .byte $D9   ; 
- D 1 - I - 0x016516 05:A506: B5        .byte $B5   ; 
- D 1 - I - 0x016517 05:A507: FF        .byte $FF   ; 
- D 1 - I - 0x016518 05:A508: FF        .byte $FF   ; 
- D 1 - I - 0x016519 05:A509: FF        .byte $FF   ; 
- D 1 - I - 0x01651A 05:A50A: A4        .byte $A4   ; 
- D 1 - I - 0x01651B 05:A50B: C8        .byte $C8   ; 
- D 1 - I - 0x01651C 05:A50C: C3        .byte $C3   ; 
- D 1 - I - 0x01651D 05:A50D: AD        .byte $AD   ; 
- D 1 - I - 0x01651E 05:A50E: C5        .byte $C5   ; 
- D 1 - I - 0x01651F 05:A50F: AD        .byte $AD   ; 
- D 1 - I - 0x016520 05:A510: D2        .byte $D2   ; 
- D 1 - I - 0x016521 05:A511: D9        .byte $D9   ; 
- D 1 - I - 0x016522 05:A512: B5        .byte $B5   ; 
- D 1 - I - 0x016523 05:A513: FF        .byte $FF   ; 
- D 1 - I - 0x016524 05:A514: FF        .byte $FF   ; 
- D 1 - I - 0x016525 05:A515: FF        .byte $FF   ; 
- D 1 - I - 0x016526 05:A516: A8        .byte $A8   ; 
- D 1 - I - 0x016527 05:A517: D0        .byte $D0   ; 
- D 1 - I - 0x016528 05:A518: B2        .byte $B2   ; 
- D 1 - I - 0x016529 05:A519: C9        .byte $C9   ; 
- D 1 - I - 0x01652A 05:A51A: AD        .byte $AD   ; 
- D 1 - I - 0x01652B 05:A51B: D2        .byte $D2   ; 
- D 1 - I - 0x01652C 05:A51C: D9        .byte $D9   ; 
- D 1 - I - 0x01652D 05:A51D: B5        .byte $B5   ; 
- D 1 - I - 0x01652E 05:A51E: FF        .byte $FF   ; 
- D 1 - I - 0x01652F 05:A51F: FF        .byte $FF   ; 
- D 1 - I - 0x016530 05:A520: FF        .byte $FF   ; 
- D 1 - I - 0x016531 05:A521: FF        .byte $FF   ; 
- D 1 - I - 0x016532 05:A522: 27        .byte $27   ; 
- D 1 - I - 0x016533 05:A523: C9        .byte $C9   ; 
- D 1 - I - 0x016534 05:A524: 3E        .byte $3E   ; 
- D 1 - I - 0x016535 05:A525: CF        .byte $CF   ; 
- D 1 - I - 0x016536 05:A526: AD        .byte $AD   ; 
- D 1 - I - 0x016537 05:A527: D2        .byte $D2   ; 
- D 1 - I - 0x016538 05:A528: D9        .byte $D9   ; 
- D 1 - I - 0x016539 05:A529: B5        .byte $B5   ; 
- D 1 - I - 0x01653A 05:A52A: FF        .byte $FF   ; 
- D 1 - I - 0x01653B 05:A52B: FF        .byte $FF   ; 
- D 1 - I - 0x01653C 05:A52C: FF        .byte $FF   ; 
- D 1 - I - 0x01653D 05:A52D: FF        .byte $FF   ; 
- D 1 - I - 0x01653E 05:A52E: B5        .byte $B5   ; 
- D 1 - I - 0x01653F 05:A52F: AC        .byte $AC   ; 
- D 1 - I - 0x016540 05:A530: 27        .byte $27   ; 
- D 1 - I - 0x016541 05:A531: B3        .byte $B3   ; 
- D 1 - I - 0x016542 05:A532: CE        .byte $CE   ; 
- D 1 - I - 0x016543 05:A533: AD        .byte $AD   ; 
- D 1 - I - 0x016544 05:A534: D2        .byte $D2   ; 
- D 1 - I - 0x016545 05:A535: D9        .byte $D9   ; 
- D 1 - I - 0x016546 05:A536: B5        .byte $B5   ; 
- D 1 - I - 0x016547 05:A537: FF        .byte $FF   ; 
- D 1 - I - 0x016548 05:A538: FF        .byte $FF   ; 
- D 1 - I - 0x016549 05:A539: FF        .byte $FF   ; 
- D 1 - I - 0x01654A 05:A53A: B7        .byte $B7   ; 
- D 1 - I - 0x01654B 05:A53B: CF        .byte $CF   ; 
- D 1 - I - 0x01654C 05:A53C: 2D        .byte $2D   ; 
- D 1 - I - 0x01654D 05:A53D: D1        .byte $D1   ; 
- D 1 - I - 0x01654E 05:A53E: AD        .byte $AD   ; 
- D 1 - I - 0x01654F 05:A53F: D2        .byte $D2   ; 
- D 1 - I - 0x016550 05:A540: D9        .byte $D9   ; 
- D 1 - I - 0x016551 05:A541: B5        .byte $B5   ; 
- D 1 - I - 0x016552 05:A542: FF        .byte $FF   ; 
- D 1 - I - 0x016553 05:A543: FF        .byte $FF   ; 
- D 1 - I - 0x016554 05:A544: FF        .byte $FF   ; 
- D 1 - I - 0x016555 05:A545: FF        .byte $FF   ; 
- D 1 - I - 0x016556 05:A546: B6        .byte $B6   ; 
- D 1 - I - 0x016557 05:A547: D0        .byte $D0   ; 
- D 1 - I - 0x016558 05:A548: B3        .byte $B3   ; 
- D 1 - I - 0x016559 05:A549: AD        .byte $AD   ; 
- D 1 - I - 0x01655A 05:A54A: D2        .byte $D2   ; 
- D 1 - I - 0x01655B 05:A54B: D9        .byte $D9   ; 
- D 1 - I - 0x01655C 05:A54C: B5        .byte $B5   ; 
- D 1 - I - 0x01655D 05:A54D: FF        .byte $FF   ; 
- D 1 - I - 0x01655E 05:A54E: FF        .byte $FF   ; 
- D 1 - I - 0x01655F 05:A54F: FF        .byte $FF   ; 
- D 1 - I - 0x016560 05:A550: FF        .byte $FF   ; 
- D 1 - I - 0x016561 05:A551: FF        .byte $FF   ; 
- D 1 - I - 0x016562 05:A552: A4        .byte $A4   ; 
- D 1 - I - 0x016563 05:A553: D5        .byte $D5   ; 
- D 1 - I - 0x016564 05:A554: C9        .byte $C9   ; 
- D 1 - I - 0x016565 05:A555: D9        .byte $D9   ; 
- D 1 - I - 0x016566 05:A556: AD        .byte $AD   ; 
- D 1 - I - 0x016567 05:A557: D2        .byte $D2   ; 
- D 1 - I - 0x016568 05:A558: D9        .byte $D9   ; 
- D 1 - I - 0x016569 05:A559: B5        .byte $B5   ; 
- D 1 - I - 0x01656A 05:A55A: FF        .byte $FF   ; 
- D 1 - I - 0x01656B 05:A55B: FF        .byte $FF   ; 
- D 1 - I - 0x01656C 05:A55C: FF        .byte $FF   ; 
- D 1 - I - 0x01656D 05:A55D: FF        .byte $FF   ; 
- D 1 - I - 0x01656E 05:A55E: 3B        .byte $3B   ; 
- D 1 - I - 0x01656F 05:A55F: B6        .byte $B6   ; 
- D 1 - I - 0x016570 05:A560: B6        .byte $B6   ; 
- D 1 - I - 0x016571 05:A561: CD        .byte $CD   ; 
- D 1 - I - 0x016572 05:A562: B7        .byte $B7   ; 
- D 1 - I - 0x016573 05:A563: AD        .byte $AD   ; 
- D 1 - I - 0x016574 05:A564: D2        .byte $D2   ; 
- D 1 - I - 0x016575 05:A565: D9        .byte $D9   ; 
- D 1 - I - 0x016576 05:A566: B5        .byte $B5   ; 
- D 1 - I - 0x016577 05:A567: FF        .byte $FF   ; 
- D 1 - I - 0x016578 05:A568: FF        .byte $FF   ; 
- D 1 - I - 0x016579 05:A569: FF        .byte $FF   ; 
- D 1 - I - 0x01657A 05:A56A: A6        .byte $A6   ; 
- D 1 - I - 0x01657B 05:A56B: C3        .byte $C3   ; 
- D 1 - I - 0x01657C 05:A56C: 27        .byte $27   ; 
- D 1 - I - 0x01657D 05:A56D: 35        .byte $35   ; 
- D 1 - I - 0x01657E 05:A56E: C8        .byte $C8   ; 
- D 1 - I - 0x01657F 05:A56F: A3        .byte $A3   ; 
- D 1 - I - 0x016580 05:A570: 3D        .byte $3D   ; 
- D 1 - I - 0x016581 05:A571: AD        .byte $AD   ; 
- D 1 - I - 0x016582 05:A572: D2        .byte $D2   ; 
- D 1 - I - 0x016583 05:A573: D9        .byte $D9   ; 
- D 1 - I - 0x016584 05:A574: B5        .byte $B5   ; 
- D 1 - I - 0x016585 05:A575: FF        .byte $FF   ; 



sub_A576_экран_выбора_музыки:
C - - - - - 0x016586 05:A576: A5 59     LDA ram_subscript
C - - - - - 0x016588 05:A578: 30 06     BMI bra_A580
C - - - - - 0x01658A 05:A57A: 20 DF 80  JSR sub_80DF
C - - - - - 0x01658D 05:A57D: 20 8D A5  JSR sub_A58D
bra_A580:
C - - - - - 0x016590 05:A580: 20 70 A6  JSR sub_A670
C - - - - - 0x016593 05:A583: AD C9 05  LDA ram_счетчик_опций
C - - - - - 0x016596 05:A586: 20 53 C0  JSR sub_0x01EC9F_jump_to_pointers_after_JSR
- D 1 - I - 0x016599 05:A589: D0 A5     .word ofs_A5D0_00_экран_выбора_музыки_рисуется
- D 1 - I - 0x01659B 05:A58B: DE A5     .word ofs_A5DE_01_экран_выбора_музыки_отрисован



sub_A58D:
C - - - - - 0x01659D 05:A58D: A9 FF     LDA #$FF
C - - - - - 0x01659F 05:A58F: 8D CA 05  STA ram_номер_опции
C - - - - - 0x0165A2 05:A592: A9 07     LDA #$07
C - - - - - 0x0165A4 05:A594: 8D 61 00  STA ram_0061
C - - - - - 0x0165A7 05:A597: 8D 59 04  STA ram_movement_id_player
C - - - - - 0x0165AA 05:A59A: A9 05     LDA #$05
C - - - - - 0x0165AC 05:A59C: 8D 63 00  STA ram_0063
C - - - - - 0x0165AF 05:A59F: A9 00     LDA #$00
C - - - - - 0x0165B1 05:A5A1: 8D 5C 05  STA ram_лицо_игрока
C - - - - - 0x0165B4 05:A5A4: A9 01     LDA #$01
C - - - - - 0x0165B6 05:A5A6: 8D AE 05  STA ram_palette_id_spr
C - - - - - 0x0165B9 05:A5A9: 8D AF 05  STA ram_palette_id_spr + 1
C - - - - - 0x0165BC 05:A5AC: A2 34     LDX #$34
C - - - - - 0x0165BE 05:A5AE: 8E B8 05  STX ram_банк_спрайтов
C - - - - - 0x0165C1 05:A5B1: E8        INX
C - - - - - 0x0165C2 05:A5B2: 8E B9 05  STX ram_банк_спрайтов + 1
C - - - - - 0x0165C5 05:A5B5: E8        INX
C - - - - - 0x0165C6 05:A5B6: 8E BA 05  STX ram_банк_спрайтов + 2
C - - - - - 0x0165C9 05:A5B9: E8        INX
C - - - - - 0x0165CA 05:A5BA: 8E BB 05  STX ram_банк_спрайтов + 3
C - - - - - 0x0165CD 05:A5BD: 20 0B C0  JSR sub_0x01EEAA_базовые_банки_спрайтов
C - - - - - 0x0165D0 05:A5C0: A9 28     LDA #$28
C - - - - - 0x0165D2 05:A5C2: 8D 14 03  STA ram_pos_X_lo_player
C - - - - - 0x0165D5 05:A5C5: A9 B8     LDA #$B8
C - - - - - 0x0165D7 05:A5C7: 8D 4D 03  STA ram_pos_Y_lo_player
C - - - - - 0x0165DA 05:A5CA: A9 00     LDA #con_music_off
C - - - - - 0x0165DC 05:A5CC: 20 02 C0  JSR sub_0x01C2F4_play_sound
C - - - - - 0x0165DF 05:A5CF: 60        RTS



ofs_A5D0_00_экран_выбора_музыки_рисуется:
C - - J - - 0x0165E0 05:A5D0: AD B2 05  LDA ram_flag_brightness
C - - - - - 0x0165E3 05:A5D3: 10 03     BPL bra_A5D8
C - - - - - 0x0165E5 05:A5D5: EE C9 05  INC ram_счетчик_опций
bra_A5D8:
C - - - - - 0x0165E8 05:A5D8: 20 5C C0  JSR sub_0x01D083
C - - - - - 0x0165EB 05:A5DB: 4C 57 A6  JMP loc_A657



ofs_A5DE_01_экран_выбора_музыки_отрисован:
C - - J - - 0x0165EE 05:A5DE: AD CA 05  LDA ram_номер_опции
C - - - - - 0x0165F1 05:A5E1: C9 08     CMP #$08
C - - - - - 0x0165F3 05:A5E3: D0 06     BNE bra_A5EB_скрытое_меню_не_включено
- - - - - - 0x0165F5 05:A5E5: 20 E1 A6  JSR sub_A6E1
- - - - - - 0x0165F8 05:A5E8: 4C 57 A6  JMP loc_A657
bra_A5EB_скрытое_меню_не_включено:
C - - - - - 0x0165FB 05:A5EB: A5 08     LDA ram_btn_press
C - - - - - 0x0165FD 05:A5ED: 29 20     AND #con_btn_Select
C - - - - - 0x0165FF 05:A5EF: F0 17     BEQ bra_A608
- - - - - - 0x016601 05:A5F1: AD CA 05  LDA ram_номер_опции
- - - - - - 0x016604 05:A5F4: C9 05     CMP #$05
- - - - - - 0x016606 05:A5F6: D0 10     BNE bra_A608
- - - - - - 0x016608 05:A5F8: A5 04     LDA ram_btn_hold
- - - - - - 0x01660A 05:A5FA: 29 02     AND #con_btn_Left
- - - - - - 0x01660C 05:A5FC: F0 0A     BEQ bra_A608
- - - - - - 0x01660E 05:A5FE: A9 08     LDA #$08
- - - - - - 0x016610 05:A600: 8D CA 05  STA ram_номер_опции
- - - - - - 0x016613 05:A603: A9 00     LDA #$00
- - - - - - 0x016615 05:A605: 8D CB 05  STA ram_номер_опции + 1
bra_A608:
C - - - - - 0x016618 05:A608: AD CA 05  LDA ram_номер_опции
C - - - - - 0x01661B 05:A60B: 10 0E     BPL bra_A61B
C - - - - - 0x01661D 05:A60D: A9 07     LDA #$07
C - - - - - 0x01661F 05:A60F: 8D CA 05  STA ram_номер_опции
C - - - - - 0x016622 05:A612: 20 B1 A6  JSR sub_A6B1
C - - - - - 0x016625 05:A615: AD 5A 05  LDA ram_music_id
C - - - - - 0x016628 05:A618: 20 02 C0  JSR sub_0x01C2F4_play_sound
bra_A61B:
C - - - - - 0x01662B 05:A61B: A2 02     LDX #$02
C - - - - - 0x01662D 05:A61D: 20 7E 81  JSR sub_817E_конвертация_нажатых_кнопок_в_индекс
C - - - - - 0x016630 05:A620: 20 53 C0  JSR sub_0x01EC9F_jump_to_pointers_after_JSR
- D 1 - I - 0x016633 05:A623: 57 A6     .word ofs_A657_00_nothing
- D 1 - I - 0x016635 05:A625: 35 A6     .word ofs_A635_01_Start
- - - - - - 0x016637 05:A627: 57 A6     .word ofs_A657_02_Select
- D 1 - I - 0x016639 05:A629: 35 A6     .word ofs_A635_03_A
- D 1 - I - 0x01663B 05:A62B: 43 A6     .word ofs_A643_04_B
- D 1 - I - 0x01663D 05:A62D: 4B A6     .word ofs_A64B_05_Up
- D 1 - I - 0x01663F 05:A62F: 4B A6     .word ofs_A64B_06_Down
- D 1 - I - 0x016641 05:A631: 57 A6     .word ofs_A657_07_Left
- D 1 - I - 0x016643 05:A633: 57 A6     .word ofs_A657_08_Right



ofs_A635_01_Start:
ofs_A635_03_A:
C - - J - - 0x016645 05:A635: A9 33     LDA #con_sfx_yes
C - - - - - 0x016647 05:A637: 20 02 C0  JSR sub_0x01C2F4_play_sound
C - - - - - 0x01664A 05:A63A: 20 B1 A6  JSR sub_A6B1
C - - - - - 0x01664D 05:A63D: 20 D6 A6  JSR sub_A6D6
C - - - - - 0x016650 05:A640: 4C 6F A6  RTS



ofs_A643_04_B:
C - - J - - 0x016653 05:A643: A9 34     LDA #con_sfx_no
C - - - - - 0x016655 05:A645: 20 02 C0  JSR sub_0x01C2F4_play_sound
C - - - - - 0x016658 05:A648: 4C 57 A6  JMP loc_A657



ofs_A64B_05_Up:
ofs_A64B_06_Down:
C - - J - - 0x01665B 05:A64B: 20 DD 81  JSR sub_81DD
C - - - - - 0x01665E 05:A64E: 20 B1 A6  JSR sub_A6B1
C - - - - - 0x016661 05:A651: AD 5A 05  LDA ram_music_id
C - - - - - 0x016664 05:A654: 20 02 C0  JSR sub_0x01C2F4_play_sound
loc_A657:
ofs_A657_00_nothing:
ofs_A657_02_Select:
ofs_A657_07_Left:
ofs_A657_08_Right:
C D 1 - - - 0x016667 05:A657: A2 02     LDX #$02
C - - - - - 0x016669 05:A659: 20 2A 82  JSR sub_822A
C - - - - - 0x01666C 05:A65C: A9 00     LDA #$00
C - - - - - 0x01666E 05:A65E: 20 8D 82  JSR sub_828D
C - - - - - 0x016671 05:A661: 20 65 C0  JSR sub_0x01EB9C
C - - - - - 0x016674 05:A664: A2 00     LDX #$00
C - - - - - 0x016676 05:A666: 20 94 91  JSR sub_9194
C - - - - - 0x016679 05:A669: 20 65 C0  JSR sub_0x01EB9C
C - - - - - 0x01667C 05:A66C: 20 14 80  JSR sub_0x01C2AE
C D 1 - - - 0x01667F 05:A66F: 60        RTS



sub_A670:
C - - - - - 0x016680 05:A670: 20 05 82  JSR sub_8205_read_pointers_after_JSR
- D 1 - I - 0x016683 05:A673: 9F A6     .word off_A69F_00
- D 1 - I - 0x016685 05:A675: 7B A6     .word off_A67B_01
- D 1 - I - 0x016687 05:A677: 9F A6     .word off_A69F_02
- D 1 - I - 0x016689 05:A679: 7B A6     .word off_A67B_03

off_A67B_01:
off_A67B_03:
- D 1 - I - 0x01668B 05:A67B: 07        .byte $07   ; 
- D 1 - I - 0x01668C 05:A67C: 01        .byte $01   ; 
- - - - - - 0x01668D 05:A67D: 00        .byte $00   ; 
- - - - - - 0x01668E 05:A67E: 00        .byte $00   ; 
- D 1 - I - 0x01668F 05:A67F: 00        .byte $00   ; 
- D 1 - I - 0x016690 05:A680: 02        .byte $02   ; 
- - - - - - 0x016691 05:A681: 01        .byte $01   ; 
- - - - - - 0x016692 05:A682: 01        .byte $01   ; 
- D 1 - I - 0x016693 05:A683: 01        .byte $01   ; 
- D 1 - I - 0x016694 05:A684: 03        .byte $03   ; 
- - - - - - 0x016695 05:A685: 02        .byte $02   ; 
- - - - - - 0x016696 05:A686: 02        .byte $02   ; 
- D 1 - I - 0x016697 05:A687: 02        .byte $02   ; 
- D 1 - I - 0x016698 05:A688: 04        .byte $04   ; 
- - - - - - 0x016699 05:A689: 03        .byte $03   ; 
- - - - - - 0x01669A 05:A68A: 03        .byte $03   ; 
- D 1 - I - 0x01669B 05:A68B: 03        .byte $03   ; 
- D 1 - I - 0x01669C 05:A68C: 05        .byte $05   ; 
- - - - - - 0x01669D 05:A68D: 04        .byte $04   ; 
- - - - - - 0x01669E 05:A68E: 04        .byte $04   ; 
- D 1 - I - 0x01669F 05:A68F: 04        .byte $04   ; 
- D 1 - I - 0x0166A0 05:A690: 06        .byte $06   ; 
- - - - - - 0x0166A1 05:A691: 05        .byte $05   ; 
- - - - - - 0x0166A2 05:A692: 05        .byte $05   ; 
- D 1 - I - 0x0166A3 05:A693: 05        .byte $05   ; 
- D 1 - I - 0x0166A4 05:A694: 07        .byte $07   ; 
- - - - - - 0x0166A5 05:A695: 06        .byte $06   ; 
- - - - - - 0x0166A6 05:A696: 06        .byte $06   ; 
- D 1 - I - 0x0166A7 05:A697: 06        .byte $06   ; 
- D 1 - I - 0x0166A8 05:A698: 00        .byte $00   ; 
- - - - - - 0x0166A9 05:A699: 07        .byte $07   ; 
- - - - - - 0x0166AA 05:A69A: 07        .byte $07   ; 
- - - - - - 0x0166AB 05:A69B: 08        .byte $08   ; 
- - - - - - 0x0166AC 05:A69C: 08        .byte $08   ; 
- - - - - - 0x0166AD 05:A69D: 08        .byte $08   ; 
- - - - - - 0x0166AE 05:A69E: 08        .byte $08   ; 



off_A69F_00:
off_A69F_02:
- D 1 - I - 0x0166AF 05:A69F: 09        .byte $09   ; 
- D 1 - I - 0x0166B0 05:A6A0: 06        .byte $06   ; 
- D 1 - I - 0x0166B1 05:A6A1: 09        .byte $09   ; 
- D 1 - I - 0x0166B2 05:A6A2: 09        .byte $09   ; 
- D 1 - I - 0x0166B3 05:A6A3: 09        .byte $09   ; 
- D 1 - I - 0x0166B4 05:A6A4: 0C        .byte $0C   ; 
- D 1 - I - 0x0166B5 05:A6A5: 09        .byte $09   ; 
- D 1 - I - 0x0166B6 05:A6A6: 0F        .byte $0F   ; 
- D 1 - I - 0x0166B7 05:A6A7: 09        .byte $09   ; 
- D 1 - I - 0x0166B8 05:A6A8: 12        .byte $12   ; 
- D 1 - I - 0x0166B9 05:A6A9: 09        .byte $09   ; 
- D 1 - I - 0x0166BA 05:A6AA: 15        .byte $15   ; 
- D 1 - I - 0x0166BB 05:A6AB: 09        .byte $09   ; 
- D 1 - I - 0x0166BC 05:A6AC: 18        .byte $18   ; 
- D 1 - I - 0x0166BD 05:A6AD: 09        .byte $09   ; 
- D 1 - I - 0x0166BE 05:A6AE: 1B        .byte $1B   ; 
- - - - - - 0x0166BF 05:A6AF: 04        .byte $04   ; 
- - - - - - 0x0166C0 05:A6B0: 07        .byte $07   ; 



sub_A6B1:
C - - - - - 0x0166C1 05:A6B1: AD CA 05  LDA ram_номер_опции
C - - - - - 0x0166C4 05:A6B4: 29 07     AND #$07
C - - - - - 0x0166C6 05:A6B6: A8        TAY
C - - - - - 0x0166C7 05:A6B7: B9 C9 A6  LDA tbl_A6C9,Y
C - - - - - 0x0166CA 05:A6BA: 10 09     BPL bra_A6C5
C - - - - - 0x0166CC 05:A6BC: AD 29 05  LDA ram_опция_материк
C - - - - - 0x0166CF 05:A6BF: 29 03     AND #$03
C - - - - - 0x0166D1 05:A6C1: A8        TAY
C - - - - - 0x0166D2 05:A6C2: B9 D1 A6  LDA tbl_A6D1,Y
bra_A6C5:
C - - - - - 0x0166D5 05:A6C5: 8D 5A 05  STA ram_music_id
C - - - - - 0x0166D8 05:A6C8: 60        RTS



tbl_A6C9:
- D 1 - - - 0x0166D9 05:A6C9: 04        .byte $04   ; 
- D 1 - - - 0x0166DA 05:A6CA: 06        .byte $06   ; 
- D 1 - - - 0x0166DB 05:A6CB: 03        .byte $03   ; 
- D 1 - - - 0x0166DC 05:A6CC: 05        .byte $05   ; 
- D 1 - - - 0x0166DD 05:A6CD: 0D        .byte $0D   ; 
- D 1 - - - 0x0166DE 05:A6CE: 01        .byte $01   ; 
- D 1 - - - 0x0166DF 05:A6CF: 07        .byte $07   ; 
- D 1 - - - 0x0166E0 05:A6D0: FF        .byte $FF   ; 



tbl_A6D1:
- D 1 - - - 0x0166E1 05:A6D1: 07        .byte $07   ; 
- D 1 - - - 0x0166E2 05:A6D2: 03        .byte $03   ; 
- D 1 - - - 0x0166E3 05:A6D3: 0D        .byte $0D   ; 
- D 1 - - - 0x0166E4 05:A6D4: 05        .byte $05   ; 
- - - - - - 0x0166E5 05:A6D5: 06        .byte $06   ; 



sub_A6D6:
C - - - - - 0x0166E6 05:A6D6: 20 44 C0  JSR sub_0x01D057
C - - - - - 0x0166E9 05:A6D9: 20 4A C0  JSR sub_0x01D072
C - - - - - 0x0166EC 05:A6DC: A9 04     LDA #$04
C - - - - - 0x0166EE 05:A6DE: 85 59     STA ram_subscript
C - - - - - 0x0166F0 05:A6E0: 60        RTS



sub_A6E1:
- - - - - - 0x0166F1 05:A6E1: A5 08     LDA ram_btn_press
- - - - - - 0x0166F3 05:A6E3: 4A        LSR
- - - - - - 0x0166F4 05:A6E4: B0 55     BCS bra_A73B
- - - - - - 0x0166F6 05:A6E6: 4A        LSR
- - - - - - 0x0166F7 05:A6E7: B0 5F     BCS bra_A748
- - - - - - 0x0166F9 05:A6E9: 4A        LSR
- - - - - - 0x0166FA 05:A6EA: B0 65     BCS bra_A751
- - - - - - 0x0166FC 05:A6EC: 4A        LSR
- - - - - - 0x0166FD 05:A6ED: B0 6F     BCS bra_A75E
- - - - - - 0x0166FF 05:A6EF: A5 08     LDA ram_btn_press
- - - - - - 0x016701 05:A6F1: 30 74     BMI bra_A767
- - - - - - 0x016703 05:A6F3: 0A        ASL
- - - - - - 0x016704 05:A6F4: 30 7A     BMI bra_A770
- - - - - - 0x016706 05:A6F6: 0A        ASL
- - - - - - 0x016707 05:A6F7: 30 03     BMI bra_A6FC
- - - - - - 0x016709 05:A6F9: 0A        ASL
- - - - - - 0x01670A 05:A6FA: 10 19     BPL bra_A715
bra_A6FC:
- - - - - - 0x01670C 05:A6FC: A9 02     LDA #$02
- - - - - - 0x01670E 05:A6FE: 8D B9 06  STA ram_буфер_графики
- - - - - - 0x016711 05:A701: 8D BA 06  STA ram_буфер_графики + 1
- - - - - - 0x016714 05:A704: A9 FF     LDA #$FF
- - - - - - 0x016716 05:A706: 8D CA 05  STA ram_номер_опции
- - - - - - 0x016719 05:A709: 4C 2B A7  JMP loc_A72B
bra_A70C:
loc_A70C:
- - - - - - 0x01671C 05:A70C: C9 50     CMP #$50
- - - - - - 0x01671E 05:A70E: 90 02     BCC bra_A712
- - - - - - 0x016720 05:A710: A9 50     LDA #$50
bra_A712:
- - - - - - 0x016722 05:A712: 8D CB 05  STA ram_номер_опции + 1
bra_A715:
- - - - - - 0x016725 05:A715: AD CB 05  LDA ram_номер_опции + 1
- - - - - - 0x016728 05:A718: 29 0F     AND #$0F
- - - - - - 0x01672A 05:A71A: 09 80     ORA #$80
- - - - - - 0x01672C 05:A71C: 8D BA 06  STA ram_буфер_графики + 1
- - - - - - 0x01672F 05:A71F: AD CB 05  LDA ram_номер_опции + 1
- - - - - - 0x016732 05:A722: 4A        LSR
- - - - - - 0x016733 05:A723: 4A        LSR
- - - - - - 0x016734 05:A724: 4A        LSR
- - - - - - 0x016735 05:A725: 4A        LSR
- - - - - - 0x016736 05:A726: 09 80     ORA #$80
- - - - - - 0x016738 05:A728: 8D B9 06  STA ram_буфер_графики
loc_A72B:
- - - - - - 0x01673B 05:A72B: A9 02     LDA #$02
- - - - - - 0x01673D 05:A72D: 8D B8 06  STA ram_счетчик_буфера_графики
- - - - - - 0x016740 05:A730: A9 E5     LDA #< $20E5
- - - - - - 0x016742 05:A732: 8D B7 06  STA ram_байт_2006_lo_графика
- - - - - - 0x016745 05:A735: A9 20     LDA #> $20E5
- - - - - - 0x016747 05:A737: 8D B6 06  STA ram_байт_2006_hi_графика
- - - - - - 0x01674A 05:A73A: 60        RTS
bra_A73B:
- - - - - - 0x01674B 05:A73B: 38        SEC
- - - - - - 0x01674C 05:A73C: AD CB 05  LDA ram_номер_опции + 1
- - - - - - 0x01674F 05:A73F: E9 10     SBC #$10
- - - - - - 0x016751 05:A741: B0 C9     BCS bra_A70C
- - - - - - 0x016753 05:A743: A9 00     LDA #$00
- - - - - - 0x016755 05:A745: 4C 0C A7  JMP loc_A70C
bra_A748:
- - - - - - 0x016758 05:A748: 18        CLC
- - - - - - 0x016759 05:A749: AD CB 05  LDA ram_номер_опции + 1
- - - - - - 0x01675C 05:A74C: 69 10     ADC #$10
- - - - - - 0x01675E 05:A74E: 4C 0C A7  JMP loc_A70C
bra_A751:
- - - - - - 0x016761 05:A751: 38        SEC
- - - - - - 0x016762 05:A752: AD CB 05  LDA ram_номер_опции + 1
- - - - - - 0x016765 05:A755: E9 01     SBC #$01
- - - - - - 0x016767 05:A757: B0 B3     BCS bra_A70C
- - - - - - 0x016769 05:A759: A9 00     LDA #$00
- - - - - - 0x01676B 05:A75B: 4C 0C A7  JMP loc_A70C
bra_A75E:
- - - - - - 0x01676E 05:A75E: 18        CLC
- - - - - - 0x01676F 05:A75F: AD CB 05  LDA ram_номер_опции + 1
- - - - - - 0x016772 05:A762: 69 01     ADC #$01
- - - - - - 0x016774 05:A764: 4C 0C A7  JMP loc_A70C
bra_A767:
- - - - - - 0x016777 05:A767: AD CB 05  LDA ram_номер_опции + 1
- - - - - - 0x01677A 05:A76A: 20 02 C0  JSR sub_0x01C2F4_play_sound
- - - - - - 0x01677D 05:A76D: 4C 3A A7  RTS
bra_A770:
- - - - - - 0x016780 05:A770: A9 00     LDA #con_music_off
- - - - - - 0x016782 05:A772: 20 02 C0  JSR sub_0x01C2F4_play_sound
- - - - - - 0x016785 05:A775: 4C 3A A7  RTS



sub_A778:
C - - - - - 0x016788 05:A778: A5 59     LDA ram_subscript
C - - - - - 0x01678A 05:A77A: 30 09     BMI bra_A785
C - - - - - 0x01678C 05:A77C: 20 DF 80  JSR sub_80DF
C - - - - - 0x01678F 05:A77F: 20 A4 A7  JSR sub_A7A4
C - - - - - 0x016792 05:A782: 20 87 AC  JSR sub_AC87
bra_A785:
C - - - - - 0x016795 05:A785: 20 EE AB  JSR sub_ABEE
C - - - - - 0x016798 05:A788: AD C9 05  LDA ram_счетчик_опций
C - - - - - 0x01679B 05:A78B: 20 53 C0  JSR sub_0x01EC9F_jump_to_pointers_after_JSR
- D 1 - I - 0x01679E 05:A78E: 4E A8     .word ofs_A84E_00
- D 1 - I - 0x0167A0 05:A790: 61 A8     .word ofs_A861_01
- D 1 - I - 0x0167A2 05:A792: ED A8     .word ofs_A8ED_02
- D 1 - I - 0x0167A4 05:A794: 9B A9     .word ofs_A99B_03
- D 1 - I - 0x0167A6 05:A796: CF A9     .word ofs_A9CF_04
- D 1 - I - 0x0167A8 05:A798: 5B AA     .word ofs_AA5B_05
- D 1 - I - 0x0167AA 05:A79A: 93 AA     .word ofs_AA93_06
- D 1 - I - 0x0167AC 05:A79C: 42 AB     .word ofs_AB42_07
- D 1 - I - 0x0167AE 05:A79E: 1B AB     .word ofs_AB1B_08
- D 1 - I - 0x0167B0 05:A7A0: 90 AB     .word ofs_AB90_09
- D 1 - I - 0x0167B2 05:A7A2: CA AB     .word ofs_ABCA_0A



sub_A7A4:
C - - - - - 0x0167B4 05:A7A4: AD 58 05  LDA ram_0558
C - - - - - 0x0167B7 05:A7A7: 4A        LSR
C - - - - - 0x0167B8 05:A7A8: 4A        LSR
C - - - - - 0x0167B9 05:A7A9: 85 1C     STA ram_001C
C - - - - - 0x0167BB 05:A7AB: 38        SEC
C - - - - - 0x0167BC 05:A7AC: A9 04     LDA #$04
C - - - - - 0x0167BE 05:A7AE: E5 1C     SBC ram_001C
C - - - - - 0x0167C0 05:A7B0: B0 02     BCS bra_A7B4
- - - - - - 0x0167C2 05:A7B2: A9 00     LDA #$00
bra_A7B4:
C - - - - - 0x0167C4 05:A7B4: 8D E1 05  STA ram_05E1
C - - - - - 0x0167C7 05:A7B7: A9 05     LDA #$05
C - - - - - 0x0167C9 05:A7B9: 8D 61 00  STA ram_0061
C - - - - - 0x0167CC 05:A7BC: A9 01     LDA #$01
C - - - - - 0x0167CE 05:A7BE: 8D AE 05  STA ram_palette_id_spr
C - - - - - 0x0167D1 05:A7C1: 8D AF 05  STA ram_palette_id_spr + 1
C - - - - - 0x0167D4 05:A7C4: 8D B0 05  STA ram_palette_id_spr + 2
C - - - - - 0x0167D7 05:A7C7: 8D B1 05  STA ram_palette_id_spr + 3
C - - - - - 0x0167DA 05:A7CA: AD 32 05  LDA ram_player_id
C - - - - - 0x0167DD 05:A7CD: 8D 5D 05  STA ram_лицо_игрока + 1
C - - - - - 0x0167E0 05:A7D0: A2 26     LDX #$26
C - - - - - 0x0167E2 05:A7D2: 8E B8 05  STX ram_банк_спрайтов
C - - - - - 0x0167E5 05:A7D5: E8        INX
C - - - - - 0x0167E6 05:A7D6: 8E B9 05  STX ram_банк_спрайтов + 1
C - - - - - 0x0167E9 05:A7D9: A2 11     LDX #$11
C - - - - - 0x0167EB 05:A7DB: 8E BB 05  STX ram_банк_спрайтов + 3
C - - - - - 0x0167EE 05:A7DE: 20 0B C0  JSR sub_0x01EEAA_базовые_банки_спрайтов
C - - - - - 0x0167F1 05:A7E1: A2 00     LDX #$00
bra_A7E3:
C - - - - - 0x0167F3 05:A7E3: 8A        TXA
C - - - - - 0x0167F4 05:A7E4: 0A        ASL
C - - - - - 0x0167F5 05:A7E5: A8        TAY
C - - - - - 0x0167F6 05:A7E6: B9 4A A8  LDA tbl_A84A,Y
C - - - - - 0x0167F9 05:A7E9: 9D 15 03  STA ram_pos_X_lo_player + 1,X
C - - - - - 0x0167FC 05:A7EC: B9 4B A8  LDA tbl_A84B,Y
C - - - - - 0x0167FF 05:A7EF: 9D 4E 03  STA ram_pos_Y_lo_player + 1,X
C - - - - - 0x016802 05:A7F2: A9 05     LDA #$05
C - - - - - 0x016804 05:A7F4: 9D 62 00  STA ram_0062,X
C - - - - - 0x016807 05:A7F7: E8        INX
C - - - - - 0x016808 05:A7F8: E0 02     CPX #$02
C - - - - - 0x01680A 05:A7FA: 90 E7     BCC bra_A7E3
C - - - - - 0x01680C 05:A7FC: AD D1 05  LDA ram_05D1
C - - - - - 0x01680F 05:A7FF: 48        PHA
C - - - - - 0x016810 05:A800: 20 11 C0  JSR sub_0x01ECB9
C - - - - - 0x016813 05:A803: 20 17 C0  JSR sub_0x01EE81_disable_NMI
C - - - - - 0x016816 05:A806: 20 1D C0  JSR sub_0x01ECD1_скрыть_фон_и_спрайты_за_полоской_слева
C - - - - - 0x016819 05:A809: A0 00     LDY #$00
bra_A80B:
C - - - - - 0x01681B 05:A80B: 8C D1 05  STY ram_05D1
C - - - - - 0x01681E 05:A80E: 20 A8 B0  JSR sub_B0A8
C - - - - - 0x016821 05:A811: 20 6B C0  JSR sub_0x01EFBD_write_buffers_to_ppu
C - - - - - 0x016824 05:A814: AC D1 05  LDY ram_05D1
C - - - - - 0x016827 05:A817: C8        INY
C - - - - - 0x016828 05:A818: C0 0C     CPY #$0C
C - - - - - 0x01682A 05:A81A: 90 EF     BCC bra_A80B
C - - - - - 0x01682C 05:A81C: AD 32 05  LDA ram_player_id
C - - - - - 0x01682F 05:A81F: 8D CA 05  STA ram_номер_опции
C - - - - - 0x016832 05:A822: 20 19 AD  JSR sub_AD19
C - - - - - 0x016835 05:A825: 38        SEC
C - - - - - 0x016836 05:A826: AD 94 06  LDA ram_байт_2006_lo_атрибуты
C - - - - - 0x016839 05:A829: E9 0C     SBC #$0C
C - - - - - 0x01683B 05:A82B: 8D 94 06  STA ram_байт_2006_lo_атрибуты
C - - - - - 0x01683E 05:A82E: 38        SEC
C - - - - - 0x01683F 05:A82F: AD B7 06  LDA ram_байт_2006_lo_графика
C - - - - - 0x016842 05:A832: E9 0C     SBC #$0C
C - - - - - 0x016844 05:A834: 8D B7 06  STA ram_байт_2006_lo_графика
C - - - - - 0x016847 05:A837: 20 6B C0  JSR sub_0x01EFBD_write_buffers_to_ppu
C - - - - - 0x01684A 05:A83A: 20 1A C0  JSR sub_0x01ECDB_отобразить_фон_и_спрайты
C - - - - - 0x01684D 05:A83D: 20 14 C0  JSR sub_0x01EE75_enable_NMI
C - - - - - 0x016850 05:A840: 68        PLA
C - - - - - 0x016851 05:A841: 8D D1 05  STA ram_05D1
C - - - - - 0x016854 05:A844: A9 FF     LDA #$FF
C - - - - - 0x016856 05:A846: 8D CA 05  STA ram_номер_опции
C - - - - - 0x016859 05:A849: 60        RTS



tbl_A84A:
- D 1 - - - 0x01685A 05:A84A: 34        .byte $34   ; 
tbl_A84B:
- D 1 - - - 0x01685B 05:A84B: A7        .byte $A7   ; 
- D 1 - - - 0x01685C 05:A84C: 84        .byte $84   ; 
- D 1 - - - 0x01685D 05:A84D: A7        .byte $A7   ; 



ofs_A84E_00:
C - - J - - 0x01685E 05:A84E: AD B2 05  LDA ram_flag_brightness
C - - - - - 0x016861 05:A851: 10 08     BPL bra_A85B
C - - - - - 0x016863 05:A853: EE C9 05  INC ram_счетчик_опций
C - - - - - 0x016866 05:A856: A9 02     LDA #con_music_menu
C - - - - - 0x016868 05:A858: 20 02 C0  JSR sub_0x01C2F4_play_sound
bra_A85B:
C - - - - - 0x01686B 05:A85B: 20 5C C0  JSR sub_0x01D083
C - - - - - 0x01686E 05:A85E: 4C C5 A8  JMP loc_A8C5



ofs_A861_01:
C - - J - - 0x016871 05:A861: A2 00     LDX #$00
C - - - - - 0x016873 05:A863: AD CA 05  LDA ram_номер_опции
C - - - - - 0x016876 05:A866: 10 03     BPL bra_A86B
C - - - - - 0x016878 05:A868: 20 87 AC  JSR sub_AC87
bra_A86B:
C - - - - - 0x01687B 05:A86B: 20 7E 81  JSR sub_817E_конвертация_нажатых_кнопок_в_индекс
C - - - - - 0x01687E 05:A86E: 20 D3 81  JSR sub_81D3_конвертация_индексов_Dpad_в_05
C - - - - - 0x016881 05:A871: 20 53 C0  JSR sub_0x01EC9F_jump_to_pointers_after_JSR
- D 1 - I - 0x016884 05:A874: C5 A8     .word ofs_A8C5_00_nothing
- - - - - - 0x016886 05:A876: 80 A8     .word ofs_A880_01_Start
- - - - - - 0x016888 05:A878: C5 A8     .word ofs_A8C5_02_Select
- D 1 - I - 0x01688A 05:A87A: 8B A8     .word ofs_A88B_03_A
- D 1 - I - 0x01688C 05:A87C: B0 A8     .word ofs_A8B0_04_B
- D 1 - I - 0x01688E 05:A87E: BD A8     .word ofs_A8BD_05_Dpad



ofs_A880_01_Start:
- - - - - - 0x016890 05:A880: A9 33     LDA #con_sfx_yes
- - - - - - 0x016892 05:A882: 20 02 C0  JSR sub_0x01C2F4_play_sound
bra_A885:
C - - - - - 0x016895 05:A885: 20 A7 AC  JSR sub_ACA7
C - - - - - 0x016898 05:A888: 4C C5 A8  JMP loc_A8C5



ofs_A88B_03_A:
C - - J - - 0x01689B 05:A88B: A9 33     LDA #con_sfx_yes
C - - - - - 0x01689D 05:A88D: 20 02 C0  JSR sub_0x01C2F4_play_sound
C - - - - - 0x0168A0 05:A890: AD CA 05  LDA ram_номер_опции
C - - - - - 0x0168A3 05:A893: C9 04     CMP #$04
C - - - - - 0x0168A5 05:A895: F0 EE     BEQ bra_A885
C - - - - - 0x0168A7 05:A897: A9 00     LDA #$00
C - - - - - 0x0168A9 05:A899: 20 B0 82  JSR sub_82B0
C - - - - - 0x0168AC 05:A89C: 20 BD AC  JSR sub_ACBD
C - - - - - 0x0168AF 05:A89F: 18        CLC
C - - - - - 0x0168B0 05:A8A0: AD CA 05  LDA ram_номер_опции
C - - - - - 0x0168B3 05:A8A3: 69 02     ADC #$02
C - - - - - 0x0168B5 05:A8A5: 8D C9 05  STA ram_счетчик_опций
C - - - - - 0x0168B8 05:A8A8: A9 FF     LDA #$FF
C - - - - - 0x0168BA 05:A8AA: 8D CA 05  STA ram_номер_опции
C - - - - - 0x0168BD 05:A8AD: 4C C5 A8  JMP loc_A8C5



ofs_A8B0_04_B:
C - - J - - 0x0168C0 05:A8B0: A9 34     LDA #con_sfx_no
C - - - - - 0x0168C2 05:A8B2: 20 02 C0  JSR sub_0x01C2F4_play_sound
C - - - - - 0x0168C5 05:A8B5: A9 04     LDA #$04
C - - - - - 0x0168C7 05:A8B7: 8D CA 05  STA ram_номер_опции
C - - - - - 0x0168CA 05:A8BA: 4C C5 A8  JMP loc_A8C5



ofs_A8BD_05_Dpad:
C - - J - - 0x0168CD 05:A8BD: A9 32     LDA #con_sfx_move_cursor
C - - - - - 0x0168CF 05:A8BF: 20 02 C0  JSR sub_0x01C2F4_play_sound
C - - - - - 0x0168D2 05:A8C2: 20 DD 81  JSR sub_81DD
loc_A8C5:
ofs_A8C5_00_nothing:
ofs_A8C5_02_Select:
C D 1 - - - 0x0168D5 05:A8C5: A9 16     LDA #$16
C - - - - - 0x0168D7 05:A8C7: 8D 75 00  STA ram_animation_id_player + 1
C - - - - - 0x0168DA 05:A8CA: A9 7F     LDA #$7F
C - - - - - 0x0168DC 05:A8CC: 8D 76 00  STA ram_animation_id_player + 2
C - - - - - 0x0168DF 05:A8CF: A2 00     LDX #$00
C - - - - - 0x0168E1 05:A8D1: 20 2A 82  JSR sub_822A
C - - - - - 0x0168E4 05:A8D4: A9 00     LDA #$00
C - - - - - 0x0168E6 05:A8D6: 20 8D 82  JSR sub_828D
loc_A8D9:
C D 1 - - - 0x0168E9 05:A8D9: AD C9 05  LDA ram_счетчик_опций
C - - - - - 0x0168EC 05:A8DC: C9 06     CMP #$06
C - - - - - 0x0168EE 05:A8DE: D0 01     BNE bra_A8E1
C - - - - - 0x0168F0 05:A8E0: E8        INX
bra_A8E1:
C - - - - - 0x0168F1 05:A8E1: 20 65 C0  JSR sub_0x01EB9C
C - - - - - 0x0168F4 05:A8E4: E8        INX
C - - - - - 0x0168F5 05:A8E5: E0 03     CPX #$03
C - - - - - 0x0168F7 05:A8E7: 90 F8     BCC bra_A8E1
C - - - - - 0x0168F9 05:A8E9: 20 14 80  JSR sub_0x01C2AE
C D 1 - - - 0x0168FC 05:A8EC: 60        RTS



ofs_A8ED_02:
C - - J - - 0x0168FD 05:A8ED: A2 00     LDX #$00
C - - - - - 0x0168FF 05:A8EF: AD CA 05  LDA ram_номер_опции
C - - - - - 0x016902 05:A8F2: 10 06     BPL bra_A8FA
C - - - - - 0x016904 05:A8F4: 20 29 AE  JSR sub_AE29
C - - - - - 0x016907 05:A8F7: 20 19 AD  JSR sub_AD19
bra_A8FA:
C - - - - - 0x01690A 05:A8FA: 20 7E 81  JSR sub_817E_конвертация_нажатых_кнопок_в_индекс
C - - - - - 0x01690D 05:A8FD: 20 D3 81  JSR sub_81D3_конвертация_индексов_Dpad_в_05
C - - - - - 0x016910 05:A900: 20 53 C0  JSR sub_0x01EC9F_jump_to_pointers_after_JSR
- D 1 - I - 0x016913 05:A903: 7C A9     .word ofs_A97C_00_nothing
- - - - - - 0x016915 05:A905: 80 A8     .word ofs_A880_01_Start
- - - - - - 0x016917 05:A907: 7C A9     .word ofs_A97C_02_Select
- D 1 - I - 0x016919 05:A909: 0F A9     .word ofs_A90F_03_A
- D 1 - I - 0x01691B 05:A90B: 64 A9     .word ofs_A964_04_B
- D 1 - I - 0x01691D 05:A90D: 6F A9     .word ofs_A96F_05_Dpad



ofs_A90F_03_A:
C - - J - - 0x01691F 05:A90F: AC D1 05  LDY ram_05D1
C - - - - - 0x016922 05:A912: 20 77 B0  JSR sub_B077
C - - - - - 0x016925 05:A915: 20 A8 B0  JSR sub_B0A8
C - - - - - 0x016928 05:A918: AD 32 05  LDA ram_player_id
C - - - - - 0x01692B 05:A91B: 20 33 B2  JSR sub_B233
C - - - - - 0x01692E 05:A91E: AD 00 03  LDA ram_frame_cnt
C - - - - - 0x016931 05:A921: 29 03     AND #$03
C - - - - - 0x016933 05:A923: A8        TAY
C - - - - - 0x016934 05:A924: B9 3C A9  LDA tbl_A93C,Y
C - - - - - 0x016937 05:A927: 8D 06 06  STA ram_0606
C - - - - - 0x01693A 05:A92A: A9 07     LDA #$07
C - - - - - 0x01693C 05:A92C: 8D C9 05  STA ram_счетчик_опций
loc_A92F:
C D 1 - - - 0x01693F 05:A92F: A9 FF     LDA #$FF
C - - - - - 0x016941 05:A931: 8D CA 05  STA ram_номер_опции
C - - - - - 0x016944 05:A934: A9 33     LDA #con_sfx_yes
C - - - - - 0x016946 05:A936: 20 02 C0  JSR sub_0x01C2F4_play_sound
C - - - - - 0x016949 05:A939: 4C 7C A9  JMP loc_A97C

tbl_A93C:
- D 1 - - - 0x01694C 05:A93C: 0D        .byte $0D   ; 
- D 1 - - - 0x01694D 05:A93D: 0D        .byte $0D   ; 
- D 1 - - - 0x01694E 05:A93E: 0E        .byte $0E   ; 
- D 1 - - - 0x01694F 05:A93F: 0F        .byte $0F   ; 



loc_A940:
C D 1 - - - 0x016950 05:A940: A9 33     LDA #con_sfx_yes
C - - - - - 0x016952 05:A942: 20 02 C0  JSR sub_0x01C2F4_play_sound
C - - - - - 0x016955 05:A945: 20 30 AE  JSR sub_AE30
loc_A948:
C D 1 - - - 0x016958 05:A948: AC C9 05  LDY ram_счетчик_опций
C - - - - - 0x01695B 05:A94B: B9 59 A9  LDA tbl_A959,Y
C - - - - - 0x01695E 05:A94E: 8D CA 05  STA ram_номер_опции
C - - - - - 0x016961 05:A951: A9 01     LDA #$01
C - - - - - 0x016963 05:A953: 8D C9 05  STA ram_счетчик_опций
C - - - - - 0x016966 05:A956: 4C C5 A8  JMP loc_A8C5

tbl_A959:
- - - - - - 0x016969 05:A959: FF        .byte $FF   ; 
- - - - - - 0x01696A 05:A95A: FF        .byte $FF   ; 
- D 1 - - - 0x01696B 05:A95B: C0        .byte $C0   ; 
- - - - - - 0x01696C 05:A95C: C1        .byte $C1   ; 
- - - - - - 0x01696D 05:A95D: C2        .byte $C2   ; 
- D 1 - - - 0x01696E 05:A95E: C3        .byte $C3   ; 
- - - - - - 0x01696F 05:A95F: C1        .byte $C1   ; 
- D 1 - - - 0x016970 05:A960: C0        .byte $C0   ; 
- D 1 - - - 0x016971 05:A961: C1        .byte $C1   ; 
- - - - - - 0x016972 05:A962: C2        .byte $C2   ; 
- D 1 - - - 0x016973 05:A963: C2        .byte $C2   ; 



ofs_A964_04_B:
C - - J - - 0x016974 05:A964: A9 34     LDA #con_sfx_no
C - - - - - 0x016976 05:A966: 20 02 C0  JSR sub_0x01C2F4_play_sound
C - - - - - 0x016979 05:A969: 20 30 AE  JSR sub_AE30
C - - - - - 0x01697C 05:A96C: 4C 48 A9  JMP loc_A948



ofs_A96F_05_Dpad:
C - - J - - 0x01697F 05:A96F: A2 00     LDX #$00
C - - - - - 0x016981 05:A971: A9 32     LDA #con_sfx_move_cursor
C - - - - - 0x016983 05:A973: 20 02 C0  JSR sub_0x01C2F4_play_sound
C - - - - - 0x016986 05:A976: 20 DD 81  JSR sub_81DD
C - - - - - 0x016989 05:A979: 20 19 AD  JSR sub_AD19
loc_A97C:
ofs_A97C_00_nothing:
ofs_A97C_02_Select:
C D 1 J - - 0x01698C 05:A97C: 20 22 AE  JSR sub_AE22
C - - - - - 0x01698F 05:A97F: A9 16     LDA #$16
C - - - - - 0x016991 05:A981: 8D 75 00  STA ram_animation_id_player + 1
C - - - - - 0x016994 05:A984: A9 96     LDA #$96
C - - - - - 0x016996 05:A986: 8D 76 00  STA ram_animation_id_player + 2
C - - - - - 0x016999 05:A989: A9 04     LDA #$04
C - - - - - 0x01699B 05:A98B: 8D CE 05  STA ram_05CE
C - - - - - 0x01699E 05:A98E: A2 00     LDX #$00
C - - - - - 0x0169A0 05:A990: 20 2A 82  JSR sub_822A
C - - - - - 0x0169A3 05:A993: A9 01     LDA #$01
C - - - - - 0x0169A5 05:A995: 20 8D 82  JSR sub_828D
C - - - - - 0x0169A8 05:A998: 4C D9 A8  JMP loc_A8D9



ofs_A99B_03:
C - - J - - 0x0169AB 05:A99B: A2 00     LDX #$00
C - - - - - 0x0169AD 05:A99D: AD CA 05  LDA ram_номер_опции
C - - - - - 0x0169B0 05:A9A0: 10 06     BPL bra_A9A8
C - - - - - 0x0169B2 05:A9A2: 20 29 AE  JSR sub_AE29
C - - - - - 0x0169B5 05:A9A5: 20 19 AD  JSR sub_AD19
bra_A9A8:
C - - - - - 0x0169B8 05:A9A8: 20 7E 81  JSR sub_817E_конвертация_нажатых_кнопок_в_индекс
C - - - - - 0x0169BB 05:A9AB: 20 D3 81  JSR sub_81D3_конвертация_индексов_Dpad_в_05
C - - - - - 0x0169BE 05:A9AE: 20 53 C0  JSR sub_0x01EC9F_jump_to_pointers_after_JSR
- D 1 - I - 0x0169C1 05:A9B1: 7C A9     .word ofs_A97C_00_nothing
- - - - - - 0x0169C3 05:A9B3: 80 A8     .word ofs_A880_01_Start
- - - - - - 0x0169C5 05:A9B5: 7C A9     .word ofs_A97C_02_Select
- D 1 - I - 0x0169C7 05:A9B7: BD A9     .word ofs_A9BD_03_A
- - - - - - 0x0169C9 05:A9B9: 64 A9     .word ofs_A964_04_B
- D 1 - I - 0x0169CB 05:A9BB: 6F A9     .word ofs_A96F_05_Dpad



ofs_A9BD_03_A:
C - - J - - 0x0169CD 05:A9BD: A9 33     LDA #con_sfx_yes
C - - - - - 0x0169CF 05:A9BF: 20 02 C0  JSR sub_0x01C2F4_play_sound
C - - - - - 0x0169D2 05:A9C2: A9 06     LDA #$06
C - - - - - 0x0169D4 05:A9C4: 8D C9 05  STA ram_счетчик_опций
C - - - - - 0x0169D7 05:A9C7: A9 FF     LDA #$FF
C - - - - - 0x0169D9 05:A9C9: 8D CA 05  STA ram_номер_опции
C - - - - - 0x0169DC 05:A9CC: 4C 7C A9  JMP loc_A97C



ofs_A9CF_04:
C - - J - - 0x0169DF 05:A9CF: A2 00     LDX #$00
C - - - - - 0x0169E1 05:A9D1: 2C CA 05  BIT ram_номер_опции
C - - - - - 0x0169E4 05:A9D4: 10 08     BPL bra_A9DE
C - - - - - 0x0169E6 05:A9D6: A9 00     LDA #$00
C - - - - - 0x0169E8 05:A9D8: 8D D2 05  STA ram_05D2
C - - - - - 0x0169EB 05:A9DB: 8D CA 05  STA ram_номер_опции
bra_A9DE:
C - - - - - 0x0169EE 05:A9DE: 2C CA 05  BIT ram_номер_опции
C - - - - - 0x0169F1 05:A9E1: 70 15     BVS bra_A9F8
C - - - - - 0x0169F3 05:A9E3: 20 7E 81  JSR sub_817E_конвертация_нажатых_кнопок_в_индекс
C - - - - - 0x0169F6 05:A9E6: 20 D3 81  JSR sub_81D3_конвертация_индексов_Dpad_в_05
C - - - - - 0x0169F9 05:A9E9: 20 53 C0  JSR sub_0x01EC9F_jump_to_pointers_after_JSR
- D 1 - I - 0x0169FC 05:A9EC: C5 A8     .word ofs_A8C5_00_nothing
- - - - - - 0x0169FE 05:A9EE: 80 A8     .word ofs_A880_01_Start
- - - - - - 0x016A00 05:A9F0: C5 A8     .word ofs_A8C5_02_Select
- D 1 - I - 0x016A02 05:A9F2: 38 AA     .word ofs_AA38_03_A
- - - - - - 0x016A04 05:A9F4: 64 A9     .word ofs_A964_04_B
- D 1 - I - 0x016A06 05:A9F6: BD A8     .word ofs_A8BD_05_Dpad
bra_A9F8:
C - - - - - 0x016A08 05:A9F8: AD D2 05  LDA ram_05D2
C - - - - - 0x016A0B 05:A9FB: D0 14     BNE bra_AA11
C - - - - - 0x016A0D 05:A9FD: AD CA 05  LDA ram_номер_опции
C - - - - - 0x016A10 05:AA00: 29 0F     AND #$0F
C - - - - - 0x016A12 05:AA02: A8        TAY
C - - - - - 0x016A13 05:AA03: B9 33 AA  LDA tbl_AA33_sound,Y
C - - - - - 0x016A16 05:AA06: 20 02 C0  JSR sub_0x01C2F4_play_sound
C - - - - - 0x016A19 05:AA09: A9 18     LDA #$18
C - - - - - 0x016A1B 05:AA0B: 8D D2 05  STA ram_05D2
C - - - - - 0x016A1E 05:AA0E: EE CA 05  INC ram_номер_опции
bra_AA11:
C - - - - - 0x016A21 05:AA11: CE D2 05  DEC ram_05D2
C - - - - - 0x016A24 05:AA14: AD CA 05  LDA ram_номер_опции
C - - - - - 0x016A27 05:AA17: C9 45     CMP #$45
C - - - - - 0x016A29 05:AA19: 90 15     BCC bra_AA30
C - - - - - 0x016A2B 05:AA1B: AD 32 05  LDA ram_player_id
C - - - - - 0x016A2E 05:AA1E: 20 33 B2  JSR sub_B233
C - - - - - 0x016A31 05:AA21: A9 27     LDA #$27
C - - - - - 0x016A33 05:AA23: 8D 06 06  STA ram_0606
C - - - - - 0x016A36 05:AA26: A9 09     LDA #$09
C - - - - - 0x016A38 05:AA28: 8D C9 05  STA ram_счетчик_опций
C - - - - - 0x016A3B 05:AA2B: A9 FF     LDA #$FF
C - - - - - 0x016A3D 05:AA2D: 8D CA 05  STA ram_номер_опции
bra_AA30:
C - - - - - 0x016A40 05:AA30: 4C C5 A8  JMP loc_A8C5

tbl_AA33_sound:
- D 1 - - - 0x016A43 05:AA33: 4E        .byte con_sfx_ТЫ_ПОДНИМАЕШЬ_ТРУБКУ
- D 1 - - - 0x016A44 05:AA34: 47        .byte con_sfx_ТЕЛЕФОН_ЦИФРА_1
- D 1 - - - 0x016A45 05:AA35: 4A        .byte con_sfx_ТЕЛЕФОН_ЦИФРА_4
- D 1 - - - 0x016A46 05:AA36: 48        .byte con_sfx_ТЕЛЕФОН_ЦИФРА_2
- D 1 - - - 0x016A47 05:AA37: 49        .byte con_sfx_ТЕЛЕФОН_ЦИФРА_3



ofs_AA38_03_A:
C - - J - - 0x016A48 05:AA38: AD CA 05  LDA ram_номер_опции
C - - - - - 0x016A4B 05:AA3B: 8D D0 05  STA ram_05D0
C - - - - - 0x016A4E 05:AA3E: A9 00     LDA #$00
C - - - - - 0x016A50 05:AA40: 20 B0 82  JSR sub_82B0
C - - - - - 0x016A53 05:AA43: A9 40     LDA #$40
C - - - - - 0x016A55 05:AA45: 8D CA 05  STA ram_номер_опции
C - - - - - 0x016A58 05:AA48: 18        CLC
C - - - - - 0x016A59 05:AA49: AD D0 05  LDA ram_05D0
C - - - - - 0x016A5C 05:AA4C: 69 08     ADC #$08
C - - - - - 0x016A5E 05:AA4E: A0 00     LDY #$00
bra_AA50:
C - - - - - 0x016A60 05:AA50: 20 09 B0  JSR sub_B009
C - - - - - 0x016A63 05:AA53: C8        INY
C - - - - - 0x016A64 05:AA54: C0 0C     CPY #$0C
C - - - - - 0x016A66 05:AA56: 90 F8     BCC bra_AA50
C - - - - - 0x016A68 05:AA58: 4C C5 A8  JMP loc_A8C5



ofs_AA5B_05:
C - - J - - 0x016A6B 05:AA5B: A2 00     LDX #$00
C - - - - - 0x016A6D 05:AA5D: AD CA 05  LDA ram_номер_опции
C - - - - - 0x016A70 05:AA60: 10 06     BPL bra_AA68
C - - - - - 0x016A72 05:AA62: 20 29 AE  JSR sub_AE29
C - - - - - 0x016A75 05:AA65: 20 19 AD  JSR sub_AD19
bra_AA68:
C - - - - - 0x016A78 05:AA68: 20 7E 81  JSR sub_817E_конвертация_нажатых_кнопок_в_индекс
C - - - - - 0x016A7B 05:AA6B: 20 D3 81  JSR sub_81D3_конвертация_индексов_Dpad_в_05
C - - - - - 0x016A7E 05:AA6E: 20 53 C0  JSR sub_0x01EC9F_jump_to_pointers_after_JSR
- D 1 - I - 0x016A81 05:AA71: 7C A9     .word ofs_A97C_00_nothing
- - - - - - 0x016A83 05:AA73: 80 A8     .word ofs_A880_01_Start
- - - - - - 0x016A85 05:AA75: 7C A9     .word ofs_A97C_02_Select
- D 1 - I - 0x016A87 05:AA77: 7D AA     .word ofs_AA7D_03_A
- D 1 - I - 0x016A89 05:AA79: 64 A9     .word ofs_A964_04_B
- D 1 - I - 0x016A8B 05:AA7B: 6F A9     .word ofs_A96F_05_Dpad



ofs_AA7D_03_A:
C - - J - - 0x016A8D 05:AA7D: A9 33     LDA #con_sfx_yes
C - - - - - 0x016A8F 05:AA7F: 20 02 C0  JSR sub_0x01C2F4_play_sound
C - - - - - 0x016A92 05:AA82: 20 44 C0  JSR sub_0x01D057
C - - - - - 0x016A95 05:AA85: 20 4A C0  JSR sub_0x01D072
C - - - - - 0x016A98 05:AA88: A9 0A     LDA #$0A
C - - - - - 0x016A9A 05:AA8A: 85 59     STA ram_subscript
C - - - - - 0x016A9C 05:AA8C: A9 0D     LDA #$0D
C - - - - - 0x016A9E 05:AA8E: 85 5B     STA ram_for_0059
C - - - - - 0x016AA0 05:AA90: 4C EC A8  RTS



ofs_AA93_06:
C - - J - - 0x016AA3 05:AA93: A2 00     LDX #$00
C - - - - - 0x016AA5 05:AA95: AD CA 05  LDA ram_номер_опции
C - - - - - 0x016AA8 05:AA98: 10 09     BPL bra_AAA3
C - - - - - 0x016AAA 05:AA9A: AD E1 05  LDA ram_05E1
C - - - - - 0x016AAD 05:AA9D: 8D CA 05  STA ram_номер_опции
C - - - - - 0x016AB0 05:AAA0: 20 53 AD  JSR sub_AD53
bra_AAA3:
C - - - - - 0x016AB3 05:AAA3: 20 7E 81  JSR sub_817E_конвертация_нажатых_кнопок_в_индекс
C - - - - - 0x016AB6 05:AAA6: 20 53 C0  JSR sub_0x01EC9F_jump_to_pointers_after_JSR
- D 1 - I - 0x016AB9 05:AAA9: 7C A9     .word ofs_A97C_00_nothing
- - - - - - 0x016ABB 05:AAAB: 80 A8     .word ofs_A880_01_Start
- - - - - - 0x016ABD 05:AAAD: 7C A9     .word ofs_A97C_02_Select
- D 1 - I - 0x016ABF 05:AAAF: BB AA     .word ofs_AABB_03_A
- D 1 - I - 0x016AC1 05:AAB1: DC AA     .word ofs_AADC_04_B
- D 1 - I - 0x016AC3 05:AAB3: 09 AB     .word ofs_AB09_05_Up
- - - - - - 0x016AC5 05:AAB5: EE AA     .word ofs_AAEE_06_Down
- D 1 - I - 0x016AC7 05:AAB7: 09 AB     .word ofs_AB09_07_Left
- D 1 - I - 0x016AC9 05:AAB9: EE AA     .word ofs_AAEE_08_Right



ofs_AABB_03_A:
C - - J - - 0x016ACB 05:AABB: A9 01     LDA #$01
C - - - - - 0x016ACD 05:AABD: 85 20     STA ram_0020
C - - - - - 0x016ACF 05:AABF: AD CA 05  LDA ram_номер_опции
C - - - - - 0x016AD2 05:AAC2: C9 04     CMP #$04
C - - - - - 0x016AD4 05:AAC4: 90 0B     BCC bra_AAD1
C - - - - - 0x016AD6 05:AAC6: E9 04     SBC #$04
C - - - - - 0x016AD8 05:AAC8: AC D1 05  LDY ram_05D1
C - - - - - 0x016ADB 05:AACB: 20 09 B0  JSR sub_B009
C - - - - - 0x016ADE 05:AACE: 20 A8 B0  JSR sub_B0A8
bra_AAD1:
C - - - - - 0x016AE1 05:AAD1: 20 5F AF  JSR sub_AF5F
C - - - - - 0x016AE4 05:AAD4: A9 08     LDA #$08
C - - - - - 0x016AE6 05:AAD6: 8D C9 05  STA ram_счетчик_опций
C - - - - - 0x016AE9 05:AAD9: 4C 2F A9  JMP loc_A92F



ofs_AADC_04_B:
C - - J - - 0x016AEC 05:AADC: A9 34     LDA #con_sfx_no
C - - - - - 0x016AEE 05:AADE: 20 02 C0  JSR sub_0x01C2F4_play_sound
C - - - - - 0x016AF1 05:AAE1: A9 03     LDA #$03
C - - - - - 0x016AF3 05:AAE3: 8D C9 05  STA ram_счетчик_опций
C - - - - - 0x016AF6 05:AAE6: A9 FF     LDA #$FF
C - - - - - 0x016AF8 05:AAE8: 8D CA 05  STA ram_номер_опции
C - - - - - 0x016AFB 05:AAEB: 4C 7C A9  JMP loc_A97C



ofs_AAEE_06_Down:
ofs_AAEE_08_Right:
C - - J - - 0x016AFE 05:AAEE: 18        CLC
C - - - - - 0x016AFF 05:AAEF: AD CA 05  LDA ram_номер_опции
C - - - - - 0x016B02 05:AAF2: 69 01     ADC #$01
C - - - - - 0x016B04 05:AAF4: C9 0C     CMP #$0C
C - - - - - 0x016B06 05:AAF6: 90 03     BCC bra_AAFB
C - - - - - 0x016B08 05:AAF8: AD E1 05  LDA ram_05E1
bra_AAFB:
loc_AAFB:
C D 1 - - - 0x016B0B 05:AAFB: 8D CA 05  STA ram_номер_опции
C - - - - - 0x016B0E 05:AAFE: 20 53 AD  JSR sub_AD53
C - - - - - 0x016B11 05:AB01: A9 32     LDA #con_sfx_move_cursor
C - - - - - 0x016B13 05:AB03: 20 02 C0  JSR sub_0x01C2F4_play_sound
C - - - - - 0x016B16 05:AB06: 4C 7C A9  JMP loc_A97C



ofs_AB09_05_Up:
ofs_AB09_07_Left:
C - - J - - 0x016B19 05:AB09: 38        SEC
C - - - - - 0x016B1A 05:AB0A: AD CA 05  LDA ram_номер_опции
C - - - - - 0x016B1D 05:AB0D: E9 01     SBC #$01
C - - - - - 0x016B1F 05:AB0F: 30 05     BMI bra_AB16
C - - - - - 0x016B21 05:AB11: CD E1 05  CMP ram_05E1
C - - - - - 0x016B24 05:AB14: B0 E5     BCS bra_AAFB
bra_AB16:
C - - - - - 0x016B26 05:AB16: A9 0B     LDA #$0B
C - - - - - 0x016B28 05:AB18: 4C FB AA  JMP loc_AAFB



ofs_AB1B_08:
C - - J - - 0x016B2B 05:AB1B: AD CA 05  LDA ram_номер_опции
C - - - - - 0x016B2E 05:AB1E: 30 08     BMI bra_AB28
bra_AB20:
C - - - - - 0x016B30 05:AB20: AD 05 06  LDA ram_0605
C - - - - - 0x016B33 05:AB23: 30 0D     BMI bra_AB32
C - - - - - 0x016B35 05:AB25: 4C 40 A9  JMP loc_A940
bra_AB28:
loc_AB28:
C D 1 - - - 0x016B38 05:AB28: A9 00     LDA #$00
C - - - - - 0x016B3A 05:AB2A: 8D CA 05  STA ram_номер_опции
C - - - - - 0x016B3D 05:AB2D: A9 80     LDA #$80
C - - - - - 0x016B3F 05:AB2F: 8D 04 06  STA ram_0604
bra_AB32:
loc_AB32:
C D 1 - - - 0x016B42 05:AB32: 20 71 C0  JSR sub_0x01C327
C - - - - - 0x016B45 05:AB35: AD C9 05  LDA ram_счетчик_опций
C - - - - - 0x016B48 05:AB38: C9 09     CMP #$09
C - - - - - 0x016B4A 05:AB3A: 90 03     BCC bra_AB3F
C - - - - - 0x016B4C 05:AB3C: 4C C5 A8  JMP loc_A8C5
bra_AB3F:
C - - - - - 0x016B4F 05:AB3F: 4C 7C A9  JMP loc_A97C



ofs_AB42_07:
C - - J - - 0x016B52 05:AB42: AD CA 05  LDA ram_номер_опции
C - - - - - 0x016B55 05:AB45: 30 E1     BMI bra_AB28
C - - - - - 0x016B57 05:AB47: AD CA 05  LDA ram_номер_опции
C - - - - - 0x016B5A 05:AB4A: D0 D4     BNE bra_AB20
C - - - - - 0x016B5C 05:AB4C: AD 05 06  LDA ram_0605
C - - - - - 0x016B5F 05:AB4F: 30 E1     BMI bra_AB32
C - - - - - 0x016B61 05:AB51: AD D1 05  LDA ram_05D1
C - - - - - 0x016B64 05:AB54: 20 33 B2  JSR sub_B233
C - - - - - 0x016B67 05:AB57: AC D1 05  LDY ram_05D1
C - - - - - 0x016B6A 05:AB5A: B9 D5 05  LDA ram_05D5,Y
C - - - - - 0x016B6D 05:AB5D: 29 0F     AND #$0F
C - - - - - 0x016B6F 05:AB5F: 4A        LSR
C - - - - - 0x016B70 05:AB60: A8        TAY
C - - - - - 0x016B71 05:AB61: B9 88 AB  LDA tbl_AB88,Y
C - - - - - 0x016B74 05:AB64: 10 08     BPL bra_AB6E
C - - - - - 0x016B76 05:AB66: A9 10     LDA #$10
C - - - - - 0x016B78 05:AB68: 18        CLC
C - - - - - 0x016B79 05:AB69: 6D D1 05  ADC ram_05D1
C - - - - - 0x016B7C 05:AB6C: D0 0C     BNE bra_AB7A
bra_AB6E:
C - - - - - 0x016B7E 05:AB6E: 8D 06 06  STA ram_0606
C - - - - - 0x016B81 05:AB71: AD 00 03  LDA ram_frame_cnt
C - - - - - 0x016B84 05:AB74: 29 01     AND #$01
C - - - - - 0x016B86 05:AB76: 18        CLC
C - - - - - 0x016B87 05:AB77: 6D 06 06  ADC ram_0606
bra_AB7A:
C - - - - - 0x016B8A 05:AB7A: 8D 06 06  STA ram_0606
C - - - - - 0x016B8D 05:AB7D: A9 80     LDA #$80
C - - - - - 0x016B8F 05:AB7F: 8D 04 06  STA ram_0604
C - - - - - 0x016B92 05:AB82: EE CA 05  INC ram_номер_опции
C - - - - - 0x016B95 05:AB85: 4C 32 AB  JMP loc_AB32

tbl_AB88:
- - - - - - 0x016B98 05:AB88: 22        .byte $22   ; 
- - - - - - 0x016B99 05:AB89: 22        .byte $22   ; 
- D 1 - - - 0x016B9A 05:AB8A: 20        .byte $20   ; 
- D 1 - - - 0x016B9B 05:AB8B: 1E        .byte $1E   ; 
- D 1 - - - 0x016B9C 05:AB8C: 1E        .byte $1E   ; 
- D 1 - - - 0x016B9D 05:AB8D: 1C        .byte $1C   ; 
- D 1 - - - 0x016B9E 05:AB8E: FF        .byte $FF   ; 
- - - - - - 0x016B9F 05:AB8F: FF        .byte $FF   ; 



ofs_AB90_09:
C - - J - - 0x016BA0 05:AB90: AD CA 05  LDA ram_номер_опции
C - - - - - 0x016BA3 05:AB93: 30 93     BMI bra_AB28
C - - - - - 0x016BA5 05:AB95: AD 05 06  LDA ram_0605
C - - - - - 0x016BA8 05:AB98: 10 1B     BPL bra_ABB5
C - - - - - 0x016BAA 05:AB9A: 29 20     AND #$20
C - - - - - 0x016BAC 05:AB9C: F0 94     BEQ bra_AB32
C - - - - - 0x016BAE 05:AB9E: AD 00 03  LDA ram_frame_cnt
C - - - - - 0x016BB1 05:ABA1: 29 7F     AND #$7F
C - - - - - 0x016BB3 05:ABA3: D0 8D     BNE bra_AB32
C - - - - - 0x016BB5 05:ABA5: AD CA 05  LDA ram_номер_опции
C - - - - - 0x016BB8 05:ABA8: 49 01     EOR #$01
C - - - - - 0x016BBA 05:ABAA: 8D CA 05  STA ram_номер_опции
C - - - - - 0x016BBD 05:ABAD: A9 4B     LDA #con_sfx_ГУДКИ_В_ТРУБКЕ
C - - - - - 0x016BBF 05:ABAF: 20 02 C0  JSR sub_0x01C2F4_play_sound
C - - - - - 0x016BC2 05:ABB2: 4C 32 AB  JMP loc_AB32
bra_ABB5:
C - - - - - 0x016BC5 05:ABB5: A9 4D     LDA #con_sfx_КЛИЕНТ_ПОДНИМАЕТ_ТРУБКУ
C - - - - - 0x016BC7 05:ABB7: 20 02 C0  JSR sub_0x01C2F4_play_sound
C - - - - - 0x016BCA 05:ABBA: 20 BD AF  JSR sub_AFBD
C - - - - - 0x016BCD 05:ABBD: A9 0A     LDA #$0A
C - - - - - 0x016BCF 05:ABBF: 8D C9 05  STA ram_счетчик_опций
C - - - - - 0x016BD2 05:ABC2: A9 FF     LDA #$FF
C - - - - - 0x016BD4 05:ABC4: 8D CA 05  STA ram_номер_опции
C - - - - - 0x016BD7 05:ABC7: 4C 32 AB  JMP loc_AB32



ofs_ABCA_0A:
C - - J - - 0x016BDA 05:ABCA: AD CA 05  LDA ram_номер_опции
C - - - - - 0x016BDD 05:ABCD: 30 1C     BMI bra_ABEB
C - - - - - 0x016BDF 05:ABCF: AD 05 06  LDA ram_0605
C - - - - - 0x016BE2 05:ABD2: 10 03     BPL bra_ABD7
C - - - - - 0x016BE4 05:ABD4: 4C 32 AB  JMP loc_AB32
bra_ABD7:
C - - - - - 0x016BE7 05:ABD7: AD D0 05  LDA ram_05D0
C - - - - - 0x016BEA 05:ABDA: C9 02     CMP #$02
C - - - - - 0x016BEC 05:ABDC: D0 07     BNE bra_ABE5
C - - - - - 0x016BEE 05:ABDE: AD 06 06  LDA ram_0606
C - - - - - 0x016BF1 05:ABE1: C9 32     CMP #$32
C - - - - - 0x016BF3 05:ABE3: 90 03     BCC bra_ABE8
bra_ABE5:
C - - - - - 0x016BF5 05:ABE5: 4C 40 A9  JMP loc_A940
bra_ABE8:
C - - - - - 0x016BF8 05:ABE8: EE 06 06  INC ram_0606
bra_ABEB:
C - - - - - 0x016BFB 05:ABEB: 4C 28 AB  JMP loc_AB28



sub_ABEE:
C - - - - - 0x016BFE 05:ABEE: 20 05 82  JSR sub_8205_read_pointers_after_JSR
- D 1 - I - 0x016C01 05:ABF1: 5D AC     .word off_AC5D_00
- D 1 - I - 0x016C03 05:ABF3: 09 AC     .word off_AC09_01
- D 1 - I - 0x016C05 05:ABF5: 5D AC     .word off_AC5D_02
- D 1 - I - 0x016C07 05:ABF7: 09 AC     .word off_AC09_03
- D 1 - I - 0x016C09 05:ABF9: 67 AC     .word off_AC67_04
- D 1 - I - 0x016C0B 05:ABFB: 1D AC     .word off_AC1D_05
- D 1 - I - 0x016C0D 05:ABFD: 67 AC     .word off_AC67_06
- D 1 - I - 0x016C0F 05:ABFF: 1D AC     .word off_AC1D_07
- D 1 - I - 0x016C11 05:AC01: 7F AC     .word off_AC7F_08
- D 1 - I - 0x016C13 05:AC03: 4D AC     .word off_AC4D_09
- D 1 - I - 0x016C15 05:AC05: 67 AC     .word off_AC67_0A
- D 1 - I - 0x016C17 05:AC07: 1D AC     .word off_AC1D_0B

off_AC09_01:
off_AC09_03:
- D 1 - I - 0x016C19 05:AC09: 04        .byte $04   ; 
- D 1 - I - 0x016C1A 05:AC0A: 01        .byte $01   ; 
- D 1 - I - 0x016C1B 05:AC0B: 00        .byte $00   ; 
- D 1 - I - 0x016C1C 05:AC0C: 00        .byte $00   ; 
- D 1 - I - 0x016C1D 05:AC0D: 00        .byte $00   ; 
- D 1 - I - 0x016C1E 05:AC0E: 02        .byte $02   ; 
- D 1 - I - 0x016C1F 05:AC0F: 01        .byte $01   ; 
- D 1 - I - 0x016C20 05:AC10: 01        .byte $01   ; 
- D 1 - I - 0x016C21 05:AC11: 01        .byte $01   ; 
- D 1 - I - 0x016C22 05:AC12: 03        .byte $03   ; 
- D 1 - I - 0x016C23 05:AC13: 02        .byte $02   ; 
- D 1 - I - 0x016C24 05:AC14: 02        .byte $02   ; 
- D 1 - I - 0x016C25 05:AC15: 02        .byte $02   ; 
- D 1 - I - 0x016C26 05:AC16: 04        .byte $04   ; 
- D 1 - I - 0x016C27 05:AC17: 03        .byte $03   ; 
- D 1 - I - 0x016C28 05:AC18: 03        .byte $03   ; 
- D 1 - I - 0x016C29 05:AC19: 03        .byte $03   ; 
- D 1 - I - 0x016C2A 05:AC1A: 00        .byte $00   ; 
- D 1 - I - 0x016C2B 05:AC1B: 04        .byte $04   ; 
- D 1 - I - 0x016C2C 05:AC1C: 04        .byte $04   ; 



off_AC1D_05:
off_AC1D_07:
off_AC1D_0B:
- D 1 - I - 0x016C2D 05:AC1D: 06        .byte $06   ; 
- D 1 - I - 0x016C2E 05:AC1E: 06        .byte $06   ; 
- D 1 - I - 0x016C2F 05:AC1F: 05        .byte $05   ; 
- D 1 - I - 0x016C30 05:AC20: 01        .byte $01   ; 
- D 1 - I - 0x016C31 05:AC21: 07        .byte $07   ; 
- D 1 - I - 0x016C32 05:AC22: 07        .byte $07   ; 
- D 1 - I - 0x016C33 05:AC23: 00        .byte $00   ; 
- D 1 - I - 0x016C34 05:AC24: 02        .byte $02   ; 
- D 1 - I - 0x016C35 05:AC25: 08        .byte $08   ; 
- D 1 - I - 0x016C36 05:AC26: 08        .byte $08   ; 
- D 1 - I - 0x016C37 05:AC27: 01        .byte $01   ; 
- D 1 - I - 0x016C38 05:AC28: 03        .byte $03   ; 
- D 1 - I - 0x016C39 05:AC29: 09        .byte $09   ; 
- D 1 - I - 0x016C3A 05:AC2A: 09        .byte $09   ; 
- D 1 - I - 0x016C3B 05:AC2B: 02        .byte $02   ; 
- D 1 - I - 0x016C3C 05:AC2C: 04        .byte $04   ; 
- D 1 - I - 0x016C3D 05:AC2D: 0A        .byte $0A   ; 
- D 1 - I - 0x016C3E 05:AC2E: 0A        .byte $0A   ; 
- D 1 - I - 0x016C3F 05:AC2F: 03        .byte $03   ; 
- D 1 - I - 0x016C40 05:AC30: 05        .byte $05   ; 
- D 1 - I - 0x016C41 05:AC31: 0B        .byte $0B   ; 
- D 1 - I - 0x016C42 05:AC32: 0B        .byte $0B   ; 
- D 1 - I - 0x016C43 05:AC33: 04        .byte $04   ; 
- D 1 - I - 0x016C44 05:AC34: 00        .byte $00   ; 
- D 1 - I - 0x016C45 05:AC35: 00        .byte $00   ; 
- D 1 - I - 0x016C46 05:AC36: 00        .byte $00   ; 
- D 1 - I - 0x016C47 05:AC37: 0B        .byte $0B   ; 
- D 1 - I - 0x016C48 05:AC38: 07        .byte $07   ; 
- D 1 - I - 0x016C49 05:AC39: 01        .byte $01   ; 
- D 1 - I - 0x016C4A 05:AC3A: 01        .byte $01   ; 
- D 1 - I - 0x016C4B 05:AC3B: 06        .byte $06   ; 
- D 1 - I - 0x016C4C 05:AC3C: 08        .byte $08   ; 
- D 1 - I - 0x016C4D 05:AC3D: 02        .byte $02   ; 
- D 1 - I - 0x016C4E 05:AC3E: 02        .byte $02   ; 
- D 1 - I - 0x016C4F 05:AC3F: 07        .byte $07   ; 
- D 1 - I - 0x016C50 05:AC40: 09        .byte $09   ; 
- D 1 - I - 0x016C51 05:AC41: 03        .byte $03   ; 
- D 1 - I - 0x016C52 05:AC42: 03        .byte $03   ; 
- D 1 - I - 0x016C53 05:AC43: 08        .byte $08   ; 
- D 1 - I - 0x016C54 05:AC44: 0A        .byte $0A   ; 
- D 1 - I - 0x016C55 05:AC45: 04        .byte $04   ; 
- D 1 - I - 0x016C56 05:AC46: 04        .byte $04   ; 
- D 1 - I - 0x016C57 05:AC47: 09        .byte $09   ; 
- D 1 - I - 0x016C58 05:AC48: 0B        .byte $0B   ; 
- D 1 - I - 0x016C59 05:AC49: 05        .byte $05   ; 
- D 1 - I - 0x016C5A 05:AC4A: 05        .byte $05   ; 
- D 1 - I - 0x016C5B 05:AC4B: 0A        .byte $0A   ; 
- D 1 - I - 0x016C5C 05:AC4C: 06        .byte $06   ; 



off_AC4D_09:
- - - - - - 0x016C5D 05:AC4D: 02        .byte $02   ; 
- D 1 - I - 0x016C5E 05:AC4E: 02        .byte $02   ; 
- - - - - - 0x016C5F 05:AC4F: 01        .byte $01   ; 
- D 1 - I - 0x016C60 05:AC50: 01        .byte $01   ; 
- - - - - - 0x016C61 05:AC51: 03        .byte $03   ; 
- D 1 - I - 0x016C62 05:AC52: 03        .byte $03   ; 
- D 1 - I - 0x016C63 05:AC53: 00        .byte $00   ; 
- - - - - - 0x016C64 05:AC54: 00        .byte $00   ; 
- D 1 - I - 0x016C65 05:AC55: 00        .byte $00   ; 
- - - - - - 0x016C66 05:AC56: 00        .byte $00   ; 
- - - - - - 0x016C67 05:AC57: 03        .byte $03   ; 
- - - - - - 0x016C68 05:AC58: 03        .byte $03   ; 
- - - - - - 0x016C69 05:AC59: 01        .byte $01   ; 
- - - - - - 0x016C6A 05:AC5A: 01        .byte $01   ; 
- - - - - - 0x016C6B 05:AC5B: 02        .byte $02   ; 
- - - - - - 0x016C6C 05:AC5C: 02        .byte $02   ; 



off_AC5D_00:
off_AC5D_02:
- D 1 - I - 0x016C6D 05:AC5D: 09        .byte $09   ; 
- D 1 - I - 0x016C6E 05:AC5E: 12        .byte $12   ; 
- D 1 - I - 0x016C6F 05:AC5F: 09        .byte $09   ; 
- D 1 - I - 0x016C70 05:AC60: 13        .byte $13   ; 
- D 1 - I - 0x016C71 05:AC61: 09        .byte $09   ; 
- D 1 - I - 0x016C72 05:AC62: 14        .byte $14   ; 
- D 1 - I - 0x016C73 05:AC63: 09        .byte $09   ; 
- D 1 - I - 0x016C74 05:AC64: 15        .byte $15   ; 
- D 1 - I - 0x016C75 05:AC65: 09        .byte $09   ; 
- D 1 - I - 0x016C76 05:AC66: 16        .byte $16   ; 



off_AC67_04:
off_AC67_06:
off_AC67_0A:
- D 1 - I - 0x016C77 05:AC67: 05        .byte $05   ; 
- D 1 - I - 0x016C78 05:AC68: 06        .byte $06   ; 
- D 1 - I - 0x016C79 05:AC69: 09        .byte $09   ; 
- D 1 - I - 0x016C7A 05:AC6A: 06        .byte $06   ; 
- D 1 - I - 0x016C7B 05:AC6B: 0D        .byte $0D   ; 
- D 1 - I - 0x016C7C 05:AC6C: 06        .byte $06   ; 
- D 1 - I - 0x016C7D 05:AC6D: 11        .byte $11   ; 
- D 1 - I - 0x016C7E 05:AC6E: 06        .byte $06   ; 
- D 1 - I - 0x016C7F 05:AC6F: 15        .byte $15   ; 
- D 1 - I - 0x016C80 05:AC70: 06        .byte $06   ; 
- D 1 - I - 0x016C81 05:AC71: 19        .byte $19   ; 
- D 1 - I - 0x016C82 05:AC72: 06        .byte $06   ; 
- D 1 - I - 0x016C83 05:AC73: 05        .byte $05   ; 
- D 1 - I - 0x016C84 05:AC74: 0B        .byte $0B   ; 
- D 1 - I - 0x016C85 05:AC75: 09        .byte $09   ; 
- D 1 - I - 0x016C86 05:AC76: 0B        .byte $0B   ; 
- D 1 - I - 0x016C87 05:AC77: 0D        .byte $0D   ; 
- D 1 - I - 0x016C88 05:AC78: 0B        .byte $0B   ; 
- D 1 - I - 0x016C89 05:AC79: 11        .byte $11   ; 
- D 1 - I - 0x016C8A 05:AC7A: 0B        .byte $0B   ; 
- D 1 - I - 0x016C8B 05:AC7B: 15        .byte $15   ; 
- D 1 - I - 0x016C8C 05:AC7C: 0B        .byte $0B   ; 
- D 1 - I - 0x016C8D 05:AC7D: 19        .byte $19   ; 
- D 1 - I - 0x016C8E 05:AC7E: 0B        .byte $0B   ; 



off_AC7F_08:
- D 1 - I - 0x016C8F 05:AC7F: 10        .byte $10   ; 
- D 1 - I - 0x016C90 05:AC80: 14        .byte $14   ; 
- D 1 - I - 0x016C91 05:AC81: 15        .byte $15   ; 
- D 1 - I - 0x016C92 05:AC82: 14        .byte $14   ; 
- D 1 - I - 0x016C93 05:AC83: 10        .byte $10   ; 
- D 1 - I - 0x016C94 05:AC84: 16        .byte $16   ; 
- D 1 - I - 0x016C95 05:AC85: 15        .byte $15   ; 
- D 1 - I - 0x016C96 05:AC86: 16        .byte $16   ; 



sub_AC87:
C - - - - - 0x016C97 05:AC87: A9 00     LDA #$00
C - - - - - 0x016C99 05:AC89: 8D CE 05  STA ram_05CE
C - - - - - 0x016C9C 05:AC8C: AD CA 05  LDA ram_номер_опции
C - - - - - 0x016C9F 05:AC8F: 29 20     AND #$20
C - - - - - 0x016CA1 05:AC91: D0 0E     BNE bra_ACA1
C - - - - - 0x016CA3 05:AC93: AD CA 05  LDA ram_номер_опции
C - - - - - 0x016CA6 05:AC96: 29 3F     AND #$3F
C - - - - - 0x016CA8 05:AC98: 8D CA 05  STA ram_номер_опции
C - - - - - 0x016CAB 05:AC9B: 20 EF 82  JSR sub_82AF
C - - - - - 0x016CAE 05:AC9E: 4C A6 AC  RTS
bra_ACA1:
C - - - - - 0x016CB1 05:ACA1: A9 04     LDA #$04
C - - - - - 0x016CB3 05:ACA3: 8D CA 05  STA ram_номер_опции
C D 1 - - - 0x016CB6 05:ACA6: 60        RTS



sub_ACA7:
C - - - - - 0x016CB7 05:ACA7: 20 44 C0  JSR sub_0x01D057
C - - - - - 0x016CBA 05:ACAA: 20 4A C0  JSR sub_0x01D072
C - - - - - 0x016CBD 05:ACAD: A9 04     LDA #$04
C - - - - - 0x016CBF 05:ACAF: 8D 59 00  STA ram_subscript
C - - - - - 0x016CC2 05:ACB2: 60        RTS



sub_ACBD:
C - - - - - 0x016CCD 05:ACBD: AD CA 05  LDA ram_номер_опции
loc_ACC0:
C D 1 - - - 0x016CD0 05:ACC0: 0A        ASL
C - - - - - 0x016CD1 05:ACC1: 0A        ASL
C - - - - - 0x016CD2 05:ACC2: 0A        ASL
C - - - - - 0x016CD3 05:ACC3: 85 26     STA ram_0026
C - - - - - 0x016CD5 05:ACC5: A9 22     LDA #$22
C - - - - - 0x016CD7 05:ACC7: 85 32     STA ram_0032
C - - - - - 0x016CD9 05:ACC9: A9 2E     LDA #$2E
C - - - - - 0x016CDB 05:ACCB: 85 33     STA ram_0033
C - - - - - 0x016CDD 05:ACCD: A2 00     LDX #$00
loc_ACCF:
C D 1 - - - 0x016CDF 05:ACCF: A4 26     LDY ram_0026
C - - - - - 0x016CE1 05:ACD1: 18        CLC
C - - - - - 0x016CE2 05:ACD2: AD 35 AE  LDA tbl_AE35
C - - - - - 0x016CE5 05:ACD5: 79 37 AE  ADC tbl_AE37,Y
C - - - - - 0x016CE8 05:ACD8: 85 34     STA ram_0034
C - - - - - 0x016CEA 05:ACDA: AD 36 AE  LDA tbl_AE35 + 1
C - - - - - 0x016CED 05:ACDD: 69 00     ADC #$00
C - - - - - 0x016CEF 05:ACDF: 85 35     STA ram_0035
C - - - - - 0x016CF1 05:ACE1: A0 00     LDY #$00
bra_ACE3_loop:
; bzk I
C - - - - - 0x016CF3 05:ACE3: B1 34     LDA (ram_0034),Y
C - - - - - 0x016CF5 05:ACE5: 99 B9 06  STA ram_буфер_графики,Y
C D 1 - I - 0x016CF8 05:ACE8: C8        INY
C - - - - - 0x016CF9 05:ACE9: C0 10     CPY #$10
C - - - - - 0x016CFB 05:ACEB: 90 F6     BCC bra_ACE3_loop
C D 1 - I - 0x016CFD 05:ACED: A9 10     LDA #$10
C - - - - - 0x016CFF 05:ACEF: 8D B8 06  STA ram_счетчик_буфера_графики
C - - - - - 0x016D02 05:ACF2: A5 33     LDA ram_0033
C - - - - - 0x016D04 05:ACF4: 8D B7 06  STA ram_байт_2006_lo_графика
C - - - - - 0x016D07 05:ACF7: A5 32     LDA ram_0032
C - - - - - 0x016D09 05:ACF9: 8D B6 06  STA ram_байт_2006_hi_графика
bra_ACFC_infinite_loop:
C - - - - - 0x016D0C 05:ACFC: AD B6 06  LDA ram_байт_2006_hi_графика
C D 1 - I - 0x016D0F 05:ACFF: 10 FB     BPL bra_ACFC_infinite_loop
C D 1 - I - 0x016D11 05:AD01: E8        INX
C D 1 - I - 0x016D12 05:AD02: E0 07     CPX #$07
C D 1 - I - 0x016D14 05:AD04: B0 12     BCS bra_AD18_RTS
C D 1 - I - 0x016D16 05:AD06: 18        CLC
C D 1 - I - 0x016D17 05:AD07: A5 33     LDA ram_0033
C - - - - - 0x016D19 05:AD09: 69 20     ADC #$20
C - - - - - 0x016D1B 05:AD0B: 85 33     STA ram_0033
C - - - - - 0x016D1D 05:AD0D: A5 32     LDA ram_0032
C - - - - - 0x016D1F 05:AD0F: 69 00     ADC #$00
C - - - - - 0x016D21 05:AD11: 85 32     STA ram_0032
C - - - - - 0x016D23 05:AD13: E6 26     INC ram_0026
C - - - - - 0x016D25 05:AD15: 4C CF AC  JMP loc_ACCF
bra_AD18_RTS:
C - - - - - 0x016D28 05:AD18: 60        RTS



sub_AD19:
C - - - - - 0x016D29 05:AD19: AD CA 05  LDA ram_номер_опции
C - - - - - 0x016D2C 05:AD1C: AD CA 05  LDA ram_номер_опции
C - - - - - 0x016D2F 05:AD1F: 8D D1 05  STA ram_05D1
C - - - - - 0x016D32 05:AD22: 20 FF B1  JSR sub_B1FF
C - - - - - 0x016D35 05:AD25: A9 59     LDA #$59
C - - - - - 0x016D37 05:AD27: 85 1C     STA ram_001C
C - - - - - 0x016D39 05:AD29: A9 5A     LDA #$5A
C - - - - - 0x016D3B 05:AD2B: 85 1D     STA ram_001D
C - - - - - 0x016D3D 05:AD2D: A9 5B     LDA #$5B
C - - - - - 0x016D3F 05:AD2F: 85 1E     STA ram_001E
C - - - - - 0x016D41 05:AD31: A9 05     LDA #$05
C - - - - - 0x016D43 05:AD33: 85 1F     STA ram_001F
C - - - - - 0x016D45 05:AD35: 20 91 AD  JSR sub_AD91
C - - - - - 0x016D48 05:AD38: A5 1F     LDA ram_001F
C - - - - - 0x016D4A 05:AD3A: 8D 95 06  STA ram_счетчик_буфера_атрибутов
C - - - - - 0x016D4D 05:AD3D: 8D B8 06  STA ram_счетчик_буфера_графики
C - - - - - 0x016D50 05:AD40: A9 AF     LDA #$AF
C - - - - - 0x016D52 05:AD42: 8D 94 06  STA ram_байт_2006_lo_атрибуты
C - - - - - 0x016D55 05:AD45: A9 CF     LDA #$CF
C - - - - - 0x016D57 05:AD47: 8D B7 06  STA ram_байт_2006_lo_графика
C - - - - - 0x016D5A 05:AD4A: A9 22     LDA #$22
C - - - - - 0x016D5C 05:AD4C: 8D 93 06  STA ram_байт_2006_hi_атрибуты
C - - - - - 0x016D5F 05:AD4F: 8D B6 06  STA ram_байт_2006_hi_графика
C - - - - - 0x016D62 05:AD52: 60        RTS



sub_AD53:
; bzk I
C - - - - - 0x016D63 05:AD53: AD CA 05  LDA ram_номер_опции
C - - - - - 0x016D66 05:AD56: 20 22 B2  JSR sub_B222
C - - - - - 0x016D69 05:AD59: A9 02     LDA #$02
C D 1 - I - 0x016D6B 05:AD5B: 85 1C     STA ram_001C
C - - - - - 0x016D6D 05:AD5D: A9 DA     LDA #$DA
C - - - - - 0x016D6F 05:AD5F: 85 1D     STA ram_001D
C - - - - - 0x016D71 05:AD61: A9 DB     LDA #$DB
C - - - - - 0x016D73 05:AD63: 85 1E     STA ram_001E
C D 1 - I - 0x016D75 05:AD65: A9 08     LDA #$08
C - - - - - 0x016D77 05:AD67: 85 1F     STA ram_001F
C - - - - - 0x016D79 05:AD69: 20 91 AD  JSR sub_AD91
C - - - - - 0x016D7C 05:AD6C: 38        SEC
C - - - - - 0x016D7D 05:AD6D: AD B9 06  LDA ram_буфер_графики
C - - - - - 0x016D80 05:AD70: ED E1 05  SBC ram_05E1
C - - - - - 0x016D83 05:AD73: 8D B9 06  STA ram_буфер_графики
C - - - - - 0x016D86 05:AD76: A5 1F     LDA ram_001F
C - - - - - 0x016D88 05:AD78: 8D 95 06  STA ram_счетчик_буфера_атрибутов
C - - - - - 0x016D8B 05:AD7B: 8D B8 06  STA ram_счетчик_буфера_графики
C D 1 - I - 0x016D8E 05:AD7E: A9 75     LDA #$75
C - - - - - 0x016D90 05:AD80: 8D 94 06  STA ram_байт_2006_lo_атрибуты
C - - - - - 0x016D93 05:AD83: A9 95     LDA #$95
C - - - - - 0x016D95 05:AD85: 8D B7 06  STA ram_байт_2006_lo_графика
C - - - - - 0x016D98 05:AD88: A9 22     LDA #$22
C - - - - - 0x016D9A 05:AD8A: 8D 93 06  STA ram_байт_2006_hi_атрибуты
C - - - - - 0x016D9D 05:AD8D: 8D B6 06  STA ram_байт_2006_hi_графика
C - - - - - 0x016DA0 05:AD90: 60        RTS



sub_AD91:
C - - - - - 0x016DA1 05:AD91: A0 00     LDY #$00
bra_AD93:
C - - - - - 0x016DA3 05:AD93: B1 30     LDA (ram_0030),Y
C - - - - - 0x016DA5 05:AD95: 30 1B     BMI bra_ADB2
C - - - - - 0x016DA7 05:AD97: C9 10     CMP #$10
C - - - - - 0x016DA9 05:AD99: 90 17     BCC bra_ADB2
C - - - - - 0x016DAB 05:AD9B: C9 50     CMP #$50
C - - - - - 0x016DAD 05:AD9D: B0 09     BCS bra_ADA8
C - - - - - 0x016DAF 05:AD9F: 09 80     ORA #$80
C - - - - - 0x016DB1 05:ADA1: 99 B9 06  STA ram_буфер_графики,Y
C - - - - - 0x016DB4 05:ADA4: A5 1D     LDA ram_001D
C - - - - - 0x016DB6 05:ADA6: D0 0F     BNE bra_ADB7
bra_ADA8:
C - - - - - 0x016DB8 05:ADA8: 18        CLC
C - - - - - 0x016DB9 05:ADA9: 69 50     ADC #$50
C - - - - - 0x016DBB 05:ADAB: 99 B9 06  STA ram_буфер_графики,Y
C - - - - - 0x016DBE 05:ADAE: A5 1E     LDA ram_001E
C - - - - - 0x016DC0 05:ADB0: D0 05     BNE bra_ADB7
bra_ADB2:
C - - - - - 0x016DC2 05:ADB2: 99 B9 06  STA ram_буфер_графики,Y
C - - - - - 0x016DC5 05:ADB5: A5 1C     LDA ram_001C
bra_ADB7:
C - - - - - 0x016DC7 05:ADB7: 99 96 06  STA ram_буфер_атрибутов,Y
C - - - - - 0x016DCA 05:ADBA: C8        INY
C - - - - - 0x016DCB 05:ADBB: C4 1F     CPY ram_001F
C - - - - - 0x016DCD 05:ADBD: 90 D4     BCC bra_AD93
C - - - - - 0x016DCF 05:ADBF: 60        RTS



tbl_ADC0:
- D 1 - - - 0x016DD0 05:ADC0: C2 AD     .word tbl_ADC2

tbl_ADC2:
- - - - - - 0x016DD2 05:ADC2: 90        .byte $90   ; 
- - - - - - 0x016DD3 05:ADC3: AE        .byte $AE   ; 
- - - - - - 0x016DD4 05:ADC4: 6E        .byte $6E   ; 
- - - - - - 0x016DD5 05:ADC5: E2        .byte $E2   ; 
- - - - - - 0x016DD6 05:ADC6: AD        .byte $AD   ; 
- - - - - - 0x016DD7 05:ADC7: D2        .byte $D2   ; 
- - - - - - 0x016DD8 05:ADC8: D9        .byte $D9   ; 
- - - - - - 0x016DD9 05:ADC9: 2E        .byte $2E   ; 
- - - - - - 0x016DDA 05:ADCA: 91        .byte $91   ; 
- - - - - - 0x016DDB 05:ADCB: AE        .byte $AE   ; 
- - - - - - 0x016DDC 05:ADCC: 6E        .byte $6E   ; 
- - - - - - 0x016DDD 05:ADCD: E2        .byte $E2   ; 
- - - - - - 0x016DDE 05:ADCE: AC        .byte $AC   ; 
- - - - - - 0x016DDF 05:ADCF: 6F        .byte $6F   ; 
- - - - - - 0x016DE0 05:ADD0: D9        .byte $D9   ; 
- - - - - - 0x016DE1 05:ADD1: B1        .byte $B1   ; 
- - - - - - 0x016DE2 05:ADD2: 92        .byte $92   ; 
- - - - - - 0x016DE3 05:ADD3: AE        .byte $AE   ; 
- - - - - - 0x016DE4 05:ADD4: 6E        .byte $6E   ; 
- - - - - - 0x016DE5 05:ADD5: E2        .byte $E2   ; 
- - - - - - 0x016DE6 05:ADD6: 35        .byte $35   ; 
- - - - - - 0x016DE7 05:ADD7: C9        .byte $C9   ; 
- - - - - - 0x016DE8 05:ADD8: CF        .byte $CF   ; 
- - - - - - 0x016DE9 05:ADD9: A9        .byte $A9   ; 
- - - - - - 0x016DEA 05:ADDA: 93        .byte $93   ; 
- - - - - - 0x016DEB 05:ADDB: 2B        .byte $2B   ; 
- - - - - - 0x016DEC 05:ADDC: C2        .byte $C2   ; 
- - - - - - 0x016DED 05:ADDD: E2        .byte $E2   ; 
- - - - - - 0x016DEE 05:ADDE: B6        .byte $B6   ; 
- - - - - - 0x016DEF 05:ADDF: 27        .byte $27   ; 
- - - - - - 0x016DF0 05:ADE0: 29        .byte $29   ; 
- - - - - - 0x016DF1 05:ADE1: B3        .byte $B3   ; 
- D 1 - I - 0x016DF2 05:ADE2: 94        .byte $94   ; 
- D 1 - I - 0x016DF3 05:ADE3: A6        .byte $A6   ; 
- D 1 - I - 0x016DF4 05:ADE4: B7        .byte $B7   ; 
- D 1 - I - 0x016DF5 05:ADE5: D2        .byte $D2   ; 
- D 1 - I - 0x016DF6 05:ADE6: A4        .byte $A4   ; 
- D 1 - I - 0x016DF7 05:ADE7: B1        .byte $B1   ; 
- D 1 - I - 0x016DF8 05:ADE8: A6        .byte $A6   ; 
- D 1 - I - 0x016DF9 05:ADE9: CA        .byte $CA   ; 
- D 1 - I - 0x016DFA 05:ADEA: 95        .byte $95   ; 
- D 1 - I - 0x016DFB 05:ADEB: C0        .byte $C0   ; 
- D 1 - I - 0x016DFC 05:ADEC: CA        .byte $CA   ; 
- D 1 - I - 0x016DFD 05:ADED: BC        .byte $BC   ; 
- D 1 - I - 0x016DFE 05:ADEE: E2        .byte $E2   ; 
- D 1 - I - 0x016DFF 05:ADEF: 3C        .byte $3C   ; 
- D 1 - I - 0x016E00 05:ADF0: 34        .byte $34   ; 
- D 1 - I - 0x016E01 05:ADF1: A6        .byte $A6   ; 
- D 1 - I - 0x016E02 05:ADF2: 96        .byte $96   ; 
- D 1 - I - 0x016E03 05:ADF3: A2        .byte $A2   ; 
- D 1 - I - 0x016E04 05:ADF4: A3        .byte $A3   ; 
- D 1 - I - 0x016E05 05:ADF5: 35        .byte $35   ; 
- D 1 - I - 0x016E06 05:ADF6: CA        .byte $CA   ; 
- D 1 - I - 0x016E07 05:ADF7: E2        .byte $E2   ; 
- D 1 - I - 0x016E08 05:ADF8: 3F        .byte $3F   ; 
- D 1 - I - 0x016E09 05:ADF9: CF        .byte $CF   ; 
- D 1 - I - 0x016E0A 05:ADFA: 97        .byte $97   ; 
- D 1 - I - 0x016E0B 05:ADFB: B4        .byte $B4   ; 
- D 1 - I - 0x016E0C 05:ADFC: D5        .byte $D5   ; 
- D 1 - I - 0x016E0D 05:ADFD: 34        .byte $34   ; 
- D 1 - I - 0x016E0E 05:ADFE: D5        .byte $D5   ; 
- D 1 - I - 0x016E0F 05:ADFF: E2        .byte $E2   ; 
- D 1 - I - 0x016E10 05:AE00: 3E        .byte $3E   ; 
- D 1 - I - 0x016E11 05:AE01: A2        .byte $A2   ; 
- D 1 - I - 0x016E12 05:AE02: 98        .byte $98   ; 
- D 1 - I - 0x016E13 05:AE03: A2        .byte $A2   ; 
- D 1 - I - 0x016E14 05:AE04: B7        .byte $B7   ; 
- D 1 - I - 0x016E15 05:AE05: C3        .byte $C3   ; 
- D 1 - I - 0x016E16 05:AE06: E2        .byte $E2   ; 
- D 1 - I - 0x016E17 05:AE07: 3C        .byte $3C   ; 
- D 1 - I - 0x016E18 05:AE08: 34        .byte $34   ; 
- D 1 - I - 0x016E19 05:AE09: A6        .byte $A6   ; 
- D 1 - I - 0x016E1A 05:AE0A: 99        .byte $99   ; 
- D 1 - I - 0x016E1B 05:AE0B: A4        .byte $A4   ; 
- D 1 - I - 0x016E1C 05:AE0C: C3        .byte $C3   ; 
- D 1 - I - 0x016E1D 05:AE0D: 3F        .byte $3F   ; 
- D 1 - I - 0x016E1E 05:AE0E: AD        .byte $AD   ; 
- D 1 - I - 0x016E1F 05:AE0F: FF        .byte $FF   ; 
- D 1 - I - 0x016E20 05:AE10: FF        .byte $FF   ; 
- D 1 - I - 0x016E21 05:AE11: FF        .byte $FF   ; 
- D 1 - I - 0x016E22 05:AE12: 9A        .byte $9A   ; 
- D 1 - I - 0x016E23 05:AE13: AD        .byte $AD   ; 
- D 1 - I - 0x016E24 05:AE14: D1        .byte $D1   ; 
- D 1 - I - 0x016E25 05:AE15: AA        .byte $AA   ; 
- D 1 - I - 0x016E26 05:AE16: BA        .byte $BA   ; 
- D 1 - I - 0x016E27 05:AE17: BC        .byte $BC   ; 
- D 1 - I - 0x016E28 05:AE18: C4        .byte $C4   ; 
- D 1 - I - 0x016E29 05:AE19: BA        .byte $BA   ; 
- D 1 - I - 0x016E2A 05:AE1A: 9B        .byte $9B   ; 
- D 1 - I - 0x016E2B 05:AE1B: C1        .byte $C1   ; 
- D 1 - I - 0x016E2C 05:AE1C: AC        .byte $AC   ; 
- D 1 - I - 0x016E2D 05:AE1D: AB        .byte $AB   ; 
- D 1 - I - 0x016E2E 05:AE1E: BA        .byte $BA   ; 
- D 1 - I - 0x016E2F 05:AE1F: 02        .byte $02   ; 
- D 1 - I - 0x016E30 05:AE20: A2        .byte $A2   ; 
- D 1 - I - 0x016E31 05:AE21: A3        .byte $A3   ; 



sub_AE22:
C - - - - - 0x016E32 05:AE22: AD D1 05  LDA ram_05D1
C - - - - - 0x016E35 05:AE25: 8D 5E 05  STA ram_лицо_игрока + 2
C - - - - - 0x016E38 05:AE28: 60        RTS



sub_AE29:
C - - - - - 0x016E39 05:AE29: AD D1 05  LDA ram_05D1
C - - - - - 0x016E3C 05:AE2C: 8D CA 05  STA ram_номер_опции
C - - - - - 0x016E3F 05:AE2F: 60        RTS



sub_AE30:   ; bzk опт
C - - - - - 0x016E40 05:AE30: A9 04     LDA #$04
C - - - - - 0x016E42 05:AE32: 4C C0 AC  JMP loc_ACC0



tbl_AE35:   ; bzk опт
- D 1 - - - 0x016E45 05:AE35: 5F AE     .word tbl_AE5F

tbl_AE37:
- D 1 - - - 0x016E47 05:AE37: 00        .byte $00   ; 
- D 1 - - - 0x016E48 05:AE38: 10        .byte $10   ; 
- D 1 - - - 0x016E49 05:AE39: 10        .byte $10   ; 
- D 1 - - - 0x016E4A 05:AE3A: 10        .byte $10   ; 
- D 1 - - - 0x016E4B 05:AE3B: 20        .byte $20   ; 
- D 1 - - - 0x016E4C 05:AE3C: 10        .byte $10   ; 
- D 1 - - - 0x016E4D 05:AE3D: 30        .byte $30   ; 
- - - - - - 0x016E4E 05:AE3E: 00        .byte $00   ; 
- D 1 - - - 0x016E4F 05:AE3F: 00        .byte $00   ; 
- D 1 - - - 0x016E50 05:AE40: 40        .byte $40   ; 
- D 1 - - - 0x016E51 05:AE41: 10        .byte $10   ; 
- D 1 - - - 0x016E52 05:AE42: 10        .byte $10   ; 
- D 1 - - - 0x016E53 05:AE43: 20        .byte $20   ; 
- D 1 - - - 0x016E54 05:AE44: 50        .byte $50   ; 
- D 1 - - - 0x016E55 05:AE45: 30        .byte $30   ; 
- - - - - - 0x016E56 05:AE46: 00        .byte $00   ; 
- D 1 - - - 0x016E57 05:AE47: 60        .byte $60   ; 
- D 1 - - - 0x016E58 05:AE48: 70        .byte $70   ; 
- D 1 - - - 0x016E59 05:AE49: 80        .byte $80   ; 
- D 1 - - - 0x016E5A 05:AE4A: 90        .byte $90   ; 
- D 1 - - - 0x016E5B 05:AE4B: A0        .byte $A0   ; 
- D 1 - - - 0x016E5C 05:AE4C: B0        .byte $B0   ; 
- D 1 - - - 0x016E5D 05:AE4D: C0        .byte $C0   ; 
- - - - - - 0x016E5E 05:AE4E: 00        .byte $00   ; 
- D 1 - - - 0x016E5F 05:AE4F: 00        .byte $00   ; 
- D 1 - - - 0x016E60 05:AE50: 10        .byte $10   ; 
- D 1 - - - 0x016E61 05:AE51: 10        .byte $10   ; 
- D 1 - - - 0x016E62 05:AE52: 10        .byte $10   ; 
- D 1 - - - 0x016E63 05:AE53: 20        .byte $20   ; 
- D 1 - - - 0x016E64 05:AE54: 10        .byte $10   ; 
- D 1 - - - 0x016E65 05:AE55: 30        .byte $30   ; 
- - - - - - 0x016E66 05:AE56: 00        .byte $00   ; 
- D 1 - - - 0x016E67 05:AE57: D0        .byte $D0   ; 
- D 1 - - - 0x016E68 05:AE58: E0        .byte $E0   ; 
- D 1 - - - 0x016E69 05:AE59: E0        .byte $E0   ; 
- D 1 - - - 0x016E6A 05:AE5A: E0        .byte $E0   ; 
- D 1 - - - 0x016E6B 05:AE5B: E0        .byte $E0   ; 
- D 1 - - - 0x016E6C 05:AE5C: E0        .byte $E0   ; 
- D 1 - - - 0x016E6D 05:AE5D: F0        .byte $F0   ; 
- - - - - - 0x016E6E 05:AE5E: 00        .byte $00   ; 



tbl_AE5F:
- D 1 - I - 0x016E6F 05:AE5F: 67        .byte $67   ; 
- D 1 - I - 0x016E70 05:AE60: 05        .byte $05   ; 
- D 1 - I - 0x016E71 05:AE61: 1D        .byte $1D   ; 
- D 1 - I - 0x016E72 05:AE62: CB        .byte $CB   ; 
- D 1 - I - 0x016E73 05:AE63: B7        .byte $B7   ; 
- D 1 - I - 0x016E74 05:AE64: 05        .byte $05   ; 
- D 1 - I - 0x016E75 05:AE65: 68        .byte $68   ; 
- D 1 - I - 0x016E76 05:AE66: 02        .byte $02   ; 
- D 1 - I - 0x016E77 05:AE67: 02        .byte $02   ; 
- D 1 - I - 0x016E78 05:AE68: 02        .byte $02   ; 
- D 1 - I - 0x016E79 05:AE69: 02        .byte $02   ; 
- D 1 - I - 0x016E7A 05:AE6A: 02        .byte $02   ; 
- D 1 - I - 0x016E7B 05:AE6B: 02        .byte $02   ; 
- D 1 - I - 0x016E7C 05:AE6C: 02        .byte $02   ; 
- D 1 - I - 0x016E7D 05:AE6D: 02        .byte $02   ; 
- D 1 - I - 0x016E7E 05:AE6E: 02        .byte $02   ; 
- D 1 - I - 0x016E7F 05:AE6F: 5D        .byte $5D   ; 
- D 1 - I - 0x016E80 05:AE70: 02        .byte $02   ; 
- D 1 - I - 0x016E81 05:AE71: 02        .byte $02   ; 
- D 1 - I - 0x016E82 05:AE72: 02        .byte $02   ; 
- D 1 - I - 0x016E83 05:AE73: 02        .byte $02   ; 
- D 1 - I - 0x016E84 05:AE74: 02        .byte $02   ; 
- D 1 - I - 0x016E85 05:AE75: 5E        .byte $5E   ; 
- D 1 - I - 0x016E86 05:AE76: 02        .byte $02   ; 
- D 1 - I - 0x016E87 05:AE77: 02        .byte $02   ; 
- D 1 - I - 0x016E88 05:AE78: 02        .byte $02   ; 
- D 1 - I - 0x016E89 05:AE79: 02        .byte $02   ; 
- D 1 - I - 0x016E8A 05:AE7A: 02        .byte $02   ; 
- D 1 - I - 0x016E8B 05:AE7B: 02        .byte $02   ; 
- D 1 - I - 0x016E8C 05:AE7C: 02        .byte $02   ; 
- D 1 - I - 0x016E8D 05:AE7D: 02        .byte $02   ; 
- D 1 - I - 0x016E8E 05:AE7E: 02        .byte $02   ; 
- D 1 - I - 0x016E8F 05:AE7F: 75        .byte $75   ; 
- D 1 - I - 0x016E90 05:AE80: 59        .byte $59   ; 
- D 1 - I - 0x016E91 05:AE81: 59        .byte $59   ; 
- D 1 - I - 0x016E92 05:AE82: 59        .byte $59   ; 
- D 1 - I - 0x016E93 05:AE83: 59        .byte $59   ; 
- D 1 - I - 0x016E94 05:AE84: 59        .byte $59   ; 
- D 1 - I - 0x016E95 05:AE85: 6F        .byte $6F   ; 
- D 1 - I - 0x016E96 05:AE86: 02        .byte $02   ; 
- D 1 - I - 0x016E97 05:AE87: 02        .byte $02   ; 
- D 1 - I - 0x016E98 05:AE88: 02        .byte $02   ; 
- D 1 - I - 0x016E99 05:AE89: 02        .byte $02   ; 
- D 1 - I - 0x016E9A 05:AE8A: 02        .byte $02   ; 
- D 1 - I - 0x016E9B 05:AE8B: 02        .byte $02   ; 
- D 1 - I - 0x016E9C 05:AE8C: 02        .byte $02   ; 
- D 1 - I - 0x016E9D 05:AE8D: 02        .byte $02   ; 
- D 1 - I - 0x016E9E 05:AE8E: 02        .byte $02   ; 
- D 1 - I - 0x016E9F 05:AE8F: 6A        .byte $6A   ; 
- D 1 - I - 0x016EA0 05:AE90: 05        .byte $05   ; 
- D 1 - I - 0x016EA1 05:AE91: 05        .byte $05   ; 
- D 1 - I - 0x016EA2 05:AE92: 05        .byte $05   ; 
- D 1 - I - 0x016EA3 05:AE93: 05        .byte $05   ; 
- D 1 - I - 0x016EA4 05:AE94: 05        .byte $05   ; 
- D 1 - I - 0x016EA5 05:AE95: 69        .byte $69   ; 
- D 1 - I - 0x016EA6 05:AE96: 02        .byte $02   ; 
- D 1 - I - 0x016EA7 05:AE97: 02        .byte $02   ; 
- D 1 - I - 0x016EA8 05:AE98: 02        .byte $02   ; 
- D 1 - I - 0x016EA9 05:AE99: 02        .byte $02   ; 
- D 1 - I - 0x016EAA 05:AE9A: 02        .byte $02   ; 
- D 1 - I - 0x016EAB 05:AE9B: 02        .byte $02   ; 
- D 1 - I - 0x016EAC 05:AE9C: 02        .byte $02   ; 
- D 1 - I - 0x016EAD 05:AE9D: 02        .byte $02   ; 
- D 1 - I - 0x016EAE 05:AE9E: 02        .byte $02   ; 
- D 1 - I - 0x016EAF 05:AE9F: 5D        .byte $5D   ; 
- D 1 - I - 0x016EB0 05:AEA0: 02        .byte $02   ; 
- D 1 - I - 0x016EB1 05:AEA1: 02        .byte $02   ; 
- D 1 - I - 0x016EB2 05:AEA2: 02        .byte $02   ; 
- D 1 - I - 0x016EB3 05:AEA3: 02        .byte $02   ; 
- D 1 - I - 0x016EB4 05:AEA4: 02        .byte $02   ; 
- D 1 - I - 0x016EB5 05:AEA5: 5E        .byte $5E   ; 
- D 1 - I - 0x016EB6 05:AEA6: 05        .byte $05   ; 
- D 1 - I - 0x016EB7 05:AEA7: 05        .byte $05   ; 
- D 1 - I - 0x016EB8 05:AEA8: B6        .byte $B6   ; 
- D 1 - I - 0x016EB9 05:AEA9: B7        .byte $B7   ; 
- D 1 - I - 0x016EBA 05:AEAA: CE        .byte $CE   ; 
- D 1 - I - 0x016EBB 05:AEAB: DE        .byte $DE   ; 
- D 1 - I - 0x016EBC 05:AEAC: 05        .byte $05   ; 
- D 1 - I - 0x016EBD 05:AEAD: 05        .byte $05   ; 
- D 1 - I - 0x016EBE 05:AEAE: 05        .byte $05   ; 
- D 1 - I - 0x016EBF 05:AEAF: 5D        .byte $5D   ; 
- D 1 - I - 0x016EC0 05:AEB0: 02        .byte $02   ; 
- D 1 - I - 0x016EC1 05:AEB1: 02        .byte $02   ; 
- D 1 - I - 0x016EC2 05:AEB2: 02        .byte $02   ; 
- D 1 - I - 0x016EC3 05:AEB3: 02        .byte $02   ; 
- D 1 - I - 0x016EC4 05:AEB4: 02        .byte $02   ; 
- D 1 - I - 0x016EC5 05:AEB5: 5E        .byte $5E   ; 
- D 1 - I - 0x016EC6 05:AEB6: 05        .byte $05   ; 
- D 1 - I - 0x016EC7 05:AEB7: 05        .byte $05   ; 
- D 1 - I - 0x016EC8 05:AEB8: 05        .byte $05   ; 
- D 1 - I - 0x016EC9 05:AEB9: 05        .byte $05   ; 
- D 1 - I - 0x016ECA 05:AEBA: 05        .byte $05   ; 
- D 1 - I - 0x016ECB 05:AEBB: 05        .byte $05   ; 
- D 1 - I - 0x016ECC 05:AEBC: 05        .byte $05   ; 
- D 1 - I - 0x016ECD 05:AEBD: 05        .byte $05   ; 
- D 1 - I - 0x016ECE 05:AEBE: 05        .byte $05   ; 
- D 1 - I - 0x016ECF 05:AEBF: 78        .byte $78   ; 
- D 1 - I - 0x016ED0 05:AEC0: 02        .byte $02   ; 
- D 1 - I - 0x016ED1 05:AEC1: 02        .byte $02   ; 
- D 1 - I - 0x016ED2 05:AEC2: 02        .byte $02   ; 
- D 1 - I - 0x016ED3 05:AEC3: 02        .byte $02   ; 
- D 1 - I - 0x016ED4 05:AEC4: 02        .byte $02   ; 
- D 1 - I - 0x016ED5 05:AEC5: 02        .byte $02   ; 
- D 1 - I - 0x016ED6 05:AEC6: DA        .byte $DA   ; 
- D 1 - I - 0x016ED7 05:AEC7: 02        .byte $02   ; 
- D 1 - I - 0x016ED8 05:AEC8: 02        .byte $02   ; 
- D 1 - I - 0x016ED9 05:AEC9: 02        .byte $02   ; 
- D 1 - I - 0x016EDA 05:AECA: 02        .byte $02   ; 
- D 1 - I - 0x016EDB 05:AECB: 02        .byte $02   ; 
- D 1 - I - 0x016EDC 05:AECC: 02        .byte $02   ; 
- D 1 - I - 0x016EDD 05:AECD: 02        .byte $02   ; 
- D 1 - I - 0x016EDE 05:AECE: 02        .byte $02   ; 
- D 1 - I - 0x016EDF 05:AECF: 79        .byte $79   ; 
- D 1 - I - 0x016EE0 05:AED0: 02        .byte $02   ; 
- D 1 - I - 0x016EE1 05:AED1: 05        .byte $05   ; 
- D 1 - I - 0x016EE2 05:AED2: 05        .byte $05   ; 
- D 1 - I - 0x016EE3 05:AED3: 05        .byte $05   ; 
- D 1 - I - 0x016EE4 05:AED4: 05        .byte $05   ; 
- D 1 - I - 0x016EE5 05:AED5: 02        .byte $02   ; 
- D 1 - I - 0x016EE6 05:AED6: B1        .byte $B1   ; 
- D 1 - I - 0x016EE7 05:AED7: CB        .byte $CB   ; 
- D 1 - I - 0x016EE8 05:AED8: B7        .byte $B7   ; 
- D 1 - I - 0x016EE9 05:AED9: 02        .byte $02   ; 
- D 1 - I - 0x016EEA 05:AEDA: 05        .byte $05   ; 
- D 1 - I - 0x016EEB 05:AEDB: 05        .byte $05   ; 
- D 1 - I - 0x016EEC 05:AEDC: 05        .byte $05   ; 
- D 1 - I - 0x016EED 05:AEDD: 05        .byte $05   ; 
- D 1 - I - 0x016EEE 05:AEDE: 05        .byte $05   ; 
- D 1 - I - 0x016EEF 05:AEDF: 79        .byte $79   ; 
- D 1 - I - 0x016EF0 05:AEE0: 02        .byte $02   ; 
- D 1 - I - 0x016EF1 05:AEE1: 02        .byte $02   ; 
- D 1 - I - 0x016EF2 05:AEE2: 02        .byte $02   ; 
- D 1 - I - 0x016EF3 05:AEE3: 02        .byte $02   ; 
- D 1 - I - 0x016EF4 05:AEE4: 02        .byte $02   ; 
- D 1 - I - 0x016EF5 05:AEE5: 02        .byte $02   ; 
- D 1 - I - 0x016EF6 05:AEE6: 02        .byte $02   ; 
- D 1 - I - 0x016EF7 05:AEE7: 02        .byte $02   ; 
- D 1 - I - 0x016EF8 05:AEE8: 02        .byte $02   ; 
- D 1 - I - 0x016EF9 05:AEE9: 02        .byte $02   ; 
- D 1 - I - 0x016EFA 05:AEEA: 02        .byte $02   ; 
- D 1 - I - 0x016EFB 05:AEEB: DA        .byte $DA   ; 
- D 1 - I - 0x016EFC 05:AEEC: 02        .byte $02   ; 
- D 1 - I - 0x016EFD 05:AEED: DB        .byte $DB   ; 
- D 1 - I - 0x016EFE 05:AEEE: 02        .byte $02   ; 
- D 1 - I - 0x016EFF 05:AEEF: 79        .byte $79   ; 
- D 1 - I - 0x016F00 05:AEF0: 02        .byte $02   ; 
- D 1 - I - 0x016F01 05:AEF1: 02        .byte $02   ; 
- D 1 - I - 0x016F02 05:AEF2: C1        .byte $C1   ; 
- D 1 - I - 0x016F03 05:AEF3: AC        .byte $AC   ; 
- D 1 - I - 0x016F04 05:AEF4: AB        .byte $AB   ; 
- D 1 - I - 0x016F05 05:AEF5: 02        .byte $02   ; 
- D 1 - I - 0x016F06 05:AEF6: 02        .byte $02   ; 
- D 1 - I - 0x016F07 05:AEF7: B4        .byte $B4   ; 
- D 1 - I - 0x016F08 05:AEF8: A9        .byte $A9   ; 
- D 1 - I - 0x016F09 05:AEF9: BA        .byte $BA   ; 
- D 1 - I - 0x016F0A 05:AEFA: AE        .byte $AE   ; 
- D 1 - I - 0x016F0B 05:AEFB: AD        .byte $AD   ; 
- D 1 - I - 0x016F0C 05:AEFC: D1        .byte $D1   ; 
- D 1 - I - 0x016F0D 05:AEFD: BB        .byte $BB   ; 
- D 1 - I - 0x016F0E 05:AEFE: CF        .byte $CF   ; 
- D 1 - I - 0x016F0F 05:AEFF: 79        .byte $79   ; 
- D 1 - I - 0x016F10 05:AF00: 02        .byte $02   ; 
- D 1 - I - 0x016F11 05:AF01: 02        .byte $02   ; 
- D 1 - I - 0x016F12 05:AF02: 02        .byte $02   ; 
- D 1 - I - 0x016F13 05:AF03: 02        .byte $02   ; 
- D 1 - I - 0x016F14 05:AF04: 02        .byte $02   ; 
- D 1 - I - 0x016F15 05:AF05: 02        .byte $02   ; 
- D 1 - I - 0x016F16 05:AF06: 02        .byte $02   ; 
- D 1 - I - 0x016F17 05:AF07: 02        .byte $02   ; 
- D 1 - I - 0x016F18 05:AF08: DA        .byte $DA   ; 
- D 1 - I - 0x016F19 05:AF09: 02        .byte $02   ; 
- D 1 - I - 0x016F1A 05:AF0A: 02        .byte $02   ; 
- D 1 - I - 0x016F1B 05:AF0B: DA        .byte $DA   ; 
- D 1 - I - 0x016F1C 05:AF0C: 02        .byte $02   ; 
- D 1 - I - 0x016F1D 05:AF0D: 02        .byte $02   ; 
- D 1 - I - 0x016F1E 05:AF0E: 02        .byte $02   ; 
- D 1 - I - 0x016F1F 05:AF0F: 79        .byte $79   ; 
- D 1 - I - 0x016F20 05:AF10: 02        .byte $02   ; 
- D 1 - I - 0x016F21 05:AF11: 02        .byte $02   ; 
- D 1 - I - 0x016F22 05:AF12: B1        .byte $B1   ; 
- D 1 - I - 0x016F23 05:AF13: A7        .byte $A7   ; 
- D 1 - I - 0x016F24 05:AF14: AD        .byte $AD   ; 
- D 1 - I - 0x016F25 05:AF15: 02        .byte $02   ; 
- D 1 - I - 0x016F26 05:AF16: 02        .byte $02   ; 
- D 1 - I - 0x016F27 05:AF17: A2        .byte $A2   ; 
- D 1 - I - 0x016F28 05:AF18: BD        .byte $BD   ; 
- D 1 - I - 0x016F29 05:AF19: B6        .byte $B6   ; 
- D 1 - I - 0x016F2A 05:AF1A: A3        .byte $A3   ; 
- D 1 - I - 0x016F2B 05:AF1B: B1        .byte $B1   ; 
- D 1 - I - 0x016F2C 05:AF1C: A3        .byte $A3   ; 
- D 1 - I - 0x016F2D 05:AF1D: C5        .byte $C5   ; 
- D 1 - I - 0x016F2E 05:AF1E: CA        .byte $CA   ; 
- D 1 - I - 0x016F2F 05:AF1F: 7A        .byte $7A   ; 
- D 1 - I - 0x016F30 05:AF20: 02        .byte $02   ; 
- D 1 - I - 0x016F31 05:AF21: 05        .byte $05   ; 
- D 1 - I - 0x016F32 05:AF22: 05        .byte $05   ; 
- D 1 - I - 0x016F33 05:AF23: 05        .byte $05   ; 
- D 1 - I - 0x016F34 05:AF24: 05        .byte $05   ; 
- D 1 - I - 0x016F35 05:AF25: 05        .byte $05   ; 
- D 1 - I - 0x016F36 05:AF26: 05        .byte $05   ; 
- D 1 - I - 0x016F37 05:AF27: 05        .byte $05   ; 
- D 1 - I - 0x016F38 05:AF28: 05        .byte $05   ; 
- D 1 - I - 0x016F39 05:AF29: 05        .byte $05   ; 
- D 1 - I - 0x016F3A 05:AF2A: 05        .byte $05   ; 
- D 1 - I - 0x016F3B 05:AF2B: 05        .byte $05   ; 
- D 1 - I - 0x016F3C 05:AF2C: 05        .byte $05   ; 
- D 1 - I - 0x016F3D 05:AF2D: 05        .byte $05   ; 
- D 1 - I - 0x016F3E 05:AF2E: 05        .byte $05   ; 
- D 1 - I - 0x016F3F 05:AF2F: 78        .byte $78   ; 
- D 1 - I - 0x016F40 05:AF30: 02        .byte $02   ; 
- D 1 - I - 0x016F41 05:AF31: 02        .byte $02   ; 
- D 1 - I - 0x016F42 05:AF32: 02        .byte $02   ; 
- D 1 - I - 0x016F43 05:AF33: 02        .byte $02   ; 
- D 1 - I - 0x016F44 05:AF34: 02        .byte $02   ; 
- D 1 - I - 0x016F45 05:AF35: 02        .byte $02   ; 
- D 1 - I - 0x016F46 05:AF36: 02        .byte $02   ; 
- D 1 - I - 0x016F47 05:AF37: 02        .byte $02   ; 
- D 1 - I - 0x016F48 05:AF38: 02        .byte $02   ; 
- D 1 - I - 0x016F49 05:AF39: 02        .byte $02   ; 
- D 1 - I - 0x016F4A 05:AF3A: 02        .byte $02   ; 
- D 1 - I - 0x016F4B 05:AF3B: 02        .byte $02   ; 
- D 1 - I - 0x016F4C 05:AF3C: 02        .byte $02   ; 
- D 1 - I - 0x016F4D 05:AF3D: 02        .byte $02   ; 
- D 1 - I - 0x016F4E 05:AF3E: 02        .byte $02   ; 
- D 1 - I - 0x016F4F 05:AF3F: 79        .byte $79   ; 
- D 1 - I - 0x016F50 05:AF40: 02        .byte $02   ; 
- D 1 - I - 0x016F51 05:AF41: 02        .byte $02   ; 
- D 1 - I - 0x016F52 05:AF42: 02        .byte $02   ; 
- D 1 - I - 0x016F53 05:AF43: 02        .byte $02   ; 
- D 1 - I - 0x016F54 05:AF44: 02        .byte $02   ; 
- D 1 - I - 0x016F55 05:AF45: 02        .byte $02   ; 
- D 1 - I - 0x016F56 05:AF46: 02        .byte $02   ; 
- D 1 - I - 0x016F57 05:AF47: 02        .byte $02   ; 
- D 1 - I - 0x016F58 05:AF48: 02        .byte $02   ; 
- D 1 - I - 0x016F59 05:AF49: 02        .byte $02   ; 
- D 1 - I - 0x016F5A 05:AF4A: 02        .byte $02   ; 
- D 1 - I - 0x016F5B 05:AF4B: 02        .byte $02   ; 
- D 1 - I - 0x016F5C 05:AF4C: 02        .byte $02   ; 
- D 1 - I - 0x016F5D 05:AF4D: 02        .byte $02   ; 
- D 1 - I - 0x016F5E 05:AF4E: 02        .byte $02   ; 
- D 1 - I - 0x016F5F 05:AF4F: 7A        .byte $7A   ; 
- D 1 - I - 0x016F60 05:AF50: 02        .byte $02   ; 
- D 1 - I - 0x016F61 05:AF51: 02        .byte $02   ; 
- D 1 - I - 0x016F62 05:AF52: 02        .byte $02   ; 
- D 1 - I - 0x016F63 05:AF53: 02        .byte $02   ; 
- D 1 - I - 0x016F64 05:AF54: 02        .byte $02   ; 
- D 1 - I - 0x016F65 05:AF55: 02        .byte $02   ; 
- D 1 - I - 0x016F66 05:AF56: 02        .byte $02   ; 
- D 1 - I - 0x016F67 05:AF57: 02        .byte $02   ; 
- D 1 - I - 0x016F68 05:AF58: 02        .byte $02   ; 
- D 1 - I - 0x016F69 05:AF59: 02        .byte $02   ; 
- D 1 - I - 0x016F6A 05:AF5A: 02        .byte $02   ; 
- D 1 - I - 0x016F6B 05:AF5B: 02        .byte $02   ; 
- D 1 - I - 0x016F6C 05:AF5C: 02        .byte $02   ; 
- D 1 - I - 0x016F6D 05:AF5D: 02        .byte $02   ; 
- D 1 - I - 0x016F6E 05:AF5E: 02        .byte $02   ; 



sub_AF5F:
C - - - - - 0x016F6F 05:AF5F: AD D1 05  LDA ram_05D1
C - - - - - 0x016F72 05:AF62: 20 33 B2  JSR sub_B233
C - - - - - 0x016F75 05:AF65: AD CA 05  LDA ram_номер_опции
C - - - - - 0x016F78 05:AF68: 20 4C B2  JSR sub_B24C
C - - - - - 0x016F7B 05:AF6B: A5 20     LDA ram_0020
C - - - - - 0x016F7D 05:AF6D: 29 03     AND #$03
C - - - - - 0x016F7F 05:AF6F: 18        CLC
C - - - - - 0x016F80 05:AF70: 69 24     ADC #$24
C - - - - - 0x016F82 05:AF72: 8D 06 06  STA ram_0606
C - - - - - 0x016F85 05:AF75: AD CA 05  LDA ram_номер_опции
C - - - - - 0x016F88 05:AF78: C9 05     CMP #$05
C - - - - - 0x016F8A 05:AF7A: B0 10     BCS bra_AF8C_RTS
C - - - - - 0x016F8C 05:AF7C: 20 53 C0  JSR sub_0x01EC9F_jump_to_pointers_after_JSR
- - - - - - 0x016F8F 05:AF7F: 8D AF     .word ofs_AF8D_00
- - - - - - 0x016F91 05:AF81: A1 AF     .word ofs_AFA1_01
- - - - - - 0x016F93 05:AF83: B1 AF     .word ofs_AFB1_02
- - - - - - 0x016F95 05:AF85: 97 AF     .word ofs_AF97_03
- D 1 - I - 0x016F97 05:AF87: B7 AF     .word ofs_AFB7_04



bra_AF89:
C - - - - - 0x016F99 05:AF89: 99 D5 05  STA ram_05D5,Y
bra_AF8C_RTS:
C - - - - - 0x016F9C 05:AF8C: 60        RTS



ofs_AF8D_00:
- - - - - - 0x016F9D 05:AF8D: AC D1 05  LDY ram_05D1
- - - - - - 0x016FA0 05:AF90: B9 D5 05  LDA ram_05D5,Y
- - - - - - 0x016FA3 05:AF93: 09 80     ORA #$80
- - - - - - 0x016FA5 05:AF95: D0 F2     BNE bra_AF89



ofs_AF97_03:
- - - - - - 0x016FA7 05:AF97: AC D1 05  LDY ram_05D1
- - - - - - 0x016FAA 05:AF9A: B9 D5 05  LDA ram_05D5,Y
- - - - - - 0x016FAD 05:AF9D: 09 40     ORA #$40
- - - - - - 0x016FAF 05:AF9F: D0 E8     BNE bra_AF89



ofs_AFA1_01:
- - - - - - 0x016FB1 05:AFA1: A9 10     LDA #$10
- - - - - - 0x016FB3 05:AFA3: 85 1C     STA ram_001C
bra_AFA5:
C - - - - - 0x016FB5 05:AFA5: AC D1 05  LDY ram_05D1
C - - - - - 0x016FB8 05:AFA8: B9 D5 05  LDA ram_05D5,Y
C - - - - - 0x016FBB 05:AFAB: 29 CF     AND #$CF
C - - - - - 0x016FBD 05:AFAD: 05 1C     ORA ram_001C
C - - - - - 0x016FBF 05:AFAF: D0 D8     BNE bra_AF89



ofs_AFB1_02:
- - - - - - 0x016FC1 05:AFB1: A9 20     LDA #$20
- - - - - - 0x016FC3 05:AFB3: 85 1C     STA ram_001C
- - - - - - 0x016FC5 05:AFB5: D0 EE     BNE bra_AFA5



ofs_AFB7_04:
C - - J - - 0x016FC7 05:AFB7: A9 30     LDA #$30
C - - - - - 0x016FC9 05:AFB9: 85 1C     STA ram_001C
C - - - - - 0x016FCB 05:AFBB: D0 E8     BNE bra_AFA5



sub_AFBD:
C - - - - - 0x016FCD 05:AFBD: AD D0 05  LDA ram_05D0
C - - - - - 0x016FD0 05:AFC0: 20 53 C0  JSR sub_0x01EC9F_jump_to_pointers_after_JSR
- D 1 - I - 0x016FD3 05:AFC3: CF AF     .word ofs_AFCF_00
- D 1 - I - 0x016FD5 05:AFC5: D9 AF     .word ofs_AFD9_01
- D 1 - I - 0x016FD7 05:AFC7: F7 AF     .word ofs_AFF7_02
- D 1 - I - 0x016FD9 05:AFC9: FF AF     .word ofs_AFFF_03


; bzk стремно
bra_AFCB:
C - - - - - 0x016FDB 05:AFCB: 8D 06 06  STA ram_0606
C - - - - - 0x016FDE 05:AFCE: 60        RTS



ofs_AFCF_00:
C - - J - - 0x016FDF 05:AFCF: AD 00 03  LDA ram_frame_cnt
C - - - - - 0x016FE2 05:AFD2: 29 03     AND #$03
C - - - - - 0x016FE4 05:AFD4: 18        CLC
C - - - - - 0x016FE5 05:AFD5: 69 28     ADC #$28
C - - - - - 0x016FE7 05:AFD7: D0 F2     BNE bra_AFCB



ofs_AFD9_01:
C - - J - - 0x016FE9 05:AFD9: 38        SEC
C - - - - - 0x016FEA 05:AFDA: A9 10     LDA #$10
C - - - - - 0x016FEC 05:AFDC: ED 58 05  SBC ram_0558
C - - - - - 0x016FEF 05:AFDF: B0 02     BCS bra_AFE3
- - - - - - 0x016FF1 05:AFE1: A9 00     LDA #$00
bra_AFE3:
C - - - - - 0x016FF3 05:AFE3: 20 6A B2  JSR sub_B26A
C - - - - - 0x016FF6 05:AFE6: 38        SEC
C - - - - - 0x016FF7 05:AFE7: A9 46     LDA #$46
C - - - - - 0x016FF9 05:AFE9: ED 55 05  SBC ram_0555
C - - - - - 0x016FFC 05:AFEC: B0 02     BCS bra_AFF0
- - - - - - 0x016FFE 05:AFEE: A9 00     LDA #$00
bra_AFF0:
C - - - - - 0x017000 05:AFF0: 20 65 B2  JSR sub_B265
C - - - - - 0x017003 05:AFF3: A9 33     LDA #$33
C - - - - - 0x017005 05:AFF5: D0 D4     BNE bra_AFCB



ofs_AFF7_02:
C - - J - - 0x017007 05:AFF7: 18        CLC
C - - - - - 0x017008 05:AFF8: A9 2C     LDA #$2C
C - - - - - 0x01700A 05:AFFA: 6D E1 05  ADC ram_05E1
C - - - - - 0x01700D 05:AFFD: D0 CC     BNE bra_AFCB



ofs_AFFF_03:
C - - J - - 0x01700F 05:AFFF: AD 00 03  LDA ram_frame_cnt
C - - - - - 0x017012 05:B002: 29 01     AND #$01
C - - - - - 0x017014 05:B004: 18        CLC
C - - - - - 0x017015 05:B005: 69 34     ADC #$34
C - - - - - 0x017017 05:B007: D0 C2     BNE bra_AFCB



sub_B009:
C - - - - - 0x017019 05:B009: 85 1C     STA ram_001C
C - - - - - 0x01701B 05:B00B: 84 1D     STY ram_001D
C - - - - - 0x01701D 05:B00D: 98        TYA
C - - - - - 0x01701E 05:B00E: 0A        ASL
C - - - - - 0x01701F 05:B00F: 65 1D     ADC ram_001D
C - - - - - 0x017021 05:B011: A8        TAY
C - - - - - 0x017022 05:B012: B9 84 B0  LDA tbl_B084,Y
C - - - - - 0x017025 05:B015: 85 1E     STA ram_001E
C - - - - - 0x017027 05:B017: B9 85 B0  LDA tbl_B085,Y
C - - - - - 0x01702A 05:B01A: 85 1F     STA ram_001F
C - - - - - 0x01702C 05:B01C: B9 86 B0  LDA tbl_B086,Y
C - - - - - 0x01702F 05:B01F: 85 20     STA ram_0020
C - - - - - 0x017031 05:B021: 38        SEC
C - - - - - 0x017032 05:B022: A9 0B     LDA #$0B
C - - - - - 0x017034 05:B024: E5 1C     SBC ram_001C
C - - - - - 0x017036 05:B026: A8        TAY
loc_B027:
C D 1 - - - 0x017037 05:B027: 88        DEY
C - - - - - 0x017038 05:B028: 30 0F     BMI bra_B039
C - - - - - 0x01703A 05:B02A: 46 1E     LSR ram_001E
C - - - - - 0x01703C 05:B02C: 66 1F     ROR ram_001F
C - - - - - 0x01703E 05:B02E: 66 20     ROR ram_0020
C - - - - - 0x017040 05:B030: 46 1E     LSR ram_001E
C - - - - - 0x017042 05:B032: 66 1F     ROR ram_001F
C - - - - - 0x017044 05:B034: 66 20     ROR ram_0020
C - - - - - 0x017046 05:B036: 4C 27 B0  JMP loc_B027
bra_B039:
C - - - - - 0x017049 05:B039: A5 20     LDA ram_0020
C - - - - - 0x01704B 05:B03B: 29 03     AND #$03
C - - - - - 0x01704D 05:B03D: F0 33     BEQ bra_B072
C - - - - - 0x01704F 05:B03F: C9 03     CMP #$03
C - - - - - 0x017051 05:B041: D0 05     BNE bra_B048
loc_B043:
C D 1 - - - 0x017053 05:B043: 20 05 C0  JSR sub_0x01EE45_вращение_рандома
C - - - - - 0x017056 05:B046: 29 07     AND #$07
bra_B048:
C - - - - - 0x017058 05:B048: A8        TAY
C - - - - - 0x017059 05:B049: 18        CLC
C - - - - - 0x01705A 05:B04A: B9 7C B0  LDA tbl_B07C,Y
C - - - - - 0x01705D 05:B04D: F0 23     BEQ bra_B072
C - - - - - 0x01705F 05:B04F: 85 1E     STA ram_001E
C - - - - - 0x017061 05:B051: A4 1D     LDY ram_001D
C - - - - - 0x017063 05:B053: B9 D5 05  LDA ram_05D5,Y
C - - - - - 0x017066 05:B056: 29 0F     AND #$0F
C - - - - - 0x017068 05:B058: 65 1E     ADC ram_001E
C - - - - - 0x01706A 05:B05A: 30 08     BMI bra_B064
C - - - - - 0x01706C 05:B05C: C9 10     CMP #$10
C - - - - - 0x01706E 05:B05E: 90 06     BCC bra_B066
- - - - - - 0x017070 05:B060: A9 0F     LDA #$0F
- - - - - - 0x017072 05:B062: D0 02     BNE bra_B066
bra_B064:
- - - - - - 0x017074 05:B064: A9 00     LDA #$00
bra_B066:
C - - - - - 0x017076 05:B066: 85 1E     STA ram_001E
C - - - - - 0x017078 05:B068: B9 D5 05  LDA ram_05D5,Y
C - - - - - 0x01707B 05:B06B: 29 F0     AND #$F0
C - - - - - 0x01707D 05:B06D: 05 1E     ORA ram_001E
C - - - - - 0x01707F 05:B06F: 99 D5 05  STA ram_05D5,Y
bra_B072:
C - - - - - 0x017082 05:B072: A4 1D     LDY ram_001D
C - - - - - 0x017084 05:B074: A5 1C     LDA ram_001C
C - - - - - 0x017086 05:B076: 60        RTS



sub_B077:
C - - - - - 0x017087 05:B077: 84 1D     STY ram_001D
C - - - - - 0x017089 05:B079: 4C 43 B0  JMP loc_B043



tbl_B07C:
- D 1 - - - 0x01708C 05:B07C: 01        .byte $01   ; 
- D 1 - - - 0x01708D 05:B07D: 02        .byte $02   ; 
- D 1 - - - 0x01708E 05:B07E: FE        .byte $FE   ; 
- D 1 - - - 0x01708F 05:B07F: FF        .byte $FF   ; 
- D 1 - - - 0x017090 05:B080: 03        .byte $03   ; 
- D 1 - - - 0x017091 05:B081: FD        .byte $FD   ; 
- D 1 - - - 0x017092 05:B082: 04        .byte $04   ; 
- D 1 - - - 0x017093 05:B083: FC        .byte $FC   ; 



tbl_B084:
- D 1 - - - 0x017094 05:B084: 40        .byte $40   ; 
tbl_B085:
- D 1 - - - 0x017095 05:B085: 14        .byte $14   ; 
tbl_B086:
- D 1 - - - 0x017096 05:B086: 00        .byte $00   ; 
- D 1 - - - 0x017097 05:B087: 48        .byte $48   ; 
- D 1 - - - 0x017098 05:B088: 10        .byte $10   ; 
- D 1 - - - 0x017099 05:B089: 02        .byte $02   ; 
- D 1 - - - 0x01709A 05:B08A: 48        .byte $48   ; 
- D 1 - - - 0x01709B 05:B08B: 40        .byte $40   ; 
- D 1 - - - 0x01709C 05:B08C: 08        .byte $08   ; 
- D 1 - - - 0x01709D 05:B08D: 40        .byte $40   ; 
- D 1 - - - 0x01709E 05:B08E: 01        .byte $01   ; 
- D 1 - - - 0x01709F 05:B08F: 42        .byte $42   ; 
- D 1 - - - 0x0170A0 05:B090: 61        .byte $61   ; 
- D 1 - - - 0x0170A1 05:B091: 00        .byte $00   ; 
- D 1 - - - 0x0170A2 05:B092: 16        .byte $16   ; 
- D 1 - - - 0x0170A3 05:B093: 40        .byte $40   ; 
- D 1 - - - 0x0170A4 05:B094: 10        .byte $10   ; 
- D 1 - - - 0x0170A5 05:B095: 00        .byte $00   ; 
- D 1 - - - 0x0170A6 05:B096: 44        .byte $44   ; 
- D 1 - - - 0x0170A7 05:B097: 24        .byte $24   ; 
- D 1 - - - 0x0170A8 05:B098: 00        .byte $00   ; 
- D 1 - - - 0x0170A9 05:B099: 52        .byte $52   ; 
- D 1 - - - 0x0170AA 05:B09A: 00        .byte $00   ; 
- D 1 - - - 0x0170AB 05:B09B: 01        .byte $01   ; 
- D 1 - - - 0x0170AC 05:B09C: 61        .byte $61   ; 
- D 1 - - - 0x0170AD 05:B09D: 48        .byte $48   ; 
- D 1 - - - 0x0170AE 05:B09E: 02        .byte $02   ; 
- D 1 - - - 0x0170AF 05:B09F: 40        .byte $40   ; 
- D 1 - - - 0x0170B0 05:B0A0: 06        .byte $06   ; 
- D 1 - - - 0x0170B1 05:B0A1: 80        .byte $80   ; 
- D 1 - - - 0x0170B2 05:B0A2: 44        .byte $44   ; 
- D 1 - - - 0x0170B3 05:B0A3: 80        .byte $80   ; 
- D 1 - - - 0x0170B4 05:B0A4: 00        .byte $00   ; 
- D 1 - - - 0x0170B5 05:B0A5: 51        .byte $51   ; 
- D 1 - - - 0x0170B6 05:B0A6: 28        .byte $28   ; 
- D 1 - - - 0x0170B7 05:B0A7: 00        .byte $00   ; 



sub_B0A8:
C - - - - - 0x0170B8 05:B0A8: AD D1 05  LDA ram_05D1
C - - - - - 0x0170BB 05:B0AB: 0A        ASL
C - - - - - 0x0170BC 05:B0AC: 0A        ASL
C - - - - - 0x0170BD 05:B0AD: 0A        ASL
C - - - - - 0x0170BE 05:B0AE: 6D 55 B1  ADC tbl_B155
C - - - - - 0x0170C1 05:B0B1: 85 32     STA ram_0032
C - - - - - 0x0170C3 05:B0B3: A9 00     LDA #$00
C - - - - - 0x0170C5 05:B0B5: 6D 56 B1  ADC tbl_B155 + 1
C - - - - - 0x0170C8 05:B0B8: 85 33     STA ram_0033
C - - - - - 0x0170CA 05:B0BA: AC D1 05  LDY ram_05D1
C - - - - - 0x0170CD 05:B0BD: B9 D5 05  LDA ram_05D5,Y
C - - - - - 0x0170D0 05:B0C0: 4A        LSR
C - - - - - 0x0170D1 05:B0C1: 29 06     AND #$06
C - - - - - 0x0170D3 05:B0C3: A8        TAY
C - - - - - 0x0170D4 05:B0C4: B1 32     LDA (ram_0032),Y
C - - - - - 0x0170D6 05:B0C6: 8D B9 06  STA ram_буфер_графики
C - - - - - 0x0170D9 05:B0C9: C8        INY
C - - - - - 0x0170DA 05:B0CA: B1 32     LDA (ram_0032),Y
C - - - - - 0x0170DC 05:B0CC: 8D 96 06  STA ram_буфер_атрибутов
C - - - - - 0x0170DF 05:B0CF: AC D1 05  LDY ram_05D1
C - - - - - 0x0170E2 05:B0D2: B9 D5 05  LDA ram_05D5,Y
C - - - - - 0x0170E5 05:B0D5: 29 0E     AND #$0E
C - - - - - 0x0170E7 05:B0D7: 85 1C     STA ram_001C
C - - - - - 0x0170E9 05:B0D9: 0A        ASL
C - - - - - 0x0170EA 05:B0DA: 65 1C     ADC ram_001C
C - - - - - 0x0170EC 05:B0DC: A8        TAY
C - - - - - 0x0170ED 05:B0DD: B9 B7 B1  LDA tbl_B1B7,Y
C - - - - - 0x0170F0 05:B0E0: 8D BA 06  STA ram_буфер_графики + 1
C - - - - - 0x0170F3 05:B0E3: B9 B8 B1  LDA tbl_B1B8,Y
C - - - - - 0x0170F6 05:B0E6: 8D 97 06  STA ram_буфер_атрибутов + 1
C - - - - - 0x0170F9 05:B0E9: B9 B9 B1  LDA tbl_B1B9,Y
C - - - - - 0x0170FC 05:B0EC: 8D DC 06  STA ram_буфер_палитры
C - - - - - 0x0170FF 05:B0EF: B9 BA B1  LDA tbl_B1BA,Y
C - - - - - 0x017102 05:B0F2: 8D DD 06  STA ram_буфер_палитры + 1
C - - - - - 0x017105 05:B0F5: B9 BB B1  LDA tbl_B1BB,Y
C - - - - - 0x017108 05:B0F8: 8D DE 06  STA ram_буфер_палитры + 2
C - - - - - 0x01710B 05:B0FB: B9 BC B1  LDA tbl_B1BC,Y
C - - - - - 0x01710E 05:B0FE: 8D BB 06  STA ram_буфер_графики + 2
C - - - - - 0x017111 05:B101: A9 1F     LDA #$1F
C - - - - - 0x017113 05:B103: 8D 98 06  STA ram_буфер_атрибутов + 2
C - - - - - 0x017116 05:B106: A9 03     LDA #$03
C - - - - - 0x017118 05:B108: 8D 95 06  STA ram_счетчик_буфера_атрибутов
C - - - - - 0x01711B 05:B10B: 8D B8 06  STA ram_счетчик_буфера_графики
C - - - - - 0x01711E 05:B10E: 8D DB 06  STA ram_счетчик_буфера_палитры
C - - - - - 0x017121 05:B111: A9 04     LDA #$04
C - - - - - 0x017123 05:B113: 8D 90 06  STA ram_бит_для_2000_атрибуты
C - - - - - 0x017126 05:B116: 8D 91 06  STA ram_бит_для_2000_графика
C - - - - - 0x017129 05:B119: 8D 92 06  STA ram_бит_для_2000_палитра
C - - - - - 0x01712C 05:B11C: AD D1 05  LDA ram_05D1
C - - - - - 0x01712F 05:B11F: 0A        ASL
C - - - - - 0x017130 05:B120: A8        TAY
C - - - - - 0x017131 05:B121: B9 E7 B1  LDA tbl_B1E7,Y
C - - - - - 0x017134 05:B124: 8D DA 06  STA ram_байт_2006_lo_палитра
C - - - - - 0x017137 05:B127: B9 E8 B1  LDA tbl_B1E8,Y
C - - - - - 0x01713A 05:B12A: 8D D9 06  STA ram_байт_2006_hi_палитра
C - - - - - 0x01713D 05:B12D: 18        CLC
C - - - - - 0x01713E 05:B12E: B9 E7 B1  LDA tbl_B1E7,Y
C - - - - - 0x017141 05:B131: 69 01     ADC #$01
C - - - - - 0x017143 05:B133: 8D B7 06  STA ram_байт_2006_lo_графика
C - - - - - 0x017146 05:B136: B9 E8 B1  LDA tbl_B1E8,Y
C - - - - - 0x017149 05:B139: 69 00     ADC #$00
C - - - - - 0x01714B 05:B13B: 8D B6 06  STA ram_байт_2006_hi_графика
C - - - - - 0x01714E 05:B13E: 18        CLC
C - - - - - 0x01714F 05:B13F: B9 E7 B1  LDA tbl_B1E7,Y
C - - - - - 0x017152 05:B142: 69 02     ADC #$02
C - - - - - 0x017154 05:B144: 8D 94 06  STA ram_байт_2006_lo_атрибуты
C - - - - - 0x017157 05:B147: B9 E8 B1  LDA tbl_B1E8,Y
C - - - - - 0x01715A 05:B14A: 69 00     ADC #$00
C - - - - - 0x01715C 05:B14C: 8D 93 06  STA ram_байт_2006_hi_атрибуты
bra_B14F:
C - - - - - 0x01715F 05:B14F: AD 93 06  LDA ram_байт_2006_hi_атрибуты
C - - - - - 0x017162 05:B152: 30 FB     BMI bra_B14F
C - - - - - 0x017164 05:B154: 60        RTS



tbl_B155:
- D 1 - - - 0x017165 05:B155: 57 B1     .word tbl_B157

tbl_B157:
- - - - - - 0x017167 05:B157: 50        .byte $50   ; 
- - - - - - 0x017168 05:B158: 11        .byte $11   ; 
- - - - - - 0x017169 05:B159: 10        .byte $10   ; 
- - - - - - 0x01716A 05:B15A: 11        .byte $11   ; 
- D 1 - I - 0x01716B 05:B15B: 10        .byte $10   ; 
- D 1 - I - 0x01716C 05:B15C: 11        .byte $11   ; 
- D 1 - I - 0x01716D 05:B15D: 30        .byte $30   ; 
- D 1 - I - 0x01716E 05:B15E: 31        .byte $31   ; 
- - - - - - 0x01716F 05:B15F: 51        .byte $51   ; 
- - - - - - 0x017170 05:B160: 13        .byte $13   ; 
- D 1 - I - 0x017171 05:B161: 12        .byte $12   ; 
- D 1 - I - 0x017172 05:B162: 13        .byte $13   ; 
- D 1 - I - 0x017173 05:B163: 12        .byte $12   ; 
- D 1 - I - 0x017174 05:B164: 13        .byte $13   ; 
- D 1 - I - 0x017175 05:B165: 32        .byte $32   ; 
- D 1 - I - 0x017176 05:B166: 33        .byte $33   ; 
- - - - - - 0x017177 05:B167: 52        .byte $52   ; 
- - - - - - 0x017178 05:B168: 15        .byte $15   ; 
- D 1 - I - 0x017179 05:B169: 14        .byte $14   ; 
- D 1 - I - 0x01717A 05:B16A: 15        .byte $15   ; 
- D 1 - I - 0x01717B 05:B16B: 14        .byte $14   ; 
- D 1 - I - 0x01717C 05:B16C: 15        .byte $15   ; 
- D 1 - I - 0x01717D 05:B16D: 34        .byte $34   ; 
- D 1 - I - 0x01717E 05:B16E: 35        .byte $35   ; 
- - - - - - 0x01717F 05:B16F: 53        .byte $53   ; 
- - - - - - 0x017180 05:B170: 17        .byte $17   ; 
- D 1 - I - 0x017181 05:B171: 16        .byte $16   ; 
- D 1 - I - 0x017182 05:B172: 17        .byte $17   ; 
- D 1 - I - 0x017183 05:B173: 16        .byte $16   ; 
- D 1 - I - 0x017184 05:B174: 17        .byte $17   ; 
- - - - - - 0x017185 05:B175: 36        .byte $36   ; 
- - - - - - 0x017186 05:B176: 37        .byte $37   ; 
- - - - - - 0x017187 05:B177: 54        .byte $54   ; 
- - - - - - 0x017188 05:B178: 19        .byte $19   ; 
- D 1 - I - 0x017189 05:B179: 18        .byte $18   ; 
- D 1 - I - 0x01718A 05:B17A: 19        .byte $19   ; 
- D 1 - I - 0x01718B 05:B17B: 18        .byte $18   ; 
- D 1 - I - 0x01718C 05:B17C: 19        .byte $19   ; 
- D 1 - I - 0x01718D 05:B17D: 38        .byte $38   ; 
- D 1 - I - 0x01718E 05:B17E: 39        .byte $39   ; 
- - - - - - 0x01718F 05:B17F: 55        .byte $55   ; 
- - - - - - 0x017190 05:B180: 1B        .byte $1B   ; 
- - - - - - 0x017191 05:B181: 1A        .byte $1A   ; 
- - - - - - 0x017192 05:B182: 1B        .byte $1B   ; 
- D 1 - I - 0x017193 05:B183: 1A        .byte $1A   ; 
- D 1 - I - 0x017194 05:B184: 1B        .byte $1B   ; 
- D 1 - I - 0x017195 05:B185: 3A        .byte $3A   ; 
- D 1 - I - 0x017196 05:B186: 3B        .byte $3B   ; 
- - - - - - 0x017197 05:B187: 60        .byte $60   ; 
- - - - - - 0x017198 05:B188: 21        .byte $21   ; 
- D 1 - I - 0x017199 05:B189: 20        .byte $20   ; 
- D 1 - I - 0x01719A 05:B18A: 21        .byte $21   ; 
- D 1 - I - 0x01719B 05:B18B: 20        .byte $20   ; 
- D 1 - I - 0x01719C 05:B18C: 21        .byte $21   ; 
- - - - - - 0x01719D 05:B18D: 40        .byte $40   ; 
- - - - - - 0x01719E 05:B18E: 41        .byte $41   ; 
- - - - - - 0x01719F 05:B18F: 61        .byte $61   ; 
- - - - - - 0x0171A0 05:B190: 23        .byte $23   ; 
- D 1 - I - 0x0171A1 05:B191: 22        .byte $22   ; 
- D 1 - I - 0x0171A2 05:B192: 23        .byte $23   ; 
- D 1 - I - 0x0171A3 05:B193: 22        .byte $22   ; 
- D 1 - I - 0x0171A4 05:B194: 23        .byte $23   ; 
- - - - - - 0x0171A5 05:B195: 42        .byte $42   ; 
- - - - - - 0x0171A6 05:B196: 43        .byte $43   ; 
- - - - - - 0x0171A7 05:B197: 62        .byte $62   ; 
- - - - - - 0x0171A8 05:B198: 25        .byte $25   ; 
- D 1 - I - 0x0171A9 05:B199: 24        .byte $24   ; 
- D 1 - I - 0x0171AA 05:B19A: 25        .byte $25   ; 
- D 1 - I - 0x0171AB 05:B19B: 24        .byte $24   ; 
- D 1 - I - 0x0171AC 05:B19C: 25        .byte $25   ; 
- D 1 - I - 0x0171AD 05:B19D: 44        .byte $44   ; 
- D 1 - I - 0x0171AE 05:B19E: 45        .byte $45   ; 
- D 1 - I - 0x0171AF 05:B19F: 63        .byte $63   ; 
- D 1 - I - 0x0171B0 05:B1A0: 27        .byte $27   ; 
- D 1 - I - 0x0171B1 05:B1A1: 26        .byte $26   ; 
- D 1 - I - 0x0171B2 05:B1A2: 27        .byte $27   ; 
- D 1 - I - 0x0171B3 05:B1A3: 26        .byte $26   ; 
- D 1 - I - 0x0171B4 05:B1A4: 27        .byte $27   ; 
- - - - - - 0x0171B5 05:B1A5: 46        .byte $46   ; 
- - - - - - 0x0171B6 05:B1A6: 47        .byte $47   ; 
- - - - - - 0x0171B7 05:B1A7: 64        .byte $64   ; 
- - - - - - 0x0171B8 05:B1A8: 29        .byte $29   ; 
- D 1 - I - 0x0171B9 05:B1A9: 28        .byte $28   ; 
- D 1 - I - 0x0171BA 05:B1AA: 29        .byte $29   ; 
- D 1 - I - 0x0171BB 05:B1AB: 28        .byte $28   ; 
- D 1 - I - 0x0171BC 05:B1AC: 29        .byte $29   ; 
- - - - - - 0x0171BD 05:B1AD: 48        .byte $48   ; 
- - - - - - 0x0171BE 05:B1AE: 49        .byte $49   ; 
- - - - - - 0x0171BF 05:B1AF: 65        .byte $65   ; 
- - - - - - 0x0171C0 05:B1B0: 2B        .byte $2B   ; 
- D 1 - I - 0x0171C1 05:B1B1: 2A        .byte $2A   ; 
- D 1 - I - 0x0171C2 05:B1B2: 2B        .byte $2B   ; 
- D 1 - I - 0x0171C3 05:B1B3: 2A        .byte $2A   ; 
- D 1 - I - 0x0171C4 05:B1B4: 2B        .byte $2B   ; 
- - - - - - 0x0171C5 05:B1B5: 4A        .byte $4A   ; 
- - - - - - 0x0171C6 05:B1B6: 4B        .byte $4B   ; 



tbl_B1B7:
- - - - - - 0x0171C7 05:B1B7: 70        .byte $70   ; 
tbl_B1B8:
- - - - - - 0x0171C8 05:B1B8: 3C        .byte $3C   ; 
tbl_B1B9:
- - - - - - 0x0171C9 05:B1B9: 02        .byte $02   ; 
tbl_B1BA:
- - - - - - 0x0171CA 05:B1BA: 6E        .byte $6E   ; 
tbl_B1BB:
- - - - - - 0x0171CB 05:B1BB: 7E        .byte $7E   ; 
tbl_B1BC:
- - - - - - 0x0171CC 05:B1BC: 7F        .byte $7F   ; 
- D 1 - - - 0x0171CD 05:B1BD: 70        .byte $70   ; 
- D 1 - - - 0x0171CE 05:B1BE: 3C        .byte $3C   ; 
- D 1 - - - 0x0171CF 05:B1BF: 02        .byte $02   ; 
- D 1 - - - 0x0171D0 05:B1C0: 6E        .byte $6E   ; 
- D 1 - - - 0x0171D1 05:B1C1: 7E        .byte $7E   ; 
- D 1 - - - 0x0171D2 05:B1C2: 7F        .byte $7F   ; 
- D 1 - - - 0x0171D3 05:B1C3: 71        .byte $71   ; 
- D 1 - - - 0x0171D4 05:B1C4: 3E        .byte $3E   ; 
- D 1 - - - 0x0171D5 05:B1C5: 02        .byte $02   ; 
- D 1 - - - 0x0171D6 05:B1C6: 02        .byte $02   ; 
- D 1 - - - 0x0171D7 05:B1C7: 02        .byte $02   ; 
- D 1 - - - 0x0171D8 05:B1C8: 1E        .byte $1E   ; 
- D 1 - - - 0x0171D9 05:B1C9: 72        .byte $72   ; 
- D 1 - - - 0x0171DA 05:B1CA: 3E        .byte $3E   ; 
- D 1 - - - 0x0171DB 05:B1CB: 02        .byte $02   ; 
- D 1 - - - 0x0171DC 05:B1CC: 02        .byte $02   ; 
- D 1 - - - 0x0171DD 05:B1CD: 02        .byte $02   ; 
- D 1 - - - 0x0171DE 05:B1CE: 1E        .byte $1E   ; 
- D 1 - - - 0x0171DF 05:B1CF: 72        .byte $72   ; 
- D 1 - - - 0x0171E0 05:B1D0: 3E        .byte $3E   ; 
- D 1 - - - 0x0171E1 05:B1D1: 02        .byte $02   ; 
- D 1 - - - 0x0171E2 05:B1D2: 02        .byte $02   ; 
- D 1 - - - 0x0171E3 05:B1D3: 02        .byte $02   ; 
- D 1 - - - 0x0171E4 05:B1D4: 1E        .byte $1E   ; 
- D 1 - - - 0x0171E5 05:B1D5: 73        .byte $73   ; 
- D 1 - - - 0x0171E6 05:B1D6: 3D        .byte $3D   ; 
- D 1 - - - 0x0171E7 05:B1D7: 02        .byte $02   ; 
- D 1 - - - 0x0171E8 05:B1D8: 02        .byte $02   ; 
- D 1 - - - 0x0171E9 05:B1D9: 02        .byte $02   ; 
- D 1 - - - 0x0171EA 05:B1DA: 1E        .byte $1E   ; 
- D 1 - - - 0x0171EB 05:B1DB: 74        .byte $74   ; 
- D 1 - - - 0x0171EC 05:B1DC: 3F        .byte $3F   ; 
- D 1 - - - 0x0171ED 05:B1DD: 56        .byte $56   ; 
- D 1 - - - 0x0171EE 05:B1DE: 66        .byte $66   ; 
- D 1 - - - 0x0171EF 05:B1DF: 76        .byte $76   ; 
- D 1 - - - 0x0171F0 05:B1E0: 77        .byte $77   ; 
- D 1 - - - 0x0171F1 05:B1E1: 74        .byte $74   ; 
- D 1 - - - 0x0171F2 05:B1E2: 3F        .byte $3F   ; 
- D 1 - - - 0x0171F3 05:B1E3: 56        .byte $56   ; 
- D 1 - - - 0x0171F4 05:B1E4: 66        .byte $66   ; 
- D 1 - - - 0x0171F5 05:B1E5: 76        .byte $76   ; 
- D 1 - - - 0x0171F6 05:B1E6: 77        .byte $77   ; 



tbl_B1E7:
- D 1 - - - 0x0171F7 05:B1E7: E4        .byte $E4   ; 
tbl_B1E8:
- D 1 - - - 0x0171F8 05:B1E8: 20        .byte $20   ; 
- D 1 - - - 0x0171F9 05:B1E9: E8        .byte $E8   ; 
- D 1 - - - 0x0171FA 05:B1EA: 20        .byte $20   ; 
- D 1 - - - 0x0171FB 05:B1EB: EC        .byte $EC   ; 
- D 1 - - - 0x0171FC 05:B1EC: 20        .byte $20   ; 
- D 1 - - - 0x0171FD 05:B1ED: F0        .byte $F0   ; 
- D 1 - - - 0x0171FE 05:B1EE: 20        .byte $20   ; 
- D 1 - - - 0x0171FF 05:B1EF: F4        .byte $F4   ; 
- D 1 - - - 0x017200 05:B1F0: 20        .byte $20   ; 
- D 1 - - - 0x017201 05:B1F1: F8        .byte $F8   ; 
- D 1 - - - 0x017202 05:B1F2: 20        .byte $20   ; 
- D 1 - - - 0x017203 05:B1F3: 84        .byte $84   ; 
- D 1 - - - 0x017204 05:B1F4: 21        .byte $21   ; 
- D 1 - - - 0x017205 05:B1F5: 88        .byte $88   ; 
- D 1 - - - 0x017206 05:B1F6: 21        .byte $21   ; 
- D 1 - - - 0x017207 05:B1F7: 8C        .byte $8C   ; 
- D 1 - - - 0x017208 05:B1F8: 21        .byte $21   ; 
- D 1 - - - 0x017209 05:B1F9: 90        .byte $90   ; 
- D 1 - - - 0x01720A 05:B1FA: 21        .byte $21   ; 
- D 1 - - - 0x01720B 05:B1FB: 94        .byte $94   ; 
- D 1 - - - 0x01720C 05:B1FC: 21        .byte $21   ; 
- D 1 - - - 0x01720D 05:B1FD: 98        .byte $98   ; 
- D 1 - - - 0x01720E 05:B1FE: 21        .byte $21   ; 



sub_B1FF:
C - - - - - 0x01720F 05:B1FF: 85 1C     STA ram_001C
C - - - - - 0x017211 05:B201: 0A        ASL
C - - - - - 0x017212 05:B202: 0A        ASL
C - - - - - 0x017213 05:B203: 65 1C     ADC ram_001C
C - - - - - 0x017215 05:B205: 85 1C     STA ram_001C
C - - - - - 0x017217 05:B207: AD 00 C0  LDA #< tbl_0x01C090
C - - - - - 0x01721A 05:B20A: 85 32     STA ram_0032
C - - - - - 0x01721C 05:B20C: AD 01 C0  LDA #> tbl_0x01C090
C - - - - - 0x01721F 05:B20F: 85 33     STA ram_0033
C - - - - - 0x017221 05:B211: A0 00     LDY #$00
C - - - - - 0x017223 05:B213: 18        CLC
C - - - - - 0x017224 05:B214: A5 1C     LDA ram_001C
C - - - - - 0x017226 05:B216: 71 32     ADC (ram_0032),Y
C - - - - - 0x017228 05:B218: 85 30     STA ram_0030
C - - - - - 0x01722A 05:B21A: C8        INY
C - - - - - 0x01722B 05:B21B: A9 00     LDA #$00
C - - - - - 0x01722D 05:B21D: 71 32     ADC (ram_0032),Y
C - - - - - 0x01722F 05:B21F: 85 31     STA ram_0031
C - - - - - 0x017231 05:B221: 60        RTS



sub_B222:
C - - - - - 0x017232 05:B222: 0A        ASL
C - - - - - 0x017233 05:B223: 0A        ASL
C - - - - - 0x017234 05:B224: 0A        ASL
C - - - - - 0x017235 05:B225: 18        CLC
C - - - - - 0x017236 05:B226: 6D C0 AD  ADC tbl_ADC0
C - - - - - 0x017239 05:B229: 85 30     STA ram_0030
C - - - - - 0x01723B 05:B22B: A9 00     LDA #$00
C - - - - - 0x01723D 05:B22D: 6D C1 AD  ADC tbl_ADC0 + 1
C - - - - - 0x017240 05:B230: 85 31     STA ram_0031
C - - - - - 0x017242 05:B232: 60        RTS



sub_B233:
C - - - - - 0x017243 05:B233: 20 FF B1  JSR sub_B1FF
C - - - - - 0x017246 05:B236: A0 00     LDY #$00
bra_B238:
C - - - - - 0x017248 05:B238: B1 30     LDA (ram_0030),Y
C - - - - - 0x01724A 05:B23A: 99 11 06  STA ram_0611,Y
C - - - - - 0x01724D 05:B23D: C9 FF     CMP #$FF
C - - - - - 0x01724F 05:B23F: F0 05     BEQ bra_B246
C - - - - - 0x017251 05:B241: C8        INY
C - - - - - 0x017252 05:B242: C0 05     CPY #$05
C - - - - - 0x017254 05:B244: 90 F2     BCC bra_B238
bra_B246:
C - - - - - 0x017256 05:B246: A9 F8     LDA #$F8
C - - - - - 0x017258 05:B248: 99 11 06  STA ram_0611,Y
C - - - - - 0x01725B 05:B24B: 60        RTS



sub_B24C:
C - - - - - 0x01725C 05:B24C: 20 22 B2  JSR sub_B222
C - - - - - 0x01725F 05:B24F: A0 01     LDY #$01
bra_B251:
C - - - - - 0x017261 05:B251: B1 30     LDA (ram_0030),Y
C - - - - - 0x017263 05:B253: 99 16 06  STA ram_0616,Y
C - - - - - 0x017266 05:B256: C9 FF     CMP #$FF
C - - - - - 0x017268 05:B258: F0 05     BEQ bra_B25F
C - - - - - 0x01726A 05:B25A: C8        INY
C - - - - - 0x01726B 05:B25B: C0 08     CPY #$08
C - - - - - 0x01726D 05:B25D: 90 F2     BCC bra_B251
bra_B25F:
C - - - - - 0x01726F 05:B25F: A9 F8     LDA #$F8
C - - - - - 0x017271 05:B261: 99 16 06  STA ram_0616,Y
C - - - - - 0x017274 05:B264: 60        RTS



sub_B265:
C - - - - - 0x017275 05:B265: A0 02     LDY #$02
C - - - - - 0x017277 05:B267: 4C 6C B2  JMP loc_B26C



sub_B26A:
C - - - - - 0x01727A 05:B26A: A0 00     LDY #$00
loc_B26C:
C D 1 - - - 0x01727C 05:B26C: 85 1C     STA ram_001C
C - - - - - 0x01727E 05:B26E: B9 AE B2  LDA tbl_B2AE,Y
C - - - - - 0x017281 05:B271: 85 34     STA ram_0034
C - - - - - 0x017283 05:B273: B9 AF B2  LDA tbl_B2AF,Y
C - - - - - 0x017286 05:B276: 85 35     STA ram_0035
C - - - - - 0x017288 05:B278: A5 1C     LDA ram_001C
C - - - - - 0x01728A 05:B27A: 20 11 8A  JSR sub_8A11
C - - - - - 0x01728D 05:B27D: A5 30     LDA ram_0030
C - - - - - 0x01728F 05:B27F: 09 80     ORA #$80
C - - - - - 0x017291 05:B281: 85 1E     STA ram_001E
C - - - - - 0x017293 05:B283: A5 31     LDA ram_0031
C - - - - - 0x017295 05:B285: 85 1D     STA ram_001D
C - - - - - 0x017297 05:B287: A5 32     LDA ram_0032
C - - - - - 0x017299 05:B289: 85 1C     STA ram_001C
C - - - - - 0x01729B 05:B28B: A9 00     LDA #$00
C - - - - - 0x01729D 05:B28D: 85 21     STA ram_0021
C - - - - - 0x01729F 05:B28F: A0 00     LDY #$00
bra_B291:
C - - - - - 0x0172A1 05:B291: B9 1C 00  LDA ram_001C,Y
C - - - - - 0x0172A4 05:B294: D0 08     BNE bra_B29E
C - - - - - 0x0172A6 05:B296: 24 21     BIT ram_0021
C - - - - - 0x0172A8 05:B298: 30 06     BMI bra_B2A0
C - - - - - 0x0172AA 05:B29A: A9 00     LDA #$00
C - - - - - 0x0172AC 05:B29C: F0 04     BEQ bra_B2A2
bra_B29E:
C - - - - - 0x0172AE 05:B29E: C6 21     DEC ram_0021
bra_B2A0:
C - - - - - 0x0172B0 05:B2A0: 09 80     ORA #$80
bra_B2A2:
C - - - - - 0x0172B2 05:B2A2: 91 34     STA (ram_0034),Y
C - - - - - 0x0172B4 05:B2A4: C8        INY
C - - - - - 0x0172B5 05:B2A5: C0 03     CPY #$03
C - - - - - 0x0172B7 05:B2A7: 90 E8     BCC bra_B291
C - - - - - 0x0172B9 05:B2A9: A9 F8     LDA #$F8
C - - - - - 0x0172BB 05:B2AB: 91 34     STA (ram_0034),Y
C - - - - - 0x0172BD 05:B2AD: 60        RTS

tbl_B2AE:
- D 1 - - - 0x0172BE 05:B2AE: 11        .byte $11   ; 
tbl_B2AF:
- D 1 - - - 0x0172BF 05:B2AF: 06        .byte $06   ; 
- D 1 - - - 0x0172C0 05:B2B0: 17        .byte $17   ; 
- D 1 - - - 0x0172C1 05:B2B1: 06        .byte $06   ; 



sub_B2B2:
C - - - - - 0x0172C2 05:B2B2: A5 59     LDA ram_subscript
C - - - - - 0x0172C4 05:B2B4: 30 2D     BMI bra_B2E3
C - - - - - 0x0172C6 05:B2B6: AD 4A 05  LDA ram_054A
C - - - - - 0x0172C9 05:B2B9: 30 05     BMI bra_B2C0
- - - - - - 0x0172CB 05:B2BB: A0 00     LDY #$00
- - - - - - 0x0172CD 05:B2BD: 4C D3 B3  JMP loc_B3D3
bra_B2C0:
C - - - - - 0x0172D0 05:B2C0: 20 DE B3  JSR sub_B3DE
C - - - - - 0x0172D3 05:B2C3: AD 55 05  LDA ram_0555
C - - - - - 0x0172D6 05:B2C6: C9 46     CMP #$46
C - - - - - 0x0172D8 05:B2C8: 90 0E     BCC bra_B2D8
- - - - - - 0x0172DA 05:B2CA: AD 58 05  LDA ram_0558
- - - - - - 0x0172DD 05:B2CD: C9 24     CMP #$24
- - - - - - 0x0172DF 05:B2CF: 90 03     BCC bra_B2D4
- - - - - - 0x0172E1 05:B2D1: 4C BD B3  JMP loc_B3BD
bra_B2D4:
- - - - - - 0x0172E4 05:B2D4: C9 10     CMP #$10
- - - - - - 0x0172E6 05:B2D6: B0 05     BCS bra_B2DD
bra_B2D8:
C - - - - - 0x0172E8 05:B2D8: A0 01     LDY #$01
C - - - - - 0x0172EA 05:B2DA: 4C D3 B3  JMP loc_B3D3
bra_B2DD:
- - - - - - 0x0172ED 05:B2DD: 20 DF 80  JSR sub_80DF
- - - - - - 0x0172F0 05:B2E0: 20 F0 B2  JSR sub_B2F0
bra_B2E3:
- - - - - - 0x0172F3 05:B2E3: 20 A3 B3  JSR sub_B3A3
- - - - - - 0x0172F6 05:B2E6: AD C9 05  LDA ram_счетчик_опций
- - - - - - 0x0172F9 05:B2E9: 20 53 C0  JSR sub_0x01EC9F_jump_to_pointers_after_JSR
- - - - - - 0x0172FC 05:B2EC: 2F B3     .word ofs_B32F_00
- - - - - - 0x0172FE 05:B2EE: 45 B3     .word ofs_B345_01



sub_B2F0:
- - - - - - 0x017300 05:B2F0: A9 FF     LDA #$FF
- - - - - - 0x017302 05:B2F2: 8D CA 05  STA ram_номер_опции
- - - - - - 0x017305 05:B2F5: A0 04     LDY #$04
- - - - - - 0x017307 05:B2F7: 8C 6D 00  STY ram_006D
- - - - - - 0x01730A 05:B2FA: C8        INY
- - - - - - 0x01730B 05:B2FB: 8C 61 00  STY ram_0061
- - - - - - 0x01730E 05:B2FE: A9 00     LDA #$00
- - - - - - 0x017310 05:B300: 8D 2C 05  STA ram_номер_команды
- - - - - - 0x017313 05:B303: A9 07     LDA #$07
- - - - - - 0x017315 05:B305: 8D AE 05  STA ram_palette_id_spr
- - - - - - 0x017318 05:B308: 8D 80 00  STA ram_animation_id_ball
- - - - - - 0x01731B 05:B30B: A2 26     LDX #$26
- - - - - - 0x01731D 05:B30D: 8E B8 05  STX ram_банк_спрайтов
- - - - - - 0x017320 05:B310: E8        INX
- - - - - - 0x017321 05:B311: 8E B9 05  STX ram_банк_спрайтов + 1
- - - - - - 0x017324 05:B314: A9 2F     LDA #$2F
- - - - - - 0x017326 05:B316: 8D BB 05  STA ram_банк_спрайтов + 3
- - - - - - 0x017329 05:B319: 20 0B C0  JSR sub_0x01EEAA_базовые_банки_спрайтов
- - - - - - 0x01732C 05:B31C: A9 C8     LDA #$C8
- - - - - - 0x01732E 05:B31E: 8D 20 03  STA ram_pos_X_lo_ball
- - - - - - 0x017331 05:B321: A9 A0     LDA #$A0
- - - - - - 0x017333 05:B323: 8D 59 03  STA ram_pos_Y_lo_ball
- - - - - - 0x017336 05:B326: 20 47 89  JSR sub_8947
- - - - - - 0x017339 05:B329: A9 0A     LDA #con_music_walkthrough
- - - - - - 0x01733B 05:B32B: 20 02 C0  JSR sub_0x01C2F4_play_sound
- - - - - - 0x01733E 05:B32E: 60        RTS



ofs_B32F_00:
- - - - - - 0x01733F 05:B32F: AD B2 05  LDA ram_flag_brightness
- - - - - - 0x017342 05:B332: 10 03     BPL bra_B337
- - - - - - 0x017344 05:B334: EE C9 05  INC ram_счетчик_опций
bra_B337:
- - - - - - 0x017347 05:B337: 20 5C C0  JSR sub_0x01D083
- - - - - - 0x01734A 05:B33A: A2 0C     LDX #$0C
- - - - - - 0x01734C 05:B33C: 20 65 C0  JSR sub_0x01EB9C
- - - - - - 0x01734F 05:B33F: 20 14 80  JSR sub_0x01C2AE
- - - - - - 0x017352 05:B342: 4C A2 B3  RTS



ofs_B345_01:
- - - - - - 0x017355 05:B345: A2 00     LDX #$00
- - - - - - 0x017357 05:B347: AD CA 05  LDA ram_номер_опции
- - - - - - 0x01735A 05:B34A: 10 07     BPL bra_B353
- - - - - - 0x01735C 05:B34C: A9 00     LDA #$00
- - - - - - 0x01735E 05:B34E: 8D CA 05  STA ram_номер_опции
- - - - - - 0x017361 05:B351: A2 00     LDX #$00
bra_B353:
- - - - - - 0x017363 05:B353: 20 7E 81  JSR sub_817E_конвертация_нажатых_кнопок_в_индекс
- - - - - - 0x017366 05:B356: 20 D3 81  JSR sub_81D3_конвертация_индексов_Dpad_в_05
- - - - - - 0x017369 05:B359: 20 53 C0  JSR sub_0x01EC9F_jump_to_pointers_after_JSR
- - - - - - 0x01736C 05:B35C: 8D B3     .word ofs_B38D_00_nothing
- - - - - - 0x01736E 05:B35E: 68 B3     .word ofs_B368_01_Start
- - - - - - 0x017370 05:B360: 8D B3     .word ofs_B38D_02_Select
- - - - - - 0x017372 05:B362: 68 B3     .word ofs_B368_03_A
- - - - - - 0x017374 05:B364: 73 B3     .word ofs_B373_04_B
- - - - - - 0x017376 05:B366: 80 B3     .word ofs_B380_05_Dpad



ofs_B368_01_Start:
ofs_B368_03_A:
- - - - - - 0x017378 05:B368: A9 33     LDA #con_sfx_yes
- - - - - - 0x01737A 05:B36A: 20 02 C0  JSR sub_0x01C2F4_play_sound
- - - - - - 0x01737D 05:B36D: 20 B2 B3  JSR sub_B3B2
- - - - - - 0x017380 05:B370: 4C 8D B3  JMP loc_B38D



ofs_B373_04_B:
- - - - - - 0x017383 05:B373: A9 34     LDA #con_sfx_no
- - - - - - 0x017385 05:B375: 20 02 C0  JSR sub_0x01C2F4_play_sound
- - - - - - 0x017388 05:B378: A9 01     LDA #$01
- - - - - - 0x01738A 05:B37A: 8D CA 05  STA ram_номер_опции
- - - - - - 0x01738D 05:B37D: 4C 8D B3  JMP loc_B38D



ofs_B380_05_Dpad:
- - - - - - 0x017390 05:B380: A9 32     LDA #con_sfx_move_cursor
- - - - - - 0x017392 05:B382: 20 02 C0  JSR sub_0x01C2F4_play_sound
- - - - - - 0x017395 05:B385: AD CA 05  LDA ram_номер_опции
- - - - - - 0x017398 05:B388: 49 01     EOR #$01
- - - - - - 0x01739A 05:B38A: 8D CA 05  STA ram_номер_опции
ofs_B38D_00_nothing:
ofs_B38D_02_Select:
loc_B38D:
- - - - - - 0x01739D 05:B38D: A2 00     LDX #$00
- - - - - - 0x01739F 05:B38F: 20 2A 82  JSR sub_822A
- - - - - - 0x0173A2 05:B392: A9 00     LDA #$00
- - - - - - 0x0173A4 05:B394: 20 8D 82  JSR sub_828D
- - - - - - 0x0173A7 05:B397: 20 65 C0  JSR sub_0x01EB9C
- - - - - - 0x0173AA 05:B39A: A2 0C     LDX #$0C
- - - - - - 0x0173AC 05:B39C: 20 65 C0  JSR sub_0x01EB9C
- - - - - - 0x0173AF 05:B39F: 20 14 80  JSR sub_0x01C2AE
- - - - - - 0x0173B2 05:B3A2: 60        RTS



sub_B3A3:
- - - - - - 0x0173B3 05:B3A3: 20 05 82  JSR sub_8205_read_pointers_after_JSR
- - - - - - 0x0173B6 05:B3A6: AE B3     .word off_B3AE_00
- - - - - - 0x0173B8 05:B3A8: AE B3     .word off_B3AE_01
- - - - - - 0x0173BA 05:B3AA: AE B3     .word off_B3AE_02
- - - - - - 0x0173BC 05:B3AC: AE B3     .word off_B3AE_03

; bzk
off_B3AE_00:
off_B3AE_01:
off_B3AE_02:
off_B3AE_03:
- - - - - - 0x0173BE 05:B3AE: 08        .byte $08   ; 
- - - - - - 0x0173BF 05:B3AF: 0F        .byte $0F   ; 
- - - - - - 0x0173C0 05:B3B0: 0D        .byte $0D   ; 
- - - - - - 0x0173C1 05:B3B1: 0F        .byte $0F   ; 



sub_B3B2:
- - - - - - 0x0173C2 05:B3B2: 20 44 C0  JSR sub_0x01D057
- - - - - - 0x0173C5 05:B3B5: 20 4A C0  JSR sub_0x01D072
- - - - - - 0x0173C8 05:B3B8: AC CA 05  LDY ram_номер_опции
- - - - - - 0x0173CB 05:B3BB: D0 16     BNE bra_B3D3
loc_B3BD:
- - - - - - 0x0173CD 05:B3BD: A9 00     LDA #$00
- - - - - - 0x0173CF 05:B3BF: 8D 4A 05  STA ram_054A
- - - - - - 0x0173D2 05:B3C2: A8        TAY
- - - - - - 0x0173D3 05:B3C3: A9 03     LDA #$03
- - - - - - 0x0173D5 05:B3C5: 85 5B     STA ram_for_0059
- - - - - - 0x0173D7 05:B3C7: A5 57     LDA ram_option_mode_difficulty
- - - - - - 0x0173D9 05:B3C9: 29 03     AND #$03
- - - - - - 0x0173DB 05:B3CB: D0 06     BNE bra_B3D3
- - - - - - 0x0173DD 05:B3CD: A9 01     LDA #$01
- - - - - - 0x0173DF 05:B3CF: 05 57     ORA ram_option_mode_difficulty
- - - - - - 0x0173E1 05:B3D1: 85 57     STA ram_option_mode_difficulty
loc_B3D3:
bra_B3D3:
C D 1 - - - 0x0173E3 05:B3D3: B9 DC B3  LDA tbl_B3DC,Y
C - - - - - 0x0173E6 05:B3D6: 85 59     STA ram_subscript
C - - - - - 0x0173E8 05:B3D8: 20 47 BB  JSR sub_BB47
C - - - - - 0x0173EB 05:B3DB: 60        RTS

tbl_B3DC:
- - - - - - 0x0173EC 05:B3DC: 0F        .byte $0F   ; 
- D 1 - - - 0x0173ED 05:B3DD: 02        .byte $02   ; 



sub_B3DE:
C - - - - - 0x0173EE 05:B3DE: AD 2A 05  LDA ram_флаг_владения_мячом_ком
C - - - - - 0x0173F1 05:B3E1: 0D 2B 05  ORA ram_флаг_владения_мячом_ком + 1
C - - - - - 0x0173F4 05:B3E4: 29 01     AND #$01
C - - - - - 0x0173F6 05:B3E6: F0 7C     BEQ bra_B464_RTS
C - - - - - 0x0173F8 05:B3E8: AD 2D 05  LDA ram_номер_команды + 1
C - - - - - 0x0173FB 05:B3EB: 29 0F     AND #$0F
C - - - - - 0x0173FD 05:B3ED: 4A        LSR
C - - - - - 0x0173FE 05:B3EE: 4A        LSR
C - - - - - 0x0173FF 05:B3EF: 85 1C     STA ram_001C
C - - - - - 0x017401 05:B3F1: 18        CLC
C - - - - - 0x017402 05:B3F2: AD 2D 05  LDA ram_номер_команды + 1
C - - - - - 0x017405 05:B3F5: 29 0F     AND #$0F
C - - - - - 0x017407 05:B3F7: E5 1C     SBC ram_001C
C - - - - - 0x017409 05:B3F9: A8        TAY
C - - - - - 0x01740A 05:B3FA: 18        CLC
C - - - - - 0x01740B 05:B3FB: B9 3E 05  LDA ram_053E,Y
C - - - - - 0x01740E 05:B3FE: 69 01     ADC #$01
C - - - - - 0x017410 05:B400: 99 3E 05  STA ram_053E,Y
C - - - - - 0x017413 05:B403: EE 56 05  INC ram_0556
C - - - - - 0x017416 05:B406: AD 2E 05  LDA ram_счет_команды
C - - - - - 0x017419 05:B409: CD 2F 05  CMP ram_счет_команды + 1
C - - - - - 0x01741C 05:B40C: F0 56     BEQ bra_B464_RTS
C - - - - - 0x01741E 05:B40E: B0 0E     BCS bra_B41E
- - - - - - 0x017420 05:B410: 18        CLC
- - - - - - 0x017421 05:B411: AD 57 05  LDA ram_0557
- - - - - - 0x017424 05:B414: 69 01     ADC #$01
- - - - - - 0x017426 05:B416: B0 4C     BCS bra_B464_RTS
- - - - - - 0x017428 05:B418: 8D 57 05  STA ram_0557
- - - - - - 0x01742B 05:B41B: 4C 64 B4  RTS
bra_B41E:
C - - - - - 0x01742E 05:B41E: B9 3E 05  LDA ram_053E,Y
C - - - - - 0x017431 05:B421: 29 03     AND #$03
C - - - - - 0x017433 05:B423: AA        TAX
C - - - - - 0x017434 05:B424: BD 65 B4  LDA tbl_B465,X
C - - - - - 0x017437 05:B427: 19 3E 05  ORA ram_053E,Y
C - - - - - 0x01743A 05:B42A: 99 3E 05  STA ram_053E,Y
C - - - - - 0x01743D 05:B42D: EE 58 05  INC ram_0558
C - - - - - 0x017440 05:B430: AD 2D 05  LDA ram_номер_команды + 1
C - - - - - 0x017443 05:B433: 29 0F     AND #$0F
C - - - - - 0x017445 05:B435: A8        TAY
C - - - - - 0x017446 05:B436: B9 6C B4  LDA tbl_B46C,Y
C - - - - - 0x017449 05:B439: 85 1C     STA ram_001C
C - - - - - 0x01744B 05:B43B: A5 57     LDA ram_option_mode_difficulty
C - - - - - 0x01744D 05:B43D: 29 03     AND #$03
C - - - - - 0x01744F 05:B43F: 85 1E     STA ram_001E
C - - - - - 0x017451 05:B441: A8        TAY
C - - - - - 0x017452 05:B442: B9 69 B4  LDA tbl_B469,Y
C - - - - - 0x017455 05:B445: 85 1D     STA ram_001D
loc_B447:
C D 1 - - - 0x017457 05:B447: 88        DEY
C - - - - - 0x017458 05:B448: 30 07     BMI bra_B451
C - - - - - 0x01745A 05:B44A: 46 1C     LSR ram_001C
C - - - - - 0x01745C 05:B44C: 46 1C     LSR ram_001C
C - - - - - 0x01745E 05:B44E: 4C 47 B4  JMP loc_B447
bra_B451:
C - - - - - 0x017461 05:B451: A5 1C     LDA ram_001C
C - - - - - 0x017463 05:B453: 25 1D     AND ram_001D
C - - - - - 0x017465 05:B455: 18        CLC
C - - - - - 0x017466 05:B456: 69 02     ADC #$02
C - - - - - 0x017468 05:B458: 65 1E     ADC ram_001E
C - - - - - 0x01746A 05:B45A: 6D 55 05  ADC ram_0555
C - - - - - 0x01746D 05:B45D: 90 02     BCC bra_B461
- - - - - - 0x01746F 05:B45F: A9 FF     LDA #$FF
bra_B461:
C - - - - - 0x017471 05:B461: 8D 55 05  STA ram_0555
bra_B464_RTS:
C - - - - - 0x017474 05:B464: 60        RTS



tbl_B465:
- - - - - - 0x017475 05:B465: 00        .byte $00   ; 
- D 1 - - - 0x017476 05:B466: 80        .byte $80   ; 
- - - - - - 0x017477 05:B467: 40        .byte $40   ; 
- - - - - - 0x017478 05:B468: 20        .byte $20   ; 



tbl_B469:
- - - - - - 0x017479 05:B469: 03        .byte $03   ; легко
- D 1 - - - 0x01747A 05:B46A: 03        .byte $03   ; средне
- - - - - - 0x01747B 05:B46B: 07        .byte $07   ; сложно



tbl_B46C:
- - - - - - 0x01747C 05:B46C: 00        .byte $00   ; 
- D 1 - - - 0x01747D 05:B46D: 00        .byte $00   ; 
- - - - - - 0x01747E 05:B46E: 00        .byte $00   ; 
- - - - - - 0x01747F 05:B46F: 00        .byte $00   ; 
- - - - - - 0x017480 05:B470: 00        .byte $00   ; 
- - - - - - 0x017481 05:B471: 00        .byte $00   ; 
- - - - - - 0x017482 05:B472: 15        .byte $15   ; 
- - - - - - 0x017483 05:B473: 29        .byte $29   ; 
- - - - - - 0x017484 05:B474: 00        .byte $00   ; 
- - - - - - 0x017485 05:B475: 3A        .byte $3A   ; 
- - - - - - 0x017486 05:B476: 39        .byte $39   ; 
- - - - - - 0x017487 05:B477: 4E        .byte $4E   ; 
- - - - - - 0x017488 05:B478: 00        .byte $00   ; 
- - - - - - 0x017489 05:B479: 4E        .byte $4E   ; 
- - - - - - 0x01748A 05:B47A: 29        .byte $29   ; 
- - - - - - 0x01748B 05:B47B: 15        .byte $15   ; 



sub_B47C:
- - - - - - 0x01748C 05:B47C: A5 59     LDA ram_subscript
- - - - - - 0x01748E 05:B47E: 30 0E     BMI bra_B48E
- - - - - - 0x017490 05:B480: 20 DF 80  JSR sub_80DF
- - - - - - 0x017493 05:B483: 20 D6 B4  JSR sub_B4D6
- - - - - - 0x017496 05:B486: 20 E6 B5  JSR sub_B5E6
- - - - - - 0x017499 05:B489: A9 02     LDA #con_music_menu
- - - - - - 0x01749B 05:B48B: 20 02 C0  JSR sub_0x01C2F4_play_sound
bra_B48E:
- - - - - - 0x01749E 05:B48E: AD C9 05  LDA ram_счетчик_опций
- - - - - - 0x0174A1 05:B491: 20 53 C0  JSR sub_0x01EC9F_jump_to_pointers_after_JSR
- - - - - - 0x0174A4 05:B494: 98 B4     .word ofs_B498_00
- - - - - - 0x0174A6 05:B496: AE B4     .word ofs_B4AE_01



ofs_B498_00:
- - - - - - 0x0174A8 05:B498: AD B2 05  LDA ram_flag_brightness
- - - - - - 0x0174AB 05:B49B: 10 03     BPL bra_B4A0
- - - - - - 0x0174AD 05:B49D: EE C9 05  INC ram_счетчик_опций
bra_B4A0:
- - - - - - 0x0174B0 05:B4A0: 20 5C C0  JSR sub_0x01D083
- - - - - - 0x0174B3 05:B4A3: A2 0C     LDX #$0C
- - - - - - 0x0174B5 05:B4A5: 20 65 C0  JSR sub_0x01EB9C
- - - - - - 0x0174B8 05:B4A8: 20 14 80  JSR sub_0x01C2AE
- - - - - - 0x0174BB 05:B4AB: 4C D5 B4  RTS



ofs_B4AE_01:
- - - - - - 0x0174BE 05:B4AE: A2 0C     LDX #$0C
- - - - - - 0x0174C0 05:B4B0: 20 65 C0  JSR sub_0x01EB9C
- - - - - - 0x0174C3 05:B4B3: 20 14 80  JSR sub_0x01C2AE
- - - - - - 0x0174C6 05:B4B6: A5 08     LDA ram_btn_press
- - - - - - 0x0174C8 05:B4B8: 29 F0     AND #con_btns__ABSS
- - - - - - 0x0174CA 05:B4BA: F0 19     BEQ bra_B4D5_RTS
- - - - - - 0x0174CC 05:B4BC: A9 33     LDA #con_sfx_yes
- - - - - - 0x0174CE 05:B4BE: 20 02 C0  JSR sub_0x01C2F4_play_sound
- - - - - - 0x0174D1 05:B4C1: 20 44 C0  JSR sub_0x01D057
- - - - - - 0x0174D4 05:B4C4: 20 4A C0  JSR sub_0x01D072
- - - - - - 0x0174D7 05:B4C7: A5 5B     LDA ram_for_0059
- - - - - - 0x0174D9 05:B4C9: 85 59     STA ram_subscript
- - - - - - 0x0174DB 05:B4CB: A9 04     LDA #$04
- - - - - - 0x0174DD 05:B4CD: 8D 29 05  STA ram_опция_материк
- - - - - - 0x0174E0 05:B4D0: A9 06     LDA #$06
- - - - - - 0x0174E2 05:B4D2: 8D 5A 05  STA ram_music_id
bra_B4D5_RTS:
- - - - - - 0x0174E5 05:B4D5: 60        RTS



sub_B4D6:
- - - - - - 0x0174E6 05:B4D6: A9 2F     LDA #$2F
- - - - - - 0x0174E8 05:B4D8: 8D BB 05  STA ram_банк_спрайтов + 3
- - - - - - 0x0174EB 05:B4DB: 20 0B C0  JSR sub_0x01EEAA_базовые_банки_спрайтов
- - - - - - 0x0174EE 05:B4DE: A9 04     LDA #$04
- - - - - - 0x0174F0 05:B4E0: 8D 6D 00  STA ram_006D
- - - - - - 0x0174F3 05:B4E3: A9 07     LDA #$07
- - - - - - 0x0174F5 05:B4E5: 8D 80 00  STA ram_animation_id_ball
- - - - - - 0x0174F8 05:B4E8: 8D AE 05  STA ram_palette_id_spr
- - - - - - 0x0174FB 05:B4EB: A9 C8     LDA #$C8
- - - - - - 0x0174FD 05:B4ED: 8D 20 03  STA ram_pos_X_lo_ball
- - - - - - 0x017500 05:B4F0: A9 A0     LDA #$A0
- - - - - - 0x017502 05:B4F2: 8D 59 03  STA ram_pos_Y_lo_ball
- - - - - - 0x017505 05:B4F5: A5 5B     LDA ram_for_0059
- - - - - - 0x017507 05:B4F7: C9 04     CMP #$04
- - - - - - 0x017509 05:B4F9: F0 0E     BEQ bra_B509_RTS
- - - - - - 0x01750B 05:B4FB: AD 4A 05  LDA ram_054A
- - - - - - 0x01750E 05:B4FE: 20 53 C0  JSR sub_0x01EC9F_jump_to_pointers_after_JSR
- - - - - - 0x017511 05:B501: 0A B5     .word ofs_B50A_00
- - - - - - 0x017513 05:B503: 35 B5     .word ofs_B535_01
- - - - - - 0x017515 05:B505: 54 B5     .word ofs_B554_02
- - - - - - 0x017517 05:B507: 74 B5     .word ofs_B574_03
bra_B509_RTS:
- - - - - - 0x017519 05:B509: 60        RTS



ofs_B50A_00:
- - - - - - 0x01751A 05:B50A: A2 00     LDX #$00
- - - - - - 0x01751C 05:B50C: A0 00     LDY #$00
- - - - - - 0x01751E 05:B50E: AD 55 05  LDA ram_0555
- - - - - - 0x017521 05:B511: C9 5A     CMP #$5A
- - - - - - 0x017523 05:B513: 90 08     BCC bra_B51D
- - - - - - 0x017525 05:B515: A0 06     LDY #$06
- - - - - - 0x017527 05:B517: C9 78     CMP #$78
- - - - - - 0x017529 05:B519: 90 02     BCC bra_B51D
- - - - - - 0x01752B 05:B51B: A0 0C     LDY #$0C
bra_B51D:
- - - - - - 0x01752D 05:B51D: B9 D4 B5  LDA tbl_B5D4,Y
- - - - - - 0x017530 05:B520: 9D 4B 05  STA ram_054B,X
- - - - - - 0x017533 05:B523: E8        INX
- - - - - - 0x017534 05:B524: C8        INY
- - - - - - 0x017535 05:B525: E0 06     CPX #$06
- - - - - - 0x017537 05:B527: 90 F4     BCC bra_B51D
- - - - - - 0x017539 05:B529: A2 04     LDX #$04
- - - - - - 0x01753B 05:B52B: A0 05     LDY #$05
- - - - - - 0x01753D 05:B52D: 20 88 B5  JSR sub_B588
- - - - - - 0x017540 05:B530: F0 D7     BEQ bra_B509_RTS
- - - - - - 0x017542 05:B532: EE 4A 05  INC ram_054A
ofs_B535_01:
- - - - - - 0x017545 05:B535: A2 04     LDX #$04
- - - - - - 0x017547 05:B537: A0 05     LDY #$05
- - - - - - 0x017549 05:B539: 20 A6 B5  JSR sub_B5A6
- - - - - - 0x01754C 05:B53C: 8D 51 05  STA ram_0551
- - - - - - 0x01754F 05:B53F: A2 01     LDX #$01
- - - - - - 0x017551 05:B541: A0 02     LDY #$02
- - - - - - 0x017553 05:B543: 20 88 B5  JSR sub_B588
- - - - - - 0x017556 05:B546: F0 C1     BEQ bra_B509_RTS
- - - - - - 0x017558 05:B548: A2 03     LDX #$03
- - - - - - 0x01755A 05:B54A: A0 06     LDY #$06
- - - - - - 0x01755C 05:B54C: 20 88 B5  JSR sub_B588
- - - - - - 0x01755F 05:B54F: F0 B8     BEQ bra_B509_RTS
- - - - - - 0x017561 05:B551: EE 4A 05  INC ram_054A
ofs_B554_02:
- - - - - - 0x017564 05:B554: A2 01     LDX #$01
- - - - - - 0x017566 05:B556: A0 02     LDY #$02
- - - - - - 0x017568 05:B558: 20 A6 B5  JSR sub_B5A6
- - - - - - 0x01756B 05:B55B: 8D 53 05  STA ram_0553
- - - - - - 0x01756E 05:B55E: A2 03     LDX #$03
- - - - - - 0x017570 05:B560: A0 06     LDY #$06
- - - - - - 0x017572 05:B562: 20 A6 B5  JSR sub_B5A6
- - - - - - 0x017575 05:B565: 8D 52 05  STA ram_0552
- - - - - - 0x017578 05:B568: A2 07     LDX #$07
- - - - - - 0x01757A 05:B56A: A0 08     LDY #$08
- - - - - - 0x01757C 05:B56C: 20 88 B5  JSR sub_B588
- - - - - - 0x01757F 05:B56F: F0 98     BEQ bra_B509_RTS
- - - - - - 0x017581 05:B571: EE 4A 05  INC ram_054A
ofs_B574_03:
- - - - - - 0x017584 05:B574: A2 08     LDX #$08
- - - - - - 0x017586 05:B576: A0 07     LDY #$07
- - - - - - 0x017588 05:B578: 20 A6 B5  JSR sub_B5A6
- - - - - - 0x01758B 05:B57B: 8D 54 05  STA ram_0554
- - - - - - 0x01758E 05:B57E: A2 00     LDX #$00
- - - - - - 0x017590 05:B580: A0 09     LDY #$09
- - - - - - 0x017592 05:B582: 20 88 B5  JSR sub_B588
- - - - - - 0x017595 05:B585: 4C 09 B5  RTS



sub_B588:
- - - - - - 0x017598 05:B588: BD 4B 05  LDA ram_054B,X
- - - - - - 0x01759B 05:B58B: D0 06     BNE bra_B593
- - - - - - 0x01759D 05:B58D: B9 4B 05  LDA ram_054B,Y
- - - - - - 0x0175A0 05:B590: 4C 9B B5  JMP loc_B59B
bra_B593:
- - - - - - 0x0175A3 05:B593: B9 4B 05  LDA ram_054B,Y
- - - - - - 0x0175A6 05:B596: D0 0D     BNE bra_B5A5_RTS
- - - - - - 0x0175A8 05:B598: BD 4B 05  LDA ram_054B,X
loc_B59B:
- - - - - - 0x0175AB 05:B59B: 09 80     ORA #$80
- - - - - - 0x0175AD 05:B59D: 8D 2D 05  STA ram_номер_команды + 1
- - - - - - 0x0175B0 05:B5A0: A9 00     LDA #$00
- - - - - - 0x0175B2 05:B5A2: 8D 2C 05  STA ram_номер_команды
bra_B5A5_RTS:
- - - - - - 0x0175B5 05:B5A5: 60        RTS



sub_B5A6:
- - - - - - 0x0175B6 05:B5A6: BD 4B 05  LDA ram_054B,X
- - - - - - 0x0175B9 05:B5A9: D0 07     BNE bra_B5B2
- - - - - - 0x0175BB 05:B5AB: 09 80     ORA #$80
- - - - - - 0x0175BD 05:B5AD: 9D 4B 05  STA ram_054B,X
- - - - - - 0x0175C0 05:B5B0: D0 0A     BNE bra_B5BC
bra_B5B2:
- - - - - - 0x0175C2 05:B5B2: B9 4B 05  LDA ram_054B,Y
- - - - - - 0x0175C5 05:B5B5: D0 09     BNE bra_B5C0
- - - - - - 0x0175C7 05:B5B7: 09 80     ORA #$80
- - - - - - 0x0175C9 05:B5B9: 99 4B 05  STA ram_054B,Y
bra_B5BC:
- - - - - - 0x0175CC 05:B5BC: A9 00     LDA #$00
- - - - - - 0x0175CE 05:B5BE: F0 13     BEQ bra_B5D3_RTS
bra_B5C0:
- - - - - - 0x0175D0 05:B5C0: AD 00 03  LDA ram_frame_cnt
- - - - - - 0x0175D3 05:B5C3: 29 01     AND #$01
- - - - - - 0x0175D5 05:B5C5: F0 02     BEQ bra_B5C9
- - - - - - 0x0175D7 05:B5C7: 98        TYA
- - - - - - 0x0175D8 05:B5C8: AA        TAX
bra_B5C9:
- - - - - - 0x0175D9 05:B5C9: BD 4B 05  LDA ram_054B,X
- - - - - - 0x0175DC 05:B5CC: 09 80     ORA #$80
- - - - - - 0x0175DE 05:B5CE: 9D 4B 05  STA ram_054B,X
- - - - - - 0x0175E1 05:B5D1: 29 7F     AND #$7F
bra_B5D3_RTS:
- - - - - - 0x0175E3 05:B5D3: 60        RTS



tbl_B5D4:
- - - - - - 0x0175E4 05:B5D4: 0B        .byte $0B   ; 
- - - - - - 0x0175E5 05:B5D5: 09        .byte $09   ; 
- - - - - - 0x0175E6 05:B5D6: 0D        .byte $0D   ; 
- - - - - - 0x0175E7 05:B5D7: 0E        .byte $0E   ; 
- - - - - - 0x0175E8 05:B5D8: 07        .byte $07   ; 
- - - - - - 0x0175E9 05:B5D9: 00        .byte $00   ; 
- - - - - - 0x0175EA 05:B5DA: 0B        .byte $0B   ; 
- - - - - - 0x0175EB 05:B5DB: 09        .byte $09   ; 
- - - - - - 0x0175EC 05:B5DC: 0D        .byte $0D   ; 
- - - - - - 0x0175ED 05:B5DD: 00        .byte $00   ; 
- - - - - - 0x0175EE 05:B5DE: 0E        .byte $0E   ; 
- - - - - - 0x0175EF 05:B5DF: 07        .byte $07   ; 
- - - - - - 0x0175F0 05:B5E0: 0B        .byte $0B   ; 
- - - - - - 0x0175F1 05:B5E1: 09        .byte $09   ; 
- - - - - - 0x0175F2 05:B5E2: 00        .byte $00   ; 
- - - - - - 0x0175F3 05:B5E3: 0D        .byte $0D   ; 
- - - - - - 0x0175F4 05:B5E4: 0E        .byte $0E   ; 
- - - - - - 0x0175F5 05:B5E5: 07        .byte $07   ; 



sub_B5E6:
- - - - - - 0x0175F6 05:B5E6: 20 11 C0  JSR sub_0x01ECB9
- - - - - - 0x0175F9 05:B5E9: 20 17 C0  JSR sub_0x01EE81_disable_NMI
- - - - - - 0x0175FC 05:B5EC: 20 1D C0  JSR sub_0x01ECD1_скрыть_фон_и_спрайты_за_полоской_слева
- - - - - - 0x0175FF 05:B5EF: A2 00     LDX #$00
- - - - - - 0x017601 05:B5F1: A9 25     LDA #$25
- - - - - - 0x017603 05:B5F3: 85 32     STA ram_0032
- - - - - - 0x017605 05:B5F5: A9 21     LDA #$21
- - - - - - 0x017607 05:B5F7: 85 33     STA ram_0033
- - - - - - 0x017609 05:B5F9: A9 FF     LDA #$FF
- - - - - - 0x01760B 05:B5FB: 85 1C     STA ram_001C
- - - - - - 0x01760D 05:B5FD: 85 23     STA ram_0023
- - - - - - 0x01760F 05:B5FF: A9 DA     LDA #$DA
- - - - - - 0x017611 05:B601: 85 1D     STA ram_001D
- - - - - - 0x017613 05:B603: A9 DB     LDA #$DB
- - - - - - 0x017615 05:B605: 85 1E     STA ram_001E
- - - - - - 0x017617 05:B607: A9 08     LDA #$08
- - - - - - 0x017619 05:B609: 85 1F     STA ram_001F
bra_B60B:
- - - - - - 0x01761B 05:B60B: 86 20     STX ram_0020
- - - - - - 0x01761D 05:B60D: BD 4B 05  LDA ram_054B,X
- - - - - - 0x017620 05:B610: 0A        ASL
- - - - - - 0x017621 05:B611: 0A        ASL
- - - - - - 0x017622 05:B612: 0A        ASL
- - - - - - 0x017623 05:B613: 6D 44 B7  ADC tbl_B744
- - - - - - 0x017626 05:B616: 85 30     STA ram_0030
- - - - - - 0x017628 05:B618: A9 00     LDA #$00
- - - - - - 0x01762A 05:B61A: 6D 45 B7  ADC tbl_B744 + 1
- - - - - - 0x01762D 05:B61D: 85 31     STA ram_0031
- - - - - - 0x01762F 05:B61F: A5 1F     LDA ram_001F
- - - - - - 0x017631 05:B621: 8D 95 06  STA ram_счетчик_буфера_атрибутов
- - - - - - 0x017634 05:B624: 8D B8 06  STA ram_счетчик_буфера_графики
- - - - - - 0x017637 05:B627: 20 91 AD  JSR sub_AD91
- - - - - - 0x01763A 05:B62A: 18        CLC
- - - - - - 0x01763B 05:B62B: A5 32     LDA ram_0032
- - - - - - 0x01763D 05:B62D: 8D 94 06  STA ram_байт_2006_lo_атрибуты
- - - - - - 0x017640 05:B630: 69 20     ADC #$20
- - - - - - 0x017642 05:B632: 8D B7 06  STA ram_байт_2006_lo_графика
- - - - - - 0x017645 05:B635: 85 32     STA ram_0032
- - - - - - 0x017647 05:B637: A5 33     LDA ram_0033
- - - - - - 0x017649 05:B639: 8D 93 06  STA ram_байт_2006_hi_атрибуты
- - - - - - 0x01764C 05:B63C: 69 00     ADC #$00
- - - - - - 0x01764E 05:B63E: 8D B6 06  STA ram_байт_2006_hi_графика
- - - - - - 0x017651 05:B641: 85 33     STA ram_0033
- - - - - - 0x017653 05:B643: 18        CLC
- - - - - - 0x017654 05:B644: A5 32     LDA ram_0032
- - - - - - 0x017656 05:B646: 69 40     ADC #$40
- - - - - - 0x017658 05:B648: 85 32     STA ram_0032
- - - - - - 0x01765A 05:B64A: A5 33     LDA ram_0033
- - - - - - 0x01765C 05:B64C: 69 00     ADC #$00
- - - - - - 0x01765E 05:B64E: 85 33     STA ram_0033
- - - - - - 0x017660 05:B650: 20 6B C0  JSR sub_0x01EFBD_write_buffers_to_ppu
- - - - - - 0x017663 05:B653: A6 20     LDX ram_0020
- - - - - - 0x017665 05:B655: BD 4B 05  LDA ram_054B,X
- - - - - - 0x017668 05:B658: 29 0F     AND #$0F
- - - - - - 0x01766A 05:B65A: 85 22     STA ram_0022
- - - - - - 0x01766C 05:B65C: A0 01     LDY #$01
bra_B65E:
- - - - - - 0x01766E 05:B65E: B9 2C 05  LDA ram_номер_команды,Y
- - - - - - 0x017671 05:B661: 29 0F     AND #$0F
- - - - - - 0x017673 05:B663: C5 22     CMP ram_0022
- - - - - - 0x017675 05:B665: F0 05     BEQ bra_B66C
- - - - - - 0x017677 05:B667: 88        DEY
- - - - - - 0x017678 05:B668: 10 F4     BPL bra_B65E
- - - - - - 0x01767A 05:B66A: 30 04     BMI bra_B670
bra_B66C:
- - - - - - 0x01767C 05:B66C: 8A        TXA
- - - - - - 0x01767D 05:B66D: 20 EF B6  JSR sub_B6EF
bra_B670:
- - - - - - 0x017680 05:B670: A6 20     LDX ram_0020
- - - - - - 0x017682 05:B672: E8        INX
- - - - - - 0x017683 05:B673: E0 06     CPX #$06
- - - - - - 0x017685 05:B675: 90 94     BCC bra_B60B
- - - - - - 0x017687 05:B677: A2 00     LDX #$00
loc_B679:
- - - - - - 0x017689 05:B679: 86 20     STX ram_0020
- - - - - - 0x01768B 05:B67B: EC 4A 05  CPX ram_054A
- - - - - - 0x01768E 05:B67E: B0 2E     BCS bra_B6AE
- - - - - - 0x017690 05:B680: A2 00     LDX #$00
bra_B682:
- - - - - - 0x017692 05:B682: 86 21     STX ram_0021
- - - - - - 0x017694 05:B684: BD 4B 05  LDA ram_054B,X
- - - - - - 0x017697 05:B687: 10 0C     BPL bra_B695
- - - - - - 0x017699 05:B689: 8A        TXA
- - - - - - 0x01769A 05:B68A: 20 B5 B6  JSR sub_B6B5
- - - - - - 0x01769D 05:B68D: A9 04     LDA #$04
- - - - - - 0x01769F 05:B68F: 8D 91 06  STA ram_бит_для_2000_графика
- - - - - - 0x0176A2 05:B692: 20 6B C0  JSR sub_0x01EFBD_write_buffers_to_ppu
bra_B695:
- - - - - - 0x0176A5 05:B695: A6 21     LDX ram_0021
- - - - - - 0x0176A7 05:B697: E8        INX
- - - - - - 0x0176A8 05:B698: E0 0A     CPX #$0A
- - - - - - 0x0176AA 05:B69A: 90 E6     BCC bra_B682
- - - - - - 0x0176AC 05:B69C: 18        CLC
- - - - - - 0x0176AD 05:B69D: AD 4A 05  LDA ram_054A
- - - - - - 0x0176B0 05:B6A0: 69 08     ADC #$08
- - - - - - 0x0176B2 05:B6A2: 20 B5 B6  JSR sub_B6B5
- - - - - - 0x0176B5 05:B6A5: 20 6B C0  JSR sub_0x01EFBD_write_buffers_to_ppu
- - - - - - 0x0176B8 05:B6A8: A6 20     LDX ram_0020
- - - - - - 0x0176BA 05:B6AA: E8        INX
- - - - - - 0x0176BB 05:B6AB: 4C 79 B6  JMP loc_B679
bra_B6AE:
- - - - - - 0x0176BE 05:B6AE: 20 1A C0  JSR sub_0x01ECDB_отобразить_фон_и_спрайты
- - - - - - 0x0176C1 05:B6B1: 20 14 C0  JSR sub_0x01EE75_enable_NMI
- - - - - - 0x0176C4 05:B6B4: 60        RTS



sub_B6B5:
- - - - - - 0x0176C5 05:B6B5: 85 1C     STA ram_001C
- - - - - - 0x0176C7 05:B6B7: 0A        ASL
- - - - - - 0x0176C8 05:B6B8: 65 1C     ADC ram_001C
- - - - - - 0x0176CA 05:B6BA: 0A        ASL
- - - - - - 0x0176CB 05:B6BB: A8        TAY
- - - - - - 0x0176CC 05:B6BC: B9 C6 B7  LDA tbl_B7C6,Y
- - - - - - 0x0176CF 05:B6BF: 85 30     STA ram_0030
- - - - - - 0x0176D1 05:B6C1: B9 C7 B7  LDA tbl_B7C6 + 1,Y
- - - - - - 0x0176D4 05:B6C4: 85 31     STA ram_0031
- - - - - - 0x0176D6 05:B6C6: B9 C8 B7  LDA tbl_B7C8,Y
- - - - - - 0x0176D9 05:B6C9: 85 32     STA ram_0032
- - - - - - 0x0176DB 05:B6CB: B9 C9 B7  LDA tbl_B7C8 + 1,Y
- - - - - - 0x0176DE 05:B6CE: 85 33     STA ram_0033
- - - - - - 0x0176E0 05:B6D0: B9 CA B7  LDA tbl_B7CA,Y
- - - - - - 0x0176E3 05:B6D3: 85 34     STA ram_0034
- - - - - - 0x0176E5 05:B6D5: B9 CB B7  LDA tbl_B7CA + 1,Y
- - - - - - 0x0176E8 05:B6D8: 85 35     STA ram_0035
- - - - - - 0x0176EA 05:B6DA: A0 0A     LDY #$0A
bra_B6DC:
- - - - - - 0x0176EC 05:B6DC: B1 30     LDA (ram_0030),Y
- - - - - - 0x0176EE 05:B6DE: 99 93 06  STA ram_байт_2006_hi_атрибуты,Y
- - - - - - 0x0176F1 05:B6E1: B1 32     LDA (ram_0032),Y
- - - - - - 0x0176F3 05:B6E3: 99 B6 06  STA ram_байт_2006_hi_графика,Y
- - - - - - 0x0176F6 05:B6E6: B1 34     LDA (ram_0034),Y
- - - - - - 0x0176F8 05:B6E8: 99 D9 06  STA ram_байт_2006_hi_палитра,Y
- - - - - - 0x0176FB 05:B6EB: 88        DEY
- - - - - - 0x0176FC 05:B6EC: 10 EE     BPL bra_B6DC
- - - - - - 0x0176FE 05:B6EE: 60        RTS



sub_B6EF:
- - - - - - 0x0176FF 05:B6EF: 85 22     STA ram_0022
- - - - - - 0x017701 05:B6F1: 0A        ASL
- - - - - - 0x017702 05:B6F2: 65 22     ADC ram_0022
- - - - - - 0x017704 05:B6F4: 0A        ASL
- - - - - - 0x017705 05:B6F5: A8        TAY
- - - - - - 0x017706 05:B6F6: B9 81 B8  LDA tbl_B881,Y
- - - - - - 0x017709 05:B6F9: 8D 93 06  STA ram_байт_2006_hi_атрибуты
- - - - - - 0x01770C 05:B6FC: B9 82 B8  LDA tbl_B882,Y
- - - - - - 0x01770F 05:B6FF: 8D 94 06  STA ram_байт_2006_lo_атрибуты
- - - - - - 0x017712 05:B702: B9 83 B8  LDA tbl_B883,Y
- - - - - - 0x017715 05:B705: 8D 96 06  STA ram_буфер_атрибутов
- - - - - - 0x017718 05:B708: 8D 97 06  STA ram_буфер_атрибутов + 1
- - - - - - 0x01771B 05:B70B: B9 84 B8  LDA tbl_B884,Y
- - - - - - 0x01771E 05:B70E: 8D B6 06  STA ram_байт_2006_hi_графика
- - - - - - 0x017721 05:B711: B9 85 B8  LDA tbl_B885,Y
- - - - - - 0x017724 05:B714: 8D B7 06  STA ram_байт_2006_lo_графика
- - - - - - 0x017727 05:B717: B9 86 B8  LDA tbl_B886,Y
- - - - - - 0x01772A 05:B71A: 8D B9 06  STA ram_буфер_графики
- - - - - - 0x01772D 05:B71D: 8D BA 06  STA ram_буфер_графики + 1
- - - - - - 0x017730 05:B720: A9 02     LDA #$02
- - - - - - 0x017732 05:B722: 8D 95 06  STA ram_счетчик_буфера_атрибутов
- - - - - - 0x017735 05:B725: 8D B8 06  STA ram_счетчик_буфера_графики
- - - - - - 0x017738 05:B728: A5 23     LDA ram_0023
- - - - - - 0x01773A 05:B72A: 30 10     BMI bra_B73C
- - - - - - 0x01773C 05:B72C: E6 23     INC ram_0023
- - - - - - 0x01773E 05:B72E: A5 23     LDA ram_0023
- - - - - - 0x017740 05:B730: C5 22     CMP ram_0022
- - - - - - 0x017742 05:B732: D0 08     BNE bra_B73C
- - - - - - 0x017744 05:B734: A9 AA     LDA #$AA
- - - - - - 0x017746 05:B736: 8D 96 06  STA ram_буфер_атрибутов
- - - - - - 0x017749 05:B739: 8D 97 06  STA ram_буфер_атрибутов + 1
bra_B73C:
- - - - - - 0x01774C 05:B73C: A5 22     LDA ram_0022
- - - - - - 0x01774E 05:B73E: 85 23     STA ram_0023
- - - - - - 0x017750 05:B740: 20 6B C0  JSR sub_0x01EFBD_write_buffers_to_ppu
- - - - - - 0x017753 05:B743: 60        RTS



tbl_B744:
- - - - - - 0x017754 05:B744: 46 B7     .word off_B746

off_B746:
- - - - - - 0x017756 05:B746: B9        .byte $B9   ; 
- - - - - - 0x017757 05:B747: D0        .byte $D0   ; 
- - - - - - 0x017758 05:B748: AA        .byte $AA   ; 
- - - - - - 0x017759 05:B749: B3        .byte $B3   ; 
- - - - - - 0x01775A 05:B74A: 8F        .byte $8F   ; 
- - - - - - 0x01775B 05:B74B: 8C        .byte $8C   ; 
- - - - - - 0x01775C 05:B74C: FF        .byte $FF   ; 
- - - - - - 0x01775D 05:B74D: FF        .byte $FF   ; 
- - - - - - 0x01775E 05:B74E: A7        .byte $A7   ; 
- - - - - - 0x01775F 05:B74F: CF        .byte $CF   ; 
- - - - - - 0x017760 05:B750: AB        .byte $AB   ; 
- - - - - - 0x017761 05:B751: A9        .byte $A9   ; 
- - - - - - 0x017762 05:B752: FF        .byte $FF   ; 
- - - - - - 0x017763 05:B753: FF        .byte $FF   ; 
- - - - - - 0x017764 05:B754: FF        .byte $FF   ; 
- - - - - - 0x017765 05:B755: FF        .byte $FF   ; 
- - - - - - 0x017766 05:B756: C4        .byte $C4   ; 
- - - - - - 0x017767 05:B757: CF        .byte $CF   ; 
- - - - - - 0x017768 05:B758: 2B        .byte $2B   ; 
- - - - - - 0x017769 05:B759: CA        .byte $CA   ; 
- - - - - - 0x01776A 05:B75A: FF        .byte $FF   ; 
- - - - - - 0x01776B 05:B75B: FF        .byte $FF   ; 
- - - - - - 0x01776C 05:B75C: FF        .byte $FF   ; 
- - - - - - 0x01776D 05:B75D: FF        .byte $FF   ; 
- - - - - - 0x01776E 05:B75E: B1        .byte $B1   ; 
- - - - - - 0x01776F 05:B75F: A3        .byte $A3   ; 
- - - - - - 0x017770 05:B760: FF        .byte $FF   ; 
- - - - - - 0x017771 05:B761: FF        .byte $FF   ; 
- - - - - - 0x017772 05:B762: FF        .byte $FF   ; 
- - - - - - 0x017773 05:B763: FF        .byte $FF   ; 
- - - - - - 0x017774 05:B764: FF        .byte $FF   ; 
- - - - - - 0x017775 05:B765: FF        .byte $FF   ; 
- - - - - - 0x017776 05:B766: B9        .byte $B9   ; 
- - - - - - 0x017777 05:B767: D0        .byte $D0   ; 
- - - - - - 0x017778 05:B768: AA        .byte $AA   ; 
- - - - - - 0x017779 05:B769: B3        .byte $B3   ; 
- - - - - - 0x01777A 05:B76A: FF        .byte $FF   ; 
- - - - - - 0x01777B 05:B76B: FF        .byte $FF   ; 
- - - - - - 0x01777C 05:B76C: FF        .byte $FF   ; 
- - - - - - 0x01777D 05:B76D: FF        .byte $FF   ; 
- - - - - - 0x01777E 05:B76E: 28        .byte $28   ; 
- - - - - - 0x01777F 05:B76F: B7        .byte $B7   ; 
- - - - - - 0x017780 05:B770: A2        .byte $A2   ; 
- - - - - - 0x017781 05:B771: FF        .byte $FF   ; 
- - - - - - 0x017782 05:B772: FF        .byte $FF   ; 
- - - - - - 0x017783 05:B773: FF        .byte $FF   ; 
- - - - - - 0x017784 05:B774: FF        .byte $FF   ; 
- - - - - - 0x017785 05:B775: FF        .byte $FF   ; 
- - - - - - 0x017786 05:B776: AF        .byte $AF   ; 
- - - - - - 0x017787 05:B777: B9        .byte $B9   ; 
- - - - - - 0x017788 05:B778: 27        .byte $27   ; 
- - - - - - 0x017789 05:B779: CA        .byte $CA   ; 
- - - - - - 0x01778A 05:B77A: FF        .byte $FF   ; 
- - - - - - 0x01778B 05:B77B: FF        .byte $FF   ; 
- - - - - - 0x01778C 05:B77C: FF        .byte $FF   ; 
- - - - - - 0x01778D 05:B77D: FF        .byte $FF   ; 
- - - - - - 0x01778E 05:B77E: A7        .byte $A7   ; 
- - - - - - 0x01778F 05:B77F: C3        .byte $C3   ; 
- - - - - - 0x017790 05:B780: CA        .byte $CA   ; 
- - - - - - 0x017791 05:B781: D9        .byte $D9   ; 
- - - - - - 0x017792 05:B782: CF        .byte $CF   ; 
- - - - - - 0x017793 05:B783: FF        .byte $FF   ; 
- - - - - - 0x017794 05:B784: FF        .byte $FF   ; 
- - - - - - 0x017795 05:B785: FF        .byte $FF   ; 
- - - - - - 0x017796 05:B786: B9        .byte $B9   ; 
- - - - - - 0x017797 05:B787: D0        .byte $D0   ; 
- - - - - - 0x017798 05:B788: AA        .byte $AA   ; 
- - - - - - 0x017799 05:B789: B3        .byte $B3   ; 
- - - - - - 0x01779A 05:B78A: FF        .byte $FF   ; 
- - - - - - 0x01779B 05:B78B: FF        .byte $FF   ; 
- - - - - - 0x01779C 05:B78C: FF        .byte $FF   ; 
- - - - - - 0x01779D 05:B78D: FF        .byte $FF   ; 
- - - - - - 0x01779E 05:B78E: 35        .byte $35   ; 
- - - - - - 0x01779F 05:B78F: A3        .byte $A3   ; 
- - - - - - 0x0177A0 05:B790: B3        .byte $B3   ; 
- - - - - - 0x0177A1 05:B791: FF        .byte $FF   ; 
- - - - - - 0x0177A2 05:B792: FF        .byte $FF   ; 
- - - - - - 0x0177A3 05:B793: FF        .byte $FF   ; 
- - - - - - 0x0177A4 05:B794: FF        .byte $FF   ; 
- - - - - - 0x0177A5 05:B795: FF        .byte $FF   ; 
- - - - - - 0x0177A6 05:B796: A3        .byte $A3   ; 
- - - - - - 0x0177A7 05:B797: CF        .byte $CF   ; 
- - - - - - 0x0177A8 05:B798: 29        .byte $29   ; 
- - - - - - 0x0177A9 05:B799: C8        .byte $C8   ; 
- - - - - - 0x0177AA 05:B79A: CF        .byte $CF   ; 
- - - - - - 0x0177AB 05:B79B: 35        .byte $35   ; 
- - - - - - 0x0177AC 05:B79C: FF        .byte $FF   ; 
- - - - - - 0x0177AD 05:B79D: FF        .byte $FF   ; 
- - - - - - 0x0177AE 05:B79E: A3        .byte $A3   ; 
- - - - - - 0x0177AF 05:B79F: B1        .byte $B1   ; 
- - - - - - 0x0177B0 05:B7A0: C9        .byte $C9   ; 
- - - - - - 0x0177B1 05:B7A1: A2        .byte $A2   ; 
- - - - - - 0x0177B2 05:B7A2: FF        .byte $FF   ; 
- - - - - - 0x0177B3 05:B7A3: FF        .byte $FF   ; 
- - - - - - 0x0177B4 05:B7A4: FF        .byte $FF   ; 
- - - - - - 0x0177B5 05:B7A5: FF        .byte $FF   ; 
- - - - - - 0x0177B6 05:B7A6: B9        .byte $B9   ; 
- - - - - - 0x0177B7 05:B7A7: D0        .byte $D0   ; 
- - - - - - 0x0177B8 05:B7A8: AA        .byte $AA   ; 
- - - - - - 0x0177B9 05:B7A9: B3        .byte $B3   ; 
- - - - - - 0x0177BA 05:B7AA: FF        .byte $FF   ; 
- - - - - - 0x0177BB 05:B7AB: FF        .byte $FF   ; 
- - - - - - 0x0177BC 05:B7AC: FF        .byte $FF   ; 
- - - - - - 0x0177BD 05:B7AD: FF        .byte $FF   ; 
- - - - - - 0x0177BE 05:B7AE: 3D        .byte $3D   ; 
- - - - - - 0x0177BF 05:B7AF: C8        .byte $C8   ; 
- - - - - - 0x0177C0 05:B7B0: 2D        .byte $2D   ; 
- - - - - - 0x0177C1 05:B7B1: CA        .byte $CA   ; 
- - - - - - 0x0177C2 05:B7B2: FF        .byte $FF   ; 
- - - - - - 0x0177C3 05:B7B3: FF        .byte $FF   ; 
- - - - - - 0x0177C4 05:B7B4: FF        .byte $FF   ; 
- - - - - - 0x0177C5 05:B7B5: FF        .byte $FF   ; 
- - - - - - 0x0177C6 05:B7B6: A2        .byte $A2   ; 
- - - - - - 0x0177C7 05:B7B7: CA        .byte $CA   ; 
- - - - - - 0x0177C8 05:B7B8: 2F        .byte $2F   ; 
- - - - - - 0x0177C9 05:B7B9: CF        .byte $CF   ; 
- - - - - - 0x0177CA 05:B7BA: B2        .byte $B2   ; 
- - - - - - 0x0177CB 05:B7BB: CF        .byte $CF   ; 
- - - - - - 0x0177CC 05:B7BC: FF        .byte $FF   ; 
- - - - - - 0x0177CD 05:B7BD: FF        .byte $FF   ; 
- - - - - - 0x0177CE 05:B7BE: C3        .byte $C3   ; 
- - - - - - 0x0177CF 05:B7BF: A8        .byte $A8   ; 
- - - - - - 0x0177D0 05:B7C0: AD        .byte $AD   ; 
- - - - - - 0x0177D1 05:B7C1: AB        .byte $AB   ; 
- - - - - - 0x0177D2 05:B7C2: FF        .byte $FF   ; 
- - - - - - 0x0177D3 05:B7C3: FF        .byte $FF   ; 
- - - - - - 0x0177D4 05:B7C4: FF        .byte $FF   ; 
- - - - - - 0x0177D5 05:B7C5: FF        .byte $FF   ; 



tbl_B7C6:
- - - - - - 0x0177D6 05:B7C6: 0E B8     .word off_B80E_00
tbl_B7C8:
- - - - - - 0x0177D8 05:B7C8: 0E B8     .word off_B80E_01
tbl_B7CA:
- - - - - - 0x0177DA 05:B7CA: 0E B8     .word off_B80E_02
- - - - - - 0x0177DC 05:B7CC: 0F B8     .word off_B80F_03
- - - - - - 0x0177DE 05:B7CE: 15 B8     .word off_B815_04
- - - - - - 0x0177E0 05:B7D0: 1A B8     .word off_B81A_05
- - - - - - 0x0177E2 05:B7D2: 1F B8     .word off_B81F_06
- - - - - - 0x0177E4 05:B7D4: 25 B8     .word off_B825_07
- - - - - - 0x0177E6 05:B7D6: 1A B8     .word off_B81A_08
- - - - - - 0x0177E8 05:B7D8: 2B B8     .word off_B82B_09
- - - - - - 0x0177EA 05:B7DA: 32 B8     .word off_B832_0A
- - - - - - 0x0177EC 05:B7DC: 38 B8     .word off_B838_0B
- - - - - - 0x0177EE 05:B7DE: 3D B8     .word off_B83D_0C
- - - - - - 0x0177F0 05:B7E0: 41 B8     .word off_B841_0D
- - - - - - 0x0177F2 05:B7E2: 46 B8     .word off_B846_0E
- - - - - - 0x0177F4 05:B7E4: 4B B8     .word off_B84B_0F
- - - - - - 0x0177F6 05:B7E6: 4F B8     .word off_B84F_10
- - - - - - 0x0177F8 05:B7E8: 46 B8     .word off_B846_11
- - - - - - 0x0177FA 05:B7EA: 0E B8     .word off_B80E_12
- - - - - - 0x0177FC 05:B7EC: 55 B8     .word off_B855_13
- - - - - - 0x0177FE 05:B7EE: 38 B8     .word off_B838_14
- - - - - - 0x017800 05:B7F0: 0E B8     .word off_B80E_15
- - - - - - 0x017802 05:B7F2: 5B B8     .word off_B85B_16
- - - - - - 0x017804 05:B7F4: 63 B8     .word off_B863_17
- - - - - - 0x017806 05:B7F6: 0E B8     .word off_B80E_18
- - - - - - 0x017808 05:B7F8: 68 B8     .word off_B868_19
- - - - - - 0x01780A 05:B7FA: 63 B8     .word off_B863_1A
- - - - - - 0x01780C 05:B7FC: 6F B8     .word off_B86F_1B
- - - - - - 0x01780E 05:B7FE: 0E B8     .word off_B80E_1C
- - - - - - 0x017810 05:B800: 0E B8     .word off_B80E_1D
- - - - - - 0x017812 05:B802: 0E B8     .word off_B80E_1E
- - - - - - 0x017814 05:B804: 0E B8     .word off_B80E_1F
- - - - - - 0x017816 05:B806: 0E B8     .word off_B80E_20
- - - - - - 0x017818 05:B808: 76 B8     .word off_B876_21
- - - - - - 0x01781A 05:B80A: 0E B8     .word off_B80E_22
- - - - - - 0x01781C 05:B80C: 0E B8     .word off_B80E_23



off_B80E_00:
off_B80E_01:
off_B80E_02:
off_B80E_12:
off_B80E_15:
off_B80E_18:
off_B80E_1C:
off_B80E_1D:
off_B80E_1E:
off_B80E_1F:
off_B80E_20:
off_B80E_22:
off_B80E_23:
- - - - - - 0x01781E 05:B80E: FF        .byte $FF   ; 



off_B80F_03:
- - - - - - 0x01781F 05:B80F: 21 AD     .dbyt $21AD
- - - - - - 0x017821 05:B811: 03        .byte $03   ; 
- - - - - - 0x017822 05:B812: 3B        .byte $3B   ; 
- - - - - - 0x017823 05:B813: 3B        .byte $3B   ; 
- - - - - - 0x017824 05:B814: 3B        .byte $3B   ; 



off_B815_04:
- - - - - - 0x017825 05:B815: 21 B0     .dbyt $21B0
- - - - - - 0x017827 05:B817: 02        .byte $02   ; 
- - - - - - 0x017828 05:B818: 70        .byte $70   ; 
- - - - - - 0x017829 05:B819: 71        .byte $71   ; 



off_B81A_05:
off_B81A_08:
- - - - - - 0x01782A 05:B81A: 21 D1     .dbyt $21D1
- - - - - - 0x01782C 05:B81C: 02        .byte $02   ; 
- - - - - - 0x01782D 05:B81D: 08        .byte $08   ; 
- - - - - - 0x01782E 05:B81E: 75        .byte $75   ; 



off_B81F_06:
- - - - - - 0x01782F 05:B81F: 22 0D     .dbyt $220D
- - - - - - 0x017831 05:B821: 03        .byte $03   ; 
- - - - - - 0x017832 05:B822: 3B        .byte $3B   ; 
- - - - - - 0x017833 05:B823: 3B        .byte $3B   ; 
- - - - - - 0x017834 05:B824: 3B        .byte $3B   ; 



off_B825_07:
- - - - - - 0x017835 05:B825: 21 D0     .dbyt $21D0
- - - - - - 0x017837 05:B827: 03        .byte $03   ; 
- - - - - - 0x017838 05:B828: 68        .byte $68   ; 
- - - - - - 0x017839 05:B829: 72        .byte $72   ; 
- - - - - - 0x01783A 05:B82A: 73        .byte $73   ; 



off_B82B_09:
- - - - - - 0x01783B 05:B82B: 22 6D     .dbyt $226D
- - - - - - 0x01783D 05:B82D: 04        .byte $04   ; 
- - - - - - 0x01783E 05:B82E: 3B        .byte $3B   ; 
- - - - - - 0x01783F 05:B82F: 3B        .byte $3B   ; 
- - - - - - 0x017840 05:B830: 3B        .byte $3B   ; 
- - - - - - 0x017841 05:B831: 69        .byte $69   ; 



off_B832_0A:
- - - - - - 0x017842 05:B832: 22 70     .dbyt $2270
- - - - - - 0x017844 05:B834: 03        .byte $03   ; 
- - - - - - 0x017845 05:B835: 70        .byte $70   ; 
- - - - - - 0x017846 05:B836: 72        .byte $72   ; 
- - - - - - 0x017847 05:B837: 79        .byte $79   ; 



off_B838_0B:
off_B838_14:
- - - - - - 0x017848 05:B838: 22 B1     .dbyt $22B1
- - - - - - 0x01784A 05:B83A: 02        .byte $02   ; 
- - - - - - 0x01784B 05:B83B: 3B        .byte $3B   ; 
- - - - - - 0x01784C 05:B83C: ED        .byte $ED   ; 



off_B83D_0C:
- - - - - - 0x01784D 05:B83D: 22 CD     .dbyt $22CD
- - - - - - 0x01784F 05:B83F: 01        .byte $01   ; 
- - - - - - 0x017850 05:B840: 3B        .byte $3B   ; 



off_B841_0D:
- - - - - - 0x017851 05:B841: 22 CE     .dbyt $22CE
- - - - - - 0x017853 05:B843: 02        .byte $02   ; 
- - - - - - 0x017854 05:B844: 70        .byte $70   ; 
- - - - - - 0x017855 05:B845: 71        .byte $71   ; 



off_B846_0E:
off_B846_11:
- - - - - - 0x017856 05:B846: 22 EF     .dbyt $22EF
- - - - - - 0x017858 05:B848: 02        .byte $02   ; 
- - - - - - 0x017859 05:B849: 08        .byte $08   ; 
- - - - - - 0x01785A 05:B84A: 78        .byte $78   ; 



off_B84B_0F:
- - - - - - 0x01785B 05:B84B: 23 2D     .dbyt $232D
- - - - - - 0x01785D 05:B84D: 01        .byte $01   ; 
- - - - - - 0x01785E 05:B84E: 3B        .byte $3B   ; 



off_B84F_10:
- - - - - - 0x01785F 05:B84F: 22 EE     .dbyt $22EE
- - - - - - 0x017861 05:B851: 03        .byte $03   ; 
- - - - - - 0x017862 05:B852: 68        .byte $68   ; 
- - - - - - 0x017863 05:B853: 72        .byte $72   ; 
- - - - - - 0x017864 05:B854: 73        .byte $73   ; 



off_B855_13:
- - - - - - 0x017865 05:B855: 22 B0     .dbyt $22B0
- - - - - - 0x017867 05:B857: 03        .byte $03   ; 
- - - - - - 0x017868 05:B858: 77        .byte $77   ; 
- - - - - - 0x017869 05:B859: 72        .byte $72   ; 
- - - - - - 0x01786A 05:B85A: 76        .byte $76   ; 



off_B85B_16:
- - - - - - 0x01786B 05:B85B: 22 32     .dbyt $2232
- - - - - - 0x01786D 05:B85D: 05        .byte $05   ; 
- - - - - - 0x01786E 05:B85E: 68        .byte $68   ; 
- - - - - - 0x01786F 05:B85F: 72        .byte $72   ; 
- - - - - - 0x017870 05:B860: 72        .byte $72   ; 
- - - - - - 0x017871 05:B861: 72        .byte $72   ; 
- - - - - - 0x017872 05:B862: 73        .byte $73   ; 



off_B863_17:
off_B863_1A:
- - - - - - 0x017873 05:B863: 22 33     .dbyt $2233
- - - - - - 0x017875 05:B865: 02        .byte $02   ; 
- - - - - - 0x017876 05:B866: 08        .byte $08   ; 
- - - - - - 0x017877 05:B867: 78        .byte $78   ; 



off_B868_19:
- - - - - - 0x017878 05:B868: 21 D2     .dbyt $21D2
- - - - - - 0x01787A 05:B86A: 04        .byte $04   ; 
- - - - - - 0x01787B 05:B86B: 75        .byte $75   ; 
- - - - - - 0x01787C 05:B86C: 72        .byte $72   ; 
- - - - - - 0x01787D 05:B86D: 72        .byte $72   ; 
- - - - - - 0x01787E 05:B86E: 71        .byte $71   ; 



off_B86F_1B:
- - - - - - 0x01787F 05:B86F: 22 6D     .dbyt $226D
- - - - - - 0x017881 05:B871: 04        .byte $04   ; 
- - - - - - 0x017882 05:B872: 3B        .byte $3B   ; 
- - - - - - 0x017883 05:B873: 3B        .byte $3B   ; 
- - - - - - 0x017884 05:B874: 3B        .byte $3B   ; 
- - - - - - 0x017885 05:B875: 69        .byte $69   ; 



off_B876_21:
- - - - - - 0x017886 05:B876: 21 4D     .dbyt $214D
- - - - - - 0x017888 05:B878: 08        .byte $08   ; 
- - - - - - 0x017889 05:B879: 3B        .byte $3B   ; 
- - - - - - 0x01788A 05:B87A: 3B        .byte $3B   ; 
- - - - - - 0x01788B 05:B87B: 3B        .byte $3B   ; 
- - - - - - 0x01788C 05:B87C: 3B        .byte $3B   ; 
- - - - - - 0x01788D 05:B87D: 3B        .byte $3B   ; 
- - - - - - 0x01788E 05:B87E: 3B        .byte $3B   ; 
- - - - - - 0x01788F 05:B87F: 3B        .byte $3B   ; 
- - - - - - 0x017890 05:B880: 69        .byte $69   ; 



tbl_B881:
- - - - - - 0x017891 05:B881: 23        .byte $23   ; 
tbl_B882:
- - - - - - 0x017892 05:B882: D1        .byte $D1   ; 
tbl_B883:
- - - - - - 0x017893 05:B883: AA        .byte $AA   ; 
tbl_B884:
- - - - - - 0x017894 05:B884: FF        .byte $FF   ; 
tbl_B885:
- - - - - - 0x017895 05:B885: FF        .byte $FF   ; 
tbl_B886:
- - - - - - 0x017896 05:B886: FF        .byte $FF   ; 
- - - - - - 0x017897 05:B887: 23        .byte $23   ; 
- - - - - - 0x017898 05:B888: D9        .byte $D9   ; 
- - - - - - 0x017899 05:B889: FA        .byte $FA   ; 
- - - - - - 0x01789A 05:B88A: FF        .byte $FF   ; 
- - - - - - 0x01789B 05:B88B: FF        .byte $FF   ; 
- - - - - - 0x01789C 05:B88C: FF        .byte $FF   ; 
- - - - - - 0x01789D 05:B88D: 23        .byte $23   ; 
- - - - - - 0x01789E 05:B88E: D9        .byte $D9   ; 
- - - - - - 0x01789F 05:B88F: AF        .byte $AF   ; 
- - - - - - 0x0178A0 05:B890: 23        .byte $23   ; 
- - - - - - 0x0178A1 05:B891: E1        .byte $E1   ; 
- - - - - - 0x0178A2 05:B892: FA        .byte $FA   ; 
- - - - - - 0x0178A3 05:B893: 23        .byte $23   ; 
- - - - - - 0x0178A4 05:B894: E1        .byte $E1   ; 
- - - - - - 0x0178A5 05:B895: AF        .byte $AF   ; 
- - - - - - 0x0178A6 05:B896: FF        .byte $FF   ; 
- - - - - - 0x0178A7 05:B897: FF        .byte $FF   ; 
- - - - - - 0x0178A8 05:B898: FF        .byte $FF   ; 
- - - - - - 0x0178A9 05:B899: 23        .byte $23   ; 
- - - - - - 0x0178AA 05:B89A: E9        .byte $E9   ; 
- - - - - - 0x0178AB 05:B89B: AA        .byte $AA   ; 
- - - - - - 0x0178AC 05:B89C: FF        .byte $FF   ; 
- - - - - - 0x0178AD 05:B89D: FF        .byte $FF   ; 
- - - - - - 0x0178AE 05:B89E: FF        .byte $FF   ; 
- - - - - - 0x0178AF 05:B89F: 23        .byte $23   ; 
- - - - - - 0x0178B0 05:B8A0: F1        .byte $F1   ; 
- - - - - - 0x0178B1 05:B8A1: AA        .byte $AA   ; 
- - - - - - 0x0178B2 05:B8A2: FF        .byte $FF   ; 
- - - - - - 0x0178B3 05:B8A3: FF        .byte $FF   ; 
- - - - - - 0x0178B4 05:B8A4: FF        .byte $FF   ; 



sub_B8A5:
C - - - - - 0x0178B5 05:B8A5: A2 09     LDX #$09
C - - - - - 0x0178B7 05:B8A7: A9 00     LDA #$00
bra_B8A9:
C - - - - - 0x0178B9 05:B8A9: 95 2C     STA ram_002C,X
C - - - - - 0x0178BB 05:B8AB: CA        DEX
C - - - - - 0x0178BC 05:B8AC: 10 FB     BPL bra_B8A9
C - - - - - 0x0178BE 05:B8AE: A2 00     LDX #$00
bra_B8B0:
C - - - - - 0x0178C0 05:B8B0: A0 00     LDY #$00
C - - - - - 0x0178C2 05:B8B2: BD 3E 05  LDA ram_053E,X
C - - - - - 0x0178C5 05:B8B5: 29 E0     AND #$E0
bra_B8B7:
C - - - - - 0x0178C7 05:B8B7: 10 01     BPL bra_B8BA
C - - - - - 0x0178C9 05:B8B9: C8        INY
bra_B8BA:
C - - - - - 0x0178CA 05:B8BA: 0A        ASL
C - - - - - 0x0178CB 05:B8BB: D0 FA     BNE bra_B8B7
C - - - - - 0x0178CD 05:B8BD: 84 1C     STY ram_001C
C - - - - - 0x0178CF 05:B8BF: 8A        TXA
C - - - - - 0x0178D0 05:B8C0: 4A        LSR
C - - - - - 0x0178D1 05:B8C1: A8        TAY
C - - - - - 0x0178D2 05:B8C2: 90 04     BCC bra_B8C8
C - - - - - 0x0178D4 05:B8C4: 06 1C     ASL ram_001C
C - - - - - 0x0178D6 05:B8C6: 06 1C     ASL ram_001C
bra_B8C8:
C - - - - - 0x0178D8 05:B8C8: B9 2C 00  LDA ram_002C,Y
C - - - - - 0x0178DB 05:B8CB: 05 1C     ORA ram_001C
C - - - - - 0x0178DD 05:B8CD: 99 2C 00  STA ram_002C,Y
C - - - - - 0x0178E0 05:B8D0: E8        INX
C - - - - - 0x0178E1 05:B8D1: E0 0C     CPX #$0C
C - - - - - 0x0178E3 05:B8D3: 90 DB     BCC bra_B8B0
C - - - - - 0x0178E5 05:B8D5: AD 55 05  LDA ram_0555
C - - - - - 0x0178E8 05:B8D8: 29 F0     AND #$F0
C - - - - - 0x0178EA 05:B8DA: 4A        LSR
C - - - - - 0x0178EB 05:B8DB: 4A        LSR
C - - - - - 0x0178EC 05:B8DC: 4A        LSR
C - - - - - 0x0178ED 05:B8DD: 4A        LSR
C - - - - - 0x0178EE 05:B8DE: 85 32     STA ram_0032
C - - - - - 0x0178F0 05:B8E0: AD 55 05  LDA ram_0555
C - - - - - 0x0178F3 05:B8E3: 29 0F     AND #$0F
C - - - - - 0x0178F5 05:B8E5: 85 33     STA ram_0033
C - - - - - 0x0178F7 05:B8E7: 20 8D B9  JSR sub_B98D
C - - - - - 0x0178FA 05:B8EA: A5 1C     LDA ram_001C
C - - - - - 0x0178FC 05:B8EC: 4A        LSR
C - - - - - 0x0178FD 05:B8ED: 4A        LSR
C - - - - - 0x0178FE 05:B8EE: 29 0F     AND #$0F
C - - - - - 0x017900 05:B8F0: 85 35     STA ram_0035
C - - - - - 0x017902 05:B8F2: A5 1C     LDA ram_001C
C - - - - - 0x017904 05:B8F4: 29 03     AND #$03
C - - - - - 0x017906 05:B8F6: 85 34     STA ram_0034
C - - - - - 0x017908 05:B8F8: 20 05 C0  JSR sub_0x01EE45_вращение_рандома
C - - - - - 0x01790B 05:B8FB: 29 0C     AND #$0C
C - - - - - 0x01790D 05:B8FD: 85 1C     STA ram_001C
C - - - - - 0x01790F 05:B8FF: 05 34     ORA ram_0034
C - - - - - 0x017911 05:B901: 85 34     STA ram_0034
C - - - - - 0x017913 05:B903: 06 1C     ASL ram_001C
C - - - - - 0x017915 05:B905: A2 07     LDX #$07
bra_B907:
C - - - - - 0x017917 05:B907: 20 A1 B9  JSR sub_B9A1
C - - - - - 0x01791A 05:B90A: CA        DEX
C - - - - - 0x01791B 05:B90B: 10 FA     BPL bra_B907
C - - - - - 0x01791D 05:B90D: A2 09     LDX #$09
C - - - - - 0x01791F 05:B90F: 20 A1 B9  JSR sub_B9A1
C - - - - - 0x017922 05:B912: 60        RTS



sub_B913:
C - - - - - 0x017923 05:B913: A0 09     LDY #$09
bra_B915:
C - - - - - 0x017925 05:B915: B9 6E 04  LDA ram_046E,Y
C - - - - - 0x017928 05:B918: 99 2C 00  STA ram_002C,Y
C - - - - - 0x01792B 05:B91B: 88        DEY
C - - - - - 0x01792C 05:B91C: 10 F7     BPL bra_B915
C - - - - - 0x01792E 05:B91E: A9 00     LDA #$00
C - - - - - 0x017930 05:B920: 8D 55 05  STA ram_0555
C - - - - - 0x017933 05:B923: 8D 56 05  STA ram_0556
C - - - - - 0x017936 05:B926: 8D 58 05  STA ram_0558
C - - - - - 0x017939 05:B929: 8D 57 05  STA ram_0557
C - - - - - 0x01793C 05:B92C: A5 34     LDA ram_0034
C - - - - - 0x01793E 05:B92E: 29 0C     AND #$0C
C - - - - - 0x017940 05:B930: 0A        ASL
C - - - - - 0x017941 05:B931: 85 1C     STA ram_001C
C - - - - - 0x017943 05:B933: A2 07     LDX #$07
bra_B935:
C - - - - - 0x017945 05:B935: 20 AF B9  JSR sub_B9AF
C - - - - - 0x017948 05:B938: CA        DEX
C - - - - - 0x017949 05:B939: 10 FA     BPL bra_B935
C - - - - - 0x01794B 05:B93B: A2 09     LDX #$09
C - - - - - 0x01794D 05:B93D: 20 AF B9  JSR sub_B9AF
C - - - - - 0x017950 05:B940: 20 8D B9  JSR sub_B98D
C - - - - - 0x017953 05:B943: A5 35     LDA ram_0035
C - - - - - 0x017955 05:B945: 29 0F     AND #$0F
C - - - - - 0x017957 05:B947: 0A        ASL
C - - - - - 0x017958 05:B948: 0A        ASL
C - - - - - 0x017959 05:B949: 85 1D     STA ram_001D
C - - - - - 0x01795B 05:B94B: A5 34     LDA ram_0034
C - - - - - 0x01795D 05:B94D: 29 03     AND #$03
C - - - - - 0x01795F 05:B94F: 05 1D     ORA ram_001D
C - - - - - 0x017961 05:B951: C5 1C     CMP ram_001C
C - - - - - 0x017963 05:B953: F0 03     BEQ bra_B958
C - - - - - 0x017965 05:B955: 18        CLC
C - - - - - 0x017966 05:B956: D0 30     BNE bra_B988_RTS
bra_B958:
- - - - - - 0x017968 05:B958: A5 32     LDA ram_0032
- - - - - - 0x01796A 05:B95A: 0A        ASL
- - - - - - 0x01796B 05:B95B: 0A        ASL
- - - - - - 0x01796C 05:B95C: 0A        ASL
- - - - - - 0x01796D 05:B95D: 0A        ASL
- - - - - - 0x01796E 05:B95E: 05 33     ORA ram_0033
- - - - - - 0x017970 05:B960: 8D 55 05  STA ram_0555
- - - - - - 0x017973 05:B963: A2 00     LDX #$00
- - - - - - 0x017975 05:B965: 8E 58 05  STX ram_0558
bra_B968:
- - - - - - 0x017978 05:B968: 8A        TXA
- - - - - - 0x017979 05:B969: 4A        LSR
- - - - - - 0x01797A 05:B96A: A8        TAY
- - - - - - 0x01797B 05:B96B: B9 2C 00  LDA ram_002C,Y
- - - - - - 0x01797E 05:B96E: 90 02     BCC bra_B972
- - - - - - 0x017980 05:B970: 4A        LSR
- - - - - - 0x017981 05:B971: 4A        LSR
bra_B972:
- - - - - - 0x017982 05:B972: 29 03     AND #$03
- - - - - - 0x017984 05:B974: A8        TAY
- - - - - - 0x017985 05:B975: 19 89 B9  ORA tbl_B989,Y
- - - - - - 0x017988 05:B978: 9D 3E 05  STA ram_053E,X
- - - - - - 0x01798B 05:B97B: 18        CLC
- - - - - - 0x01798C 05:B97C: 98        TYA
- - - - - - 0x01798D 05:B97D: 6D 58 05  ADC ram_0558
- - - - - - 0x017990 05:B980: 8D 58 05  STA ram_0558
- - - - - - 0x017993 05:B983: E8        INX
- - - - - - 0x017994 05:B984: E0 0C     CPX #$0C
- - - - - - 0x017996 05:B986: 90 E0     BCC bra_B968
bra_B988_RTS:
C - - - - - 0x017998 05:B988: 60        RTS

tbl_B989:
- - - - - - 0x017999 05:B989: 00        .byte $00   ; 
- - - - - - 0x01799A 05:B98A: 80        .byte $80   ; 
- - - - - - 0x01799B 05:B98B: C0        .byte $C0   ; 
- - - - - - 0x01799C 05:B98C: E0        .byte $E0   ; 



sub_B98D:
C - - - - - 0x01799D 05:B98D: A0 00     LDY #$00
C - - - - - 0x01799F 05:B98F: 84 1C     STY ram_001C
bra_B991:
C - - - - - 0x0179A1 05:B991: 18        CLC
C - - - - - 0x0179A2 05:B992: B9 2C 00  LDA ram_002C,Y
C - - - - - 0x0179A5 05:B995: 65 1C     ADC ram_001C
C - - - - - 0x0179A7 05:B997: 29 3F     AND #$3F
C - - - - - 0x0179A9 05:B999: 85 1C     STA ram_001C
C - - - - - 0x0179AB 05:B99B: C8        INY
C - - - - - 0x0179AC 05:B99C: C0 08     CPY #$08
C - - - - - 0x0179AE 05:B99E: 90 F1     BCC bra_B991
C - - - - - 0x0179B0 05:B9A0: 60        RTS



sub_B9A1:
C - - - - - 0x0179B1 05:B9A1: 20 BD B9  JSR sub_B9BD
C - - - - - 0x0179B4 05:B9A4: 18        CLC
C - - - - - 0x0179B5 05:B9A5: B5 2C     LDA ram_002C,X
C - - - - - 0x0179B7 05:B9A7: 79 C4 B9  ADC tbl_B9C4,Y
C - - - - - 0x0179BA 05:B9AA: 29 0F     AND #$0F
C - - - - - 0x0179BC 05:B9AC: 95 2C     STA ram_002C,X
C - - - - - 0x0179BE 05:B9AE: 60        RTS



sub_B9AF:
C - - - - - 0x0179BF 05:B9AF: 20 BD B9  JSR sub_B9BD
C - - - - - 0x0179C2 05:B9B2: 38        SEC
C - - - - - 0x0179C3 05:B9B3: B5 2C     LDA ram_002C,X
C - - - - - 0x0179C5 05:B9B5: F9 C4 B9  SBC tbl_B9C4,Y
C - - - - - 0x0179C8 05:B9B8: 29 0F     AND #$0F
C - - - - - 0x0179CA 05:B9BA: 95 2C     STA ram_002C,X
C - - - - - 0x0179CC 05:B9BC: 60        RTS



sub_B9BD:
C - - - - - 0x0179CD 05:B9BD: 8A        TXA
C - - - - - 0x0179CE 05:B9BE: 29 07     AND #$07
C - - - - - 0x0179D0 05:B9C0: 05 1C     ORA ram_001C
C - - - - - 0x0179D2 05:B9C2: A8        TAY
C - - - - - 0x0179D3 05:B9C3: 60        RTS


; !!! bzk
tbl_B9C4:
sub_B9C4:
C D 1 - - - 0x0179D4 05:B9C4: AD 2D 05  LDA ram_номер_команды + 1
C D 1 - - - 0x0179D7 05:B9C7: 29 0F     AND #$0F
C D 1 - - - 0x0179D9 05:B9C9: 4A        LSR
C D 1 - - - 0x0179DA 05:B9CA: 4A        LSR
C D 1 - - - 0x0179DB 05:B9CB: A8        TAY
C - - - - - 0x0179DC 05:B9CC: B9 8E BA  LDA tbl_BA8E,Y
C - - - - - 0x0179DF 05:B9CF: 8D 29 05  STA ram_опция_материк
C - - - - - 0x0179E2 05:B9D2: 20 05 C0  JSR sub_0x01EE45_вращение_рандома
C D 1 - - - 0x0179E5 05:B9D5: 29 03     AND #$03
C D 1 - - - 0x0179E7 05:B9D7: 85 1C     STA ram_001C
C D 1 - - - 0x0179E9 05:B9D9: AD 4A 05  LDA ram_054A
C D 1 - - - 0x0179EC 05:B9DC: 30 04     BMI bra_B9E2
C D 1 - - - 0x0179EE 05:B9DE: A9 0B     LDA #$0B
C D 1 - - - 0x0179F0 05:B9E0: D0 03     BNE bra_B9E5
bra_B9E2:
C D 1 - - - 0x0179F2 05:B9E2: AD 2D 05  LDA ram_номер_команды + 1
bra_B9E5:
C - - - - - 0x0179F5 05:B9E5: 29 0F     AND #$0F
C - - - - - 0x0179F7 05:B9E7: A8        TAY
C - - - - - 0x0179F8 05:B9E8: 0A        ASL
C - - - - - 0x0179F9 05:B9E9: 0A        ASL
C - - - - - 0x0179FA 05:B9EA: 85 1D     STA ram_001D
C - - - - - 0x0179FC 05:B9EC: A5 1C     LDA ram_001C
C - - - - - 0x0179FE 05:B9EE: 19 92 BA  ORA tbl_BA92,Y
C - - - - - 0x017A01 05:B9F1: 29 0F     AND #$0F
C - - - - - 0x017A03 05:B9F3: A8        TAY
C - - - - - 0x017A04 05:B9F4: B9 A2 BA  LDA tbl_BAA2,Y
C - - - - - 0x017A07 05:B9F7: 29 03     AND #$03
C - - - - - 0x017A09 05:B9F9: 8D FB 05  STA ram_опция_поверхность_влажность
C - - - - - 0x017A0C 05:B9FC: A9 00     LDA #$00
C - - - - - 0x017A0E 05:B9FE: 8D 94 04  STA ram_опция_дождь_ветер
C - - - - - 0x017A11 05:BA01: 8D 95 04  STA ram_направление_молния_смерч
C - - - - - 0x017A14 05:BA04: A2 00     LDX #$00
bra_BA06:
C - - - - - 0x017A16 05:BA06: 20 60 BA  JSR sub_BA60
C - - - - - 0x017A19 05:BA09: B9 29 BB  LDA tbl_BB29,Y
C - - - - - 0x017A1C 05:BA0C: 3D B2 BA  AND tbl_BAB2,X
C - - - - - 0x017A1F 05:BA0F: 0D 94 04  ORA ram_опция_дождь_ветер
C - - - - - 0x017A22 05:BA12: 8D 94 04  STA ram_опция_дождь_ветер
C - - - - - 0x017A25 05:BA15: E8        INX
C - - - - - 0x017A26 05:BA16: E0 02     CPX #$02
C - - - - - 0x017A28 05:BA18: 90 EC     BCC bra_BA06
bra_BA1A:
C - - - - - 0x017A2A 05:BA1A: 20 60 BA  JSR sub_BA60
C - - - - - 0x017A2D 05:BA1D: B9 2A BB  LDA tbl_BB2A,Y
C - - - - - 0x017A30 05:BA20: 3D B2 BA  AND tbl_BAB2,X
C - - - - - 0x017A33 05:BA23: 0D 95 04  ORA ram_направление_молния_смерч
C - - - - - 0x017A36 05:BA26: 8D 95 04  STA ram_направление_молния_смерч
C - - - - - 0x017A39 05:BA29: E8        INX
C - - - - - 0x017A3A 05:BA2A: E0 05     CPX #$05
C - - - - - 0x017A3C 05:BA2C: 90 EC     BCC bra_BA1A
C - - - - - 0x017A3E 05:BA2E: AD FB 05  LDA ram_опция_поверхность_влажность
C - - - - - 0x017A41 05:BA31: C9 02     CMP #$02
C - - - - - 0x017A43 05:BA33: D0 0B     BNE bra_BA40
C - - - - - 0x017A45 05:BA35: AD 94 04  LDA ram_опция_дождь_ветер
C - - - - - 0x017A48 05:BA38: 29 F0     AND #$F0
C - - - - - 0x017A4A 05:BA3A: 8D 94 04  STA ram_опция_дождь_ветер
C - - - - - 0x017A4D 05:BA3D: 4C 5C BA  RTS
bra_BA40:
C - - - - - 0x017A50 05:BA40: AD 94 04  LDA ram_опция_дождь_ветер
C - - - - - 0x017A53 05:BA43: 29 0F     AND #$0F
C - - - - - 0x017A55 05:BA45: 0A        ASL
C - - - - - 0x017A56 05:BA46: 0A        ASL
C - - - - - 0x017A57 05:BA47: 85 1C     STA ram_001C
C - - - - - 0x017A59 05:BA49: 20 05 C0  JSR sub_0x01EE45_вращение_рандома
C - - - - - 0x017A5C 05:BA4C: 29 03     AND #$03
C - - - - - 0x017A5E 05:BA4E: 05 1C     ORA ram_001C
C - - - - - 0x017A60 05:BA50: A8        TAY
C - - - - - 0x017A61 05:BA51: B9 33 BB  LDA tbl_BB33,Y
C - - - - - 0x017A64 05:BA54: 29 70     AND #$70
C - - - - - 0x017A66 05:BA56: 0D FB 05  ORA ram_опция_поверхность_влажность
C - - - - - 0x017A69 05:BA59: 8D FB 05  STA ram_опция_поверхность_влажность
C D 1 - - - 0x017A6C 05:BA5C: 60        RTS



sub_BA60:
; bzk стремное чтение 4C из последнего банка
; переделано под фиксированное чтение 4C
; удалить лишние проверки
C - - - - - 0x017A70 05:BA60: AD 05 C0  LDA #$4C
C - - - - - 0x017A73 05:BA63: 85 1C     STA ram_001C
C - - - - - 0x017A75 05:BA65: A0 00     LDY #$00
C - - - - - 0x017A77 05:BA67: 8A        TXA
C - - - - - 0x017A78 05:BA68: C9 04     CMP #$04
C - - - - - 0x017A7A 05:BA6A: F0 0A     BEQ bra_BA76
C - - - - - 0x017A7C 05:BA6C: 29 03     AND #$03
C - - - - - 0x017A7E 05:BA6E: 05 1D     ORA ram_001D
C - - - - - 0x017A80 05:BA70: A8        TAY
C - - - - - 0x017A81 05:BA71: B9 B7 BA  LDA tbl_BAB7,Y
C - - - - - 0x017A84 05:BA74: 0A        ASL
C - - - - - 0x017A85 05:BA75: A8        TAY
bra_BA76:
C - - - - - 0x017A86 05:BA76: B9 F7 BA  LDA tbl_BAF7,Y
C - - - - - 0x017A89 05:BA79: 85 2C     STA ram_002C
C - - - - - 0x017A8B 05:BA7B: B9 F8 BA  LDA tbl_BAF7 + 1,Y
C - - - - - 0x017A8E 05:BA7E: 85 2D     STA ram_002D
C - - - - - 0x017A90 05:BA80: A5 1C     LDA ram_001C
C - - - - - 0x017A92 05:BA82: 10 02     BPL bra_BA86
- - - - - - 0x017A94 05:BA84: A9 00     LDA #$00
bra_BA86:
C - - - - - 0x017A96 05:BA86: 29 07     AND #$07
C - - - - - 0x017A98 05:BA88: A8        TAY
C - - - - - 0x017A99 05:BA89: B1 2C     LDA (ram_002C),Y
C - - - - - 0x017A9B 05:BA8B: 0A        ASL
C - - - - - 0x017A9C 05:BA8C: A8        TAY
C - - - - - 0x017A9D 05:BA8D: 60        RTS



tbl_BA8E:
- D 1 - - - 0x017A9E 05:BA8E: 00        .byte $00   ; 
- D 1 - - - 0x017A9F 05:BA8F: 01        .byte $01   ; 
- D 1 - - - 0x017AA0 05:BA90: 03        .byte $03   ; 
- D 1 - - - 0x017AA1 05:BA91: 02        .byte $02   ; 



tbl_BA92:
- D 1 - - - 0x017AA2 05:BA92: 00        .byte $00   ; 
- D 1 - - - 0x017AA3 05:BA93: 04        .byte $04   ; 
- D 1 - - - 0x017AA4 05:BA94: 04        .byte $04   ; 
- D 1 - - - 0x017AA5 05:BA95: 08        .byte $08   ; 
- - - - - - 0x017AA6 05:BA96: 00        .byte $00   ; 
- D 1 - - - 0x017AA7 05:BA97: 0C        .byte $0C   ; 
- D 1 - - - 0x017AA8 05:BA98: 04        .byte $04   ; 
- D 1 - - - 0x017AA9 05:BA99: 04        .byte $04   ; 
- - - - - - 0x017AAA 05:BA9A: 00        .byte $00   ; 
- D 1 - - - 0x017AAB 05:BA9B: 00        .byte $00   ; 
- D 1 - - - 0x017AAC 05:BA9C: 00        .byte $00   ; 
- D 1 - - - 0x017AAD 05:BA9D: 00        .byte $00   ; 
- - - - - - 0x017AAE 05:BA9E: 00        .byte $00   ; 
- D 1 - - - 0x017AAF 05:BA9F: 04        .byte $04   ; 
- D 1 - - - 0x017AB0 05:BAA0: 00        .byte $00   ; 
- D 1 - - - 0x017AB1 05:BAA1: 08        .byte $08   ; 



tbl_BAA2:
- D 1 - - - 0x017AB2 05:BAA2: 00        .byte $00   ; 
- D 1 - - - 0x017AB3 05:BAA3: 00        .byte $00   ; 
- D 1 - - - 0x017AB4 05:BAA4: 00        .byte $00   ; 
- D 1 - - - 0x017AB5 05:BAA5: 00        .byte $00   ; 
- D 1 - - - 0x017AB6 05:BAA6: 00        .byte $00   ; 
- D 1 - - - 0x017AB7 05:BAA7: 00        .byte $00   ; 
- D 1 - - - 0x017AB8 05:BAA8: 00        .byte $00   ; 
- D 1 - - - 0x017AB9 05:BAA9: 01        .byte $01   ; 
- D 1 - - - 0x017ABA 05:BAAA: 01        .byte $01   ; 
- D 1 - - - 0x017ABB 05:BAAB: 01        .byte $01   ; 
- D 1 - - - 0x017ABC 05:BAAC: 01        .byte $01   ; 
- D 1 - - - 0x017ABD 05:BAAD: 00        .byte $00   ; 
- D 1 - - - 0x017ABE 05:BAAE: 02        .byte $02   ; 
- - - - - - 0x017ABF 05:BAAF: 02        .byte $02   ; 
- - - - - - 0x017AC0 05:BAB0: 02        .byte $02   ; 
- - - - - - 0x017AC1 05:BAB1: 01        .byte $01   ; 



tbl_BAB2:
- D 1 - - - 0x017AC2 05:BAB2: 0F        .byte $0F   ; 
- D 1 - - - 0x017AC3 05:BAB3: F0        .byte $F0   ; 
- D 1 - - - 0x017AC4 05:BAB4: 0C        .byte $0C   ; 
- D 1 - - - 0x017AC5 05:BAB5: 30        .byte $30   ; 
- D 1 - - - 0x017AC6 05:BAB6: 03        .byte $03   ; 



tbl_BAB7:
- D 1 - - - 0x017AC7 05:BAB7: 00        .byte $00   ; 
- D 1 - - - 0x017AC8 05:BAB8: 01        .byte $01   ; 
- D 1 - - - 0x017AC9 05:BAB9: 00        .byte $00   ; 
- D 1 - - - 0x017ACA 05:BABA: 00        .byte $00   ; 
- D 1 - - - 0x017ACB 05:BABB: 00        .byte $00   ; 
- D 1 - - - 0x017ACC 05:BABC: 00        .byte $00   ; 
- D 1 - - - 0x017ACD 05:BABD: 00        .byte $00   ; 
- D 1 - - - 0x017ACE 05:BABE: 04        .byte $04   ; 
- D 1 - - - 0x017ACF 05:BABF: 00        .byte $00   ; 
- D 1 - - - 0x017AD0 05:BAC0: 03        .byte $03   ; 
- D 1 - - - 0x017AD1 05:BAC1: 04        .byte $04   ; 
- D 1 - - - 0x017AD2 05:BAC2: 00        .byte $00   ; 
- D 1 - - - 0x017AD3 05:BAC3: 02        .byte $02   ; 
- D 1 - - - 0x017AD4 05:BAC4: 00        .byte $00   ; 
- D 1 - - - 0x017AD5 05:BAC5: 01        .byte $01   ; 
- D 1 - - - 0x017AD6 05:BAC6: 04        .byte $04   ; 
- - - - - - 0x017AD7 05:BAC7: 00        .byte $00   ; 
- - - - - - 0x017AD8 05:BAC8: 00        .byte $00   ; 
- - - - - - 0x017AD9 05:BAC9: 00        .byte $00   ; 
- - - - - - 0x017ADA 05:BACA: 00        .byte $00   ; 
- D 1 - - - 0x017ADB 05:BACB: 04        .byte $04   ; 
- D 1 - - - 0x017ADC 05:BACC: 02        .byte $02   ; 
- D 1 - - - 0x017ADD 05:BACD: 04        .byte $04   ; 
- D 1 - - - 0x017ADE 05:BACE: 02        .byte $02   ; 
- D 1 - - - 0x017ADF 05:BACF: 01        .byte $01   ; 
- D 1 - - - 0x017AE0 05:BAD0: 00        .byte $00   ; 
- D 1 - - - 0x017AE1 05:BAD1: 04        .byte $04   ; 
- D 1 - - - 0x017AE2 05:BAD2: 04        .byte $04   ; 
- D 1 - - - 0x017AE3 05:BAD3: 00        .byte $00   ; 
- D 1 - - - 0x017AE4 05:BAD4: 00        .byte $00   ; 
- D 1 - - - 0x017AE5 05:BAD5: 04        .byte $04   ; 
- D 1 - - - 0x017AE6 05:BAD6: 04        .byte $04   ; 
- - - - - - 0x017AE7 05:BAD7: 00        .byte $00   ; 
- - - - - - 0x017AE8 05:BAD8: 00        .byte $00   ; 
- - - - - - 0x017AE9 05:BAD9: 00        .byte $00   ; 
- - - - - - 0x017AEA 05:BADA: 00        .byte $00   ; 
- D 1 - - - 0x017AEB 05:BADB: 01        .byte $01   ; 
- D 1 - - - 0x017AEC 05:BADC: 02        .byte $02   ; 
- D 1 - - - 0x017AED 05:BADD: 04        .byte $04   ; 
- D 1 - - - 0x017AEE 05:BADE: 01        .byte $01   ; 
- D 1 - - - 0x017AEF 05:BADF: 02        .byte $02   ; 
- D 1 - - - 0x017AF0 05:BAE0: 01        .byte $01   ; 
- D 1 - - - 0x017AF1 05:BAE1: 01        .byte $01   ; 
- D 1 - - - 0x017AF2 05:BAE2: 04        .byte $04   ; 
- D 1 - - - 0x017AF3 05:BAE3: 00        .byte $00   ; 
- D 1 - - - 0x017AF4 05:BAE4: 00        .byte $00   ; 
- D 1 - - - 0x017AF5 05:BAE5: 04        .byte $04   ; 
- D 1 - - - 0x017AF6 05:BAE6: 04        .byte $04   ; 
- - - - - - 0x017AF7 05:BAE7: 00        .byte $00   ; 
- - - - - - 0x017AF8 05:BAE8: 00        .byte $00   ; 
- - - - - - 0x017AF9 05:BAE9: 00        .byte $00   ; 
- - - - - - 0x017AFA 05:BAEA: 00        .byte $00   ; 
- D 1 - - - 0x017AFB 05:BAEB: 00        .byte $00   ; 
- D 1 - - - 0x017AFC 05:BAEC: 04        .byte $04   ; 
- D 1 - - - 0x017AFD 05:BAED: 04        .byte $04   ; 
- D 1 - - - 0x017AFE 05:BAEE: 04        .byte $04   ; 
- D 1 - - - 0x017AFF 05:BAEF: 00        .byte $00   ; 
- D 1 - - - 0x017B00 05:BAF0: 01        .byte $01   ; 
- D 1 - - - 0x017B01 05:BAF1: 00        .byte $00   ; 
- D 1 - - - 0x017B02 05:BAF2: 04        .byte $04   ; 
- D 1 - - - 0x017B03 05:BAF3: 00        .byte $00   ; 
- D 1 - - - 0x017B04 05:BAF4: 02        .byte $02   ; 
- D 1 - - - 0x017B05 05:BAF5: 00        .byte $00   ; 
- D 1 - - - 0x017B06 05:BAF6: 02        .byte $02   ; 



tbl_BAF7:
- D 1 - - - 0x017B07 05:BAF7: 01 BB     .word off_BB01_00
- D 1 - - - 0x017B09 05:BAF9: 09 BB     .word off_BB09_01
- D 1 - - - 0x017B0B 05:BAFB: 11 BB     .word off_BB11_02
- D 1 - - - 0x017B0D 05:BAFD: 19 BB     .word off_BB19_03
- D 1 - - - 0x017B0F 05:BAFF: 21 BB     .word off_BB21_04

off_BB01_00:
- D 1 - I - 0x017B11 05:BB01: 00        .byte $00   ; 
- D 1 - I - 0x017B12 05:BB02: 00        .byte $00   ; 
- D 1 - I - 0x017B13 05:BB03: 00        .byte $00   ; 
- D 1 - I - 0x017B14 05:BB04: 00        .byte $00   ; 
- D 1 - I - 0x017B15 05:BB05: 01        .byte $01   ; 
- D 1 - I - 0x017B16 05:BB06: 01        .byte $01   ; 
- D 1 - I - 0x017B17 05:BB07: 02        .byte $02   ; 
- D 1 - I - 0x017B18 05:BB08: 02        .byte $02   ; 



off_BB09_01:
- D 1 - I - 0x017B19 05:BB09: 00        .byte $00   ; 
- D 1 - I - 0x017B1A 05:BB0A: 00        .byte $00   ; 
- D 1 - I - 0x017B1B 05:BB0B: 01        .byte $01   ; 
- D 1 - I - 0x017B1C 05:BB0C: 01        .byte $01   ; 
- D 1 - I - 0x017B1D 05:BB0D: 01        .byte $01   ; 
- D 1 - I - 0x017B1E 05:BB0E: 02        .byte $02   ; 
- D 1 - I - 0x017B1F 05:BB0F: 02        .byte $02   ; 
- D 1 - I - 0x017B20 05:BB10: 03        .byte $03   ; 



off_BB11_02:
- D 1 - I - 0x017B21 05:BB11: 01        .byte $01   ; 
- D 1 - I - 0x017B22 05:BB12: 01        .byte $01   ; 
- D 1 - I - 0x017B23 05:BB13: 01        .byte $01   ; 
- D 1 - I - 0x017B24 05:BB14: 01        .byte $01   ; 
- D 1 - I - 0x017B25 05:BB15: 02        .byte $02   ; 
- D 1 - I - 0x017B26 05:BB16: 02        .byte $02   ; 
- D 1 - I - 0x017B27 05:BB17: 02        .byte $02   ; 
- D 1 - I - 0x017B28 05:BB18: 03        .byte $03   ; 



off_BB19_03:
- - - - - - 0x017B29 05:BB19: 01        .byte $01   ; 
- - - - - - 0x017B2A 05:BB1A: 01        .byte $01   ; 
- - - - - - 0x017B2B 05:BB1B: 02        .byte $02   ; 
- - - - - - 0x017B2C 05:BB1C: 02        .byte $02   ; 
- D 1 - I - 0x017B2D 05:BB1D: 03        .byte $03   ; 
- - - - - - 0x017B2E 05:BB1E: 03        .byte $03   ; 
- - - - - - 0x017B2F 05:BB1F: 04        .byte $04   ; 
- - - - - - 0x017B30 05:BB20: 04        .byte $04   ; 



off_BB21_04:
- - - - - - 0x017B31 05:BB21: 00        .byte $00   ; 
- - - - - - 0x017B32 05:BB22: 00        .byte $00   ; 
- - - - - - 0x017B33 05:BB23: 00        .byte $00   ; 
- - - - - - 0x017B34 05:BB24: 00        .byte $00   ; 
- D 1 - I - 0x017B35 05:BB25: 00        .byte $00   ; 
- - - - - - 0x017B36 05:BB26: 00        .byte $00   ; 
- - - - - - 0x017B37 05:BB27: 00        .byte $00   ; 
- - - - - - 0x017B38 05:BB28: 00        .byte $00   ; 



tbl_BB29:
- D 1 - - - 0x017B39 05:BB29: 00        .byte $00   ; 
tbl_BB2A:
- D 1 - - - 0x017B3A 05:BB2A: 01        .byte $01   ; 
- D 1 - - - 0x017B3B 05:BB2B: 11        .byte $11   ; 
- D 1 - - - 0x017B3C 05:BB2C: 14        .byte $14   ; 
- D 1 - - - 0x017B3D 05:BB2D: 22        .byte $22   ; 
- D 1 - - - 0x017B3E 05:BB2E: 2A        .byte $2A   ; 
- D 1 - - - 0x017B3F 05:BB2F: 33        .byte $33   ; 
- - - - - - 0x017B40 05:BB30: 3C        .byte $3C   ; 
- - - - - - 0x017B41 05:BB31: 44        .byte $44   ; 
- - - - - - 0x017B42 05:BB32: 3E        .byte $3E   ; 



tbl_BB33:
- - - - - - 0x017B43 05:BB33: 00        .byte $00   ; 
- - - - - - 0x017B44 05:BB34: 00        .byte $00   ; 
- - - - - - 0x017B45 05:BB35: 00        .byte $00   ; 
- - - - - - 0x017B46 05:BB36: 00        .byte $00   ; 
- D 1 - - - 0x017B47 05:BB37: 00        .byte $00   ; 
- D 1 - - - 0x017B48 05:BB38: 00        .byte $00   ; 
- D 1 - - - 0x017B49 05:BB39: 10        .byte $10   ; 
- D 1 - - - 0x017B4A 05:BB3A: 20        .byte $20   ; 
- D 1 - - - 0x017B4B 05:BB3B: 10        .byte $10   ; 
- D 1 - - - 0x017B4C 05:BB3C: 10        .byte $10   ; 
- D 1 - - - 0x017B4D 05:BB3D: 20        .byte $20   ; 
- D 1 - - - 0x017B4E 05:BB3E: 30        .byte $30   ; 
- - - - - - 0x017B4F 05:BB3F: 20        .byte $20   ; 
- - - - - - 0x017B50 05:BB40: 20        .byte $20   ; 
- - - - - - 0x017B51 05:BB41: 30        .byte $30   ; 
- - - - - - 0x017B52 05:BB42: 40        .byte $40   ; 
- - - - - - 0x017B53 05:BB43: 10        .byte $10   ; 
- - - - - - 0x017B54 05:BB44: 10        .byte $10   ; 
- - - - - - 0x017B55 05:BB45: 20        .byte $20   ; 
- - - - - - 0x017B56 05:BB46: 20        .byte $20   ; 



loc_BB47:
sub_BB47:
C D 1 - - - 0x017B57 05:BB47: A9 00     LDA #$00
C - - - - - 0x017B59 05:BB49: 8D F1 05  STA ram_набор_луж
C - - - - - 0x017B5C 05:BB4C: 8D 2E 05  STA ram_счет_команды
C - - - - - 0x017B5F 05:BB4F: 8D 2F 05  STA ram_счет_команды + 1
C - - - - - 0x017B62 05:BB52: 8D 59 05  STA ram_номер_тайма
C - - - - - 0x017B65 05:BB55: 8D 2A 05  STA ram_флаг_владения_мячом_ком
C - - - - - 0x017B68 05:BB58: 8D 2B 05  STA ram_флаг_владения_мячом_ком + 1
C - - - - - 0x017B6B 05:BB5B: A5 57     LDA ram_option_mode_difficulty
C - - - - - 0x017B6D 05:BB5D: 29 F0     AND #$F0
C - - - - - 0x017B6F 05:BB5F: F0 02     BEQ bra_BB63_demo
C - - - - - 0x017B71 05:BB61: 10 03     BPL bra_BB66_not_walkthrough
bra_BB63_demo:
C - - - - - 0x017B73 05:BB63: 20 C4 B9  JSR sub_B9C4
bra_BB66_not_walkthrough:
C - - - - - 0x017B76 05:BB66: AD 94 04  LDA ram_опция_дождь_ветер
C - - - - - 0x017B79 05:BB69: 29 0F     AND #$0F
C - - - - - 0x017B7B 05:BB6B: 0A        ASL
C - - - - - 0x017B7C 05:BB6C: A8        TAY
C - - - - - 0x017B7D 05:BB6D: 20 05 C0  JSR sub_0x01EE45_вращение_рандома
C - - - - - 0x017B80 05:BB70: 10 01     BPL bra_BB73
C - - - - - 0x017B82 05:BB72: C8        INY
bra_BB73:
C - - - - - 0x017B83 05:BB73: B9 7A BB  LDA tbl_BB7A,Y
C - - - - - 0x017B86 05:BB76: 8D 03 06  STA ram_0603
C - - - - - 0x017B89 05:BB79: 60        RTS

tbl_BB7A:
- D 1 - - - 0x017B8A 05:BB7A: 00        .byte $00   ; 
- D 1 - - - 0x017B8B 05:BB7B: 20        .byte $20   ; 
- D 1 - - - 0x017B8C 05:BB7C: 30        .byte $30   ; 
- D 1 - - - 0x017B8D 05:BB7D: 40        .byte $40   ; 
- D 1 - - - 0x017B8E 05:BB7E: 40        .byte $40   ; 
- D 1 - - - 0x017B8F 05:BB7F: 60        .byte $60   ; 
- - - - - - 0x017B90 05:BB80: 80        .byte $80   ; 
- - - - - - 0x017B91 05:BB81: A0        .byte $A0   ; 
- - - - - - 0x017B92 05:BB82: C0        .byte $C0   ; 
- - - - - - 0x017B93 05:BB83: FF        .byte $FF   ; 



loc_BB84:
sub_BB84:
C D 1 - - - 0x017B94 05:BB84: AD 59 05  LDA ram_номер_тайма
C - - - - - 0x017B97 05:BB87: F0 32     BEQ bra_BBBB    ; если первый тайм
C - - - - - 0x017B99 05:BB89: AD FB 05  LDA ram_опция_поверхность_влажность
C - - - - - 0x017B9C 05:BB8C: 29 03     AND #$03
C - - - - - 0x017B9E 05:BB8E: C9 02     CMP #$02
C - - - - - 0x017BA0 05:BB90: F0 29     BEQ bra_BBBB
C - - - - - 0x017BA2 05:BB92: 8D F1 05  STA ram_набор_луж
C - - - - - 0x017BA5 05:BB95: AD 94 04  LDA ram_опция_дождь_ветер
C - - - - - 0x017BA8 05:BB98: 29 07     AND #$07
C - - - - - 0x017BAA 05:BB9A: 0A        ASL
C - - - - - 0x017BAB 05:BB9B: A8        TAY
C - - - - - 0x017BAC 05:BB9C: AD 00 03  LDA ram_frame_cnt
C - - - - - 0x017BAF 05:BB9F: 29 01     AND #$01
C - - - - - 0x017BB1 05:BBA1: F0 01     BEQ bra_BBA4
C - - - - - 0x017BB3 05:BBA3: C8        INY
bra_BBA4:
C - - - - - 0x017BB4 05:BBA4: AD FB 05  LDA ram_опция_поверхность_влажность
C - - - - - 0x017BB7 05:BBA7: 29 F0     AND #$F0
C - - - - - 0x017BB9 05:BBA9: 18        CLC
C - - - - - 0x017BBA 05:BBAA: 79 0C BD  ADC tbl_BD0C,Y
C - - - - - 0x017BBD 05:BBAD: C9 51     CMP #$51
C - - - - - 0x017BBF 05:BBAF: 90 02     BCC bra_BBB3
- - - - - - 0x017BC1 05:BBB1: A9 50     LDA #$50
bra_BBB3:
C - - - - - 0x017BC3 05:BBB3: 29 70     AND #$70
C - - - - - 0x017BC5 05:BBB5: 0D F1 05  ORA ram_набор_луж
C - - - - - 0x017BC8 05:BBB8: 8D FB 05  STA ram_опция_поверхность_влажность
bra_BBBB:
C - - - - - 0x017BCB 05:BBBB: A9 00     LDA #$00
C - - - - - 0x017BCD 05:BBBD: 8D F1 05  STA ram_набор_луж
C - - - - - 0x017BD0 05:BBC0: AD FB 05  LDA ram_опция_поверхность_влажность
C - - - - - 0x017BD3 05:BBC3: 29 03     AND #$03
C - - - - - 0x017BD5 05:BBC5: C9 02     CMP #$02
C - - - - - 0x017BD7 05:BBC7: D0 03     BNE bra_BBCC
C - - - - - 0x017BD9 05:BBC9: 8D FB 05  STA ram_опция_поверхность_влажность
bra_BBCC:
C - - - - - 0x017BDC 05:BBCC: AD FB 05  LDA ram_опция_поверхность_влажность
C - - - - - 0x017BDF 05:BBCF: 29 F0     AND #$F0
C - - - - - 0x017BE1 05:BBD1: F0 0A     BEQ bra_BBDD
C - - - - - 0x017BE3 05:BBD3: C9 50     CMP #$50
C - - - - - 0x017BE5 05:BBD5: F0 06     BEQ bra_BBDD
C - - - - - 0x017BE7 05:BBD7: 20 05 C0  JSR sub_0x01EE45_вращение_рандома
C - - - - - 0x017BEA 05:BBDA: 8D F1 05  STA ram_набор_луж
bra_BBDD:
C - - - - - 0x017BED 05:BBDD: AD FB 05  LDA ram_опция_поверхность_влажность
C - - - - - 0x017BF0 05:BBE0: 29 03     AND #$03
C - - - - - 0x017BF2 05:BBE2: 0A        ASL
C - - - - - 0x017BF3 05:BBE3: A8        TAY
C - - - - - 0x017BF4 05:BBE4: B9 C8 BC  LDA tbl_BCC8,Y
C - - - - - 0x017BF7 05:BBE7: 85 2C     STA ram_002C
C - - - - - 0x017BF9 05:BBE9: B9 C9 BC  LDA tbl_BCC8 + 1,Y
C - - - - - 0x017BFC 05:BBEC: 85 2D     STA ram_002D
C - - - - - 0x017BFE 05:BBEE: AD FB 05  LDA ram_опция_поверхность_влажность
C - - - - - 0x017C01 05:BBF1: 29 F0     AND #$F0
C - - - - - 0x017C03 05:BBF3: 4A        LSR
C - - - - - 0x017C04 05:BBF4: 4A        LSR
C - - - - - 0x017C05 05:BBF5: A8        TAY
C - - - - - 0x017C06 05:BBF6: B1 2C     LDA (ram_002C),Y
C - - - - - 0x017C08 05:BBF8: 8D F2 05  STA ram_поле_банк_фона
C - - - - - 0x017C0B 05:BBFB: C8        INY
C - - - - - 0x017C0C 05:BBFC: B1 2C     LDA (ram_002C),Y
C - - - - - 0x017C0E 05:BBFE: 8D F3 05  STA ram_номер_prg_банка
C - - - - - 0x017C11 05:BC01: C8        INY
C - - - - - 0x017C12 05:BC02: B1 2C     LDA (ram_002C),Y
C - - - - - 0x017C14 05:BC04: 8D F4 05  STA ram_цвет_поля
C - - - - - 0x017C17 05:BC07: C8        INY
C - - - - - 0x017C18 05:BC08: B1 2C     LDA (ram_002C),Y
C - - - - - 0x017C1A 05:BC0A: 8D E5 05  STA ram_покрытие_поля_лужами
C - - - - - 0x017C1D 05:BC0D: A9 00     LDA #$00
C - - - - - 0x017C1F 05:BC0F: 8D BE 05  STA ram_timer_0_00_x
C - - - - - 0x017C22 05:BC12: 8D BF 05  STA ram_timer_0_0x_0
C - - - - - 0x017C25 05:BC15: 8D C0 05  STA ram_timer_0_x0_0
C - - - - - 0x017C28 05:BC18: A9 02     LDA #$02
C - - - - - 0x017C2A 05:BC1A: 8D C1 05  STA ram_timer_x_00_0
C - - - - - 0x017C2D 05:BC1D: A5 57     LDA ram_option_mode_difficulty
C - - - - - 0x017C2F 05:BC1F: 29 F0     AND #$F0
C - - - - - 0x017C31 05:BC21: F0 0E     BEQ bra_BC31    ; если демо
C - - - - - 0x017C33 05:BC23: 29 D0     AND #$D0
C - - - - - 0x017C35 05:BC25: D0 0A     BNE bra_BC31
C - - - - - 0x017C37 05:BC27: A9 00     LDA #$00
C - - - - - 0x017C39 05:BC29: 8D FC 06  STA ram_06FC
C - - - - - 0x017C3C 05:BC2C: 85 1C     STA ram_001C
C - - - - - 0x017C3E 05:BC2E: 4C 3A BC  JMP loc_BC3A
bra_BC31:
C - - - - - 0x017C41 05:BC31: A9 FF     LDA #$FF
C - - - - - 0x017C43 05:BC33: 8D FC 06  STA ram_06FC
C - - - - - 0x017C46 05:BC36: A9 80     LDA #$80
C - - - - - 0x017C48 05:BC38: 85 1C     STA ram_001C
loc_BC3A:
C D 1 - - - 0x017C4A 05:BC3A: A2 0B     LDX #$0B
bra_BC3C_loop:
C - - - - - 0x017C4C 05:BC3C: BD 50 06  LDA ram_позиция_управление,X
C - - - - - 0x017C4F 05:BC3F: 05 1C     ORA ram_001C
C - - - - - 0x017C51 05:BC41: 9D 50 06  STA ram_позиция_управление,X
C - - - - - 0x017C54 05:BC44: CA        DEX
C - - - - - 0x017C55 05:BC45: 10 F5     BPL bra_BC3C_loop
C - - - - - 0x017C57 05:BC47: A0 00     LDY #$00
C - - - - - 0x017C59 05:BC49: A5 57     LDA ram_option_mode_difficulty
C - - - - - 0x017C5B 05:BC4B: 29 F0     AND #$F0
C - - - - - 0x017C5D 05:BC4D: F0 20     BEQ bra_BC6F_demo
C - - - - - 0x017C5F 05:BC4F: 30 02     BMI bra_BC53_walkthrough
C - - - - - 0x017C61 05:BC51: A0 02     LDY #$02
bra_BC53_walkthrough:
C - - - - - 0x017C63 05:BC53: B9 02 BD  LDA tbl_BD02,Y
C - - - - - 0x017C66 05:BC56: 85 2C     STA ram_002C
C - - - - - 0x017C68 05:BC58: B9 03 BD  LDA tbl_BD02 + 1,Y
C - - - - - 0x017C6B 05:BC5B: 85 2D     STA ram_002D
C - - - - - 0x017C6D 05:BC5D: A0 00     LDY #$00
bra_BC5F:
C - - - - - 0x017C6F 05:BC5F: B1 2C     LDA (ram_002C),Y
C - - - - - 0x017C71 05:BC61: AA        TAX
C - - - - - 0x017C72 05:BC62: BD 50 06  LDA ram_позиция_управление,X
C - - - - - 0x017C75 05:BC65: 29 7F     AND #$7F
C - - - - - 0x017C77 05:BC67: 9D 50 06  STA ram_позиция_управление,X
C - - - - - 0x017C7A 05:BC6A: C8        INY
C - - - - - 0x017C7B 05:BC6B: C4 5D     CPY ram_players_cnt
C - - - - - 0x017C7D 05:BC6D: 90 F0     BCC bra_BC5F
bra_BC6F_demo:
C - - - - - 0x017C7F 05:BC6F: AD 5A 06  LDA ram_позиция_управление + 10
C - - - - - 0x017C82 05:BC72: 29 80     AND #$80
C - - - - - 0x017C84 05:BC74: 8D 8C 06  STA ram_флаг_бота_кипера
C - - - - - 0x017C87 05:BC77: AD 5B 06  LDA ram_позиция_управление + 11
C - - - - - 0x017C8A 05:BC7A: 29 80     AND #$80
C - - - - - 0x017C8C 05:BC7C: 8D 8D 06  STA ram_флаг_бота_кипера + 1
C - - - - - 0x017C8F 05:BC7F: A2 01     LDX #$01
bra_BC81:
C - - - - - 0x017C91 05:BC81: BD 2C 05  LDA ram_номер_команды,X
C - - - - - 0x017C94 05:BC84: 10 10     BPL bra_BC96
C - - - - - 0x017C96 05:BC86: 29 0F     AND #$0F
C - - - - - 0x017C98 05:BC88: 0A        ASL
C - - - - - 0x017C99 05:BC89: A8        TAY
C - - - - - 0x017C9A 05:BC8A: B9 18 BD  LDA tbl_BD18,Y
C - - - - - 0x017C9D 05:BC8D: 9D D3 05  STA ram_05D3,X
C - - - - - 0x017CA0 05:BC90: B9 19 BD  LDA tbl_BD19,Y
C - - - - - 0x017CA3 05:BC93: 9D 30 05  STA ram_team_formation,X
bra_BC96:
C - - - - - 0x017CA6 05:BC96: CA        DEX
C - - - - - 0x017CA7 05:BC97: 10 E8     BPL bra_BC81
C - - - - - 0x017CA9 05:BC99: A9 44     LDA #$44
C - - - - - 0x017CAB 05:BC9B: 8D 68 06  STA ram_0668
C - - - - - 0x017CAE 05:BC9E: 8D 6C 06  STA ram_066C
C - - - - - 0x017CB1 05:BCA1: 8D 70 06  STA ram_0670
C - - - - - 0x017CB4 05:BCA4: A9 43     LDA #$43
C - - - - - 0x017CB6 05:BCA6: 8D 69 06  STA ram_0669
C - - - - - 0x017CB9 05:BCA9: 8D 6D 06  STA ram_066D
C - - - - - 0x017CBC 05:BCAC: 8D 71 06  STA ram_0671
C - - - - - 0x017CBF 05:BCAF: A9 42     LDA #$42
C - - - - - 0x017CC1 05:BCB1: 8D 6A 06  STA ram_066A
C - - - - - 0x017CC4 05:BCB4: 8D 6E 06  STA ram_066E
C - - - - - 0x017CC7 05:BCB7: A9 41     LDA #$41
C - - - - - 0x017CC9 05:BCB9: 8D 6B 06  STA ram_066B
C - - - - - 0x017CCC 05:BCBC: 8D 6F 06  STA ram_066F
C - - - - - 0x017CCF 05:BCBF: A9 11     LDA #$11
C - - - - - 0x017CD1 05:BCC1: 8D 72 06  STA ram_0672
C - - - - - 0x017CD4 05:BCC4: 8D 73 06  STA ram_0673
C - - - - - 0x017CD7 05:BCC7: 60        RTS



tbl_BCC8:
- D 1 - - - 0x017CD8 05:BCC8: CE BC     .word off_BCCE_00
- - - - - - 0x017CDA 05:BCCA: E6 BC     .word off_BCE6_01
- D 1 - - - 0x017CDC 05:BCCC: FE BC     .word off_BCFE_02

off_BCCE_00:
- D 1 - I - 0x017CDE 05:BCCE: 40        .byte $40   ; 
- D 1 - I - 0x017CDF 05:BCCF: 01        .byte $01   ; 
- D 1 - I - 0x017CE0 05:BCD0: 00        .byte $00   ; 
- D 1 - I - 0x017CE1 05:BCD1: 00        .byte $00   ; 
- D 1 - I - 0x017CE2 05:BCD2: 40        .byte $40   ; 
- D 1 - I - 0x017CE3 05:BCD3: 01        .byte $01   ; 
- D 1 - I - 0x017CE4 05:BCD4: 00        .byte $00   ; 
- D 1 - I - 0x017CE5 05:BCD5: 01        .byte $01   ; 
- D 1 - I - 0x017CE6 05:BCD6: 40        .byte $40   ; 
- D 1 - I - 0x017CE7 05:BCD7: 02        .byte $02   ; 
- D 1 - I - 0x017CE8 05:BCD8: 00        .byte $00   ; 
- D 1 - I - 0x017CE9 05:BCD9: 00        .byte $00   ; 
- - - - - - 0x017CEA 05:BCDA: 46        .byte $46   ; 
- - - - - - 0x017CEB 05:BCDB: 02        .byte $02   ; 
- - - - - - 0x017CEC 05:BCDC: 01        .byte $01   ; 
- - - - - - 0x017CED 05:BCDD: 00        .byte $00   ; 
- - - - - - 0x017CEE 05:BCDE: 46        .byte $46   ; 
- - - - - - 0x017CEF 05:BCDF: 01        .byte $01   ; 
- - - - - - 0x017CF0 05:BCE0: 01        .byte $01   ; 
- - - - - - 0x017CF1 05:BCE1: 01        .byte $01   ; 
- - - - - - 0x017CF2 05:BCE2: 46        .byte $46   ; 
- - - - - - 0x017CF3 05:BCE3: 01        .byte $01   ; 
- - - - - - 0x017CF4 05:BCE4: 01        .byte $01   ; 
- - - - - - 0x017CF5 05:BCE5: 00        .byte $00   ; 



off_BCE6_01:
- - - - - - 0x017CF6 05:BCE6: 4C        .byte $4C   ; 
- - - - - - 0x017CF7 05:BCE7: 01        .byte $01   ; 
- - - - - - 0x017CF8 05:BCE8: 02        .byte $02   ; 
- - - - - - 0x017CF9 05:BCE9: 00        .byte $00   ; 
- - - - - - 0x017CFA 05:BCEA: 4C        .byte $4C   ; 
- - - - - - 0x017CFB 05:BCEB: 01        .byte $01   ; 
- - - - - - 0x017CFC 05:BCEC: 02        .byte $02   ; 
- - - - - - 0x017CFD 05:BCED: 01        .byte $01   ; 
- - - - - - 0x017CFE 05:BCEE: 4C        .byte $4C   ; 
- - - - - - 0x017CFF 05:BCEF: 02        .byte $02   ; 
- - - - - - 0x017D00 05:BCF0: 02        .byte $02   ; 
- - - - - - 0x017D01 05:BCF1: 00        .byte $00   ; 
- - - - - - 0x017D02 05:BCF2: 52        .byte $52   ; 
- - - - - - 0x017D03 05:BCF3: 02        .byte $02   ; 
- - - - - - 0x017D04 05:BCF4: 03        .byte $03   ; 
- - - - - - 0x017D05 05:BCF5: 00        .byte $00   ; 
- - - - - - 0x017D06 05:BCF6: 52        .byte $52   ; 
- - - - - - 0x017D07 05:BCF7: 01        .byte $01   ; 
- - - - - - 0x017D08 05:BCF8: 03        .byte $03   ; 
- - - - - - 0x017D09 05:BCF9: 01        .byte $01   ; 
- - - - - - 0x017D0A 05:BCFA: 52        .byte $52   ; 
- - - - - - 0x017D0B 05:BCFB: 01        .byte $01   ; 
- - - - - - 0x017D0C 05:BCFC: 03        .byte $03   ; 
- - - - - - 0x017D0D 05:BCFD: 00        .byte $00   ; 



off_BCFE_02:
- D 1 - I - 0x017D0E 05:BCFE: 58        .byte $58   ; 
- D 1 - I - 0x017D0F 05:BCFF: 01        .byte $01   ; 
- D 1 - I - 0x017D10 05:BD00: 04        .byte $04   ; 
- D 1 - I - 0x017D11 05:BD01: 00        .byte $00   ; 



tbl_BD02:
- D 1 - - - 0x017D12 05:BD02: 06 BD     .word off_BD06_00
- D 1 - - - 0x017D14 05:BD04: 08 BD     .word off_BD08_01

off_BD06_00:
- D 1 - I - 0x017D16 05:BD06: 00        .byte $00   ; 
- D 1 - I - 0x017D17 05:BD07: 0A        .byte $0A   ; 

off_BD08_01:
- D 1 - I - 0x017D18 05:BD08: 00        .byte $00   ; 
- D 1 - I - 0x017D19 05:BD09: 01        .byte $01   ; 
- D 1 - I - 0x017D1A 05:BD0A: 0A        .byte $0A   ; 
- D 1 - I - 0x017D1B 05:BD0B: 0B        .byte $0B   ; 



tbl_BD0C:
; !!! bzk I, вероятно это часть таблицы выше
- D 1 - - - 0x017D1C 05:BD0C: 00        .byte $00   ; 
- D 1 - - - 0x017D1D 05:BD0D: 00        .byte $00   ; 
- - - - - - 0x017D1E 05:BD0E: 00        .byte $00   ; 
- D 1 - - - 0x017D1F 05:BD0F: 10        .byte $10   ; 
- D 1 - I - 0x017D20 05:BD10: 10        .byte $10   ; 
- D 1 - I - 0x017D21 05:BD11: 10        .byte $10   ; 
- - - - - - 0x017D22 05:BD12: 20        .byte $20   ; 
- - - - - - 0x017D23 05:BD13: 30        .byte $30   ; 
- - - - - - 0x017D24 05:BD14: 30        .byte $30   ; 
- - - - - - 0x017D25 05:BD15: 30        .byte $30   ; 
- - - - - - 0x017D26 05:BD16: 30        .byte $30   ; 
- - - - - - 0x017D27 05:BD17: 30        .byte $30   ; 



tbl_BD18:
- D 1 - - - 0x017D28 05:BD18: 55        .byte $55   ; 
tbl_BD19:
- D 1 - - - 0x017D29 05:BD19: 00        .byte $00   ; 
- D 1 - - - 0x017D2A 05:BD1A: 56        .byte $56   ; 
- D 1 - - - 0x017D2B 05:BD1B: 00        .byte $00   ; 
- - - - - - 0x017D2C 05:BD1C: 55        .byte $55   ; 
- - - - - - 0x017D2D 05:BD1D: 00        .byte $00   ; 
- D 1 - - - 0x017D2E 05:BD1E: 52        .byte $52   ; 
- D 1 - - - 0x017D2F 05:BD1F: 01        .byte $01   ; 
- - - - - - 0x017D30 05:BD20: 55        .byte $55   ; 
- - - - - - 0x017D31 05:BD21: 00        .byte $00   ; 
- D 1 - - - 0x017D32 05:BD22: 55        .byte $55   ; 
- D 1 - - - 0x017D33 05:BD23: 00        .byte $00   ; 
- - - - - - 0x017D34 05:BD24: 80        .byte $80   ; 
- - - - - - 0x017D35 05:BD25: 02        .byte $02   ; 
- D 1 - - - 0x017D36 05:BD26: 91        .byte $91   ; 
- D 1 - - - 0x017D37 05:BD27: 00        .byte $00   ; 
- - - - - - 0x017D38 05:BD28: 55        .byte $55   ; 
- - - - - - 0x017D39 05:BD29: 00        .byte $00   ; 
- D 1 - - - 0x017D3A 05:BD2A: 80        .byte $80   ; 
- D 1 - - - 0x017D3B 05:BD2B: 01        .byte $01   ; 
- - - - - - 0x017D3C 05:BD2C: 80        .byte $80   ; 
- - - - - - 0x017D3D 05:BD2D: 02        .byte $02   ; 
- D 1 - - - 0x017D3E 05:BD2E: 90        .byte $90   ; 
- D 1 - - - 0x017D3F 05:BD2F: 01        .byte $01   ; 
- - - - - - 0x017D40 05:BD30: 55        .byte $55   ; 
- - - - - - 0x017D41 05:BD31: 00        .byte $00   ; 
- D 1 - - - 0x017D42 05:BD32: 80        .byte $80   ; 
- D 1 - - - 0x017D43 05:BD33: 01        .byte $01   ; 
- D 1 - - - 0x017D44 05:BD34: 41        .byte $41   ; 
- D 1 - - - 0x017D45 05:BD35: 00        .byte $00   ; 
- D 1 - - - 0x017D46 05:BD36: 82        .byte $82   ; 
- D 1 - - - 0x017D47 05:BD37: 02        .byte $02   ; 



loc_BD38_рожи:
sub_BD38_рожи:
C D 1 - - - 0x017D48 05:BD38: A2 00     LDX #$00
C - - - - - 0x017D4A 05:BD3A: 86 1C     STX ram_001C
C - - - - - 0x017D4C 05:BD3C: E8        INX
C - - - - - 0x017D4D 05:BD3D: 86 1D     STX ram_001D
C - - - - - 0x017D4F 05:BD3F: AD 2D 05  LDA ram_номер_команды + 1
C - - - - - 0x017D52 05:BD42: 29 03     AND #$03
C - - - - - 0x017D54 05:BD44: D0 05     BNE bra_BD4B
C - - - - - 0x017D56 05:BD46: 86 1C     STX ram_001C
C - - - - - 0x017D58 05:BD48: CA        DEX
C - - - - - 0x017D59 05:BD49: 86 1D     STX ram_001D
bra_BD4B:
C - - - - - 0x017D5B 05:BD4B: A6 1D     LDX ram_001D
C - - - - - 0x017D5D 05:BD4D: BD 2C 05  LDA ram_номер_команды,X
C - - - - - 0x017D60 05:BD50: 29 0F     AND #$0F
C - - - - - 0x017D62 05:BD52: 0A        ASL
C - - - - - 0x017D63 05:BD53: A8        TAY
C - - - - - 0x017D64 05:BD54: B9 F7 BD  LDA tbl_BDF7,Y
C - - - - - 0x017D67 05:BD57: 8D B9 05  STA ram_банк_спрайтов + 1
C - - - - - 0x017D6A 05:BD5A: A6 1C     LDX ram_001C
C - - - - - 0x017D6C 05:BD5C: BD 2C 05  LDA ram_номер_команды,X
C - - - - - 0x017D6F 05:BD5F: 29 0F     AND #$0F
C - - - - - 0x017D71 05:BD61: 0A        ASL
C - - - - - 0x017D72 05:BD62: A8        TAY
C - - - - - 0x017D73 05:BD63: B9 F6 BD  LDA tbl_BDF6,Y
C - - - - - 0x017D76 05:BD66: 8D BA 05  STA ram_банк_спрайтов + 2
C - - - - - 0x017D79 05:BD69: A5 1C     LDA ram_001C
C - - - - - 0x017D7B 05:BD6B: 0A        ASL
C - - - - - 0x017D7C 05:BD6C: A8        TAY
C - - - - - 0x017D7D 05:BD6D: AD 2C 05  LDA ram_номер_команды
C - - - - - 0x017D80 05:BD70: 29 03     AND #$03
C - - - - - 0x017D82 05:BD72: D0 02     BNE bra_BD76
C - - - - - 0x017D84 05:BD74: A0 04     LDY #$04
bra_BD76:
C - - - - - 0x017D86 05:BD76: B9 16 BE  LDA tbl_BE16,Y
C - - - - - 0x017D89 05:BD79: 85 2C     STA ram_002C
C - - - - - 0x017D8B 05:BD7B: B9 17 BE  LDA tbl_BE16 + 1,Y
C - - - - - 0x017D8E 05:BD7E: 85 2D     STA ram_002D
C - - - - - 0x017D90 05:BD80: A5 1D     LDA ram_001D
C - - - - - 0x017D92 05:BD82: 0A        ASL
C - - - - - 0x017D93 05:BD83: A8        TAY
C - - - - - 0x017D94 05:BD84: AD 2D 05  LDA ram_номер_команды + 1
C - - - - - 0x017D97 05:BD87: 29 03     AND #$03
C - - - - - 0x017D99 05:BD89: D0 02     BNE bra_BD8D
C - - - - - 0x017D9B 05:BD8B: A0 04     LDY #$04
bra_BD8D:
C - - - - - 0x017D9D 05:BD8D: B9 16 BE  LDA tbl_BE16,Y
C - - - - - 0x017DA0 05:BD90: 85 2E     STA ram_002E
C - - - - - 0x017DA2 05:BD92: B9 17 BE  LDA tbl_BE16 + 1,Y
C - - - - - 0x017DA5 05:BD95: 85 2F     STA ram_002F
C - - - - - 0x017DA7 05:BD97: A2 00     LDX #$00
bra_BD99_loop:
C - - - - - 0x017DA9 05:BD99: BC 32 05  LDY ram_player_id,X
C - - - - - 0x017DAC 05:BD9C: B1 2C     LDA (ram_002C),Y
C - - - - - 0x017DAE 05:BD9E: 9D 5C 05  STA ram_лицо_игрока,X
C - - - - - 0x017DB1 05:BDA1: E8        INX
C - - - - - 0x017DB2 05:BDA2: BC 32 05  LDY ram_player_id,X
C - - - - - 0x017DB5 05:BDA5: B1 2E     LDA (ram_002E),Y
C - - - - - 0x017DB7 05:BDA7: 9D 5C 05  STA ram_лицо_игрока,X
C - - - - - 0x017DBA 05:BDAA: E8        INX
C - - - - - 0x017DBB 05:BDAB: E0 0C     CPX #$0C
C - - - - - 0x017DBD 05:BDAD: 90 EA     BCC bra_BD99_loop
C - - - - - 0x017DBF 05:BDAF: 60        RTS



loc_BDB0:
sub_BDB0:
C D 1 - - - 0x017DC0 05:BDB0: A9 01     LDA #$01
C - - - - - 0x017DC2 05:BDB2: 8D AE 05  STA ram_palette_id_spr
C - - - - - 0x017DC5 05:BDB5: AD 2C 05  LDA ram_номер_команды
C - - - - - 0x017DC8 05:BDB8: 29 0F     AND #$0F
C - - - - - 0x017DCA 05:BDBA: 0A        ASL
C - - - - - 0x017DCB 05:BDBB: A8        TAY
C - - - - - 0x017DCC 05:BDBC: B9 D6 BD  LDA tbl_BDD6,Y
C - - - - - 0x017DCF 05:BDBF: 8D AF 05  STA ram_palette_id_spr + 1
C - - - - - 0x017DD2 05:BDC2: AD 2D 05  LDA ram_номер_команды + 1
C - - - - - 0x017DD5 05:BDC5: 29 0F     AND #$0F
C - - - - - 0x017DD7 05:BDC7: 0A        ASL
C - - - - - 0x017DD8 05:BDC8: A8        TAY
C - - - - - 0x017DD9 05:BDC9: B9 D6 BD  LDA tbl_BDD6,Y
C - - - - - 0x017DDC 05:BDCC: 8D B0 05  STA ram_palette_id_spr + 2
C - - - - - 0x017DDF 05:BDCF: B9 D7 BD  LDA tbl_BDD7,Y
C - - - - - 0x017DE2 05:BDD2: 8D B1 05  STA ram_palette_id_spr + 3
C - - - - - 0x017DE5 05:BDD5: 60        RTS



tbl_BDD6:
- D 1 - - - 0x017DE6 05:BDD6: 04        .byte $04   ; 
tbl_BDD7:
- D 1 - - - 0x017DE7 05:BDD7: 08        .byte $08   ; 
- D 1 - - - 0x017DE8 05:BDD8: 04        .byte $04   ; 
- D 1 - - - 0x017DE9 05:BDD9: 09        .byte $09   ; 
- - - - - - 0x017DEA 05:BDDA: 04        .byte $04   ; 
- - - - - - 0x017DEB 05:BDDB: 0A        .byte $0A   ; 
- D 1 - - - 0x017DEC 05:BDDC: 04        .byte $04   ; 
- D 1 - - - 0x017DED 05:BDDD: 0B        .byte $0B   ; 
- - - - - - 0x017DEE 05:BDDE: 05        .byte $05   ; 
- - - - - - 0x017DEF 05:BDDF: 0C        .byte $0C   ; 
- D 1 - - - 0x017DF0 05:BDE0: 05        .byte $05   ; 
- D 1 - - - 0x017DF1 05:BDE1: 0C        .byte $0C   ; 
- - - - - - 0x017DF2 05:BDE2: 05        .byte $05   ; 
- - - - - - 0x017DF3 05:BDE3: 0D        .byte $0D   ; 
- D 1 - - - 0x017DF4 05:BDE4: 05        .byte $05   ; 
- D 1 - - - 0x017DF5 05:BDE5: 0E        .byte $0E   ; 
- - - - - - 0x017DF6 05:BDE6: 06        .byte $06   ; 
- - - - - - 0x017DF7 05:BDE7: 0F        .byte $0F   ; 
- D 1 - - - 0x017DF8 05:BDE8: 06        .byte $06   ; 
- D 1 - - - 0x017DF9 05:BDE9: 0F        .byte $0F   ; 
- - - - - - 0x017DFA 05:BDEA: 06        .byte $06   ; 
- - - - - - 0x017DFB 05:BDEB: 10        .byte $10   ; 
- D 1 - - - 0x017DFC 05:BDEC: 06        .byte $06   ; 
- D 1 - - - 0x017DFD 05:BDED: 11        .byte $11   ; 
- - - - - - 0x017DFE 05:BDEE: 07        .byte $07   ; 
- - - - - - 0x017DFF 05:BDEF: 12        .byte $12   ; 
- D 1 - - - 0x017E00 05:BDF0: 07        .byte $07   ; 
- D 1 - - - 0x017E01 05:BDF1: 12        .byte $12   ; 
- D 1 - - - 0x017E02 05:BDF2: 07        .byte $07   ; 
- D 1 - - - 0x017E03 05:BDF3: 13        .byte $13   ; 
- D 1 - - - 0x017E04 05:BDF4: 1C        .byte $1C   ; 
- D 1 - - - 0x017E05 05:BDF5: 14        .byte $14   ; 



tbl_BDF6:
- D 1 - - - 0x017E06 05:BDF6: 20        .byte $20   ; 
tbl_BDF7:
- D 1 - - - 0x017E07 05:BDF7: 14        .byte $14   ; 
- - - - - - 0x017E08 05:BDF8: 20        .byte $20   ; 
- D 1 - - - 0x017E09 05:BDF9: 14        .byte $14   ; 
- - - - - - 0x017E0A 05:BDFA: 20        .byte $20   ; 
- D 1 - - - 0x017E0B 05:BDFB: 15        .byte $15   ; 
- - - - - - 0x017E0C 05:BDFC: 20        .byte $20   ; 
- D 1 - - - 0x017E0D 05:BDFD: 16        .byte $16   ; 
- - - - - - 0x017E0E 05:BDFE: 20        .byte $20   ; 
- - - - - - 0x017E0F 05:BDFF: 17        .byte $17   ; 
- - - - - - 0x017E10 05:BE00: 20        .byte $20   ; 
- D 1 - - - 0x017E11 05:BE01: 17        .byte $17   ; 
- - - - - - 0x017E12 05:BE02: 20        .byte $20   ; 
- - - - - - 0x017E13 05:BE03: 18        .byte $18   ; 
- D 1 - - - 0x017E14 05:BE04: 21        .byte $21   ; 
- D 1 - - - 0x017E15 05:BE05: 19        .byte $19   ; 
- - - - - - 0x017E16 05:BE06: 20        .byte $20   ; 
- - - - - - 0x017E17 05:BE07: 1A        .byte $1A   ; 
- D 1 - - - 0x017E18 05:BE08: 22        .byte $22   ; 
- D 1 - - - 0x017E19 05:BE09: 1A        .byte $1A   ; 
- - - - - - 0x017E1A 05:BE0A: 20        .byte $20   ; 
- - - - - - 0x017E1B 05:BE0B: 1B        .byte $1B   ; 
- D 1 - - - 0x017E1C 05:BE0C: 23        .byte $23   ; 
- D 1 - - - 0x017E1D 05:BE0D: 1C        .byte $1C   ; 
- - - - - - 0x017E1E 05:BE0E: 20        .byte $20   ; 
- - - - - - 0x017E1F 05:BE0F: 1D        .byte $1D   ; 
- D 1 - - - 0x017E20 05:BE10: 24        .byte $24   ; 
- D 1 - - - 0x017E21 05:BE11: 1D        .byte $1D   ; 
- D 1 - - - 0x017E22 05:BE12: 25        .byte $25   ; 
- D 1 - - - 0x017E23 05:BE13: 1E        .byte $1E   ; 
- - - - - - 0x017E24 05:BE14: 20        .byte $20   ; 
- D 1 - - - 0x017E25 05:BE15: 1F        .byte $1F   ; 



tbl_BE16:
- D 1 - - - 0x017E26 05:BE16: 1C BE     .word off_BE1C_00
- D 1 - - - 0x017E28 05:BE18: 22 BE     .word off_BE22_01
- D 1 - - - 0x017E2A 05:BE1A: 28 BE     .word off_BE28_02

off_BE1C_00:
- D 1 - I - 0x017E2C 05:BE1C: 0C        .byte $0C   ; 
- D 1 - I - 0x017E2D 05:BE1D: 0D        .byte $0D   ; 
- D 1 - I - 0x017E2E 05:BE1E: 0E        .byte $0E   ; 
- D 1 - I - 0x017E2F 05:BE1F: 0F        .byte $0F   ; 
- D 1 - I - 0x017E30 05:BE20: 10        .byte $10   ; 
- D 1 - I - 0x017E31 05:BE21: 11        .byte $11   ; 



off_BE22_01:
- D 1 - I - 0x017E32 05:BE22: 12        .byte $12   ; 
- D 1 - I - 0x017E33 05:BE23: 13        .byte $13   ; 
- D 1 - I - 0x017E34 05:BE24: 14        .byte $14   ; 
- D 1 - I - 0x017E35 05:BE25: 15        .byte $15   ; 
- D 1 - I - 0x017E36 05:BE26: 16        .byte $16   ; 
- D 1 - I - 0x017E37 05:BE27: 17        .byte $17   ; 



off_BE28_02:
- D 1 - I - 0x017E38 05:BE28: 00        .byte $00   ; 
- D 1 - I - 0x017E39 05:BE29: 01        .byte $01   ; 
- D 1 - I - 0x017E3A 05:BE2A: 02        .byte $02   ; 
- D 1 - I - 0x017E3B 05:BE2B: 03        .byte $03   ; 
- D 1 - I - 0x017E3C 05:BE2C: 04        .byte $04   ; 
- D 1 - I - 0x017E3D 05:BE2D: 05        .byte $05   ; 
- D 1 - I - 0x017E3E 05:BE2E: 06        .byte $06   ; 
- D 1 - I - 0x017E3F 05:BE2F: 07        .byte $07   ; 
- D 1 - I - 0x017E40 05:BE30: 08        .byte $08   ; 
- D 1 - I - 0x017E41 05:BE31: 09        .byte $09   ; 
- D 1 - I - 0x017E42 05:BE32: 0A        .byte $0A   ; 
- D 1 - I - 0x017E43 05:BE33: 0B        .byte $0B   ; 



sub_BE34_скопировать_из_ppu_и_сразу_записать_в_ppu:
C - - - - - 0x017E44 05:BE34: A0 00     LDY #$00
C - - - - - 0x017E46 05:BE36: A2 74     LDX #$74
C - - - - - 0x017E48 05:BE38: 8C 00 80  STY $8000
C - - - - - 0x017E4B 05:BE3B: 8E 01 80  STX $8001
C - - - - - 0x017E4E 05:BE3E: C8        INY
C - - - - - 0x017E4F 05:BE3F: 8C 00 80  STY $8000
C - - - - - 0x017E52 05:BE42: E8        INX
C - - - - - 0x017E53 05:BE43: 8E 01 80  STX $8001
C - - - - - 0x017E56 05:BE46: A2 00     LDX #$00
bra_BE48_main_loop:
C - - - - - 0x017E58 05:BE48: A0 00     LDY #$00
C - - - - - 0x017E5A 05:BE4A: AD 02 20  LDA $2002   ; bzk опт, достаточно одного в самом начале
C - - - - - 0x017E5D 05:BE4D: A5 2D     LDA ram_002D
C - - - - - 0x017E5F 05:BE4F: 8D 06 20  STA $2006
C - - - - - 0x017E62 05:BE52: A5 2C     LDA ram_002C
C - - - - - 0x017E64 05:BE54: 8D 06 20  STA $2006
C - - - - - 0x017E67 05:BE57: AD 07 20  LDA $2007
bra_BE5A_loop:
C - - - - - 0x017E6A 05:BE5A: AD 07 20  LDA $2007
C - - - - - 0x017E6D 05:BE5D: 99 96 06  STA ram_буфер_атрибутов,Y
C - - - - - 0x017E70 05:BE60: C8        INY
C - - - - - 0x017E71 05:BE61: C4 30     CPY ram_0030
C - - - - - 0x017E73 05:BE63: 90 F5     BCC bra_BE5A_loop
C - - - - - 0x017E75 05:BE65: A0 00     LDY #$00
C - - - - - 0x017E77 05:BE67: AD 02 20  LDA $2002   ; bzk опт, лишнее
C - - - - - 0x017E7A 05:BE6A: A5 2F     LDA ram_002F
C - - - - - 0x017E7C 05:BE6C: 8D 06 20  STA $2006
C - - - - - 0x017E7F 05:BE6F: A5 2E     LDA ram_002E
C - - - - - 0x017E81 05:BE71: 8D 06 20  STA $2006
bra_BE74_loop:
C - - - - - 0x017E84 05:BE74: B9 96 06  LDA ram_буфер_атрибутов,Y
C - - - - - 0x017E87 05:BE77: 8D 07 20  STA $2007
C - - - - - 0x017E8A 05:BE7A: C8        INY
C - - - - - 0x017E8B 05:BE7B: C4 30     CPY ram_0030
C - - - - - 0x017E8D 05:BE7D: 90 F5     BCC bra_BE74_loop
C - - - - - 0x017E8F 05:BE7F: A5 2C     LDA ram_002C
C - - - - - 0x017E91 05:BE81: 18        CLC
C - - - - - 0x017E92 05:BE82: 65 30     ADC ram_0030
C - - - - - 0x017E94 05:BE84: 85 2C     STA ram_002C
C - - - - - 0x017E96 05:BE86: A5 2D     LDA ram_002D
C - - - - - 0x017E98 05:BE88: 69 00     ADC #$00
C - - - - - 0x017E9A 05:BE8A: 85 2D     STA ram_002D
C - - - - - 0x017E9C 05:BE8C: A5 2E     LDA ram_002E
C - - - - - 0x017E9E 05:BE8E: 18        CLC
C - - - - - 0x017E9F 05:BE8F: 69 20     ADC #$20
C - - - - - 0x017EA1 05:BE91: 85 2E     STA ram_002E
C - - - - - 0x017EA3 05:BE93: A5 2F     LDA ram_002F
C - - - - - 0x017EA5 05:BE95: 69 00     ADC #$00
C - - - - - 0x017EA7 05:BE97: 85 2F     STA ram_002F
C - - - - - 0x017EA9 05:BE99: E8        INX
C - - - - - 0x017EAA 05:BE9A: E4 31     CPX ram_0031
C - - - - - 0x017EAC 05:BE9C: 90 AA     BCC bra_BE48_main_loop
C - - - - - 0x017EAE 05:BE9E: 60        RTS



sub_BE9F:
C - - - - - 0x017EAF 05:BE9F: A2 01     LDX #$01
C - - - - - 0x017EB1 05:BEA1: 86 2B     STX ram_002B
bra_BEA3:
C - - - - - 0x017EB3 05:BEA3: A6 2B     LDX ram_002B
C - - - - - 0x017EB5 05:BEA5: BD 2C 05  LDA ram_номер_команды,X
C - - - - - 0x017EB8 05:BEA8: 29 0F     AND #$0F
C - - - - - 0x017EBA 05:BEAA: 0A        ASL
C - - - - - 0x017EBB 05:BEAB: A8        TAY
C - - - - - 0x017EBC 05:BEAC: B9 DA BE  LDA tbl_BEDA,Y
C - - - - - 0x017EBF 05:BEAF: 85 2C     STA ram_002C
C - - - - - 0x017EC1 05:BEB1: B9 DB BE  LDA tbl_BEDB,Y
C - - - - - 0x017EC4 05:BEB4: 85 2D     STA ram_002D
C - - - - - 0x017EC6 05:BEB6: 8A        TXA
C - - - - - 0x017EC7 05:BEB7: 0A        ASL
C - - - - - 0x017EC8 05:BEB8: A8        TAY
C - - - - - 0x017EC9 05:BEB9: B9 D6 BE  LDA tbl_BED6,Y
C - - - - - 0x017ECC 05:BEBC: 85 2E     STA ram_002E
C - - - - - 0x017ECE 05:BEBE: B9 D7 BE  LDA tbl_BED7,Y
C - - - - - 0x017ED1 05:BEC1: 85 2F     STA ram_002F
C - - - - - 0x017ED3 05:BEC3: A9 07     LDA #$07    ; размер буфера
C - - - - - 0x017ED5 05:BEC5: 85 30     STA ram_0030
C - - - - - 0x017ED7 05:BEC7: A9 09     LDA #$09    ; счетчик главного цикла
C - - - - - 0x017ED9 05:BEC9: 85 31     STA ram_0031
C - - - - - 0x017EDB 05:BECB: 20 34 BE  JSR sub_BE34_скопировать_из_ppu_и_сразу_записать_в_ppu
C - - - - - 0x017EDE 05:BECE: C6 2B     DEC ram_002B
C - - - - - 0x017EE0 05:BED0: 10 D1     BPL bra_BEA3
C - - - - - 0x017EE2 05:BED2: 20 0B C0  JSR sub_0x01EEAA_базовые_банки_спрайтов
C - - - - - 0x017EE5 05:BED5: 60        RTS



tbl_BED6:
- D 1 - - - 0x017EE6 05:BED6: E5        .byte $E5   ; 
tbl_BED7:
- D 1 - - - 0x017EE7 05:BED7: 20        .byte $20   ; 
- D 1 - - - 0x017EE8 05:BED8: F4        .byte $F4   ; 
- D 1 - - - 0x017EE9 05:BED9: 20        .byte $20   ; 



tbl_BEDA:
- D 1 - - - 0x017EEA 05:BEDA: 00        .byte $00   ; 
tbl_BEDB:
- D 1 - - - 0x017EEB 05:BEDB: 00        .byte $00   ; 
- D 1 - - - 0x017EEC 05:BEDC: 3F        .byte $3F   ; 
- D 1 - - - 0x017EED 05:BEDD: 00        .byte $00   ; 
- D 1 - - - 0x017EEE 05:BEDE: 7E        .byte $7E   ; 
- D 1 - - - 0x017EEF 05:BEDF: 00        .byte $00   ; 
- D 1 - - - 0x017EF0 05:BEE0: BD        .byte $BD   ; 
- D 1 - - - 0x017EF1 05:BEE1: 00        .byte $00   ; 
- - - - - - 0x017EF2 05:BEE2: 00        .byte $00   ; 
- - - - - - 0x017EF3 05:BEE3: 00        .byte $00   ; 
- D 1 - - - 0x017EF4 05:BEE4: FC        .byte $FC   ; 
- D 1 - - - 0x017EF5 05:BEE5: 00        .byte $00   ; 
- D 1 - - - 0x017EF6 05:BEE6: 3B        .byte $3B   ; 
- D 1 - - - 0x017EF7 05:BEE7: 01        .byte $01   ; 
- D 1 - - - 0x017EF8 05:BEE8: 7A        .byte $7A   ; 
- D 1 - - - 0x017EF9 05:BEE9: 01        .byte $01   ; 
- - - - - - 0x017EFA 05:BEEA: 00        .byte $00   ; 
- - - - - - 0x017EFB 05:BEEB: 00        .byte $00   ; 
- D 1 - - - 0x017EFC 05:BEEC: B9        .byte $B9   ; 
- D 1 - - - 0x017EFD 05:BEED: 01        .byte $01   ; 
- D 1 - - - 0x017EFE 05:BEEE: F8        .byte $F8   ; 
- D 1 - - - 0x017EFF 05:BEEF: 01        .byte $01   ; 
- D 1 - - - 0x017F00 05:BEF0: 37        .byte $37   ; 
- D 1 - - - 0x017F01 05:BEF1: 02        .byte $02   ; 
- - - - - - 0x017F02 05:BEF2: 00        .byte $00   ; 
- - - - - - 0x017F03 05:BEF3: 00        .byte $00   ; 
- D 1 - - - 0x017F04 05:BEF4: 76        .byte $76   ; 
- D 1 - - - 0x017F05 05:BEF5: 02        .byte $02   ; 
- D 1 - - - 0x017F06 05:BEF6: B5        .byte $B5   ; 
- D 1 - - - 0x017F07 05:BEF7: 02        .byte $02   ; 
- D 1 - - - 0x017F08 05:BEF8: F4        .byte $F4   ; 
- D 1 - - - 0x017F09 05:BEF9: 02        .byte $02   ; 



sub_BEFA:
C - - - - - 0x017F0A 05:BEFA: AD 29 05  LDA ram_опция_материк
C - - - - - 0x017F0D 05:BEFD: 0A        ASL
C - - - - - 0x017F0E 05:BEFE: A8        TAY
C - - - - - 0x017F0F 05:BEFF: B9 20 BF  LDA tbl_BF20,Y
C - - - - - 0x017F12 05:BF02: 85 2C     STA ram_002C
C - - - - - 0x017F14 05:BF04: B9 21 BF  LDA tbl_BF21,Y
C - - - - - 0x017F17 05:BF07: 85 2D     STA ram_002D
C - - - - - 0x017F19 05:BF09: A9 44     LDA #< $2044
C - - - - - 0x017F1B 05:BF0B: 85 2E     STA ram_002E
C - - - - - 0x017F1D 05:BF0D: A9 20     LDA #> $2044
C - - - - - 0x017F1F 05:BF0F: 85 2F     STA ram_002F
C - - - - - 0x017F21 05:BF11: A9 18     LDA #$18    ; размер буфера
C - - - - - 0x017F23 05:BF13: 85 30     STA ram_0030
C - - - - - 0x017F25 05:BF15: A9 02     LDA #$02    ; счетчик главного цикла
C - - - - - 0x017F27 05:BF17: 85 31     STA ram_0031
C - - - - - 0x017F29 05:BF19: 20 34 BE  JSR sub_BE34_скопировать_из_ppu_и_сразу_записать_в_ppu
C - - - - - 0x017F2C 05:BF1C: 20 0B C0  JSR sub_0x01EEAA_базовые_банки_спрайтов
C - - - - - 0x017F2F 05:BF1F: 60        RTS

tbl_BF20:
- D 1 - - - 0x017F30 05:BF20: 33        .byte $33   ; 
tbl_BF21:
- D 1 - - - 0x017F31 05:BF21: 03        .byte $03   ; 
- D 1 - - - 0x017F32 05:BF22: 63        .byte $63   ; 
- D 1 - - - 0x017F33 05:BF23: 03        .byte $03   ; 
- D 1 - - - 0x017F34 05:BF24: 93        .byte $93   ; 
- D 1 - - - 0x017F35 05:BF25: 03        .byte $03   ; 
- D 1 - - - 0x017F36 05:BF26: C3        .byte $C3   ; 
- D 1 - - - 0x017F37 05:BF27: 03        .byte $03   ; 
- - - - - - 0x017F38 05:BF28: F3        .byte $F3   ; 
- - - - - - 0x017F39 05:BF29: 03        .byte $03   ; 



sub_BF2A:
C - - - - - 0x017F3A 05:BF2A: AD 03 06  LDA ram_0603
C - - - - - 0x017F3D 05:BF2D: 29 E0     AND #$E0
C - - - - - 0x017F3F 05:BF2F: 4A        LSR
C - - - - - 0x017F40 05:BF30: 4A        LSR
C - - - - - 0x017F41 05:BF31: 4A        LSR
C - - - - - 0x017F42 05:BF32: 4A        LSR
C - - - - - 0x017F43 05:BF33: A8        TAY
C - - - - - 0x017F44 05:BF34: B9 55 BF  LDA tbl_BF55,Y
C - - - - - 0x017F47 05:BF37: 85 2C     STA ram_002C
C - - - - - 0x017F49 05:BF39: B9 56 BF  LDA tbl_BF56,Y
C - - - - - 0x017F4C 05:BF3C: 85 2D     STA ram_002D
C - - - - - 0x017F4E 05:BF3E: A9 27     LDA #< $2127
C - - - - - 0x017F50 05:BF40: 85 2E     STA ram_002E
C - - - - - 0x017F52 05:BF42: A9 21     LDA #> $2127
C - - - - - 0x017F54 05:BF44: 85 2F     STA ram_002F
C - - - - - 0x017F56 05:BF46: A9 12     LDA #$12    ; размер буфера
C - - - - - 0x017F58 05:BF48: 85 30     STA ram_0030
C - - - - - 0x017F5A 05:BF4A: A9 03     LDA #$03    ; счетчик главного цикла
C - - - - - 0x017F5C 05:BF4C: 85 31     STA ram_0031
C - - - - - 0x017F5E 05:BF4E: 20 34 BE  JSR sub_BE34_скопировать_из_ppu_и_сразу_записать_в_ppu
C - - - - - 0x017F61 05:BF51: 20 0B C0  JSR sub_0x01EEAA_базовые_банки_спрайтов
C - - - - - 0x017F64 05:BF54: 60        RTS



tbl_BF55:
- D 1 - - - 0x017F65 05:BF55: 23        .byte $23   ; 
tbl_BF56:
- D 1 - - - 0x017F66 05:BF56: 04        .byte $04   ; 
- D 1 - - - 0x017F67 05:BF57: 59        .byte $59   ; 
- D 1 - - - 0x017F68 05:BF58: 04        .byte $04   ; 
- D 1 - - - 0x017F69 05:BF59: 8F        .byte $8F   ; 
- D 1 - - - 0x017F6A 05:BF5A: 04        .byte $04   ; 
- - - - - - 0x017F6B 05:BF5B: C5        .byte $C5   ; 
- - - - - - 0x017F6C 05:BF5C: 04        .byte $04   ; 
- - - - - - 0x017F6D 05:BF5D: FB        .byte $FB   ; 
- - - - - - 0x017F6E 05:BF5E: 04        .byte $04   ; 
- - - - - - 0x017F6F 05:BF5F: 31        .byte $31   ; 
- - - - - - 0x017F70 05:BF60: 05        .byte $05   ; 
- - - - - - 0x017F71 05:BF61: 67        .byte $67   ; 
- - - - - - 0x017F72 05:BF62: 05        .byte $05   ; 
- - - - - - 0x017F73 05:BF63: 67        .byte $67   ; 
- - - - - - 0x017F74 05:BF64: 05        .byte $05   ; 



sub_BF65:
C - - - - - 0x017F75 05:BF65: A5 57     LDA ram_option_mode_difficulty
C - - - - - 0x017F77 05:BF67: 30 07     BMI bra_BF70_walkthrough
C - - - - - 0x017F79 05:BF69: 18        CLC
C - - - - - 0x017F7A 05:BF6A: AD 29 05  LDA ram_опция_материк
C - - - - - 0x017F7D 05:BF6D: 4C 7F BF  JMP loc_BF7F
bra_BF70_walkthrough:
C - - - - - 0x017F80 05:BF70: A0 08     LDY #$08
C - - - - - 0x017F82 05:BF72: AD 4A 05  LDA ram_054A
C - - - - - 0x017F85 05:BF75: 10 0A     BPL bra_BF81
C - - - - - 0x017F87 05:BF77: AD 2D 05  LDA ram_номер_команды + 1
C - - - - - 0x017F8A 05:BF7A: 29 0F     AND #$0F
C - - - - - 0x017F8C 05:BF7C: 18        CLC
C - - - - - 0x017F8D 05:BF7D: 69 04     ADC #$04
loc_BF7F:
C D 1 - - - 0x017F8F 05:BF7F: 0A        ASL
C - - - - - 0x017F90 05:BF80: A8        TAY
bra_BF81:
C - - - - - 0x017F91 05:BF81: B9 A2 BF  LDA tbl_BFA2,Y
C - - - - - 0x017F94 05:BF84: 85 2C     STA ram_002C
C - - - - - 0x017F96 05:BF86: B9 A3 BF  LDA tbl_BFA3,Y
C - - - - - 0x017F99 05:BF89: 85 2D     STA ram_002D
C - - - - - 0x017F9B 05:BF8B: A9 AA     LDA #< $20AA
C - - - - - 0x017F9D 05:BF8D: 85 2E     STA ram_002E
C - - - - - 0x017F9F 05:BF8F: A9 20     LDA #> $20AA
C - - - - - 0x017FA1 05:BF91: 85 2F     STA ram_002F
C - - - - - 0x017FA3 05:BF93: A9 0E     LDA #$0E    ; размер буфера
C - - - - - 0x017FA5 05:BF95: 85 30     STA ram_0030
C - - - - - 0x017FA7 05:BF97: A9 02     LDA #$02    ; счетчик главного цикла
C - - - - - 0x017FA9 05:BF99: 85 31     STA ram_0031
C - - - - - 0x017FAB 05:BF9B: 20 34 BE  JSR sub_BE34_скопировать_из_ppu_и_сразу_записать_в_ppu
C - - - - - 0x017FAE 05:BF9E: 20 0B C0  JSR sub_0x01EEAA_базовые_банки_спрайтов
C - - - - - 0x017FB1 05:BFA1: 60        RTS

tbl_BFA2:
- D 1 - - - 0x017FB2 05:BFA2: 9D        .byte $9D   ; 
tbl_BFA3:
- D 1 - - - 0x017FB3 05:BFA3: 05        .byte $05   ; 
- - - - - - 0x017FB4 05:BFA4: B9        .byte $B9   ; 
- - - - - - 0x017FB5 05:BFA5: 05        .byte $05   ; 
- - - - - - 0x017FB6 05:BFA6: D5        .byte $D5   ; 
- - - - - - 0x017FB7 05:BFA7: 05        .byte $05   ; 
- - - - - - 0x017FB8 05:BFA8: F1        .byte $F1   ; 
- - - - - - 0x017FB9 05:BFA9: 05        .byte $05   ; 
- - - - - - 0x017FBA 05:BFAA: 0D        .byte $0D   ; 
- - - - - - 0x017FBB 05:BFAB: 06        .byte $06   ; 
- - - - - - 0x017FBC 05:BFAC: 29        .byte $29   ; 
- - - - - - 0x017FBD 05:BFAD: 06        .byte $06   ; 
- D 1 - - - 0x017FBE 05:BFAE: 45        .byte $45   ; 
- D 1 - - - 0x017FBF 05:BFAF: 06        .byte $06   ; 
- - - - - - 0x017FC0 05:BFB0: 61        .byte $61   ; 
- - - - - - 0x017FC1 05:BFB1: 06        .byte $06   ; 
- - - - - - 0x017FC2 05:BFB2: 0D        .byte $0D   ; 
- - - - - - 0x017FC3 05:BFB3: 06        .byte $06   ; 
- - - - - - 0x017FC4 05:BFB4: 7D        .byte $7D   ; 
- - - - - - 0x017FC5 05:BFB5: 06        .byte $06   ; 
- - - - - - 0x017FC6 05:BFB6: 99        .byte $99   ; 
- - - - - - 0x017FC7 05:BFB7: 06        .byte $06   ; 
- - - - - - 0x017FC8 05:BFB8: B5        .byte $B5   ; 
- - - - - - 0x017FC9 05:BFB9: 06        .byte $06   ; 
- - - - - - 0x017FCA 05:BFBA: 0D        .byte $0D   ; 
- - - - - - 0x017FCB 05:BFBB: 06        .byte $06   ; 
- - - - - - 0x017FCC 05:BFBC: D1        .byte $D1   ; 
- - - - - - 0x017FCD 05:BFBD: 06        .byte $06   ; 
- - - - - - 0x017FCE 05:BFBE: ED        .byte $ED   ; 
- - - - - - 0x017FCF 05:BFBF: 06        .byte $06   ; 
- - - - - - 0x017FD0 05:BFC0: 09        .byte $09   ; 
- - - - - - 0x017FD1 05:BFC1: 07        .byte $07   ; 
- - - - - - 0x017FD2 05:BFC2: 0D        .byte $0D   ; 
- - - - - - 0x017FD3 05:BFC3: 06        .byte $06   ; 
- - - - - - 0x017FD4 05:BFC4: 25        .byte $25   ; 
- - - - - - 0x017FD5 05:BFC5: 07        .byte $07   ; 
- - - - - - 0x017FD6 05:BFC6: 41        .byte $41   ; 
- - - - - - 0x017FD7 05:BFC7: 07        .byte $07   ; 
- - - - - - 0x017FD8 05:BFC8: 5D        .byte $5D   ; 
- - - - - - 0x017FD9 05:BFC9: 07        .byte $07   ; 



.segment "BANK_05_ID"
- D 1 - - - 0x01800F 05:BFFF: 05        .byte con_prg_bank + $05   ; 



