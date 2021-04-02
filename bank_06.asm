.segment "BANK_06"
.include "copy_bank_ram.inc"
.include "copy_bank_val.inc"
; 0x018010-0x01C00F



.export loc_0x018010
.export loc_0x018013
.export loc_0x018016
.export loc_0x018019
.export loc_0x01801C
.export loc_0x01801F
.export loc_0x018022
.export loc_0x018025
.export loc_0x018028
.export loc_0x01802B
.export loc_0x01802E
.export loc_0x018031
.export loc_0x018034
.export loc_0x018037
.export loc_0x01803A
.export sub_0x01BD7A
.export sub_0x01BE52
.export sub_0x01BEDC



; не перемещать начальные прыжки, они должны быть в пределах 8000-80FF
loc_0x018010:
C D 0 J - - 0x018010 06:8000: 4C 95 9B  JMP loc_9B95

loc_0x018013:
C - - J - - 0x018013 06:8003: 4C 34 9B  JMP loc_9B34

loc_0x018016:
C - - J - - 0x018016 06:8006: 4C C9 9C  JMP loc_9CC9_очистить_скорости_объекта

loc_0x018019:
C - - J - - 0x018019 06:8009: 4C 29 9D  JMP loc_9D29

loc_0x01801C:
C - - J - - 0x01801C 06:800C: 4C E4 9C  JMP loc_9CE4

loc_0x01801F:
C - - J - - 0x01801F 06:800F: 4C 19 9D  JMP loc_9D19

loc_0x018022:
C - - J - - 0x018022 06:8012: 4C DF BD  JMP loc_BDDF

loc_0x018025:
C - - J - - 0x018025 06:8015: 4C FC BD  JMP loc_BDFC

loc_0x018028:
C - - J - - 0x018028 06:8018: 4C 67 98  JMP loc_9867_начальная_X_Y_скорость_мяча

loc_0x01802B:
C - - J - - 0x01802B 06:801B: 4C E8 99  JMP loc_99E8_вычислить_скорость_движения_по_углу

loc_0x01802E:
C - - J - - 0x01802E 06:801E: 4C 77 9A  JMP loc_9A77

loc_0x018031:
C - - J - - 0x018031 06:8021: 4C 5D 9B  JMP loc_9B5D_скорость_Z_и_гравитация

loc_0x018034:
C - - J - - 0x018034 06:8024: 4C DA 9F  JMP loc_9FDA

loc_0x018037:
- - - - - - 0x018037 06:8027: 4C 14 AA  JMP loc_AA14

loc_0x01803A:
- - - - - - 0x01803A 06:802A: 4C C3 AA  JMP loc_AAC3



sub_802D_обработка_движения_игрока:
C - - - - - 0x01803D 06:802D: BD 59 04  LDA ram_movement_id_player,X
C - - - - - 0x018040 06:8030: 0A        ASL
C - - - - - 0x018041 06:8031: A8        TAY
C - - - - - 0x018042 06:8032: B9 3F 80  LDA tbl_803F,Y
C - - - - - 0x018045 06:8035: 85 2C     STA ram_002C
C - - - - - 0x018047 06:8037: B9 40 80  LDA tbl_803F + 1,Y
C - - - - - 0x01804A 06:803A: 85 2D     STA ram_002D
C - - - - - 0x01804C 06:803C: 6C 2C 00  JMP (ram_002C)

tbl_803F:
- D 0 - - - 0x01804F 06:803F: F9 80     .word _общий_RTS    ; 00
- D 0 - - - 0x018051 06:8041: FA 80     .word ofs_80FA_01
- D 0 - - - 0x018053 06:8043: A7 81     .word ofs_81A7_02
- D 0 - - - 0x018055 06:8045: 15 82     .word ofs_8215_03
- D 0 - - - 0x018057 06:8047: 00 82     .word ofs_8200_04
- D 0 - - - 0x018059 06:8049: 00 82     .word ofs_8200_05
- D 0 - - - 0x01805B 06:804B: 25 82     .word ofs_8225_06
- D 0 - - - 0x01805D 06:804D: 5F 82     .word ofs_825F_07
- D 0 - - - 0x01805F 06:804F: 7C 82     .word ofs_827C_08
- D 0 - - - 0x018061 06:8051: 96 82     .word ofs_8296_09
- D 0 - - - 0x018063 06:8053: B0 82     .word ofs_82B0_0A
- D 0 - - - 0x018065 06:8055: 10 83     .word ofs_8310_0B
- D 0 - - - 0x018067 06:8057: CA 82     .word ofs_82CA_0C
- D 0 - - - 0x018069 06:8059: 4C 83     .word ofs_834C_0D
- D 0 - - - 0x01806B 06:805B: 7D 83     .word ofs_837D_0E
- D 0 - - - 0x01806D 06:805D: 7F 86     .word ofs_867F_0F
- D 0 - - - 0x01806F 06:805F: 63 83     .word ofs_8363_10
- D 0 - - - 0x018071 06:8061: 7D 83     .word ofs_837D_11
- - - - - - 0x018073 06:8063: CB 84     .word ofs_84CB_12
- - - - - - 0x018075 06:8065: F9 80     .word _общий_RTS    ; 13
- D 0 - - - 0x018077 06:8067: 2E 81     .word ofs_812E_14
- - - - - - 0x018079 06:8069: B0 82     .word ofs_82B0_15
- D 0 - - - 0x01807B 06:806B: 8D 83     .word ofs_838D_16
- - - - - - 0x01807D 06:806D: F9 80     .word _общий_RTS    ; 17
- - - - - - 0x01807F 06:806F: F9 80     .word _общий_RTS    ; 18
- D 0 - - - 0x018081 06:8071: E8 84     .word ofs_84E8_19
- D 0 - - - 0x018083 06:8073: 7F 81     .word ofs_817F_1A
- D 0 - - - 0x018085 06:8075: C1 83     .word ofs_83C1_1B
- D 0 - - - 0x018087 06:8077: DB 83     .word ofs_83DB_1C
- D 0 - - - 0x018089 06:8079: 37 84     .word ofs_8437_1D
- - - - - - 0x01808B 06:807B: F9 80     .word _общий_RTS    ; 1E
- - - - - - 0x01808D 06:807D: F9 80     .word _общий_RTS    ; 1F
- D 0 - - - 0x01808F 06:807F: F3 83     .word ofs_83F3_20
- D 0 - - - 0x018091 06:8081: 4D 84     .word ofs_844D_21
- D 0 - - - 0x018093 06:8083: F5 84     .word ofs_84F5_22
- D 0 - - - 0x018095 06:8085: 3D 85     .word ofs_853D_23
- D 0 - - - 0x018097 06:8087: 71 85     .word ofs_8571_24
- D 0 - - - 0x018099 06:8089: AA 86     .word ofs_86AA_25
- D 0 - - - 0x01809B 06:808B: D6 84     .word ofs_84D6_26
- D 0 - - - 0x01809D 06:808D: 2B 86     .word ofs_862B_27
- D 0 - - - 0x01809F 06:808F: A8 84     .word ofs_84A8_28
- D 0 - - - 0x0180A1 06:8091: A8 84     .word ofs_84A8_29
- D 0 - - - 0x0180A3 06:8093: 51 86     .word ofs_8651_2A
- - - - - - 0x0180A5 06:8095: 9A 86     .word ofs_869A_2B
- - - - - - 0x0180A7 06:8097: F9 80     .word _общий_RTS    ; 2C
- D 0 - - - 0x0180A9 06:8099: BA 81     .word ofs_81BA_2D
- D 0 - - - 0x0180AB 06:809B: EA 81     .word ofs_81EA_2E
- D 0 - - - 0x0180AD 06:809D: DE 85     .word ofs_85DE_2F
- D 0 - - - 0x0180AF 06:809F: 21 87     .word ofs_8721_30
- D 0 - - - 0x0180B1 06:80A1: E1 88     .word ofs_88E1_31
- D 0 - - - 0x0180B3 06:80A3: A7 88     .word ofs_88A7_32
- D 0 - - - 0x0180B5 06:80A5: 0F 89     .word ofs_890F_33
- D 0 - - - 0x0180B7 06:80A7: 0F 89     .word ofs_890F_34
- D 0 - - - 0x0180B9 06:80A9: C5 88     .word ofs_88C5_35
- - - - - - 0x0180BB 06:80AB: C5 88     .word ofs_88C5_36
- D 0 - - - 0x0180BD 06:80AD: 9A 89     .word ofs_899A_37
- D 0 - - - 0x0180BF 06:80AF: 9A 89     .word ofs_899A_38
- D 0 - - - 0x0180C1 06:80B1: C3 89     .word ofs_89C3_39
- D 0 - - - 0x0180C3 06:80B3: C3 89     .word ofs_89C3_3A
- D 0 - - - 0x0180C5 06:80B5: 05 8A     .word ofs_8A05_3B
- D 0 - - - 0x0180C7 06:80B7: FC 87     .word ofs_87FC_3C
- D 0 - - - 0x0180C9 06:80B9: 35 88     .word ofs_8835_3D
- D 0 - - - 0x0180CB 06:80BB: 96 8A     .word ofs_8A96_3E
- D 0 - - - 0x0180CD 06:80BD: 96 8A     .word ofs_8A96_3F
- D 0 - - - 0x0180CF 06:80BF: BE 8A     .word ofs_8ABE_40
- D 0 - - - 0x0180D1 06:80C1: E6 8A     .word ofs_8AE6_41
- D 0 - - - 0x0180D3 06:80C3: 05 8A     .word ofs_8A05_42
- D 0 - - - 0x0180D5 06:80C5: 27 8B     .word ofs_8B27_43
- - - - - - 0x0180D7 06:80C7: 59 8B     .word ofs_8B59_44
- D 0 - - - 0x0180D9 06:80C9: 09 87     .word ofs_8709_45
- D 0 - - - 0x0180DB 06:80CB: A7 88     .word ofs_88A7_46
- D 0 - - - 0x0180DD 06:80CD: 37 8B     .word ofs_8B37_47
- D 0 - - - 0x0180DF 06:80CF: 43 89     .word ofs_8943_48
- D 0 - - - 0x0180E1 06:80D1: 6C 89     .word ofs_896C_49
- D 0 - - - 0x0180E3 06:80D3: 30 89     .word ofs_8930_4A
- D 0 - - - 0x0180E5 06:80D5: 6C 89     .word ofs_896C_4B
- D 0 - - - 0x0180E7 06:80D7: 43 89     .word ofs_8943_4C
- D 0 - - - 0x0180E9 06:80D9: 6C 89     .word ofs_896C_4D
- D 0 - - - 0x0180EB 06:80DB: 59 89     .word ofs_8959_4E
- D 0 - - - 0x0180ED 06:80DD: 6C 89     .word ofs_896C_4F
- D 0 - - - 0x0180EF 06:80DF: 59 89     .word ofs_8959_50
- D 0 - - - 0x0180F1 06:80E1: 30 89     .word ofs_8930_51
- D 0 - - - 0x0180F3 06:80E3: C2 87     .word ofs_87C2_52
- D 0 - - - 0x0180F5 06:80E5: EA 86     .word ofs_86EA_53
- D 0 - - - 0x0180F7 06:80E7: C9 8A     .word ofs_8AC9_54
- - - - - - 0x0180F9 06:80E9: 4E 88     .word ofs_884E_55
- D 0 - - - 0x0180FB 06:80EB: 9F 87     .word ofs_879F_56
- D 0 - - - 0x0180FD 06:80ED: DF 87     .word ofs_87DF_57
- D 0 - - - 0x0180FF 06:80EF: 58 8A     .word ofs_8A58_58
- D 0 - - - 0x018101 06:80F1: FC 87     .word ofs_87FC_59
- D 0 - - - 0x018103 06:80F3: 35 88     .word ofs_8835_5A
- D 0 - - - 0x018105 06:80F5: 40 8A     .word ofs_8A40_5B
- D 0 - - - 0x018107 06:80F7: DF 8A     .word ofs_8ADF_5C



ofs_80FA_01:
C - - J - - 0x01810A 06:80FA: BD 59 04  LDA ram_movement_id_player,X
C - - - - - 0x01810D 06:80FD: 30 06     BMI bra_8105
C - - - - - 0x01810F 06:80FF: 20 27 99  JSR sub_9927_зафиксировать_и_очистить_анимацию_объекта
C - - - - - 0x018112 06:8102: 20 34 9B  JSR sub_9B34
bra_8105:
C - - - - - 0x018115 06:8105: A9 00     LDA #$00
C - - - - - 0x018117 06:8107: 20 F7 A1  JSR sub_A1F7
C - - - - - 0x01811A 06:810A: 20 F8 9C  JSR sub_9CF8
C - - - - - 0x01811D 06:810D: A9 04     LDA #$04
loc_810F:
C D 0 - - - 0x01811F 06:810F: 20 7A 9A  JSR sub_9A7A
C - - - - - 0x018122 06:8112: 20 21 A0  JSR sub_A021
C - - - - - 0x018125 06:8115: 20 CB CD  JSR sub_0x01CDDB
C - - - - - 0x018128 06:8118: 20 95 9B  JSR sub_9B95
C - - - - - 0x01812B 06:811B: 20 9B 9F  JSR sub_9F9B
C - - - - - 0x01812E 06:811E: 20 2F CD  JSR sub_0x01CD3F
C - - - - - 0x018131 06:8121: 20 BA B7  JSR sub_B7BA
C - - - - - 0x018134 06:8124: 20 AC B8  JSR sub_B8AC
C - - - - - 0x018137 06:8127: 20 A7 A5  JSR sub_A5A7_воспроизвести_анимацию
C - - - - - 0x01813A 06:812A: 20 29 9D  JSR sub_9D29
C - - - - - 0x01813D 06:812D: 60        RTS



ofs_812E_14:
C - - J - - 0x01813E 06:812E: BD 59 04  LDA ram_movement_id_player,X
C - - - - - 0x018141 06:8131: 30 03     BMI bra_8136
C - - - - - 0x018143 06:8133: 20 27 99  JSR sub_9927_зафиксировать_и_очистить_анимацию_объекта
bra_8136:
C - - - - - 0x018146 06:8136: BC CA 04  LDY ram_04CA,X
C - - - - - 0x018149 06:8139: 20 72 8C  JSR sub_8C72
C - - - - - 0x01814C 06:813C: 24 5C     BIT ram_flag_gameplay
C - - - - - 0x01814E 06:813E: 70 30     BVS bra_8170
C - - - - - 0x018150 06:8140: B9 59 04  LDA ram_movement_id_player,Y
C - - - - - 0x018153 06:8143: 29 7F     AND #$7F
C - - - - - 0x018155 06:8145: C9 01     CMP #$01
C - - - - - 0x018157 06:8147: F0 2F     BEQ bra_8178
C - - - - - 0x018159 06:8149: C9 21     CMP #$21
C - - - - - 0x01815B 06:814B: F0 2B     BEQ bra_8178
C - - - - - 0x01815D 06:814D: C9 1D     CMP #$1D
C - - - - - 0x01815F 06:814F: F0 27     BEQ bra_8178
C - - - - - 0x018161 06:8151: C9 20     CMP #$20
C - - - - - 0x018163 06:8153: F0 23     BEQ bra_8178
C - - - - - 0x018165 06:8155: C9 0F     CMP #$0F
C - - - - - 0x018167 06:8157: F0 1F     BEQ bra_8178
C - - - - - 0x018169 06:8159: C9 11     CMP #$11
C - - - - - 0x01816B 06:815B: F0 1B     BEQ bra_8178
C - - - - - 0x01816D 06:815D: C9 07     CMP #$07
C - - - - - 0x01816F 06:815F: F0 08     BEQ bra_8169
C - - - - - 0x018171 06:8161: C9 22     CMP #$22
C - - - - - 0x018173 06:8163: F0 04     BEQ bra_8169
C - - - - - 0x018175 06:8165: C9 43     CMP #$43
C - - - - - 0x018177 06:8167: D0 07     BNE bra_8170
bra_8169:
C - - - - - 0x018179 06:8169: A9 47     LDA #$47
C - - - - - 0x01817B 06:816B: 9D 59 04  STA ram_movement_id_player,X
C - - - - - 0x01817E 06:816E: D0 0E     BNE bra_817E_RTS
bra_8170:
C - - - - - 0x018180 06:8170: A9 30     LDA #$30
C - - - - - 0x018182 06:8172: 9D 59 04  STA ram_movement_id_player,X
C - - - - - 0x018185 06:8175: 4C 7E 81  RTS
bra_8178:
C - - - - - 0x018188 06:8178: 20 A7 A5  JSR sub_A5A7_воспроизвести_анимацию
C - - - - - 0x01818B 06:817B: 20 29 9D  JSR sub_9D29
bra_817E_RTS:
C D 0 - - - 0x01818E 06:817E: 60        RTS



ofs_817F_1A:
C - - J - - 0x01818F 06:817F: BD 59 04  LDA ram_movement_id_player,X
C - - - - - 0x018192 06:8182: 30 1C     BMI bra_81A0
C - - - - - 0x018194 06:8184: 20 27 99  JSR sub_9927_зафиксировать_и_очистить_анимацию_объекта
C - - - - - 0x018197 06:8187: 20 34 9B  JSR sub_9B34
C - - - - - 0x01819A 06:818A: A0 00     LDY #$00
C - - - - - 0x01819C 06:818C: BD 27 03  LDA ram_pos_X_hi_player,X
C - - - - - 0x01819F 06:818F: F0 01     BEQ bra_8192
C - - - - - 0x0181A1 06:8191: C8        INY
bra_8192:
C - - - - - 0x0181A2 06:8192: B9 A5 81  LDA tbl_81A5,Y
C - - - - - 0x0181A5 06:8195: 9D A3 04  STA ram_направление_движения,X
C - - - - - 0x0181A8 06:8198: AD AD 03  LDA ram_camera_aim
C - - - - - 0x0181AB 06:819B: 29 7F     AND #$7F
C - - - - - 0x0181AD 06:819D: 8D AD 03  STA ram_camera_aim
bra_81A0:
C - - - - - 0x0181B0 06:81A0: A9 03     LDA #$03
C - - - - - 0x0181B2 06:81A2: 4C 0F 81  JMP loc_810F

tbl_81A5:
- D 0 - - - 0x0181B5 06:81A5: 00        .byte $00   ; 
- D 0 - - - 0x0181B6 06:81A6: 80        .byte $80   ; 



ofs_81A7_02:
C - - J - - 0x0181B7 06:81A7: BD 59 04  LDA ram_movement_id_player,X
C - - - - - 0x0181BA 06:81AA: 30 09     BMI bra_81B5
C - - - - - 0x0181BC 06:81AC: 20 27 99  JSR sub_9927_зафиксировать_и_очистить_анимацию_объекта
C - - - - - 0x0181BF 06:81AF: 20 34 9B  JSR sub_9B34
C - - - - - 0x0181C2 06:81B2: 20 E4 9C  JSR sub_9CE4
bra_81B5:
C - - - - - 0x0181C5 06:81B5: A9 03     LDA #$03
C - - - - - 0x0181C7 06:81B7: 4C 0F 81  JMP loc_810F



ofs_81BA_2D:
C - - J - - 0x0181CA 06:81BA: BD 59 04  LDA ram_movement_id_player,X
C - - - - - 0x0181CD 06:81BD: 30 26     BMI bra_81E5
C - - - - - 0x0181CF 06:81BF: 20 27 99  JSR sub_9927_зафиксировать_и_очистить_анимацию_объекта
C - - - - - 0x0181D2 06:81C2: 20 34 9B  JSR sub_9B34
C - - - - - 0x0181D5 06:81C5: BD A3 04  LDA ram_направление_движения,X
C - - - - - 0x0181D8 06:81C8: 49 80     EOR #$80
C - - - - - 0x0181DA 06:81CA: 09 40     ORA #$40
C - - - - - 0x0181DC 06:81CC: 9D 96 04  STA ram_movement_angle,X
loc_81CF:
C D 0 - - - 0x0181DF 06:81CF: A9 00     LDA #$00
C - - - - - 0x0181E1 06:81D1: 9D F6 03  STA ram_spd_X_hi_player,X
C - - - - - 0x0181E4 06:81D4: 9D E8 03  STA ram_spd_X_lo_player,X
C - - - - - 0x0181E7 06:81D7: 9D 12 04  STA ram_spd_Y_hi_player,X
C - - - - - 0x0181EA 06:81DA: 9D 04 04  STA ram_spd_Y_lo_player,X
C - - - - - 0x0181ED 06:81DD: 20 DA 9F  JSR sub_9FDA
C - - - - - 0x0181F0 06:81E0: A9 06     LDA #$06
C - - - - - 0x0181F2 06:81E2: 20 EB 99  JSR sub_99EB_вычислить_скорость_движения_по_углу
bra_81E5:
C - - - - - 0x0181F5 06:81E5: A9 05     LDA #$05
C - - - - - 0x0181F7 06:81E7: 4C 0F 81  JMP loc_810F



ofs_81EA_2E:
C - - J - - 0x0181FA 06:81EA: BD 59 04  LDA ram_movement_id_player,X
C - - - - - 0x0181FD 06:81ED: 30 F6     BMI bra_81E5
C - - - - - 0x0181FF 06:81EF: 20 27 99  JSR sub_9927_зафиксировать_и_очистить_анимацию_объекта
C - - - - - 0x018202 06:81F2: 20 34 9B  JSR sub_9B34
C - - - - - 0x018205 06:81F5: BD A3 04  LDA ram_направление_движения,X
C - - - - - 0x018208 06:81F8: 09 40     ORA #$40
C - - - - - 0x01820A 06:81FA: 9D 96 04  STA ram_movement_angle,X
C - - - - - 0x01820D 06:81FD: 4C CF 81  JMP loc_81CF



ofs_8200_04:
ofs_8200_05:
C - - J - - 0x018210 06:8200: BD 59 04  LDA ram_movement_id_player,X
C - - - - - 0x018213 06:8203: 30 09     BMI bra_820E
C - - - - - 0x018215 06:8205: 20 27 99  JSR sub_9927_зафиксировать_и_очистить_анимацию_объекта
C - - - - - 0x018218 06:8208: 20 DA 9F  JSR sub_9FDA
C - - - - - 0x01821B 06:820B: 20 34 9B  JSR sub_9B34
bra_820E:
C - - - - - 0x01821E 06:820E: A9 06     LDA #$06
C - - - - - 0x018220 06:8210: 4C 0F 81  JMP loc_810F



ofs_8215_03:
C - - J - - 0x018225 06:8215: BD 59 04  LDA ram_movement_id_player,X
C - - - - - 0x018228 06:8218: 30 06     BMI bra_8220
C - - - - - 0x01822A 06:821A: 20 27 99  JSR sub_9927_зафиксировать_и_очистить_анимацию_объекта
C - - - - - 0x01822D 06:821D: 20 34 9B  JSR sub_9B34
bra_8220:
C - - - - - 0x018230 06:8220: A9 01     LDA #$01
C - - - - - 0x018232 06:8222: 4C 0F 81  JMP loc_810F



ofs_8225_06:
C - - J - - 0x018235 06:8225: BD 59 04  LDA ram_movement_id_player,X
C - - - - - 0x018238 06:8228: 30 0E     BMI bra_8238
C - - - - - 0x01823A 06:822A: 20 27 99  JSR sub_9927_зафиксировать_и_очистить_анимацию_объекта
C - - - - - 0x01823D 06:822D: 20 C9 9C  JSR sub_9CC9_очистить_скорости_объекта
C - - - - - 0x018240 06:8230: 20 DA 9F  JSR sub_9FDA
C - - - - - 0x018243 06:8233: A9 46     LDA #con_sfx_unk_46
C - - - - - 0x018245 06:8235: 20 E4 C2  JSR sub_0x01C2F4_play_sound
bra_8238:
C - - - - - 0x018248 06:8238: 20 A7 A5  JSR sub_A5A7_воспроизвести_анимацию
C - - - - - 0x01824B 06:823B: AD 66 04  LDA ram_weather_id
C - - - - - 0x01824E 06:823E: 29 7F     AND #$7F
C - - - - - 0x018250 06:8240: C9 01     CMP #con_weather_lightning
C - - - - - 0x018252 06:8242: F0 12     BEQ bra_8256
C - - - - - 0x018254 06:8244: AD 25 05  LDA ram_timer_electric_ball
C - - - - - 0x018257 06:8247: D0 06     BNE bra_824F
C - - - - - 0x018259 06:8249: 20 6C 8B  JSR sub_8B6C_вычислить_следующий_номер_движения
C - - - - - 0x01825C 06:824C: 4C 5B 82  JMP loc_825B
bra_824F:
C - - - - - 0x01825F 06:824F: AD 00 03  LDA ram_frame_cnt
C - - - - - 0x018262 06:8252: 29 01     AND #$01
C - - - - - 0x018264 06:8254: F0 05     BEQ bra_825B
bra_8256:
C - - - - - 0x018266 06:8256: A9 24     LDA #$24
C - - - - - 0x018268 06:8258: 9D 74 00  STA ram_animation_id_player,X
bra_825B:
loc_825B:
C D 0 - - - 0x01826B 06:825B: 20 29 9D  JSR sub_9D29
C - - - - - 0x01826E 06:825E: 60        RTS



ofs_825F_07:
C - - J - - 0x01826F 06:825F: BD 59 04  LDA ram_movement_id_player,X
C - - - - - 0x018272 06:8262: 30 13     BMI bra_8277
C - - - - - 0x018274 06:8264: 20 8B 8C  JSR sub_8C8B
C - - - - - 0x018277 06:8267: 20 27 99  JSR sub_9927_зафиксировать_и_очистить_анимацию_объекта
C - - - - - 0x01827A 06:826A: A0 01     LDY #$01
C - - - - - 0x01827C 06:826C: A9 02     LDA #$02
C - - - - - 0x01827E 06:826E: 20 F7 A1  JSR sub_A1F7
C - - - - - 0x018281 06:8271: 20 0C A0  JSR sub_A00C
C - - - - - 0x018284 06:8274: 20 34 9B  JSR sub_9B34
bra_8277:
C - - - - - 0x018287 06:8277: A9 03     LDA #$03
C - - - - - 0x018289 06:8279: 4C 0F 81  JMP loc_810F



ofs_827C_08:
C - - J - - 0x01828C 06:827C: BD 59 04  LDA ram_movement_id_player,X
C - - - - - 0x01828F 06:827F: 30 10     BMI bra_8291
C - - - - - 0x018291 06:8281: 20 27 99  JSR sub_9927_зафиксировать_и_очистить_анимацию_объекта
C - - - - - 0x018294 06:8284: A0 01     LDY #$01
C - - - - - 0x018296 06:8286: A9 02     LDA #$02
C - - - - - 0x018298 06:8288: 20 F7 A1  JSR sub_A1F7
C - - - - - 0x01829B 06:828B: 20 47 8C  JSR sub_8C47
C - - - - - 0x01829E 06:828E: 20 34 9B  JSR sub_9B34
bra_8291:
C - - - - - 0x0182A1 06:8291: A9 03     LDA #$03
C - - - - - 0x0182A3 06:8293: 4C 0F 81  JMP loc_810F



ofs_8296_09:
C - - J - - 0x0182A6 06:8296: BD 59 04  LDA ram_movement_id_player,X
C - - - - - 0x0182A9 06:8299: 30 10     BMI bra_82AB
C - - - - - 0x0182AB 06:829B: 20 27 99  JSR sub_9927_зафиксировать_и_очистить_анимацию_объекта
C - - - - - 0x0182AE 06:829E: A0 00     LDY #$00
C - - - - - 0x0182B0 06:82A0: A9 02     LDA #$02
C - - - - - 0x0182B2 06:82A2: 20 F7 A1  JSR sub_A1F7
C - - - - - 0x0182B5 06:82A5: 20 0C A0  JSR sub_A00C
C - - - - - 0x0182B8 06:82A8: 20 34 9B  JSR sub_9B34
bra_82AB:
C - - - - - 0x0182BB 06:82AB: A9 03     LDA #$03
C - - - - - 0x0182BD 06:82AD: 4C 0F 81  JMP loc_810F



ofs_82B0_0A:
ofs_82B0_15:
C - - J - - 0x0182C0 06:82B0: BD 59 04  LDA ram_movement_id_player,X
C - - - - - 0x0182C3 06:82B3: 30 10     BMI bra_82C5
C - - - - - 0x0182C5 06:82B5: 20 27 99  JSR sub_9927_зафиксировать_и_очистить_анимацию_объекта
C - - - - - 0x0182C8 06:82B8: A0 00     LDY #$00
C - - - - - 0x0182CA 06:82BA: A9 02     LDA #$02
C - - - - - 0x0182CC 06:82BC: 20 F7 A1  JSR sub_A1F7
C - - - - - 0x0182CF 06:82BF: 20 47 8C  JSR sub_8C47
C - - - - - 0x0182D2 06:82C2: 20 34 9B  JSR sub_9B34
bra_82C5:
C - - - - - 0x0182D5 06:82C5: A9 03     LDA #$03
C - - - - - 0x0182D7 06:82C7: 4C 0F 81  JMP loc_810F



ofs_82CA_0C:
C - - J - - 0x0182DA 06:82CA: BD 59 04  LDA ram_movement_id_player,X
C - - - - - 0x0182DD 06:82CD: 30 3C     BMI bra_830B
C - - - - - 0x0182DF 06:82CF: 20 27 99  JSR sub_9927_зафиксировать_и_очистить_анимацию_объекта
C - - - - - 0x0182E2 06:82D2: A0 00     LDY #$00
C - - - - - 0x0182E4 06:82D4: A9 02     LDA #$02
C - - - - - 0x0182E6 06:82D6: 20 F7 A1  JSR sub_A1F7
C - - - - - 0x0182E9 06:82D9: 20 34 9B  JSR sub_9B34
C - - - - - 0x0182EC 06:82DC: AD C9 04  LDA ram_timer_action_ball
C - - - - - 0x0182EF 06:82DF: F0 18     BEQ bra_82F9
C - - - - - 0x0182F1 06:82E1: AD 02 04  LDA ram_spd_X_hi_ball
C - - - - - 0x0182F4 06:82E4: 9D F6 03  STA ram_spd_X_hi_player,X
C - - - - - 0x0182F7 06:82E7: AD F4 03  LDA ram_spd_X_lo_ball
C - - - - - 0x0182FA 06:82EA: 9D E8 03  STA ram_spd_X_lo_player,X
C - - - - - 0x0182FD 06:82ED: AD 1E 04  LDA ram_spd_Y_hi_ball
C - - - - - 0x018300 06:82F0: 9D 12 04  STA ram_spd_Y_hi_player,X
C - - - - - 0x018303 06:82F3: AD 10 04  LDA ram_spd_Y_lo_ball
C - - - - - 0x018306 06:82F6: 9D 04 04  STA ram_spd_Y_lo_player,X
bra_82F9:
C - - - - - 0x018309 06:82F9: A5 57     LDA ram_option_mode_difficulty
C - - - - - 0x01830B 06:82FB: 29 20     AND #con_gm_penalty
C - - - - - 0x01830D 06:82FD: F0 04     BEQ bra_8303_не_пенальти
C - - - - - 0x01830F 06:82FF: A9 80     LDA #$80
C - - - - - 0x018311 06:8301: D0 05     BNE bra_8308
bra_8303_не_пенальти:
C - - - - - 0x018313 06:8303: 8A        TXA
C - - - - - 0x018314 06:8304: 6A        ROR
C - - - - - 0x018315 06:8305: 6A        ROR
C - - - - - 0x018316 06:8306: 29 80     AND #$80
bra_8308:
C - - - - - 0x018318 06:8308: 9D A3 04  STA ram_направление_движения,X
bra_830B:
C - - - - - 0x01831B 06:830B: A9 03     LDA #$03
C - - - - - 0x01831D 06:830D: 4C 0F 81  JMP loc_810F



ofs_8310_0B:
C - - J - - 0x018320 06:8310: BD 59 04  LDA ram_movement_id_player,X
C - - - - - 0x018323 06:8313: 30 0A     BMI bra_831F
C - - - - - 0x018325 06:8315: 20 27 99  JSR sub_9927_зафиксировать_и_очистить_анимацию_объекта
C - - - - - 0x018328 06:8318: A0 00     LDY #$00
C - - - - - 0x01832A 06:831A: A9 02     LDA #$02
C - - - - - 0x01832C 06:831C: 20 F7 A1  JSR sub_A1F7
bra_831F:
C - - - - - 0x01832F 06:831F: A9 03     LDA #$03
C - - - - - 0x018331 06:8321: 20 7A 9A  JSR sub_9A7A
C - - - - - 0x018334 06:8324: 20 21 A0  JSR sub_A021
C - - - - - 0x018337 06:8327: 20 CB CD  JSR sub_0x01CDDB
C - - - - - 0x01833A 06:832A: 20 95 9B  JSR sub_9B95
C - - - - - 0x01833D 06:832D: 20 9B 9F  JSR sub_9F9B
C - - - - - 0x018340 06:8330: 20 2F CD  JSR sub_0x01CD3F
C - - - - - 0x018343 06:8333: 20 BA B7  JSR sub_B7BA
C - - - - - 0x018346 06:8336: 20 AC B8  JSR sub_B8AC
C - - - - - 0x018349 06:8339: 20 A7 A5  JSR sub_A5A7_воспроизвести_анимацию
C - - - - - 0x01834C 06:833C: 20 29 9D  JSR sub_9D29
C - - - - - 0x01834F 06:833F: AD 65 04  LDA ram_movement_id_ball
C - - - - - 0x018352 06:8342: 29 7F     AND #$7F
C - - - - - 0x018354 06:8344: C9 09     CMP #$09
C - - - - - 0x018356 06:8346: F0 03     BEQ bra_834B_RTS
C - - - - - 0x018358 06:8348: 20 6C 8B  JSR sub_8B6C_вычислить_следующий_номер_движения
bra_834B_RTS:
C - - - - - 0x01835B 06:834B: 60        RTS



ofs_834C_0D:
C - - J - - 0x01835C 06:834C: BD 59 04  LDA ram_movement_id_player,X
C - - - - - 0x01835F 06:834F: 30 0A     BMI bra_835B
C - - - - - 0x018361 06:8351: 20 27 99  JSR sub_9927_зафиксировать_и_очистить_анимацию_объекта
C - - - - - 0x018364 06:8354: A0 02     LDY #$02
C - - - - - 0x018366 06:8356: A9 02     LDA #$02
C - - - - - 0x018368 06:8358: 20 F7 A1  JSR sub_A1F7
bra_835B:
C - - - - - 0x01836B 06:835B: 20 34 9B  JSR sub_9B34
C - - - - - 0x01836E 06:835E: A9 03     LDA #$03
C - - - - - 0x018370 06:8360: 4C 0F 81  JMP loc_810F



ofs_8363_10:
C - - J - - 0x018373 06:8363: BD 59 04  LDA ram_movement_id_player,X
C - - - - - 0x018376 06:8366: 30 10     BMI bra_8378
C - - - - - 0x018378 06:8368: 20 27 99  JSR sub_9927_зафиксировать_и_очистить_анимацию_объекта
C - - - - - 0x01837B 06:836B: A9 00     LDA #$00
C - - - - - 0x01837D 06:836D: 20 F7 A1  JSR sub_A1F7
C - - - - - 0x018380 06:8370: 20 34 9B  JSR sub_9B34
C - - - - - 0x018383 06:8373: A9 3B     LDA #con_sfx_elbow_tackle
C - - - - - 0x018385 06:8375: 20 E4 C2  JSR sub_0x01C2F4_play_sound
bra_8378:
C - - - - - 0x018388 06:8378: A9 03     LDA #$03
C - - - - - 0x01838A 06:837A: 4C 0F 81  JMP loc_810F



ofs_837D_0E:
ofs_837D_11:
C - - J - - 0x01838D 06:837D: BD 59 04  LDA ram_movement_id_player,X
C - - - - - 0x018390 06:8380: 30 06     BMI bra_8388
C - - - - - 0x018392 06:8382: 20 27 99  JSR sub_9927_зафиксировать_и_очистить_анимацию_объекта
C - - - - - 0x018395 06:8385: 20 34 9B  JSR sub_9B34
bra_8388:
C - - - - - 0x018398 06:8388: A9 03     LDA #$03
C - - - - - 0x01839A 06:838A: 4C 0F 81  JMP loc_810F



ofs_838D_16:
C - - J - - 0x01839D 06:838D: BD 59 04  LDA ram_movement_id_player,X
C - - - - - 0x0183A0 06:8390: 30 28     BMI bra_83BA
C - - - - - 0x0183A2 06:8392: 20 27 99  JSR sub_9927_зафиксировать_и_очистить_анимацию_объекта
C - - - - - 0x0183A5 06:8395: 20 34 9B  JSR sub_9B34
C - - - - - 0x0183A8 06:8398: BD 27 03  LDA ram_pos_X_hi_player,X
C - - - - - 0x0183AB 06:839B: 29 02     AND #$02
C - - - - - 0x0183AD 06:839D: 6A        ROR
C - - - - - 0x0183AE 06:839E: 6A        ROR
C - - - - - 0x0183AF 06:839F: 6A        ROR
C - - - - - 0x0183B0 06:83A0: 9D A3 04  STA ram_направление_движения,X
C - - - - - 0x0183B3 06:83A3: BD 60 03  LDA ram_pos_Y_hi_player,X
C - - - - - 0x0183B6 06:83A6: 29 01     AND #$01
C - - - - - 0x0183B8 06:83A8: 9D 6C 04  STA ram_animation_sub_id_player,X
C - - - - - 0x0183BB 06:83AB: A8        TAY
C - - - - - 0x0183BC 06:83AC: B9 BF 83  LDA tbl_83BF,Y
C - - - - - 0x0183BF 06:83AF: 85 1C     STA ram_001C
C - - - - - 0x0183C1 06:83B1: 8A        TXA
C - - - - - 0x0183C2 06:83B2: 29 01     AND #$01
C - - - - - 0x0183C4 06:83B4: A8        TAY
C - - - - - 0x0183C5 06:83B5: A5 1C     LDA ram_001C
C - - - - - 0x0183C7 06:83B7: 99 7E 06  STA ram_067E,Y
bra_83BA:
C - - - - - 0x0183CA 06:83BA: A9 03     LDA #$03
C - - - - - 0x0183CC 06:83BC: 4C 0F 81  JMP loc_810F

tbl_83BF:
- - - - - - 0x0183CF 06:83BF: 80        .byte $80   ; 
- D 0 - - - 0x0183D0 06:83C0: 00        .byte $00   ; 



ofs_83C1_1B:
C - - J - - 0x0183D1 06:83C1: BD 59 04  LDA ram_movement_id_player,X
C - - - - - 0x0183D4 06:83C4: 30 03     BMI bra_83C9
C - - - - - 0x0183D6 06:83C6: 20 27 99  JSR sub_9927_зафиксировать_и_очистить_анимацию_объекта
bra_83C9:
C - - - - - 0x0183D9 06:83C9: BD A3 04  LDA ram_направление_движения,X
C - - - - - 0x0183DC 06:83CC: 49 80     EOR #$80
C - - - - - 0x0183DE 06:83CE: 09 40     ORA #$40
C - - - - - 0x0183E0 06:83D0: 9D 96 04  STA ram_movement_angle,X
C - - - - - 0x0183E3 06:83D3: A9 02     LDA #$02
C - - - - - 0x0183E5 06:83D5: 20 EB 99  JSR sub_99EB_вычислить_скорость_движения_по_углу
C - - - - - 0x0183E8 06:83D8: 4C 09 84  JMP loc_8409



ofs_83DB_1C:
C - - J - - 0x0183EB 06:83DB: BD 59 04  LDA ram_movement_id_player,X
C - - - - - 0x0183EE 06:83DE: 30 03     BMI bra_83E3
C - - - - - 0x0183F0 06:83E0: 20 27 99  JSR sub_9927_зафиксировать_и_очистить_анимацию_объекта
bra_83E3:
C - - - - - 0x0183F3 06:83E3: BD A3 04  LDA ram_направление_движения,X
C - - - - - 0x0183F6 06:83E6: 09 40     ORA #$40
C - - - - - 0x0183F8 06:83E8: 9D 96 04  STA ram_movement_angle,X
C - - - - - 0x0183FB 06:83EB: A9 04     LDA #$04
C - - - - - 0x0183FD 06:83ED: 20 EB 99  JSR sub_99EB_вычислить_скорость_движения_по_углу
C - - - - - 0x018400 06:83F0: 4C 09 84  JMP loc_8409



ofs_83F3_20:
C - - J - - 0x018403 06:83F3: BD 59 04  LDA ram_movement_id_player,X
C - - - - - 0x018406 06:83F6: 30 03     BMI bra_83FB
C - - - - - 0x018408 06:83F8: 20 27 99  JSR sub_9927_зафиксировать_и_очистить_анимацию_объекта
bra_83FB:
C - - - - - 0x01840B 06:83FB: A9 00     LDA #$00
C - - - - - 0x01840D 06:83FD: 20 F7 A1  JSR sub_A1F7
C - - - - - 0x018410 06:8400: 20 19 9D  JSR sub_9D19
C - - - - - 0x018413 06:8403: 20 4C 99  JSR sub_994C
C - - - - - 0x018416 06:8406: 20 F8 9C  JSR sub_9CF8
loc_8409:
C D 0 - - - 0x018419 06:8409: 20 21 A0  JSR sub_A021
C - - - - - 0x01841C 06:840C: 20 CB CD  JSR sub_0x01CDDB
C - - - - - 0x01841F 06:840F: 20 95 9B  JSR sub_9B95
C - - - - - 0x018422 06:8412: 20 9B 9F  JSR sub_9F9B
C - - - - - 0x018425 06:8415: 20 2F CD  JSR sub_0x01CD3F
C - - - - - 0x018428 06:8418: 20 BA B7  JSR sub_B7BA
C - - - - - 0x01842B 06:841B: A5 1C     LDA ram_001C
C - - - - - 0x01842D 06:841D: F0 0E     BEQ bra_842D
C - - - - - 0x01842F 06:841F: BD 59 04  LDA ram_movement_id_player,X
C - - - - - 0x018432 06:8422: 29 7F     AND #$7F
C - - - - - 0x018434 06:8424: C9 21     CMP #$21
C - - - - - 0x018436 06:8426: D0 05     BNE bra_842D
C - - - - - 0x018438 06:8428: A9 01     LDA #$01
C - - - - - 0x01843A 06:842A: 9D 59 04  STA ram_movement_id_player,X
bra_842D:
C - - - - - 0x01843D 06:842D: 20 AC B8  JSR sub_B8AC
C - - - - - 0x018440 06:8430: 20 A7 A5  JSR sub_A5A7_воспроизвести_анимацию
C - - - - - 0x018443 06:8433: 20 29 9D  JSR sub_9D29
C D 0 - - - 0x018446 06:8436: 60        RTS



ofs_8437_1D:
C - - J - - 0x018447 06:8437: BD 59 04  LDA ram_movement_id_player,X
C - - - - - 0x01844A 06:843A: 30 03     BMI bra_843F
C - - - - - 0x01844C 06:843C: 20 27 99  JSR sub_9927_зафиксировать_и_очистить_анимацию_объекта
bra_843F:
C - - - - - 0x01844F 06:843F: 20 E4 9C  JSR sub_9CE4
C - - - - - 0x018452 06:8442: 20 19 9D  JSR sub_9D19
C - - - - - 0x018455 06:8445: A9 05     LDA #$05
C - - - - - 0x018457 06:8447: 20 EB 99  JSR sub_99EB_вычислить_скорость_движения_по_углу
C - - - - - 0x01845A 06:844A: 4C 09 84  JMP loc_8409



ofs_844D_21:
C - - J - - 0x01845D 06:844D: BD 59 04  LDA ram_movement_id_player,X
C - - - - - 0x018460 06:8450: 30 06     BMI bra_8458
C - - - - - 0x018462 06:8452: 20 27 99  JSR sub_9927_зафиксировать_и_очистить_анимацию_объекта
C - - - - - 0x018465 06:8455: 20 E4 9C  JSR sub_9CE4
bra_8458:
C - - - - - 0x018468 06:8458: A9 00     LDA #$00
C - - - - - 0x01846A 06:845A: 20 F7 A1  JSR sub_A1F7
C - - - - - 0x01846D 06:845D: BD B0 04  LDA ram_смена_угла_движения,X
C - - - - - 0x018470 06:8460: C9 FF     CMP #$FF
C - - - - - 0x018472 06:8462: D0 0B     BNE bra_846F
C - - - - - 0x018474 06:8464: BD A3 04  LDA ram_направление_движения,X
C - - - - - 0x018477 06:8467: 09 40     ORA #$40
C - - - - - 0x018479 06:8469: 9D 96 04  STA ram_movement_angle,X
C - - - - - 0x01847C 06:846C: 4C 82 84  JMP loc_8482
bra_846F:
C - - - - - 0x01847F 06:846F: BD A3 04  LDA ram_направление_движения,X
C - - - - - 0x018482 06:8472: 0A        ASL
C - - - - - 0x018483 06:8473: BD B0 04  LDA ram_смена_угла_движения,X
C - - - - - 0x018486 06:8476: 6A        ROR
C - - - - - 0x018487 06:8477: 4A        LSR
C - - - - - 0x018488 06:8478: 4A        LSR
C - - - - - 0x018489 06:8479: 4A        LSR
C - - - - - 0x01848A 06:847A: 4A        LSR
C - - - - - 0x01848B 06:847B: A8        TAY
C - - - - - 0x01848C 06:847C: B9 98 84  LDA tbl_8498,Y
C - - - - - 0x01848F 06:847F: 9D 96 04  STA ram_movement_angle,X
loc_8482:
C D 0 - - - 0x018492 06:8482: 5D A3 04  EOR ram_направление_движения,X
C - - - - - 0x018495 06:8485: 10 08     BPL bra_848F
C - - - - - 0x018497 06:8487: A9 0F     LDA #$0F
C - - - - - 0x018499 06:8489: 9D 59 04  STA ram_movement_id_player,X
C - - - - - 0x01849C 06:848C: 4C 36 84  RTS
bra_848F:
C - - - - - 0x01849F 06:848F: 20 4C 99  JSR sub_994C
C - - - - - 0x0184A2 06:8492: 20 E4 9C  JSR sub_9CE4
C - - - - - 0x0184A5 06:8495: 4C 09 84  JMP loc_8409

tbl_8498:
- D 0 - - - 0x0184A8 06:8498: 20        .byte $20   ; 
- D 0 - - - 0x0184A9 06:8499: 20        .byte $20   ; 
- D 0 - - - 0x0184AA 06:849A: 40        .byte $40   ; 
- D 0 - - - 0x0184AB 06:849B: 60        .byte $60   ; 
- D 0 - - - 0x0184AC 06:849C: 60        .byte $60   ; 
- D 0 - - - 0x0184AD 06:849D: A0        .byte $A0   ; 
- D 0 - - - 0x0184AE 06:849E: C0        .byte $C0   ; 
- D 0 - - - 0x0184AF 06:849F: E0        .byte $E0   ; 
- D 0 - - - 0x0184B0 06:84A0: E0        .byte $E0   ; 
- D 0 - - - 0x0184B1 06:84A1: 20        .byte $20   ; 
- D 0 - - - 0x0184B2 06:84A2: 40        .byte $40   ; 
- D 0 - - - 0x0184B3 06:84A3: 60        .byte $60   ; 
- D 0 - - - 0x0184B4 06:84A4: A0        .byte $A0   ; 
- D 0 - - - 0x0184B5 06:84A5: A0        .byte $A0   ; 
- D 0 - - - 0x0184B6 06:84A6: C0        .byte $C0   ; 
- D 0 - - - 0x0184B7 06:84A7: E0        .byte $E0   ; 



ofs_84A8_28:
ofs_84A8_29:
C - - J - - 0x0184B8 06:84A8: BD 59 04  LDA ram_movement_id_player,X
C - - - - - 0x0184BB 06:84AB: 30 16     BMI bra_84C3
C - - - - - 0x0184BD 06:84AD: 20 27 99  JSR sub_9927_зафиксировать_и_очистить_анимацию_объекта
C - - - - - 0x0184C0 06:84B0: A9 01     LDA #$01
C - - - - - 0x0184C2 06:84B2: 20 F7 A1  JSR sub_A1F7
C - - - - - 0x0184C5 06:84B5: BC 6C 04  LDY ram_animation_sub_id_player,X
C - - - - - 0x0184C8 06:84B8: B9 BC 8A  LDA tbl_8ABC,Y
C - - - - - 0x0184CB 06:84BB: 9D 96 04  STA ram_movement_angle,X
C - - - - - 0x0184CE 06:84BE: A9 07     LDA #$07
C - - - - - 0x0184D0 06:84C0: 20 EB 99  JSR sub_99EB_вычислить_скорость_движения_по_углу
bra_84C3:
C - - - - - 0x0184D3 06:84C3: A9 01     LDA #$01
C - - - - - 0x0184D5 06:84C5: 20 7A 9A  JSR sub_9A7A
C - - - - - 0x0184D8 06:84C8: 4C 21 85  JMP loc_8521



ofs_84CB_12:
- - - - - - 0x0184DB 06:84CB: BD 59 04  LDA ram_movement_id_player,X
- - - - - - 0x0184DE 06:84CE: 30 03     BMI bra_84D3
- - - - - - 0x0184E0 06:84D0: 20 27 99  JSR sub_9927_зафиксировать_и_очистить_анимацию_объекта
bra_84D3:
- - - - - - 0x0184E3 06:84D3: 4C 09 84  JMP loc_8409



ofs_84D6_26:
C - - J - - 0x0184E6 06:84D6: BD 59 04  LDA ram_movement_id_player,X
C - - - - - 0x0184E9 06:84D9: 30 0A     BMI bra_84E5
C - - - - - 0x0184EB 06:84DB: 20 27 99  JSR sub_9927_зафиксировать_и_очистить_анимацию_объекта
C - - - - - 0x0184EE 06:84DE: A0 00     LDY #$00
C - - - - - 0x0184F0 06:84E0: A9 02     LDA #$02
C - - - - - 0x0184F2 06:84E2: 20 F7 A1  JSR sub_A1F7
bra_84E5:
C - - - - - 0x0184F5 06:84E5: 4C 09 84  JMP loc_8409



ofs_84E8_19:
C - - J - - 0x0184F8 06:84E8: BD 59 04  LDA ram_movement_id_player,X
C - - - - - 0x0184FB 06:84EB: 30 2F     BMI bra_851C
C - - - - - 0x0184FD 06:84ED: A0 01     LDY #$01
C - - - - - 0x0184FF 06:84EF: 20 3F A0  JSR sub_A03F
C - - - - - 0x018502 06:84F2: 4C 02 85  JMP loc_8502



ofs_84F5_22:
C - - J - - 0x018505 06:84F5: BD 59 04  LDA ram_movement_id_player,X
C - - - - - 0x018508 06:84F8: 30 22     BMI bra_851C
C - - - - - 0x01850A 06:84FA: 20 8B 8C  JSR sub_8C8B
C - - - - - 0x01850D 06:84FD: A0 04     LDY #$04
C - - - - - 0x01850F 06:84FF: 20 3F A0  JSR sub_A03F
loc_8502:
C D 0 - - - 0x018512 06:8502: 20 27 99  JSR sub_9927_зафиксировать_и_очистить_анимацию_объекта
C - - - - - 0x018515 06:8505: A9 3B     LDA #con_sfx_elbow_tackle
C - - - - - 0x018517 06:8507: 20 E4 C2  JSR sub_0x01C2F4_play_sound
C - - - - - 0x01851A 06:850A: BD B0 04  LDA ram_смена_угла_движения,X
C - - - - - 0x01851D 06:850D: C9 FF     CMP #$FF
C - - - - - 0x01851F 06:850F: F0 0B     BEQ bra_851C
C - - - - - 0x018521 06:8511: 20 E4 9C  JSR sub_9CE4
C - - - - - 0x018524 06:8514: 20 19 9D  JSR sub_9D19
C - - - - - 0x018527 06:8517: A9 04     LDA #$04
C - - - - - 0x018529 06:8519: 20 EB 99  JSR sub_99EB_вычислить_скорость_движения_по_углу
bra_851C:
C - - - - - 0x01852C 06:851C: A9 01     LDA #$01
C - - - - - 0x01852E 06:851E: 20 7A 9A  JSR sub_9A7A
loc_8521:
C D 0 - - - 0x018531 06:8521: 20 21 A0  JSR sub_A021
C - - - - - 0x018534 06:8524: 20 CB CD  JSR sub_0x01CDDB
C - - - - - 0x018537 06:8527: 20 95 9B  JSR sub_9B95
C - - - - - 0x01853A 06:852A: 20 2F CD  JSR sub_0x01CD3F
C - - - - - 0x01853D 06:852D: 20 BA B7  JSR sub_B7BA
C - - - - - 0x018540 06:8530: 20 AC B8  JSR sub_B8AC
C - - - - - 0x018543 06:8533: 20 65 9D  JSR sub_9D65
C - - - - - 0x018546 06:8536: 20 A7 A5  JSR sub_A5A7_воспроизвести_анимацию
C - - - - - 0x018549 06:8539: 20 29 9D  JSR sub_9D29
C - - - - - 0x01854C 06:853C: 60        RTS



ofs_853D_23:
C - - J - - 0x01854D 06:853D: BD 59 04  LDA ram_movement_id_player,X
C - - - - - 0x018550 06:8540: 30 24     BMI bra_8566
C - - - - - 0x018552 06:8542: A0 04     LDY #$04
C - - - - - 0x018554 06:8544: 20 3F A0  JSR sub_A03F
C - - - - - 0x018557 06:8547: 20 27 99  JSR sub_9927_зафиксировать_и_очистить_анимацию_объекта
C - - - - - 0x01855A 06:854A: 20 E4 9C  JSR sub_9CE4
C - - - - - 0x01855D 06:854D: A9 3B     LDA #con_sfx_elbow_tackle
C - - - - - 0x01855F 06:854F: 20 E4 C2  JSR sub_0x01C2F4_play_sound
C - - - - - 0x018562 06:8552: BD B0 04  LDA ram_смена_угла_движения,X
C - - - - - 0x018565 06:8555: C9 FF     CMP #$FF
C - - - - - 0x018567 06:8557: D0 05     BNE bra_855E
C - - - - - 0x018569 06:8559: BD A3 04  LDA ram_направление_движения,X
C - - - - - 0x01856C 06:855C: 09 40     ORA #$40
bra_855E:
C - - - - - 0x01856E 06:855E: 9D 96 04  STA ram_movement_angle,X
C - - - - - 0x018571 06:8561: A9 05     LDA #$05
C - - - - - 0x018573 06:8563: 20 EB 99  JSR sub_99EB_вычислить_скорость_движения_по_углу
bra_8566:
C - - - - - 0x018576 06:8566: A9 01     LDA #$01
C - - - - - 0x018578 06:8568: 20 7A 9A  JSR sub_9A7A
C - - - - - 0x01857B 06:856B: 20 49 9B  JSR sub_9B49
C - - - - - 0x01857E 06:856E: 4C 21 85  JMP loc_8521



ofs_8571_24:
C - - J - - 0x018581 06:8571: BD 59 04  LDA ram_movement_id_player,X
C - - - - - 0x018584 06:8574: 30 30     BMI bra_85A6
C - - - - - 0x018586 06:8576: A0 00     LDY #$00
C - - - - - 0x018588 06:8578: 20 3F A0  JSR sub_A03F
C - - - - - 0x01858B 06:857B: 20 27 99  JSR sub_9927_зафиксировать_и_очистить_анимацию_объекта
C - - - - - 0x01858E 06:857E: 20 19 9D  JSR sub_9D19
C - - - - - 0x018591 06:8581: 20 08 86  JSR sub_8608
C - - - - - 0x018594 06:8584: A9 01     LDA #$01
C - - - - - 0x018596 06:8586: 20 F7 A1  JSR sub_A1F7
C - - - - - 0x018599 06:8589: A9 04     LDA #$04
C - - - - - 0x01859B 06:858B: 20 EB 99  JSR sub_99EB_вычислить_скорость_движения_по_углу
C - - - - - 0x01859E 06:858E: 18        CLC
C - - - - - 0x01859F 06:858F: BD 04 04  LDA ram_spd_Y_lo_player,X
C - - - - - 0x0185A2 06:8592: 49 FF     EOR #$FF
C - - - - - 0x0185A4 06:8594: 69 01     ADC #$01
C - - - - - 0x0185A6 06:8596: 9D 04 04  STA ram_spd_Y_lo_player,X
C - - - - - 0x0185A9 06:8599: BD 12 04  LDA ram_spd_Y_hi_player,X
C - - - - - 0x0185AC 06:859C: 49 FF     EOR #$FF
C - - - - - 0x0185AE 06:859E: 69 00     ADC #$00
C - - - - - 0x0185B0 06:85A0: 9D 12 04  STA ram_spd_Y_hi_player,X
C - - - - - 0x0185B3 06:85A3: 4C DB 85  JMP loc_85DB
bra_85A6:
C - - - - - 0x0185B6 06:85A6: BD 87 00  LDA ram_animation_timer_player,X
C - - - - - 0x0185B9 06:85A9: C9 01     CMP #$01
C - - - - - 0x0185BB 06:85AB: D0 2E     BNE bra_85DB
C - - - - - 0x0185BD 06:85AD: BD 94 00  LDA ram_номер_кадра_анимации,X
C - - - - - 0x0185C0 06:85B0: C9 02     CMP #$02
C - - - - - 0x0185C2 06:85B2: F0 1F     BEQ bra_85D3
C - - - - - 0x0185C4 06:85B4: C9 03     CMP #$03
C - - - - - 0x0185C6 06:85B6: D0 23     BNE bra_85DB
C - - - - - 0x0185C8 06:85B8: A9 04     LDA #$04
C - - - - - 0x0185CA 06:85BA: 20 EB 99  JSR sub_99EB_вычислить_скорость_движения_по_углу
C - - - - - 0x0185CD 06:85BD: A0 00     LDY #$00
bra_85BF:
C - - - - - 0x0185CF 06:85BF: 1E 04 04  ASL ram_spd_Y_lo_player,X
C - - - - - 0x0185D2 06:85C2: 3E 12 04  ROL ram_spd_Y_hi_player,X
C - - - - - 0x0185D5 06:85C5: 1E E8 03  ASL ram_spd_X_lo_player,X
C - - - - - 0x0185D8 06:85C8: 3E F6 03  ROL ram_spd_X_hi_player,X
C - - - - - 0x0185DB 06:85CB: C8        INY
C - - - - - 0x0185DC 06:85CC: C0 02     CPY #$02
C - - - - - 0x0185DE 06:85CE: 90 EF     BCC bra_85BF
C - - - - - 0x0185E0 06:85D0: 4C DB 85  JMP loc_85DB
bra_85D3:
C - - - - - 0x0185E3 06:85D3: 20 C9 9C  JSR sub_9CC9_очистить_скорости_объекта
C - - - - - 0x0185E6 06:85D6: A9 3B     LDA #con_sfx_elbow_tackle
C - - - - - 0x0185E8 06:85D8: 20 E4 C2  JSR sub_0x01C2F4_play_sound
bra_85DB:
loc_85DB:
C D 0 - - - 0x0185EB 06:85DB: 4C 21 85  JMP loc_8521



ofs_85DE_2F:
C - - J - - 0x0185EE 06:85DE: BD 59 04  LDA ram_movement_id_player,X
C - - - - - 0x0185F1 06:85E1: 30 22     BMI bra_8605
C - - - - - 0x0185F3 06:85E3: 20 27 99  JSR sub_9927_зафиксировать_и_очистить_анимацию_объекта
C - - - - - 0x0185F6 06:85E6: A9 3C     LDA #con_sfx_spin_normal
C - - - - - 0x0185F8 06:85E8: 20 E4 C2  JSR sub_0x01C2F4_play_sound
C - - - - - 0x0185FB 06:85EB: 20 19 9D  JSR sub_9D19
C - - - - - 0x0185FE 06:85EE: 20 08 86  JSR sub_8608
C - - - - - 0x018601 06:85F1: A9 01     LDA #$01
C - - - - - 0x018603 06:85F3: 20 F7 A1  JSR sub_A1F7
C - - - - - 0x018606 06:85F6: A9 03     LDA #$03
C - - - - - 0x018608 06:85F8: 20 EB 99  JSR sub_99EB_вычислить_скорость_движения_по_углу
C - - - - - 0x01860B 06:85FB: BD 12 04  LDA ram_spd_Y_hi_player,X
C - - - - - 0x01860E 06:85FE: 0A        ASL
C - - - - - 0x01860F 06:85FF: 7E 12 04  ROR ram_spd_Y_hi_player,X
C - - - - - 0x018612 06:8602: 7E 04 04  ROR ram_spd_Y_lo_player,X
bra_8605:
C - - - - - 0x018615 06:8605: 4C 21 85  JMP loc_8521



sub_8608:
C - - - - - 0x018618 06:8608: BD 96 04  LDA ram_movement_angle,X
C - - - - - 0x01861B 06:860B: 4A        LSR
C - - - - - 0x01861C 06:860C: 1D A3 04  ORA ram_направление_движения,X
C - - - - - 0x01861F 06:860F: 4A        LSR
C - - - - - 0x018620 06:8610: 4A        LSR
C - - - - - 0x018621 06:8611: 4A        LSR
C - - - - - 0x018622 06:8612: 4A        LSR
C - - - - - 0x018623 06:8613: A8        TAY
C - - - - - 0x018624 06:8614: B9 1B 86  LDA tbl_861B,Y
C - - - - - 0x018627 06:8617: 9D 96 04  STA ram_movement_angle,X
C - - - - - 0x01862A 06:861A: 60        RTS

tbl_861B:
- D 0 - - - 0x01862B 06:861B: 20        .byte $20   ; 
- - - - - - 0x01862C 06:861C: 20        .byte $20   ; 
- - - - - - 0x01862D 06:861D: 40        .byte $40   ; 
- D 0 - - - 0x01862E 06:861E: 60        .byte $60   ; 
- D 0 - - - 0x01862F 06:861F: 60        .byte $60   ; 
- - - - - - 0x018630 06:8620: 60        .byte $60   ; 
- D 0 - - - 0x018631 06:8621: 40        .byte $40   ; 
- - - - - - 0x018632 06:8622: 20        .byte $20   ; 
- D 0 - - - 0x018633 06:8623: E0        .byte $E0   ; 
- - - - - - 0x018634 06:8624: E0        .byte $E0   ; 
- D 0 - - - 0x018635 06:8625: C0        .byte $C0   ; 
- - - - - - 0x018636 06:8626: A0        .byte $A0   ; 
- D 0 - - - 0x018637 06:8627: A0        .byte $A0   ; 
- D 0 - - - 0x018638 06:8628: A0        .byte $A0   ; 
- - - - - - 0x018639 06:8629: C0        .byte $C0   ; 
- - - - - - 0x01863A 06:862A: E0        .byte $E0   ; 



ofs_862B_27:
C - - J - - 0x01863B 06:862B: BD 59 04  LDA ram_movement_id_player,X
C - - - - - 0x01863E 06:862E: 30 1E     BMI bra_864E
C - - - - - 0x018640 06:8630: 20 27 99  JSR sub_9927_зафиксировать_и_очистить_анимацию_объекта
C - - - - - 0x018643 06:8633: A9 01     LDA #$01
C - - - - - 0x018645 06:8635: 20 F7 A1  JSR sub_A1F7
C - - - - - 0x018648 06:8638: 20 19 9D  JSR sub_9D19
C - - - - - 0x01864B 06:863B: A9 00     LDA #$00
C - - - - - 0x01864D 06:863D: 9D 2E 04  STA ram_spd_Z_hi_player,X
C - - - - - 0x018650 06:8640: 9D 20 04  STA ram_spd_Z_lo_player,X
C - - - - - 0x018653 06:8643: 9D 4A 04  STA ram_gravity_hi_player,X
C - - - - - 0x018656 06:8646: 9D 3C 04  STA ram_gravity_lo_player,X
C - - - - - 0x018659 06:8649: A9 03     LDA #$03
C - - - - - 0x01865B 06:864B: 20 EB 99  JSR sub_99EB_вычислить_скорость_движения_по_углу
bra_864E:
C - - - - - 0x01865E 06:864E: 4C 09 84  JMP loc_8409



ofs_8651_2A:
C - - J - - 0x018661 06:8651: BD 59 04  LDA ram_movement_id_player,X
C - - - - - 0x018664 06:8654: 30 14     BMI bra_866A
C - - - - - 0x018666 06:8656: 20 27 99  JSR sub_9927_зафиксировать_и_очистить_анимацию_объекта
C - - - - - 0x018669 06:8659: 20 19 9D  JSR sub_9D19
C - - - - - 0x01866C 06:865C: A9 00     LDA #$00
C - - - - - 0x01866E 06:865E: 9D 2E 04  STA ram_spd_Z_hi_player,X
C - - - - - 0x018671 06:8661: 9D 20 04  STA ram_spd_Z_lo_player,X
C - - - - - 0x018674 06:8664: 9D 4A 04  STA ram_gravity_hi_player,X
C - - - - - 0x018677 06:8667: 9D 3C 04  STA ram_gravity_lo_player,X
bra_866A:
C - - - - - 0x01867A 06:866A: BD 94 00  LDA ram_номер_кадра_анимации,X
C - - - - - 0x01867D 06:866D: D0 08     BNE bra_8677
C - - - - - 0x01867F 06:866F: A9 01     LDA #$01
C - - - - - 0x018681 06:8671: 20 7A 9A  JSR sub_9A7A
C - - - - - 0x018684 06:8674: 4C 7C 86  JMP loc_867C
bra_8677:
C - - - - - 0x018687 06:8677: A9 04     LDA #$04
C - - - - - 0x018689 06:8679: 20 EB 99  JSR sub_99EB_вычислить_скорость_движения_по_углу
; bzk
loc_867C:
C D 0 - - - 0x01868C 06:867C: 4C 09 84  JMP loc_8409



ofs_867F_0F:
C - - J - - 0x01868F 06:867F: BD 59 04  LDA ram_movement_id_player,X
C - - - - - 0x018692 06:8682: 30 06     BMI bra_868A
C - - - - - 0x018694 06:8684: 20 27 99  JSR sub_9927_зафиксировать_и_очистить_анимацию_объекта
C - - - - - 0x018697 06:8687: 20 34 9B  JSR sub_9B34
bra_868A:
C - - - - - 0x01869A 06:868A: A9 00     LDA #$00
C - - - - - 0x01869C 06:868C: 20 F7 A1  JSR sub_A1F7
C - - - - - 0x01869F 06:868F: A9 02     LDA #$02
C - - - - - 0x0186A1 06:8691: 20 7A 9A  JSR sub_9A7A
C - - - - - 0x0186A4 06:8694: 20 49 9B  JSR sub_9B49
C - - - - - 0x0186A7 06:8697: 4C 09 84  JMP loc_8409



ofs_869A_2B:
- - - - - - 0x0186AA 06:869A: BD 59 04  LDA ram_movement_id_player,X
- - - - - - 0x0186AD 06:869D: 30 03     BMI bra_86A2
- - - - - - 0x0186AF 06:869F: 20 27 99  JSR sub_9927_зафиксировать_и_очистить_анимацию_объекта
bra_86A2:
- - - - - - 0x0186B2 06:86A2: A9 01     LDA #$01
- - - - - - 0x0186B4 06:86A4: 20 7A 9A  JSR sub_9A7A
- - - - - - 0x0186B7 06:86A7: 4C 09 84  JMP loc_8409



ofs_86AA_25:
C - - J - - 0x0186BA 06:86AA: BD 59 04  LDA ram_movement_id_player,X
C - - - - - 0x0186BD 06:86AD: 30 19     BMI bra_86C8
C - - - - - 0x0186BF 06:86AF: 20 27 99  JSR sub_9927_зафиксировать_и_очистить_анимацию_объекта
C - - - - - 0x0186C2 06:86B2: A9 01     LDA #$01
C - - - - - 0x0186C4 06:86B4: 20 F7 A1  JSR sub_A1F7
C - - - - - 0x0186C7 06:86B7: BD A3 04  LDA ram_направление_движения,X
C - - - - - 0x0186CA 06:86BA: 0D E9 86  ORA tbl_86E9
C - - - - - 0x0186CD 06:86BD: 9D 96 04  STA ram_movement_angle,X
C - - - - - 0x0186D0 06:86C0: BD A3 04  LDA ram_направление_движения,X
C - - - - - 0x0186D3 06:86C3: 49 80     EOR #$80
C - - - - - 0x0186D5 06:86C5: 9D A3 04  STA ram_направление_движения,X
bra_86C8:
C - - - - - 0x0186D8 06:86C8: BD 6C 04  LDA ram_animation_sub_id_player,X
C - - - - - 0x0186DB 06:86CB: 0A        ASL
C - - - - - 0x0186DC 06:86CC: A8        TAY
C - - - - - 0x0186DD 06:86CD: BD A3 04  LDA ram_направление_движения,X
C - - - - - 0x0186E0 06:86D0: 30 01     BMI bra_86D3
C - - - - - 0x0186E2 06:86D2: C8        INY
bra_86D3:
C - - - - - 0x0186E3 06:86D3: 18        CLC
C - - - - - 0x0186E4 06:86D4: BD 96 04  LDA ram_movement_angle,X
C - - - - - 0x0186E7 06:86D7: 79 E5 86  ADC tbl_86E5,Y
C - - - - - 0x0186EA 06:86DA: 9D 96 04  STA ram_movement_angle,X
C - - - - - 0x0186ED 06:86DD: A9 07     LDA #$07
C - - - - - 0x0186EF 06:86DF: 20 EB 99  JSR sub_99EB_вычислить_скорость_движения_по_углу
C - - - - - 0x0186F2 06:86E2: 4C 09 84  JMP loc_8409

tbl_86E5:
- D 0 - - - 0x0186F5 06:86E5: F0        .byte $F0   ; 
- D 0 - - - 0x0186F6 06:86E6: 10        .byte $10   ; 
- D 0 - - - 0x0186F7 06:86E7: 10        .byte $10   ; 
- D 0 - - - 0x0186F8 06:86E8: F0        .byte $F0   ; 

; bzk
tbl_86E9:
- D 0 - - - 0x0186F9 06:86E9: 48        .byte $48   ; 



ofs_86EA_53:
C - - J - - 0x0186FA 06:86EA: BD 59 04  LDA ram_movement_id_player,X
C - - - - - 0x0186FD 06:86ED: 30 17     BMI bra_8706
C - - - - - 0x0186FF 06:86EF: 20 27 99  JSR sub_9927_зафиксировать_и_очистить_анимацию_объекта
C - - - - - 0x018702 06:86F2: BD F6 03  LDA ram_spd_X_hi_player,X
C - - - - - 0x018705 06:86F5: 0A        ASL
C - - - - - 0x018706 06:86F6: 7E F6 03  ROR ram_spd_X_hi_player,X
C - - - - - 0x018709 06:86F9: 7E E8 03  ROR ram_spd_X_lo_player,X
C - - - - - 0x01870C 06:86FC: BD 12 04  LDA ram_spd_Y_hi_player,X
C - - - - - 0x01870F 06:86FF: 0A        ASL
C - - - - - 0x018710 06:8700: 7E 12 04  ROR ram_spd_Y_hi_player,X
C - - - - - 0x018713 06:8703: 7E 04 04  ROR ram_spd_Y_lo_player,X
bra_8706:
C - - - - - 0x018716 06:8706: 4C 48 87  JMP loc_8748



ofs_8709_45:
C - - J - - 0x018719 06:8709: BD 59 04  LDA ram_movement_id_player,X
C - - - - - 0x01871C 06:870C: 30 10     BMI bra_871E
C - - - - - 0x01871E 06:870E: 20 27 99  JSR sub_9927_зафиксировать_и_очистить_анимацию_объекта
C - - - - - 0x018721 06:8711: A9 00     LDA #$00
C - - - - - 0x018723 06:8713: 9D BD 04  STA ram_timer_action_player,X
C - - - - - 0x018726 06:8716: 9D 4A 04  STA ram_gravity_hi_player,X
C - - - - - 0x018729 06:8719: A9 80     LDA #$80
C - - - - - 0x01872B 06:871B: 9D 3C 04  STA ram_gravity_lo_player,X
bra_871E:
C - - - - - 0x01872E 06:871E: 4C 48 87  JMP loc_8748



ofs_8721_30:
C - - J - - 0x018731 06:8721: BD 59 04  LDA ram_movement_id_player,X
C - - - - - 0x018734 06:8724: 30 22     BMI bra_8748
C - - - - - 0x018736 06:8726: A0 05     LDY #$05
C - - - - - 0x018738 06:8728: 20 3F A0  JSR sub_A03F
C - - - - - 0x01873B 06:872B: A0 06     LDY #$06
C - - - - - 0x01873D 06:872D: 20 3F A0  JSR sub_A03F
C - - - - - 0x018740 06:8730: 20 27 99  JSR sub_9927_зафиксировать_и_очистить_анимацию_объекта
C - - - - - 0x018743 06:8733: A9 2B     LDA #con_sfx_jump
C - - - - - 0x018745 06:8735: 20 E4 C2  JSR sub_0x01C2F4_play_sound
C - - - - - 0x018748 06:8738: BD A3 04  LDA ram_направление_движения,X
C - - - - - 0x01874B 06:873B: 09 40     ORA #$40
C - - - - - 0x01874D 06:873D: 9D 96 04  STA ram_movement_angle,X
C - - - - - 0x018750 06:8740: A9 00     LDA #$00
C - - - - - 0x018752 06:8742: 20 60 9B  JSR sub_9B60_скорость_Z_и_гравитация
C - - - - - 0x018755 06:8745: 20 3C 8C  JSR sub_8C3C
bra_8748:
loc_8748:
C D 0 - - - 0x018758 06:8748: A9 00     LDA #$00
C - - - - - 0x01875A 06:874A: 20 F7 A1  JSR sub_A1F7
C - - - - - 0x01875D 06:874D: 20 33 A1  JSR sub_A133_смещение_объекта_в_воздухе
loc_8750:
C D 0 - - - 0x018760 06:8750: 20 87 A1  JSR sub_A187_ограничение_максимальной_скорости
C - - - - - 0x018763 06:8753: 20 95 9B  JSR sub_9B95
C - - - - - 0x018766 06:8756: 20 2F CD  JSR sub_0x01CD3F
C - - - - - 0x018769 06:8759: 20 BA B7  JSR sub_B7BA
C - - - - - 0x01876C 06:875C: 20 AC B8  JSR sub_B8AC
C - - - - - 0x01876F 06:875F: 20 BF 9E  JSR sub_9EBF
C - - - - - 0x018772 06:8762: 20 A7 A5  JSR sub_A5A7_воспроизвести_анимацию
C - - - - - 0x018775 06:8765: 20 29 9D  JSR sub_9D29
loc_8768:
C D 0 - - - 0x018778 06:8768: BD 99 03  LDA ram_pos_Z_hi_player,X
C - - - - - 0x01877B 06:876B: 30 05     BMI bra_8772
C - - - - - 0x01877D 06:876D: 1D 86 03  ORA ram_pos_Z_lo_player,X
C - - - - - 0x018780 06:8770: D0 2C     BNE bra_879E_RTS
bra_8772:
C - - - - - 0x018782 06:8772: 20 21 A0  JSR sub_A021
C - - - - - 0x018785 06:8775: BD 30 01  LDA ram_surface_player,X
C - - - - - 0x018788 06:8778: C9 02     CMP #$02
C - - - - - 0x01878A 06:877A: 90 0F     BCC bra_878B_на_траве_или_луже
C - - - - - 0x01878C 06:877C: BD 2E 04  LDA ram_spd_Z_hi_player,X
C - - - - - 0x01878F 06:877F: 30 02     BMI bra_8783
C - - - - - 0x018791 06:8781: 10 1B     BPL bra_879E_RTS
bra_8783:
C - - - - - 0x018793 06:8783: BD 86 03  LDA ram_pos_Z_lo_player,X
C - - - - - 0x018796 06:8786: 10 16     BPL bra_879E_RTS
C - - - - - 0x018798 06:8788: 4C 96 87  JMP loc_8796
bra_878B_на_траве_или_луже:
C - - - - - 0x01879B 06:878B: A9 00     LDA #$00
C - - - - - 0x01879D 06:878D: 9D 73 03  STA ram_pos_Z_sub_player,X
C - - - - - 0x0187A0 06:8790: 9D 86 03  STA ram_pos_Z_lo_player,X
C - - - - - 0x0187A3 06:8793: 9D 99 03  STA ram_pos_Z_hi_player,X
loc_8796:
C D 0 - - - 0x0187A6 06:8796: A9 2C     LDA #con_sfx_land_on_ground
C - - - - - 0x0187A8 06:8798: 20 E4 C2  JSR sub_0x01C2F4_play_sound
C - - - - - 0x0187AB 06:879B: 20 6C 8B  JSR sub_8B6C_вычислить_следующий_номер_движения
bra_879E_RTS:
C - - - - - 0x0187AE 06:879E: 60        RTS



ofs_879F_56:
C - - J - - 0x0187AF 06:879F: BD 59 04  LDA ram_movement_id_player,X
C - - - - - 0x0187B2 06:87A2: 30 0D     BMI bra_87B1
C - - - - - 0x0187B4 06:87A4: 20 27 99  JSR sub_9927_зафиксировать_и_очистить_анимацию_объекта
C - - - - - 0x0187B7 06:87A7: A9 2B     LDA #con_sfx_jump
C - - - - - 0x0187B9 06:87A9: 20 E4 C2  JSR sub_0x01C2F4_play_sound
C - - - - - 0x0187BC 06:87AC: A9 00     LDA #$00
C - - - - - 0x0187BE 06:87AE: 20 60 9B  JSR sub_9B60_скорость_Z_и_гравитация
bra_87B1:
C - - - - - 0x0187C1 06:87B1: BC CA 04  LDY ram_04CA,X
C - - - - - 0x0187C4 06:87B4: 20 72 8C  JSR sub_8C72
C - - - - - 0x0187C7 06:87B7: A9 00     LDA #$00
C - - - - - 0x0187C9 06:87B9: 20 F7 A1  JSR sub_A1F7
C - - - - - 0x0187CC 06:87BC: 20 33 A1  JSR sub_A133_смещение_объекта_в_воздухе
C - - - - - 0x0187CF 06:87BF: 4C 50 87  JMP loc_8750



ofs_87C2_52:
C - - J - - 0x0187D2 06:87C2: BD 59 04  LDA ram_movement_id_player,X
C - - - - - 0x0187D5 06:87C5: 30 12     BMI bra_87D9
C - - - - - 0x0187D7 06:87C7: A0 06     LDY #$06
C - - - - - 0x0187D9 06:87C9: 20 3F A0  JSR sub_A03F
C - - - - - 0x0187DC 06:87CC: 20 27 99  JSR sub_9927_зафиксировать_и_очистить_анимацию_объекта
C - - - - - 0x0187DF 06:87CF: A9 2B     LDA #con_sfx_jump
C - - - - - 0x0187E1 06:87D1: 20 E4 C2  JSR sub_0x01C2F4_play_sound
C - - - - - 0x0187E4 06:87D4: A9 06     LDA #$06
C - - - - - 0x0187E6 06:87D6: 20 60 9B  JSR sub_9B60_скорость_Z_и_гравитация
bra_87D9:
C - - - - - 0x0187E9 06:87D9: 20 33 A1  JSR sub_A133_смещение_объекта_в_воздухе
C - - - - - 0x0187EC 06:87DC: 4C 50 87  JMP loc_8750



ofs_87DF_57:
C - - J - - 0x0187EF 06:87DF: BD 59 04  LDA ram_movement_id_player,X
C - - - - - 0x0187F2 06:87E2: 30 15     BMI bra_87F9
C - - - - - 0x0187F4 06:87E4: 20 27 99  JSR sub_9927_зафиксировать_и_очистить_анимацию_объекта
C - - - - - 0x0187F7 06:87E7: A9 2B     LDA #con_sfx_jump
C - - - - - 0x0187F9 06:87E9: 20 E4 C2  JSR sub_0x01C2F4_play_sound
C - - - - - 0x0187FC 06:87EC: BD A3 04  LDA ram_направление_движения,X
C - - - - - 0x0187FF 06:87EF: 09 40     ORA #$40
C - - - - - 0x018801 06:87F1: 9D 96 04  STA ram_movement_angle,X
C - - - - - 0x018804 06:87F4: A9 0A     LDA #$0A
C - - - - - 0x018806 06:87F6: 20 60 9B  JSR sub_9B60_скорость_Z_и_гравитация
bra_87F9:
C - - - - - 0x018809 06:87F9: 4C 50 87  JMP loc_8750



ofs_87FC_3C:
ofs_87FC_59:
C - - J - - 0x01880C 06:87FC: BD 59 04  LDA ram_movement_id_player,X
C - - - - - 0x01880F 06:87FF: 30 2F     BMI bra_8830
C - - - - - 0x018811 06:8801: 20 27 99  JSR sub_9927_зафиксировать_и_очистить_анимацию_объекта
C - - - - - 0x018814 06:8804: 20 C9 9C  JSR sub_9CC9_очистить_скорости_объекта
C - - - - - 0x018817 06:8807: BD 96 04  LDA ram_movement_angle,X
C - - - - - 0x01881A 06:880A: 29 7F     AND #$7F
C - - - - - 0x01881C 06:880C: 09 80     ORA #$80
C - - - - - 0x01881E 06:880E: 5D A3 04  EOR ram_направление_движения,X
C - - - - - 0x018821 06:8811: 9D 96 04  STA ram_movement_angle,X
loc_8814:
C D 0 - - - 0x018824 06:8814: A9 02     LDA #$02
C - - - - - 0x018826 06:8816: 20 EB 99  JSR sub_99EB_вычислить_скорость_движения_по_углу
C - - - - - 0x018829 06:8819: A9 00     LDA #$00
C - - - - - 0x01882B 06:881B: 9D BD 04  STA ram_timer_action_player,X
C - - - - - 0x01882E 06:881E: A0 00     LDY #$00
C - - - - - 0x018830 06:8820: BD 59 04  LDA ram_movement_id_player,X
C - - - - - 0x018833 06:8823: 0A        ASL
C - - - - - 0x018834 06:8824: 10 01     BPL bra_8827
C - - - - - 0x018836 06:8826: C8        INY
bra_8827:
C - - - - - 0x018837 06:8827: B9 33 88  LDA tbl_8833,Y
C - - - - - 0x01883A 06:882A: 20 60 9B  JSR sub_9B60_скорость_Z_и_гравитация
C - - - - - 0x01883D 06:882D: 20 DA 9F  JSR sub_9FDA
bra_8830:
C - - - - - 0x018840 06:8830: 4C 50 87  JMP loc_8750

tbl_8833:
- D 0 - - - 0x018843 06:8833: 07        .byte $07   ; 
- D 0 - - - 0x018844 06:8834: 0B        .byte $0B   ; 



ofs_8835_3D:
ofs_8835_5A:
C - - J - - 0x018845 06:8835: BD 59 04  LDA ram_movement_id_player,X
C - - - - - 0x018848 06:8838: 30 F6     BMI bra_8830
C - - - - - 0x01884A 06:883A: 20 27 99  JSR sub_9927_зафиксировать_и_очистить_анимацию_объекта
C - - - - - 0x01884D 06:883D: 20 C9 9C  JSR sub_9CC9_очистить_скорости_объекта
C - - - - - 0x018850 06:8840: BD 96 04  LDA ram_movement_angle,X
C - - - - - 0x018853 06:8843: 29 7F     AND #$7F
C - - - - - 0x018855 06:8845: 5D A3 04  EOR ram_направление_движения,X
C - - - - - 0x018858 06:8848: 9D 96 04  STA ram_movement_angle,X
C - - - - - 0x01885B 06:884B: 4C 14 88  JMP loc_8814



ofs_884E_55:
- - - - - - 0x01885E 06:884E: BD 59 04  LDA ram_movement_id_player,X
- - - - - - 0x018861 06:8851: 30 15     BMI bra_8868
- - - - - - 0x018863 06:8853: 20 27 99  JSR sub_9927_зафиксировать_и_очистить_анимацию_объекта
- - - - - - 0x018866 06:8856: A9 40     LDA #$40
- - - - - - 0x018868 06:8858: 9D BD 04  STA ram_timer_action_player,X
- - - - - - 0x01886B 06:885B: A9 08     LDA #$08
- - - - - - 0x01886D 06:885D: 20 60 9B  JSR sub_9B60_скорость_Z_и_гравитация
- - - - - - 0x018870 06:8860: 20 DA 9F  JSR sub_9FDA
- - - - - - 0x018873 06:8863: A9 39     LDA #con_sfx_УНЕСЛО_ВИХРЕМ
- - - - - - 0x018875 06:8865: 20 E4 C2  JSR sub_0x01C2F4_play_sound
bra_8868:
- - - - - - 0x018878 06:8868: BD 2E 04  LDA ram_spd_Z_hi_player,X
- - - - - - 0x01887B 06:886B: 30 37     BMI bra_88A4
- - - - - - 0x01887D 06:886D: 18        CLC
- - - - - - 0x01887E 06:886E: BD BD 04  LDA ram_timer_action_player,X
- - - - - - 0x018881 06:8871: 29 FC     AND #$FC
- - - - - - 0x018883 06:8873: 7D 96 04  ADC ram_movement_angle,X
- - - - - - 0x018886 06:8876: 9D 96 04  STA ram_movement_angle,X
- - - - - - 0x018889 06:8879: A9 04     LDA #$04
- - - - - - 0x01888B 06:887B: 20 EB 99  JSR sub_99EB_вычислить_скорость_движения_по_углу
- - - - - - 0x01888E 06:887E: 18        CLC
- - - - - - 0x01888F 06:887F: AD F5 03  LDA ram_spd_X_lo_weather
- - - - - - 0x018892 06:8882: 7D E8 03  ADC ram_spd_X_lo_player,X
- - - - - - 0x018895 06:8885: 9D E8 03  STA ram_spd_X_lo_player,X
- - - - - - 0x018898 06:8888: AD 03 04  LDA ram_spd_X_hi_weather
- - - - - - 0x01889B 06:888B: 7D F6 03  ADC ram_spd_X_hi_player,X
- - - - - - 0x01889E 06:888E: 9D F6 03  STA ram_spd_X_hi_player,X
- - - - - - 0x0188A1 06:8891: 18        CLC
- - - - - - 0x0188A2 06:8892: AD 11 04  LDA ram_spd_Y_lo_weather
- - - - - - 0x0188A5 06:8895: 7D 04 04  ADC ram_spd_Y_lo_player,X
- - - - - - 0x0188A8 06:8898: 9D 04 04  STA ram_spd_Y_lo_player,X
- - - - - - 0x0188AB 06:889B: AD 1F 04  LDA ram_spd_Y_hi_weather
- - - - - - 0x0188AE 06:889E: 7D 12 04  ADC ram_spd_Y_hi_player,X
- - - - - - 0x0188B1 06:88A1: 9D 12 04  STA ram_spd_Y_hi_player,X
bra_88A4:
- - - - - - 0x0188B4 06:88A4: 4C 50 87  JMP loc_8750



ofs_88A7_32:
ofs_88A7_46:
C - - J - - 0x0188B7 06:88A7: BD 59 04  LDA ram_movement_id_player,X
C - - - - - 0x0188BA 06:88AA: 30 16     BMI bra_88C2
C - - - - - 0x0188BC 06:88AC: A0 02     LDY #$02
C - - - - - 0x0188BE 06:88AE: 20 3F A0  JSR sub_A03F
C - - - - - 0x0188C1 06:88B1: 20 27 99  JSR sub_9927_зафиксировать_и_очистить_анимацию_объекта
C - - - - - 0x0188C4 06:88B4: 20 E9 A1  JSR sub_A1E9
C - - - - - 0x0188C7 06:88B7: 20 0C A0  JSR sub_A00C
C - - - - - 0x0188CA 06:88BA: 20 C9 9C  JSR sub_9CC9_очистить_скорости_объекта
C - - - - - 0x0188CD 06:88BD: A9 01     LDA #$01
C - - - - - 0x0188CF 06:88BF: 20 60 9B  JSR sub_9B60_скорость_Z_и_гравитация
bra_88C2:
C - - - - - 0x0188D2 06:88C2: 4C 50 87  JMP loc_8750



ofs_88C5_35:
ofs_88C5_36:
C - - J - - 0x0188D5 06:88C5: BD 59 04  LDA ram_movement_id_player,X
C - - - - - 0x0188D8 06:88C8: 30 11     BMI bra_88DB
C - - - - - 0x0188DA 06:88CA: 20 27 99  JSR sub_9927_зафиксировать_и_очистить_анимацию_объекта
C - - - - - 0x0188DD 06:88CD: 20 E4 9C  JSR sub_9CE4
C - - - - - 0x0188E0 06:88D0: 20 47 8C  JSR sub_8C47
C - - - - - 0x0188E3 06:88D3: A9 01     LDA #$01
C - - - - - 0x0188E5 06:88D5: 20 60 9B  JSR sub_9B60_скорость_Z_и_гравитация
C - - - - - 0x0188E8 06:88D8: 20 32 8C  JSR sub_8C32
bra_88DB:
C - - - - - 0x0188EB 06:88DB: 20 33 A1  JSR sub_A133_смещение_объекта_в_воздухе
C - - - - - 0x0188EE 06:88DE: 4C 50 87  JMP loc_8750



ofs_88E1_31:
C - - J - - 0x0188F1 06:88E1: BD 59 04  LDA ram_movement_id_player,X
C - - - - - 0x0188F4 06:88E4: 30 20     BMI bra_8906
C - - - - - 0x0188F6 06:88E6: A0 04     LDY #$04
C - - - - - 0x0188F8 06:88E8: 20 3F A0  JSR sub_A03F
C - - - - - 0x0188FB 06:88EB: 20 27 99  JSR sub_9927_зафиксировать_и_очистить_анимацию_объекта
C - - - - - 0x0188FE 06:88EE: BD A3 04  LDA ram_направление_движения,X
C - - - - - 0x018901 06:88F1: 09 40     ORA #$40
C - - - - - 0x018903 06:88F3: 9D 96 04  STA ram_movement_angle,X
C - - - - - 0x018906 06:88F6: 20 19 9D  JSR sub_9D19
C - - - - - 0x018909 06:88F9: A9 02     LDA #$02
C - - - - - 0x01890B 06:88FB: 20 60 9B  JSR sub_9B60_скорость_Z_и_гравитация
C - - - - - 0x01890E 06:88FE: A9 04     LDA #$04
C - - - - - 0x018910 06:8900: 20 EB 99  JSR sub_99EB_вычислить_скорость_движения_по_углу
C - - - - - 0x018913 06:8903: 20 3C 8C  JSR sub_8C3C
bra_8906:
C - - - - - 0x018916 06:8906: 20 33 A1  JSR sub_A133_смещение_объекта_в_воздухе
C - - - - - 0x018919 06:8909: 4C 1F 8A  JMP loc_8A1F
- - - - - - 0x01891C 06:890C: 4C 50 87  JMP loc_8750



ofs_890F_33:
ofs_890F_34:
C - - J - - 0x01891F 06:890F: BD 59 04  LDA ram_movement_id_player,X
C - - - - - 0x018922 06:8912: 30 16     BMI bra_892A
C - - - - - 0x018924 06:8914: A0 02     LDY #$02
C - - - - - 0x018926 06:8916: 20 3F A0  JSR sub_A03F
C - - - - - 0x018929 06:8919: 20 27 99  JSR sub_9927_зафиксировать_и_очистить_анимацию_объекта
C - - - - - 0x01892C 06:891C: 20 E9 A1  JSR sub_A1E9
C - - - - - 0x01892F 06:891F: 20 0C A0  JSR sub_A00C
C - - - - - 0x018932 06:8922: A9 01     LDA #$01
C - - - - - 0x018934 06:8924: 20 60 9B  JSR sub_9B60_скорость_Z_и_гравитация
C - - - - - 0x018937 06:8927: 20 32 8C  JSR sub_8C32
bra_892A:
C - - - - - 0x01893A 06:892A: 20 33 A1  JSR sub_A133_смещение_объекта_в_воздухе
C - - - - - 0x01893D 06:892D: 4C 50 87  JMP loc_8750



ofs_8930_4A:
ofs_8930_51:
C - - J - - 0x018940 06:8930: BD 59 04  LDA ram_movement_id_player,X
C - - - - - 0x018943 06:8933: 30 08     BMI bra_893D
C - - - - - 0x018945 06:8935: 20 27 99  JSR sub_9927_зафиксировать_и_очистить_анимацию_объекта
C - - - - - 0x018948 06:8938: A9 00     LDA #$00
C - - - - - 0x01894A 06:893A: 20 60 9B  JSR sub_9B60_скорость_Z_и_гравитация
bra_893D:
C - - - - - 0x01894D 06:893D: 20 33 A1  JSR sub_A133_смещение_объекта_в_воздухе
C - - - - - 0x018950 06:8940: 4C 50 87  JMP loc_8750



ofs_8943_48:
ofs_8943_4C:
C - - J - - 0x018953 06:8943: BD 59 04  LDA ram_movement_id_player,X
C - - - - - 0x018956 06:8946: 30 0B     BMI bra_8953
C - - - - - 0x018958 06:8948: 20 27 99  JSR sub_9927_зафиксировать_и_очистить_анимацию_объекта
C - - - - - 0x01895B 06:894B: 20 0C A0  JSR sub_A00C
C - - - - - 0x01895E 06:894E: A9 03     LDA #$03
C - - - - - 0x018960 06:8950: 20 60 9B  JSR sub_9B60_скорость_Z_и_гравитация
bra_8953:
C - - - - - 0x018963 06:8953: 20 33 A1  JSR sub_A133_смещение_объекта_в_воздухе
C - - - - - 0x018966 06:8956: 4C 50 87  JMP loc_8750



ofs_8959_4E:
ofs_8959_50:
C - - J - - 0x018969 06:8959: BD 59 04  LDA ram_movement_id_player,X
C - - - - - 0x01896C 06:895C: 30 08     BMI bra_8966
C - - - - - 0x01896E 06:895E: 20 27 99  JSR sub_9927_зафиксировать_и_очистить_анимацию_объекта
C - - - - - 0x018971 06:8961: A9 03     LDA #$03
C - - - - - 0x018973 06:8963: 20 60 9B  JSR sub_9B60_скорость_Z_и_гравитация
bra_8966:
C - - - - - 0x018976 06:8966: 20 33 A1  JSR sub_A133_смещение_объекта_в_воздухе
C - - - - - 0x018979 06:8969: 4C 50 87  JMP loc_8750



ofs_896C_49:
ofs_896C_4B:
ofs_896C_4D:
ofs_896C_4F:
C - - J - - 0x01897C 06:896C: BD 59 04  LDA ram_movement_id_player,X
C - - - - - 0x01897F 06:896F: 30 1B     BMI bra_898C
C - - - - - 0x018981 06:8971: 20 27 99  JSR sub_9927_зафиксировать_и_очистить_анимацию_объекта
C - - - - - 0x018984 06:8974: A9 3C     LDA #con_sfx_spin_normal
C - - - - - 0x018986 06:8976: 20 E4 C2  JSR sub_0x01C2F4_play_sound
C - - - - - 0x018989 06:8979: A9 00     LDA #$00
C - - - - - 0x01898B 06:897B: 9D 20 04  STA ram_spd_Z_lo_player,X
C - - - - - 0x01898E 06:897E: 9D 2E 04  STA ram_spd_Z_hi_player,X
C - - - - - 0x018991 06:8981: 18        CLC
C - - - - - 0x018992 06:8982: AD FD 05  LDA ram_сила_ветра
C - - - - - 0x018995 06:8985: 69 02     ADC #$02
C - - - - - 0x018997 06:8987: 0A        ASL
C - - - - - 0x018998 06:8988: 0A        ASL
C - - - - - 0x018999 06:8989: 9D BD 04  STA ram_timer_action_player,X
bra_898C:
C - - - - - 0x01899C 06:898C: BD BD 04  LDA ram_timer_action_player,X
C - - - - - 0x01899F 06:898F: D0 03     BNE bra_8994
C - - - - - 0x0189A1 06:8991: 20 6C 8B  JSR sub_8B6C_вычислить_следующий_номер_движения
bra_8994:
C - - - - - 0x0189A4 06:8994: 20 33 A1  JSR sub_A133_смещение_объекта_в_воздухе
C - - - - - 0x0189A7 06:8997: 4C 1F 8A  JMP loc_8A1F



ofs_899A_37:
ofs_899A_38:
C - - J - - 0x0189AA 06:899A: BD 59 04  LDA ram_movement_id_player,X
C - - - - - 0x0189AD 06:899D: 30 1D     BMI bra_89BC
C - - - - - 0x0189AF 06:899F: 20 27 99  JSR sub_9927_зафиксировать_и_очистить_анимацию_объекта
C - - - - - 0x0189B2 06:89A2: 20 E9 A1  JSR sub_A1E9
C - - - - - 0x0189B5 06:89A5: 20 0C A0  JSR sub_A00C
C - - - - - 0x0189B8 06:89A8: A9 01     LDA #$01
C - - - - - 0x0189BA 06:89AA: 20 60 9B  JSR sub_9B60_скорость_Z_и_гравитация
C - - - - - 0x0189BD 06:89AD: 20 32 8C  JSR sub_8C32
C - - - - - 0x0189C0 06:89B0: BD 20 04  LDA ram_spd_Z_lo_player,X
C - - - - - 0x0189C3 06:89B3: 8D 2C 04  STA ram_spd_Z_lo_ball
C - - - - - 0x0189C6 06:89B6: BD 2E 04  LDA ram_spd_Z_hi_player,X
C - - - - - 0x0189C9 06:89B9: 8D 3A 04  STA ram_spd_Z_hi_ball
bra_89BC:
C - - - - - 0x0189CC 06:89BC: 20 33 A1  JSR sub_A133_смещение_объекта_в_воздухе
C - - - - - 0x0189CF 06:89BF: 4C 50 87  JMP loc_8750



ofs_89C3_39:
ofs_89C3_3A:
C - - J - - 0x0189D3 06:89C3: BD 59 04  LDA ram_movement_id_player,X
C - - - - - 0x0189D6 06:89C6: 30 34     BMI bra_89FC
C - - - - - 0x0189D8 06:89C8: 20 27 99  JSR sub_9927_зафиксировать_и_очистить_анимацию_объекта
C - - - - - 0x0189DB 06:89CB: 20 E4 9C  JSR sub_9CE4
C - - - - - 0x0189DE 06:89CE: A0 00     LDY #$00
C - - - - - 0x0189E0 06:89D0: 38        SEC
C - - - - - 0x0189E1 06:89D1: AD 92 03  LDA ram_pos_Z_lo_ball
C - - - - - 0x0189E4 06:89D4: FD 86 03  SBC ram_pos_Z_lo_player,X
C - - - - - 0x0189E7 06:89D7: 30 06     BMI bra_89DF
C - - - - - 0x0189E9 06:89D9: CD 02 8A  CMP tbl_8A02
C - - - - - 0x0189EC 06:89DC: 90 01     BCC bra_89DF
C - - - - - 0x0189EE 06:89DE: C8        INY
bra_89DF:
C - - - - - 0x0189EF 06:89DF: B9 03 8A  LDA tbl_8A03,Y
C - - - - - 0x0189F2 06:89E2: 20 27 99  JSR sub_9927_зафиксировать_и_очистить_анимацию_объекта
C - - - - - 0x0189F5 06:89E5: 20 47 8C  JSR sub_8C47
C - - - - - 0x0189F8 06:89E8: A9 01     LDA #$01
C - - - - - 0x0189FA 06:89EA: 20 60 9B  JSR sub_9B60_скорость_Z_и_гравитация
C - - - - - 0x0189FD 06:89ED: 20 32 8C  JSR sub_8C32
C - - - - - 0x018A00 06:89F0: BD 20 04  LDA ram_spd_Z_lo_player,X
C - - - - - 0x018A03 06:89F3: 8D 2C 04  STA ram_spd_Z_lo_ball
C - - - - - 0x018A06 06:89F6: BD 2E 04  LDA ram_spd_Z_hi_player,X
C - - - - - 0x018A09 06:89F9: 8D 3A 04  STA ram_spd_Z_hi_ball
bra_89FC:
C - - - - - 0x018A0C 06:89FC: 20 33 A1  JSR sub_A133_смещение_объекта_в_воздухе
C - - - - - 0x018A0F 06:89FF: 4C 50 87  JMP loc_8750

; bzk
tbl_8A02:
- D 0 - - - 0x018A12 06:8A02: 10        .byte $10   ; 

tbl_8A03:
- D 0 - - - 0x018A13 06:8A03: 39        .byte $39   ; 
- D 0 - - - 0x018A14 06:8A04: 3A        .byte $3A   ; 



ofs_8A05_3B:
ofs_8A05_42:
C - - J - - 0x018A15 06:8A05: BD 59 04  LDA ram_movement_id_player,X
C - - - - - 0x018A18 06:8A08: 30 12     BMI bra_8A1C
C - - - - - 0x018A1A 06:8A0A: A0 04     LDY #$04
C - - - - - 0x018A1C 06:8A0C: 20 3F A0  JSR sub_A03F
C - - - - - 0x018A1F 06:8A0F: 20 27 99  JSR sub_9927_зафиксировать_и_очистить_анимацию_объекта
C - - - - - 0x018A22 06:8A12: A9 3B     LDA #con_sfx_elbow_tackle
C - - - - - 0x018A24 06:8A14: 20 E4 C2  JSR sub_0x01C2F4_play_sound
C - - - - - 0x018A27 06:8A17: A9 03     LDA #$03
C - - - - - 0x018A29 06:8A19: 20 60 9B  JSR sub_9B60_скорость_Z_и_гравитация
bra_8A1C:
C - - - - - 0x018A2C 06:8A1C: 20 33 A1  JSR sub_A133_смещение_объекта_в_воздухе
loc_8A1F:
C D 0 - - - 0x018A2F 06:8A1F: 20 87 A1  JSR sub_A187_ограничение_максимальной_скорости
C - - - - - 0x018A32 06:8A22: 20 95 9B  JSR sub_9B95
C - - - - - 0x018A35 06:8A25: 20 BA B7  JSR sub_B7BA
C - - - - - 0x018A38 06:8A28: A5 1C     LDA ram_001C
C - - - - - 0x018A3A 06:8A2A: F0 05     BEQ bra_8A31
C - - - - - 0x018A3C 06:8A2C: A9 00     LDA #$00
C - - - - - 0x018A3E 06:8A2E: 9D BD 04  STA ram_timer_action_player,X
bra_8A31:
C - - - - - 0x018A41 06:8A31: 20 AC B8  JSR sub_B8AC
C - - - - - 0x018A44 06:8A34: 20 65 9D  JSR sub_9D65
C - - - - - 0x018A47 06:8A37: 20 A7 A5  JSR sub_A5A7_воспроизвести_анимацию
C - - - - - 0x018A4A 06:8A3A: 20 29 9D  JSR sub_9D29
C - - - - - 0x018A4D 06:8A3D: 4C 68 87  JMP loc_8768



ofs_8A40_5B:
C - - J - - 0x018A50 06:8A40: BD 59 04  LDA ram_movement_id_player,X
C - - - - - 0x018A53 06:8A43: 30 10     BMI bra_8A55
C - - - - - 0x018A55 06:8A45: 20 27 99  JSR sub_9927_зафиксировать_и_очистить_анимацию_объекта
C - - - - - 0x018A58 06:8A48: 20 0C A0  JSR sub_A00C
C - - - - - 0x018A5B 06:8A4B: A9 38     LDA #con_sfx_spin_guinea
C - - - - - 0x018A5D 06:8A4D: 20 E4 C2  JSR sub_0x01C2F4_play_sound
C - - - - - 0x018A60 06:8A50: A9 04     LDA #$04
C - - - - - 0x018A62 06:8A52: 20 60 9B  JSR sub_9B60_скорость_Z_и_гравитация
bra_8A55:
C - - - - - 0x018A65 06:8A55: 4C 1F 8A  JMP loc_8A1F



ofs_8A58_58:
C - - J - - 0x018A68 06:8A58: BD 59 04  LDA ram_movement_id_player,X
C - - - - - 0x018A6B 06:8A5B: 30 22     BMI bra_8A7F
C - - - - - 0x018A6D 06:8A5D: A0 01     LDY #$01
C - - - - - 0x018A6F 06:8A5F: 20 3F A0  JSR sub_A03F
C - - - - - 0x018A72 06:8A62: 20 27 99  JSR sub_9927_зафиксировать_и_очистить_анимацию_объекта
C - - - - - 0x018A75 06:8A65: 20 E4 9C  JSR sub_9CE4
C - - - - - 0x018A78 06:8A68: 20 19 9D  JSR sub_9D19
C - - - - - 0x018A7B 06:8A6B: A9 38     LDA #con_sfx_spin_guinea
C - - - - - 0x018A7D 06:8A6D: 20 E4 C2  JSR sub_0x01C2F4_play_sound
C - - - - - 0x018A80 06:8A70: A9 07     LDA #$07
C - - - - - 0x018A82 06:8A72: 20 EB 99  JSR sub_99EB_вычислить_скорость_движения_по_углу
C - - - - - 0x018A85 06:8A75: A9 09     LDA #$09
C - - - - - 0x018A87 06:8A77: 20 60 9B  JSR sub_9B60_скорость_Z_и_гравитация
C - - - - - 0x018A8A 06:8A7A: A9 04     LDA #$04
C - - - - - 0x018A8C 06:8A7C: 9D BD 04  STA ram_timer_action_player,X
bra_8A7F:
C - - - - - 0x018A8F 06:8A7F: BD 2E 04  LDA ram_spd_Z_hi_player,X
C - - - - - 0x018A92 06:8A82: 10 0C     BPL bra_8A90
C - - - - - 0x018A94 06:8A84: C9 FF     CMP #$FF
C - - - - - 0x018A96 06:8A86: D0 08     BNE bra_8A90
C - - - - - 0x018A98 06:8A88: 20 32 8C  JSR sub_8C32
C - - - - - 0x018A9B 06:8A8B: A9 01     LDA #$01
C - - - - - 0x018A9D 06:8A8D: 9D 4A 04  STA ram_gravity_hi_player,X
bra_8A90:
C - - - - - 0x018AA0 06:8A90: 20 33 A1  JSR sub_A133_смещение_объекта_в_воздухе
C - - - - - 0x018AA3 06:8A93: 4C 1F 8A  JMP loc_8A1F



ofs_8A96_3E:
ofs_8A96_3F:
C - - J - - 0x018AA6 06:8A96: BD 59 04  LDA ram_movement_id_player,X
C - - - - - 0x018AA9 06:8A99: 30 1B     BMI bra_8AB6
C - - - - - 0x018AAB 06:8A9B: 20 27 99  JSR sub_9927_зафиксировать_и_очистить_анимацию_объекта
C - - - - - 0x018AAE 06:8A9E: A9 01     LDA #$01
C - - - - - 0x018AB0 06:8AA0: 20 F7 A1  JSR sub_A1F7
C - - - - - 0x018AB3 06:8AA3: BC 6C 04  LDY ram_animation_sub_id_player,X
C - - - - - 0x018AB6 06:8AA6: B9 BC 8A  LDA tbl_8ABC,Y
C - - - - - 0x018AB9 06:8AA9: 9D 96 04  STA ram_movement_angle,X
C - - - - - 0x018ABC 06:8AAC: A9 06     LDA #$06
C - - - - - 0x018ABE 06:8AAE: 20 EB 99  JSR sub_99EB_вычислить_скорость_движения_по_углу
C - - - - - 0x018AC1 06:8AB1: A9 06     LDA #$06
C - - - - - 0x018AC3 06:8AB3: 20 60 9B  JSR sub_9B60_скорость_Z_и_гравитация
bra_8AB6:
C - - - - - 0x018AC6 06:8AB6: 20 33 A1  JSR sub_A133_смещение_объекта_в_воздухе
C - - - - - 0x018AC9 06:8AB9: 4C 1F 8A  JMP loc_8A1F

tbl_8ABC:
- D 0 - - - 0x018ACC 06:8ABC: 00        .byte $00   ; 
- D 0 - - - 0x018ACD 06:8ABD: 80        .byte $80   ; 



ofs_8ABE_40:
C - - J - - 0x018ACE 06:8ABE: BD 59 04  LDA ram_movement_id_player,X
C - - - - - 0x018AD1 06:8AC1: 30 03     BMI bra_8AC6
C - - - - - 0x018AD3 06:8AC3: 20 27 99  JSR sub_9927_зафиксировать_и_очистить_анимацию_объекта
bra_8AC6:
C - - - - - 0x018AD6 06:8AC6: 4C 50 87  JMP loc_8750



ofs_8AC9_54:
C - - J - - 0x018AD9 06:8AC9: BD 59 04  LDA ram_movement_id_player,X
C - - - - - 0x018ADC 06:8ACC: 30 0B     BMI bra_8AD9
C - - - - - 0x018ADE 06:8ACE: 20 27 99  JSR sub_9927_зафиксировать_и_очистить_анимацию_объекта
C - - - - - 0x018AE1 06:8AD1: 20 C9 9C  JSR sub_9CC9_очистить_скорости_объекта
C - - - - - 0x018AE4 06:8AD4: A9 04     LDA #$04
C - - - - - 0x018AE6 06:8AD6: 20 60 9B  JSR sub_9B60_скорость_Z_и_гравитация
bra_8AD9:
C - - - - - 0x018AE9 06:8AD9: 20 33 A1  JSR sub_A133_смещение_объекта_в_воздухе
C - - - - - 0x018AEC 06:8ADC: 4C 1F 8A  JMP loc_8A1F



ofs_8ADF_5C:
C - - J - - 0x018AEF 06:8ADF: BD 59 04  LDA ram_movement_id_player,X
C - - - - - 0x018AF2 06:8AE2: 30 3D     BMI bra_8B21
C - - - - - 0x018AF4 06:8AE4: 10 0A     BPL bra_8AF0



ofs_8AE6_41:
C - - J - - 0x018AF6 06:8AE6: BD 59 04  LDA ram_movement_id_player,X
C - - - - - 0x018AF9 06:8AE9: 30 20     BMI bra_8B0B
C - - - - - 0x018AFB 06:8AEB: A0 03     LDY #$03
C - - - - - 0x018AFD 06:8AED: 20 3F A0  JSR sub_A03F
bra_8AF0:
C - - - - - 0x018B00 06:8AF0: 20 27 99  JSR sub_9927_зафиксировать_и_очистить_анимацию_объекта
C - - - - - 0x018B03 06:8AF3: 20 C9 9C  JSR sub_9CC9_очистить_скорости_объекта
C - - - - - 0x018B06 06:8AF6: 20 E4 9C  JSR sub_9CE4
C - - - - - 0x018B09 06:8AF9: BD A3 04  LDA ram_направление_движения,X
C - - - - - 0x018B0C 06:8AFC: 09 40     ORA #$40
C - - - - - 0x018B0E 06:8AFE: 9D 96 04  STA ram_movement_angle,X
C - - - - - 0x018B11 06:8B01: A9 07     LDA #$07
C - - - - - 0x018B13 06:8B03: 20 EB 99  JSR sub_99EB_вычислить_скорость_движения_по_углу
C - - - - - 0x018B16 06:8B06: A9 01     LDA #$01
C - - - - - 0x018B18 06:8B08: 20 60 9B  JSR sub_9B60_скорость_Z_и_гравитация
bra_8B0B:
C - - - - - 0x018B1B 06:8B0B: BD 87 00  LDA ram_animation_timer_player,X
C - - - - - 0x018B1E 06:8B0E: C9 01     CMP #$01
C - - - - - 0x018B20 06:8B10: D0 0F     BNE bra_8B21
C - - - - - 0x018B22 06:8B12: BD 94 00  LDA ram_номер_кадра_анимации,X
C - - - - - 0x018B25 06:8B15: C9 02     CMP #$02
C - - - - - 0x018B27 06:8B17: D0 08     BNE bra_8B21
C - - - - - 0x018B29 06:8B19: 20 C9 9C  JSR sub_9CC9_очистить_скорости_объекта
C - - - - - 0x018B2C 06:8B1C: A9 05     LDA #$05
C - - - - - 0x018B2E 06:8B1E: 20 60 9B  JSR sub_9B60_скорость_Z_и_гравитация
bra_8B21:
C - - - - - 0x018B31 06:8B21: 20 33 A1  JSR sub_A133_смещение_объекта_в_воздухе
C - - - - - 0x018B34 06:8B24: 4C 1F 8A  JMP loc_8A1F



ofs_8B27_43:
C - - J - - 0x018B37 06:8B27: BD 59 04  LDA ram_movement_id_player,X
C - - - - - 0x018B3A 06:8B2A: 30 2A     BMI bra_8B56
C - - - - - 0x018B3C 06:8B2C: 20 27 99  JSR sub_9927_зафиксировать_и_очистить_анимацию_объекта
C - - - - - 0x018B3F 06:8B2F: A9 0A     LDA #$0A
C - - - - - 0x018B41 06:8B31: 20 60 9B  JSR sub_9B60_скорость_Z_и_гравитация
C - - - - - 0x018B44 06:8B34: 4C 44 8B  JMP loc_8B44



ofs_8B37_47:
C - - J - - 0x018B47 06:8B37: BD 59 04  LDA ram_movement_id_player,X
C - - - - - 0x018B4A 06:8B3A: 30 1A     BMI bra_8B56
C - - - - - 0x018B4C 06:8B3C: 20 27 99  JSR sub_9927_зафиксировать_и_очистить_анимацию_объекта
C - - - - - 0x018B4F 06:8B3F: A9 00     LDA #$00
C - - - - - 0x018B51 06:8B41: 20 60 9B  JSR sub_9B60_скорость_Z_и_гравитация
loc_8B44:
C D 0 - - - 0x018B54 06:8B44: BD A3 04  LDA ram_направление_движения,X
C - - - - - 0x018B57 06:8B47: 09 40     ORA #$40
C - - - - - 0x018B59 06:8B49: 9D 96 04  STA ram_movement_angle,X
C - - - - - 0x018B5C 06:8B4C: A9 05     LDA #$05
C - - - - - 0x018B5E 06:8B4E: 20 EB 99  JSR sub_99EB_вычислить_скорость_движения_по_углу
C - - - - - 0x018B61 06:8B51: A9 38     LDA #con_sfx_spin_guinea
C - - - - - 0x018B63 06:8B53: 20 E4 C2  JSR sub_0x01C2F4_play_sound
bra_8B56:
C - - - - - 0x018B66 06:8B56: 4C 1F 8A  JMP loc_8A1F



ofs_8B59_44:
- - - - - - 0x018B69 06:8B59: BD 59 04  LDA ram_movement_id_player,X
- - - - - - 0x018B6C 06:8B5C: 30 08     BMI bra_8B66
- - - - - - 0x018B6E 06:8B5E: 20 27 99  JSR sub_9927_зафиксировать_и_очистить_анимацию_объекта
- - - - - - 0x018B71 06:8B61: A9 04     LDA #$04
- - - - - - 0x018B73 06:8B63: 20 60 9B  JSR sub_9B60_скорость_Z_и_гравитация
bra_8B66:
- - - - - - 0x018B76 06:8B66: 20 33 A1  JSR sub_A133_смещение_объекта_в_воздухе
- - - - - - 0x018B79 06:8B69: 4C 50 87  JMP loc_8750



sub_8B6C_вычислить_следующий_номер_движения:
ofs_8B6C_вычислить_следующий_номер_движения:
C - - J - - 0x018B7C 06:8B6C: BD 59 04  LDA ram_movement_id_player,X
C - - - - - 0x018B7F 06:8B6F: 29 7F     AND #$7F
C - - - - - 0x018B81 06:8B71: A8        TAY
C - - - - - 0x018B82 06:8B72: B9 D5 8B  LDA tbl_8BD5_следующий_номер_движения,Y
C - - - - - 0x018B85 06:8B75: 10 11     BPL bra_8B88
C - - - - - 0x018B87 06:8B77: C9 80     CMP #$80
C - - - - - 0x018B89 06:8B79: F0 1C     BEQ bra_8B97
C - - - - - 0x018B8B 06:8B7B: C9 81     CMP #$81
C - - - - - 0x018B8D 06:8B7D: F0 2F     BEQ bra_8BAE
C - - - - - 0x018B8F 06:8B7F: C9 82     CMP #$82
C - - - - - 0x018B91 06:8B81: F0 38     BEQ bra_8BBB
C - - - - - 0x018B93 06:8B83: D0 43     BNE bra_8BC8



bra_8B85:
loc_8B85:
C D 0 - - - 0x018B95 06:8B85: B9 CD 8B  LDA tbl_8BCD,Y
bra_8B88:
C - - - - - 0x018B98 06:8B88: 9D 59 04  STA ram_movement_id_player,X
C - - - - - 0x018B9B 06:8B8B: A9 00     LDA #$00
C - - - - - 0x018B9D 06:8B8D: 9D 94 00  STA ram_номер_кадра_анимации,X
C - - - - - 0x018BA0 06:8B90: 9D 87 00  STA ram_animation_timer_player,X
C - - - - - 0x018BA3 06:8B93: 9D 6C 04  STA ram_animation_sub_id_player,X
C - - - - - 0x018BA6 06:8B96: 60        RTS
bra_8B97:
C - - - - - 0x018BA7 06:8B97: A0 00     LDY #$00
C - - - - - 0x018BA9 06:8B99: BD 86 04  LDA ram_игрок_состояние,X
C - - - - - 0x018BAC 06:8B9C: 29 10     AND #$10
C - - - - - 0x018BAE 06:8B9E: D0 E5     BNE bra_8B85
C - - - - - 0x018BB0 06:8BA0: BD 99 03  LDA ram_pos_Z_hi_player,X
C - - - - - 0x018BB3 06:8BA3: 30 E0     BMI bra_8B85
C - - - - - 0x018BB5 06:8BA5: BD 86 03  LDA ram_pos_Z_lo_player,X
C - - - - - 0x018BB8 06:8BA8: F0 DB     BEQ bra_8B85
C - - - - - 0x018BBA 06:8BAA: C8        INY
C - - - - - 0x018BBB 06:8BAB: 4C 85 8B  JMP loc_8B85
bra_8BAE:
C - - - - - 0x018BBE 06:8BAE: A0 02     LDY #$02
C - - - - - 0x018BC0 06:8BB0: BD 86 04  LDA ram_игрок_состояние,X
C - - - - - 0x018BC3 06:8BB3: 29 08     AND #$08
C - - - - - 0x018BC5 06:8BB5: F0 CE     BEQ bra_8B85
C - - - - - 0x018BC7 06:8BB7: C8        INY
C - - - - - 0x018BC8 06:8BB8: 4C 85 8B  JMP loc_8B85
bra_8BBB:
C - - - - - 0x018BCB 06:8BBB: A0 04     LDY #$04
loc_8BBD:
C D 0 - - - 0x018BCD 06:8BBD: BD 86 04  LDA ram_игрок_состояние,X
C - - - - - 0x018BD0 06:8BC0: 29 40     AND #$40
C - - - - - 0x018BD2 06:8BC2: F0 C1     BEQ bra_8B85
C - - - - - 0x018BD4 06:8BC4: C8        INY
C - - - - - 0x018BD5 06:8BC5: 4C 85 8B  JMP loc_8B85
bra_8BC8:
C - - - - - 0x018BD8 06:8BC8: A0 06     LDY #$06
C - - - - - 0x018BDA 06:8BCA: 4C BD 8B  JMP loc_8BBD



tbl_8BCD:
- D 0 - - - 0x018BDD 06:8BCD: 01        .byte $01   ; 
- D 0 - - - 0x018BDE 06:8BCE: 45        .byte $45   ; 
- - - - - - 0x018BDF 06:8BCF: 20        .byte $20   ; 
- D 0 - - - 0x018BE0 06:8BD0: 21        .byte $21   ; 
- D 0 - - - 0x018BE1 06:8BD1: 53        .byte $53   ; 
- D 0 - - - 0x018BE2 06:8BD2: 40        .byte $40   ; 
- D 0 - - - 0x018BE3 06:8BD3: 02        .byte $02   ; 
- D 0 - - - 0x018BE4 06:8BD4: 0C        .byte $0C   ; 



tbl_8BD5_следующий_номер_движения:
- - - - - - 0x018BE5 06:8BD5: 00        .byte $00   ; 00
- - - - - - 0x018BE6 06:8BD6: 80        .byte $80   ; 01
- D 0 - - - 0x018BE7 06:8BD7: 80        .byte $80   ; 02
- D 0 - - - 0x018BE8 06:8BD8: 02        .byte $02   ; 03
- D 0 - - - 0x018BE9 06:8BD9: 02        .byte $02   ; 04
- D 0 - - - 0x018BEA 06:8BDA: 02        .byte $02   ; 05
- D 0 - - - 0x018BEB 06:8BDB: 3C        .byte $3C   ; 06
- D 0 - - - 0x018BEC 06:8BDC: 80        .byte $80   ; 07
- D 0 - - - 0x018BED 06:8BDD: 80        .byte $80   ; 08
- D 0 - - - 0x018BEE 06:8BDE: 80        .byte $80   ; 09
- D 0 - - - 0x018BEF 06:8BDF: 80        .byte $80   ; 0A
- D 0 - - - 0x018BF0 06:8BE0: 80        .byte $80   ; 0B
- D 0 - - - 0x018BF1 06:8BE1: 80        .byte $80   ; 0C
- D 0 - - - 0x018BF2 06:8BE2: 80        .byte $80   ; 0D
- D 0 - - - 0x018BF3 06:8BE3: 80        .byte $80   ; 0E
- D 0 - - - 0x018BF4 06:8BE4: 80        .byte $80   ; 0F
- D 0 - - - 0x018BF5 06:8BE5: 80        .byte $80   ; 10
- D 0 - - - 0x018BF6 06:8BE6: 80        .byte $80   ; 11
- - - - - - 0x018BF7 06:8BE7: 81        .byte $81   ; 12
- - - - - - 0x018BF8 06:8BE8: 80        .byte $80   ; 13
- - - - - - 0x018BF9 06:8BE9: 30        .byte $30   ; 14
- - - - - - 0x018BFA 06:8BEA: 80        .byte $80   ; 15
- D 0 - - - 0x018BFB 06:8BEB: 80        .byte $80   ; 16
- - - - - - 0x018BFC 06:8BEC: 80        .byte $80   ; 17
- - - - - - 0x018BFD 06:8BED: 80        .byte $80   ; 18
- D 0 - - - 0x018BFE 06:8BEE: 80        .byte $80   ; 19
- D 0 - - - 0x018BFF 06:8BEF: 1B        .byte $1B   ; 1A
- D 0 - - - 0x018C00 06:8BF0: 1C        .byte $1C   ; 1B
- D 0 - - - 0x018C01 06:8BF1: 08        .byte $08   ; 1C
- D 0 - - - 0x018C02 06:8BF2: 21        .byte $21   ; 1D
- - - - - - 0x018C03 06:8BF3: 80        .byte $80   ; 1E
- - - - - - 0x018C04 06:8BF4: 80        .byte $80   ; 1F
- - - - - - 0x018C05 06:8BF5: 80        .byte $80   ; 20
- - - - - - 0x018C06 06:8BF6: 80        .byte $80   ; 21
- D 0 - - - 0x018C07 06:8BF7: 80        .byte $80   ; 22
- D 0 - - - 0x018C08 06:8BF8: 02        .byte $02   ; 23
- D 0 - - - 0x018C09 06:8BF9: 21        .byte $21   ; 24
- D 0 - - - 0x018C0A 06:8BFA: 21        .byte $21   ; 25
- D 0 - - - 0x018C0B 06:8BFB: 81        .byte $81   ; 26
- D 0 - - - 0x018C0C 06:8BFC: 03        .byte $03   ; 27
- D 0 - - - 0x018C0D 06:8BFD: 02        .byte $02   ; 28
- D 0 - - - 0x018C0E 06:8BFE: 02        .byte $02   ; 29
- D 0 - - - 0x018C0F 06:8BFF: 03        .byte $03   ; 2A
- - - - - - 0x018C10 06:8C00: 80        .byte $80   ; 2B
- - - - - - 0x018C11 06:8C01: 80        .byte $80   ; 2C
- D 0 - - - 0x018C12 06:8C02: 80        .byte $80   ; 2D
- D 0 - - - 0x018C13 06:8C03: 80        .byte $80   ; 2E
- D 0 - - - 0x018C14 06:8C04: 80        .byte $80   ; 2F
- D 0 - - - 0x018C15 06:8C05: 02        .byte $02   ; 30
- D 0 - - - 0x018C16 06:8C06: 03        .byte $03   ; 31
- D 0 - - - 0x018C17 06:8C07: 45        .byte $45   ; 32
- D 0 - - - 0x018C18 06:8C08: 45        .byte $45   ; 33
- D 0 - - - 0x018C19 06:8C09: 45        .byte $45   ; 34
- D 0 - - - 0x018C1A 06:8C0A: 45        .byte $45   ; 35
- - - - - - 0x018C1B 06:8C0B: 45        .byte $45   ; 36
- D 0 - - - 0x018C1C 06:8C0C: 45        .byte $45   ; 37
- D 0 - - - 0x018C1D 06:8C0D: 45        .byte $45   ; 38
- D 0 - - - 0x018C1E 06:8C0E: 45        .byte $45   ; 39
- D 0 - - - 0x018C1F 06:8C0F: 45        .byte $45   ; 3A
- D 0 - - - 0x018C20 06:8C10: 45        .byte $45   ; 3B
- D 0 - - - 0x018C21 06:8C11: 04        .byte $04   ; 3C
- D 0 - - - 0x018C22 06:8C12: 05        .byte $05   ; 3D
- D 0 - - - 0x018C23 06:8C13: 82        .byte $82   ; 3E
- D 0 - - - 0x018C24 06:8C14: 82        .byte $82   ; 3F
- D 0 - - - 0x018C25 06:8C15: 83        .byte $83   ; 40
- D 0 - - - 0x018C26 06:8C16: 45        .byte $45   ; 41
- D 0 - - - 0x018C27 06:8C17: 02        .byte $02   ; 42
- D 0 - - - 0x018C28 06:8C18: 02        .byte $02   ; 43
- - - - - - 0x018C29 06:8C19: 02        .byte $02   ; 44
- D 0 - - - 0x018C2A 06:8C1A: 02        .byte $02   ; 45
- D 0 - - - 0x018C2B 06:8C1B: 45        .byte $45   ; 46
- D 0 - - - 0x018C2C 06:8C1C: 02        .byte $02   ; 47
- D 0 - - - 0x018C2D 06:8C1D: 49        .byte $49   ; 48
- D 0 - - - 0x018C2E 06:8C1E: 45        .byte $45   ; 49
- D 0 - - - 0x018C2F 06:8C1F: 4B        .byte $4B   ; 4A
- D 0 - - - 0x018C30 06:8C20: 45        .byte $45   ; 4B
- D 0 - - - 0x018C31 06:8C21: 4D        .byte $4D   ; 4C
- D 0 - - - 0x018C32 06:8C22: 45        .byte $45   ; 4D
- D 0 - - - 0x018C33 06:8C23: 4F        .byte $4F   ; 4E
- D 0 - - - 0x018C34 06:8C24: 45        .byte $45   ; 4F
- D 0 - - - 0x018C35 06:8C25: 4B        .byte $4B   ; 50
- D 0 - - - 0x018C36 06:8C26: 4F        .byte $4F   ; 51
- D 0 - - - 0x018C37 06:8C27: 02        .byte $02   ; 52
- D 0 - - - 0x018C38 06:8C28: 02        .byte $02   ; 53
- D 0 - - - 0x018C39 06:8C29: 02        .byte $02   ; 54
- - - - - - 0x018C3A 06:8C2A: 04        .byte $04   ; 55
- - - - - - 0x018C3B 06:8C2B: 80        .byte $80   ; 56
- D 0 - - - 0x018C3C 06:8C2C: 02        .byte $02   ; 57
- D 0 - - - 0x018C3D 06:8C2D: 02        .byte $02   ; 58
- D 0 - - - 0x018C3E 06:8C2E: 04        .byte $04   ; 59
- D 0 - - - 0x018C3F 06:8C2F: 05        .byte $05   ; 5A
- D 0 - - - 0x018C40 06:8C30: 02        .byte $02   ; 5B
- D 0 - - - 0x018C41 06:8C31: 54        .byte $54   ; 5C



sub_8C32:
C - - - - - 0x018C42 06:8C32: BD F6 03  LDA ram_spd_X_hi_player,X
C - - - - - 0x018C45 06:8C35: 0A        ASL
C - - - - - 0x018C46 06:8C36: 7E F6 03  ROR ram_spd_X_hi_player,X
C - - - - - 0x018C49 06:8C39: 7E E8 03  ROR ram_spd_X_lo_player,X
sub_8C3C:
C - - - - - 0x018C4C 06:8C3C: BD 12 04  LDA ram_spd_Y_hi_player,X
C - - - - - 0x018C4F 06:8C3F: 0A        ASL
C - - - - - 0x018C50 06:8C40: 7E 12 04  ROR ram_spd_Y_hi_player,X
C - - - - - 0x018C53 06:8C43: 7E 04 04  ROR ram_spd_Y_lo_player,X
C - - - - - 0x018C56 06:8C46: 60        RTS



sub_8C47:
C - - - - - 0x018C57 06:8C47: BD 50 06  LDA ram_позиция_управление,X
C - - - - - 0x018C5A 06:8C4A: 10 25     BPL bra_8C71_RTS
C - - - - - 0x018C5C 06:8C4C: 8A        TXA
C - - - - - 0x018C5D 06:8C4D: 29 01     AND #$01
C - - - - - 0x018C5F 06:8C4F: A8        TAY
C - - - - - 0x018C60 06:8C50: B9 7E 06  LDA ram_067E,Y
C - - - - - 0x018C63 06:8C53: 29 10     AND #$10
C - - - - - 0x018C65 06:8C55: F0 1A     BEQ bra_8C71_RTS
C - - - - - 0x018C67 06:8C57: B9 7E 06  LDA ram_067E,Y
C - - - - - 0x018C6A 06:8C5A: 29 0F     AND #$0F
C - - - - - 0x018C6C 06:8C5C: A8        TAY
C - - - - - 0x018C6D 06:8C5D: 38        SEC
C - - - - - 0x018C6E 06:8C5E: BD 14 03  LDA ram_pos_X_lo_player,X
C - - - - - 0x018C71 06:8C61: F9 14 03  SBC ram_pos_X_lo_player,Y
C - - - - - 0x018C74 06:8C64: BD 27 03  LDA ram_pos_X_hi_player,X
C - - - - - 0x018C77 06:8C67: F9 27 03  SBC ram_pos_X_hi_player,Y
C - - - - - 0x018C7A 06:8C6A: 29 80     AND #$80
C - - - - - 0x018C7C 06:8C6C: 49 80     EOR #$80
C - - - - - 0x018C7E 06:8C6E: 9D A3 04  STA ram_направление_движения,X
bra_8C71_RTS:
C - - - - - 0x018C81 06:8C71: 60        RTS



sub_8C72:
C - - - - - 0x018C82 06:8C72: B9 E8 03  LDA ram_spd_X_lo_player,Y
C - - - - - 0x018C85 06:8C75: 9D E8 03  STA ram_spd_X_lo_player,X
C - - - - - 0x018C88 06:8C78: B9 F6 03  LDA ram_spd_X_hi_player,Y
C - - - - - 0x018C8B 06:8C7B: 9D F6 03  STA ram_spd_X_hi_player,X
C - - - - - 0x018C8E 06:8C7E: B9 04 04  LDA ram_spd_Y_lo_player,Y
C - - - - - 0x018C91 06:8C81: 9D 04 04  STA ram_spd_Y_lo_player,X
C - - - - - 0x018C94 06:8C84: B9 12 04  LDA ram_spd_Y_hi_player,Y
C - - - - - 0x018C97 06:8C87: 9D 12 04  STA ram_spd_Y_hi_player,X
C - - - - - 0x018C9A 06:8C8A: 60        RTS



sub_8C8B:
C - - - - - 0x018C9B 06:8C8B: BD 86 04  LDA ram_игрок_состояние,X
C - - - - - 0x018C9E 06:8C8E: 29 01     AND #$01
C - - - - - 0x018CA0 06:8C90: F0 07     BEQ bra_8C99
C - - - - - 0x018CA2 06:8C92: A9 43     LDA #$43
C - - - - - 0x018CA4 06:8C94: 9D 59 04  STA ram_movement_id_player,X
C - - - - - 0x018CA7 06:8C97: 68        PLA
C - - - - - 0x018CA8 06:8C98: 68        PLA
bra_8C99:
C - - - - - 0x018CA9 06:8C99: BD 59 04  LDA ram_movement_id_player,X
C - - - - - 0x018CAC 06:8C9C: 60        RTS



sub_8C9D_обработка_движения_мяча:
C - - - - - 0x018CAD 06:8C9D: BD 59 04  LDA ram_movement_id_player,X
C - - - - - 0x018CB0 06:8CA0: 0A        ASL
C - - - - - 0x018CB1 06:8CA1: A8        TAY
C - - - - - 0x018CB2 06:8CA2: B9 AF 8C  LDA tbl_8CAF,Y
C - - - - - 0x018CB5 06:8CA5: 85 2C     STA ram_002C
C - - - - - 0x018CB7 06:8CA7: B9 B0 8C  LDA tbl_8CAF + 1,Y
C - - - - - 0x018CBA 06:8CAA: 85 2D     STA ram_002D
C - - - - - 0x018CBC 06:8CAC: 6C 2C 00  JMP (ram_002C)

tbl_8CAF:
- D 0 - - - 0x018CBF 06:8CAF: E1 8C     .word _общий_RTS
- D 0 - - - 0x018CC1 06:8CB1: C8 8F     .word ofs_8FC8_01
- D 0 - - - 0x018CC3 06:8CB3: 43 8D     .word ofs_8D43_02
- D 0 - - - 0x018CC5 06:8CB5: 6A 8D     .word ofs_8D6A_03
- D 0 - - - 0x018CC7 06:8CB7: 8F 8E     .word ofs_8E8F_04
- D 0 - - - 0x018CC9 06:8CB9: E9 8E     .word ofs_8EE9_05
- D 0 - - - 0x018CCB 06:8CBB: 7B 8F     .word ofs_8F7B_06
- D 0 - - - 0x018CCD 06:8CBD: EE 8F     .word ofs_8FEE_07
- D 0 - - - 0x018CCF 06:8CBF: 5F 90     .word ofs_905F_08_отскок_мяча_от_земли
- D 0 - - - 0x018CD1 06:8CC1: DA 90     .word ofs_90DA_09
- D 0 - - - 0x018CD3 06:8CC3: 4C 92     .word ofs_924C_0A
- D 0 - - - 0x018CD5 06:8CC5: 9F 92     .word ofs_929F_0B
- D 0 - - - 0x018CD7 06:8CC7: 5A 93     .word ofs_935A_0C
- - - - - - 0x018CD9 06:8CC9: D1 93     .word ofs_93D1_0D
- - - - - - 0x018CDB 06:8CCB: 26 92     .word ofs_9226_0E
- D 0 - - - 0x018CDD 06:8CCD: 39 8D     .word ofs_8D39_0F
- D 0 - - - 0x018CDF 06:8CCF: D4 92     .word ofs_92D4_10
- D 0 - - - 0x018CE1 06:8CD1: 21 8E     .word ofs_8E21_11
- D 0 - - - 0x018CE3 06:8CD3: 50 8E     .word ofs_8E50_12
- D 0 - - - 0x018CE5 06:8CD5: 55 8D     .word ofs_8D55_13
- D 0 - - - 0x018CE7 06:8CD7: 47 91     .word ofs_9147_14_игрок_владеет_мячом_и_бьет_по_нему
- D 0 - - - 0x018CE9 06:8CD9: 8D 93     .word ofs_938D_15
- - - - - - 0x018CEB 06:8CDB: E2 8C     .word ofs_8CE2_16
- D 0 - - - 0x018CED 06:8CDD: 6B 92     .word ofs_926B_17
- - - - - - 0x018CEF 06:8CDF: 3B 90     .word ofs_903B_18



ofs_8CE2_16:
- - - - - - 0x018CF2 06:8CE2: BD 59 04  LDA ram_movement_id_player,X
- - - - - - 0x018CF5 06:8CE5: 30 0D     BMI bra_8CF4
- - - - - - 0x018CF7 06:8CE7: 20 27 99  JSR sub_9927_зафиксировать_и_очистить_анимацию_объекта
- - - - - - 0x018CFA 06:8CEA: A9 40     LDA #$40
- - - - - - 0x018CFC 06:8CEC: 8D C9 04  STA ram_timer_action_ball
- - - - - - 0x018CFF 06:8CEF: A9 05     LDA #$05
- - - - - - 0x018D01 06:8CF1: 20 9C 94  JSR sub_949C_скорость_Z_и_гравитация_мяча
bra_8CF4:
- - - - - - 0x018D04 06:8CF4: BD 2E 04  LDA ram_spd_Z_hi_player,X
- - - - - - 0x018D07 06:8CF7: 30 37     BMI bra_8D30
- - - - - - 0x018D09 06:8CF9: 18        CLC
- - - - - - 0x018D0A 06:8CFA: AD C9 04  LDA ram_timer_action_ball
- - - - - - 0x018D0D 06:8CFD: 29 FC     AND #$FC
- - - - - - 0x018D0F 06:8CFF: 7D B0 04  ADC ram_смена_угла_движения,X
- - - - - - 0x018D12 06:8D02: 9D B0 04  STA ram_смена_угла_движения,X
- - - - - - 0x018D15 06:8D05: A9 02     LDA #$02
- - - - - - 0x018D17 06:8D07: 20 D1 93  JSR sub_93D1
- - - - - - 0x018D1A 06:8D0A: 18        CLC
- - - - - - 0x018D1B 06:8D0B: AD F5 03  LDA ram_spd_X_lo_weather
- - - - - - 0x018D1E 06:8D0E: 7D E8 03  ADC ram_spd_X_lo_player,X
- - - - - - 0x018D21 06:8D11: 9D E8 03  STA ram_spd_X_lo_player,X
- - - - - - 0x018D24 06:8D14: AD 03 04  LDA ram_spd_X_hi_weather
- - - - - - 0x018D27 06:8D17: 7D F6 03  ADC ram_spd_X_hi_player,X
- - - - - - 0x018D2A 06:8D1A: 9D F6 03  STA ram_spd_X_hi_player,X
- - - - - - 0x018D2D 06:8D1D: 18        CLC
- - - - - - 0x018D2E 06:8D1E: AD 11 04  LDA ram_spd_Y_lo_weather
- - - - - - 0x018D31 06:8D21: 7D 04 04  ADC ram_spd_Y_lo_player,X
- - - - - - 0x018D34 06:8D24: 9D 04 04  STA ram_spd_Y_lo_player,X
- - - - - - 0x018D37 06:8D27: AD 1F 04  LDA ram_spd_Y_hi_weather
- - - - - - 0x018D3A 06:8D2A: 7D 12 04  ADC ram_spd_Y_hi_player,X
- - - - - - 0x018D3D 06:8D2D: 9D 12 04  STA ram_spd_Y_hi_player,X
bra_8D30:
- - - - - - 0x018D40 06:8D30: 20 42 96  JSR sub_9642
- - - - - - 0x018D43 06:8D33: 20 95 9B  JSR sub_9B95
- - - - - - 0x018D46 06:8D36: 4C 97 8F  JMP loc_8F97



ofs_8D39_0F:
C - - J - - 0x018D49 06:8D39: A9 02     LDA #$02
C - - - - - 0x018D4B 06:8D3B: 9D 59 04  STA ram_movement_id_player,X
C - - - - - 0x018D4E 06:8D3E: A9 00     LDA #$00
C - - - - - 0x018D50 06:8D40: 8D 25 05  STA ram_timer_electric_ball
ofs_8D43_02:
C - - - - - 0x018D53 06:8D43: BD 59 04  LDA ram_movement_id_player,X
C - - - - - 0x018D56 06:8D46: 30 06     BMI bra_8D4E
C - - - - - 0x018D58 06:8D48: 20 27 99  JSR sub_9927_зафиксировать_и_очистить_анимацию_объекта
C - - - - - 0x018D5B 06:8D4B: 20 56 98  JSR sub_9856
bra_8D4E:
C - - - - - 0x018D5E 06:8D4E: 20 8F C2  JSR sub_0x01C29F_положение_мяча_относительно_игрока
C - - - - - 0x018D61 06:8D51: 20 42 96  JSR sub_9642
C - - - - - 0x018D64 06:8D54: 60        RTS



ofs_8D55_13:
C - - J - - 0x018D65 06:8D55: BD 59 04  LDA ram_movement_id_player,X
C - - - - - 0x018D68 06:8D58: 30 06     BMI bra_8D60
C - - - - - 0x018D6A 06:8D5A: 20 27 99  JSR sub_9927_зафиксировать_и_очистить_анимацию_объекта
C - - - - - 0x018D6D 06:8D5D: 20 56 98  JSR sub_9856
bra_8D60:
C - - - - - 0x018D70 06:8D60: 20 94 C2  JSR sub_0x01C2A4
C - - - - - 0x018D73 06:8D63: BD A3 04  LDA ram_направление_движения,X
C - - - - - 0x018D76 06:8D66: 9D 74 00  STA ram_animation_id_player,X
C - - - - - 0x018D79 06:8D69: 60        RTS



ofs_8D6A_03:
C - - J - - 0x018D7A 06:8D6A: BD 59 04  LDA ram_movement_id_player,X
C - - - - - 0x018D7D 06:8D6D: 30 03     BMI bra_8D72
C - - - - - 0x018D7F 06:8D6F: 20 27 99  JSR sub_9927_зафиксировать_и_очистить_анимацию_объекта
bra_8D72:
C - - - - - 0x018D82 06:8D72: 20 7B 97  JSR sub_977B
C - - - - - 0x018D85 06:8D75: 20 B1 97  JSR sub_97B1
C - - - - - 0x018D88 06:8D78: BD 86 03  LDA ram_pos_Z_lo_player,X
C - - - - - 0x018D8B 06:8D7B: 8D 13 05  STA ram_0513
C - - - - - 0x018D8E 06:8D7E: BD 99 03  LDA ram_pos_Z_hi_player,X
C - - - - - 0x018D91 06:8D81: 8D 14 05  STA ram_0514
C - - - - - 0x018D94 06:8D84: 20 8F C2  JSR sub_0x01C29F_положение_мяча_относительно_игрока
C - - - - - 0x018D97 06:8D87: A9 00     LDA #$00
C - - - - - 0x018D99 06:8D89: 9D 20 04  STA ram_spd_Z_lo_player,X
C - - - - - 0x018D9C 06:8D8C: 9D 2E 04  STA ram_spd_Z_hi_player,X
C - - - - - 0x018D9F 06:8D8F: BD 99 03  LDA ram_pos_Z_hi_player,X
C - - - - - 0x018DA2 06:8D92: 10 19     BPL bra_8DAD
- - - - - - 0x018DA4 06:8D94: AD 13 05  LDA ram_0513
- - - - - - 0x018DA7 06:8D97: 10 0C     BPL bra_8DA5
- - - - - - 0x018DA9 06:8D99: 9D 86 03  STA ram_pos_Z_lo_player,X
- - - - - - 0x018DAC 06:8D9C: AD 14 05  LDA ram_0514
- - - - - - 0x018DAF 06:8D9F: 9D 99 03  STA ram_pos_Z_hi_player,X
- - - - - - 0x018DB2 06:8DA2: 4C AD 8D  JMP loc_8DAD
bra_8DA5:
- - - - - - 0x018DB5 06:8DA5: A9 00     LDA #$00
- - - - - - 0x018DB7 06:8DA7: 9D 86 03  STA ram_pos_Z_lo_player,X
- - - - - - 0x018DBA 06:8DAA: 9D 99 03  STA ram_pos_Z_hi_player,X
bra_8DAD:
loc_8DAD:
C - - - - - 0x018DBD 06:8DAD: A9 00     LDA #$00
C - - - - - 0x018DBF 06:8DAF: 85 2C     STA ram_002C
C - - - - - 0x018DC1 06:8DB1: 85 2D     STA ram_002D
C - - - - - 0x018DC3 06:8DB3: AC D6 04  LDY ram_игрок_с_мячом
C - - - - - 0x018DC6 06:8DB6: B9 86 04  LDA ram_игрок_состояние,Y
C - - - - - 0x018DC9 06:8DB9: 30 29     BMI bra_8DE4
C - - - - - 0x018DCB 06:8DBB: B9 59 04  LDA ram_movement_id_player,Y
C - - - - - 0x018DCE 06:8DBE: 29 7F     AND #$7F
C - - - - - 0x018DD0 06:8DC0: C9 20     CMP #$20
C - - - - - 0x018DD2 06:8DC2: 90 20     BCC bra_8DE4
C - - - - - 0x018DD4 06:8DC4: C9 20     CMP #$20
C - - - - - 0x018DD6 06:8DC6: F0 1C     BEQ bra_8DE4
C - - - - - 0x018DD8 06:8DC8: C9 0F     CMP #$0F
C - - - - - 0x018DDA 06:8DCA: F0 18     BEQ bra_8DE4
C - - - - - 0x018DDC 06:8DCC: C9 2F     CMP #$2F
C - - - - - 0x018DDE 06:8DCE: F0 14     BEQ bra_8DE4
C - - - - - 0x018DE0 06:8DD0: BD 99 03  LDA ram_pos_Z_hi_player,X
C - - - - - 0x018DE3 06:8DD3: 30 0F     BMI bra_8DE4
C - - - - - 0x018DE5 06:8DD5: AD 00 03  LDA ram_frame_cnt
C - - - - - 0x018DE8 06:8DD8: 29 07     AND #$07
C - - - - - 0x018DEA 06:8DDA: 4A        LSR
C - - - - - 0x018DEB 06:8DDB: 85 2C     STA ram_002C
C - - - - - 0x018DED 06:8DDD: D0 05     BNE bra_8DE4
C - - - - - 0x018DEF 06:8DDF: A9 24     LDA #con_sfx_run_w_ball
C - - - - - 0x018DF1 06:8DE1: 20 E4 C2  JSR sub_0x01C2F4_play_sound
bra_8DE4:
C - - - - - 0x018DF4 06:8DE4: BD A3 04  LDA ram_направление_движения,X
C - - - - - 0x018DF7 06:8DE7: 10 0C     BPL bra_8DF5
C - - - - - 0x018DF9 06:8DE9: A5 2C     LDA ram_002C
C - - - - - 0x018DFB 06:8DEB: F0 08     BEQ bra_8DF5
C - - - - - 0x018DFD 06:8DED: 49 FF     EOR #$FF
C - - - - - 0x018DFF 06:8DEF: 85 2C     STA ram_002C
C - - - - - 0x018E01 06:8DF1: E6 2C     INC ram_002C
C - - - - - 0x018E03 06:8DF3: C6 2D     DEC ram_002D
bra_8DF5:
C - - - - - 0x018E05 06:8DF5: 18        CLC
C - - - - - 0x018E06 06:8DF6: A5 2C     LDA ram_002C
C - - - - - 0x018E08 06:8DF8: 7D 14 03  ADC ram_pos_X_lo_player,X
C - - - - - 0x018E0B 06:8DFB: 9D 14 03  STA ram_pos_X_lo_player,X
C - - - - - 0x018E0E 06:8DFE: A5 2D     LDA ram_002D
C - - - - - 0x018E10 06:8E00: 7D 27 03  ADC ram_pos_X_hi_player,X
C - - - - - 0x018E13 06:8E03: 9D 27 03  STA ram_pos_X_hi_player,X
C - - - - - 0x018E16 06:8E06: BD 30 01  LDA ram_surface_player,X
C - - - - - 0x018E19 06:8E09: C9 02     CMP #con_НА_ГРЯЗИ
C - - - - - 0x018E1B 06:8E0B: F0 10     BEQ bra_8E1D
C - - - - - 0x018E1D 06:8E0D: BD 99 03  LDA ram_pos_Z_hi_player,X
C - - - - - 0x018E20 06:8E10: 10 0B     BPL bra_8E1D
- - - - - - 0x018E22 06:8E12: A9 00     LDA #$00
- - - - - - 0x018E24 06:8E14: 9D 73 03  STA ram_pos_Z_sub_player,X
- - - - - - 0x018E27 06:8E17: 9D 86 03  STA ram_pos_Z_lo_player,X
- - - - - - 0x018E2A 06:8E1A: 9D 99 03  STA ram_pos_Z_hi_player,X
bra_8E1D:
C - - - - - 0x018E2D 06:8E1D: 20 42 96  JSR sub_9642
C - - - - - 0x018E30 06:8E20: 60        RTS



ofs_8E21_11:
C - - J - - 0x018E31 06:8E21: BD 59 04  LDA ram_movement_id_player,X
C - - - - - 0x018E34 06:8E24: 30 03     BMI bra_8E29
C - - - - - 0x018E36 06:8E26: 20 27 99  JSR sub_9927_зафиксировать_и_очистить_анимацию_объекта
bra_8E29:
C - - - - - 0x018E39 06:8E29: 20 2F 97  JSR sub_972F
C - - - - - 0x018E3C 06:8E2C: BD 99 03  LDA ram_pos_Z_hi_player,X
C - - - - - 0x018E3F 06:8E2F: 30 11     BMI bra_8E42
C - - - - - 0x018E41 06:8E31: A9 00     LDA #$00
C - - - - - 0x018E43 06:8E33: 9D 99 03  STA ram_pos_Z_hi_player,X
C - - - - - 0x018E46 06:8E36: 9D 86 03  STA ram_pos_Z_lo_player,X
C - - - - - 0x018E49 06:8E39: 9D 73 03  STA ram_pos_Z_sub_player,X
C - - - - - 0x018E4C 06:8E3C: 9D 2E 04  STA ram_spd_Z_hi_player,X
C - - - - - 0x018E4F 06:8E3F: 9D 20 04  STA ram_spd_Z_lo_player,X
bra_8E42:
C - - - - - 0x018E52 06:8E42: B9 86 04  LDA ram_игрок_состояние,Y
C - - - - - 0x018E55 06:8E45: 10 05     BPL bra_8E4C
C - - - - - 0x018E57 06:8E47: A9 01     LDA #$01
C - - - - - 0x018E59 06:8E49: 8D 85 04  STA ram_мяч_тип_удара
bra_8E4C:
C - - - - - 0x018E5C 06:8E4C: 20 42 96  JSR sub_9642
C - - - - - 0x018E5F 06:8E4F: 60        RTS



ofs_8E50_12:
C - - J - - 0x018E60 06:8E50: BD 59 04  LDA ram_movement_id_player,X
C - - - - - 0x018E63 06:8E53: 30 03     BMI bra_8E58
C - - - - - 0x018E65 06:8E55: 20 27 99  JSR sub_9927_зафиксировать_и_очистить_анимацию_объекта
bra_8E58:
C - - - - - 0x018E68 06:8E58: 20 2F 97  JSR sub_972F
C - - - - - 0x018E6B 06:8E5B: A9 04     LDA #$04
C - - - - - 0x018E6D 06:8E5D: 9D 74 00  STA ram_animation_id_player,X
C - - - - - 0x018E70 06:8E60: AD 0D 05  LDA ram_timer_wet_ball
C - - - - - 0x018E73 06:8E63: F0 14     BEQ bra_8E79
C - - - - - 0x018E75 06:8E65: FE 87 00  INC ram_animation_timer_player,X
C - - - - - 0x018E78 06:8E68: BD 87 00  LDA ram_animation_timer_player,X
C - - - - - 0x018E7B 06:8E6B: C9 04     CMP #$04
C - - - - - 0x018E7D 06:8E6D: B0 05     BCS bra_8E74
C - - - - - 0x018E7F 06:8E6F: A9 05     LDA #$05
C - - - - - 0x018E81 06:8E71: 9D 74 00  STA ram_animation_id_player,X
bra_8E74:
C - - - - - 0x018E84 06:8E74: A9 00     LDA #$00
C - - - - - 0x018E86 06:8E76: 8D 0D 05  STA ram_timer_wet_ball
bra_8E79:
C - - - - - 0x018E89 06:8E79: B9 59 04  LDA ram_movement_id_player,Y
C - - - - - 0x018E8C 06:8E7C: 10 10     BPL bra_8E8E_RTS
C - - - - - 0x018E8E 06:8E7E: 29 7F     AND #$7F
C - - - - - 0x018E90 06:8E80: C9 02     CMP #$02
C - - - - - 0x018E92 06:8E82: F0 0A     BEQ bra_8E8E_RTS
C - - - - - 0x018E94 06:8E84: A9 11     LDA #$11
C - - - - - 0x018E96 06:8E86: 8D 65 04  STA ram_movement_id_ball
C - - - - - 0x018E99 06:8E89: A9 00     LDA #$00
C - - - - - 0x018E9B 06:8E8B: 9D 74 00  STA ram_animation_id_player,X
bra_8E8E_RTS:
C - - - - - 0x018E9E 06:8E8E: 60        RTS



ofs_8E8F_04:
C - - J - - 0x018E9F 06:8E8F: BD 59 04  LDA ram_movement_id_player,X
C - - - - - 0x018EA2 06:8E92: 30 2B     BMI bra_8EBF
C - - - - - 0x018EA4 06:8E94: 20 27 99  JSR sub_9927_зафиксировать_и_очистить_анимацию_объекта
C - - - - - 0x018EA7 06:8E97: AC D6 04  LDY ram_игрок_с_мячом
C - - - - - 0x018EAA 06:8E9A: B9 A3 04  LDA ram_направление_движения,Y
C - - - - - 0x018EAD 06:8E9D: 9D A3 04  STA ram_направление_движения,X
C - - - - - 0x018EB0 06:8EA0: B9 B0 04  LDA ram_смена_угла_движения,Y
C - - - - - 0x018EB3 06:8EA3: 9D B0 04  STA ram_смена_угла_движения,X
C - - - - - 0x018EB6 06:8EA6: BD 99 03  LDA ram_pos_Z_hi_player,X
C - - - - - 0x018EB9 06:8EA9: 10 08     BPL bra_8EB3
- - - - - - 0x018EBB 06:8EAB: A9 00     LDA #$00
- - - - - - 0x018EBD 06:8EAD: 9D 86 03  STA ram_pos_Z_lo_player,X
- - - - - - 0x018EC0 06:8EB0: 9D 99 03  STA ram_pos_Z_hi_player,X
bra_8EB3:
C - - - - - 0x018EC3 06:8EB3: 20 C9 9C  JSR sub_9CC9_очистить_скорости_объекта
C - - - - - 0x018EC6 06:8EB6: 20 FA A2  JSR sub_A2FA
C - - - - - 0x018EC9 06:8EB9: A5 2B     LDA ram_002B
C - - - - - 0x018ECB 06:8EBB: C9 10     CMP #$10
C - - - - - 0x018ECD 06:8EBD: F0 16     BEQ bra_8ED5
bra_8EBF:
C - - - - - 0x018ECF 06:8EBF: 20 42 96  JSR sub_9642
C - - - - - 0x018ED2 06:8EC2: 20 95 9B  JSR sub_9B95
C - - - - - 0x018ED5 06:8EC5: 20 75 94  JSR sub_9475
C - - - - - 0x018ED8 06:8EC8: BD 2E 04  LDA ram_spd_Z_hi_player,X
C - - - - - 0x018EDB 06:8ECB: 10 05     BPL bra_8ED2
C - - - - - 0x018EDD 06:8ECD: A9 06     LDA #$06
C - - - - - 0x018EDF 06:8ECF: 9D 59 04  STA ram_movement_id_player,X
bra_8ED2:
C - - - - - 0x018EE2 06:8ED2: 4C 97 8F  JMP loc_8F97
bra_8ED5:
C - - - - - 0x018EE5 06:8ED5: 20 42 96  JSR sub_9642
C - - - - - 0x018EE8 06:8ED8: 20 95 9B  JSR sub_9B95
C - - - - - 0x018EEB 06:8EDB: A9 00     LDA #$00
C - - - - - 0x018EED 06:8EDD: 9D 20 04  STA ram_spd_Z_lo_player,X
C - - - - - 0x018EF0 06:8EE0: 9D 2E 04  STA ram_spd_Z_hi_player,X
C - - - - - 0x018EF3 06:8EE3: A9 07     LDA #$07
C - - - - - 0x018EF5 06:8EE5: 9D 59 04  STA ram_movement_id_player,X
C - - - - - 0x018EF8 06:8EE8: 60        RTS



ofs_8EE9_05:
C - - J - - 0x018EF9 06:8EE9: BD 59 04  LDA ram_movement_id_player,X
C - - - - - 0x018EFC 06:8EEC: 30 06     BMI bra_8EF4
C - - - - - 0x018EFE 06:8EEE: 20 27 99  JSR sub_9927_зафиксировать_и_очистить_анимацию_объекта
C - - - - - 0x018F01 06:8EF1: 20 BC C2  JSR sub_0x01C2CC
bra_8EF4:
C - - - - - 0x018F04 06:8EF4: AD 0F 05  LDA ram_номер_супера
C - - - - - 0x018F07 06:8EF7: 30 11     BMI bra_8F0A
C - - - - - 0x018F09 06:8EF9: 09 80     ORA #$80
C - - - - - 0x018F0B 06:8EFB: 8D 0F 05  STA ram_номер_супера
C - - - - - 0x018F0E 06:8EFE: 20 C1 C2  JSR sub_0x01C2D1
C - - - - - 0x018F11 06:8F01: 20 C9 9C  JSR sub_9CC9_очистить_скорости_объекта
C - - - - - 0x018F14 06:8F04: 20 C6 C2  JSR sub_0x01C2D6
C - - - - - 0x018F17 06:8F07: 20 D3 98  JSR sub_98D3_начальная_Z_скорость_мяча
bra_8F0A:
C - - - - - 0x018F1A 06:8F0A: 24 5C     BIT ram_flag_gameplay
C - - - - - 0x018F1C 06:8F0C: 50 03     BVC bra_8F11
C - - - - - 0x018F1E 06:8F0E: 20 56 98  JSR sub_9856
bra_8F11:
C - - - - - 0x018F21 06:8F11: 20 B7 C2  JSR sub_0x01C2C7
C - - - - - 0x018F24 06:8F14: 20 29 9D  JSR sub_9D29
C - - - - - 0x018F27 06:8F17: 20 DA 96  JSR sub_96DA
C - - - - - 0x018F2A 06:8F1A: 20 95 9B  JSR sub_9B95
C - - - - - 0x018F2D 06:8F1D: 20 75 94  JSR sub_9475
C - - - - - 0x018F30 06:8F20: AD 10 05  LDA ram_подтип_супера
C - - - - - 0x018F33 06:8F23: C9 03     CMP #$03
C - - - - - 0x018F35 06:8F25: F0 03     BEQ bra_8F2A
C - - - - - 0x018F37 06:8F27: 20 87 A1  JSR sub_A187_ограничение_максимальной_скорости
bra_8F2A:
C - - - - - 0x018F3A 06:8F2A: 20 D3 B1  JSR sub_B1D3
C - - - - - 0x018F3D 06:8F2D: AD C9 04  LDA ram_timer_action_ball
C - - - - - 0x018F40 06:8F30: D0 18     BNE bra_8F4A
C - - - - - 0x018F42 06:8F32: 20 CB C2  JSR sub_0x01C2DB
C - - - - - 0x018F45 06:8F35: AD F0 04  LDA ram_hp_ball
C - - - - - 0x018F48 06:8F38: 0D 10 05  ORA ram_подтип_супера
C - - - - - 0x018F4B 06:8F3B: D0 0D     BNE bra_8F4A
C - - - - - 0x018F4D 06:8F3D: BD 59 04  LDA ram_movement_id_player,X
C - - - - - 0x018F50 06:8F40: 10 08     BPL bra_8F4A
C - - - - - 0x018F52 06:8F42: A9 06     LDA #$06
C - - - - - 0x018F54 06:8F44: 9D 59 04  STA ram_movement_id_player,X
C - - - - - 0x018F57 06:8F47: 4C 97 8F  JMP loc_8F97
bra_8F4A:
C - - - - - 0x018F5A 06:8F4A: 20 7B 97  JSR sub_977B
C - - - - - 0x018F5D 06:8F4D: BD 99 03  LDA ram_pos_Z_hi_player,X
C - - - - - 0x018F60 06:8F50: 10 28     BPL bra_8F7A_RTS
C - - - - - 0x018F62 06:8F52: A9 00     LDA #$00
C - - - - - 0x018F64 06:8F54: 9D 86 03  STA ram_pos_Z_lo_player,X
C - - - - - 0x018F67 06:8F57: 9D 99 03  STA ram_pos_Z_hi_player,X
C - - - - - 0x018F6A 06:8F5A: 20 CB C2  JSR sub_0x01C2DB
C - - - - - 0x018F6D 06:8F5D: A9 3E     LDA #con_sfx_bounce_from_ground_special
C - - - - - 0x018F6F 06:8F5F: 20 E4 C2  JSR sub_0x01C2F4_play_sound
C - - - - - 0x018F72 06:8F62: BD 30 01  LDA ram_surface_player,X
C - - - - - 0x018F75 06:8F65: C9 02     CMP #$02
C - - - - - 0x018F77 06:8F67: 90 11     BCC bra_8F7A_RTS    ; если на траве или луже
- - - - - - 0x018F79 06:8F69: AD 0F 05  LDA ram_номер_супера
- - - - - - 0x018F7C 06:8F6C: C9 03     CMP #$03
- - - - - - 0x018F7E 06:8F6E: D0 0A     BNE bra_8F7A_RTS
- - - - - - 0x018F80 06:8F70: A9 04     LDA #$04
- - - - - - 0x018F82 06:8F72: 8D 10 05  STA ram_подтип_супера
- - - - - - 0x018F85 06:8F75: A9 10     LDA #$10
- - - - - - 0x018F87 06:8F77: 8D 0F 05  STA ram_номер_супера
bra_8F7A_RTS:
C - - - - - 0x018F8A 06:8F7A: 60        RTS



ofs_8F7B_06:
C - - J - - 0x018F8B 06:8F7B: BD 59 04  LDA ram_movement_id_player,X
C - - - - - 0x018F8E 06:8F7E: 30 03     BMI bra_8F83
C - - - - - 0x018F90 06:8F80: 20 27 99  JSR sub_9927_зафиксировать_и_очистить_анимацию_объекта
bra_8F83:
C - - - - - 0x018F93 06:8F83: 20 42 96  JSR sub_9642
C - - - - - 0x018F96 06:8F86: 20 95 9B  JSR sub_9B95
C - - - - - 0x018F99 06:8F89: 20 75 94  JSR sub_9475
C - - - - - 0x018F9C 06:8F8C: 20 D3 B1  JSR sub_B1D3
C - - - - - 0x018F9F 06:8F8F: BD 99 03  LDA ram_pos_Z_hi_player,X
C - - - - - 0x018FA2 06:8F92: 10 03     BPL bra_8F97
C - - - - - 0x018FA4 06:8F94: 20 7B 97  JSR sub_977B
bra_8F97:
loc_8F97:
C D 0 - - - 0x018FA7 06:8F97: BD 99 03  LDA ram_pos_Z_hi_player,X
C - - - - - 0x018FAA 06:8F9A: 10 29     BPL bra_8FC5_RTS
C - - - - - 0x018FAC 06:8F9C: 20 7B 97  JSR sub_977B
C - - - - - 0x018FAF 06:8F9F: 20 B1 97  JSR sub_97B1
C - - - - - 0x018FB2 06:8FA2: A0 00     LDY #$00
C - - - - - 0x018FB4 06:8FA4: BD 30 01  LDA ram_surface_player,X
C - - - - - 0x018FB7 06:8FA7: C9 02     CMP #$02
C - - - - - 0x018FB9 06:8FA9: 90 07     BCC bra_8FB2_на_траве_или_луже
C - - - - - 0x018FBB 06:8FAB: 20 3F 98  JSR sub_983F
C - - - - - 0x018FBE 06:8FAE: C8        INY
C - - - - - 0x018FBF 06:8FAF: 4C BA 8F  JMP loc_8FBA
bra_8FB2_на_траве_или_луже:
C - - - - - 0x018FC2 06:8FB2: A9 00     LDA #$00
C - - - - - 0x018FC4 06:8FB4: 9D 86 03  STA ram_pos_Z_lo_player,X
C - - - - - 0x018FC7 06:8FB7: 9D 99 03  STA ram_pos_Z_hi_player,X
loc_8FBA:
C D 0 - - - 0x018FCA 06:8FBA: BD 59 04  LDA ram_movement_id_player,X
C - - - - - 0x018FCD 06:8FBD: 10 06     BPL bra_8FC5_RTS
C - - - - - 0x018FCF 06:8FBF: B9 C6 8F  LDA tbl_8FC6,Y
C - - - - - 0x018FD2 06:8FC2: 9D 59 04  STA ram_movement_id_player,X
bra_8FC5_RTS:
C - - - - - 0x018FD5 06:8FC5: 60        RTS

tbl_8FC6:
- D 0 - - - 0x018FD6 06:8FC6: 08        .byte $08   ; 
- D 0 - - - 0x018FD7 06:8FC7: 01        .byte $01   ; 



ofs_8FC8_01:
C - - J - - 0x018FD8 06:8FC8: BD 59 04  LDA ram_movement_id_player,X
C - - - - - 0x018FDB 06:8FCB: 30 14     BMI bra_8FE1
C - - - - - 0x018FDD 06:8FCD: 20 27 99  JSR sub_9927_зафиксировать_и_очистить_анимацию_объекта
C - - - - - 0x018FE0 06:8FD0: 20 56 98  JSR sub_9856
C - - - - - 0x018FE3 06:8FD3: A9 00     LDA #$00
C - - - - - 0x018FE5 06:8FD5: 9D 2E 04  STA ram_spd_Z_hi_player,X
C - - - - - 0x018FE8 06:8FD8: 9D 20 04  STA ram_spd_Z_lo_player,X
C - - - - - 0x018FEB 06:8FDB: 9D 4A 04  STA ram_gravity_hi_player,X
C - - - - - 0x018FEE 06:8FDE: 9D 3C 04  STA ram_gravity_lo_player,X
bra_8FE1:
C - - - - - 0x018FF1 06:8FE1: BD 30 01  LDA ram_surface_player,X
C - - - - - 0x018FF4 06:8FE4: C9 02     CMP #$02
C - - - - - 0x018FF6 06:8FE6: 90 27     BCC bra_900F    ; если на траве или луже
C - - - - - 0x018FF8 06:8FE8: 20 C9 9C  JSR sub_9CC9_очистить_скорости_объекта
C - - - - - 0x018FFB 06:8FEB: 4C 26 90  JMP loc_9026



ofs_8FEE_07:
C - - J - - 0x018FFE 06:8FEE: BD 59 04  LDA ram_movement_id_player,X
C - - - - - 0x019001 06:8FF1: 30 1C     BMI bra_900F
C - - - - - 0x019003 06:8FF3: 20 27 99  JSR sub_9927_зафиксировать_и_очистить_анимацию_объекта
C - - - - - 0x019006 06:8FF6: 20 56 98  JSR sub_9856
C - - - - - 0x019009 06:8FF9: BD 74 00  LDA ram_animation_id_player,X
C - - - - - 0x01900C 06:8FFC: 29 83     AND #$83
C - - - - - 0x01900E 06:8FFE: 9D 74 00  STA ram_animation_id_player,X
C - - - - - 0x019011 06:9001: A9 00     LDA #$00
C - - - - - 0x019013 06:9003: 9D 2E 04  STA ram_spd_Z_hi_player,X
C - - - - - 0x019016 06:9006: 9D 20 04  STA ram_spd_Z_lo_player,X
C - - - - - 0x019019 06:9009: 9D 4A 04  STA ram_gravity_hi_player,X
C - - - - - 0x01901C 06:900C: 9D 3C 04  STA ram_gravity_lo_player,X
bra_900F:
C - - - - - 0x01901F 06:900F: BD F6 03  LDA ram_spd_X_hi_player,X
C - - - - - 0x019022 06:9012: 10 02     BPL bra_9016
C - - - - - 0x019024 06:9014: 49 FF     EOR #$FF
bra_9016:
C - - - - - 0x019026 06:9016: D0 0E     BNE bra_9026
C - - - - - 0x019028 06:9018: BD 12 04  LDA ram_spd_Y_hi_player,X
C - - - - - 0x01902B 06:901B: 10 02     BPL bra_901F
C - - - - - 0x01902D 06:901D: 49 FF     EOR #$FF
bra_901F:
C - - - - - 0x01902F 06:901F: D0 05     BNE bra_9026
C - - - - - 0x019031 06:9021: A9 00     LDA #$00
C - - - - - 0x019033 06:9023: 20 D9 94  JSR sub_94D9
bra_9026:
loc_9026:
C D 0 - - - 0x019036 06:9026: 20 7B 97  JSR sub_977B
C - - - - - 0x019039 06:9029: 20 B1 97  JSR sub_97B1
C - - - - - 0x01903C 06:902C: A9 00     LDA #$00
C - - - - - 0x01903E 06:902E: 20 D9 94  JSR sub_94D9
C - - - - - 0x019041 06:9031: 20 95 9B  JSR sub_9B95
C - - - - - 0x019044 06:9034: 20 42 96  JSR sub_9642
C - - - - - 0x019047 06:9037: 20 D3 B1  JSR sub_B1D3
C - - - - - 0x01904A 06:903A: 60        RTS



ofs_903B_18:
- - - - - - 0x01904B 06:903B: BD 59 04  LDA ram_movement_id_player,X
- - - - - - 0x01904E 06:903E: 30 03     BMI bra_9043
- - - - - - 0x019050 06:9040: 20 27 99  JSR sub_9927_зафиксировать_и_очистить_анимацию_объекта
bra_9043:
- - - - - - 0x019053 06:9043: A9 00     LDA #$00
- - - - - - 0x019055 06:9045: 9D B0 04  STA ram_смена_угла_движения,X
- - - - - - 0x019058 06:9048: 20 C9 9C  JSR sub_9CC9_очистить_скорости_объекта
- - - - - - 0x01905B 06:904B: A9 08     LDA #$08
- - - - - - 0x01905D 06:904D: 20 D1 93  JSR sub_93D1
- - - - - - 0x019060 06:9050: 20 95 9B  JSR sub_9B95
- - - - - - 0x019063 06:9053: 20 42 96  JSR sub_9642
- - - - - - 0x019066 06:9056: 20 D3 B1  JSR sub_B1D3
- - - - - - 0x019069 06:9059: A9 07     LDA #$07
- - - - - - 0x01906B 06:905B: 8D 65 04  STA ram_movement_id_ball
- - - - - - 0x01906E 06:905E: 60        RTS



ofs_905F_08_отскок_мяча_от_земли:
C - - J - - 0x01906F 06:905F: BD 59 04  LDA ram_movement_id_player,X
C - - - - - 0x019072 06:9062: 30 0D     BMI bra_9071
C - - - - - 0x019074 06:9064: 20 27 99  JSR sub_9927_зафиксировать_и_очистить_анимацию_объекта
C - - - - - 0x019077 06:9067: A9 3D     LDA #con_sfx_bounce_from_ground_ball
C - - - - - 0x019079 06:9069: 20 E4 C2  JSR sub_0x01C2F4_play_sound
C - - - - - 0x01907C 06:906C: A9 01     LDA #$01
C - - - - - 0x01907E 06:906E: 20 D9 94  JSR sub_94D9
bra_9071:
C - - - - - 0x019081 06:9071: AD 3C 01  LDA ram_surface_ball
C - - - - - 0x019084 06:9074: 0A        ASL
C - - - - - 0x019085 06:9075: 0A        ASL
C - - - - - 0x019086 06:9076: A8        TAY
C - - - - - 0x019087 06:9077: AD 0D 05  LDA ram_timer_wet_ball
C - - - - - 0x01908A 06:907A: 10 07     BPL bra_9083_не_максимально_мокрый
C - - - - - 0x01908C 06:907C: A9 06     LDA #$06
C - - - - - 0x01908E 06:907E: 9D 74 00  STA ram_animation_id_player,X
C - - - - - 0x019091 06:9081: C8        INY
C - - - - - 0x019092 06:9082: C8        INY
bra_9083_не_максимально_мокрый:
C - - - - - 0x019093 06:9083: 38        SEC
C - - - - - 0x019094 06:9084: 7E 2E 04  ROR ram_spd_Z_hi_player,X
C - - - - - 0x019097 06:9087: 7E 20 04  ROR ram_spd_Z_lo_player,X
C - - - - - 0x01909A 06:908A: 38        SEC
C - - - - - 0x01909B 06:908B: BD 20 04  LDA ram_spd_Z_lo_player,X
C - - - - - 0x01909E 06:908E: 49 FF     EOR #$FF
C - - - - - 0x0190A0 06:9090: F9 CA 90  SBC tbl_90CA_Z_скорость,Y
C - - - - - 0x0190A3 06:9093: 9D 20 04  STA ram_spd_Z_lo_player,X
C - - - - - 0x0190A6 06:9096: BD 2E 04  LDA ram_spd_Z_hi_player,X
C - - - - - 0x0190A9 06:9099: 49 FF     EOR #$FF
C - - - - - 0x0190AB 06:909B: F9 CB 90  SBC tbl_90CA_Z_скорость + 1,Y
C - - - - - 0x0190AE 06:909E: 9D 2E 04  STA ram_spd_Z_hi_player,X
C - - - - - 0x0190B1 06:90A1: B0 10     BCS bra_90B3
C - - - - - 0x0190B3 06:90A3: A9 00     LDA #$00
C - - - - - 0x0190B5 06:90A5: 9D 20 04  STA ram_spd_Z_lo_player,X
C - - - - - 0x0190B8 06:90A8: 9D 2E 04  STA ram_spd_Z_hi_player,X
C - - - - - 0x0190BB 06:90AB: A9 07     LDA #$07
C - - - - - 0x0190BD 06:90AD: 9D 59 04  STA ram_movement_id_player,X
C - - - - - 0x0190C0 06:90B0: 4C C6 90  JMP loc_90C6
bra_90B3:
C - - - - - 0x0190C3 06:90B3: BD 59 04  LDA ram_movement_id_player,X
C - - - - - 0x0190C6 06:90B6: 10 0E     BPL bra_90C6
C - - - - - 0x0190C8 06:90B8: 20 D3 98  JSR sub_98D3_начальная_Z_скорость_мяча
C - - - - - 0x0190CB 06:90BB: 20 95 9B  JSR sub_9B95
C - - - - - 0x0190CE 06:90BE: 20 56 98  JSR sub_9856
C - - - - - 0x0190D1 06:90C1: A9 06     LDA #$06
C - - - - - 0x0190D3 06:90C3: 9D 59 04  STA ram_movement_id_player,X
bra_90C6:
loc_90C6:
C D 0 - - - 0x0190D6 06:90C6: 20 D3 B1  JSR sub_B1D3
C - - - - - 0x0190D9 06:90C9: 60        RTS

tbl_90CA_Z_скорость:
; 00 на траве
- D 0 - - - 0x0190DA 06:90CA: 00 01     .word $0100
- D 0 - - - 0x0190DC 06:90CC: 00 02     .word $0200
; 01 на луже
- D 0 - - - 0x0190DE 06:90CE: 00 02     .word $0200
- - - - - - 0x0190E0 06:90D0: 00 04     .word $0400
; 02 на грязи
- - - - - - 0x0190E2 06:90D2: 00 08     .word $0800
- - - - - - 0x0190E4 06:90D4: 00 10     .word $1000
; 03 на песке
- - - - - - 0x0190E6 06:90D6: 00 08     .word $0800
- - - - - - 0x0190E8 06:90D8: 00 10     .word $1000



ofs_90DA_09:
C - - J - - 0x0190EA 06:90DA: BD 59 04  LDA ram_movement_id_player,X
C - - - - - 0x0190ED 06:90DD: 30 1D     BMI bra_90FC
C - - - - - 0x0190EF 06:90DF: 20 27 99  JSR sub_9927_зафиксировать_и_очистить_анимацию_объекта
C - - - - - 0x0190F2 06:90E2: AC D6 04  LDY ram_игрок_с_мячом
C - - - - - 0x0190F5 06:90E5: 18        CLC
C - - - - - 0x0190F6 06:90E6: B9 20 04  LDA ram_spd_Z_lo_player,Y
C - - - - - 0x0190F9 06:90E9: 69 80     ADC #$80
C - - - - - 0x0190FB 06:90EB: 9D 20 04  STA ram_spd_Z_lo_player,X
C - - - - - 0x0190FE 06:90EE: B9 2E 04  LDA ram_spd_Z_hi_player,Y
C - - - - - 0x019101 06:90F1: 69 00     ADC #$00
C - - - - - 0x019103 06:90F3: 9D 2E 04  STA ram_spd_Z_hi_player,X
C - - - - - 0x019106 06:90F6: 20 B2 94  JSR sub_94B2_гравитация_мяча
C - - - - - 0x019109 06:90F9: 20 56 98  JSR sub_9856
bra_90FC:
C - - - - - 0x01910C 06:90FC: A9 00     LDA #$00
C - - - - - 0x01910E 06:90FE: 20 C6 97  JSR sub_97C6
C - - - - - 0x019111 06:9101: 20 95 9B  JSR sub_9B95
C - - - - - 0x019114 06:9104: AC D6 04  LDY ram_игрок_с_мячом
C - - - - - 0x019117 06:9107: 18        CLC
C - - - - - 0x019118 06:9108: B9 4D 03  LDA ram_pos_Y_lo_player,Y
C - - - - - 0x01911B 06:910B: 69 01     ADC #$01
C - - - - - 0x01911D 06:910D: 9D 4D 03  STA ram_pos_Y_lo_player,X
C - - - - - 0x019120 06:9110: B9 60 03  LDA ram_pos_Y_hi_player,Y
C - - - - - 0x019123 06:9113: 69 00     ADC #$00
C - - - - - 0x019125 06:9115: 9D 60 03  STA ram_pos_Y_hi_player,X
C - - - - - 0x019128 06:9118: AC D6 04  LDY ram_игрок_с_мячом
C - - - - - 0x01912B 06:911B: 38        SEC
C - - - - - 0x01912C 06:911C: BD 86 03  LDA ram_pos_Z_lo_player,X
C - - - - - 0x01912F 06:911F: F9 86 03  SBC ram_pos_Z_lo_player,Y
C - - - - - 0x019132 06:9122: BD 99 03  LDA ram_pos_Z_hi_player,X
C - - - - - 0x019135 06:9125: F9 99 03  SBC ram_pos_Z_hi_player,Y
C - - - - - 0x019138 06:9128: 30 08     BMI bra_9132
C - - - - - 0x01913A 06:912A: BD 99 03  LDA ram_pos_Z_hi_player,X
C - - - - - 0x01913D 06:912D: 10 17     BPL bra_9146_RTS
- - - - - - 0x01913F 06:912F: 4C 3E 91  JMP loc_913E
bra_9132:
C - - - - - 0x019142 06:9132: B9 86 03  LDA ram_pos_Z_lo_player,Y
C - - - - - 0x019145 06:9135: 9D 86 03  STA ram_pos_Z_lo_player,X
C - - - - - 0x019148 06:9138: B9 99 03  LDA ram_pos_Z_hi_player,Y
C - - - - - 0x01914B 06:913B: 9D 99 03  STA ram_pos_Z_hi_player,X
loc_913E:
C - - - - - 0x01914E 06:913E: 20 42 96  JSR sub_9642
C - - - - - 0x019151 06:9141: A9 03     LDA #$03
C - - - - - 0x019153 06:9143: 9D 59 04  STA ram_movement_id_player,X
bra_9146_RTS:
C - - - - - 0x019156 06:9146: 60        RTS



ofs_9147_14_игрок_владеет_мячом_и_бьет_по_нему:
.scope
ram_copy_X_lo       = ram_001E
ram_copy_X_hi       = ram_001F
ram_copy_Y_lo       = ram_0020
ram_copy_Y_hi       = ram_0021
ram_copy_Z_lo       = ram_0022
ram_copy_Z_hi       = ram_0023
ram_temp_lo         = ram_001C
ram_temp_hi         = ram_001D
C - - J - - 0x019157 06:9147: BD 59 04  LDA ram_movement_id_player,X
C - - - - - 0x01915A 06:914A: 10 03     BPL bra_914F
C - - - - - 0x01915C 06:914C: 4C 1D 92  JMP loc_921D
bra_914F:
C - - - - - 0x01915F 06:914F: 20 27 99  JSR sub_9927_зафиксировать_и_очистить_анимацию_объекта
C - - - - - 0x019162 06:9152: BD 14 03  LDA ram_pos_X_lo_player,X
C - - - - - 0x019165 06:9155: 85 1E     STA ram_copy_X_lo
C - - - - - 0x019167 06:9157: BD 27 03  LDA ram_pos_X_hi_player,X
C - - - - - 0x01916A 06:915A: 85 1F     STA ram_copy_X_hi
C - - - - - 0x01916C 06:915C: BD 4D 03  LDA ram_pos_Y_lo_player,X
C - - - - - 0x01916F 06:915F: 85 20     STA ram_copy_Y_lo
C - - - - - 0x019171 06:9161: BD 60 03  LDA ram_pos_Y_hi_player,X
C - - - - - 0x019174 06:9164: 85 21     STA ram_copy_Y_hi
C - - - - - 0x019176 06:9166: BD 86 03  LDA ram_pos_Z_lo_player,X
C - - - - - 0x019179 06:9169: 85 22     STA ram_copy_Z_lo
C - - - - - 0x01917B 06:916B: BD 99 03  LDA ram_pos_Z_hi_player,X
C - - - - - 0x01917E 06:916E: 85 23     STA ram_copy_Z_hi
C - - - - - 0x019180 06:9170: 20 8F C2  JSR sub_0x01C29F_положение_мяча_относительно_игрока
C - - - - - 0x019183 06:9173: 38        SEC
C - - - - - 0x019184 06:9174: A5 1E     LDA ram_copy_X_lo
C - - - - - 0x019186 06:9176: FD 14 03  SBC ram_pos_X_lo_player,X
C - - - - - 0x019189 06:9179: 85 1D     STA ram_temp_hi
C - - - - - 0x01918B 06:917B: A9 00     LDA #$00
C - - - - - 0x01918D 06:917D: 85 1C     STA ram_temp_lo
C - - - - - 0x01918F 06:917F: A0 00     JSR sub_9224_деление_скоростей_на_8
C - - - - - 0x01919D 06:918D: 38        SEC
C - - - - - 0x01919E 06:918E: BD E8 03  LDA ram_spd_X_lo_player,X
C - - - - - 0x0191A1 06:9191: E5 1C     SBC ram_temp_lo
C - - - - - 0x0191A3 06:9193: 9D E8 03  STA ram_spd_X_lo_player,X
C - - - - - 0x0191A6 06:9196: BD F6 03  LDA ram_spd_X_hi_player,X
C - - - - - 0x0191A9 06:9199: E5 1D     SBC ram_temp_hi
C - - - - - 0x0191AB 06:919B: 9D F6 03  STA ram_spd_X_hi_player,X
C - - - - - 0x0191AE 06:919E: 38        SEC
C - - - - - 0x0191AF 06:919F: A5 20     LDA ram_copy_Y_lo
C - - - - - 0x0191B1 06:91A1: FD 4D 03  SBC ram_pos_Y_lo_player,X
C - - - - - 0x0191B4 06:91A4: 85 1D     STA ram_temp_hi
C - - - - - 0x0191B6 06:91A6: A9 00     LDA #$00
C - - - - - 0x0191B8 06:91A8: 85 1C     STA ram_temp_lo
C - - - - - 0x0191BA 06:91AA: A0 00     JSR sub_9224_деление_скоростей_на_8
C - - - - - 0x0191C8 06:91B8: 38        SEC
C - - - - - 0x0191C9 06:91B9: BD 04 04  LDA ram_spd_Y_lo_player,X
C - - - - - 0x0191CC 06:91BC: E5 1C     SBC ram_temp_lo
C - - - - - 0x0191CE 06:91BE: 9D 04 04  STA ram_spd_Y_lo_player,X
C - - - - - 0x0191D1 06:91C1: BD 12 04  LDA ram_spd_Y_hi_player,X
C - - - - - 0x0191D4 06:91C4: E5 1D     SBC ram_temp_hi
C - - - - - 0x0191D6 06:91C6: 9D 12 04  STA ram_spd_Y_hi_player,X
C - - - - - 0x0191D9 06:91C9: 38        SEC
C - - - - - 0x0191DA 06:91CA: A5 22     LDA ram_copy_Z_lo
C - - - - - 0x0191DC 06:91CC: FD 86 03  SBC ram_pos_Z_lo_player,X
C - - - - - 0x0191DF 06:91CF: 18        CLC
C - - - - - 0x0191E0 06:91D0: 69 08     ADC #$08
C - - - - - 0x0191E2 06:91D2: 85 1D     STA ram_temp_hi
C - - - - - 0x0191E4 06:91D4: A9 00     LDA #$00
C - - - - - 0x0191E6 06:91D6: 85 1C     STA ram_temp_lo
C - - - - - 0x0191E8 06:91D8: A0 00     JSR sub_9224_деление_скоростей_на_8
C - - - - - 0x0191F6 06:91E6: 38        SEC
C - - - - - 0x0191F7 06:91E7: A9 00     LDA #$00
C - - - - - 0x0191F9 06:91E9: E5 1C     SBC ram_temp_lo
C - - - - - 0x0191FB 06:91EB: 9D 20 04  STA ram_spd_Z_lo_player,X
C - - - - - 0x0191FE 06:91EE: A9 04     LDA #$04
C - - - - - 0x019200 06:91F0: E5 1D     SBC ram_temp_hi
C - - - - - 0x019202 06:91F2: 9D 2E 04  STA ram_spd_Z_hi_player,X
C - - - - - 0x019205 06:91F5: A9 00     LDA #$00
C - - - - - 0x019207 06:91F7: 9D 4A 04  STA ram_gravity_hi_player,X
C - - - - - 0x01920A 06:91FA: A9 80     LDA #$80
C - - - - - 0x01920C 06:91FC: 9D 3C 04  STA ram_gravity_lo_player,X
C - - - - - 0x01920F 06:91FF: A5 1E     LDA ram_copy_X_lo
C - - - - - 0x019211 06:9201: 9D 14 03  STA ram_pos_X_lo_player,X
C - - - - - 0x019214 06:9204: A5 1F     LDA ram_copy_X_hi
C - - - - - 0x019216 06:9206: 9D 27 03  STA ram_pos_X_hi_player,X
C - - - - - 0x019219 06:9209: A5 20     LDA ram_copy_Y_lo
C - - - - - 0x01921B 06:920B: 9D 4D 03  STA ram_pos_Y_lo_player,X
C - - - - - 0x01921E 06:920E: A5 21     LDA ram_copy_Y_hi
C - - - - - 0x019220 06:9210: 9D 60 03  STA ram_pos_Y_hi_player,X
C - - - - - 0x019223 06:9213: A5 22     LDA ram_copy_Z_lo
C - - - - - 0x019225 06:9215: 9D 86 03  STA ram_pos_Z_lo_player,X
C - - - - - 0x019228 06:9218: A5 23     LDA ram_copy_Z_hi
C - - - - - 0x01922A 06:921A: 9D 99 03  STA ram_pos_Z_hi_player,X
loc_921D:
C D 0 - - - 0x01922D 06:921D: 20 42 96  JSR sub_9642
C - - - - - 0x019230 06:9220: 20 95 9B  JSR sub_9B95
C - - - - - 0x019233 06:9223: 4C 97 8F  JMP loc_8F97

sub_9224_деление_скоростей_на_8:
    LDY #$03
@цикл:
    LDA ram_temp_hi
    ASL
    ROR ram_temp_hi
    ROR ram_temp_lo
    DEY
    BNE @цикл
    RTS
.endscope



ofs_9226_0E:
- - - - - - 0x019236 06:9226: A9 0A     LDA #$0A
- - - - - - 0x019238 06:9228: 20 27 99  JSR sub_9927_зафиксировать_и_очистить_анимацию_объекта
- - - - - - 0x01923B 06:922B: AC D6 04  LDY ram_игрок_с_мячом
- - - - - - 0x01923E 06:922E: B9 F6 03  LDA ram_spd_X_hi_player,Y
- - - - - - 0x019241 06:9231: 9D F6 03  STA ram_spd_X_hi_player,X
- - - - - - 0x019244 06:9234: B9 E8 03  LDA ram_spd_X_lo_player,Y
- - - - - - 0x019247 06:9237: 9D E8 03  STA ram_spd_X_lo_player,X
- - - - - - 0x01924A 06:923A: B9 12 04  LDA ram_spd_Y_hi_player,Y
- - - - - - 0x01924D 06:923D: 9D 12 04  STA ram_spd_Y_hi_player,X
- - - - - - 0x019250 06:9240: B9 04 04  LDA ram_spd_Y_lo_player,Y
- - - - - - 0x019253 06:9243: 9D 04 04  STA ram_spd_Y_lo_player,X
- - - - - - 0x019256 06:9246: 20 B2 94  JSR sub_94B2_гравитация_мяча
- - - - - - 0x019259 06:9249: 4C 5F 92  JMP loc_925F



ofs_924C_0A:
C - - J - - 0x01925C 06:924C: BD 59 04  LDA ram_movement_id_player,X
C - - - - - 0x01925F 06:924F: 30 0E     BMI bra_925F
C - - - - - 0x019261 06:9251: 20 27 99  JSR sub_9927_зафиксировать_и_очистить_анимацию_объекта
C - - - - - 0x019264 06:9254: 20 C9 9C  JSR sub_9CC9_очистить_скорости_объекта
C - - - - - 0x019267 06:9257: A9 01     LDA #$01
C - - - - - 0x019269 06:9259: 20 9C 94  JSR sub_949C_скорость_Z_и_гравитация_мяча
C - - - - - 0x01926C 06:925C: 20 D3 98  JSR sub_98D3_начальная_Z_скорость_мяча
bra_925F:
loc_925F:
C - - - - - 0x01926F 06:925F: 20 42 96  JSR sub_9642
C - - - - - 0x019272 06:9262: 20 95 9B  JSR sub_9B95
C - - - - - 0x019275 06:9265: 20 D3 B1  JSR sub_B1D3
C - - - - - 0x019278 06:9268: 4C 97 8F  JMP loc_8F97



ofs_926B_17:
C - - J - - 0x01927B 06:926B: BD 59 04  LDA ram_movement_id_player,X
C - - - - - 0x01927E 06:926E: 30 2C     BMI bra_929C
C - - - - - 0x019280 06:9270: 20 27 99  JSR sub_9927_зафиксировать_и_очистить_анимацию_объекта
C - - - - - 0x019283 06:9273: 20 56 98  JSR sub_9856
C - - - - - 0x019286 06:9276: BD A3 04  LDA ram_направление_движения,X
C - - - - - 0x019289 06:9279: 49 80     EOR #$80
C - - - - - 0x01928B 06:927B: 9D A3 04  STA ram_направление_движения,X
C - - - - - 0x01928E 06:927E: AD 00 03  LDA ram_frame_cnt
C - - - - - 0x019291 06:9281: 29 07     AND #$07
C - - - - - 0x019293 06:9283: 0A        ASL
C - - - - - 0x019294 06:9284: 0A        ASL
C - - - - - 0x019295 06:9285: 0A        ASL
C - - - - - 0x019296 06:9286: 0A        ASL
C - - - - - 0x019297 06:9287: 1D A3 04  ORA ram_направление_движения,X
C - - - - - 0x01929A 06:928A: 29 F0     AND #$F0
C - - - - - 0x01929C 06:928C: 9D B0 04  STA ram_смена_угла_движения,X
C - - - - - 0x01929F 06:928F: A9 02     LDA #$02
C - - - - - 0x0192A1 06:9291: 20 D1 93  JSR sub_93D1
C - - - - - 0x0192A4 06:9294: A9 04     LDA #$04
C - - - - - 0x0192A6 06:9296: 20 9C 94  JSR sub_949C_скорость_Z_и_гравитация_мяча
C - - - - - 0x0192A9 06:9299: 20 95 9B  JSR sub_9B95
bra_929C:
C - - - - - 0x0192AC 06:929C: 4C C8 92  JMP loc_92C8



ofs_929F_0B:
C - - J - - 0x0192AF 06:929F: BD 59 04  LDA ram_movement_id_player,X
C - - - - - 0x0192B2 06:92A2: 30 24     BMI bra_92C8
C - - - - - 0x0192B4 06:92A4: 20 27 99  JSR sub_9927_зафиксировать_и_очистить_анимацию_объекта
C - - - - - 0x0192B7 06:92A7: 20 56 98  JSR sub_9856
C - - - - - 0x0192BA 06:92AA: AC D6 04  LDY ram_игрок_с_мячом
C - - - - - 0x0192BD 06:92AD: B9 A3 04  LDA ram_направление_движения,Y
C - - - - - 0x0192C0 06:92B0: 9D A3 04  STA ram_направление_движения,X
C - - - - - 0x0192C3 06:92B3: 09 40     ORA #$40
C - - - - - 0x0192C5 06:92B5: 9D B0 04  STA ram_смена_угла_движения,X
C - - - - - 0x0192C8 06:92B8: 20 C9 9C  JSR sub_9CC9_очистить_скорости_объекта
C - - - - - 0x0192CB 06:92BB: A9 02     LDA #$02
C - - - - - 0x0192CD 06:92BD: 20 D1 93  JSR sub_93D1
C - - - - - 0x0192D0 06:92C0: A9 02     LDA #$02
C - - - - - 0x0192D2 06:92C2: 20 9C 94  JSR sub_949C_скорость_Z_и_гравитация_мяча
C - - - - - 0x0192D5 06:92C5: 20 D3 98  JSR sub_98D3_начальная_Z_скорость_мяча
bra_92C8:
loc_92C8:
C D 0 - - - 0x0192D8 06:92C8: 20 42 96  JSR sub_9642
C - - - - - 0x0192DB 06:92CB: 20 95 9B  JSR sub_9B95
C - - - - - 0x0192DE 06:92CE: A9 06     LDA #$06
C - - - - - 0x0192E0 06:92D0: 9D 59 04  STA ram_movement_id_player,X
C - - - - - 0x0192E3 06:92D3: 60        RTS



ofs_92D4_10:
C - - J - - 0x0192E4 06:92D4: BD 59 04  LDA ram_movement_id_player,X
C - - - - - 0x0192E7 06:92D7: 30 EF     BMI bra_92C8
C - - - - - 0x0192E9 06:92D9: 20 27 99  JSR sub_9927_зафиксировать_и_очистить_анимацию_объекта
C - - - - - 0x0192EC 06:92DC: 20 56 98  JSR sub_9856
C - - - - - 0x0192EF 06:92DF: AC D6 04  LDY ram_игрок_с_мячом
C - - - - - 0x0192F2 06:92E2: B9 A3 04  LDA ram_направление_движения,Y
C - - - - - 0x0192F5 06:92E5: 9D A3 04  STA ram_направление_движения,X
C - - - - - 0x0192F8 06:92E8: 09 40     ORA #$40
C - - - - - 0x0192FA 06:92EA: 9D B0 04  STA ram_смена_угла_движения,X
C - - - - - 0x0192FD 06:92ED: 20 C9 9C  JSR sub_9CC9_очистить_скорости_объекта
C - - - - - 0x019300 06:92F0: A9 02     LDA #$02
C - - - - - 0x019302 06:92F2: 20 D1 93  JSR sub_93D1
C - - - - - 0x019305 06:92F5: A9 01     LDA #$01
C - - - - - 0x019307 06:92F7: 20 9C 94  JSR sub_949C_скорость_Z_и_гравитация_мяча
C - - - - - 0x01930A 06:92FA: 20 D3 98  JSR sub_98D3_начальная_Z_скорость_мяча
C - - - - - 0x01930D 06:92FD: AC D6 04  LDY ram_игрок_с_мячом
C - - - - - 0x019310 06:9300: 38        SEC
C - - - - - 0x019311 06:9301: A9 00     LDA #$00
C - - - - - 0x019313 06:9303: 85 2C     STA ram_002C
C - - - - - 0x019315 06:9305: BD 4D 03  LDA ram_pos_Y_lo_player,X
C - - - - - 0x019318 06:9308: F9 4D 03  SBC ram_pos_Y_lo_player,Y
C - - - - - 0x01931B 06:930B: 85 2D     STA ram_002D
C - - - - - 0x01931D 06:930D: 0A        ASL
C - - - - - 0x01931E 06:930E: 66 2D     ROR ram_002D
C - - - - - 0x019320 06:9310: 66 2C     ROR ram_002C
C - - - - - 0x019322 06:9312: A5 2D     LDA ram_002D
C - - - - - 0x019324 06:9314: 0A        ASL
C - - - - - 0x019325 06:9315: 66 2D     ROR ram_002D
C - - - - - 0x019327 06:9317: 66 2C     ROR ram_002C
C - - - - - 0x019329 06:9319: 18        CLC
C - - - - - 0x01932A 06:931A: BD 04 04  LDA ram_spd_Y_lo_player,X
C - - - - - 0x01932D 06:931D: 65 2C     ADC ram_002C
C - - - - - 0x01932F 06:931F: 9D 04 04  STA ram_spd_Y_lo_player,X
C - - - - - 0x019332 06:9322: BD 12 04  LDA ram_spd_Y_hi_player,X
C - - - - - 0x019335 06:9325: 65 2D     ADC ram_002D
C - - - - - 0x019337 06:9327: 9D 12 04  STA ram_spd_Y_hi_player,X
C - - - - - 0x01933A 06:932A: A5 2D     LDA ram_002D
C - - - - - 0x01933C 06:932C: 5D F6 03  EOR ram_spd_X_hi_player,X
C - - - - - 0x01933F 06:932F: 30 11     BMI bra_9342
C - - - - - 0x019341 06:9331: 18        CLC
C - - - - - 0x019342 06:9332: A5 2C     LDA ram_002C
C - - - - - 0x019344 06:9334: 49 FF     EOR #$FF
C - - - - - 0x019346 06:9336: 69 01     ADC #$01
C - - - - - 0x019348 06:9338: 85 2C     STA ram_002C
C - - - - - 0x01934A 06:933A: A5 2D     LDA ram_002D
C - - - - - 0x01934C 06:933C: 49 FF     EOR #$FF
C - - - - - 0x01934E 06:933E: 69 00     ADC #$00
C - - - - - 0x019350 06:9340: 85 2D     STA ram_002D
bra_9342:
C - - - - - 0x019352 06:9342: 06 2C     ASL ram_002C
C - - - - - 0x019354 06:9344: 26 2D     ROL ram_002D
C - - - - - 0x019356 06:9346: 18        CLC
C - - - - - 0x019357 06:9347: BD E8 03  LDA ram_spd_X_lo_player,X
C - - - - - 0x01935A 06:934A: 65 2C     ADC ram_002C
C - - - - - 0x01935C 06:934C: 9D E8 03  STA ram_spd_X_lo_player,X
C - - - - - 0x01935F 06:934F: BD F6 03  LDA ram_spd_X_hi_player,X
C - - - - - 0x019362 06:9352: 65 2D     ADC ram_002D
C - - - - - 0x019364 06:9354: 9D F6 03  STA ram_spd_X_hi_player,X
C - - - - - 0x019367 06:9357: 4C C8 92  JMP loc_92C8



ofs_935A_0C:
C - - J - - 0x01936A 06:935A: BD 59 04  LDA ram_movement_id_player,X
C - - - - - 0x01936D 06:935D: 30 22     BMI bra_9381
C - - - - - 0x01936F 06:935F: 20 27 99  JSR sub_9927_зафиксировать_и_очистить_анимацию_объекта
C - - - - - 0x019372 06:9362: AC D6 04  LDY ram_игрок_с_мячом
C - - - - - 0x019375 06:9365: B9 A3 04  LDA ram_направление_движения,Y
C - - - - - 0x019378 06:9368: 9D A3 04  STA ram_направление_движения,X
C - - - - - 0x01937B 06:936B: B9 96 04  LDA ram_movement_angle,Y
C - - - - - 0x01937E 06:936E: 9D B0 04  STA ram_смена_угла_движения,X
C - - - - - 0x019381 06:9371: 20 C9 9C  JSR sub_9CC9_очистить_скорости_объекта
C - - - - - 0x019384 06:9374: A9 02     LDA #$02
C - - - - - 0x019386 06:9376: 20 D1 93  JSR sub_93D1
C - - - - - 0x019389 06:9379: A9 03     LDA #$03
C - - - - - 0x01938B 06:937B: 20 9C 94  JSR sub_949C_скорость_Z_и_гравитация_мяча
C - - - - - 0x01938E 06:937E: 20 D3 98  JSR sub_98D3_начальная_Z_скорость_мяча
bra_9381:
C - - - - - 0x019391 06:9381: 20 42 96  JSR sub_9642
C - - - - - 0x019394 06:9384: 20 95 9B  JSR sub_9B95
C - - - - - 0x019397 06:9387: A9 06     LDA #$06
C - - - - - 0x019399 06:9389: 9D 59 04  STA ram_movement_id_player,X
C - - - - - 0x01939C 06:938C: 60        RTS



ofs_938D_15:
C - - J - - 0x01939D 06:938D: BD 59 04  LDA ram_movement_id_player,X
C - - - - - 0x0193A0 06:9390: 30 0B     BMI bra_939D
C - - - - - 0x0193A2 06:9392: 20 27 99  JSR sub_9927_зафиксировать_и_очистить_анимацию_объекта
C - - - - - 0x0193A5 06:9395: 8D 26 05  STA ram_таймер_чеканки
C - - - - - 0x0193A8 06:9398: A9 05     LDA #$05
C - - - - - 0x0193AA 06:939A: 20 9C 94  JSR sub_949C_скорость_Z_и_гравитация_мяча
bra_939D:
C - - - - - 0x0193AD 06:939D: A9 01     LDA #$01
C - - - - - 0x0193AF 06:939F: 20 C6 97  JSR sub_97C6
C - - - - - 0x0193B2 06:93A2: 20 42 96  JSR sub_9642
C - - - - - 0x0193B5 06:93A5: 20 95 9B  JSR sub_9B95
C - - - - - 0x0193B8 06:93A8: AC D6 04  LDY ram_игрок_с_мячом
C - - - - - 0x0193BB 06:93AB: 18        CLC
C - - - - - 0x0193BC 06:93AC: B9 4D 03  LDA ram_pos_Y_lo_player,Y
C - - - - - 0x0193BF 06:93AF: 69 01     ADC #$01
C - - - - - 0x0193C1 06:93B1: 9D 4D 03  STA ram_pos_Y_lo_player,X
C - - - - - 0x0193C4 06:93B4: B9 60 03  LDA ram_pos_Y_hi_player,Y
C - - - - - 0x0193C7 06:93B7: 69 00     ADC #$00
C - - - - - 0x0193C9 06:93B9: 9D 60 03  STA ram_pos_Y_hi_player,X
C - - - - - 0x0193CC 06:93BC: 20 D3 B1  JSR sub_B1D3
C - - - - - 0x0193CF 06:93BF: EE 26 05  INC ram_таймер_чеканки
C - - - - - 0x0193D2 06:93C2: AD 26 05  LDA ram_таймер_чеканки
C - - - - - 0x0193D5 06:93C5: C9 0E     CMP #$0E
C - - - - - 0x0193D7 06:93C7: 90 05     BCC bra_93CE
C - - - - - 0x0193D9 06:93C9: A9 06     LDA #$06
C - - - - - 0x0193DB 06:93CB: 9D 59 04  STA ram_movement_id_player,X
bra_93CE:
C - - - - - 0x0193DE 06:93CE: 4C 97 8F  JMP loc_8F97



sub_93D1:
ofs_93D1_0D:
C - - - - - 0x0193E1 06:93D1: 85 1C     STA ram_001C
C - - - - - 0x0193E3 06:93D3: 4A        LSR
C - - - - - 0x0193E4 06:93D4: 65 1C     ADC ram_001C
C - - - - - 0x0193E6 06:93D6: 85 1C     STA ram_001C
C - - - - - 0x0193E8 06:93D8: BD B0 04  LDA ram_смена_угла_движения,X
C - - - - - 0x0193EB 06:93DB: 29 F0     AND #$F0
C - - - - - 0x0193ED 06:93DD: 4A        LSR
C - - - - - 0x0193EE 06:93DE: 4A        LSR
C - - - - - 0x0193EF 06:93DF: A8        TAY
C - - - - - 0x0193F0 06:93E0: B9 35 94  LDA tbl_9435,Y
C - - - - - 0x0193F3 06:93E3: 85 2C     STA ram_002C
C - - - - - 0x0193F5 06:93E5: B9 36 94  LDA tbl_9436,Y
C - - - - - 0x0193F8 06:93E8: 85 2D     STA ram_002D
C - - - - - 0x0193FA 06:93EA: B9 37 94  LDA tbl_9437,Y
C - - - - - 0x0193FD 06:93ED: 85 2E     STA ram_002E
C - - - - - 0x0193FF 06:93EF: B9 38 94  LDA tbl_9438,Y
C - - - - - 0x019402 06:93F2: 85 2F     STA ram_002F
C - - - - - 0x019404 06:93F4: A9 00     LDA #$00
C - - - - - 0x019406 06:93F6: 9D E8 03  STA ram_spd_X_lo_player,X
C - - - - - 0x019409 06:93F9: 9D F6 03  STA ram_spd_X_hi_player,X
C - - - - - 0x01940C 06:93FC: 9D 04 04  STA ram_spd_Y_lo_player,X
C - - - - - 0x01940F 06:93FF: 9D 12 04  STA ram_spd_Y_hi_player,X
bra_9402:
C - - - - - 0x019412 06:9402: 46 1C     LSR ram_001C
C - - - - - 0x019414 06:9404: 90 22     BCC bra_9428
C - - - - - 0x019416 06:9406: 18        CLC
C - - - - - 0x019417 06:9407: A5 2C     LDA ram_002C
C - - - - - 0x019419 06:9409: 7D E8 03  ADC ram_spd_X_lo_player,X
C - - - - - 0x01941C 06:940C: 9D E8 03  STA ram_spd_X_lo_player,X
C - - - - - 0x01941F 06:940F: A5 2D     LDA ram_002D
C - - - - - 0x019421 06:9411: 7D F6 03  ADC ram_spd_X_hi_player,X
C - - - - - 0x019424 06:9414: 9D F6 03  STA ram_spd_X_hi_player,X
C - - - - - 0x019427 06:9417: 18        CLC
C - - - - - 0x019428 06:9418: A5 2E     LDA ram_002E
C - - - - - 0x01942A 06:941A: 7D 04 04  ADC ram_spd_Y_lo_player,X
C - - - - - 0x01942D 06:941D: 9D 04 04  STA ram_spd_Y_lo_player,X
C - - - - - 0x019430 06:9420: A5 2F     LDA ram_002F
C - - - - - 0x019432 06:9422: 7D 12 04  ADC ram_spd_Y_hi_player,X
C - - - - - 0x019435 06:9425: 9D 12 04  STA ram_spd_Y_hi_player,X
bra_9428:
C - - - - - 0x019438 06:9428: 06 2C     ASL ram_002C
C - - - - - 0x01943A 06:942A: 26 2D     ROL ram_002D
C - - - - - 0x01943C 06:942C: 06 2E     ASL ram_002E
C - - - - - 0x01943E 06:942E: 26 2F     ROL ram_002F
C - - - - - 0x019440 06:9430: A5 1C     LDA ram_001C
C - - - - - 0x019442 06:9432: D0 CE     BNE bra_9402
C - - - - - 0x019444 06:9434: 60        RTS



tbl_9435:
- D 0 - - - 0x019445 06:9435: 00        .byte $00   ; 
tbl_9436:
- D 0 - - - 0x019446 06:9436: 00        .byte $00   ; 
tbl_9437:
- D 0 - - - 0x019447 06:9437: A0        .byte $A0   ; 
tbl_9438:
- D 0 - - - 0x019448 06:9438: FF        .byte $FF   ; 
- D 0 - - - 0x019449 06:9439: 49        .byte $49   ; 
- D 0 - - - 0x01944A 06:943A: 00        .byte $00   ; 
- D 0 - - - 0x01944B 06:943B: A8        .byte $A8   ; 
- D 0 - - - 0x01944C 06:943C: FF        .byte $FF   ; 
- D 0 - - - 0x01944D 06:943D: 87        .byte $87   ; 
- D 0 - - - 0x01944E 06:943E: 00        .byte $00   ; 
- D 0 - - - 0x01944F 06:943F: BD        .byte $BD   ; 
- D 0 - - - 0x019450 06:9440: FF        .byte $FF   ; 
- D 0 - - - 0x019451 06:9441: B1        .byte $B1   ; 
- D 0 - - - 0x019452 06:9442: 00        .byte $00   ; 
- D 0 - - - 0x019453 06:9443: DC        .byte $DC   ; 
- D 0 - - - 0x019454 06:9444: FF        .byte $FF   ; 
- D 0 - - - 0x019455 06:9445: C0        .byte $C0   ; 
- D 0 - - - 0x019456 06:9446: 00        .byte $00   ; 
- D 0 - - - 0x019457 06:9447: 00        .byte $00   ; 
- D 0 - - - 0x019458 06:9448: 00        .byte $00   ; 
- D 0 - - - 0x019459 06:9449: B1        .byte $B1   ; 
- D 0 - - - 0x01945A 06:944A: 00        .byte $00   ; 
- D 0 - - - 0x01945B 06:944B: 24        .byte $24   ; 
- D 0 - - - 0x01945C 06:944C: 00        .byte $00   ; 
- D 0 - - - 0x01945D 06:944D: 87        .byte $87   ; 
- D 0 - - - 0x01945E 06:944E: 00        .byte $00   ; 
- D 0 - - - 0x01945F 06:944F: 43        .byte $43   ; 
- D 0 - - - 0x019460 06:9450: 00        .byte $00   ; 
- D 0 - - - 0x019461 06:9451: 49        .byte $49   ; 
- D 0 - - - 0x019462 06:9452: 00        .byte $00   ; 
- D 0 - - - 0x019463 06:9453: 58        .byte $58   ; 
- D 0 - - - 0x019464 06:9454: 00        .byte $00   ; 
- D 0 - - - 0x019465 06:9455: 00        .byte $00   ; 
- D 0 - - - 0x019466 06:9456: 00        .byte $00   ; 
- D 0 - - - 0x019467 06:9457: 60        .byte $60   ; 
- D 0 - - - 0x019468 06:9458: 00        .byte $00   ; 
- D 0 - - - 0x019469 06:9459: B7        .byte $B7   ; 
- D 0 - - - 0x01946A 06:945A: FF        .byte $FF   ; 
- D 0 - - - 0x01946B 06:945B: 58        .byte $58   ; 
- D 0 - - - 0x01946C 06:945C: 00        .byte $00   ; 
- D 0 - - - 0x01946D 06:945D: 79        .byte $79   ; 
- D 0 - - - 0x01946E 06:945E: FF        .byte $FF   ; 
- D 0 - - - 0x01946F 06:945F: 43        .byte $43   ; 
- D 0 - - - 0x019470 06:9460: 00        .byte $00   ; 
- D 0 - - - 0x019471 06:9461: 4F        .byte $4F   ; 
- D 0 - - - 0x019472 06:9462: FF        .byte $FF   ; 
- D 0 - - - 0x019473 06:9463: 24        .byte $24   ; 
- D 0 - - - 0x019474 06:9464: 00        .byte $00   ; 
- D 0 - - - 0x019475 06:9465: 40        .byte $40   ; 
- D 0 - - - 0x019476 06:9466: FF        .byte $FF   ; 
- D 0 - - - 0x019477 06:9467: 00        .byte $00   ; 
- D 0 - - - 0x019478 06:9468: 00        .byte $00   ; 
- D 0 - - - 0x019479 06:9469: 4F        .byte $4F   ; 
- D 0 - - - 0x01947A 06:946A: FF        .byte $FF   ; 
- D 0 - - - 0x01947B 06:946B: DC        .byte $DC   ; 
- D 0 - - - 0x01947C 06:946C: FF        .byte $FF   ; 
- D 0 - - - 0x01947D 06:946D: 79        .byte $79   ; 
- D 0 - - - 0x01947E 06:946E: FF        .byte $FF   ; 
- D 0 - - - 0x01947F 06:946F: BD        .byte $BD   ; 
- D 0 - - - 0x019480 06:9470: FF        .byte $FF   ; 
- D 0 - - - 0x019481 06:9471: B7        .byte $B7   ; 
- D 0 - - - 0x019482 06:9472: FF        .byte $FF   ; 
- D 0 - - - 0x019483 06:9473: A8        .byte $A8   ; 
- D 0 - - - 0x019484 06:9474: FF        .byte $FF   ; 



sub_9475:
C - - - - - 0x019485 06:9475: AD 10 05  LDA ram_подтип_супера
C - - - - - 0x019488 06:9478: 0D 0F 05  ORA ram_номер_супера
C - - - - - 0x01948B 06:947B: F0 1E     BEQ bra_949B_RTS
C - - - - - 0x01948D 06:947D: AD 00 03  LDA ram_frame_cnt
C - - - - - 0x019490 06:9480: 29 03     AND #$03
C - - - - - 0x019492 06:9482: D0 17     BNE bra_949B_RTS
C - - - - - 0x019494 06:9484: 38        SEC
C - - - - - 0x019495 06:9485: AD F0 04  LDA ram_hp_ball
C - - - - - 0x019498 06:9488: E9 01     SBC #$01
C - - - - - 0x01949A 06:948A: 90 06     BCC bra_9492
C - - - - - 0x01949C 06:948C: C9 0A     CMP #$0A
C - - - - - 0x01949E 06:948E: 90 06     BCC bra_9496
C - - - - - 0x0194A0 06:9490: B0 06     BCS bra_9498
bra_9492:
C - - - - - 0x0194A2 06:9492: A9 00     LDA #$00
C - - - - - 0x0194A4 06:9494: F0 02     BEQ bra_9498
bra_9496:
C - - - - - 0x0194A6 06:9496: A9 0A     LDA #$0A
bra_9498:
C - - - - - 0x0194A8 06:9498: 8D F0 04  STA ram_hp_ball
bra_949B_RTS:
C - - - - - 0x0194AB 06:949B: 60        RTS



sub_949C_скорость_Z_и_гравитация_мяча:
C - - - - - 0x0194AC 06:949C: 0A        ASL
C - - - - - 0x0194AD 06:949D: 0A        ASL
C - - - - - 0x0194AE 06:949E: A8        TAY
C - - - - - 0x0194AF 06:949F: AD 0D 05  LDA ram_timer_wet_ball
C - - - - - 0x0194B2 06:94A2: 10 02     BPL bra_94A6
C - - - - - 0x0194B4 06:94A4: C8        INY
C - - - - - 0x0194B5 06:94A5: C8        INY
bra_94A6:
C - - - - - 0x0194B6 06:94A6: B9 BF 94  LDA tbl_94BF_начальная_скорость_высоты_мяча,Y
C - - - - - 0x0194B9 06:94A9: 9D 20 04  STA ram_spd_Z_lo_player,X
C - - - - - 0x0194BC 06:94AC: B9 C0 94  LDA tbl_94BF_начальная_скорость_высоты_мяча + 1,Y
C - - - - - 0x0194BF 06:94AF: 9D 2E 04  STA ram_spd_Z_hi_player,X
sub_94B2_гравитация_мяча:
C - - - - - 0x0194C2 06:94B2: AD D7 94  LDA tbl_94D7_гравитация
C - - - - - 0x0194C5 06:94B5: 9D 3C 04  STA ram_gravity_lo_player,X
C - - - - - 0x0194C8 06:94B8: AD D8 94  LDA tbl_94D7_гравитация + 1
C - - - - - 0x0194CB 06:94BB: 9D 4A 04  STA ram_gravity_hi_player,X
C - - - - - 0x0194CE 06:94BE: 60        RTS

tbl_94BF_начальная_скорость_высоты_мяча:
- - - - - - 0x0194CF 06:94BF: 00 08     .word $0800
- - - - - - 0x0194D1 06:94C1: 00 06     .word $0600
- D 0 - - - 0x0194D3 06:94C3: 00 08     .word $0800
- D 0 - - - 0x0194D5 06:94C5: 00 07     .word $0700
- D 0 - - - 0x0194D7 06:94C7: 00 09     .word $0900
- D 0 - - - 0x0194D9 06:94C9: 00 08     .word $0800
- D 0 - - - 0x0194DB 06:94CB: 80 01     .word $0180
- - - - - - 0x0194DD 06:94CD: 00 01     .word $0100
- D 0 - - - 0x0194DF 06:94CF: 00 05     .word $0500
- D 0 - - - 0x0194E1 06:94D1: 00 05     .word $0500
- D 0 - - - 0x0194E3 06:94D3: 00 03     .word $0300
- - - - - - 0x0194E5 06:94D5: 00 03     .word $0300

tbl_94D7_гравитация:
- D 0 - - - 0x0194E7 06:94D7: 80 00     .word $0080



sub_94D9:
C - - - - - 0x0194E9 06:94D9: 85 1E     STA ram_001E
C - - - - - 0x0194EB 06:94DB: 0A        ASL
C - - - - - 0x0194EC 06:94DC: 18        CLC
C - - - - - 0x0194ED 06:94DD: 65 1E     ADC ram_001E
C - - - - - 0x0194EF 06:94DF: 6D 3C 01  ADC ram_surface_ball
C - - - - - 0x0194F2 06:94E2: 85 1E     STA ram_001E
C - - - - - 0x0194F4 06:94E4: A9 00     LDA #$00
C - - - - - 0x0194F6 06:94E6: 85 2C     STA ram_002C
C - - - - - 0x0194F8 06:94E8: 85 2E     STA ram_002E
C - - - - - 0x0194FA 06:94EA: 85 30     STA ram_0030
C - - - - - 0x0194FC 06:94EC: 85 31     STA ram_0031
C - - - - - 0x0194FE 06:94EE: 85 32     STA ram_0032
C - - - - - 0x019500 06:94F0: 85 33     STA ram_0033
C - - - - - 0x019502 06:94F2: BD F6 03  LDA ram_spd_X_hi_player,X
C - - - - - 0x019505 06:94F5: 85 2D     STA ram_002D
C - - - - - 0x019507 06:94F7: 10 02     BPL bra_94FB
C - - - - - 0x019509 06:94F9: C6 2C     DEC ram_002C
bra_94FB:
C - - - - - 0x01950B 06:94FB: BD E8 03  LDA ram_spd_X_lo_player,X
C - - - - - 0x01950E 06:94FE: 85 1C     STA ram_001C
C - - - - - 0x019510 06:9500: BD 12 04  LDA ram_spd_Y_hi_player,X
C - - - - - 0x019513 06:9503: 85 2F     STA ram_002F
C - - - - - 0x019515 06:9505: 10 02     BPL bra_9509
C - - - - - 0x019517 06:9507: C6 2E     DEC ram_002E
bra_9509:
C - - - - - 0x019519 06:9509: BD 04 04  LDA ram_spd_Y_lo_player,X
C - - - - - 0x01951C 06:950C: 85 1D     STA ram_001D
C - - - - - 0x01951E 06:950E: A5 1E     LDA ram_001E
C - - - - - 0x019520 06:9510: 0A        ASL
C - - - - - 0x019521 06:9511: A8        TAY
C - - - - - 0x019522 06:9512: AD 0D 05  LDA ram_timer_wet_ball
C - - - - - 0x019525 06:9515: 10 01     BPL bra_9518
C - - - - - 0x019527 06:9517: C8        INY
bra_9518:
C - - - - - 0x019528 06:9518: B9 EB 95  LDA tbl_95EB,Y
C - - - - - 0x01952B 06:951B: 85 1E     STA ram_001E
loc_951D:
C D 0 - - - 0x01952D 06:951D: A5 1E     LDA ram_001E
C - - - - - 0x01952F 06:951F: F0 2D     BEQ bra_954E
C - - - - - 0x019531 06:9521: 46 1E     LSR ram_001E
C - - - - - 0x019533 06:9523: 90 1A     BCC bra_953F
C - - - - - 0x019535 06:9525: 18        CLC
C - - - - - 0x019536 06:9526: A5 30     LDA ram_0030
C - - - - - 0x019538 06:9528: 65 2D     ADC ram_002D
C - - - - - 0x01953A 06:952A: 85 30     STA ram_0030
C - - - - - 0x01953C 06:952C: A5 31     LDA ram_0031
C - - - - - 0x01953E 06:952E: 65 2C     ADC ram_002C
C - - - - - 0x019540 06:9530: 85 31     STA ram_0031
C - - - - - 0x019542 06:9532: 18        CLC
C - - - - - 0x019543 06:9533: A5 32     LDA ram_0032
C - - - - - 0x019545 06:9535: 65 2F     ADC ram_002F
C - - - - - 0x019547 06:9537: 85 32     STA ram_0032
C - - - - - 0x019549 06:9539: A5 33     LDA ram_0033
C - - - - - 0x01954B 06:953B: 65 2E     ADC ram_002E
C - - - - - 0x01954D 06:953D: 85 33     STA ram_0033
bra_953F:
C - - - - - 0x01954F 06:953F: 06 1C     ASL ram_001C
C - - - - - 0x019551 06:9541: 26 2D     ROL ram_002D
C - - - - - 0x019553 06:9543: 26 2C     ROL ram_002C
C - - - - - 0x019555 06:9545: 06 1D     ASL ram_001D
C - - - - - 0x019557 06:9547: 26 2F     ROL ram_002F
C - - - - - 0x019559 06:9549: 26 2E     ROL ram_002E
C - - - - - 0x01955B 06:954B: 4C 1D 95  JMP loc_951D
bra_954E:
C - - - - - 0x01955E 06:954E: BD F6 03  LDA ram_spd_X_hi_player,X
C - - - - - 0x019561 06:9551: F0 2E     BEQ bra_9581
C - - - - - 0x019563 06:9553: 49 FF     EOR #$FF
C - - - - - 0x019565 06:9555: F0 14     BEQ bra_956B
C - - - - - 0x019567 06:9557: 38        SEC
C - - - - - 0x019568 06:9558: BD E8 03  LDA ram_spd_X_lo_player,X
C - - - - - 0x01956B 06:955B: E5 30     SBC ram_0030
C - - - - - 0x01956D 06:955D: 9D E8 03  STA ram_spd_X_lo_player,X
C - - - - - 0x019570 06:9560: BD F6 03  LDA ram_spd_X_hi_player,X
C - - - - - 0x019573 06:9563: E5 31     SBC ram_0031
C - - - - - 0x019575 06:9565: 9D F6 03  STA ram_spd_X_hi_player,X
C - - - - - 0x019578 06:9568: 4C 9C 95  JMP loc_959C
bra_956B:
C - - - - - 0x01957B 06:956B: 18        CLC
C - - - - - 0x01957C 06:956C: BD E8 03  LDA ram_spd_X_lo_player,X
C - - - - - 0x01957F 06:956F: 69 10     ADC #$10
C - - - - - 0x019581 06:9571: 9D E8 03  STA ram_spd_X_lo_player,X
C - - - - - 0x019584 06:9574: BD F6 03  LDA ram_spd_X_hi_player,X
C - - - - - 0x019587 06:9577: 69 00     ADC #$00
C - - - - - 0x019589 06:9579: 9D F6 03  STA ram_spd_X_hi_player,X
C - - - - - 0x01958C 06:957C: 10 16     BPL bra_9594
C - - - - - 0x01958E 06:957E: 4C 9C 95  JMP loc_959C
bra_9581:
C - - - - - 0x019591 06:9581: 38        SEC
C - - - - - 0x019592 06:9582: BD E8 03  LDA ram_spd_X_lo_player,X
C - - - - - 0x019595 06:9585: E9 10     SBC #$10
C - - - - - 0x019597 06:9587: 9D E8 03  STA ram_spd_X_lo_player,X
C - - - - - 0x01959A 06:958A: BD F6 03  LDA ram_spd_X_hi_player,X
C - - - - - 0x01959D 06:958D: E9 00     SBC #$00
C - - - - - 0x01959F 06:958F: 9D F6 03  STA ram_spd_X_hi_player,X
C - - - - - 0x0195A2 06:9592: 10 08     BPL bra_959C
bra_9594:
C - - - - - 0x0195A4 06:9594: A9 00     LDA #$00
C - - - - - 0x0195A6 06:9596: 9D E8 03  STA ram_spd_X_lo_player,X
C - - - - - 0x0195A9 06:9599: 9D F6 03  STA ram_spd_X_hi_player,X
bra_959C:
loc_959C:
C D 0 - - - 0x0195AC 06:959C: BD 12 04  LDA ram_spd_Y_hi_player,X
C - - - - - 0x0195AF 06:959F: F0 2E     BEQ bra_95CF
C - - - - - 0x0195B1 06:95A1: 49 FF     EOR #$FF
C - - - - - 0x0195B3 06:95A3: F0 14     BEQ bra_95B9
C - - - - - 0x0195B5 06:95A5: 38        SEC
C - - - - - 0x0195B6 06:95A6: BD 04 04  LDA ram_spd_Y_lo_player,X
C - - - - - 0x0195B9 06:95A9: E5 32     SBC ram_0032
C - - - - - 0x0195BB 06:95AB: 9D 04 04  STA ram_spd_Y_lo_player,X
C - - - - - 0x0195BE 06:95AE: BD 12 04  LDA ram_spd_Y_hi_player,X
C - - - - - 0x0195C1 06:95B1: E5 33     SBC ram_0033
C - - - - - 0x0195C3 06:95B3: 9D 12 04  STA ram_spd_Y_hi_player,X
C - - - - - 0x0195C6 06:95B6: 4C EA 95  RTS
bra_95B9:
C - - - - - 0x0195C9 06:95B9: 18        CLC
C - - - - - 0x0195CA 06:95BA: BD 04 04  LDA ram_spd_Y_lo_player,X
C - - - - - 0x0195CD 06:95BD: 69 10     ADC #$10
C - - - - - 0x0195CF 06:95BF: 9D 04 04  STA ram_spd_Y_lo_player,X
C - - - - - 0x0195D2 06:95C2: BD 12 04  LDA ram_spd_Y_hi_player,X
C - - - - - 0x0195D5 06:95C5: 69 00     ADC #$00
C - - - - - 0x0195D7 06:95C7: 9D 12 04  STA ram_spd_Y_hi_player,X
C - - - - - 0x0195DA 06:95CA: 10 16     BPL bra_95E2
C - - - - - 0x0195DC 06:95CC: 4C EA 95  RTS
bra_95CF:
C - - - - - 0x0195DF 06:95CF: 38        SEC
C - - - - - 0x0195E0 06:95D0: BD 04 04  LDA ram_spd_Y_lo_player,X
C - - - - - 0x0195E3 06:95D3: E9 10     SBC #$10
C - - - - - 0x0195E5 06:95D5: 9D 04 04  STA ram_spd_Y_lo_player,X
C - - - - - 0x0195E8 06:95D8: BD 12 04  LDA ram_spd_Y_hi_player,X
C - - - - - 0x0195EB 06:95DB: E9 00     SBC #$00
C - - - - - 0x0195ED 06:95DD: 9D 12 04  STA ram_spd_Y_hi_player,X
C - - - - - 0x0195F0 06:95E0: 10 08     BPL bra_95EA_RTS
bra_95E2:
C - - - - - 0x0195F2 06:95E2: A9 00     LDA #$00
C - - - - - 0x0195F4 06:95E4: 9D 04 04  STA ram_spd_Y_lo_player,X
C - - - - - 0x0195F7 06:95E7: 9D 12 04  STA ram_spd_Y_hi_player,X
bra_95EA_RTS:
C D 0 - - - 0x0195FA 06:95EA: 60        RTS



tbl_95EB:
- D 0 - - - 0x0195FB 06:95EB: 18        .byte $18
- D 0 - - - 0x0195FC 06:95EC: 30        .byte $30
- D 0 - - - 0x0195FD 06:95ED: 10        .byte $10
- D 0 - - - 0x0195FE 06:95EE: 18        .byte $18
- - - - - - 0x0195FF 06:95EF: 18        .byte $18
- - - - - - 0x019600 06:95F0: 20        .byte $20
- D 0 - - - 0x019601 06:95F1: 18        .byte $18
- D 0 - - - 0x019602 06:95F2: 30        .byte $30
- D 0 - - - 0x019603 06:95F3: 10        .byte $10
- - - - - - 0x019604 06:95F4: 18        .byte $18
- - - - - - 0x019605 06:95F5: 18        .byte $18
- - - - - - 0x019606 06:95F6: 20        .byte $20
- - - - - - 0x019607 06:95F7: 18        .byte $18
- - - - - - 0x019608 06:95F8: 30        .byte $30
- - - - - - 0x019609 06:95F9: 10        .byte $10
- - - - - - 0x01960A 06:95FA: 18        .byte $18
- - - - - - 0x01960B 06:95FB: 18        .byte $18
- - - - - - 0x01960C 06:95FC: 20        .byte $20
- - - - - - 0x01960D 06:95FD: 30        .byte $30
- - - - - - 0x01960E 06:95FE: 30        .byte $30
- - - - - - 0x01960F 06:95FF: 20        .byte $20
- - - - - - 0x019610 06:9600: 30        .byte $30
- - - - - - 0x019611 06:9601: 40        .byte $40
- - - - - - 0x019612 06:9602: 40        .byte $40
- - - - - - 0x019613 06:9603: 30        .byte $30
- - - - - - 0x019614 06:9604: 30        .byte $30
- - - - - - 0x019615 06:9605: 20        .byte $20
- - - - - - 0x019616 06:9606: 30        .byte $30
- - - - - - 0x019617 06:9607: 40        .byte $40
- - - - - - 0x019618 06:9608: 40        .byte $40



sub_9609:
C - - - - - 0x019619 06:9609: AD 25 05  LDA ram_timer_electric_ball
C - - - - - 0x01961C 06:960C: F0 22     BEQ bra_9630    ; если не наэлектризован
C - - - - - 0x01961E 06:960E: A5 5C     LDA ram_flag_gameplay
C - - - - - 0x019620 06:9610: 29 40     AND #$40
C - - - - - 0x019622 06:9612: F0 08     BEQ bra_961C
C - - - - - 0x019624 06:9614: A9 00     LDA #$00
C - - - - - 0x019626 06:9616: 8D 25 05  STA ram_timer_electric_ball
C - - - - - 0x019629 06:9619: 4C 30 96  JMP loc_9630
bra_961C:
C - - - - - 0x01962C 06:961C: A9 00     LDA #$00
C - - - - - 0x01962E 06:961E: 8D 0D 05  STA ram_timer_wet_ball
C - - - - - 0x019631 06:9621: AD 00 03  LDA ram_frame_cnt
C - - - - - 0x019634 06:9624: 29 01     AND #$01
C - - - - - 0x019636 06:9626: F0 08     BEQ bra_9630
C - - - - - 0x019638 06:9628: CE 25 05  DEC ram_timer_electric_ball
C - - - - - 0x01963B 06:962B: A9 07     LDA #$07
C - - - - - 0x01963D 06:962D: 4C 3B 96  JMP loc_963B
bra_9630:
loc_9630:
C D 0 - - - 0x019640 06:9630: BD 74 00  LDA ram_animation_id_player,X
C - - - - - 0x019643 06:9633: 29 7F     AND #$7F
C - - - - - 0x019645 06:9635: C9 07     CMP #$07
C - - - - - 0x019647 06:9637: D0 08     BNE bra_9641_RTS
- - - - - - 0x019649 06:9639: 29 03     AND #$03
loc_963B:
C D 0 - - - 0x01964B 06:963B: 1D A3 04  ORA ram_направление_движения,X
C - - - - - 0x01964E 06:963E: 9D 74 00  STA ram_animation_id_player,X
bra_9641_RTS:
C - - - - - 0x019651 06:9641: 60        RTS



sub_9642:
C - - - - - 0x019652 06:9642: BD A3 04  LDA ram_направление_движения,X
C - - - - - 0x019655 06:9645: 85 1D     STA ram_001D
C - - - - - 0x019657 06:9647: BD 94 00  LDA ram_номер_кадра_анимации,X
C - - - - - 0x01965A 06:964A: 29 03     AND #$03
C - - - - - 0x01965C 06:964C: 9D 74 00  STA ram_animation_id_player,X
C - - - - - 0x01965F 06:964F: BD F6 03  LDA ram_spd_X_hi_player,X
C - - - - - 0x019662 06:9652: 1D E8 03  ORA ram_spd_X_lo_player,X
C - - - - - 0x019665 06:9655: 1D 12 04  ORA ram_spd_Y_hi_player,X
C - - - - - 0x019668 06:9658: 1D 04 04  ORA ram_spd_Y_lo_player,X
C - - - - - 0x01966B 06:965B: 1D 2E 04  ORA ram_spd_Z_hi_player,X
C - - - - - 0x01966E 06:965E: 1D 20 04  ORA ram_spd_Z_lo_player,X
C - - - - - 0x019671 06:9661: D0 03     BNE bra_9666
C - - - - - 0x019673 06:9663: 4C C7 96  JMP loc_96C7
bra_9666:
C - - - - - 0x019676 06:9666: BD F6 03  LDA ram_spd_X_hi_player,X
C - - - - - 0x019679 06:9669: 29 80     AND #$80
C - - - - - 0x01967B 06:966B: 49 80     EOR #$80
C - - - - - 0x01967D 06:966D: 85 1D     STA ram_001D
C - - - - - 0x01967F 06:966F: BD F6 03  LDA ram_spd_X_hi_player,X
C - - - - - 0x019682 06:9672: 10 0F     BPL bra_9683
C - - - - - 0x019684 06:9674: 18        CLC
C - - - - - 0x019685 06:9675: BD E8 03  LDA ram_spd_X_lo_player,X
C - - - - - 0x019688 06:9678: 49 FF     EOR #$FF
C - - - - - 0x01968A 06:967A: 69 01     ADC #$01
C - - - - - 0x01968C 06:967C: BD F6 03  LDA ram_spd_X_hi_player,X
C - - - - - 0x01968F 06:967F: 49 FF     EOR #$FF
C - - - - - 0x019691 06:9681: 69 00     ADC #$00
bra_9683:
C - - - - - 0x019693 06:9683: 85 1C     STA ram_001C
C - - - - - 0x019695 06:9685: BD 12 04  LDA ram_spd_Y_hi_player,X
C - - - - - 0x019698 06:9688: 10 0F     BPL bra_9699
C - - - - - 0x01969A 06:968A: 18        CLC
C - - - - - 0x01969B 06:968B: BD 04 04  LDA ram_spd_Y_lo_player,X
C - - - - - 0x01969E 06:968E: 49 FF     EOR #$FF
C - - - - - 0x0196A0 06:9690: 69 01     ADC #$01
C - - - - - 0x0196A2 06:9692: BD 12 04  LDA ram_spd_Y_hi_player,X
C - - - - - 0x0196A5 06:9695: 49 FF     EOR #$FF
C - - - - - 0x0196A7 06:9697: 69 00     ADC #$00
bra_9699:
C - - - - - 0x0196A9 06:9699: 18        CLC
C - - - - - 0x0196AA 06:969A: 65 1C     ADC ram_001C
C - - - - - 0x0196AC 06:969C: A0 FF     LDY #$FF
bra_969E:
C - - - - - 0x0196AE 06:969E: C8        INY
C - - - - - 0x0196AF 06:969F: D9 D0 96  CMP tbl_96D0,Y
C - - - - - 0x0196B2 06:96A2: 90 FA     BCC bra_969E
C - - - - - 0x0196B4 06:96A4: FE 87 00  INC ram_animation_timer_player,X
C - - - - - 0x0196B7 06:96A7: BD 87 00  LDA ram_animation_timer_player,X
C - - - - - 0x0196BA 06:96AA: D9 D5 96  CMP tbl_96D5,Y
C - - - - - 0x0196BD 06:96AD: 90 18     BCC bra_96C7
C - - - - - 0x0196BF 06:96AF: A9 00     LDA #$00
C - - - - - 0x0196C1 06:96B1: 9D 87 00  STA ram_animation_timer_player,X
C - - - - - 0x0196C4 06:96B4: 18        CLC
C - - - - - 0x0196C5 06:96B5: BD 94 00  LDA ram_номер_кадра_анимации,X
C - - - - - 0x0196C8 06:96B8: 29 03     AND #$03
C - - - - - 0x0196CA 06:96BA: 69 01     ADC #$01
C - - - - - 0x0196CC 06:96BC: 29 03     AND #$03
C - - - - - 0x0196CE 06:96BE: 9D 94 00  STA ram_номер_кадра_анимации,X
C - - - - - 0x0196D1 06:96C1: BD 94 00  LDA ram_номер_кадра_анимации,X
C - - - - - 0x0196D4 06:96C4: 9D 74 00  STA ram_animation_id_player,X
bra_96C7:
loc_96C7:
C D 0 - - - 0x0196D7 06:96C7: BD 74 00  LDA ram_animation_id_player,X
C - - - - - 0x0196DA 06:96CA: 05 1D     ORA ram_001D
C - - - - - 0x0196DC 06:96CC: 9D 74 00  STA ram_animation_id_player,X
C - - - - - 0x0196DF 06:96CF: 60        RTS



tbl_96D0:
- D 0 - - - 0x0196E0 06:96D0: 04        .byte $04   ; 
- D 0 - - - 0x0196E1 06:96D1: 03        .byte $03   ; 
- D 0 - - - 0x0196E2 06:96D2: 02        .byte $02   ; 
- D 0 - - - 0x0196E3 06:96D3: 01        .byte $01   ; 
- D 0 - - - 0x0196E4 06:96D4: 00        .byte $00   ; 



tbl_96D5:
- D 0 - - - 0x0196E5 06:96D5: 01        .byte $01   ; 
- D 0 - - - 0x0196E6 06:96D6: 02        .byte $02   ; 
- D 0 - - - 0x0196E7 06:96D7: 03        .byte $03   ; 
- D 0 - - - 0x0196E8 06:96D8: 04        .byte $04   ; 
- D 0 - - - 0x0196E9 06:96D9: 05        .byte $05   ; 



sub_96DA:
C - - - - - 0x0196EA 06:96DA: AD 10 05  LDA ram_подтип_супера
C - - - - - 0x0196ED 06:96DD: D0 3F     BNE bra_971E_RTS
C - - - - - 0x0196EF 06:96DF: AC D6 04  LDY ram_игрок_с_мячом
C - - - - - 0x0196F2 06:96E2: B9 50 06  LDA ram_позиция_управление,Y
C - - - - - 0x0196F5 06:96E5: 30 37     BMI bra_971E_RTS
C - - - - - 0x0196F7 06:96E7: B9 B0 04  LDA ram_смена_угла_движения,Y
C - - - - - 0x0196FA 06:96EA: C9 FF     CMP #$FF
C - - - - - 0x0196FC 06:96EC: F0 30     BEQ bra_971E_RTS
C - - - - - 0x0196FE 06:96EE: 4A        LSR
C - - - - - 0x0196FF 06:96EF: 4A        LSR
C - - - - - 0x019700 06:96F0: 4A        LSR
C - - - - - 0x019701 06:96F1: 4A        LSR
C - - - - - 0x019702 06:96F2: 29 FE     AND #$FE
C - - - - - 0x019704 06:96F4: A8        TAY
C - - - - - 0x019705 06:96F5: B9 20 97  LDA tbl_9720,Y
C - - - - - 0x019708 06:96F8: 5D 12 04  EOR ram_spd_Y_hi_player,X
C - - - - - 0x01970B 06:96FB: 30 0E     BMI bra_970B
C - - - - - 0x01970D 06:96FD: BD 12 04  LDA ram_spd_Y_hi_player,X
C - - - - - 0x019710 06:9700: 10 05     BPL bra_9707
C - - - - - 0x019712 06:9702: 18        CLC
C - - - - - 0x019713 06:9703: 49 FF     EOR #$FF
C - - - - - 0x019715 06:9705: 69 01     ADC #$01
bra_9707:
C - - - - - 0x019717 06:9707: C9 04     CMP #$04
C - - - - - 0x019719 06:9709: B0 13     BCS bra_971E_RTS
bra_970B:
C - - - - - 0x01971B 06:970B: 18        CLC
C - - - - - 0x01971C 06:970C: BD 04 04  LDA ram_spd_Y_lo_player,X
C - - - - - 0x01971F 06:970F: 79 1F 97  ADC tbl_971F,Y
C - - - - - 0x019722 06:9712: 9D 04 04  STA ram_spd_Y_lo_player,X
C - - - - - 0x019725 06:9715: BD 12 04  LDA ram_spd_Y_hi_player,X
C - - - - - 0x019728 06:9718: 79 20 97  ADC tbl_9720,Y
C - - - - - 0x01972B 06:971B: 9D 12 04  STA ram_spd_Y_hi_player,X
bra_971E_RTS:
C - - - - - 0x01972E 06:971E: 60        RTS



tbl_971F:
- D 0 - - - 0x01972F 06:971F: 80        .byte $80   ; 
tbl_9720:
- D 0 - - - 0x019730 06:9720: FF        .byte $FF   ; 
- D 0 - - - 0x019731 06:9721: 80        .byte $80   ; 
- D 0 - - - 0x019732 06:9722: FF        .byte $FF   ; 
- D 0 - - - 0x019733 06:9723: 00        .byte $00   ; 
- D 0 - - - 0x019734 06:9724: 00        .byte $00   ; 
- D 0 - - - 0x019735 06:9725: 80        .byte $80   ; 
- D 0 - - - 0x019736 06:9726: 00        .byte $00   ; 
- D 0 - - - 0x019737 06:9727: 80        .byte $80   ; 
- D 0 - - - 0x019738 06:9728: 00        .byte $00   ; 
- - - - - - 0x019739 06:9729: 80        .byte $80   ; 
- - - - - - 0x01973A 06:972A: 00        .byte $00   ; 
- D 0 - - - 0x01973B 06:972B: 00        .byte $00   ; 
- D 0 - - - 0x01973C 06:972C: 00        .byte $00   ; 
- - - - - - 0x01973D 06:972D: 80        .byte $80   ; 
- - - - - - 0x01973E 06:972E: FF        .byte $FF   ; 



sub_972F:
C - - - - - 0x01973F 06:972F: 20 7B 97  JSR sub_977B
C - - - - - 0x019742 06:9732: BD 30 01  LDA ram_surface_player,X
C - - - - - 0x019745 06:9735: D0 0B     BNE bra_9742_не_на_траве
C - - - - - 0x019747 06:9737: A9 00     LDA #$00
C - - - - - 0x019749 06:9739: 9D 73 03  STA ram_pos_Z_sub_player,X
C - - - - - 0x01974C 06:973C: 9D 86 03  STA ram_pos_Z_lo_player,X
C - - - - - 0x01974F 06:973F: 9D 99 03  STA ram_pos_Z_hi_player,X
bra_9742_не_на_траве:
C - - - - - 0x019752 06:9742: AC D6 04  LDY ram_игрок_с_мячом
C - - - - - 0x019755 06:9745: B9 14 03  LDA ram_pos_X_lo_player,Y
C - - - - - 0x019758 06:9748: 9D 14 03  STA ram_pos_X_lo_player,X
C - - - - - 0x01975B 06:974B: B9 27 03  LDA ram_pos_X_hi_player,Y
C - - - - - 0x01975E 06:974E: 9D 27 03  STA ram_pos_X_hi_player,X
C - - - - - 0x019761 06:9751: 18        CLC
C - - - - - 0x019762 06:9752: B9 4D 03  LDA ram_pos_Y_lo_player,Y
C - - - - - 0x019765 06:9755: 69 01     ADC #$01
C - - - - - 0x019767 06:9757: 9D 4D 03  STA ram_pos_Y_lo_player,X
C - - - - - 0x01976A 06:975A: B9 60 03  LDA ram_pos_Y_hi_player,Y
C - - - - - 0x01976D 06:975D: 69 00     ADC #$00
C - - - - - 0x01976F 06:975F: 9D 60 03  STA ram_pos_Y_hi_player,X
C - - - - - 0x019772 06:9762: B9 E8 03  LDA ram_spd_X_lo_player,Y
C - - - - - 0x019775 06:9765: 9D E8 03  STA ram_spd_X_lo_player,X
C - - - - - 0x019778 06:9768: B9 F6 03  LDA ram_spd_X_hi_player,Y
C - - - - - 0x01977B 06:976B: 9D F6 03  STA ram_spd_X_hi_player,X
C - - - - - 0x01977E 06:976E: B9 04 04  LDA ram_spd_Y_lo_player,Y
C - - - - - 0x019781 06:9771: 9D 04 04  STA ram_spd_Y_lo_player,X
C - - - - - 0x019784 06:9774: B9 12 04  LDA ram_spd_Y_hi_player,Y
C - - - - - 0x019787 06:9777: 9D 12 04  STA ram_spd_Y_hi_player,X
C - - - - - 0x01978A 06:977A: 60        RTS



sub_977B:
C - - - - - 0x01978B 06:977B: BD D9 00  LDA ram_flag_visible_player,X
C - - - - - 0x01978E 06:977E: D0 07     BNE bra_9787
C - - - - - 0x019790 06:9780: A9 00     LDA #$00
C - - - - - 0x019792 06:9782: 9D 30 01  STA ram_surface_player,X
C - - - - - 0x019795 06:9785: F0 29     BEQ bra_97B0_RTS    ; если на траве
bra_9787:
C - - - - - 0x019797 06:9787: A5 58     LDA ram_script
C - - - - - 0x019799 06:9789: D0 25     BNE bra_97B0_RTS    ; если не игра на поле
C - - - - - 0x01979B 06:978B: 20 F0 E6  JSR sub_0x01E700
C - - - - - 0x01979E 06:978E: BD 30 01  LDA ram_surface_player,X
C - - - - - 0x0197A1 06:9791: F0 1D     BEQ bra_97B0_RTS    ; если на траве
C - - - - - 0x0197A3 06:9793: AD 92 04  LDA ram_мяч_состояние
C - - - - - 0x0197A6 06:9796: 29 10     AND #$10
C - - - - - 0x0197A8 06:9798: D0 16     BNE bra_97B0_RTS
C - - - - - 0x0197AA 06:979A: AD 92 04  LDA ram_мяч_состояние
C - - - - - 0x0197AD 06:979D: 0A        ASL
C - - - - - 0x0197AE 06:979E: 0D 92 04  ORA ram_мяч_состояние
C - - - - - 0x0197B1 06:97A1: 10 0A     BPL bra_97AD
C - - - - - 0x0197B3 06:97A3: BD 99 03  LDA ram_pos_Z_hi_player,X
C - - - - - 0x0197B6 06:97A6: 30 05     BMI bra_97AD
C - - - - - 0x0197B8 06:97A8: 1D 86 03  ORA ram_pos_Z_lo_player,X
C - - - - - 0x0197BB 06:97AB: D0 03     BNE bra_97B0_RTS
bra_97AD:
C - - - - - 0x0197BD 06:97AD: 20 F3 D7  JSR sub_0x01D803
bra_97B0_RTS:
C - - - - - 0x0197C0 06:97B0: 60        RTS



sub_97B1:
C - - - - - 0x0197C1 06:97B1: BD 30 01  LDA ram_surface_player,X
C - - - - - 0x0197C4 06:97B4: C9 01     CMP #con_НА_ЛУЖЕ
C - - - - - 0x0197C6 06:97B6: D0 0D     BNE bra_97C5_RTS
C - - - - - 0x0197C8 06:97B8: 18        CLC
C - - - - - 0x0197C9 06:97B9: AD 0D 05  LDA ram_timer_wet_ball
C - - - - - 0x0197CC 06:97BC: 69 01     ADC #$01
C - - - - - 0x0197CE 06:97BE: 90 02     BCC bra_97C2
- - - - - - 0x0197D0 06:97C0: A9 FF     LDA #$FF
bra_97C2:
C - - - - - 0x0197D2 06:97C2: 8D 0D 05  STA ram_timer_wet_ball
bra_97C5_RTS:
C - - - - - 0x0197D5 06:97C5: 60        RTS



sub_97C6:
C - - - - - 0x0197D6 06:97C6: 0A        ASL
C - - - - - 0x0197D7 06:97C7: 0A        ASL
C - - - - - 0x0197D8 06:97C8: 85 1C     STA ram_001C
C - - - - - 0x0197DA 06:97CA: AC D6 04  LDY ram_игрок_с_мячом
C - - - - - 0x0197DD 06:97CD: B9 E8 03  LDA ram_spd_X_lo_player,Y
C - - - - - 0x0197E0 06:97D0: 9D E8 03  STA ram_spd_X_lo_player,X
C - - - - - 0x0197E3 06:97D3: B9 F6 03  LDA ram_spd_X_hi_player,Y
C - - - - - 0x0197E6 06:97D6: 9D F6 03  STA ram_spd_X_hi_player,X
C - - - - - 0x0197E9 06:97D9: B9 04 04  LDA ram_spd_Y_lo_player,Y
C - - - - - 0x0197EC 06:97DC: 9D 04 04  STA ram_spd_Y_lo_player,X
C - - - - - 0x0197EF 06:97DF: B9 12 04  LDA ram_spd_Y_hi_player,Y
C - - - - - 0x0197F2 06:97E2: 9D 12 04  STA ram_spd_Y_hi_player,X
C - - - - - 0x0197F5 06:97E5: B9 14 03  LDA ram_pos_X_lo_player,Y
C - - - - - 0x0197F8 06:97E8: 85 2C     STA ram_002C
C - - - - - 0x0197FA 06:97EA: B9 27 03  LDA ram_pos_X_hi_player,Y
C - - - - - 0x0197FD 06:97ED: 85 2D     STA ram_002D
C - - - - - 0x0197FF 06:97EF: B9 A3 04  LDA ram_направление_движения,Y
C - - - - - 0x019802 06:97F2: 0A        ASL
C - - - - - 0x019803 06:97F3: A4 1C     LDY ram_001C
C - - - - - 0x019805 06:97F5: 90 02     BCC bra_97F9
C - - - - - 0x019807 06:97F7: C8        INY
C - - - - - 0x019808 06:97F8: C8        INY
bra_97F9:
C - - - - - 0x019809 06:97F9: 18        CLC
C - - - - - 0x01980A 06:97FA: A5 2C     LDA ram_002C
C - - - - - 0x01980C 06:97FC: 79 2F 98  ADC tbl_982F,Y
C - - - - - 0x01980F 06:97FF: 85 2C     STA ram_002C
C - - - - - 0x019811 06:9801: A5 2D     LDA ram_002D
C - - - - - 0x019813 06:9803: 79 30 98  ADC tbl_9830,Y
C - - - - - 0x019816 06:9806: 85 2D     STA ram_002D
C - - - - - 0x019818 06:9808: A4 1C     LDY ram_001C
C - - - - - 0x01981A 06:980A: 38        SEC
C - - - - - 0x01981B 06:980B: A5 2C     LDA ram_002C
C - - - - - 0x01981D 06:980D: FD 14 03  SBC ram_pos_X_lo_player,X
C - - - - - 0x019820 06:9810: F0 1C     BEQ bra_982E_RTS
C - - - - - 0x019822 06:9812: A5 2D     LDA ram_002D
C - - - - - 0x019824 06:9814: FD 27 03  SBC ram_pos_X_hi_player,X
C - - - - - 0x019827 06:9817: 10 02     BPL bra_981B
C - - - - - 0x019829 06:9819: C8        INY
C - - - - - 0x01982A 06:981A: C8        INY
bra_981B:
C - - - - - 0x01982B 06:981B: 18        CLC
C - - - - - 0x01982C 06:981C: BD E8 03  LDA ram_spd_X_lo_player,X
C - - - - - 0x01982F 06:981F: 79 37 98  ADC tbl_9837,Y
C - - - - - 0x019832 06:9822: 9D E8 03  STA ram_spd_X_lo_player,X
C - - - - - 0x019835 06:9825: BD F6 03  LDA ram_spd_X_hi_player,X
C - - - - - 0x019838 06:9828: 79 38 98  ADC tbl_9838,Y
C - - - - - 0x01983B 06:982B: 9D F6 03  STA ram_spd_X_hi_player,X
bra_982E_RTS:
C - - - - - 0x01983E 06:982E: 60        RTS



tbl_982F:
- D 0 - - - 0x01983F 06:982F: 0A        .byte $0A   ; 
tbl_9830:
- D 0 - - - 0x019840 06:9830: 00        .byte $00   ; 
- D 0 - - - 0x019841 06:9831: F6        .byte $F6   ; 
- D 0 - - - 0x019842 06:9832: FF        .byte $FF   ; 
- D 0 - - - 0x019843 06:9833: 08        .byte $08   ; 
- D 0 - - - 0x019844 06:9834: 00        .byte $00   ; 
- D 0 - - - 0x019845 06:9835: F8        .byte $F8   ; 
- D 0 - - - 0x019846 06:9836: FF        .byte $FF   ; 



tbl_9837:
- D 0 - - - 0x019847 06:9837: 80        .byte $80   ; 
tbl_9838:
- D 0 - - - 0x019848 06:9838: 00        .byte $00   ; 
- D 0 - - - 0x019849 06:9839: 80        .byte $80   ; 
- D 0 - - - 0x01984A 06:983A: FF        .byte $FF   ; 
- D 0 - - - 0x01984B 06:983B: 30        .byte $30   ; 
- D 0 - - - 0x01984C 06:983C: 00        .byte $00   ; 
- D 0 - - - 0x01984D 06:983D: D0        .byte $D0   ; 
- D 0 - - - 0x01984E 06:983E: FF        .byte $FF   ; 



sub_983F:
C - - - - - 0x01984F 06:983F: BD 99 03  LDA ram_pos_Z_hi_player,X
C - - - - - 0x019852 06:9842: 10 10     BPL bra_9854_RTS
C - - - - - 0x019854 06:9844: A9 FF     LDA #$FF
C - - - - - 0x019856 06:9846: 9D 99 03  STA ram_pos_Z_hi_player,X
C - - - - - 0x019859 06:9849: AD 55 98  LDA tbl_9855
C - - - - - 0x01985C 06:984C: DD 86 03  CMP ram_pos_Z_lo_player,X
C - - - - - 0x01985F 06:984F: 90 03     BCC bra_9854_RTS
- - - - - - 0x019861 06:9851: 9D 86 03  STA ram_pos_Z_lo_player,X
bra_9854_RTS:
C - - - - - 0x019864 06:9854: 60        RTS

; bzk
tbl_9855:
- D 0 - - - 0x019865 06:9855: FC        .byte $FC   ; 



sub_9856:
C - - - - - 0x019866 06:9856: A9 00     LDA #$00
C - - - - - 0x019868 06:9858: 8D F0 04  STA ram_hp_ball
C - - - - - 0x01986B 06:985B: 8D C9 04  STA ram_timer_action_ball
C - - - - - 0x01986E 06:985E: 8D 10 05  STA ram_подтип_супера
C - - - - - 0x019871 06:9861: A9 80     LDA #$80
C - - - - - 0x019873 06:9863: 8D 0F 05  STA ram_номер_супера
C - - - - - 0x019876 06:9866: 60        RTS



loc_9867_начальная_X_Y_скорость_мяча:
sub_9867_начальная_X_Y_скорость_мяча:
C D 0 - - - 0x019877 06:9867: A9 00     LDA #$00
C - - - - - 0x019879 06:9869: 85 1D     STA ram_001D
C - - - - - 0x01987B 06:986B: 85 1E     STA ram_001E
C - - - - - 0x01987D 06:986D: 85 1F     STA ram_001F
C - - - - - 0x01987F 06:986F: 85 20     STA ram_0020
C - - - - - 0x019881 06:9871: 9D E8 03  STA ram_spd_X_lo_player,X
C - - - - - 0x019884 06:9874: 9D F6 03  STA ram_spd_X_hi_player,X
C - - - - - 0x019887 06:9877: 9D 04 04  STA ram_spd_Y_lo_player,X
C - - - - - 0x01988A 06:987A: 9D 12 04  STA ram_spd_Y_hi_player,X
C - - - - - 0x01988D 06:987D: A5 2F     LDA ram_002F
C - - - - - 0x01988F 06:987F: 10 02     BPL bra_9883
C - - - - - 0x019891 06:9881: C6 1D     DEC ram_001D
bra_9883:
C - - - - - 0x019893 06:9883: A5 31     LDA ram_0031
C - - - - - 0x019895 06:9885: 10 02     BPL bra_9889
C - - - - - 0x019897 06:9887: C6 1E     DEC ram_001E
bra_9889:
loc_9889_loop:
C D 0 - - - 0x019899 06:9889: A5 2C     LDA ram_002C
C - - - - - 0x01989B 06:988B: 05 2D     ORA ram_002D
C - - - - - 0x01989D 06:988D: F0 43     BEQ bra_98D2_RTS
C - - - - - 0x01989F 06:988F: 46 2D     LSR ram_002D
C - - - - - 0x0198A1 06:9891: 66 2C     ROR ram_002C
C - - - - - 0x0198A3 06:9893: 90 2E     BCC bra_98C3
C - - - - - 0x0198A5 06:9895: 18        CLC
C - - - - - 0x0198A6 06:9896: A5 1F     LDA ram_001F
C - - - - - 0x0198A8 06:9898: 65 2E     ADC ram_002E
C - - - - - 0x0198AA 06:989A: 85 1F     STA ram_001F
C - - - - - 0x0198AC 06:989C: BD E8 03  LDA ram_spd_X_lo_player,X
C - - - - - 0x0198AF 06:989F: 65 2F     ADC ram_002F
C - - - - - 0x0198B1 06:98A1: 9D E8 03  STA ram_spd_X_lo_player,X
C - - - - - 0x0198B4 06:98A4: BD F6 03  LDA ram_spd_X_hi_player,X
C - - - - - 0x0198B7 06:98A7: 65 1D     ADC ram_001D
C - - - - - 0x0198B9 06:98A9: 9D F6 03  STA ram_spd_X_hi_player,X
C - - - - - 0x0198BC 06:98AC: 18        CLC
C - - - - - 0x0198BD 06:98AD: A5 20     LDA ram_0020
C - - - - - 0x0198BF 06:98AF: 65 30     ADC ram_0030
C - - - - - 0x0198C1 06:98B1: 85 20     STA ram_0020
C - - - - - 0x0198C3 06:98B3: BD 04 04  LDA ram_spd_Y_lo_player,X
C - - - - - 0x0198C6 06:98B6: 65 31     ADC ram_0031
C - - - - - 0x0198C8 06:98B8: 9D 04 04  STA ram_spd_Y_lo_player,X
C - - - - - 0x0198CB 06:98BB: BD 12 04  LDA ram_spd_Y_hi_player,X
C - - - - - 0x0198CE 06:98BE: 65 1E     ADC ram_001E
C - - - - - 0x0198D0 06:98C0: 9D 12 04  STA ram_spd_Y_hi_player,X
bra_98C3:
C - - - - - 0x0198D3 06:98C3: 06 2E     ASL ram_002E
C - - - - - 0x0198D5 06:98C5: 26 2F     ROL ram_002F
C - - - - - 0x0198D7 06:98C7: 26 1D     ROL ram_001D
C - - - - - 0x0198D9 06:98C9: 06 30     ASL ram_0030
C - - - - - 0x0198DB 06:98CB: 26 31     ROL ram_0031
C - - - - - 0x0198DD 06:98CD: 26 1E     ROL ram_001E
C - - - - - 0x0198DF 06:98CF: 4C 89 98  JMP loc_9889_loop
bra_98D2_RTS:
C - - - - - 0x0198E2 06:98D2: 60        RTS



sub_98D3_начальная_Z_скорость_мяча:
C - - - - - 0x0198E3 06:98D3: BD 20 04  LDA ram_spd_Z_lo_player,X
C - - - - - 0x0198E6 06:98D6: 1D 2E 04  ORA ram_spd_Z_hi_player,X
C - - - - - 0x0198E9 06:98D9: F0 29     BEQ bra_9904_RTS
C - - - - - 0x0198EB 06:98DB: BD 20 04  LDA ram_spd_Z_lo_player,X
C - - - - - 0x0198EE 06:98DE: 85 2E     STA ram_002E
C - - - - - 0x0198F0 06:98E0: 0A        ASL
C - - - - - 0x0198F1 06:98E1: 85 2C     STA ram_002C
C - - - - - 0x0198F3 06:98E3: BD 2E 04  LDA ram_spd_Z_hi_player,X
C - - - - - 0x0198F6 06:98E6: 85 2F     STA ram_002F
C - - - - - 0x0198F8 06:98E8: 2A        ROL
C - - - - - 0x0198F9 06:98E9: 85 2D     STA ram_002D
C - - - - - 0x0198FB 06:98EB: 06 2C     ASL ram_002C
C - - - - - 0x0198FD 06:98ED: 26 2D     ROL ram_002D
C - - - - - 0x0198FF 06:98EF: A5 2D     LDA ram_002D
C - - - - - 0x019901 06:98F1: 8D 24 05  STA ram_таймер_прицельного_паса
C - - - - - 0x019904 06:98F4: BD 73 03  LDA ram_pos_Z_sub_player,X
C - - - - - 0x019907 06:98F7: 85 30     STA ram_0030
C - - - - - 0x019909 06:98F9: BD 86 03  LDA ram_pos_Z_lo_player,X
C - - - - - 0x01990C 06:98FC: 85 31     STA ram_0031
loc_98FE_loop:
C D 0 - - - 0x01990E 06:98FE: A5 31     LDA ram_0031
C - - - - - 0x019910 06:9900: F0 02     BEQ bra_9904_RTS
C - - - - - 0x019912 06:9902: 10 01     BPL bra_9905
bra_9904_RTS:
C - - - - - 0x019914 06:9904: 60        RTS
bra_9905:
C - - - - - 0x019915 06:9905: EE 24 05  INC ram_таймер_прицельного_паса
C - - - - - 0x019918 06:9908: 38        SEC
C - - - - - 0x019919 06:9909: A5 30     LDA ram_0030
C - - - - - 0x01991B 06:990B: E5 2E     SBC ram_002E
C - - - - - 0x01991D 06:990D: 85 30     STA ram_0030
C - - - - - 0x01991F 06:990F: A5 31     LDA ram_0031
C - - - - - 0x019921 06:9911: E5 2F     SBC ram_002F
C - - - - - 0x019923 06:9913: 85 31     STA ram_0031
C - - - - - 0x019925 06:9915: 18        CLC
C - - - - - 0x019926 06:9916: A5 2E     LDA ram_002E
C - - - - - 0x019928 06:9918: 7D 3C 04  ADC ram_gravity_lo_player,X
C - - - - - 0x01992B 06:991B: 85 2E     STA ram_002E
C - - - - - 0x01992D 06:991D: A5 2F     LDA ram_002F
C - - - - - 0x01992F 06:991F: 7D 4A 04  ADC ram_gravity_hi_player,X
C - - - - - 0x019932 06:9922: 85 2F     STA ram_002F
C - - - - - 0x019934 06:9924: 4C FE 98  JMP loc_98FE_loop



sub_9927_зафиксировать_и_очистить_анимацию_объекта:
C - - - - - 0x019937 06:9927: 09 80     ORA #$80
C - - - - - 0x019939 06:9929: 9D 59 04  STA ram_movement_id_player,X
C - - - - - 0x01993C 06:992C: A9 00     LDA #$00
C - - - - - 0x01993E 06:992E: 9D 87 00  STA ram_animation_timer_player,X
C - - - - - 0x019941 06:9931: 9D 94 00  STA ram_номер_кадра_анимации,X
C - - - - - 0x019944 06:9934: 9D 6C 04  STA ram_animation_sub_id_player,X
C - - - - - 0x019947 06:9937: 60        RTS


; bzk мусор
- - - - - - 0x019948 06:9938: DD 59 04  CMP ram_movement_id_player,X
- - - - - - 0x01994B 06:993B: F0 0E     BEQ bra_994B_RTS
- - - - - - 0x01994D 06:993D: 9D 59 04  STA ram_movement_id_player,X
- - - - - - 0x019950 06:9940: A9 00     LDA #$00
- - - - - - 0x019952 06:9942: 9D 87 00  STA ram_animation_timer_player,X
- - - - - - 0x019955 06:9945: 9D 94 00  STA ram_номер_кадра_анимации,X
- - - - - - 0x019958 06:9948: 9D 6C 04  STA ram_animation_sub_id_player,X
bra_994B_RTS:
- - - - - - 0x01995B 06:994B: 60        RTS



sub_994C:
C - - - - - 0x01995C 06:994C: A0 00     LDY #$00
C - - - - - 0x01995E 06:994E: BD 59 04  LDA ram_movement_id_player,X
C - - - - - 0x019961 06:9951: 29 7F     AND #$7F
C - - - - - 0x019963 06:9953: C9 21     CMP #$21
C - - - - - 0x019965 06:9955: D0 21     BNE bra_9978
C - - - - - 0x019967 06:9957: BD 86 04  LDA ram_игрок_состояние,X
C - - - - - 0x01996A 06:995A: 29 11     AND #$11
C - - - - - 0x01996C 06:995C: D0 10     BNE bra_996E
C - - - - - 0x01996E 06:995E: A0 00     LDY #$00
C - - - - - 0x019970 06:9960: BD D7 04  LDA ram_speed_type,X
C - - - - - 0x019973 06:9963: 30 26     BMI bra_998B
C - - - - - 0x019975 06:9965: BD 30 01  LDA ram_surface_player,X
C - - - - - 0x019978 06:9968: 29 03     AND #$03
C - - - - - 0x01997A 06:996A: A8        TAY
C - - - - - 0x01997B 06:996B: 4C 8B 99  JMP loc_998B
bra_996E:
C - - - - - 0x01997E 06:996E: A0 05     LDY #$05
C - - - - - 0x019980 06:9970: 29 10     AND #$10
C - - - - - 0x019982 06:9972: D0 17     BNE bra_998B
C - - - - - 0x019984 06:9974: C8        INY
C - - - - - 0x019985 06:9975: 4C 8B 99  JMP loc_998B
bra_9978:
C - - - - - 0x019988 06:9978: A0 04     LDY #$04
C - - - - - 0x01998A 06:997A: A9 1D     LDA #$1D
C - - - - - 0x01998C 06:997C: F0 0D     BEQ bra_998B
C - - - - - 0x01998E 06:997E: A0 07     LDY #$07
C - - - - - 0x019990 06:9980: A9 20     LDA #$20
C - - - - - 0x019992 06:9982: F0 07     BEQ bra_998B
C - - - - - 0x019994 06:9984: C8        INY
C - - - - - 0x019995 06:9985: C9 2A     CMP #$2A
C - - - - - 0x019997 06:9987: F0 02     BEQ bra_998B
C - - - - - 0x019999 06:9989: A0 07     LDY #$07
bra_998B:
loc_998B:
C D 0 - - - 0x01999B 06:998B: 84 1D     STY ram_001D
C - - - - - 0x01999D 06:998D: BD D7 04  LDA ram_speed_type,X
C - - - - - 0x0199A0 06:9990: 29 03     AND #$03
C - - - - - 0x0199A2 06:9992: 85 1E     STA ram_001E
C - - - - - 0x0199A4 06:9994: A5 1D     LDA ram_001D
C - - - - - 0x0199A6 06:9996: 0A        ASL
C - - - - - 0x0199A7 06:9997: 0A        ASL
C - - - - - 0x0199A8 06:9998: 05 1E     ORA ram_001E
C - - - - - 0x0199AA 06:999A: A8        TAY
C - - - - - 0x0199AB 06:999B: B9 BC 99  LDA tbl_99BC,Y
C - - - - - 0x0199AE 06:999E: 85 1C     STA ram_001C
C - - - - - 0x0199B0 06:99A0: A5 1D     LDA ram_001D
C - - - - - 0x0199B2 06:99A2: C9 05     CMP #$05
C - - - - - 0x0199B4 06:99A4: B0 13     BCS bra_99B9
C - - - - - 0x0199B6 06:99A6: A4 1E     LDY ram_001E
C - - - - - 0x0199B8 06:99A8: AD 0D 05  LDA ram_timer_wet_ball
C - - - - - 0x0199BB 06:99AB: 10 04     BPL bra_99B1
C - - - - - 0x0199BD 06:99AD: C8        INY
C - - - - - 0x0199BE 06:99AE: C8        INY
C - - - - - 0x0199BF 06:99AF: C8        INY
C - - - - - 0x0199C0 06:99B0: C8        INY
bra_99B1:
C - - - - - 0x0199C1 06:99B1: 38        SEC
C - - - - - 0x0199C2 06:99B2: A5 1C     LDA ram_001C
C - - - - - 0x0199C4 06:99B4: F9 E0 99  SBC tbl_99E0,Y
C - - - - - 0x0199C7 06:99B7: 85 1C     STA ram_001C
bra_99B9:
C - - - - - 0x0199C9 06:99B9: 4C F3 99  JMP loc_99F3_вычислить_скорость_движения_по_углу



tbl_99BC:
- D 0 - - - 0x0199CC 06:99BC: 40        .byte $40   ; 
- D 0 - - - 0x0199CD 06:99BD: 36        .byte $36   ; 
- D 0 - - - 0x0199CE 06:99BE: 34        .byte $34   ; 
- D 0 - - - 0x0199CF 06:99BF: 32        .byte $32   ; 
- D 0 - - - 0x0199D0 06:99C0: 34        .byte $34   ; 
- D 0 - - - 0x0199D1 06:99C1: 33        .byte $33   ; 
- D 0 - - - 0x0199D2 06:99C2: 32        .byte $32   ; 
- D 0 - - - 0x0199D3 06:99C3: 30        .byte $30   ; 
- - - - - - 0x0199D4 06:99C4: 24        .byte $24   ; 
- - - - - - 0x0199D5 06:99C5: 28        .byte $28   ; 
- - - - - - 0x0199D6 06:99C6: 2C        .byte $2C   ; 
- - - - - - 0x0199D7 06:99C7: 30        .byte $30   ; 
- - - - - - 0x0199D8 06:99C8: 27        .byte $27   ; 
- D 0 - - - 0x0199D9 06:99C9: 2A        .byte $2A   ; 
- - - - - - 0x0199DA 06:99CA: 2D        .byte $2D   ; 
- D 0 - - - 0x0199DB 06:99CB: 30        .byte $30   ; 
- - - - - - 0x0199DC 06:99CC: 50        .byte $50   ; 
- - - - - - 0x0199DD 06:99CD: 50        .byte $50   ; 
- - - - - - 0x0199DE 06:99CE: 50        .byte $50   ; 
- - - - - - 0x0199DF 06:99CF: 50        .byte $50   ; 
- D 0 - - - 0x0199E0 06:99D0: 34        .byte $34   ; 
- D 0 - - - 0x0199E1 06:99D1: 32        .byte $32   ; 
- - - - - - 0x0199E2 06:99D2: 30        .byte $30   ; 
- D 0 - - - 0x0199E3 06:99D3: 2E        .byte $2E   ; 
- - - - - - 0x0199E4 06:99D4: 38        .byte $38   ; 
- D 0 - - - 0x0199E5 06:99D5: 36        .byte $36   ; 
- - - - - - 0x0199E6 06:99D6: 34        .byte $34   ; 
- - - - - - 0x0199E7 06:99D7: 32        .byte $32   ; 
- D 0 - - - 0x0199E8 06:99D8: 25        .byte $25   ; 
- D 0 - - - 0x0199E9 06:99D9: 26        .byte $26   ; 
- D 0 - - - 0x0199EA 06:99DA: 27        .byte $27   ; 
- D 0 - - - 0x0199EB 06:99DB: 28        .byte $28   ; 
- - - - - - 0x0199EC 06:99DC: 70        .byte $70   ; 
- - - - - - 0x0199ED 06:99DD: 70        .byte $70   ; 
- - - - - - 0x0199EE 06:99DE: 70        .byte $70   ; 
- - - - - - 0x0199EF 06:99DF: 70        .byte $70   ; 



tbl_99E0:
- D 0 - - - 0x0199F0 06:99E0: 08        .byte $08   ; 
- D 0 - - - 0x0199F1 06:99E1: 06        .byte $06   ; 
- D 0 - - - 0x0199F2 06:99E2: 04        .byte $04   ; 
- D 0 - - - 0x0199F3 06:99E3: 02        .byte $02   ; 
- D 0 - - - 0x0199F4 06:99E4: 10        .byte $10   ; 
- D 0 - - - 0x0199F5 06:99E5: 0C        .byte $0C   ; 
- D 0 - - - 0x0199F6 06:99E6: 08        .byte $08   ; 
- D 0 - - - 0x0199F7 06:99E7: 04        .byte $04   ; 



loc_99E8_вычислить_скорость_движения_по_углу:
C D 0 - - - 0x0199F8 06:99E8: AD 93 04  LDA ram_0493
sub_99EB_вычислить_скорость_движения_по_углу:
C - - - - - 0x0199FB 06:99EB: 29 0F     AND #$0F
C - - - - - 0x0199FD 06:99ED: 0A        ASL
C - - - - - 0x0199FE 06:99EE: 0A        ASL
C - - - - - 0x0199FF 06:99EF: 0A        ASL
C - - - - - 0x019A00 06:99F0: 0A        ASL
C - - - - - 0x019A01 06:99F1: 85 1C     STA ram_001C
loc_99F3_вычислить_скорость_движения_по_углу:
C D 0 - - - 0x019A03 06:99F3: BD 96 04  LDA ram_movement_angle,X
C - - - - - 0x019A06 06:99F6: 29 E0     AND #$E0
C - - - - - 0x019A08 06:99F8: 4A        LSR
C - - - - - 0x019A09 06:99F9: 4A        LSR
C - - - - - 0x019A0A 06:99FA: 4A        LSR
C - - - - - 0x019A0B 06:99FB: A8        TAY
C - - - - - 0x019A0C 06:99FC: B9 57 9A  LDA tbl_9A57_X_скорость,Y
C - - - - - 0x019A0F 06:99FF: 85 2C     STA ram_002C
C - - - - - 0x019A11 06:9A01: B9 58 9A  LDA tbl_9A57_X_скорость + 1,Y
C - - - - - 0x019A14 06:9A04: 85 2D     STA ram_002D
C - - - - - 0x019A16 06:9A06: B9 59 9A  LDA tbl_9A57_Y_скорость + 2,Y
C - - - - - 0x019A19 06:9A09: 85 2E     STA ram_002E
C - - - - - 0x019A1B 06:9A0B: B9 5A 9A  LDA tbl_9A57_Y_скорость + 3,Y
C - - - - - 0x019A1E 06:9A0E: 85 2F     STA ram_002F
C - - - - - 0x019A20 06:9A10: A9 00     LDA #$00
C - - - - - 0x019A22 06:9A12: 9D E8 03  STA ram_spd_X_lo_player,X
C - - - - - 0x019A25 06:9A15: 9D F6 03  STA ram_spd_X_hi_player,X
C - - - - - 0x019A28 06:9A18: 9D 04 04  STA ram_spd_Y_lo_player,X
C - - - - - 0x019A2B 06:9A1B: 9D 12 04  STA ram_spd_Y_hi_player,X
bra_9A1E:
C - - - - - 0x019A2E 06:9A1E: 06 1C     ASL ram_001C
C - - - - - 0x019A30 06:9A20: 90 22     BCC bra_9A44
C - - - - - 0x019A32 06:9A22: 18        CLC
C - - - - - 0x019A33 06:9A23: A5 2C     LDA ram_002C
C - - - - - 0x019A35 06:9A25: 7D E8 03  ADC ram_spd_X_lo_player,X
C - - - - - 0x019A38 06:9A28: 9D E8 03  STA ram_spd_X_lo_player,X
C - - - - - 0x019A3B 06:9A2B: A5 2D     LDA ram_002D
C - - - - - 0x019A3D 06:9A2D: 7D F6 03  ADC ram_spd_X_hi_player,X
C - - - - - 0x019A40 06:9A30: 9D F6 03  STA ram_spd_X_hi_player,X
C - - - - - 0x019A43 06:9A33: 18        CLC
C - - - - - 0x019A44 06:9A34: A5 2E     LDA ram_002E
C - - - - - 0x019A46 06:9A36: 7D 04 04  ADC ram_spd_Y_lo_player,X
C - - - - - 0x019A49 06:9A39: 9D 04 04  STA ram_spd_Y_lo_player,X
C - - - - - 0x019A4C 06:9A3C: A5 2F     LDA ram_002F
C - - - - - 0x019A4E 06:9A3E: 7D 12 04  ADC ram_spd_Y_hi_player,X
C - - - - - 0x019A51 06:9A41: 9D 12 04  STA ram_spd_Y_hi_player,X
bra_9A44:
C - - - - - 0x019A54 06:9A44: A5 2D     LDA ram_002D
C - - - - - 0x019A56 06:9A46: 0A        ASL
C - - - - - 0x019A57 06:9A47: 66 2D     ROR ram_002D
C - - - - - 0x019A59 06:9A49: 66 2C     ROR ram_002C
C - - - - - 0x019A5B 06:9A4B: A5 2F     LDA ram_002F
C - - - - - 0x019A5D 06:9A4D: 0A        ASL
C - - - - - 0x019A5E 06:9A4E: 66 2F     ROR ram_002F
C - - - - - 0x019A60 06:9A50: 66 2E     ROR ram_002E
C - - - - - 0x019A62 06:9A52: A5 1C     LDA ram_001C
C - - - - - 0x019A64 06:9A54: D0 C8     BNE bra_9A1E
C - - - - - 0x019A66 06:9A56: 60        RTS

tbl_9A57_X_скорость:
tbl_9A57_Y_скорость:
- D 0 - - - 0x019A67 06:9A57: 00 00     .word $0000, $F800
- D 0 - - - 0x019A6B 06:9A5B: A8 05     .word $05A8, $FA58
- D 0 - - - 0x019A6F 06:9A5F: 00 08     .word $0800, $0000
- D 0 - - - 0x019A73 06:9A63: A8 05     .word $05A8, $05A8
- D 0 - - - 0x019A77 06:9A67: 00 00     .word $0000, $0800
- D 0 - - - 0x019A7B 06:9A6B: 58 FA     .word $FA58, $05A8
- D 0 - - - 0x019A7F 06:9A6F: 00 F8     .word $F800, $0000
- D 0 - - - 0x019A83 06:9A73: 58 FA     .word $FA58, $FA58



loc_9A77:
C D 0 - - - 0x019A87 06:9A77: AD 93 04  LDA ram_0493
sub_9A7A:
C - - - - - 0x019A8A 06:9A7A: 29 07     AND #$07
C - - - - - 0x019A8C 06:9A7C: 0A        ASL
C - - - - - 0x019A8D 06:9A7D: 0A        ASL
C - - - - - 0x019A8E 06:9A7E: BC D7 04  LDY ram_speed_type,X
C - - - - - 0x019A91 06:9A81: 30 04     BMI bra_9A87
C - - - - - 0x019A93 06:9A83: 18        CLC
C - - - - - 0x019A94 06:9A84: 7D 30 01  ADC ram_surface_player,X
bra_9A87:
C - - - - - 0x019A97 06:9A87: 0A        ASL
C - - - - - 0x019A98 06:9A88: A8        TAY
C - - - - - 0x019A99 06:9A89: BD F6 03  LDA ram_spd_X_hi_player,X
C - - - - - 0x019A9C 06:9A8C: 10 17     BPL bra_9AA5
C - - - - - 0x019A9E 06:9A8E: 18        CLC
C - - - - - 0x019A9F 06:9A8F: BD E8 03  LDA ram_spd_X_lo_player,X
C - - - - - 0x019AA2 06:9A92: 79 FC 9A  ADC tbl_9AFC,Y
C - - - - - 0x019AA5 06:9A95: 9D E8 03  STA ram_spd_X_lo_player,X
C - - - - - 0x019AA8 06:9A98: BD F6 03  LDA ram_spd_X_hi_player,X
C - - - - - 0x019AAB 06:9A9B: 79 FD 9A  ADC tbl_9AFD,Y
C - - - - - 0x019AAE 06:9A9E: 9D F6 03  STA ram_spd_X_hi_player,X
C - - - - - 0x019AB1 06:9AA1: 10 17     BPL bra_9ABA
C - - - - - 0x019AB3 06:9AA3: 30 1D     BMI bra_9AC2
bra_9AA5:
C - - - - - 0x019AB5 06:9AA5: 38        SEC
C - - - - - 0x019AB6 06:9AA6: BD E8 03  LDA ram_spd_X_lo_player,X
C - - - - - 0x019AB9 06:9AA9: F9 FC 9A  SBC tbl_9AFC,Y
C - - - - - 0x019ABC 06:9AAC: 9D E8 03  STA ram_spd_X_lo_player,X
C - - - - - 0x019ABF 06:9AAF: BD F6 03  LDA ram_spd_X_hi_player,X
C - - - - - 0x019AC2 06:9AB2: F9 FD 9A  SBC tbl_9AFD,Y
C - - - - - 0x019AC5 06:9AB5: 9D F6 03  STA ram_spd_X_hi_player,X
C - - - - - 0x019AC8 06:9AB8: 10 08     BPL bra_9AC2
bra_9ABA:
C - - - - - 0x019ACA 06:9ABA: A9 00     LDA #$00
C - - - - - 0x019ACC 06:9ABC: 9D F6 03  STA ram_spd_X_hi_player,X
C - - - - - 0x019ACF 06:9ABF: 9D E8 03  STA ram_spd_X_lo_player,X
bra_9AC2:
C - - - - - 0x019AD2 06:9AC2: BD 12 04  LDA ram_spd_Y_hi_player,X
C - - - - - 0x019AD5 06:9AC5: 10 17     BPL bra_9ADE
C - - - - - 0x019AD7 06:9AC7: 18        CLC
C - - - - - 0x019AD8 06:9AC8: BD 04 04  LDA ram_spd_Y_lo_player,X
C - - - - - 0x019ADB 06:9ACB: 79 FC 9A  ADC tbl_9AFC,Y
C - - - - - 0x019ADE 06:9ACE: 9D 04 04  STA ram_spd_Y_lo_player,X
C - - - - - 0x019AE1 06:9AD1: BD 12 04  LDA ram_spd_Y_hi_player,X
C - - - - - 0x019AE4 06:9AD4: 79 FD 9A  ADC tbl_9AFD,Y
C - - - - - 0x019AE7 06:9AD7: 9D 12 04  STA ram_spd_Y_hi_player,X
C - - - - - 0x019AEA 06:9ADA: 10 17     BPL bra_9AF3
C - - - - - 0x019AEC 06:9ADC: 30 1D     BMI bra_9AFB_RTS
bra_9ADE:
C - - - - - 0x019AEE 06:9ADE: 38        SEC
C - - - - - 0x019AEF 06:9ADF: BD 04 04  LDA ram_spd_Y_lo_player,X
C - - - - - 0x019AF2 06:9AE2: F9 FC 9A  SBC tbl_9AFC,Y
C - - - - - 0x019AF5 06:9AE5: 9D 04 04  STA ram_spd_Y_lo_player,X
C - - - - - 0x019AF8 06:9AE8: BD 12 04  LDA ram_spd_Y_hi_player,X
C - - - - - 0x019AFB 06:9AEB: F9 FD 9A  SBC tbl_9AFD,Y
C - - - - - 0x019AFE 06:9AEE: 9D 12 04  STA ram_spd_Y_hi_player,X
C - - - - - 0x019B01 06:9AF1: 10 08     BPL bra_9AFB_RTS
bra_9AF3:
C - - - - - 0x019B03 06:9AF3: A9 00     LDA #$00
C - - - - - 0x019B05 06:9AF5: 9D 12 04  STA ram_spd_Y_hi_player,X
C - - - - - 0x019B08 06:9AF8: 9D 04 04  STA ram_spd_Y_lo_player,X
bra_9AFB_RTS:
C - - - - - 0x019B0B 06:9AFB: 60        RTS



tbl_9AFC:
- - - - - - 0x019B0C 06:9AFC: 50        .byte $50   ; 
tbl_9AFD:
- - - - - - 0x019B0D 06:9AFD: 00        .byte $00   ; 
- - - - - - 0x019B0E 06:9AFE: 10        .byte $10   ; 
- - - - - - 0x019B0F 06:9AFF: 00        .byte $00   ; 
- - - - - - 0x019B10 06:9B00: 60        .byte $60   ; 
- - - - - - 0x019B11 06:9B01: 00        .byte $00   ; 
- - - - - - 0x019B12 06:9B02: 60        .byte $60   ; 
- - - - - - 0x019B13 06:9B03: 00        .byte $00   ; 
- D 0 - - - 0x019B14 06:9B04: A0        .byte $A0   ; 
- D 0 - - - 0x019B15 06:9B05: 00        .byte $00   ; 
- D 0 - - - 0x019B16 06:9B06: 40        .byte $40   ; 
- D 0 - - - 0x019B17 06:9B07: 00        .byte $00   ; 
- - - - - - 0x019B18 06:9B08: C0        .byte $C0   ; 
- - - - - - 0x019B19 06:9B09: 00        .byte $00   ; 
- - - - - - 0x019B1A 06:9B0A: C0        .byte $C0   ; 
- - - - - - 0x019B1B 06:9B0B: 00        .byte $00   ; 
- D 0 - - - 0x019B1C 06:9B0C: 00        .byte $00   ; 
- D 0 - - - 0x019B1D 06:9B0D: 01        .byte $01   ; 
- D 0 - - - 0x019B1E 06:9B0E: 40        .byte $40   ; 
- D 0 - - - 0x019B1F 06:9B0F: 00        .byte $00   ; 
- - - - - - 0x019B20 06:9B10: 00        .byte $00   ; 
- - - - - - 0x019B21 06:9B11: 01        .byte $01   ; 
- D 0 - - - 0x019B22 06:9B12: 00        .byte $00   ; 
- D 0 - - - 0x019B23 06:9B13: 01        .byte $01   ; 
- D 0 - - - 0x019B24 06:9B14: 00        .byte $00   ; 
- D 0 - - - 0x019B25 06:9B15: 01        .byte $01   ; 
- D 0 - - - 0x019B26 06:9B16: 00        .byte $00   ; 
- D 0 - - - 0x019B27 06:9B17: 01        .byte $01   ; 
- - - - - - 0x019B28 06:9B18: 00        .byte $00   ; 
- - - - - - 0x019B29 06:9B19: 03        .byte $03   ; 
- D 0 - - - 0x019B2A 06:9B1A: 00        .byte $00   ; 
- D 0 - - - 0x019B2B 06:9B1B: 03        .byte $03   ; 
- D 0 - - - 0x019B2C 06:9B1C: C0        .byte $C0   ; 
- D 0 - - - 0x019B2D 06:9B1D: 00        .byte $00   ; 
- D 0 - - - 0x019B2E 06:9B1E: 80        .byte $80   ; 
- D 0 - - - 0x019B2F 06:9B1F: 00        .byte $00   ; 
- - - - - - 0x019B30 06:9B20: 00        .byte $00   ; 
- - - - - - 0x019B31 06:9B21: 03        .byte $03   ; 
- D 0 - - - 0x019B32 06:9B22: 00        .byte $00   ; 
- D 0 - - - 0x019B33 06:9B23: 03        .byte $03   ; 
- D 0 - - - 0x019B34 06:9B24: 80        .byte $80   ; 
- D 0 - - - 0x019B35 06:9B25: 00        .byte $00   ; 
- D 0 - - - 0x019B36 06:9B26: 20        .byte $20   ; 
- D 0 - - - 0x019B37 06:9B27: 00        .byte $00   ; 
- - - - - - 0x019B38 06:9B28: C0        .byte $C0   ; 
- - - - - - 0x019B39 06:9B29: 00        .byte $00   ; 
- - - - - - 0x019B3A 06:9B2A: C0        .byte $C0   ; 
- - - - - - 0x019B3B 06:9B2B: 00        .byte $00   ; 
- D 0 - - - 0x019B3C 06:9B2C: 00        .byte $00   ; 
- D 0 - - - 0x019B3D 06:9B2D: 01        .byte $01   ; 
- D 0 - - - 0x019B3E 06:9B2E: 10        .byte $10   ; 
- D 0 - - - 0x019B3F 06:9B2F: 00        .byte $00   ; 
- - - - - - 0x019B40 06:9B30: 00        .byte $00   ; 
- - - - - - 0x019B41 06:9B31: 01        .byte $01   ; 
- D 0 - - - 0x019B42 06:9B32: 00        .byte $00   ; 
- D 0 - - - 0x019B43 06:9B33: 01        .byte $01   ; 



loc_9B34:
sub_9B34:
C D 0 - - - 0x019B44 06:9B34: A9 00     LDA #$00
C - - - - - 0x019B46 06:9B36: 9D 4A 04  STA ram_gravity_hi_player,X
C - - - - - 0x019B49 06:9B39: 9D 3C 04  STA ram_gravity_lo_player,X
C - - - - - 0x019B4C 06:9B3C: 9D 2E 04  STA ram_spd_Z_hi_player,X
C - - - - - 0x019B4F 06:9B3F: 9D 20 04  STA ram_spd_Z_lo_player,X
C - - - - - 0x019B52 06:9B42: 9D 12 04  STA ram_spd_Y_hi_player,X
C - - - - - 0x019B55 06:9B45: 9D 04 04  STA ram_spd_Y_lo_player,X
C - - - - - 0x019B58 06:9B48: 60        RTS



sub_9B49:
C - - - - - 0x019B59 06:9B49: BD F6 03  LDA ram_spd_X_hi_player,X
C - - - - - 0x019B5C 06:9B4C: 1D E8 03  ORA ram_spd_X_lo_player,X
C - - - - - 0x019B5F 06:9B4F: 1D 12 04  ORA ram_spd_Y_hi_player,X
C - - - - - 0x019B62 06:9B52: 1D 04 04  ORA ram_spd_Y_lo_player,X
C - - - - - 0x019B65 06:9B55: D0 05     BNE bra_9B5C_RTS
C - - - - - 0x019B67 06:9B57: 20 6C 8B  JSR sub_8B6C_вычислить_следующий_номер_движения
C - - - - - 0x019B6A 06:9B5A: 68        PLA
C - - - - - 0x019B6B 06:9B5B: 68        PLA
bra_9B5C_RTS:
C - - - - - 0x019B6C 06:9B5C: 60        RTS



loc_9B5D_скорость_Z_и_гравитация:
C D 0 - - - 0x019B6D 06:9B5D: AD 93 04  LDA ram_0493
sub_9B60_скорость_Z_и_гравитация:
C - - - - - 0x019B70 06:9B60: 0A        ASL
C - - - - - 0x019B71 06:9B61: A8        TAY
C - - - - - 0x019B72 06:9B62: B9 7B 9B  LDA tbl_9B7B_начальная_скорость_прыжка,Y
C - - - - - 0x019B75 06:9B65: 9D 20 04  STA ram_spd_Z_lo_player,X
C - - - - - 0x019B78 06:9B68: B9 7C 9B  LDA tbl_9B7B_начальная_скорость_прыжка + 1,Y
C - - - - - 0x019B7B 06:9B6B: 9D 2E 04  STA ram_spd_Z_hi_player,X
C - - - - - 0x019B7E 06:9B6E: AD 93 9B  LDA tbl_9B93_гравитация
C - - - - - 0x019B81 06:9B71: 9D 3C 04  STA ram_gravity_lo_player,X
C - - - - - 0x019B84 06:9B74: AD 94 9B  LDA tbl_9B93_гравитация + 1
C - - - - - 0x019B87 06:9B77: 9D 4A 04  STA ram_gravity_hi_player,X
C - - - - - 0x019B8A 06:9B7A: 60        RTS

tbl_9B7B_начальная_скорость_прыжка:
- D 0 - - - 0x019B8B 06:9B7B: 00 04     .word $0400
- D 0 - - - 0x019B8D 06:9B7D: 00 04     .word $0400
- D 0 - - - 0x019B8F 06:9B7F: 00 03     .word $0300
- D 0 - - - 0x019B91 06:9B81: 80 01     .word $0180
- D 0 - - - 0x019B93 06:9B83: 00 05     .word $0500
- D 0 - - - 0x019B95 06:9B85: 00 05     .word $0500
- D 0 - - - 0x019B97 06:9B87: 80 04     .word $0480
- D 0 - - - 0x019B99 06:9B89: 00 04     .word $0400
- - - - - - 0x019B9B 06:9B8B: 00 03     .word $0300
- D 0 - - - 0x019B9D 06:9B8D: 00 02     .word $0200
- D 0 - - - 0x019B9F 06:9B8F: 00 06     .word $0600
- D 0 - - - 0x019BA1 06:9B91: 00 0C     .word $0C00

tbl_9B93_гравитация:
- D 0 - - - 0x019BA3 06:9B93: 80 00     .word $0080



loc_9B95:
sub_9B95:
C D 0 - - - 0x019BA5 06:9B95: BD 14 03  LDA ram_pos_X_lo_player,X
C - - - - - 0x019BA8 06:9B98: 8D 13 05  STA ram_0513
C - - - - - 0x019BAB 06:9B9B: BD 27 03  LDA ram_pos_X_hi_player,X
C - - - - - 0x019BAE 06:9B9E: 8D 14 05  STA ram_0514
C - - - - - 0x019BB1 06:9BA1: BD 4D 03  LDA ram_pos_Y_lo_player,X
C - - - - - 0x019BB4 06:9BA4: 8D 15 05  STA ram_0515
C - - - - - 0x019BB7 06:9BA7: BD 60 03  LDA ram_pos_Y_hi_player,X
C - - - - - 0x019BBA 06:9BAA: 8D 16 05  STA ram_0516
C - - - - - 0x019BBD 06:9BAD: 18        CLC
C - - - - - 0x019BBE 06:9BAE: BD E8 03  LDA ram_spd_X_lo_player,X
C - - - - - 0x019BC1 06:9BB1: 7D 01 03  ADC ram_pos_X_sub_player,X
C - - - - - 0x019BC4 06:9BB4: 9D 01 03  STA ram_pos_X_sub_player,X
C - - - - - 0x019BC7 06:9BB7: BD F6 03  LDA ram_spd_X_hi_player,X
C - - - - - 0x019BCA 06:9BBA: 10 06     BPL bra_9BC2
C - - - - - 0x019BCC 06:9BBC: DE 27 03  DEC ram_pos_X_hi_player,X
C - - - - - 0x019BCF 06:9BBF: BD F6 03  LDA ram_spd_X_hi_player,X
bra_9BC2:
C - - - - - 0x019BD2 06:9BC2: 7D 14 03  ADC ram_pos_X_lo_player,X
C - - - - - 0x019BD5 06:9BC5: 9D 14 03  STA ram_pos_X_lo_player,X
C - - - - - 0x019BD8 06:9BC8: A9 00     LDA #$00
C - - - - - 0x019BDA 06:9BCA: 7D 27 03  ADC ram_pos_X_hi_player,X
C - - - - - 0x019BDD 06:9BCD: 9D 27 03  STA ram_pos_X_hi_player,X
C - - - - - 0x019BE0 06:9BD0: A5 58     LDA ram_script
C - - - - - 0x019BE2 06:9BD2: C9 01     CMP #con_script_logo
C - - - - - 0x019BE4 06:9BD4: F0 27     BEQ bra_9BFD
C - - - - - 0x019BE6 06:9BD6: C9 03     CMP #con_script_credits
C - - - - - 0x019BE8 06:9BD8: F0 23     BEQ bra_9BFD
C - - - - - 0x019BEA 06:9BDA: 18        CLC
C - - - - - 0x019BEB 06:9BDB: BD 04 04  LDA ram_spd_Y_lo_player,X
C - - - - - 0x019BEE 06:9BDE: 7D 3A 03  ADC ram_pos_Y_sub_player,X
C - - - - - 0x019BF1 06:9BE1: 9D 3A 03  STA ram_pos_Y_sub_player,X
C - - - - - 0x019BF4 06:9BE4: BD 12 04  LDA ram_spd_Y_hi_player,X
C - - - - - 0x019BF7 06:9BE7: 10 06     BPL bra_9BEF
C - - - - - 0x019BF9 06:9BE9: DE 60 03  DEC ram_pos_Y_hi_player,X
C - - - - - 0x019BFC 06:9BEC: BD 12 04  LDA ram_spd_Y_hi_player,X
bra_9BEF:
C - - - - - 0x019BFF 06:9BEF: 7D 4D 03  ADC ram_pos_Y_lo_player,X
C - - - - - 0x019C02 06:9BF2: 9D 4D 03  STA ram_pos_Y_lo_player,X
C - - - - - 0x019C05 06:9BF5: A9 00     LDA #$00
C - - - - - 0x019C07 06:9BF7: 7D 60 03  ADC ram_pos_Y_hi_player,X
C - - - - - 0x019C0A 06:9BFA: 9D 60 03  STA ram_pos_Y_hi_player,X
bra_9BFD:
C - - - - - 0x019C0D 06:9BFD: E0 0D     CPX #$0D
C - - - - - 0x019C0F 06:9BFF: 90 03     BCC bra_9C04
C - - - - - 0x019C11 06:9C01: 4C C8 9C  RTS
bra_9C04:
C - - - - - 0x019C14 06:9C04: 18        CLC
C - - - - - 0x019C15 06:9C05: BD 20 04  LDA ram_spd_Z_lo_player,X
C - - - - - 0x019C18 06:9C08: 7D 73 03  ADC ram_pos_Z_sub_player,X
C - - - - - 0x019C1B 06:9C0B: 9D 73 03  STA ram_pos_Z_sub_player,X
C - - - - - 0x019C1E 06:9C0E: BD 2E 04  LDA ram_spd_Z_hi_player,X
C - - - - - 0x019C21 06:9C11: 10 06     BPL bra_9C19
C - - - - - 0x019C23 06:9C13: DE 99 03  DEC ram_pos_Z_hi_player,X
C - - - - - 0x019C26 06:9C16: BD 2E 04  LDA ram_spd_Z_hi_player,X
bra_9C19:
C - - - - - 0x019C29 06:9C19: 7D 86 03  ADC ram_pos_Z_lo_player,X
C - - - - - 0x019C2C 06:9C1C: 9D 86 03  STA ram_pos_Z_lo_player,X
C - - - - - 0x019C2F 06:9C1F: A9 00     LDA #$00
C - - - - - 0x019C31 06:9C21: 7D 99 03  ADC ram_pos_Z_hi_player,X
C - - - - - 0x019C34 06:9C24: 9D 99 03  STA ram_pos_Z_hi_player,X
C - - - - - 0x019C37 06:9C27: E0 0C     CPX #$0C
C - - - - - 0x019C39 06:9C29: D0 0B     BNE bra_9C36
C - - - - - 0x019C3B 06:9C2B: 38        SEC
C - - - - - 0x019C3C 06:9C2C: AD 24 05  LDA ram_таймер_прицельного_паса
C - - - - - 0x019C3F 06:9C2F: E9 01     SBC #$01
C - - - - - 0x019C41 06:9C31: 90 03     BCC bra_9C36
C - - - - - 0x019C43 06:9C33: 8D 24 05  STA ram_таймер_прицельного_паса
bra_9C36:
C - - - - - 0x019C46 06:9C36: BD BD 04  LDA ram_timer_action_player,X
C - - - - - 0x019C49 06:9C39: F0 24     BEQ bra_9C5F
C - - - - - 0x019C4B 06:9C3B: A0 00     LDY #$00
C - - - - - 0x019C4D 06:9C3D: E0 0C     CPX #$0C
C - - - - - 0x019C4F 06:9C3F: D0 0B     BNE bra_9C4C
C - - - - - 0x019C51 06:9C41: AD 0D 05  LDA ram_timer_wet_ball
C - - - - - 0x019C54 06:9C44: 10 06     BPL bra_9C4C
C - - - - - 0x019C56 06:9C46: AD 10 05  LDA ram_подтип_супера
C - - - - - 0x019C59 06:9C49: D0 01     BNE bra_9C4C
C - - - - - 0x019C5B 06:9C4B: C8        INY
bra_9C4C:
C - - - - - 0x019C5C 06:9C4C: 38        SEC
C - - - - - 0x019C5D 06:9C4D: BD BD 04  LDA ram_timer_action_player,X
C - - - - - 0x019C60 06:9C50: F9 5D 9C  SBC tbl_9C5D,Y
C - - - - - 0x019C63 06:9C53: B0 02     BCS bra_9C57
- - - - - - 0x019C65 06:9C55: A9 00     LDA #$00
bra_9C57:
C - - - - - 0x019C67 06:9C57: 9D BD 04  STA ram_timer_action_player,X
C - - - - - 0x019C6A 06:9C5A: 4C 72 9C  JMP loc_9C72

tbl_9C5D:
- D 0 - - - 0x019C6D 06:9C5D: 01        .byte $01   ; 
- D 0 - - - 0x019C6E 06:9C5E: 02        .byte $02   ; 



bra_9C5F:
C - - - - - 0x019C6F 06:9C5F: 38        SEC
C - - - - - 0x019C70 06:9C60: BD 20 04  LDA ram_spd_Z_lo_player,X
C - - - - - 0x019C73 06:9C63: FD 3C 04  SBC ram_gravity_lo_player,X
C - - - - - 0x019C76 06:9C66: 9D 20 04  STA ram_spd_Z_lo_player,X
C - - - - - 0x019C79 06:9C69: BD 2E 04  LDA ram_spd_Z_hi_player,X
C - - - - - 0x019C7C 06:9C6C: FD 4A 04  SBC ram_gravity_hi_player,X
C - - - - - 0x019C7F 06:9C6F: 9D 2E 04  STA ram_spd_Z_hi_player,X
loc_9C72:
C D 0 - - - 0x019C82 06:9C72: A5 58     LDA ram_script
C - - - - - 0x019C84 06:9C74: D0 52     BNE bra_9CC8_RTS    ; если не игра на поле
C - - - - - 0x019C86 06:9C76: AD FC 05  LDA ram_05FC
C - - - - - 0x019C89 06:9C79: D0 03     BNE bra_9C7E
C - - - - - 0x019C8B 06:9C7B: 4C C8 9C  RTS
bra_9C7E:
C - - - - - 0x019C8E 06:9C7E: E0 0C     CPX #$0C
C - - - - - 0x019C90 06:9C80: 90 1B     BCC bra_9C9D
C - - - - - 0x019C92 06:9C82: BD 86 04  LDA ram_игрок_состояние,X
C - - - - - 0x019C95 06:9C85: 29 20     AND #$20
C - - - - - 0x019C97 06:9C87: D0 3F     BNE bra_9CC8_RTS
C - - - - - 0x019C99 06:9C89: AD 0D 05  LDA ram_timer_wet_ball
C - - - - - 0x019C9C 06:9C8C: 10 0C     BPL bra_9CA2
C - - - - - 0x019C9E 06:9C8E: 0E 00 06  ASL ram_spd_X_lo_wind
C - - - - - 0x019CA1 06:9C91: 2E FF 05  ROL ram_spd_X_hi_wind
C - - - - - 0x019CA4 06:9C94: 0E 02 06  ASL ram_spd_Y_lo_wind
C - - - - - 0x019CA7 06:9C97: 2E 01 06  ROL ram_spd_Y_hi_wind
C - - - - - 0x019CAA 06:9C9A: 4C A2 9C  JMP loc_9CA2
bra_9C9D:
C - - - - - 0x019CAD 06:9C9D: BD 86 04  LDA ram_игрок_состояние,X
C - - - - - 0x019CB0 06:9CA0: 10 26     BPL bra_9CC8_RTS
loc_9CA2:
bra_9CA2:
C D 0 - - - 0x019CB2 06:9CA2: 18        CLC
C - - - - - 0x019CB3 06:9CA3: BD E8 03  LDA ram_spd_X_lo_player,X
C - - - - - 0x019CB6 06:9CA6: 6D 00 06  ADC ram_spd_X_lo_wind
C - - - - - 0x019CB9 06:9CA9: 9D E8 03  STA ram_spd_X_lo_player,X
C - - - - - 0x019CBC 06:9CAC: BD F6 03  LDA ram_spd_X_hi_player,X
C - - - - - 0x019CBF 06:9CAF: 6D FF 05  ADC ram_spd_X_hi_wind
C - - - - - 0x019CC2 06:9CB2: 9D F6 03  STA ram_spd_X_hi_player,X
C - - - - - 0x019CC5 06:9CB5: 18        CLC
C - - - - - 0x019CC6 06:9CB6: BD 04 04  LDA ram_spd_Y_lo_player,X
C - - - - - 0x019CC9 06:9CB9: 6D 02 06  ADC ram_spd_Y_lo_wind
C - - - - - 0x019CCC 06:9CBC: 9D 04 04  STA ram_spd_Y_lo_player,X
C - - - - - 0x019CCF 06:9CBF: BD 12 04  LDA ram_spd_Y_hi_player,X
C - - - - - 0x019CD2 06:9CC2: 6D 01 06  ADC ram_spd_Y_hi_wind
C - - - - - 0x019CD5 06:9CC5: 9D 12 04  STA ram_spd_Y_hi_player,X
bra_9CC8_RTS:
C D 0 - - - 0x019CD8 06:9CC8: 60        RTS



loc_9CC9_очистить_скорости_объекта:
sub_9CC9_очистить_скорости_объекта:
C D 0 - - - 0x019CD9 06:9CC9: A9 00     LDA #$00
C - - - - - 0x019CDB 06:9CCB: 9D F6 03  STA ram_spd_X_hi_player,X
C - - - - - 0x019CDE 06:9CCE: 9D E8 03  STA ram_spd_X_lo_player,X
C - - - - - 0x019CE1 06:9CD1: 9D 12 04  STA ram_spd_Y_hi_player,X
C - - - - - 0x019CE4 06:9CD4: 9D 04 04  STA ram_spd_Y_lo_player,X
C - - - - - 0x019CE7 06:9CD7: 9D 2E 04  STA ram_spd_Z_hi_player,X
C - - - - - 0x019CEA 06:9CDA: 9D 20 04  STA ram_spd_Z_lo_player,X
C - - - - - 0x019CED 06:9CDD: 9D 4A 04  STA ram_gravity_hi_player,X
C - - - - - 0x019CF0 06:9CE0: 9D 3C 04  STA ram_gravity_lo_player,X
C - - - - - 0x019CF3 06:9CE3: 60        RTS



loc_9CE4:
sub_9CE4:
C D 0 - - - 0x019CF4 06:9CE4: BD B0 04  LDA ram_смена_угла_движения,X
C - - - - - 0x019CF7 06:9CE7: C9 FF     CMP #$FF
C - - - - - 0x019CF9 06:9CE9: F0 0C     BEQ bra_9CF7_RTS
C - - - - - 0x019CFB 06:9CEB: 29 7F     AND #$7F
C - - - - - 0x019CFD 06:9CED: F0 08     BEQ bra_9CF7_RTS
C - - - - - 0x019CFF 06:9CEF: BD B0 04  LDA ram_смена_угла_движения,X
C - - - - - 0x019D02 06:9CF2: 29 80     AND #$80
C - - - - - 0x019D04 06:9CF4: 9D A3 04  STA ram_направление_движения,X
bra_9CF7_RTS:
C - - - - - 0x019D07 06:9CF7: 60        RTS



sub_9CF8:
C - - - - - 0x019D08 06:9CF8: BD 6C 04  LDA ram_animation_sub_id_player,X
C - - - - - 0x019D0B 06:9CFB: C9 01     CMP #$01
C - - - - - 0x019D0D 06:9CFD: F0 06     BEQ bra_9D05
C - - - - - 0x019D0F 06:9CFF: 20 E4 9C  JSR sub_9CE4
C - - - - - 0x019D12 06:9D02: 4C 18 9D  RTS
bra_9D05:
C - - - - - 0x019D15 06:9D05: 8A        TXA
C - - - - - 0x019D16 06:9D06: 6A        ROR
C - - - - - 0x019D17 06:9D07: 6A        ROR
C - - - - - 0x019D18 06:9D08: 29 80     AND #$80
C - - - - - 0x019D1A 06:9D0A: 9D A3 04  STA ram_направление_движения,X
C - - - - - 0x019D1D 06:9D0D: A5 57     LDA ram_option_mode_difficulty
C - - - - - 0x019D1F 06:9D0F: 29 20     AND #con_gm_penalty
C - - - - - 0x019D21 06:9D11: F0 05     BEQ bra_9D18_RTS
C - - - - - 0x019D23 06:9D13: A9 80     LDA #$80
C - - - - - 0x019D25 06:9D15: 9D A3 04  STA ram_направление_движения,X
bra_9D18_RTS:
C D 0 - - - 0x019D28 06:9D18: 60        RTS



loc_9D19:
sub_9D19:
C D 0 - - - 0x019D29 06:9D19: BD B0 04  LDA ram_смена_угла_движения,X
C - - - - - 0x019D2C 06:9D1C: C9 FF     CMP #$FF
C - - - - - 0x019D2E 06:9D1E: D0 05     BNE bra_9D25
C - - - - - 0x019D30 06:9D20: BD A3 04  LDA ram_направление_движения,X
C - - - - - 0x019D33 06:9D23: 09 40     ORA #$40
bra_9D25:
C - - - - - 0x019D35 06:9D25: 9D 96 04  STA ram_movement_angle,X
C - - - - - 0x019D38 06:9D28: 60        RTS



loc_9D29:
sub_9D29:
C D 0 - - - 0x019D39 06:9D29: BD 86 04  LDA ram_игрок_состояние,X
C - - - - - 0x019D3C 06:9D2C: 29 40     AND #$40
C - - - - - 0x019D3E 06:9D2E: F0 29     BEQ bra_9D59
C - - - - - 0x019D40 06:9D30: BD 86 04  LDA ram_игрок_состояние,X
C - - - - - 0x019D43 06:9D33: 30 04     BMI bra_9D39
C - - - - - 0x019D45 06:9D35: 29 08     AND #$08
C - - - - - 0x019D47 06:9D37: D0 20     BNE bra_9D59
bra_9D39:
C - - - - - 0x019D49 06:9D39: AD 65 04  LDA ram_movement_id_ball
C - - - - - 0x019D4C 06:9D3C: 29 7F     AND #$7F
C - - - - - 0x019D4E 06:9D3E: C9 09     CMP #$09
C - - - - - 0x019D50 06:9D40: D0 17     BNE bra_9D59
C - - - - - 0x019D52 06:9D42: 38        SEC
C - - - - - 0x019D53 06:9D43: AD 20 03  LDA ram_pos_X_lo_ball
C - - - - - 0x019D56 06:9D46: FD 14 03  SBC ram_pos_X_lo_player,X
C - - - - - 0x019D59 06:9D49: AD 33 03  LDA ram_pos_X_hi_ball
C - - - - - 0x019D5C 06:9D4C: FD 27 03  SBC ram_pos_X_hi_player,X
C - - - - - 0x019D5F 06:9D4F: 10 04     BPL bra_9D55
C - - - - - 0x019D61 06:9D51: A9 80     LDA #$80
C - - - - - 0x019D63 06:9D53: D0 09     BNE bra_9D5E
bra_9D55:
C - - - - - 0x019D65 06:9D55: A9 00     LDA #$00
C - - - - - 0x019D67 06:9D57: F0 05     BEQ bra_9D5E
bra_9D59:
C - - - - - 0x019D69 06:9D59: BD A3 04  LDA ram_направление_движения,X
C - - - - - 0x019D6C 06:9D5C: 29 80     AND #$80
bra_9D5E:
C - - - - - 0x019D6E 06:9D5E: 5D 74 00  EOR ram_animation_id_player,X
C - - - - - 0x019D71 06:9D61: 9D 74 00  STA ram_animation_id_player,X
C - - - - - 0x019D74 06:9D64: 60        RTS



sub_9D65:
C - - - - - 0x019D75 06:9D65: 20 51 B1  JSR sub_B151
C - - - - - 0x019D78 06:9D68: B0 03     BCS bra_9D6D
C - - - - - 0x019D7A 06:9D6A: 4C 6A 9E  RTS
bra_9D6D:
C - - - - - 0x019D7D 06:9D6D: 86 1C     STX ram_001C
C - - - - - 0x019D7F 06:9D6F: 84 1D     STY ram_001D
C - - - - - 0x019D81 06:9D71: B9 E4 04  LDA ram_hp_player,Y
C - - - - - 0x019D84 06:9D74: C0 0A     CPY #$0A
C - - - - - 0x019D86 06:9D76: 90 17     BCC bra_9D8F
C - - - - - 0x019D88 06:9D78: 85 20     STA ram_0020
C - - - - - 0x019D8A 06:9D7A: B9 7C 06  LDA ram_067C,Y
C - - - - - 0x019D8D 06:9D7D: 30 12     BMI bra_9D91
C - - - - - 0x019D8F 06:9D7F: B9 FD 04  LDA ram_защита_поведение,Y
C - - - - - 0x019D92 06:9D82: 29 03     AND #$03
C - - - - - 0x019D94 06:9D84: A8        TAY
C - - - - - 0x019D95 06:9D85: B9 3C B0  LDA tbl_B03C_defense,Y
C - - - - - 0x019D98 06:9D88: 18        CLC
C - - - - - 0x019D99 06:9D89: 65 20     ADC ram_0020
C - - - - - 0x019D9B 06:9D8B: 90 02     BCC bra_9D8F
- - - - - - 0x019D9D 06:9D8D: A9 FF     LDA #$FF
bra_9D8F:
C - - - - - 0x019D9F 06:9D8F: 85 20     STA ram_0020
bra_9D91:
C - - - - - 0x019DA1 06:9D91: BD 59 04  LDA ram_movement_id_player,X
C - - - - - 0x019DA4 06:9D94: 29 7F     AND #$7F
C - - - - - 0x019DA6 06:9D96: C9 23     CMP #$23
C - - - - - 0x019DA8 06:9D98: F0 48     BEQ bra_9DE2
C - - - - - 0x019DAA 06:9D9A: C9 22     CMP #$22
C - - - - - 0x019DAC 06:9D9C: F0 0C     BEQ bra_9DAA
C - - - - - 0x019DAE 06:9D9E: C9 3B     CMP #$3B
C - - - - - 0x019DB0 06:9DA0: F0 08     BEQ bra_9DAA
C - - - - - 0x019DB2 06:9DA2: C9 42     CMP #$42
C - - - - - 0x019DB4 06:9DA4: F0 04     BEQ bra_9DAA
C - - - - - 0x019DB6 06:9DA6: A9 01     LDA #$01
C - - - - - 0x019DB8 06:9DA8: D0 02     BNE bra_9DAC
bra_9DAA:
C - - - - - 0x019DBA 06:9DAA: A9 00     LDA #$00
bra_9DAC:
C - - - - - 0x019DBC 06:9DAC: 0A        ASL
C - - - - - 0x019DBD 06:9DAD: 0A        ASL
C - - - - - 0x019DBE 06:9DAE: 85 1E     STA ram_001E
C - - - - - 0x019DC0 06:9DB0: A8        TAY
C - - - - - 0x019DC1 06:9DB1: B9 A0 9E  LDA tbl_9E9D + 3,Y
C - - - - - 0x019DC4 06:9DB4: 30 03     BMI bra_9DB9
C - - - - - 0x019DC6 06:9DB6: 20 E4 C2  JSR sub_0x01C2F4_play_sound
bra_9DB9:
C - - - - - 0x019DC9 06:9DB9: 18        CLC
C - - - - - 0x019DCA 06:9DBA: BD E4 04  LDA ram_hp_player,X
C - - - - - 0x019DCD 06:9DBD: 79 9F 9E  ADC tbl_9E9D + 2,Y
C - - - - - 0x019DD0 06:9DC0: 90 02     BCC bra_9DC4
- - - - - - 0x019DD2 06:9DC2: A9 FF     LDA #$FF
bra_9DC4:
C - - - - - 0x019DD4 06:9DC4: 85 1F     STA ram_001F
C - - - - - 0x019DD6 06:9DC6: B9 9E 9E  LDA tbl_9E9D + 1,Y
C - - - - - 0x019DD9 06:9DC9: A4 1C     LDY ram_001C
C - - - - - 0x019DDB 06:9DCB: 20 A5 9E  JSR sub_9EA5
C - - - - - 0x019DDE 06:9DCE: A4 1E     LDY ram_001E
C - - - - - 0x019DE0 06:9DD0: B9 9D 9E  LDA tbl_9E9D,Y
C - - - - - 0x019DE3 06:9DD3: A4 1D     LDY ram_001D
C - - - - - 0x019DE5 06:9DD5: 20 A5 9E  JSR sub_9EA5
C - - - - - 0x019DE8 06:9DD8: 38        SEC
C - - - - - 0x019DE9 06:9DD9: A5 1F     LDA ram_001F
C - - - - - 0x019DEB 06:9DDB: C5 20     CMP ram_0020
C - - - - - 0x019DED 06:9DDD: 90 75     BCC bra_9E54
C - - - - - 0x019DEF 06:9DDF: 4C F8 9D  JMP loc_9DF8
bra_9DE2:
C - - - - - 0x019DF2 06:9DE2: A4 1D     LDY ram_001D
C - - - - - 0x019DF4 06:9DE4: B9 86 04  LDA ram_игрок_состояние,Y
C - - - - - 0x019DF7 06:9DE7: 29 08     AND #$08
C - - - - - 0x019DF9 06:9DE9: F0 7F     BEQ bra_9E6A_RTS
C - - - - - 0x019DFB 06:9DEB: A9 36     LDA #con_sfx_убийство
C - - - - - 0x019DFD 06:9DED: 20 E4 C2  JSR sub_0x01C2F4_play_sound
C - - - - - 0x019E00 06:9DF0: A9 2D     LDA #$2D
C - - - - - 0x019E02 06:9DF2: 20 7C 9E  JSR sub_9E7C
C - - - - - 0x019E05 06:9DF5: 4C 62 9E  JMP loc_9E62
loc_9DF8:
C D 0 - - - 0x019E08 06:9DF8: E0 0A     CPX #$0A
C - - - - - 0x019E0A 06:9DFA: B0 4E     BCS bra_9E4A
C - - - - - 0x019E0C 06:9DFC: A5 1D     LDA ram_001D
C - - - - - 0x019E0E 06:9DFE: 29 01     AND #$01
C - - - - - 0x019E10 06:9E00: 85 1E     STA ram_001E
C - - - - - 0x019E12 06:9E02: A8        TAY
C - - - - - 0x019E13 06:9E03: B9 6B 9E  LDA tbl_9E6B,Y
C - - - - - 0x019E16 06:9E06: A4 1D     LDY ram_001D
C - - - - - 0x019E18 06:9E08: D9 27 03  CMP ram_pos_X_hi_player,Y
C - - - - - 0x019E1B 06:9E0B: D0 3D     BNE bra_9E4A
C - - - - - 0x019E1D 06:9E0D: CC D6 04  CPY ram_игрок_с_мячом
C - - - - - 0x019E20 06:9E10: F0 38     BEQ bra_9E4A
C - - - - - 0x019E22 06:9E12: B9 86 04  LDA ram_игрок_состояние,Y
C - - - - - 0x019E25 06:9E15: 0A        ASL
C - - - - - 0x019E26 06:9E16: 30 32     BMI bra_9E4A
C - - - - - 0x019E28 06:9E18: 24 5C     BIT ram_flag_gameplay
C - - - - - 0x019E2A 06:9E1A: 70 2E     BVS bra_9E4A
C - - - - - 0x019E2C 06:9E1C: A0 00     LDY #$00
C - - - - - 0x019E2E 06:9E1E: BD 60 03  LDA ram_pos_Y_hi_player,X
C - - - - - 0x019E31 06:9E21: D0 07     BNE bra_9E2A
- - - - - - 0x019E33 06:9E23: C8        INY
- - - - - - 0x019E34 06:9E24: BD 4D 03  LDA ram_pos_Y_lo_player,X
- - - - - - 0x019E37 06:9E27: 30 01     BMI bra_9E2A
- - - - - - 0x019E39 06:9E29: C8        INY
bra_9E2A:
C - - - - - 0x019E3A 06:9E2A: B9 6D 9E  LDA tbl_9E6D,Y
C - - - - - 0x019E3D 06:9E2D: 30 1B     BMI bra_9E4A
C - - - - - 0x019E3F 06:9E2F: 8D 5B 05  STA ram_field_formation
C - - - - - 0x019E42 06:9E32: A5 1E     LDA ram_001E
C - - - - - 0x019E44 06:9E34: 49 01     EOR #$01
C - - - - - 0x019E46 06:9E36: A8        TAY
C - - - - - 0x019E47 06:9E37: B9 2A 05  LDA ram_флаг_владения_мячом_ком,Y
C - - - - - 0x019E4A 06:9E3A: 09 01     ORA #$01
C - - - - - 0x019E4C 06:9E3C: 99 2A 05  STA ram_флаг_владения_мячом_ком,Y
C - - - - - 0x019E4F 06:9E3F: A5 5C     LDA ram_flag_gameplay
C - - - - - 0x019E51 06:9E41: 09 60     ORA #con_gp_pk
C - - - - - 0x019E53 06:9E43: 85 5C     STA ram_flag_gameplay
C - - - - - 0x019E55 06:9E45: A9 2D     LDA #con_sfx_violation
C - - - - - 0x019E57 06:9E47: 20 E4 C2  JSR sub_0x01C2F4_play_sound
bra_9E4A:
C - - - - - 0x019E5A 06:9E4A: A4 1D     LDY ram_001D
C - - - - - 0x019E5C 06:9E4C: A9 3C     LDA #$3C
C - - - - - 0x019E5E 06:9E4E: 20 7C 9E  JSR sub_9E7C
C - - - - - 0x019E61 06:9E51: 4C 62 9E  JMP loc_9E62
bra_9E54:
C - - - - - 0x019E64 06:9E54: A4 1C     LDY ram_001C
C - - - - - 0x019E66 06:9E56: 20 71 9E  JSR sub_9E71
C - - - - - 0x019E69 06:9E59: A4 1D     LDY ram_001D
C - - - - - 0x019E6B 06:9E5B: C0 0A     CPY #$0A
C - - - - - 0x019E6D 06:9E5D: B0 0B     BCS bra_9E6A_RTS
C - - - - - 0x019E6F 06:9E5F: 20 71 9E  JSR sub_9E71
loc_9E62:
C D 0 - - - 0x019E72 06:9E62: 20 8B 9E  JSR sub_9E8B
C - - - - - 0x019E75 06:9E65: A9 FF     LDA #$FF
C - - - - - 0x019E77 06:9E67: 20 D7 A2  JSR sub_A2D7
bra_9E6A_RTS:
C D 0 - - - 0x019E7A 06:9E6A: 60        RTS



tbl_9E6B:
- D 0 - - - 0x019E7B 06:9E6B: 03        .byte $03   ; 
- D 0 - - - 0x019E7C 06:9E6C: 00        .byte $00   ; 



tbl_9E6D:
- D 0 - - - 0x019E7D 06:9E6D: 01        .byte $01   ; 
- - - - - - 0x019E7E 06:9E6E: 03        .byte $03   ; 
- - - - - - 0x019E7F 06:9E6F: 02        .byte $02   ; 
- - - - - - 0x019E80 06:9E70: 03        .byte $03   ; 



sub_9E71:
C - - - - - 0x019E81 06:9E71: B9 86 04  LDA ram_игрок_состояние,Y
C - - - - - 0x019E84 06:9E74: 30 04     BMI bra_9E7A
C - - - - - 0x019E86 06:9E76: A9 2D     LDA #$2D
C - - - - - 0x019E88 06:9E78: D0 02     BNE bra_9E7C
bra_9E7A:
C - - - - - 0x019E8A 06:9E7A: A9 3C     LDA #$3C
bra_9E7C:
sub_9E7C:
C - - - - - 0x019E8C 06:9E7C: 99 59 04  STA ram_movement_id_player,Y
C - - - - - 0x019E8F 06:9E7F: A9 00     LDA #$00
C - - - - - 0x019E91 06:9E81: 99 94 00  STA ram_номер_кадра_анимации,Y
C - - - - - 0x019E94 06:9E84: 99 87 00  STA ram_animation_timer_player,Y
C - - - - - 0x019E97 06:9E87: 99 6C 04  STA ram_animation_sub_id_player,Y
C - - - - - 0x019E9A 06:9E8A: 60        RTS



sub_9E8B:
C - - - - - 0x019E9B 06:9E8B: BD A3 04  LDA ram_направление_движения,X
C - - - - - 0x019E9E 06:9E8E: 59 A3 04  EOR ram_направление_движения,Y
C - - - - - 0x019EA1 06:9E91: 30 09     BMI bra_9E9C_RTS
C - - - - - 0x019EA3 06:9E93: 18        CLC
C - - - - - 0x019EA4 06:9E94: B9 59 04  LDA ram_movement_id_player,Y
C - - - - - 0x019EA7 06:9E97: 69 01     ADC #$01
C - - - - - 0x019EA9 06:9E99: 99 59 04  STA ram_movement_id_player,Y
bra_9E9C_RTS:
C - - - - - 0x019EAC 06:9E9C: 60        RTS



tbl_9E9D:
- D 0 - - - 0x019EAD 06:9E9D: 02        .byte $02   ; 
- D 0 - - - 0x019EAE 06:9E9E: 00        .byte $00   ; 
- D 0 - - - 0x019EAF 06:9E9F: 08        .byte $08   ; 
- D 0 - - - 0x019EB0 06:9EA0: 36        .byte con_sfx_убийство

- D 0 - - - 0x019EB1 06:9EA1: 02        .byte $02   ; 
- D 0 - - - 0x019EB2 06:9EA2: 01        .byte $01   ; 
- D 0 - - - 0x019EB3 06:9EA3: 12        .byte $12   ; 
- D 0 - - - 0x019EB4 06:9EA4: 37        .byte con_sfx_прошибание



sub_9EA5:
C - - - - - 0x019EB5 06:9EA5: 85 21     STA ram_0021
C - - - - - 0x019EB7 06:9EA7: 38        SEC
C - - - - - 0x019EB8 06:9EA8: B9 E4 04  LDA ram_hp_player,Y
C - - - - - 0x019EBB 06:9EAB: E5 21     SBC ram_0021
C - - - - - 0x019EBD 06:9EAD: B0 02     BCS bra_9EB1
C - - - - - 0x019EBF 06:9EAF: A9 00     LDA #$00
bra_9EB1:
C - - - - - 0x019EC1 06:9EB1: 99 E4 04  STA ram_hp_player,Y
C - - - - - 0x019EC4 06:9EB4: 60        RTS



sub_9EB5:
C - - - - - 0x019EC5 06:9EB5: 18        CLC
C - - - - - 0x019EC6 06:9EB6: 79 E4 04  ADC ram_hp_player,Y
C - - - - - 0x019EC9 06:9EB9: 90 F6     BCC bra_9EB1
- - - - - - 0x019ECB 06:9EBB: A9 FF     LDA #$FF
- - - - - - 0x019ECD 06:9EBD: 30 F2     BMI bra_9EB1



sub_9EBF:
C - - - - - 0x019ECF 06:9EBF: 24 5C     BIT ram_flag_gameplay
C - - - - - 0x019ED1 06:9EC1: 70 1F     BVS bra_9EE2_RTS
C - - - - - 0x019ED3 06:9EC3: E0 0A     CPX #$0A
C - - - - - 0x019ED5 06:9EC5: B0 1B     BCS bra_9EE2_RTS
C - - - - - 0x019ED7 06:9EC7: BD 50 06  LDA ram_позиция_управление,X
C - - - - - 0x019EDA 06:9ECA: 30 16     BMI bra_9EE2_RTS
C - - - - - 0x019EDC 06:9ECC: BD 2E 04  LDA ram_spd_Z_hi_player,X
C - - - - - 0x019EDF 06:9ECF: 10 11     BPL bra_9EE2_RTS
C - - - - - 0x019EE1 06:9ED1: BD 99 03  LDA ram_pos_Z_hi_player,X
C - - - - - 0x019EE4 06:9ED4: 30 0C     BMI bra_9EE2_RTS
C - - - - - 0x019EE6 06:9ED6: BD 86 04  LDA ram_игрок_состояние,X
C - - - - - 0x019EE9 06:9ED9: 29 40     AND #$40
C - - - - - 0x019EEB 06:9EDB: D0 05     BNE bra_9EE2_RTS
C - - - - - 0x019EED 06:9EDD: 20 9A B1  JSR sub_B19A
C - - - - - 0x019EF0 06:9EE0: B0 03     BCS bra_9EE5
bra_9EE2_RTS:
C - - - - - 0x019EF2 06:9EE2: 4C 6F 9F  RTS
bra_9EE5:
C - - - - - 0x019EF5 06:9EE5: C0 0A     CPY #$0A
C - - - - - 0x019EF7 06:9EE7: B0 09     BCS bra_9EF2
C - - - - - 0x019EF9 06:9EE9: 86 1C     STX ram_001C
C - - - - - 0x019EFB 06:9EEB: 98        TYA
C - - - - - 0x019EFC 06:9EEC: 45 1C     EOR ram_001C
C - - - - - 0x019EFE 06:9EEE: 29 01     AND #$01
C - - - - - 0x019F00 06:9EF0: F0 03     BEQ bra_9EF5
bra_9EF2:
- - - - - - 0x019F02 06:9EF2: 4C 3C 9F  JMP loc_9F3C
bra_9EF5:
C - - - - - 0x019F05 06:9EF5: B9 50 06  LDA ram_позиция_управление,Y
C - - - - - 0x019F08 06:9EF8: 10 75     BPL bra_9F6F_RTS
C - - - - - 0x019F0A 06:9EFA: B9 86 04  LDA ram_игрок_состояние,Y
C - - - - - 0x019F0D 06:9EFD: 30 70     BMI bra_9F6F_RTS
C - - - - - 0x019F0F 06:9EFF: 29 01     AND #$01
C - - - - - 0x019F11 06:9F01: D0 6C     BNE bra_9F6F_RTS
C - - - - - 0x019F13 06:9F03: B9 59 04  LDA ram_movement_id_player,Y
C - - - - - 0x019F16 06:9F06: 29 7F     AND #$7F
C - - - - - 0x019F18 06:9F08: C9 14     CMP #$14
C - - - - - 0x019F1A 06:9F0A: F0 63     BEQ bra_9F6F_RTS
C - - - - - 0x019F1C 06:9F0C: 98        TYA
C - - - - - 0x019F1D 06:9F0D: 9D CA 04  STA ram_04CA,X
C - - - - - 0x019F20 06:9F10: 38        SEC
C - - - - - 0x019F21 06:9F11: BD 86 03  LDA ram_pos_Z_lo_player,X
C - - - - - 0x019F24 06:9F14: F9 86 03  SBC ram_pos_Z_lo_player,Y
C - - - - - 0x019F27 06:9F17: 30 56     BMI bra_9F6F_RTS
C - - - - - 0x019F29 06:9F19: C9 18     CMP #$18
C - - - - - 0x019F2B 06:9F1B: B0 24     BCS bra_9F41
C - - - - - 0x019F2D 06:9F1D: B9 F6 03  LDA ram_spd_X_hi_player,Y
C - - - - - 0x019F30 06:9F20: 9D F6 03  STA ram_spd_X_hi_player,X
C - - - - - 0x019F33 06:9F23: B9 E8 03  LDA ram_spd_X_lo_player,Y
C - - - - - 0x019F36 06:9F26: 9D E8 03  STA ram_spd_X_lo_player,X
C - - - - - 0x019F39 06:9F29: B9 12 04  LDA ram_spd_Y_hi_player,Y
C - - - - - 0x019F3C 06:9F2C: 9D 12 04  STA ram_spd_Y_hi_player,X
C - - - - - 0x019F3F 06:9F2F: B9 04 04  LDA ram_spd_Y_lo_player,Y
C - - - - - 0x019F42 06:9F32: 9D 04 04  STA ram_spd_Y_lo_player,X
C - - - - - 0x019F45 06:9F35: BD 86 04  LDA ram_игрок_состояние,X
C - - - - - 0x019F48 06:9F38: 29 40     AND #$40
C - - - - - 0x019F4A 06:9F3A: D0 0C     BNE bra_9F48
loc_9F3C:
C - - - - - 0x019F4C 06:9F3C: A9 56     LDA #$56
C - - - - - 0x019F4E 06:9F3E: 4C 64 9F  JMP loc_9F64
bra_9F41:
C - - - - - 0x019F51 06:9F41: BD 86 04  LDA ram_игрок_состояние,X
C - - - - - 0x019F54 06:9F44: 29 40     AND #$40
C - - - - - 0x019F56 06:9F46: F0 12     BEQ bra_9F5A
bra_9F48:
- - - - - - 0x019F58 06:9F48: 8C D6 04  STY ram_игрок_с_мячом
- - - - - - 0x019F5B 06:9F4B: A9 09     LDA #$09
- - - - - - 0x019F5D 06:9F4D: 8D 65 04  STA ram_movement_id_ball
- - - - - - 0x019F60 06:9F50: A9 0B     LDA #$0B
- - - - - - 0x019F62 06:9F52: 99 59 04  STA ram_movement_id_player,Y
- - - - - - 0x019F65 06:9F55: A9 56     LDA #$56
- - - - - - 0x019F67 06:9F57: 4C 64 9F  JMP loc_9F64
bra_9F5A:
C - - - - - 0x019F6A 06:9F5A: B9 86 04  LDA ram_игрок_состояние,Y
C - - - - - 0x019F6D 06:9F5D: 09 01     ORA #$01
C - - - - - 0x019F6F 06:9F5F: 99 86 04  STA ram_игрок_состояние,Y
C - - - - - 0x019F72 06:9F62: A9 14     LDA #$14
loc_9F64:
C D 0 - - - 0x019F74 06:9F64: 9D 59 04  STA ram_movement_id_player,X
C - - - - - 0x019F77 06:9F67: A9 00     LDA #$00
C - - - - - 0x019F79 06:9F69: 9D 94 00  STA ram_номер_кадра_анимации,X
C - - - - - 0x019F7C 06:9F6C: 9D 87 00  STA ram_animation_timer_player,X
bra_9F6F_RTS:
C D 0 - - - 0x019F7F 06:9F6F: 60        RTS


; bzk
- - - - - - 0x019F80 06:9F70: BD 86 04  LDA ram_игрок_состояние,X
- - - - - - 0x019F83 06:9F73: 29 20     AND #$20
- - - - - - 0x019F85 06:9F75: F0 02     BEQ bra_9F79
- - - - - - 0x019F87 06:9F77: A0 02     LDY #$02
bra_9F79:
- - - - - - 0x019F89 06:9F79: 38        SEC
- - - - - - 0x019F8A 06:9F7A: AD 92 03  LDA ram_pos_Z_lo_ball
- - - - - - 0x019F8D 06:9F7D: FD 86 03  SBC ram_pos_Z_lo_player,X
- - - - - - 0x019F90 06:9F80: 85 1C     STA ram_001C
- - - - - - 0x019F92 06:9F82: AD A5 03  LDA ram_pos_Z_hi_ball
- - - - - - 0x019F95 06:9F85: FD 99 03  SBC ram_pos_Z_hi_player,X
- - - - - - 0x019F98 06:9F88: 30 0A     BMI bra_9F94
- - - - - - 0x019F9A 06:9F8A: A5 1C     LDA ram_001C
- - - - - - 0x019F9C 06:9F8C: D9 98 9F  CMP tbl_9F98,Y
- - - - - - 0x019F9F 06:9F8F: 90 03     BCC bra_9F94
- - - - - - 0x019FA1 06:9F91: FE 59 04  INC ram_movement_id_player,X
bra_9F94:
- - - - - - 0x019FA4 06:9F94: BD 59 04  LDA ram_movement_id_player,X
- - - - - - 0x019FA7 06:9F97: 60        RTS

tbl_9F98:
- - - - - - 0x019FA8 06:9F98: 10        .byte $10   ; 
- - - - - - 0x019FA9 06:9F99: 20        .byte $20   ; 
- - - - - - 0x019FAA 06:9F9A: 08        .byte $08   ; 



sub_9F9B:
C - - - - - 0x019FAB 06:9F9B: BD 86 04  LDA ram_игрок_состояние,X
C - - - - - 0x019FAE 06:9F9E: 29 10     AND #$10
C - - - - - 0x019FB0 06:9FA0: F0 33     BEQ bra_9FD5_RTS
C - - - - - 0x019FB2 06:9FA2: A9 00     LDA #con_НА_ТРАВЕ
C - - - - - 0x019FB4 06:9FA4: 9D 30 01  STA ram_surface_player,X
C - - - - - 0x019FB7 06:9FA7: A0 00     LDY #$00
C - - - - - 0x019FB9 06:9FA9: AD 65 04  LDA ram_movement_id_ball
C - - - - - 0x019FBC 06:9FAC: 29 7F     AND #$7F
C - - - - - 0x019FBE 06:9FAE: C9 12     CMP #$12
C - - - - - 0x019FC0 06:9FB0: D0 02     BNE bra_9FB4
C - - - - - 0x019FC2 06:9FB2: C8        INY
C - - - - - 0x019FC3 06:9FB3: C8        INY
bra_9FB4:
C - - - - - 0x019FC4 06:9FB4: 18        CLC
C - - - - - 0x019FC5 06:9FB5: AD 92 03  LDA ram_pos_Z_lo_ball
C - - - - - 0x019FC8 06:9FB8: 79 D6 9F  ADC tbl_9FD6,Y
C - - - - - 0x019FCB 06:9FBB: 9D 86 03  STA ram_pos_Z_lo_player,X
C - - - - - 0x019FCE 06:9FBE: AD A5 03  LDA ram_pos_Z_hi_ball
C - - - - - 0x019FD1 06:9FC1: 79 D7 9F  ADC tbl_9FD7,Y
C - - - - - 0x019FD4 06:9FC4: 9D 99 03  STA ram_pos_Z_hi_player,X
C - - - - - 0x019FD7 06:9FC7: A9 00     LDA #$00
C - - - - - 0x019FD9 06:9FC9: 9D 2E 04  STA ram_spd_Z_hi_player,X
C - - - - - 0x019FDC 06:9FCC: 9D 20 04  STA ram_spd_Z_lo_player,X
C - - - - - 0x019FDF 06:9FCF: 9D 4A 04  STA ram_gravity_hi_player,X
C - - - - - 0x019FE2 06:9FD2: 9D 3C 04  STA ram_gravity_lo_player,X
bra_9FD5_RTS:
C - - - - - 0x019FE5 06:9FD5: 60        RTS

tbl_9FD6:
- D 0 - - - 0x019FE6 06:9FD6: 0D        .byte $0D   ; 
tbl_9FD7:
- D 0 - - - 0x019FE7 06:9FD7: 00        .byte $00   ; 
- D 0 - - - 0x019FE8 06:9FD8: 09        .byte $09   ; 
- D 0 - - - 0x019FE9 06:9FD9: 00        .byte $00   ; 



loc_9FDA:
sub_9FDA:
C D 0 - - - 0x019FEA 06:9FDA: BD 86 04  LDA ram_игрок_состояние,X
C - - - - - 0x019FED 06:9FDD: 0A        ASL
C - - - - - 0x019FEE 06:9FDE: 10 2B     BPL bra_A00B_RTS
sub_9FE0:
C - - - - - 0x019FF0 06:9FE0: A9 00     LDA #$00
C - - - - - 0x019FF2 06:9FE2: 8D 1E 04  STA ram_spd_Y_hi_ball
C - - - - - 0x019FF5 06:9FE5: 8D 10 04  STA ram_spd_Y_lo_ball
C - - - - - 0x019FF8 06:9FE8: AD A5 03  LDA ram_pos_Z_hi_ball
C - - - - - 0x019FFB 06:9FEB: 30 0A     BMI bra_9FF7
C - - - - - 0x019FFD 06:9FED: 0D 92 03  ORA ram_pos_Z_lo_ball
C - - - - - 0x01A000 06:9FF0: D0 0A     BNE bra_9FFC
C - - - - - 0x01A002 06:9FF2: A9 07     LDA #$07
C - - - - - 0x01A004 06:9FF4: 4C 08 A0  JMP loc_A008
bra_9FF7:
- - - - - - 0x01A007 06:9FF7: A9 01     LDA #$01
- - - - - - 0x01A009 06:9FF9: 4C 08 A0  JMP loc_A008
bra_9FFC:
C - - - - - 0x01A00C 06:9FFC: A9 00     LDA #$00
C - - - - - 0x01A00E 06:9FFE: 8D 56 04  STA ram_gravity_hi_ball
C - - - - - 0x01A011 06:A001: A9 80     LDA #$80
C - - - - - 0x01A013 06:A003: 8D 48 04  STA ram_gravity_lo_ball
C - - - - - 0x01A016 06:A006: A9 06     LDA #$06
loc_A008:
C D 1 - - - 0x01A018 06:A008: 8D 85 04  STA ram_мяч_тип_удара
bra_A00B_RTS:
C - - - - - 0x01A01B 06:A00B: 60        RTS



sub_A00C:
C - - - - - 0x01A01C 06:A00C: 8A        TXA
C - - - - - 0x01A01D 06:A00D: 29 01     AND #$01
C - - - - - 0x01A01F 06:A00F: A8        TAY
C - - - - - 0x01A020 06:A010: A5 57     LDA ram_option_mode_difficulty
C - - - - - 0x01A022 06:A012: 29 20     AND #con_gm_penalty
C - - - - - 0x01A024 06:A014: F0 02     BEQ bra_A018_не_пенальти
C - - - - - 0x01A026 06:A016: A0 00     LDY #$00
bra_A018_не_пенальти:
C - - - - - 0x01A028 06:A018: B9 1F A0  LDA tbl_A01F,Y
C - - - - - 0x01A02B 06:A01B: 9D A3 04  STA ram_направление_движения,X
C - - - - - 0x01A02E 06:A01E: 60        RTS

tbl_A01F:
- D 1 - - - 0x01A02F 06:A01F: 00        .byte $00   ; 
- D 1 - - - 0x01A030 06:A020: 80        .byte $80   ; 



sub_A021:
C - - - - - 0x01A031 06:A021: A9 00     LDA #con_НА_ТРАВЕ
C - - - - - 0x01A033 06:A023: 9D 30 01  STA ram_surface_player,X
C - - - - - 0x01A036 06:A026: A5 58     LDA ram_script
C - - - - - 0x01A038 06:A028: D0 14     BNE bra_A03E_RTS    ; если не игра на поле
C - - - - - 0x01A03A 06:A02A: B5 D9     LDA ram_flag_visible_player,X
C - - - - - 0x01A03C 06:A02C: F0 03     BEQ bra_A031
C - - - - - 0x01A03E 06:A02E: 20 F0 E6  JSR sub_0x01E700
bra_A031:
C - - - - - 0x01A041 06:A031: BD 30 01  LDA ram_surface_player,X
C - - - - - 0x01A044 06:A034: F0 08     BEQ bra_A03E_RTS    ; если на траве
C - - - - - 0x01A046 06:A036: BD 86 04  LDA ram_игрок_состояние,X
C - - - - - 0x01A049 06:A039: 30 03     BMI bra_A03E_RTS
C - - - - - 0x01A04B 06:A03B: 20 F3 D7  JSR sub_0x01D803
bra_A03E_RTS:
C - - - - - 0x01A04E 06:A03E: 60        RTS



sub_A03F:
C - - - - - 0x01A04F 06:A03F: 85 1C     STA ram_001C
C - - - - - 0x01A051 06:A041: 84 1D     STY ram_001D
C - - - - - 0x01A053 06:A043: BD F1 04  LDA ram_skill_id,X
loc_A046:
C D 1 - - - 0x01A056 06:A046: 88        DEY
C - - - - - 0x01A057 06:A047: 30 04     BMI bra_A04D
C - - - - - 0x01A059 06:A049: 0A        ASL
C - - - - - 0x01A05A 06:A04A: 4C 46 A0  JMP loc_A046
bra_A04D:
C - - - - - 0x01A05D 06:A04D: 0A        ASL
C - - - - - 0x01A05E 06:A04E: B0 18     BCS bra_A068
C - - - - - 0x01A060 06:A050: A5 1D     LDA ram_001D
C - - - - - 0x01A062 06:A052: C9 02     CMP #$02
C - - - - - 0x01A064 06:A054: D0 2A     BNE bra_A080
C - - - - - 0x01A066 06:A056: AD FC 05  LDA ram_05FC
C - - - - - 0x01A069 06:A059: F0 25     BEQ bra_A080
C - - - - - 0x01A06B 06:A05B: C9 01     CMP #$01
C - - - - - 0x01A06D 06:A05D: D0 09     BNE bra_A068
C - - - - - 0x01A06F 06:A05F: BD 86 04  LDA ram_игрок_состояние,X
C - - - - - 0x01A072 06:A062: 29 08     AND #$08
C - - - - - 0x01A074 06:A064: D0 02     BNE bra_A068
C - - - - - 0x01A076 06:A066: F0 18     BEQ bra_A080
bra_A068:
C - - - - - 0x01A078 06:A068: A5 1D     LDA ram_001D
C - - - - - 0x01A07A 06:A06A: 20 8F EC  JSR sub_0x01EC9F_jump_to_pointers_afetr_JSR
- D 1 - I - 0x01A07D 06:A06D: 83 A0     .word ofs_A083_00
- D 1 - I - 0x01A07F 06:A06F: 8E A0     .word ofs_A08E_01
- D 1 - I - 0x01A081 06:A071: 99 A0     .word ofs_A099_02
- D 1 - I - 0x01A083 06:A073: B8 A0     .word ofs_A0B8_03
- D 1 - I - 0x01A085 06:A075: C3 A0     .word ofs_A0C3_04
- D 1 - I - 0x01A087 06:A077: F4 A0     .word ofs_A0F4_05
- D 1 - I - 0x01A089 06:A079: 09 A1     .word ofs_A109_06



loc_A07B_запись_номера_движения:
C D 1 - - - 0x01A08B 06:A07B: 9D 59 04  STA ram_movement_id_player,X
C - - - - - 0x01A08E 06:A07E: 68        PLA
C - - - - - 0x01A08F 06:A07F: 68        PLA
bra_A080:
loc_A080:
C D 1 - - - 0x01A090 06:A080: A5 1C     LDA ram_001C
C - - - - - 0x01A092 06:A082: 60        RTS



ofs_A083_00:
C - - J - - 0x01A093 06:A083: A5 1C     LDA ram_001C
C - - - - - 0x01A095 06:A085: C9 24     CMP #$24    ; зачистка с уворотом
C - - - - - 0x01A097 06:A087: D0 F7     BNE bra_A080
C - - - - - 0x01A099 06:A089: A9 2F     LDA #$2F    ; зачистка с вращением
C - - - - - 0x01A09B 06:A08B: 4C 7B A0  JMP loc_A07B_запись_номера_движения



ofs_A08E_01:
C - - J - - 0x01A09E 06:A08E: A5 1C     LDA ram_001C
C - - - - - 0x01A0A0 06:A090: C9 19     CMP #$19    ; удар локтем
C - - - - - 0x01A0A2 06:A092: D0 EC     BNE bra_A080
C - - - - - 0x01A0A4 06:A094: A9 58     LDA #$58    ; удар коленом
C - - - - - 0x01A0A6 06:A096: 4C 7B A0  JMP loc_A07B_запись_номера_движения



ofs_A099_02:
C - - J - - 0x01A0A9 06:A099: BD 86 04  LDA ram_игрок_состояние,X
C - - - - - 0x01A0AC 06:A09C: 29 08     AND #$08
C - - - - - 0x01A0AE 06:A09E: F0 E0     BEQ bra_A080
C - - - - - 0x01A0B0 06:A0A0: A5 1C     LDA ram_001C
C - - - - - 0x01A0B2 06:A0A2: C9 32     CMP #$32    ; удар через себя в воздухе без мяча
C - - - - - 0x01A0B4 06:A0A4: F0 0D     BEQ bra_A0B3
C - - - - - 0x01A0B6 06:A0A6: C9 33     CMP #$33    ; удар ногой в воздухе без мяча
C - - - - - 0x01A0B8 06:A0A8: F0 04     BEQ bra_A0AE
C - - - - - 0x01A0BA 06:A0AA: C9 34     CMP #$34    ; удар головой в воздухе без мяча
C - - - - - 0x01A0BC 06:A0AC: D0 D2     BNE bra_A080
bra_A0AE:
C - - - - - 0x01A0BE 06:A0AE: A9 48     LDA #$48    ; ветряная крутилка ногой (начало)
C - - - - - 0x01A0C0 06:A0B0: 4C 7B A0  JMP loc_A07B_запись_номера_движения
bra_A0B3:
C - - - - - 0x01A0C3 06:A0B3: A9 4C     LDA #$4C    ; ветряная крутилка солнышком (начало)
C - - - - - 0x01A0C5 06:A0B5: 4C 7B A0  JMP loc_A07B_запись_номера_движения



ofs_A0B8_03:
C - - J - - 0x01A0C8 06:A0B8: A5 1C     LDA ram_001C
C - - - - - 0x01A0CA 06:A0BA: C9 41     CMP #$41    ; первый выпад кипера с кулаком
C - - - - - 0x01A0CC 06:A0BC: D0 C2     BNE bra_A080
C - - - - - 0x01A0CE 06:A0BE: A9 5C     LDA #$5C    ; вратарская крутилка
C - - - - - 0x01A0D0 06:A0C0: 4C 7B A0  JMP loc_A07B_запись_номера_движения



ofs_A0C3_04:
C - - J - - 0x01A0D3 06:A0C3: BD 86 04  LDA ram_игрок_состояние,X
C - - - - - 0x01A0D6 06:A0C6: 29 08     AND #$08
C - - - - - 0x01A0D8 06:A0C8: F0 B6     BEQ bra_A080
C - - - - - 0x01A0DA 06:A0CA: A5 1C     LDA ram_001C
C - - - - - 0x01A0DC 06:A0CC: C9 31     CMP #$31    ; прыжок червячком
C - - - - - 0x01A0DE 06:A0CE: F0 1F     BEQ bra_A0EF
C - - - - - 0x01A0E0 06:A0D0: C9 3B     CMP #$3B    ; ? удар локтем
C - - - - - 0x01A0E2 06:A0D2: F0 16     BEQ bra_A0EA
C - - - - - 0x01A0E4 06:A0D4: C9 42     CMP #$42    ; 
C - - - - - 0x01A0E6 06:A0D6: F0 0D     BEQ bra_A0E5
C - - - - - 0x01A0E8 06:A0D8: C9 22     CMP #$22    ; удар локтем
C - - - - - 0x01A0EA 06:A0DA: F0 13     BEQ bra_A0EF
C - - - - - 0x01A0EC 06:A0DC: C9 23     CMP #$23    ; подкат
C - - - - - 0x01A0EE 06:A0DE: D0 A0     BNE bra_A080
C - - - - - 0x01A0F0 06:A0E0: A9 51     LDA #$51    ; мексиканская крутилка ногами (процесс)
C - - - - - 0x01A0F2 06:A0E2: 4C 7B A0  JMP loc_A07B_запись_номера_движения
bra_A0E5:
C - - - - - 0x01A0F5 06:A0E5: A9 4E     LDA #$4E    ; мексиканская крутилка ногами (начало)
C - - - - - 0x01A0F7 06:A0E7: 4C 7B A0  JMP loc_A07B_запись_номера_движения
bra_A0EA:
C - - - - - 0x01A0FA 06:A0EA: A9 50     LDA #$50    ; мексиканская крутилка головой (начало)
C - - - - - 0x01A0FC 06:A0EC: 4C 7B A0  JMP loc_A07B_запись_номера_движения
bra_A0EF:
C - - - - - 0x01A0FF 06:A0EF: A9 4A     LDA #$4A    ; мексиканская крутилка головой (начало)
C - - - - - 0x01A101 06:A0F1: 4C 7B A0  JMP loc_A07B_запись_номера_движения



ofs_A0F4_05:
C - - J - - 0x01A104 06:A0F4: A5 1C     LDA ram_001C
C - - - - - 0x01A106 06:A0F6: C9 30     CMP #$30    ; прыжок
C - - - - - 0x01A108 06:A0F8: D0 07     BNE bra_A101
C - - - - - 0x01A10A 06:A0FA: BD 86 04  LDA ram_игрок_состояние,X
C - - - - - 0x01A10D 06:A0FD: 29 40     AND #$40
C - - - - - 0x01A10F 06:A0FF: D0 03     BNE bra_A104
bra_A101:
C - - - - - 0x01A111 06:A101: 4C 80 A0  JMP loc_A080
bra_A104:
C - - - - - 0x01A114 06:A104: A9 57     LDA #$57    ; прыжок высокопрыгающего
C - - - - - 0x01A116 06:A106: 4C 7B A0  JMP loc_A07B_запись_номера_движения



ofs_A109_06:
C - - J - - 0x01A119 06:A109: A5 1C     LDA ram_001C
C - - - - - 0x01A11B 06:A10B: C9 30     CMP #$30    ; прыжок
C - - - - - 0x01A11D 06:A10D: F0 07     BEQ bra_A116
C - - - - - 0x01A11F 06:A10F: C9 52     CMP #$52    ; прыжок кипера на месте
C - - - - - 0x01A121 06:A111: F0 03     BEQ bra_A116
bra_A113:
C - - - - - 0x01A123 06:A113: 4C 80 A0  JMP loc_A080
bra_A116:
C - - - - - 0x01A126 06:A116: 8A        TXA
C - - - - - 0x01A127 06:A117: 4D D6 04  EOR ram_игрок_с_мячом
C - - - - - 0x01A12A 06:A11A: 29 01     AND #$01
C - - - - - 0x01A12C 06:A11C: F0 F5     BEQ bra_A113
C - - - - - 0x01A12E 06:A11E: 24 5C     BIT ram_flag_gameplay
C - - - - - 0x01A130 06:A120: 70 F1     BVS bra_A113
C - - - - - 0x01A132 06:A122: AC D6 04  LDY ram_игрок_с_мячом
C - - - - - 0x01A135 06:A125: C0 0A     CPY #$0A
C - - - - - 0x01A137 06:A127: 90 05     BCC bra_A12E
C - - - - - 0x01A139 06:A129: B9 90 06  LDA ram_бит_для_2000_атрибуты,Y
C - - - - - 0x01A13C 06:A12C: 10 E5     BPL bra_A113
bra_A12E:
C - - - - - 0x01A13E 06:A12E: A9 5B     LDA #$5B    ; гвинейская крутилка
C - - - - - 0x01A140 06:A130: 4C 7B A0  JMP loc_A07B_запись_номера_движения



sub_A133_смещение_объекта_в_воздухе:
C - - - - - 0x01A143 06:A133: BD B0 04  LDA ram_смена_угла_движения,X
C - - - - - 0x01A146 06:A136: C9 FF     CMP #$FF
C - - - - - 0x01A148 06:A138: F0 2C     BEQ bra_A166_RTS
C - - - - - 0x01A14A 06:A13A: 29 E0     AND #$E0
C - - - - - 0x01A14C 06:A13C: 4A        LSR
C - - - - - 0x01A14D 06:A13D: 4A        LSR
C - - - - - 0x01A14E 06:A13E: 4A        LSR
C - - - - - 0x01A14F 06:A13F: A8        TAY
C - - - - - 0x01A150 06:A140: 18        CLC
C - - - - - 0x01A151 06:A141: BD E8 03  LDA ram_spd_X_lo_player,X
C - - - - - 0x01A154 06:A144: 79 67 A1  ADC tbl_A167_X_скорость,Y
C - - - - - 0x01A157 06:A147: 9D E8 03  STA ram_spd_X_lo_player,X
C - - - - - 0x01A15A 06:A14A: BD F6 03  LDA ram_spd_X_hi_player,X
C - - - - - 0x01A15D 06:A14D: 79 68 A1  ADC tbl_A167_X_скорость + 1,Y
C - - - - - 0x01A160 06:A150: 9D F6 03  STA ram_spd_X_hi_player,X
C - - - - - 0x01A163 06:A153: 18        CLC
C - - - - - 0x01A164 06:A154: BD 04 04  LDA ram_spd_Y_lo_player,X
C - - - - - 0x01A167 06:A157: 79 69 A1  ADC tbl_A167_Y_скорость + 2,Y
C - - - - - 0x01A16A 06:A15A: 9D 04 04  STA ram_spd_Y_lo_player,X
C - - - - - 0x01A16D 06:A15D: BD 12 04  LDA ram_spd_Y_hi_player,X
C - - - - - 0x01A170 06:A160: 79 6A A1  ADC tbl_A167_Y_скорость + 3,Y
C - - - - - 0x01A173 06:A163: 9D 12 04  STA ram_spd_Y_hi_player,X
bra_A166_RTS:
C - - - - - 0x01A176 06:A166: 60        RTS

; смещение игрока в воздухе
tbl_A167_X_скорость:
tbl_A167_Y_скорость:
- D 1 - - - 0x01A177 06:A167: 00 00     .word $0000, $FFF4      ; 00
- D 1 - - - 0x01A17B 06:A16B: 08 00     .word $0008, $FFF8      ; 20
- D 1 - - - 0x01A17F 06:A16F: 0C 00     .word $000C, $0000      ; 40
- D 1 - - - 0x01A183 06:A173: 08 00     .word $0008, $0008      ; 60
- D 1 - - - 0x01A187 06:A177: 00 00     .word $0000, $000C      ; 80
- D 1 - - - 0x01A18B 06:A17B: F8 FF     .word $FFF8, $0008      ; A0
- D 1 - - - 0x01A18F 06:A17F: F4 FF     .word $FFF4, $0000      ; C0
- D 1 - - - 0x01A193 06:A183: F8 FF     .word $FFF8, $FFF8      ; E0



sub_A187_ограничение_максимальной_скорости:
C - - - - - 0x01A197 06:A187: A0 00     LDY #$00
C - - - - - 0x01A199 06:A189: E0 0C     CPX #$0C
C - - - - - 0x01A19B 06:A18B: 90 02     BCC bra_A18F_это_не_мяч
C - - - - - 0x01A19D 06:A18D: A0 04     LDY #$04
bra_A18F_это_не_мяч:
C - - - - - 0x01A19F 06:A18F: 84 1D     STY ram_001D
C - - - - - 0x01A1A1 06:A191: BD F6 03  LDA ram_spd_X_hi_player,X
C - - - - - 0x01A1A4 06:A194: 10 05     BPL bra_A19B
C - - - - - 0x01A1A6 06:A196: 49 FF     EOR #$FF
C - - - - - 0x01A1A8 06:A198: 18        CLC
C - - - - - 0x01A1A9 06:A199: 69 01     ADC #$01
bra_A19B:
C - - - - - 0x01A1AB 06:A19B: D9 D9 A1  CMP tbl_A1D8_X_скорость + 1,Y
C - - - - - 0x01A1AE 06:A19E: 90 13     BCC bra_A1B3
C - - - - - 0x01A1B0 06:A1A0: BD F6 03  LDA ram_spd_X_hi_player,X
C - - - - - 0x01A1B3 06:A1A3: 10 02     BPL bra_A1A7
C - - - - - 0x01A1B5 06:A1A5: C8        INY
C - - - - - 0x01A1B6 06:A1A6: C8        INY
bra_A1A7:
C - - - - - 0x01A1B7 06:A1A7: B9 D8 A1  LDA tbl_A1D8_X_скорость,Y
C - - - - - 0x01A1BA 06:A1AA: 9D E8 03  STA ram_spd_X_lo_player,X
C - - - - - 0x01A1BD 06:A1AD: B9 D9 A1  LDA tbl_A1D8_X_скорость + 1,Y
C - - - - - 0x01A1C0 06:A1B0: 9D F6 03  STA ram_spd_X_hi_player,X
bra_A1B3:
C - - - - - 0x01A1C3 06:A1B3: A4 1D     LDY ram_001D
C - - - - - 0x01A1C5 06:A1B5: BD 12 04  LDA ram_spd_Y_hi_player,X
C - - - - - 0x01A1C8 06:A1B8: 10 05     BPL bra_A1BF
C - - - - - 0x01A1CA 06:A1BA: 49 FF     EOR #$FF
C - - - - - 0x01A1CC 06:A1BC: 18        CLC
C - - - - - 0x01A1CD 06:A1BD: 69 01     ADC #$01
bra_A1BF:
C - - - - - 0x01A1CF 06:A1BF: D9 E1 A1  CMP tbl_A1E0_Y_скорость + 1,Y
C - - - - - 0x01A1D2 06:A1C2: 90 13     BCC bra_A1D7_RTS
C - - - - - 0x01A1D4 06:A1C4: BD 12 04  LDA ram_spd_Y_hi_player,X
C - - - - - 0x01A1D7 06:A1C7: 10 02     BPL bra_A1CB
C - - - - - 0x01A1D9 06:A1C9: C8        INY
C - - - - - 0x01A1DA 06:A1CA: C8        INY
bra_A1CB:
C - - - - - 0x01A1DB 06:A1CB: B9 E0 A1  LDA tbl_A1E0_Y_скорость,Y
C - - - - - 0x01A1DE 06:A1CE: 9D 04 04  STA ram_spd_Y_lo_player,X
C - - - - - 0x01A1E1 06:A1D1: B9 E1 A1  LDA tbl_A1E0_Y_скорость + 1,Y
C - - - - - 0x01A1E4 06:A1D4: 9D 12 04  STA ram_spd_Y_hi_player,X
bra_A1D7_RTS:
C - - - - - 0x01A1E7 06:A1D7: 60        RTS

tbl_A1D8_X_скорость:
- D 1 - - - 0x01A1E8 06:A1D8: 00 06     .word $0600
- D 1 - - - 0x01A1EA 06:A1DA: 00 FA     .word $FA00
- D 1 - - - 0x01A1EC 06:A1DC: 00 08     .word $0800
- D 1 - - - 0x01A1EE 06:A1DE: 00 F8     .word $F800

tbl_A1E0_Y_скорость:
- D 1 - - - 0x01A1F0 06:A1E0: 00 04     .word $0400
- D 1 - - - 0x01A1F2 06:A1E2: 00 FC     .word $FC00
- D 1 - - - 0x01A1F4 06:A1E4: 00 08     .word $0800
- D 1 - - - 0x01A1F6 06:A1E6: 00 F8     .word $F800



sub_A1E9:
C - - - - - 0x01A1F9 06:A1E9: BD 2E 04  LDA ram_spd_Z_hi_player,X
C - - - - - 0x01A1FC 06:A1EC: D0 08     BNE bra_A1F6_RTS
C - - - - - 0x01A1FE 06:A1EE: BD 86 04  LDA ram_игрок_состояние,X
C - - - - - 0x01A201 06:A1F1: 09 02     ORA #$02
C - - - - - 0x01A203 06:A1F3: 9D 86 04  STA ram_игрок_состояние,X
bra_A1F6_RTS:
C - - - - - 0x01A206 06:A1F6: 60        RTS



sub_A1F7:
C - - - - - 0x01A207 06:A1F7: 84 44     STY ram_0044
C - - - - - 0x01A209 06:A1F9: 29 03     AND #$03
C - - - - - 0x01A20B 06:A1FB: 20 8F EC  JSR sub_0x01EC9F_jump_to_pointers_afetr_JSR
- D 1 - I - 0x01A20E 06:A1FE: 06 A2     .word ofs_A206_00
- D 1 - I - 0x01A210 06:A200: 74 A2     .word ofs_A274_01
- D 1 - I - 0x01A212 06:A202: 8F A2     .word ofs_A28F_02
- - - - - - 0x01A214 06:A204: 06 A2     .word ofs_A206_03



ofs_A206_00:
ofs_A206_03:
C - - J - - 0x01A216 06:A206: A5 5C     LDA ram_flag_gameplay
C - - - - - 0x01A218 06:A208: 0A        ASL
C - - - - - 0x01A219 06:A209: 10 3D     BPL bra_A248
C - - - - - 0x01A21B 06:A20B: 0A        ASL
C - - - - - 0x01A21C 06:A20C: 30 3A     BMI bra_A248
C - - - - - 0x01A21E 06:A20E: AD 5C 00  LDA ram_flag_gameplay
C - - - - - 0x01A221 06:A211: 29 0F     AND #$0F
C - - - - - 0x01A223 06:A213: D0 07     BNE bra_A21C
C - - - - - 0x01A225 06:A215: AD 59 05  LDA ram_0559
C - - - - - 0x01A228 06:A218: D0 06     BNE bra_A220
C - - - - - 0x01A22A 06:A21A: F0 2C     BEQ bra_A248
bra_A21C:
C - - - - - 0x01A22C 06:A21C: 29 02     AND #$02
C - - - - - 0x01A22E 06:A21E: F0 28     BEQ bra_A248
bra_A220:
C - - - - - 0x01A230 06:A220: 8A        TXA
C - - - - - 0x01A231 06:A221: 29 01     AND #$01
C - - - - - 0x01A233 06:A223: A8        TAY
C - - - - - 0x01A234 06:A224: B9 2A 05  LDA ram_флаг_владения_мячом_ком,Y
C - - - - - 0x01A237 06:A227: 29 01     AND #$01
C - - - - - 0x01A239 06:A229: F0 05     BEQ bra_A230
C - - - - - 0x01A23B 06:A22B: A9 04     LDA #$04
C - - - - - 0x01A23D 06:A22D: 4C D1 A2  JMP loc_A2D1
bra_A230:
C - - - - - 0x01A240 06:A230: B9 2C 05  LDA ram_номер_команды,Y
C - - - - - 0x01A243 06:A233: 29 0F     AND #$0F
C - - - - - 0x01A245 06:A235: C9 0F     CMP #$0F
C - - - - - 0x01A247 06:A237: F0 0F     BEQ bra_A248
C - - - - - 0x01A249 06:A239: 8A        TXA
C - - - - - 0x01A24A 06:A23A: 4A        LSR
C - - - - - 0x01A24B 06:A23B: A8        TAY
C - - - - - 0x01A24C 06:A23C: B9 42 A2  LDA tbl_A242,Y
C - - - - - 0x01A24F 06:A23F: 4C D1 A2  JMP loc_A2D1

tbl_A242:
- D 1 - - - 0x01A252 06:A242: 05        .byte $05   ; 
- D 1 - - - 0x01A253 06:A243: 06        .byte $06   ; 
- D 1 - - - 0x01A254 06:A244: 07        .byte $07   ; 
- D 1 - - - 0x01A255 06:A245: 07        .byte $07   ; 
- D 1 - - - 0x01A256 06:A246: 06        .byte $06   ; 
- D 1 - - - 0x01A257 06:A247: 05        .byte $05   ; 



bra_A248:
C - - - - - 0x01A258 06:A248: E0 0A     CPX #$0A
C - - - - - 0x01A25A 06:A24A: 90 0E     BCC bra_A25A
C - - - - - 0x01A25C 06:A24C: BD 7C 06  LDA ram_067C,X
C - - - - - 0x01A25F 06:A24F: 30 09     BMI bra_A25A
C - - - - - 0x01A261 06:A251: 24 5C     BIT ram_flag_gameplay
C - - - - - 0x01A263 06:A253: 70 05     BVS bra_A25A
C - - - - - 0x01A265 06:A255: A9 01     LDA #$01
C - - - - - 0x01A267 06:A257: 4C D1 A2  JMP loc_A2D1
bra_A25A:
C - - - - - 0x01A26A 06:A25A: BD 86 04  LDA ram_игрок_состояние,X
C - - - - - 0x01A26D 06:A25D: 29 11     AND #$11
C - - - - - 0x01A26F 06:A25F: F0 0E     BEQ bra_A26F
C - - - - - 0x01A271 06:A261: 29 01     AND #$01
C - - - - - 0x01A273 06:A263: F0 05     BEQ bra_A26A
C - - - - - 0x01A275 06:A265: A9 02     LDA #$02
C - - - - - 0x01A277 06:A267: 4C D1 A2  JMP loc_A2D1
bra_A26A:
C - - - - - 0x01A27A 06:A26A: A9 03     LDA #$03
C - - - - - 0x01A27C 06:A26C: 4C D1 A2  JMP loc_A2D1
bra_A26F:
C - - - - - 0x01A27F 06:A26F: A9 00     LDA #$00
C - - - - - 0x01A281 06:A271: 4C D1 A2  JMP loc_A2D1



ofs_A274_01:
C - - J - - 0x01A284 06:A274: BD B0 04  LDA ram_смена_угла_движения,X
C - - - - - 0x01A287 06:A277: C9 FF     CMP #$FF
C - - - - - 0x01A289 06:A279: F0 5B     BEQ bra_A2D6_RTS
C - - - - - 0x01A28B 06:A27B: 4A        LSR
C - - - - - 0x01A28C 06:A27C: 4A        LSR
C - - - - - 0x01A28D 06:A27D: 4A        LSR
C - - - - - 0x01A28E 06:A27E: 4A        LSR
C - - - - - 0x01A28F 06:A27F: 4A        LSR
C - - - - - 0x01A290 06:A280: A8        TAY
C - - - - - 0x01A291 06:A281: B9 87 A2  LDA tbl_A287,Y
C - - - - - 0x01A294 06:A284: 4C D1 A2  JMP loc_A2D1

tbl_A287:
- D 1 - - - 0x01A297 06:A287: 00        .byte $00   ; 
- - - - - - 0x01A298 06:A288: 00        .byte $00   ; 
- D 1 - - - 0x01A299 06:A289: FF        .byte $FF   ; 
- D 1 - - - 0x01A29A 06:A28A: 01        .byte $01   ; 
- D 1 - - - 0x01A29B 06:A28B: 01        .byte $01   ; 
- D 1 - - - 0x01A29C 06:A28C: 01        .byte $01   ; 
- D 1 - - - 0x01A29D 06:A28D: FF        .byte $FF   ; 
- - - - - - 0x01A29E 06:A28E: 00        .byte $00   ; 



ofs_A28F_02:
C - - J - - 0x01A29F 06:A28F: A4 44     LDY ram_0044
C - - - - - 0x01A2A1 06:A291: BD 86 04  LDA ram_игрок_состояние,X
C - - - - - 0x01A2A4 06:A294: 29 20     AND #$20
C - - - - - 0x01A2A6 06:A296: F0 02     BEQ bra_A29A
- - - - - - 0x01A2A8 06:A298: A0 03     LDY #$03
bra_A29A:
C - - - - - 0x01A2AA 06:A29A: 38        SEC
C - - - - - 0x01A2AB 06:A29B: AD 92 03  LDA ram_pos_Z_lo_ball
C - - - - - 0x01A2AE 06:A29E: FD 86 03  SBC ram_pos_Z_lo_player,X
C - - - - - 0x01A2B1 06:A2A1: 85 1C     STA ram_001C
C - - - - - 0x01A2B3 06:A2A3: AD A5 03  LDA ram_pos_Z_hi_ball
C - - - - - 0x01A2B6 06:A2A6: FD 99 03  SBC ram_pos_Z_hi_player,X
C - - - - - 0x01A2B9 06:A2A9: 30 2B     BMI bra_A2D6_RTS
C - - - - - 0x01A2BB 06:A2AB: A5 1C     LDA ram_001C
C - - - - - 0x01A2BD 06:A2AD: D9 CD A2  CMP tbl_A2CD,Y
C - - - - - 0x01A2C0 06:A2B0: B0 24     BCS bra_A2D6_RTS
C - - - - - 0x01A2C2 06:A2B2: FE 6C 04  INC ram_animation_sub_id_player,X
C - - - - - 0x01A2C5 06:A2B5: 38        SEC
C - - - - - 0x01A2C6 06:A2B6: BD 14 03  LDA ram_pos_X_lo_player,X
C - - - - - 0x01A2C9 06:A2B9: ED 20 03  SBC ram_pos_X_lo_ball
C - - - - - 0x01A2CC 06:A2BC: BD 27 03  LDA ram_pos_X_hi_player,X
C - - - - - 0x01A2CF 06:A2BF: ED 33 03  SBC ram_pos_X_hi_ball
C - - - - - 0x01A2D2 06:A2C2: 5D A3 04  EOR ram_направление_движения,X
C - - - - - 0x01A2D5 06:A2C5: 30 0F     BMI bra_A2D6_RTS
C - - - - - 0x01A2D7 06:A2C7: FE 6C 04  INC ram_animation_sub_id_player,X
C - - - - - 0x01A2DA 06:A2CA: 4C D6 A2  RTS

tbl_A2CD:
- D 1 - - - 0x01A2DD 06:A2CD: 10        .byte $10   ; 
- D 1 - - - 0x01A2DE 06:A2CE: 20        .byte $20   ; 
- D 1 - - - 0x01A2DF 06:A2CF: 30        .byte $30   ; 
- - - - - - 0x01A2E0 06:A2D0: 08        .byte $08   ; 



loc_A2D1:
C D 1 - - - 0x01A2E1 06:A2D1: 30 03     BMI bra_A2D6_RTS
C - - - - - 0x01A2E3 06:A2D3: 9D 6C 04  STA ram_animation_sub_id_player,X
bra_A2D6_RTS:
C D 1 - - - 0x01A2E6 06:A2D6: 60        RTS



sub_A2D7:
C - - - - - 0x01A2E7 06:A2D7: 85 1C     STA ram_001C
C - - - - - 0x01A2E9 06:A2D9: B9 50 06  LDA ram_позиция_управление,Y
C - - - - - 0x01A2EC 06:A2DC: 29 0F     AND #$0F
C - - - - - 0x01A2EE 06:A2DE: 18        CLC
C - - - - - 0x01A2EF 06:A2DF: 65 1C     ADC ram_001C
C - - - - - 0x01A2F1 06:A2E1: 10 04     BPL bra_A2E7
- - - - - - 0x01A2F3 06:A2E3: A9 00     LDA #$00
- - - - - - 0x01A2F5 06:A2E5: F0 06     BEQ bra_A2ED
bra_A2E7:
C - - - - - 0x01A2F7 06:A2E7: C9 10     CMP #$10
C - - - - - 0x01A2F9 06:A2E9: 90 02     BCC bra_A2ED
C - - - - - 0x01A2FB 06:A2EB: A9 0F     LDA #$0F
bra_A2ED:
C - - - - - 0x01A2FD 06:A2ED: 85 1C     STA ram_001C
C - - - - - 0x01A2FF 06:A2EF: B9 50 06  LDA ram_позиция_управление,Y
C - - - - - 0x01A302 06:A2F2: 29 F0     AND #$F0
C - - - - - 0x01A304 06:A2F4: 05 1C     ORA ram_001C
C - - - - - 0x01A306 06:A2F6: 99 50 06  STA ram_позиция_управление,Y
C - - - - - 0x01A309 06:A2F9: 60        RTS



sub_A2FA:
C - - - - - 0x01A30A 06:A2FA: AC D6 04  LDY ram_игрок_с_мячом
C - - - - - 0x01A30D 06:A2FD: B9 50 06  LDA ram_позиция_управление,Y
C - - - - - 0x01A310 06:A300: 30 23     BMI bra_A325
C - - - - - 0x01A312 06:A302: B9 B0 04  LDA ram_смена_угла_движения,Y
C - - - - - 0x01A315 06:A305: C9 FF     CMP #$FF
C - - - - - 0x01A317 06:A307: D0 05     BNE bra_A30E
C - - - - - 0x01A319 06:A309: B9 A3 04  LDA ram_направление_движения,Y
C - - - - - 0x01A31C 06:A30C: 09 40     ORA #$40
bra_A30E:
C - - - - - 0x01A31E 06:A30E: 29 E0     AND #$E0
C - - - - - 0x01A320 06:A310: 9D B0 04  STA ram_смена_угла_движения,X
C - - - - - 0x01A323 06:A313: AD D6 04  LDA ram_игрок_с_мячом
C - - - - - 0x01A326 06:A316: 29 01     AND #$01
C - - - - - 0x01A328 06:A318: A8        TAY
C - - - - - 0x01A329 06:A319: BD B0 04  LDA ram_смена_угла_движения,X
C - - - - - 0x01A32C 06:A31C: 99 7E 06  STA ram_067E,Y
C - - - - - 0x01A32F 06:A31F: A5 57     LDA ram_option_mode_difficulty
C - - - - - 0x01A331 06:A321: 29 20     AND #con_gm_penalty
C - - - - - 0x01A333 06:A323: D0 35     BNE bra_A35A_пенальти
bra_A325:
C - - - - - 0x01A335 06:A325: AD D6 04  LDA ram_игрок_с_мячом
C - - - - - 0x01A338 06:A328: 29 01     AND #$01
C - - - - - 0x01A33A 06:A32A: A8        TAY
C - - - - - 0x01A33B 06:A32B: B9 7E 06  LDA ram_067E,Y
C - - - - - 0x01A33E 06:A32E: 29 10     AND #$10
C - - - - - 0x01A340 06:A330: F0 09     BEQ bra_A33B
C - - - - - 0x01A342 06:A332: B9 7E 06  LDA ram_067E,Y
C - - - - - 0x01A345 06:A335: 29 0F     AND #$0F
C - - - - - 0x01A347 06:A337: A8        TAY
C - - - - - 0x01A348 06:A338: 4C 91 A3  JMP loc_A391
bra_A33B:
C - - - - - 0x01A34B 06:A33B: AD D6 04  LDA ram_игрок_с_мячом
C - - - - - 0x01A34E 06:A33E: 29 01     AND #$01
C - - - - - 0x01A350 06:A340: 09 0A     ORA #$0A
C - - - - - 0x01A352 06:A342: 85 28     STA ram_0028
C - - - - - 0x01A354 06:A344: A9 02     LDA #$02
C - - - - - 0x01A356 06:A346: 85 29     STA ram_0029
C - - - - - 0x01A358 06:A348: A9 20     LDA #$20
C - - - - - 0x01A35A 06:A34A: 85 2B     STA ram_002B
C - - - - - 0x01A35C 06:A34C: B9 7E 06  LDA ram_067E,Y
C - - - - - 0x01A35F 06:A34F: 29 E0     AND #$E0
C - - - - - 0x01A361 06:A351: 85 2A     STA ram_002A
C - - - - - 0x01A363 06:A353: 20 6A F9  JSR sub_0x01F97A
C - - - - - 0x01A366 06:A356: C0 FF     CPY #$FF
C - - - - - 0x01A368 06:A358: D0 37     BNE bra_A391
bra_A35A_пенальти:
C - - - - - 0x01A36A 06:A35A: AD D6 04  LDA ram_игрок_с_мячом
C - - - - - 0x01A36D 06:A35D: 29 01     AND #$01
C - - - - - 0x01A36F 06:A35F: A8        TAY
C - - - - - 0x01A370 06:A360: B9 7E 06  LDA ram_067E,Y
C - - - - - 0x01A373 06:A363: 29 E0     AND #$E0
C - - - - - 0x01A375 06:A365: 4A        LSR
C - - - - - 0x01A376 06:A366: 1D A3 04  ORA ram_направление_движения,X
C - - - - - 0x01A379 06:A369: 4A        LSR
C - - - - - 0x01A37A 06:A36A: 4A        LSR
C - - - - - 0x01A37B 06:A36B: A8        TAY
C - - - - - 0x01A37C 06:A36C: 18        CLC
C - - - - - 0x01A37D 06:A36D: BD 14 03  LDA ram_pos_X_lo_player,X
C - - - - - 0x01A380 06:A370: 79 1B A4  ADC tbl_A41B_X_скорость,Y
C - - - - - 0x01A383 06:A373: 85 2E     STA ram_002E
C - - - - - 0x01A385 06:A375: BD 27 03  LDA ram_pos_X_hi_player,X
C - - - - - 0x01A388 06:A378: 79 1C A4  ADC tbl_A41B_X_скорость + 1,Y
C - - - - - 0x01A38B 06:A37B: 85 2F     STA ram_002F
C - - - - - 0x01A38D 06:A37D: 18        CLC
C - - - - - 0x01A38E 06:A37E: BD 4D 03  LDA ram_pos_Y_lo_player,X
C - - - - - 0x01A391 06:A381: 79 1D A4  ADC tbl_A41B_Y_скорость + 2,Y
C - - - - - 0x01A394 06:A384: 85 30     STA ram_0030
C - - - - - 0x01A396 06:A386: BD 60 03  LDA ram_pos_Y_hi_player,X
C - - - - - 0x01A399 06:A389: 79 1E A4  ADC tbl_A41B_Y_скорость + 3,Y
C - - - - - 0x01A39C 06:A38C: 85 31     STA ram_0031
C - - - - - 0x01A39E 06:A38E: 4C 02 A4  JMP loc_A402
bra_A391:
loc_A391:
C D 1 - - - 0x01A3A1 06:A391: A9 22     LDA #$22
C - - - - - 0x01A3A3 06:A393: 99 68 06  STA ram_0668,Y
C - - - - - 0x01A3A6 06:A396: B9 14 03  LDA ram_pos_X_lo_player,Y
C - - - - - 0x01A3A9 06:A399: 85 2E     STA ram_002E
C - - - - - 0x01A3AB 06:A39B: B9 27 03  LDA ram_pos_X_hi_player,Y
C - - - - - 0x01A3AE 06:A39E: 85 2F     STA ram_002F
C - - - - - 0x01A3B0 06:A3A0: B9 4D 03  LDA ram_pos_Y_lo_player,Y
C - - - - - 0x01A3B3 06:A3A3: 85 30     STA ram_0030
C - - - - - 0x01A3B5 06:A3A5: B9 60 03  LDA ram_pos_Y_hi_player,Y
C - - - - - 0x01A3B8 06:A3A8: 85 31     STA ram_0031
C - - - - - 0x01A3BA 06:A3AA: AD FC 06  LDA ram_06FC
C - - - - - 0x01A3BD 06:A3AD: 10 53     BPL bra_A402
C - - - - - 0x01A3BF 06:A3AF: B9 86 04  LDA ram_игрок_состояние,Y
C - - - - - 0x01A3C2 06:A3B2: 29 08     AND #$08
C - - - - - 0x01A3C4 06:A3B4: F0 4C     BEQ bra_A402
C - - - - - 0x01A3C6 06:A3B6: AD D6 04  LDA ram_игрок_с_мячом
C - - - - - 0x01A3C9 06:A3B9: 29 01     AND #$01
C - - - - - 0x01A3CB 06:A3BB: A8        TAY
C - - - - - 0x01A3CC 06:A3BC: B9 5B A4  LDA tbl_A45B,Y
C - - - - - 0x01A3CF 06:A3BF: C5 2F     CMP ram_002F
C - - - - - 0x01A3D1 06:A3C1: F0 3F     BEQ bra_A402
C - - - - - 0x01A3D3 06:A3C3: 38        SEC
C - - - - - 0x01A3D4 06:A3C4: BD 14 03  LDA ram_pos_X_lo_player,X
C - - - - - 0x01A3D7 06:A3C7: E5 2E     SBC ram_002E
C - - - - - 0x01A3D9 06:A3C9: 85 1C     STA ram_001C
C - - - - - 0x01A3DB 06:A3CB: BD 27 03  LDA ram_pos_X_hi_player,X
C - - - - - 0x01A3DE 06:A3CE: E5 2F     SBC ram_002F
C - - - - - 0x01A3E0 06:A3D0: F0 0D     BEQ bra_A3DF
C - - - - - 0x01A3E2 06:A3D2: C9 FF     CMP #$FF
C - - - - - 0x01A3E4 06:A3D4: D0 2C     BNE bra_A402
C - - - - - 0x01A3E6 06:A3D6: 18        CLC
C - - - - - 0x01A3E7 06:A3D7: A5 1C     LDA ram_001C
C - - - - - 0x01A3E9 06:A3D9: 49 FF     EOR #$FF
C - - - - - 0x01A3EB 06:A3DB: 69 01     ADC #$01
C - - - - - 0x01A3ED 06:A3DD: 85 1C     STA ram_001C
bra_A3DF:
C - - - - - 0x01A3EF 06:A3DF: A5 1C     LDA ram_001C
C - - - - - 0x01A3F1 06:A3E1: 10 02     BPL bra_A3E5
C - - - - - 0x01A3F3 06:A3E3: A9 7F     LDA #$7F
bra_A3E5:
C - - - - - 0x01A3F5 06:A3E5: 4A        LSR
C - - - - - 0x01A3F6 06:A3E6: 4A        LSR
C - - - - - 0x01A3F7 06:A3E7: 29 FC     AND #$FC
C - - - - - 0x01A3F9 06:A3E9: A8        TAY
C - - - - - 0x01A3FA 06:A3EA: AD D6 04  LDA ram_игрок_с_мячом
C - - - - - 0x01A3FD 06:A3ED: 29 01     AND #$01
C - - - - - 0x01A3FF 06:A3EF: F0 02     BEQ bra_A3F3
C - - - - - 0x01A401 06:A3F1: C8        INY
C - - - - - 0x01A402 06:A3F2: C8        INY
bra_A3F3:
C - - - - - 0x01A403 06:A3F3: 18        CLC
C - - - - - 0x01A404 06:A3F4: A5 2E     LDA ram_002E
C - - - - - 0x01A406 06:A3F6: 79 5D A4  ADC tbl_A45D_скорость,Y
C - - - - - 0x01A409 06:A3F9: 85 2E     STA ram_002E
C - - - - - 0x01A40B 06:A3FB: A5 2F     LDA ram_002F
C - - - - - 0x01A40D 06:A3FD: 79 5E A4  ADC tbl_A45D_скорость + 1,Y
C - - - - - 0x01A410 06:A400: 85 2F     STA ram_002F
bra_A402:
loc_A402:
C D 1 - - - 0x01A412 06:A402: 20 91 F6  JSR sub_0x01F6A1
C - - - - - 0x01A415 06:A405: 9D B0 04  STA ram_смена_угла_движения,X
C - - - - - 0x01A418 06:A408: 20 7D A4  JSR sub_A47D_пас
C - - - - - 0x01A41B 06:A40B: 20 67 98  JSR sub_9867_начальная_X_Y_скорость_мяча
C - - - - - 0x01A41E 06:A40E: 20 D8 A4  JSR sub_A4D8
C - - - - - 0x01A421 06:A411: A5 2B     LDA ram_002B
C - - - - - 0x01A423 06:A413: C9 10     CMP #$10
C - - - - - 0x01A425 06:A415: F0 03     BEQ bra_A41A_RTS
C - - - - - 0x01A427 06:A417: 20 D3 98  JSR sub_98D3_начальная_Z_скорость_мяча
bra_A41A_RTS:
C - - - - - 0x01A42A 06:A41A: 60        RTS



tbl_A41B_X_скорость:
tbl_A41B_Y_скорость:
- - - - - - 0x01A42B 06:A41B: 43 00     .word $0043, $FFBD
- - - - - - 0x01A42F 06:A41F: 43 00     .word $0043, $FFBD
- D 1 - - - 0x01A433 06:A423: 60 00     .word $0060, $0000
- - - - - - 0x01A437 06:A427: 43 00     .word $0043, $0043
- D 1 - - - 0x01A43B 06:A42B: 43 00     .word $0043, $0043
- - - - - - 0x01A43F 06:A42F: BD FF     .word $FFBD, $0043
- - - - - - 0x01A443 06:A433: A0 FF     .word $FFA0, $0000
- - - - - - 0x01A447 06:A437: BD FF     .word $FFBD, $FFBD
- - - - - - 0x01A44B 06:A43B: BD FF     .word $FFBD, $FFBD
- - - - - - 0x01A44F 06:A43F: 43 00     .word $0043, $FFBD
- - - - - - 0x01A453 06:A443: 60 00     .word $0060, $0000
- - - - - - 0x01A457 06:A447: 43 00     .word $0043, $0043
- D 1 - - - 0x01A45B 06:A44B: BD FF     .word $FFBD, $0043
- - - - - - 0x01A45F 06:A44F: BD FF     .word $FFBD, $0043
- - - - - - 0x01A463 06:A453: A0 FF     .word $FFA0, $0000
- - - - - - 0x01A467 06:A457: BD FF     .word $FFBD, $FFBD



tbl_A45B:
- D 1 - - - 0x01A46B 06:A45B: 03        .byte $03   ; 
- D 1 - - - 0x01A46C 06:A45C: 00        .byte $00   ; 



tbl_A45D_скорость:
- D 1 - - - 0x01A46D 06:A45D: 00 00     .word $0000
- D 1 - - - 0x01A46F 06:A45F: 00 00     .word $0000
- D 1 - - - 0x01A471 06:A461: 00 00     .word $0000
- D 1 - - - 0x01A473 06:A463: 00 00     .word $0000
- D 1 - - - 0x01A475 06:A465: 00 00     .word $0000
- D 1 - - - 0x01A477 06:A467: 00 00     .word $0000
- D 1 - - - 0x01A479 06:A469: 08 00     .word $0008
- D 1 - - - 0x01A47B 06:A46B: F8 FF     .word $FFF8
- D 1 - - - 0x01A47D 06:A46D: 20 00     .word $0020
- D 1 - - - 0x01A47F 06:A46F: E0 FF     .word $FFE0
- D 1 - - - 0x01A481 06:A471: 28 00     .word $0028
- D 1 - - - 0x01A483 06:A473: D8 FF     .word $FFD8
- D 1 - - - 0x01A485 06:A475: 30 00     .word $0030
- D 1 - - - 0x01A487 06:A477: D0 FF     .word $FFD0
- D 1 - - - 0x01A489 06:A479: 40 00     .word $0040
- D 1 - - - 0x01A48B 06:A47B: C0 FF     .word $FFC0



sub_A47D_пас:
C - - - - - 0x01A48D 06:A47D: A0 00     LDY #$00
bra_A47F_loop:
C - - - - - 0x01A48F 06:A47F: B9 38 00  LDA ram_0038,Y
C - - - - - 0x01A492 06:A482: 99 34 00  STA ram_0034,Y
C - - - - - 0x01A495 06:A485: C8        INY
C - - - - - 0x01A496 06:A486: C0 04     CPY #$04
C - - - - - 0x01A498 06:A488: 90 F5     BCC bra_A47F_loop
C - - - - - 0x01A49A 06:A48A: A0 00     LDY #$00
bra_A48C_loop:
C - - - - - 0x01A49C 06:A48C: 46 35     LSR ram_0035
C - - - - - 0x01A49E 06:A48E: 66 34     ROR ram_0034
C - - - - - 0x01A4A0 06:A490: 46 37     LSR ram_0037
C - - - - - 0x01A4A2 06:A492: 66 36     ROR ram_0036
C - - - - - 0x01A4A4 06:A494: C8        INY
C - - - - - 0x01A4A5 06:A495: C0 04     CPY #$04
C - - - - - 0x01A4A7 06:A497: 90 F3     BCC bra_A48C_loop
C - - - - - 0x01A4A9 06:A499: 18        CLC
C - - - - - 0x01A4AA 06:A49A: A5 34     LDA ram_0034
C - - - - - 0x01A4AC 06:A49C: 65 36     ADC ram_0036
C - - - - - 0x01A4AE 06:A49E: C9 0E     CMP #$0E
C - - - - - 0x01A4B0 06:A4A0: 90 02     BCC bra_A4A4
C - - - - - 0x01A4B2 06:A4A2: A9 0E     LDA #$0E
bra_A4A4:
C - - - - - 0x01A4B4 06:A4A4: 29 0E     AND #$0E
C - - - - - 0x01A4B6 06:A4A6: A8        TAY
C - - - - - 0x01A4B7 06:A4A7: C0 05     CPY #$05
C - - - - - 0x01A4B9 06:A4A9: B0 0E     BCS bra_A4B9
C - - - - - 0x01A4BB 06:A4AB: AD 92 04  LDA ram_мяч_состояние
C - - - - - 0x01A4BE 06:A4AE: 30 09     BMI bra_A4B9
C - - - - - 0x01A4C0 06:A4B0: BD 86 03  LDA ram_pos_Z_lo_player,X
C - - - - - 0x01A4C3 06:A4B3: 30 02     BMI bra_A4B7
C - - - - - 0x01A4C5 06:A4B5: D0 02     BNE bra_A4B9
bra_A4B7:
C - - - - - 0x01A4C7 06:A4B7: A0 10     LDY #$10
bra_A4B9:
C - - - - - 0x01A4C9 06:A4B9: 84 2B     STY ram_002B
C - - - - - 0x01A4CB 06:A4BB: B9 C6 A4  LDA tbl_A4C6_X_Y_скорость,Y
C - - - - - 0x01A4CE 06:A4BE: 85 2C     STA ram_002C
C - - - - - 0x01A4D0 06:A4C0: B9 C7 A4  LDA tbl_A4C6_X_Y_скорость + 1,Y
C - - - - - 0x01A4D3 06:A4C3: 85 2D     STA ram_002D
C - - - - - 0x01A4D5 06:A4C5: 60        RTS

tbl_A4C6_X_Y_скорость:
- - - - - - 0x01A4D6 06:A4C6: 00 01     .word $0100
- D 1 - - - 0x01A4D8 06:A4C8: 00 02     .word $0200
- D 1 - - - 0x01A4DA 06:A4CA: 00 02     .word $0200
- D 1 - - - 0x01A4DC 06:A4CC: 00 03     .word $0300
- D 1 - - - 0x01A4DE 06:A4CE: 00 04     .word $0400
- D 1 - - - 0x01A4E0 06:A4D0: 00 05     .word $0500
- D 1 - - - 0x01A4E2 06:A4D2: 00 06     .word $0600
- D 1 - - - 0x01A4E4 06:A4D4: 00 06     .word $0600
- D 1 - - - 0x01A4E6 06:A4D6: 00 0A     .word $0A00



sub_A4D8:
C - - - - - 0x01A4E8 06:A4D8: A5 2B     LDA ram_002B
C - - - - - 0x01A4EA 06:A4DA: C9 10     CMP #$10
C - - - - - 0x01A4EC 06:A4DC: D0 0B     BNE bra_A4E9
C - - - - - 0x01A4EE 06:A4DE: A9 00     LDA #$00
C - - - - - 0x01A4F0 06:A4E0: 9D 2E 04  STA ram_spd_Z_hi_player,X
C - - - - - 0x01A4F3 06:A4E3: 9D 20 04  STA ram_spd_Z_lo_player,X
C - - - - - 0x01A4F6 06:A4E6: 4C A5 A5  RTS
bra_A4E9:
C - - - - - 0x01A4F9 06:A4E9: BD F6 03  LDA ram_spd_X_hi_player,X
C - - - - - 0x01A4FC 06:A4EC: 30 0A     BMI bra_A4F8
C - - - - - 0x01A4FE 06:A4EE: 85 2F     STA ram_002F
C - - - - - 0x01A500 06:A4F0: BD E8 03  LDA ram_spd_X_lo_player,X
C - - - - - 0x01A503 06:A4F3: 85 2E     STA ram_002E
C - - - - - 0x01A505 06:A4F5: 4C 0B A5  JMP loc_A50B
bra_A4F8:
C - - - - - 0x01A508 06:A4F8: 18        CLC
C - - - - - 0x01A509 06:A4F9: BD E8 03  LDA ram_spd_X_lo_player,X
C - - - - - 0x01A50C 06:A4FC: 49 FF     EOR #$FF
C - - - - - 0x01A50E 06:A4FE: 69 01     ADC #$01
C - - - - - 0x01A510 06:A500: 85 2E     STA ram_002E
C - - - - - 0x01A512 06:A502: BD F6 03  LDA ram_spd_X_hi_player,X
C - - - - - 0x01A515 06:A505: 49 FF     EOR #$FF
C - - - - - 0x01A517 06:A507: 69 00     ADC #$00
C - - - - - 0x01A519 06:A509: 85 2F     STA ram_002F
loc_A50B:
C D 1 - - - 0x01A51B 06:A50B: BD 12 04  LDA ram_spd_Y_hi_player,X
C - - - - - 0x01A51E 06:A50E: 30 0A     BMI bra_A51A
C - - - - - 0x01A520 06:A510: 85 31     STA ram_0031
C - - - - - 0x01A522 06:A512: BD 04 04  LDA ram_spd_Y_lo_player,X
C - - - - - 0x01A525 06:A515: 85 30     STA ram_0030
C - - - - - 0x01A527 06:A517: 4C 2D A5  JMP loc_A52D
bra_A51A:
C - - - - - 0x01A52A 06:A51A: 18        CLC
C - - - - - 0x01A52B 06:A51B: BD 04 04  LDA ram_spd_Y_lo_player,X
C - - - - - 0x01A52E 06:A51E: 49 FF     EOR #$FF
C - - - - - 0x01A530 06:A520: 69 01     ADC #$01
C - - - - - 0x01A532 06:A522: 85 30     STA ram_0030
C - - - - - 0x01A534 06:A524: BD 12 04  LDA ram_spd_Y_hi_player,X
C - - - - - 0x01A537 06:A527: 49 FF     EOR #$FF
C - - - - - 0x01A539 06:A529: 69 00     ADC #$00
C - - - - - 0x01A53B 06:A52B: 85 31     STA ram_0031
loc_A52D:
C D 1 - - - 0x01A53D 06:A52D: A9 00     LDA #$00
C - - - - - 0x01A53F 06:A52F: 85 1C     STA ram_001C
C - - - - - 0x01A541 06:A531: A8        TAY
C - - - - - 0x01A542 06:A532: A5 31     LDA ram_0031
C - - - - - 0x01A544 06:A534: C5 2F     CMP ram_002F
C - - - - - 0x01A546 06:A536: 90 0A     BCC bra_A542
C - - - - - 0x01A548 06:A538: D0 06     BNE bra_A540
C - - - - - 0x01A54A 06:A53A: A5 30     LDA ram_0030
C - - - - - 0x01A54C 06:A53C: C5 2E     CMP ram_002E
C - - - - - 0x01A54E 06:A53E: 90 02     BCC bra_A542
bra_A540:
C - - - - - 0x01A550 06:A540: C8        INY
C - - - - - 0x01A551 06:A541: C8        INY
bra_A542:
C - - - - - 0x01A552 06:A542: B9 2E 00  LDA ram_002E,Y
C - - - - - 0x01A555 06:A545: 85 2C     STA ram_002C
C - - - - - 0x01A557 06:A547: B9 2F 00  LDA ram_002F,Y
C - - - - - 0x01A55A 06:A54A: 85 2D     STA ram_002D
C - - - - - 0x01A55C 06:A54C: B9 38 00  LDA ram_0038,Y
C - - - - - 0x01A55F 06:A54F: 85 1D     STA ram_001D
C - - - - - 0x01A561 06:A551: B9 39 00  LDA ram_0039,Y
C - - - - - 0x01A564 06:A554: 85 1E     STA ram_001E
C - - - - - 0x01A566 06:A556: 20 C1 F4  JSR sub_0x01F4D1
C - - - - - 0x01A569 06:A559: A9 00     LDA #$00
C - - - - - 0x01A56B 06:A55B: 85 2C     STA ram_002C
C - - - - - 0x01A56D 06:A55D: A5 1C     LDA ram_001C
C - - - - - 0x01A56F 06:A55F: 85 2D     STA ram_002D
C - - - - - 0x01A571 06:A561: 46 2D     LSR ram_002D
C - - - - - 0x01A573 06:A563: 66 2C     ROR ram_002C
C - - - - - 0x01A575 06:A565: 46 2D     LSR ram_002D
C - - - - - 0x01A577 06:A567: 66 2C     ROR ram_002C
C - - - - - 0x01A579 06:A569: A5 2C     LDA ram_002C
C - - - - - 0x01A57B 06:A56B: 85 2E     STA ram_002E
C - - - - - 0x01A57D 06:A56D: A5 2D     LDA ram_002D
C - - - - - 0x01A57F 06:A56F: 85 2F     STA ram_002F
C - - - - - 0x01A581 06:A571: 18        CLC
C - - - - - 0x01A582 06:A572: A5 2C     LDA ram_002C
C - - - - - 0x01A584 06:A574: 9D 20 04  STA ram_spd_Z_lo_player,X
C - - - - - 0x01A587 06:A577: A5 2D     LDA ram_002D
C - - - - - 0x01A589 06:A579: CD A6 A5  CMP tbl_A5A6
C - - - - - 0x01A58C 06:A57C: 90 08     BCC bra_A586
C - - - - - 0x01A58E 06:A57E: A9 00     LDA #$00
C - - - - - 0x01A590 06:A580: 9D 20 04  STA ram_spd_Z_lo_player,X
C - - - - - 0x01A593 06:A583: AD A6 A5  LDA tbl_A5A6
bra_A586:
C - - - - - 0x01A596 06:A586: 9D 2E 04  STA ram_spd_Z_hi_player,X
C - - - - - 0x01A599 06:A589: BD 86 03  LDA ram_pos_Z_lo_player,X
C - - - - - 0x01A59C 06:A58C: 4A        LSR
C - - - - - 0x01A59D 06:A58D: 4A        LSR
C - - - - - 0x01A59E 06:A58E: 4A        LSR
C - - - - - 0x01A59F 06:A58F: 4A        LSR
C - - - - - 0x01A5A0 06:A590: 85 1C     STA ram_001C
C - - - - - 0x01A5A2 06:A592: 38        SEC
C - - - - - 0x01A5A3 06:A593: BD 2E 04  LDA ram_spd_Z_hi_player,X
C - - - - - 0x01A5A6 06:A596: E5 1C     SBC ram_001C
C - - - - - 0x01A5A8 06:A598: 9D 2E 04  STA ram_spd_Z_hi_player,X
C - - - - - 0x01A5AB 06:A59B: A9 80     LDA #$80    ; гравитация паса
C - - - - - 0x01A5AD 06:A59D: 9D 3C 04  STA ram_gravity_lo_player,X
C - - - - - 0x01A5B0 06:A5A0: A9 00     LDA #$00
C - - - - - 0x01A5B2 06:A5A2: 9D 4A 04  STA ram_gravity_hi_player,X
C D 1 - - - 0x01A5B5 06:A5A5: 60        RTS

; bzk
tbl_A5A6:
- D 1 - - - 0x01A5B6 06:A5A6: 10        .byte $10   ; 



sub_A5A7_воспроизвести_анимацию:
C - - - - - 0x01A5B7 06:A5A7: AD C2 A5  LDA #< tbl_A5C6_анимации
C - - - - - 0x01A5BA 06:A5AA: 85 30     STA ram_0030
C - - - - - 0x01A5BC 06:A5AC: AD C3 A5  LDA #> tbl_A5C6_анимации
C - - - - - 0x01A5BF 06:A5AF: 85 31     STA ram_0031
C - - - - - 0x01A5C1 06:A5B1: AD C4 A5  LDA #< ofs_8B6C_вычислить_следующий_номер_движения
C - - - - - 0x01A5C4 06:A5B4: 85 32     STA ram_0032
C - - - - - 0x01A5C6 06:A5B6: AD C5 A5  LDA #> ofs_8B6C_вычислить_следующий_номер_движения
C - - - - - 0x01A5C9 06:A5B9: 85 33     STA ram_0033
C - - - - - 0x01A5CB 06:A5BB: BD 59 04  LDA ram_movement_id_player,X
C - - - - - 0x01A5CE 06:A5BE: 20 BD CE  JSR sub_0x01CECD_вычислить_анимацию
C - - - - - 0x01A5D1 06:A5C1: 60        RTS

tbl_A5C6_анимации:
- - - - - - 0x01A5D6 06:A5C6: 80 A6     .word _animation_A680_00    ; 
- D 1 - I - 0x01A5D8 06:A5C8: 81 A6     .word _animation_A681_01    ; обычная стойка/победа/поражение
- D 1 - I - 0x01A5DA 06:A5CA: 8D A7     .word _animation_A78D_02    ; приседает якобы после приземления
- D 1 - I - 0x01A5DC 06:A5CC: 90 A7     .word _animation_A790_03    ; лежачая поза (червячок)
- D 1 - I - 0x01A5DE 06:A5CE: A0 A7     .word _animation_A7A0_04    ; лежачий труп лицом вверх
- D 1 - I - 0x01A5E0 06:A5D0: A3 A7     .word _animation_A7A3_05    ; лежачий труп лицом вниз
- D 1 - I - 0x01A5E2 06:A5D2: 93 A7     .word _animation_A793_06    ; выпученные глаза, слегка подлетает
- D 1 - I - 0x01A5E4 06:A5D4: 48 A8     .word _animation_A848_07    ; замах удара ногой на земле
- D 1 - I - 0x01A5E6 06:A5D6: 6F A8     .word _animation_A86F_08    ; замах паса ногой на земле
- D 1 - I - 0x01A5E8 06:A5D8: 38 A8     .word _animation_A838_09    ; замах удара ногой на земле когда игрок владеет мячом
- D 1 - I - 0x01A5EA 06:A5DA: 56 A8     .word _animation_A856_0A    ; замах паса ногой на земле когда игрок владеет мячом + звук
- D 1 - I - 0x01A5EC 06:A5DC: BE A8     .word _animation_A8BE_0B    ; подброс мяча коленкой на месте, принятие мяча на коленку/голову
- D 1 - I - 0x01A5EE 06:A5DE: F1 A8     .word _animation_A8F1_0C    ; кипер только что словил мяч
- D 1 - I - 0x01A5F0 06:A5E0: C9 A8     .word _animation_A8C9_0D    ; чеканка головой/коленом/пяткой стоя на месте
- D 1 - I - 0x01A5F2 06:A5E2: DD A8     .word _animation_A8DD_0E    ; подброс мяча коленкой на месте
- D 1 - I - 0x01A5F4 06:A5E4: 18 A9     .word _animation_A918_0F    ; 
- D 1 - I - 0x01A5F6 06:A5E6: B1 A8     .word _animation_A8B1_10    ; перекидывание мяча пяткой через голову
- D 1 - I - 0x01A5F8 06:A5E8: 2C A9     .word _animation_A92C_11    ; приказ, синдром давителя
- - - - - - 0x01A5FA 06:A5EA: 00 A9     .word _animation_A900_12    ; 
- - - - - - 0x01A5FC 06:A5EC: 80 A6     .word _animation_A680_13    ; 
- D 1 - I - 0x01A5FE 06:A5EE: A6 A6     .word _animation_A6A6_14    ; прыжок
- - - - - - 0x01A600 06:A5F0: 5D A8     .word _animation_A85D_15    ; замах паса ногой на земле когда игрок владеет мячом + звук
- D 1 - I - 0x01A602 06:A5F2: B4 A6     .word _animation_A6B4_16    ; вбрасывание мяча из аута
- - - - - - 0x01A604 06:A5F4: 80 A6     .word _animation_A680_17    ; 
- - - - - - 0x01A606 06:A5F6: 80 A6     .word _animation_A680_18    ; 
- D 1 - I - 0x01A608 06:A5F8: 0D A9     .word _animation_A90D_19    ; удар локтем
- D 1 - I - 0x01A60A 06:A5FA: D7 A6     .word _animation_A6D7_1A    ; положить мяч на нужную точку
- D 1 - I - 0x01A60C 06:A5FC: E2 A6     .word _animation_A6E2_1B    ; разогнаться после 1A
- D 1 - I - 0x01A60E 06:A5FE: 00 A7     .word _animation_A700_1C    ; подбежать к мячу после 1B, затем будет пас 08
- D 1 - I - 0x01A610 06:A600: F3 A6     .word _animation_A6F3_1D    ; спринт
- - - - - - 0x01A612 06:A602: 80 A6     .word _animation_A680_1E    ; 
- - - - - - 0x01A614 06:A604: 80 A6     .word _animation_A680_1F    ; 
- D 1 - I - 0x01A616 06:A606: 0B A7     .word _animation_A70B_20    ; ходьба
- D 1 - I - 0x01A618 06:A608: 2E A7     .word _animation_A72E_21    ; бег
- D 1 - I - 0x01A61A 06:A60A: 0D A9     .word _animation_A90D_22    ; удар локтем
- D 1 - I - 0x01A61C 06:A60C: 10 A9     .word _animation_A910_23    ; подкат
- D 1 - I - 0x01A61E 06:A60E: 7B A8     .word _animation_A87B_24    ; зачистка с уворотом
- D 1 - I - 0x01A620 06:A610: 5F A7     .word _animation_A75F_25    ; уворот стоя на мяче на 180 градусов
- D 1 - I - 0x01A622 06:A612: E4 A8     .word _animation_A8E4_26    ; чеканка головой/коленом когда бежишь с мячом
- D 1 - I - 0x01A624 06:A614: E5 A9     .word _animation_A9E5_27    ; кручение червячком вверх/вниз
- D 1 - I - 0x01A626 06:A616: DA A9     .word _animation_A9DA_28    ; нижний прыжок кипера (отбить)
- D 1 - I - 0x01A628 06:A618: DA A9     .word _animation_A9DA_29    ; нижний прыжок кипера (словить)
- D 1 - I - 0x01A62A 06:A61A: 49 A9     .word _animation_A949_2A    ; ползание червячком
- - - - - - 0x01A62C 06:A61C: 03 A9     .word _animation_A903_2B    ; 
- - - - - - 0x01A62E 06:A61E: 80 A6     .word _animation_A680_2C    ; 
- D 1 - I - 0x01A630 06:A620: 96 A7     .word _animation_A796_2D    ; выпученные глаза спереди
- D 1 - I - 0x01A632 06:A622: 99 A7     .word _animation_A799_2E    ; выпученные глаза со спины
- D 1 - I - 0x01A634 06:A624: 96 A8     .word _animation_A896_2F    ; зачистка с вращением вокруг своей оси
- D 1 - I - 0x01A636 06:A626: 70 A7     .word _animation_A770_30    ; прыжок
- D 1 - I - 0x01A638 06:A628: D5 A7     .word _animation_A7D5_31    ; прыжок червячком
- D 1 - I - 0x01A63A 06:A62A: BF A7     .word _animation_A7BF_32    ; удар через себя в воздухе без мяча
- D 1 - I - 0x01A63C 06:A62C: 04 A8     .word _animation_A804_33    ; удар ногой в воздухе без мяча
- D 1 - I - 0x01A63E 06:A62E: CE A7     .word _animation_A7CE_34    ; удар головой в воздухе без мяча
- D 1 - I - 0x01A640 06:A630: CE A7     .word _animation_A7CE_35    ; 
- - - - - - 0x01A642 06:A632: CE A7     .word _animation_A7CE_36    ; 
- D 1 - I - 0x01A644 06:A634: EC A7     .word _animation_A7EC_37    ; удар ногой в воздухе владея мячом
- D 1 - I - 0x01A646 06:A636: F9 A7     .word _animation_A7F9_38    ; удар головой в воздухе владея мячом
- D 1 - I - 0x01A648 06:A638: 0D A8     .word _animation_A80D_39    ; пас с воздухе ногой владея мячом
- D 1 - I - 0x01A64A 06:A63A: 18 A8     .word _animation_A818_3A    ; ? прыжок + пас ногой
- D 1 - I - 0x01A64C 06:A63C: 3A A9     .word _animation_A93A_3B    ; ? удар локтем
- D 1 - I - 0x01A64E 06:A63E: 9C A7     .word _animation_A79C_3C    ; выпученные глаза, слегка подлетает
- D 1 - I - 0x01A650 06:A640: 9E A7     .word _animation_A79E_3D    ; выпученные глаза, отлетает вбок
- D 1 - I - 0x01A652 06:A642: 4E A9     .word _animation_A94E_3E    ; верхний прыжок кипера (отбить)
- D 1 - I - 0x01A654 06:A644: 4E A9     .word _animation_A94E_3F    ; верхний прыжок кипера (словить, видимо только для бота)
- D 1 - I - 0x01A656 06:A646: 59 A9     .word _animation_A959_40    ; кипер словил мяч руками над головой
- D 1 - I - 0x01A658 06:A648: 5B A9     .word _animation_A95B_41    ; первый выпад кипера с кулаком
- D 1 - I - 0x01A65A 06:A64A: 41 A9     .word _animation_A941_42    ; 
- D 1 - I - 0x01A65C 06:A64C: AE A9     .word _animation_A9AE_43    ; крутилка с этажерки игрока внизу
- - - - - - 0x01A65E 06:A64E: D1 A9     .word _animation_A9D1_44    ; ? какой-то прыжок
- D 1 - I - 0x01A660 06:A650: 70 A7     .word _animation_A770_45    ; 
- D 1 - I - 0x01A662 06:A652: D9 A7     .word _animation_A7D9_46    ; удар через себя в воздухе владея мячом
- D 1 - I - 0x01A664 06:A654: AE A9     .word _animation_A9AE_47    ; крутилка с этажерки игрока вверху
- D 1 - I - 0x01A666 06:A656: 95 A9     .word _animation_A995_48    ; ветряная крутилка ногой (начало)
- D 1 - I - 0x01A668 06:A658: 98 A9     .word _animation_A998_49    ; ветряная крутилка ногой (процесс)
- D 1 - I - 0x01A66A 06:A65A: A1 A9     .word _animation_A9A1_4A    ; мексиканская крутилка головой (начало)
- D 1 - I - 0x01A66C 06:A65C: A4 A9     .word _animation_A9A4_4B    ; мексиканская крутилка головой (процесс)
- D 1 - I - 0x01A66E 06:A65E: AB A9     .word _animation_A9AB_4C    ; ветряная крутилка солнышком (начало)
- D 1 - I - 0x01A670 06:A660: AE A9     .word _animation_A9AE_4D    ; ветряная крутилка солнышком (процесс)
- D 1 - I - 0x01A672 06:A662: BC A9     .word _animation_A9BC_4E    ; мексиканская крутилка ногами (начало)
- D 1 - I - 0x01A674 06:A664: C6 A9     .word _animation_A9C6_4F    ; мексиканская крутилка ногами (процесс)
- D 1 - I - 0x01A676 06:A666: C1 A9     .word _animation_A9C1_50    ; мексиканская крутилка головой (начало)
- D 1 - I - 0x01A678 06:A668: B7 A9     .word _animation_A9B7_51    ; мексиканская крутилка ногами (процесс)
- D 1 - I - 0x01A67A 06:A66A: 70 A7     .word _animation_A770_52    ; прыжок кипера на месте
- D 1 - I - 0x01A67C 06:A66C: 81 A7     .word _animation_A781_53    ; 
- D 1 - I - 0x01A67E 06:A66E: 79 A9     .word _animation_A979_54    ; второй выпад кипера с кулаком
- - - - - - 0x01A680 06:A670: 0B AA     .word _animation_AA0B_55    ; унесло вихрем
- D 1 - I - 0x01A682 06:A672: 70 A7     .word _animation_A770_56    ; запрыгивание на этажерку
- D 1 - I - 0x01A684 06:A674: AF A7     .word _animation_A7AF_57    ; прыжок высокопрыгающего
- D 1 - I - 0x01A686 06:A676: 35 A9     .word _animation_A935_58    ; коленочник
- D 1 - I - 0x01A688 06:A678: 9C A7     .word _animation_A79C_59    ; выпученные глаза, подлетает высоко вниз
- D 1 - I - 0x01A68A 06:A67A: 9E A7     .word _animation_A79E_5A    ; выпученные глаза, подлетает высоко вверх
- D 1 - I - 0x01A68C 06:A67C: A6 A7     .word _animation_A7A6_5B    ; гвинейская крутилка
- D 1 - I - 0x01A68E 06:A67E: 64 A9     .word _animation_A964_5C    ; вратарская крутилка



con_timer   = $00
con_anim    = $00
con_F0      = $F0   ; тип удара мяча
con_sound   = $F1   ; воспроизвести звук
con_F2      = $F2   ; режим игры
con_FC      = $FC   ; ??? хз, чет не могу найти, но по 0x01CF40 видно что использовалось
con_FD      = $FD   ; развилка исходя из подтипа анимации
con_FE      = $FE   ; повторить цикл анимации
con_FF      = $FF   ; ? бесконечная последняя анимация



_animation_A680_00:
_animation_A680_13:
_animation_A680_17:
_animation_A680_18:
_animation_A680_1E:
_animation_A680_1F:
_animation_A680_2C:
- - - - - - 0x01A690 06:A680: FF        .byte con_FF



_animation_A681_01:
- D 1 - I - 0x01A691 06:A681: FD        .byte con_FD
- D 1 - I - 0x01A692 06:A682: A6 A6     .word off_A6A6_00_стойка_игрока
- D 1 - I - 0x01A694 06:A684: AD A6     .word off_A6AD_01_стойка_кипера
- D 1 - I - 0x01A696 06:A686: F8 A9     .word off_A9F8_02_держит_этажерку
- D 1 - I - 0x01A698 06:A688: A6 A6     .word off_A6A6_03
- D 1 - I - 0x01A69A 06:A68A: A1 A6     .word off_A6A1_04_победа
- D 1 - I - 0x01A69C 06:A68C: 92 A6     .word off_A692_05_поражение_1
- D 1 - I - 0x01A69E 06:A68E: 97 A6     .word off_A697_06_поражение_2
- D 1 - I - 0x01A6A0 06:A690: 9C A6     .word off_A69C_07_поражение_3
off_A692_05_поражение_1:
- D 1 - I - 0x01A6A2 06:A692: 03        .byte con_timer + $03
- D 1 - I - 0x01A6A3 06:A693: 43        .byte con_anim + $43
- D 1 - I - 0x01A6A4 06:A694: 03        .byte con_timer + $03
- D 1 - I - 0x01A6A5 06:A695: 45        .byte con_anim + $45
- D 1 - I - 0x01A6A6 06:A696: FE        .byte con_FE
off_A697_06_поражение_2:
- D 1 - I - 0x01A6A7 06:A697: 03        .byte con_timer + $03
- D 1 - I - 0x01A6A8 06:A698: 46        .byte con_anim + $46
- D 1 - I - 0x01A6A9 06:A699: 03        .byte con_timer + $03
- D 1 - I - 0x01A6AA 06:A69A: 47        .byte con_anim + $47
- D 1 - I - 0x01A6AB 06:A69B: FE        .byte con_FE 
off_A69C_07_поражение_3:
- D 1 - I - 0x01A6AC 06:A69C: 03        .byte con_timer + $03
- D 1 - I - 0x01A6AD 06:A69D: 49        .byte con_anim + $49
- D 1 - I - 0x01A6AE 06:A69E: 03        .byte con_timer + $03
- D 1 - I - 0x01A6AF 06:A69F: 4A        .byte con_anim + $4A
- D 1 - I - 0x01A6B0 06:A6A0: FE        .byte con_FE 
off_A6A1_04_победа:
- D 1 - I - 0x01A6B1 06:A6A1: 03        .byte con_timer + $03
- D 1 - I - 0x01A6B2 06:A6A2: 41        .byte con_anim + $41
- D 1 - I - 0x01A6B3 06:A6A3: 03        .byte con_timer + $03
- D 1 - I - 0x01A6B4 06:A6A4: 48        .byte con_anim + $48
- D 1 - I - 0x01A6B5 06:A6A5: FE        .byte con_FE 



_animation_A6A6_14:
off_A6A6_00_стойка_игрока:
off_A6A6_03:
- D 1 - I - 0x01A6B6 06:A6A6: 00        .byte con_timer + $00
- D 1 - I - 0x01A6B7 06:A6A7: 00        .byte con_anim + $00
- D 1 - I - 0x01A6B8 06:A6A8: 00        .byte con_timer + $00
- D 1 - I - 0x01A6B9 06:A6A9: 00        .byte con_anim + $00
; bzk мусор
- - - - - - 0x01A6BA 06:A6AA: 00        .byte con_timer + $00
- - - - - - 0x01A6BB 06:A6AB: 00        .byte con_anim + $00
- - - - - - 0x01A6BC 06:A6AC: FE        .byte con_FE 
off_A6AD_01_стойка_кипера:
- D 1 - I - 0x01A6BD 06:A6AD: 00        .byte con_timer + $00
- D 1 - I - 0x01A6BE 06:A6AE: 10        .byte con_anim + $10
- - - - - - 0x01A6BF 06:A6AF: 00        .byte con_timer + $00
- - - - - - 0x01A6C0 06:A6B0: 10        .byte con_anim + $10
; bzk мусор
- - - - - - 0x01A6C1 06:A6B1: 00        .byte con_timer + $00
- - - - - - 0x01A6C2 06:A6B2: 10        .byte con_anim + $10
- - - - - - 0x01A6C3 06:A6B3: FE        .byte con_FE 



_animation_A6B4_16:
- D 1 - I - 0x01A6C4 06:A6B4: FD        .byte con_FD
- - - - - - 0x01A6C5 06:A6B5: B9 A6     .word off_A6B9_00
- D 1 - I - 0x01A6C7 06:A6B7: C8 A6     .word off_A6C8_01
off_A6B9_00:
- - - - - - 0x01A6C9 06:A6B9: 08        .byte con_timer + $08
- - - - - - 0x01A6CA 06:A6BA: 00        .byte con_anim + $00
- - - - - - 0x01A6CB 06:A6BB: F0        .byte con_F0, $02
- - - - - - 0x01A6CD 06:A6BD: 10        .byte con_timer + $10
- - - - - - 0x01A6CE 06:A6BE: 17        .byte con_anim + $17
- - - - - - 0x01A6CF 06:A6BF: F0        .byte con_F0, $04
- - - - - - 0x01A6D1 06:A6C1: F1        .byte con_sound, $20
- - - - - - 0x01A6D3 06:A6C3: F2        .byte con_F2, $00
- - - - - - 0x01A6D5 06:A6C5: 08        .byte con_timer + $08
- - - - - - 0x01A6D6 06:A6C6: 1D        .byte con_anim + $1D
- - - - - - 0x01A6D7 06:A6C7: FF        .byte con_FF
off_A6C8_01:
- D 1 - I - 0x01A6D8 06:A6C8: 08        .byte con_timer + $08
- D 1 - I - 0x01A6D9 06:A6C9: 00        .byte con_anim + $00
- D 1 - I - 0x01A6DA 06:A6CA: F0        .byte con_F0, $02
- D 1 - I - 0x01A6DC 06:A6CC: 10        .byte con_timer + $10
- D 1 - I - 0x01A6DD 06:A6CD: 14        .byte con_anim + $14
- D 1 - I - 0x01A6DE 06:A6CE: F0        .byte con_F0, $04
- D 1 - I - 0x01A6E0 06:A6D0: F1        .byte con_sound, $20
- D 1 - I - 0x01A6E2 06:A6D2: F2        .byte con_F2, $00
- D 1 - I - 0x01A6E4 06:A6D4: 08        .byte con_timer + $08
- D 1 - I - 0x01A6E5 06:A6D5: 15        .byte con_anim + $15
- D 1 - I - 0x01A6E6 06:A6D6: FF        .byte con_FF



_animation_A6D7_1A:
- D 1 - I - 0x01A6E7 06:A6D7: 02        .byte con_timer + $02
- D 1 - I - 0x01A6E8 06:A6D8: 00        .byte con_anim + $00
- D 1 - I - 0x01A6E9 06:A6D9: F0        .byte con_F0, $03
- D 1 - I - 0x01A6EB 06:A6DB: 10        .byte con_timer + $10
- D 1 - I - 0x01A6EC 06:A6DC: 08        .byte con_anim + $08
- D 1 - I - 0x01A6ED 06:A6DD: F0        .byte con_F0, $01
- D 1 - I - 0x01A6EF 06:A6DF: 02        .byte con_timer + $02
- D 1 - I - 0x01A6F0 06:A6E0: 08        .byte con_anim + $08
- D 1 - I - 0x01A6F1 06:A6E1: FF        .byte con_FF



_animation_A6E2_1B:
- D 1 - I - 0x01A6F2 06:A6E2: 02        .byte con_timer + $02
- D 1 - I - 0x01A6F3 06:A6E3: 1E        .byte con_anim + $1E
- D 1 - I - 0x01A6F4 06:A6E4: 02        .byte con_timer + $02
- D 1 - I - 0x01A6F5 06:A6E5: 00        .byte con_anim + $00
- D 1 - I - 0x01A6F6 06:A6E6: 02        .byte con_timer + $02
- D 1 - I - 0x01A6F7 06:A6E7: 1F        .byte con_anim + $1F
- D 1 - I - 0x01A6F8 06:A6E8: 02        .byte con_timer + $02
- D 1 - I - 0x01A6F9 06:A6E9: 00        .byte con_anim + $00
- D 1 - I - 0x01A6FA 06:A6EA: 02        .byte con_timer + $02
- D 1 - I - 0x01A6FB 06:A6EB: 1E        .byte con_anim + $1E
- D 1 - I - 0x01A6FC 06:A6EC: 02        .byte con_timer + $02
- D 1 - I - 0x01A6FD 06:A6ED: 00        .byte con_anim + $00
- D 1 - I - 0x01A6FE 06:A6EE: 02        .byte con_timer + $02
- D 1 - I - 0x01A6FF 06:A6EF: 1F        .byte con_anim + $1F
- D 1 - I - 0x01A700 06:A6F0: 02        .byte con_timer + $02
- D 1 - I - 0x01A701 06:A6F1: 00        .byte con_anim + $00
- D 1 - I - 0x01A702 06:A6F2: FF        .byte con_FF



_animation_A6F3_1D:
- D 1 - I - 0x01A703 06:A6F3: 01        .byte con_timer + $01
- D 1 - I - 0x01A704 06:A6F4: 50        .byte con_anim + $50
- D 1 - I - 0x01A705 06:A6F5: 01        .byte con_timer + $01
- D 1 - I - 0x01A706 06:A6F6: 51        .byte con_anim + $51
- D 1 - I - 0x01A707 06:A6F7: 01        .byte con_timer + $01
- D 1 - I - 0x01A708 06:A6F8: 50        .byte con_anim + $50
- D 1 - I - 0x01A709 06:A6F9: 01        .byte con_timer + $01
- D 1 - I - 0x01A70A 06:A6FA: 51        .byte con_anim + $51
- D 1 - I - 0x01A70B 06:A6FB: 01        .byte con_timer + $01
- D 1 - I - 0x01A70C 06:A6FC: 50        .byte con_anim + $50
- D 1 - I - 0x01A70D 06:A6FD: 01        .byte con_timer + $01
- D 1 - I - 0x01A70E 06:A6FE: 51        .byte con_anim + $51
- D 1 - I - 0x01A70F 06:A6FF: FF        .byte con_FF



_animation_A700_1C:
- D 1 - I - 0x01A710 06:A700: 02        .byte con_timer + $02
- D 1 - I - 0x01A711 06:A701: 01        .byte con_anim + $01
- D 1 - I - 0x01A712 06:A702: 02        .byte con_timer + $02
- D 1 - I - 0x01A713 06:A703: 00        .byte con_anim + $00
- D 1 - I - 0x01A714 06:A704: 02        .byte con_timer + $02
- D 1 - I - 0x01A715 06:A705: 01        .byte con_anim + $01
- D 1 - I - 0x01A716 06:A706: 02        .byte con_timer + $02
- D 1 - I - 0x01A717 06:A707: 00        .byte con_anim + $00
- D 1 - I - 0x01A718 06:A708: F2        .byte con_F2, $00
- D 1 - I - 0x01A71A 06:A70A: FF        .byte con_FF



_animation_A70B_20:
- D 1 - I - 0x01A71B 06:A70B: FD        .byte con_FD
- D 1 - I - 0x01A71C 06:A70C: 1C A7     .word off_A71C_02
- D 1 - I - 0x01A71E 06:A70E: 25 A7     .word off_A725_03
- D 1 - I - 0x01A720 06:A710: FA A9     .word off_A9FA_04
- D 1 - I - 0x01A722 06:A712: 1C A7     .word off_A71C_05
- D 1 - I - 0x01A724 06:A714: 3F A7     .word off_A73F_06
- D 1 - I - 0x01A726 06:A716: 48 A7     .word off_A748_07
- D 1 - I - 0x01A728 06:A718: 48 A7     .word off_A748_08
- D 1 - I - 0x01A72A 06:A71A: 48 A7     .word off_A748_09
off_A71C_02:
off_A71C_05:
- D 1 - I - 0x01A72C 06:A71C: 02        .byte con_timer + $02
- D 1 - I - 0x01A72D 06:A71D: 1E        .byte con_anim + $1E
- D 1 - I - 0x01A72E 06:A71E: 02        .byte con_timer + $02
- D 1 - I - 0x01A72F 06:A71F: 00        .byte con_anim + $00
- D 1 - I - 0x01A730 06:A720: 02        .byte con_timer + $02
- D 1 - I - 0x01A731 06:A721: 1F        .byte con_anim + $1F
- D 1 - I - 0x01A732 06:A722: 02        .byte con_timer + $02
- D 1 - I - 0x01A733 06:A723: 00        .byte con_anim + $00
- D 1 - I - 0x01A734 06:A724: FE        .byte con_FE 
off_A725_03:
- D 1 - I - 0x01A735 06:A725: 03        .byte con_timer + $03
- D 1 - I - 0x01A736 06:A726: 3E        .byte con_anim + $3E
- D 1 - I - 0x01A737 06:A727: 03        .byte con_timer + $03
- D 1 - I - 0x01A738 06:A728: 10        .byte con_anim + $10
- D 1 - I - 0x01A739 06:A729: 03        .byte con_timer + $03
- D 1 - I - 0x01A73A 06:A72A: 3F        .byte con_anim + $3F
- D 1 - I - 0x01A73B 06:A72B: 03        .byte con_timer + $03
- D 1 - I - 0x01A73C 06:A72C: 10        .byte con_anim + $10
- D 1 - I - 0x01A73D 06:A72D: FE        .byte con_FE 



_animation_A72E_21:
- D 1 - I - 0x01A73E 06:A72E: FD        .byte con_FD
- D 1 - I - 0x01A73F 06:A72F: 51 A7     .word off_A751_00
- D 1 - I - 0x01A741 06:A731: 51 A7     .word off_A751_01
- D 1 - I - 0x01A743 06:A733: 03 AA     .word off_AA03_02
- D 1 - I - 0x01A745 06:A735: 56 A7     .word off_A756_03
- D 1 - I - 0x01A747 06:A737: 3F A7     .word off_A73F_04
- D 1 - I - 0x01A749 06:A739: 48 A7     .word off_A748_05
- D 1 - I - 0x01A74B 06:A73B: 48 A7     .word off_A748_06
- D 1 - I - 0x01A74D 06:A73D: 48 A7     .word off_A748_07
off_A73F_06:
off_A73F_04:
- D 1 - I - 0x01A74F 06:A73F: 02        .byte con_timer + $02
- D 1 - I - 0x01A750 06:A740: 42        .byte con_anim + $42
- D 1 - I - 0x01A751 06:A741: 02        .byte con_timer + $02
- D 1 - I - 0x01A752 06:A742: 41        .byte con_anim + $41
- D 1 - I - 0x01A753 06:A743: 02        .byte con_timer + $02
- D 1 - I - 0x01A754 06:A744: 42        .byte con_anim + $42
- D 1 - I - 0x01A755 06:A745: 02        .byte con_timer + $02
- D 1 - I - 0x01A756 06:A746: 41        .byte con_anim + $41
- D 1 - I - 0x01A757 06:A747: FE        .byte con_FE 
off_A748_07:
off_A748_08:
off_A748_09:
off_A748_05:
off_A748_06:
- D 1 - I - 0x01A758 06:A748: 02        .byte con_timer + $02
- D 1 - I - 0x01A759 06:A749: 44        .byte con_anim + $44
- D 1 - I - 0x01A75A 06:A74A: 02        .byte con_timer + $02
- D 1 - I - 0x01A75B 06:A74B: 43        .byte con_anim + $43
- D 1 - I - 0x01A75C 06:A74C: 02        .byte con_timer + $02
- D 1 - I - 0x01A75D 06:A74D: 44        .byte con_anim + $44
- D 1 - I - 0x01A75E 06:A74E: 02        .byte con_timer + $02
- D 1 - I - 0x01A75F 06:A74F: 43        .byte con_anim + $43
- D 1 - I - 0x01A760 06:A750: FE        .byte con_FE 
off_A751_00:
off_A751_01:
- D 1 - I - 0x01A761 06:A751: 02        .byte con_timer + $02
- D 1 - I - 0x01A762 06:A752: 01        .byte con_anim + $01
- D 1 - I - 0x01A763 06:A753: 02        .byte con_timer + $02
- D 1 - I - 0x01A764 06:A754: 00        .byte con_anim + $00
- D 1 - I - 0x01A765 06:A755: FE        .byte con_FE 
off_A756_03:
- D 1 - I - 0x01A766 06:A756: 01        .byte con_timer + $01
- D 1 - I - 0x01A767 06:A757: 1E        .byte con_anim + $1E
- D 1 - I - 0x01A768 06:A758: 01        .byte con_timer + $01
- D 1 - I - 0x01A769 06:A759: 00        .byte con_anim + $00
- D 1 - I - 0x01A76A 06:A75A: 01        .byte con_timer + $01
- D 1 - I - 0x01A76B 06:A75B: 1F        .byte con_anim + $1F
- D 1 - I - 0x01A76C 06:A75C: 01        .byte con_timer + $01
- D 1 - I - 0x01A76D 06:A75D: 00        .byte con_anim + $00
- D 1 - I - 0x01A76E 06:A75E: FE        .byte con_FE 



_animation_A75F_25:
- D 1 - I - 0x01A76F 06:A75F: 01        .byte con_timer + $01
- D 1 - I - 0x01A770 06:A760: 9E        .byte con_anim + $9E
- D 1 - I - 0x01A771 06:A761: 01        .byte con_timer + $01
- D 1 - I - 0x01A772 06:A762: 80        .byte con_anim + $80
- D 1 - I - 0x01A773 06:A763: 01        .byte con_timer + $01
- D 1 - I - 0x01A774 06:A764: 9F        .byte con_anim + $9F
- D 1 - I - 0x01A775 06:A765: 01        .byte con_timer + $01
- D 1 - I - 0x01A776 06:A766: 00        .byte con_anim + $00
- D 1 - I - 0x01A777 06:A767: 01        .byte con_timer + $01
- D 1 - I - 0x01A778 06:A768: 1E        .byte con_anim + $1E
- D 1 - I - 0x01A779 06:A769: 01        .byte con_timer + $01
- D 1 - I - 0x01A77A 06:A76A: 00        .byte con_anim + $00
- D 1 - I - 0x01A77B 06:A76B: 01        .byte con_timer + $01
- D 1 - I - 0x01A77C 06:A76C: 1F        .byte con_anim + $1F
- D 1 - I - 0x01A77D 06:A76D: 01        .byte con_timer + $01
- D 1 - I - 0x01A77E 06:A76E: 00        .byte con_anim + $00
- D 1 - I - 0x01A77F 06:A76F: FF        .byte con_FF



_animation_A770_30:
_animation_A770_45:
_animation_A770_52:
_animation_A770_56:
- D 1 - I - 0x01A780 06:A770: FD        .byte con_FD
- D 1 - I - 0x01A781 06:A771: 81 A7     .word off_A781_00
- D 1 - I - 0x01A783 06:A773: 81 A7     .word off_A781_01
- D 1 - I - 0x01A785 06:A775: 81 A7     .word off_A781_02
- D 1 - I - 0x01A787 06:A777: 81 A7     .word off_A781_03
- D 1 - I - 0x01A789 06:A779: 83 A7     .word off_A783_04
- D 1 - I - 0x01A78B 06:A77B: 88 A7     .word off_A788_05
- D 1 - I - 0x01A78D 06:A77D: 88 A7     .word off_A788_06
- D 1 - I - 0x01A78F 06:A77F: 88 A7     .word off_A788_07



_animation_A781_53:
off_A781_00:
off_A781_01:
off_A781_02:
off_A781_03:
- D 1 - I - 0x01A791 06:A781: 00        .byte con_timer + $00
- D 1 - I - 0x01A792 06:A782: 02        .byte con_anim + $02
off_A783_04:
- D 1 - I - 0x01A793 06:A783: 03        .byte con_timer + $03
- D 1 - I - 0x01A794 06:A784: 4B        .byte con_anim + $4B
- D 1 - I - 0x01A795 06:A785: 03        .byte con_timer + $03
- D 1 - I - 0x01A796 06:A786: 4C        .byte con_anim + $4C
- D 1 - I - 0x01A797 06:A787: FE        .byte con_FE 
off_A788_05:
off_A788_06:
off_A788_07:
- D 1 - I - 0x01A798 06:A788: 03        .byte con_timer + $03
- D 1 - I - 0x01A799 06:A789: 4D        .byte con_anim + $4D
- D 1 - I - 0x01A79A 06:A78A: 03        .byte con_timer + $03
- D 1 - I - 0x01A79B 06:A78B: 4E        .byte con_anim + $4E
- D 1 - I - 0x01A79C 06:A78C: FE        .byte con_FE 



_animation_A78D_02:
- D 1 - I - 0x01A79D 06:A78D: 04        .byte con_timer + $04
- D 1 - I - 0x01A79E 06:A78E: 08        .byte con_anim + $08
- D 1 - I - 0x01A79F 06:A78F: FF        .byte con_FF



_animation_A790_03:
- D 1 - I - 0x01A7A0 06:A790: 06        .byte con_timer + $06
- D 1 - I - 0x01A7A1 06:A791: 0C        .byte con_anim + $0C
- D 1 - I - 0x01A7A2 06:A792: FF        .byte con_FF



_animation_A793_06:
- D 1 - I - 0x01A7A3 06:A793: 20        .byte con_timer + $20
- D 1 - I - 0x01A7A4 06:A794: 0F        .byte con_anim + $0F
- D 1 - I - 0x01A7A5 06:A795: FF        .byte con_FF



_animation_A796_2D:
- D 1 - I - 0x01A7A6 06:A796: 20        .byte con_timer + $20
- D 1 - I - 0x01A7A7 06:A797: 32        .byte con_anim + $32
- D 1 - I - 0x01A7A8 06:A798: FF        .byte con_FF



_animation_A799_2E:
- D 1 - I - 0x01A7A9 06:A799: 20        .byte con_timer + $20
- D 1 - I - 0x01A7AA 06:A79A: 26        .byte con_anim + $26
- D 1 - I - 0x01A7AB 06:A79B: FF        .byte con_FF



_animation_A79C_3C:
_animation_A79C_59:
- D 1 - I - 0x01A7AC 06:A79C: 00        .byte con_timer + $00
- D 1 - I - 0x01A7AD 06:A79D: 0F        .byte con_anim + $0F



_animation_A79E_3D:
_animation_A79E_5A:
- D 1 - I - 0x01A7AE 06:A79E: 00        .byte con_timer + $00
- D 1 - I - 0x01A7AF 06:A79F: 26        .byte con_anim + $26



_animation_A7A0_04:
- D 1 - I - 0x01A7B0 06:A7A0: 18        .byte con_timer + $18
- D 1 - I - 0x01A7B1 06:A7A1: 07        .byte con_anim + $07
- D 1 - I - 0x01A7B2 06:A7A2: FF        .byte con_FF



_animation_A7A3_05:
- D 1 - I - 0x01A7B3 06:A7A3: 18        .byte con_timer + $18
- D 1 - I - 0x01A7B4 06:A7A4: 23        .byte con_anim + $23
- D 1 - I - 0x01A7B5 06:A7A5: FF        .byte con_FF



_animation_A7A6_5B:
- D 1 - I - 0x01A7B6 06:A7A6: 01        .byte con_timer + $01
- D 1 - I - 0x01A7B7 06:A7A7: 00        .byte con_anim + $00
- D 1 - I - 0x01A7B8 06:A7A8: 01        .byte con_timer + $01
- D 1 - I - 0x01A7B9 06:A7A9: 80        .byte con_anim + $80
- D 1 - I - 0x01A7BA 06:A7AA: 01        .byte con_timer + $01
- D 1 - I - 0x01A7BB 06:A7AB: D2        .byte con_anim + $D2
- D 1 - I - 0x01A7BC 06:A7AC: 01        .byte con_timer + $01
- D 1 - I - 0x01A7BD 06:A7AD: 52        .byte con_anim + $52
- D 1 - I - 0x01A7BE 06:A7AE: FE        .byte con_FE 



_animation_A7AF_57:
- D 1 - I - 0x01A7BF 06:A7AF: 02        .byte con_timer + $02
- D 1 - I - 0x01A7C0 06:A7B0: 02        .byte con_anim + $02
- D 1 - I - 0x01A7C1 06:A7B1: 01        .byte con_timer + $01
- D 1 - I - 0x01A7C2 06:A7B2: 02        .byte con_anim + $02
- D 1 - I - 0x01A7C3 06:A7B3: 02        .byte con_timer + $02
- D 1 - I - 0x01A7C4 06:A7B4: 0D        .byte con_anim + $0D
- D 1 - I - 0x01A7C5 06:A7B5: 01        .byte con_timer + $01
- D 1 - I - 0x01A7C6 06:A7B6: 1C        .byte con_anim + $1C
- D 1 - I - 0x01A7C7 06:A7B7: 01        .byte con_timer + $01
- D 1 - I - 0x01A7C8 06:A7B8: 1A        .byte con_anim + $1A
- D 1 - I - 0x01A7C9 06:A7B9: 01        .byte con_timer + $01
- D 1 - I - 0x01A7CA 06:A7BA: 04        .byte con_anim + $04
- D 1 - I - 0x01A7CB 06:A7BB: 02        .byte con_timer + $02
- D 1 - I - 0x01A7CC 06:A7BC: 03        .byte con_anim + $03
- D 1 - I - 0x01A7CD 06:A7BD: 00        .byte con_timer + $00
- D 1 - I - 0x01A7CE 06:A7BE: 02        .byte con_anim + $02



_animation_A7BF_32:
- D 1 - I - 0x01A7CF 06:A7BF: 02        .byte con_timer + $02
- D 1 - I - 0x01A7D0 06:A7C0: 82        .byte con_anim + $82
- D 1 - I - 0x01A7D1 06:A7C1: 04        .byte con_timer + $04
- D 1 - I - 0x01A7D2 06:A7C2: 83        .byte con_anim + $83
- D 1 - I - 0x01A7D3 06:A7C3: 01        .byte con_timer + $01
- D 1 - I - 0x01A7D4 06:A7C4: 84        .byte con_anim + $84
- D 1 - I - 0x01A7D5 06:A7C5: 02        .byte con_timer + $02
- D 1 - I - 0x01A7D6 06:A7C6: 9A        .byte con_anim + $9A
- D 1 - I - 0x01A7D7 06:A7C7: 02        .byte con_timer + $02
- D 1 - I - 0x01A7D8 06:A7C8: 9B        .byte con_anim + $9B
- D 1 - I - 0x01A7D9 06:A7C9: 01        .byte con_timer + $01
- D 1 - I - 0x01A7DA 06:A7CA: 9C        .byte con_anim + $9C
- D 1 - I - 0x01A7DB 06:A7CB: 02        .byte con_timer + $02
- D 1 - I - 0x01A7DC 06:A7CC: 82        .byte con_anim + $82
- D 1 - I - 0x01A7DD 06:A7CD: FF        .byte con_FF



_animation_A7CE_34:
_animation_A7CE_35:
_animation_A7CE_36:
- D 1 - I - 0x01A7DE 06:A7CE: 01        .byte con_timer + $01
- D 1 - I - 0x01A7DF 06:A7CF: 02        .byte con_anim + $02
- D 1 - I - 0x01A7E0 06:A7D0: 07        .byte con_timer + $07
- D 1 - I - 0x01A7E1 06:A7D1: 03        .byte con_anim + $03
- D 1 - I - 0x01A7E2 06:A7D2: 03        .byte con_timer + $03
- D 1 - I - 0x01A7E3 06:A7D3: 0D        .byte con_anim + $0D
- D 1 - I - 0x01A7E4 06:A7D4: FF        .byte con_FF



_animation_A7D5_31:
- D 1 - I - 0x01A7E5 06:A7D5: 06        .byte con_timer + $06
- D 1 - I - 0x01A7E6 06:A7D6: 0E        .byte con_anim + $0E
- D 1 - I - 0x01A7E7 06:A7D7: 00        .byte con_timer + $00
- D 1 - I - 0x01A7E8 06:A7D8: 0C        .byte con_anim + $0C



_animation_A7D9_46:
- D 1 - I - 0x01A7E9 06:A7D9: F0        .byte con_F0, $14
- D 1 - I - 0x01A7EB 06:A7DB: 01        .byte con_timer + $01
- D 1 - I - 0x01A7EC 06:A7DC: 82        .byte con_anim + $82
- D 1 - I - 0x01A7ED 06:A7DD: 04        .byte con_timer + $04
- D 1 - I - 0x01A7EE 06:A7DE: 83        .byte con_anim + $83
- D 1 - I - 0x01A7EF 06:A7DF: 01        .byte con_timer + $01
- D 1 - I - 0x01A7F0 06:A7E0: 84        .byte con_anim + $84
- D 1 - I - 0x01A7F1 06:A7E1: 02        .byte con_timer + $02
- D 1 - I - 0x01A7F2 06:A7E2: 9A        .byte con_anim + $9A
- D 1 - I - 0x01A7F3 06:A7E3: F0        .byte con_F0, $05
- D 1 - I - 0x01A7F5 06:A7E5: 02        .byte con_timer + $02
- D 1 - I - 0x01A7F6 06:A7E6: 9B        .byte con_anim + $9B
- D 1 - I - 0x01A7F7 06:A7E7: 01        .byte con_timer + $01
- D 1 - I - 0x01A7F8 06:A7E8: 9C        .byte con_anim + $9C
- D 1 - I - 0x01A7F9 06:A7E9: 02        .byte con_timer + $02
- D 1 - I - 0x01A7FA 06:A7EA: 82        .byte con_anim + $82
- D 1 - I - 0x01A7FB 06:A7EB: FF        .byte con_FF



_animation_A7EC_37:
- D 1 - I - 0x01A7FC 06:A7EC: F0        .byte con_F0, $14
- D 1 - I - 0x01A7FE 06:A7EE: 04        .byte con_timer + $04
- D 1 - I - 0x01A7FF 06:A7EF: 02        .byte con_anim + $02
- D 1 - I - 0x01A800 06:A7F0: 03        .byte con_timer + $03
- D 1 - I - 0x01A801 06:A7F1: 0A        .byte con_anim + $0A
- D 1 - I - 0x01A802 06:A7F2: 01        .byte con_timer + $01
- D 1 - I - 0x01A803 06:A7F3: 21        .byte con_anim + $21
- D 1 - I - 0x01A804 06:A7F4: F0        .byte con_F0, $05
- D 1 - I - 0x01A806 06:A7F6: 06        .byte con_timer + $06
- D 1 - I - 0x01A807 06:A7F7: 0B        .byte con_anim + $0B
- D 1 - I - 0x01A808 06:A7F8: FF        .byte con_FF



_animation_A7F9_38:
- D 1 - I - 0x01A809 06:A7F9: F0        .byte con_F0, $14
- D 1 - I - 0x01A80B 06:A7FB: 04        .byte con_timer + $04
- D 1 - I - 0x01A80C 06:A7FC: 02        .byte con_anim + $02
- D 1 - I - 0x01A80D 06:A7FD: 04        .byte con_timer + $04
- D 1 - I - 0x01A80E 06:A7FE: 03        .byte con_anim + $03
- D 1 - I - 0x01A80F 06:A7FF: F0        .byte con_F0, $05
- D 1 - I - 0x01A811 06:A801: 02        .byte con_timer + $02
- D 1 - I - 0x01A812 06:A802: 0D        .byte con_anim + $0D
- D 1 - I - 0x01A813 06:A803: FF        .byte con_FF



_animation_A804_33:
- D 1 - I - 0x01A814 06:A804: 02        .byte con_timer + $02
- D 1 - I - 0x01A815 06:A805: 02        .byte con_anim + $02
- D 1 - I - 0x01A816 06:A806: 03        .byte con_timer + $03
- D 1 - I - 0x01A817 06:A807: 0A        .byte con_anim + $0A
- D 1 - I - 0x01A818 06:A808: 01        .byte con_timer + $01
- D 1 - I - 0x01A819 06:A809: 21        .byte con_anim + $21
- D 1 - I - 0x01A81A 06:A80A: 06        .byte con_timer + $06
- D 1 - I - 0x01A81B 06:A80B: 16        .byte con_anim + $16
- D 1 - I - 0x01A81C 06:A80C: FF        .byte con_FF



_animation_A80D_39:
- D 1 - I - 0x01A81D 06:A80D: F0        .byte con_F0, $03
- D 1 - I - 0x01A81F 06:A80F: 03        .byte con_timer + $03
- D 1 - I - 0x01A820 06:A810: 02        .byte con_anim + $02
- D 1 - I - 0x01A821 06:A811: F0        .byte con_F0, $04
- D 1 - I - 0x01A823 06:A813: F1        .byte con_sound, $20
- D 1 - I - 0x01A825 06:A815: 07        .byte con_timer + $07
- D 1 - I - 0x01A826 06:A816: 06        .byte con_anim + $06
- D 1 - I - 0x01A827 06:A817: FF        .byte con_FF



_animation_A818_3A:
- D 1 - I - 0x01A828 06:A818: 03        .byte con_timer + $03
- D 1 - I - 0x01A829 06:A819: 02        .byte con_anim + $02
- D 1 - I - 0x01A82A 06:A81A: 05        .byte con_timer + $05
- D 1 - I - 0x01A82B 06:A81B: 03        .byte con_anim + $03
- D 1 - I - 0x01A82C 06:A81C: F0        .byte con_F0, $04
- D 1 - I - 0x01A82E 06:A81E: F1        .byte con_sound, $22
- D 1 - I - 0x01A830 06:A820: 06        .byte con_timer + $06
- D 1 - I - 0x01A831 06:A821: 0D        .byte con_anim + $0D
- D 1 - I - 0x01A832 06:A822: FF        .byte con_FF
off_A823_00:
- D 1 - I - 0x01A833 06:A823: 03        .byte con_timer + $03
- D 1 - I - 0x01A834 06:A824: 03        .byte con_anim + $03
- D 1 - I - 0x01A835 06:A825: 05        .byte con_timer + $05
- D 1 - I - 0x01A836 06:A826: 0D        .byte con_anim + $0D
- D 1 - I - 0x01A837 06:A827: FF        .byte con_FF
off_A828_00:
- D 1 - I - 0x01A838 06:A828: 01        .byte con_timer + $01
- D 1 - I - 0x01A839 06:A829: 03        .byte con_anim + $03
- D 1 - I - 0x01A83A 06:A82A: F0        .byte con_F0, $05
- D 1 - I - 0x01A83C 06:A82C: 05        .byte con_timer + $05
- D 1 - I - 0x01A83D 06:A82D: 0D        .byte con_anim + $0D
- D 1 - I - 0x01A83E 06:A82E: FF        .byte con_FF
off_A82F_00:
- D 1 - I - 0x01A83F 06:A82F: 03        .byte con_timer + $03
- D 1 - I - 0x01A840 06:A830: 03        .byte con_anim + $03
- D 1 - I - 0x01A841 06:A831: F0        .byte con_F0, $04
- D 1 - I - 0x01A843 06:A833: F1        .byte con_sound, $22
- D 1 - I - 0x01A845 06:A835: 05        .byte con_timer + $05
- D 1 - I - 0x01A846 06:A836: 0D        .byte con_anim + $0D
- D 1 - I - 0x01A847 06:A837: FF        .byte con_FF



_animation_A838_09:
- D 1 - I - 0x01A848 06:A838: FD        .byte con_FD
- D 1 - I - 0x01A849 06:A839: 28 A8     .word off_A828_00
- D 1 - I - 0x01A84B 06:A83B: 3F A8     .word off_A83F_01
- D 1 - I - 0x01A84D 06:A83D: 3F A8     .word off_A83F_02
off_A83F_01:
off_A83F_02:
- D 1 - I - 0x01A84F 06:A83F: 04        .byte con_timer + $04
- D 1 - I - 0x01A850 06:A840: 0A        .byte con_anim + $0A
- D 1 - I - 0x01A851 06:A841: 02        .byte con_timer + $02
- D 1 - I - 0x01A852 06:A842: 21        .byte con_anim + $21
- D 1 - I - 0x01A853 06:A843: F0        .byte con_F0, $05
- D 1 - I - 0x01A855 06:A845: 04        .byte con_timer + $04
- D 1 - I - 0x01A856 06:A846: 0B        .byte con_anim + $0B
- D 1 - I - 0x01A857 06:A847: FF        .byte con_FF



_animation_A848_07:
- D 1 - I - 0x01A858 06:A848: FD        .byte con_FD
- D 1 - I - 0x01A859 06:A849: 23 A8     .word off_A823_00
- D 1 - I - 0x01A85B 06:A84B: 4F A8     .word off_A84F_01
- D 1 - I - 0x01A85D 06:A84D: 4F A8     .word off_A84F_02
off_A84F_01:
off_A84F_02:
- D 1 - I - 0x01A85F 06:A84F: 03        .byte con_timer + $03
- D 1 - I - 0x01A860 06:A850: 0A        .byte con_anim + $0A
- D 1 - I - 0x01A861 06:A851: 01        .byte con_timer + $01
- D 1 - I - 0x01A862 06:A852: 21        .byte con_anim + $21
- D 1 - I - 0x01A863 06:A853: 06        .byte con_timer + $06
- D 1 - I - 0x01A864 06:A854: 16        .byte con_anim + $16
- D 1 - I - 0x01A865 06:A855: FF        .byte con_FF



_animation_A856_0A:
- D 1 - I - 0x01A866 06:A856: FD        .byte con_FD
- D 1 - I - 0x01A867 06:A857: 2F A8     .word off_A82F_00
- D 1 - I - 0x01A869 06:A859: 66 A8     .word off_A866_01
- D 1 - I - 0x01A86B 06:A85B: 66 A8     .word off_A866_02



_animation_A85D_15:
- - - - - - 0x01A86D 06:A85D: 04        .byte con_timer + $04
- - - - - - 0x01A86E 06:A85E: 05        .byte con_anim + $05
- - - - - - 0x01A86F 06:A85F: F0        .byte con_F0, $18
- - - - - - 0x01A871 06:A861: F1        .byte con_sound, $20
- - - - - - 0x01A873 06:A863: 04        .byte con_timer + $04
- - - - - - 0x01A874 06:A864: 06        .byte con_anim + $06
- - - - - - 0x01A875 06:A865: FF        .byte con_FF
off_A866_01:
off_A866_02:
- D 1 - I - 0x01A876 06:A866: 04        .byte con_timer + $04
- D 1 - I - 0x01A877 06:A867: 05        .byte con_anim + $05
- D 1 - I - 0x01A878 06:A868: F0        .byte con_F0, $04
- D 1 - I - 0x01A87A 06:A86A: F1        .byte con_sound, $20
- D 1 - I - 0x01A87C 06:A86C: 04        .byte con_timer + $04
- D 1 - I - 0x01A87D 06:A86D: 06        .byte con_anim + $06
- D 1 - I - 0x01A87E 06:A86E: FF        .byte con_FF



_animation_A86F_08:
- D 1 - I - 0x01A87F 06:A86F: FD        .byte con_FD
- D 1 - I - 0x01A880 06:A870: 23 A8     .word off_A823_00
- D 1 - I - 0x01A882 06:A872: 76 A8     .word off_A876_01
- D 1 - I - 0x01A884 06:A874: 76 A8     .word off_A876_02
off_A876_01:
off_A876_02:
- D 1 - I - 0x01A886 06:A876: 04        .byte con_timer + $04
- D 1 - I - 0x01A887 06:A877: 05        .byte con_anim + $05
- D 1 - I - 0x01A888 06:A878: 04        .byte con_timer + $04
- D 1 - I - 0x01A889 06:A879: 06        .byte con_anim + $06
- D 1 - I - 0x01A88A 06:A87A: FF        .byte con_FF



_animation_A87B_24:
- D 1 - I - 0x01A88B 06:A87B: FD        .byte con_FD
- D 1 - I - 0x01A88C 06:A87C: 80 A8     .word off_A880_00
- D 1 - I - 0x01A88E 06:A87E: 8B A8     .word off_A88B_01
off_A880_00:
- D 1 - I - 0x01A890 06:A880: 01        .byte con_timer + $01
- D 1 - I - 0x01A891 06:A881: 00        .byte con_anim + $00
- D 1 - I - 0x01A892 06:A882: 01        .byte con_timer + $01
- D 1 - I - 0x01A893 06:A883: 2F        .byte con_anim + $2F
- D 1 - I - 0x01A894 06:A884: 03        .byte con_timer + $03
- D 1 - I - 0x01A895 06:A885: 0E        .byte con_anim + $0E
- D 1 - I - 0x01A896 06:A886: 01        .byte con_timer + $01
- D 1 - I - 0x01A897 06:A887: 02        .byte con_anim + $02
- D 1 - I - 0x01A898 06:A888: 01        .byte con_timer + $01
- D 1 - I - 0x01A899 06:A889: 30        .byte con_anim + $30
- D 1 - I - 0x01A89A 06:A88A: FF        .byte con_FF
off_A88B_01:
- D 1 - I - 0x01A89B 06:A88B: 01        .byte con_timer + $01
- D 1 - I - 0x01A89C 06:A88C: 00        .byte con_anim + $00
- D 1 - I - 0x01A89D 06:A88D: 01        .byte con_timer + $01
- D 1 - I - 0x01A89E 06:A88E: 2F        .byte con_anim + $2F
- D 1 - I - 0x01A89F 06:A88F: 03        .byte con_timer + $03
- D 1 - I - 0x01A8A0 06:A890: 30        .byte con_anim + $30
- D 1 - I - 0x01A8A1 06:A891: 01        .byte con_timer + $01
- D 1 - I - 0x01A8A2 06:A892: 02        .byte con_anim + $02
- D 1 - I - 0x01A8A3 06:A893: 01        .byte con_timer + $01
- D 1 - I - 0x01A8A4 06:A894: 0E        .byte con_anim + $0E
- D 1 - I - 0x01A8A5 06:A895: FF        .byte con_FF



_animation_A896_2F:
- D 1 - I - 0x01A8A6 06:A896: 01        .byte con_timer + $01
- D 1 - I - 0x01A8A7 06:A897: 0E        .byte con_anim + $0E
- D 1 - I - 0x01A8A8 06:A898: 01        .byte con_timer + $01
- D 1 - I - 0x01A8A9 06:A899: 2B        .byte con_anim + $2B
- D 1 - I - 0x01A8AA 06:A89A: 01        .byte con_timer + $01
- D 1 - I - 0x01A8AB 06:A89B: AB        .byte con_anim + $AB
- D 1 - I - 0x01A8AC 06:A89C: 01        .byte con_timer + $01
- D 1 - I - 0x01A8AD 06:A89D: 8E        .byte con_anim + $8E
- D 1 - I - 0x01A8AE 06:A89E: 01        .byte con_timer + $01
- D 1 - I - 0x01A8AF 06:A89F: 0E        .byte con_anim + $0E
- D 1 - I - 0x01A8B0 06:A8A0: 01        .byte con_timer + $01
- D 1 - I - 0x01A8B1 06:A8A1: 2B        .byte con_anim + $2B
- D 1 - I - 0x01A8B2 06:A8A2: 01        .byte con_timer + $01
- D 1 - I - 0x01A8B3 06:A8A3: AB        .byte con_anim + $AB
- D 1 - I - 0x01A8B4 06:A8A4: 01        .byte con_timer + $01
- D 1 - I - 0x01A8B5 06:A8A5: 8E        .byte con_anim + $8E
- D 1 - I - 0x01A8B6 06:A8A6: 01        .byte con_timer + $01
- D 1 - I - 0x01A8B7 06:A8A7: 0E        .byte con_anim + $0E
- D 1 - I - 0x01A8B8 06:A8A8: 01        .byte con_timer + $01
- D 1 - I - 0x01A8B9 06:A8A9: 2B        .byte con_anim + $2B
- D 1 - I - 0x01A8BA 06:A8AA: 01        .byte con_timer + $01
- D 1 - I - 0x01A8BB 06:A8AB: AB        .byte con_anim + $AB
- D 1 - I - 0x01A8BC 06:A8AC: 01        .byte con_timer + $01
- D 1 - I - 0x01A8BD 06:A8AD: 8E        .byte con_anim + $8E
- D 1 - I - 0x01A8BE 06:A8AE: 02        .byte con_timer + $02
- D 1 - I - 0x01A8BF 06:A8AF: 0E        .byte con_anim + $0E
- D 1 - I - 0x01A8C0 06:A8B0: FF        .byte con_FF



_animation_A8B1_10:
- D 1 - I - 0x01A8C1 06:A8B1: F0        .byte con_F0, $02
- D 1 - I - 0x01A8C3 06:A8B3: 01        .byte con_timer + $01
- D 1 - I - 0x01A8C4 06:A8B4: 20        .byte con_anim + $20
- D 1 - I - 0x01A8C5 06:A8B5: 02        .byte con_timer + $02
- D 1 - I - 0x01A8C6 06:A8B6: 06        .byte con_anim + $06
- D 1 - I - 0x01A8C7 06:A8B7: 01        .byte con_timer + $01
- D 1 - I - 0x01A8C8 06:A8B8: 0D        .byte con_anim + $0D
- D 1 - I - 0x01A8C9 06:A8B9: F0        .byte con_F0, $0B
- D 1 - I - 0x01A8CB 06:A8BB: 02        .byte con_timer + $02
- D 1 - I - 0x01A8CC 06:A8BC: 0D        .byte con_anim + $0D
- D 1 - I - 0x01A8CD 06:A8BD: FF        .byte con_FF



_animation_A8BE_0B:
- D 1 - I - 0x01A8CE 06:A8BE: FD        .byte con_FD
- D 1 - I - 0x01A8CF 06:A8BF: C7 A8     .word off_A8C7_00
- D 1 - I - 0x01A8D1 06:A8C1: C5 A8     .word off_A8C5_01
- D 1 - I - 0x01A8D3 06:A8C3: C5 A8     .word off_A8C5_02
off_A8C5_01:
off_A8C5_02:
- D 1 - I - 0x01A8D5 06:A8C5: 00        .byte con_timer + $00
- D 1 - I - 0x01A8D6 06:A8C6: 18        .byte con_anim + $18
off_A8C7_00:
- D 1 - I - 0x01A8D7 06:A8C7: 00        .byte con_timer + $00
- D 1 - I - 0x01A8D8 06:A8C8: 03        .byte con_anim + $03



_animation_A8C9_0D:
- D 1 - I - 0x01A8D9 06:A8C9: FD        .byte con_FD
- D 1 - I - 0x01A8DA 06:A8CA: D6 A8     .word off_A8D6_00_чеканка_головой
- D 1 - I - 0x01A8DC 06:A8CC: D0 A8     .word off_A8D0_01_чеканка_коленом
- D 1 - I - 0x01A8DE 06:A8CE: D3 A8     .word off_A8D3_02_чеканка_пяткой
off_A8D0_01_чеканка_коленом:
- D 1 - I - 0x01A8E0 06:A8D0: 04        .byte con_timer + $04
- D 1 - I - 0x01A8E1 06:A8D1: 18        .byte con_anim + $18
- D 1 - I - 0x01A8E2 06:A8D2: FF        .byte con_FF
off_A8D3_02_чеканка_пяткой:
- D 1 - I - 0x01A8E3 06:A8D3: 04        .byte con_timer + $04
- D 1 - I - 0x01A8E4 06:A8D4: 0D        .byte con_anim + $0D
- D 1 - I - 0x01A8E5 06:A8D5: FF        .byte con_FF
off_A8D6_00_чеканка_головой:
- D 1 - I - 0x01A8E6 06:A8D6: 02        .byte con_timer + $02
- D 1 - I - 0x01A8E7 06:A8D7: 03        .byte con_anim + $03
- D 1 - I - 0x01A8E8 06:A8D8: 01        .byte con_timer + $01
- D 1 - I - 0x01A8E9 06:A8D9: 19        .byte con_anim + $19
- D 1 - I - 0x01A8EA 06:A8DA: 02        .byte con_timer + $02
- D 1 - I - 0x01A8EB 06:A8DB: 28        .byte con_anim + $28
- D 1 - I - 0x01A8EC 06:A8DC: FF        .byte con_FF



_animation_A8DD_0E:
- D 1 - I - 0x01A8ED 06:A8DD: 01        .byte con_timer + $01
- D 1 - I - 0x01A8EE 06:A8DE: 18        .byte con_anim + $18
- D 1 - I - 0x01A8EF 06:A8DF: F0        .byte con_F0, $0A
- D 1 - I - 0x01A8F1 06:A8E1: 03        .byte con_timer + $03
- D 1 - I - 0x01A8F2 06:A8E2: 18        .byte con_anim + $18
- D 1 - I - 0x01A8F3 06:A8E3: FF        .byte con_FF



_animation_A8E4_26:
- D 1 - I - 0x01A8F4 06:A8E4: FD        .byte con_FD
- D 1 - I - 0x01A8F5 06:A8E5: EE A8     .word off_A8EE_00_чеканка_головой
- D 1 - I - 0x01A8F7 06:A8E7: EB A8     .word off_A8EB_01_чеканка_коленом
- D 1 - I - 0x01A8F9 06:A8E9: EB A8     .word off_A8EB_02_чеканка_коленом
off_A8EB_01_чеканка_коленом:
off_A8EB_02_чеканка_коленом:
- D 1 - I - 0x01A8FB 06:A8EB: 02        .byte con_timer + $02
- D 1 - I - 0x01A8FC 06:A8EC: 18        .byte con_anim + $18
- D 1 - I - 0x01A8FD 06:A8ED: FF        .byte con_FF
off_A8EE_00_чеканка_головой:
- D 1 - I - 0x01A8FE 06:A8EE: 02        .byte con_timer + $02
- D 1 - I - 0x01A8FF 06:A8EF: 03        .byte con_anim + $03
- D 1 - I - 0x01A900 06:A8F0: FF        .byte con_FF



_animation_A8F1_0C:
- D 1 - I - 0x01A901 06:A8F1: FD        .byte con_FD
- D 1 - I - 0x01A902 06:A8F2: FB A8     .word off_A8FB_00
- D 1 - I - 0x01A904 06:A8F4: F8 A8     .word off_A8F8_01
- D 1 - I - 0x01A906 06:A8F6: F8 A8     .word off_A8F8_02
off_A8F8_01:
off_A8F8_02:
- D 1 - I - 0x01A908 06:A8F8: 0C        .byte con_timer + $0C
- D 1 - I - 0x01A909 06:A8F9: 11        .byte con_anim + $11
- D 1 - I - 0x01A90A 06:A8FA: FF        .byte con_FF
off_A8FB_00:
- D 1 - I - 0x01A90B 06:A8FB: 06        .byte con_timer + $06
- D 1 - I - 0x01A90C 06:A8FC: 17        .byte con_anim + $17
- D 1 - I - 0x01A90D 06:A8FD: 0C        .byte con_timer + $0C
- D 1 - I - 0x01A90E 06:A8FE: 11        .byte con_anim + $11
- D 1 - I - 0x01A90F 06:A8FF: FF        .byte con_FF



_animation_A900_12:
- - - - - - 0x01A910 06:A900: 02        .byte con_timer + $02
- - - - - - 0x01A911 06:A901: 19        .byte con_anim + $19
- - - - - - 0x01A912 06:A902: FF        .byte con_FF



_animation_A903_2B:
- - - - - - 0x01A913 06:A903: 01        .byte con_timer + $01
- - - - - - 0x01A914 06:A904: 3B        .byte con_anim + $3B
- - - - - - 0x01A915 06:A905: 0C        .byte con_timer + $0C
- - - - - - 0x01A916 06:A906: 3B        .byte con_anim + $3B
- - - - - - 0x01A917 06:A907: FF        .byte con_FF


; bzk мусор
- - - - - - 0x01A918 06:A908: 06        .byte con_timer + $06
- - - - - - 0x01A919 06:A909: 19        .byte con_anim + $19
- - - - - - 0x01A91A 06:A90A: 06        .byte con_timer + $06
- - - - - - 0x01A91B 06:A90B: 25        .byte con_anim + $25
- - - - - - 0x01A91C 06:A90C: FF        .byte con_FF



_animation_A90D_19:
_animation_A90D_22:
- D 1 - I - 0x01A91D 06:A90D: 06        .byte con_timer + $06
- D 1 - I - 0x01A91E 06:A90E: 0E        .byte con_anim + $0E
- D 1 - I - 0x01A91F 06:A90F: FF        .byte con_FF



_animation_A910_23:
- D 1 - I - 0x01A920 06:A910: 0C        .byte con_timer + $0C
- D 1 - I - 0x01A921 06:A911: 09        .byte con_anim + $09
- D 1 - I - 0x01A922 06:A912: 0C        .byte con_timer + $0C
- D 1 - I - 0x01A923 06:A913: 09        .byte con_anim + $09
- - - - - - 0x01A924 06:A914: FF        .byte con_FF


; bzk мусор
- - - - - - 0x01A925 06:A915: 20        .byte con_timer + $20
- - - - - - 0x01A926 06:A916: 09        .byte con_anim + $09
- - - - - - 0x01A927 06:A917: FF        .byte con_FF



_animation_A918_0F:
- D 1 - I - 0x01A928 06:A918: FD        .byte con_FD
- D 1 - I - 0x01A929 06:A919: 29 A9     .word off_A929_00
- D 1 - I - 0x01A92B 06:A91B: 29 A9     .word off_A929_01
- D 1 - I - 0x01A92D 06:A91D: 08 AA     .word off_AA08_02   ; какой-то особый случай
- D 1 - I - 0x01A92F 06:A91F: 29 A9     .word off_A929_03
- D 1 - I - 0x01A931 06:A921: 29 A9     .word off_A929_04
- D 1 - I - 0x01A933 06:A923: 29 A9     .word off_A929_05
- D 1 - I - 0x01A935 06:A925: 29 A9     .word off_A929_06
- D 1 - I - 0x01A937 06:A927: 29 A9     .word off_A929_07
off_A929_00:
off_A929_01:
off_A929_03:
off_A929_04:
off_A929_05:
off_A929_06:
off_A929_07:
- D 1 - I - 0x01A939 06:A929: 10        .byte con_timer + $10
- D 1 - I - 0x01A93A 06:A92A: 20        .byte con_anim + $20
- - - - - - 0x01A93B 06:A92B: FF        .byte con_FF



_animation_A92C_11:
- D 1 - I - 0x01A93C 06:A92C: 02        .byte con_timer + $02
- D 1 - I - 0x01A93D 06:A92D: 27        .byte con_anim + $27
- D 1 - I - 0x01A93E 06:A92E: 02        .byte con_timer + $02
- D 1 - I - 0x01A93F 06:A92F: 00        .byte con_anim + $00
- D 1 - I - 0x01A940 06:A930: 02        .byte con_timer + $02
- D 1 - I - 0x01A941 06:A931: 27        .byte con_anim + $27
- D 1 - I - 0x01A942 06:A932: 02        .byte con_timer + $02
- D 1 - I - 0x01A943 06:A933: 00        .byte con_anim + $00
- D 1 - I - 0x01A944 06:A934: FF        .byte con_FF



_animation_A935_58:
- D 1 - I - 0x01A945 06:A935: 02        .byte con_timer + $02
- D 1 - I - 0x01A946 06:A936: 02        .byte con_anim + $02
- D 1 - I - 0x01A947 06:A937: 00        .byte con_timer + $00
- D 1 - I - 0x01A948 06:A938: 18        .byte con_anim + $18
- - - - - - 0x01A949 06:A939: FF        .byte con_FF



_animation_A93A_3B:
- D 1 - I - 0x01A94A 06:A93A: 01        .byte con_timer + $01
- D 1 - I - 0x01A94B 06:A93B: 02        .byte con_anim + $02
- D 1 - I - 0x01A94C 06:A93C: 02        .byte con_timer + $02
- D 1 - I - 0x01A94D 06:A93D: 03        .byte con_anim + $03
- D 1 - I - 0x01A94E 06:A93E: 00        .byte con_timer + $00
- D 1 - I - 0x01A94F 06:A93F: 0E        .byte con_anim + $0E
- - - - - - 0x01A950 06:A940: FF        .byte con_FF



_animation_A941_42:
- D 1 - I - 0x01A951 06:A941: 04        .byte con_timer + $04
- D 1 - I - 0x01A952 06:A942: 08        .byte con_anim + $08
- D 1 - I - 0x01A953 06:A943: 04        .byte con_timer + $04
- D 1 - I - 0x01A954 06:A944: 2C        .byte con_anim + $2C
- D 1 - I - 0x01A955 06:A945: 03        .byte con_timer + $03
- D 1 - I - 0x01A956 06:A946: 20        .byte con_anim + $20
- D 1 - I - 0x01A957 06:A947: 00        .byte con_timer + $00
- D 1 - I - 0x01A958 06:A948: 02        .byte con_anim + $02



_animation_A949_2A:
- D 1 - I - 0x01A959 06:A949: 03        .byte con_timer + $03
- D 1 - I - 0x01A95A 06:A94A: 22        .byte con_anim + $22
- D 1 - I - 0x01A95B 06:A94B: 03        .byte con_timer + $03
- D 1 - I - 0x01A95C 06:A94C: 0C        .byte con_anim + $0C
- D 1 - I - 0x01A95D 06:A94D: FF        .byte con_FF



_animation_A94E_3E:
_animation_A94E_3F:
- D 1 - I - 0x01A95E 06:A94E: FD        .byte con_FD
- D 1 - I - 0x01A95F 06:A94F: 53 A9     .word off_A953_00
- D 1 - I - 0x01A961 06:A951: 56 A9     .word off_A956_01
off_A953_00:
- D 1 - I - 0x01A963 06:A953: 08        .byte con_timer + $08
- D 1 - I - 0x01A964 06:A954: 12        .byte con_anim + $12
- D 1 - I - 0x01A965 06:A955: FF        .byte con_FF
off_A956_01:
- D 1 - I - 0x01A966 06:A956: 08        .byte con_timer + $08
- D 1 - I - 0x01A967 06:A957: 13        .byte con_anim + $13
- D 1 - I - 0x01A968 06:A958: FF        .byte con_FF



_animation_A959_40:
- D 1 - I - 0x01A969 06:A959: 00        .byte con_timer + $00
- D 1 - I - 0x01A96A 06:A95A: 40        .byte con_anim + $40



_animation_A95B_41:
- D 1 - I - 0x01A96B 06:A95B: 02        .byte con_timer + $02
- D 1 - I - 0x01A96C 06:A95C: 0E        .byte con_anim + $0E
- D 1 - I - 0x01A96D 06:A95D: 01        .byte con_timer + $01
- D 1 - I - 0x01A96E 06:A95E: 08        .byte con_anim + $08
- D 1 - I - 0x01A96F 06:A95F: 0B        .byte con_timer + $0B
- D 1 - I - 0x01A970 06:A960: 29        .byte con_anim + $29
- D 1 - I - 0x01A971 06:A961: 04        .byte con_timer + $04
- D 1 - I - 0x01A972 06:A962: 82        .byte con_anim + $82
- D 1 - I - 0x01A973 06:A963: FF        .byte con_FF



_animation_A964_5C:
- D 1 - I - 0x01A974 06:A964: F1        .byte con_sound, $3C
- D 1 - I - 0x01A976 06:A966: 01        .byte con_timer + $01
- D 1 - I - 0x01A977 06:A967: 00        .byte con_anim + $00
- D 1 - I - 0x01A978 06:A968: 01        .byte con_timer + $01
- D 1 - I - 0x01A979 06:A969: 80        .byte con_anim + $80
- D 1 - I - 0x01A97A 06:A96A: 01        .byte con_timer + $01
- D 1 - I - 0x01A97B 06:A96B: D2        .byte con_anim + $D2
- D 1 - I - 0x01A97C 06:A96C: 01        .byte con_timer + $01
- D 1 - I - 0x01A97D 06:A96D: 52        .byte con_anim + $52
- D 1 - I - 0x01A97E 06:A96E: 01        .byte con_timer + $01
- D 1 - I - 0x01A97F 06:A96F: 00        .byte con_anim + $00
- D 1 - I - 0x01A980 06:A970: 01        .byte con_timer + $01
- D 1 - I - 0x01A981 06:A971: 80        .byte con_anim + $80
- D 1 - I - 0x01A982 06:A972: 01        .byte con_timer + $01
- D 1 - I - 0x01A983 06:A973: D2        .byte con_anim + $D2
- D 1 - I - 0x01A984 06:A974: 01        .byte con_timer + $01
- D 1 - I - 0x01A985 06:A975: 52        .byte con_anim + $52
- D 1 - I - 0x01A986 06:A976: F1        .byte con_sound, $38
- D 1 - I - 0x01A988 06:A978: FF        .byte con_FF



_animation_A979_54:
- D 1 - I - 0x01A989 06:A979: 01        .byte con_timer + $01
- D 1 - I - 0x01A98A 06:A97A: 0E        .byte con_anim + $0E
- D 1 - I - 0x01A98B 06:A97B: 01        .byte con_timer + $01
- D 1 - I - 0x01A98C 06:A97C: 0E        .byte con_anim + $0E
- D 1 - I - 0x01A98D 06:A97D: 08        .byte con_timer + $08
- D 1 - I - 0x01A98E 06:A97E: 29        .byte con_anim + $29
- D 1 - I - 0x01A98F 06:A97F: 04        .byte con_timer + $04
- D 1 - I - 0x01A990 06:A980: 82        .byte con_anim + $82
- D 1 - I - 0x01A991 06:A981: 00        .byte con_timer + $00
- D 1 - I - 0x01A992 06:A982: 02        .byte con_anim + $02


; bzk мусор?
- - - - - - 0x01A993 06:A983: FF        .byte con_FF


; bzk мусор
- - - - - - 0x01A994 06:A984: 02        .byte con_timer + $02
- - - - - - 0x01A995 06:A985: 2A        .byte con_anim + $2A
- - - - - - 0x01A996 06:A986: 02        .byte con_timer + $02
- - - - - - 0x01A997 06:A987: 2B        .byte con_anim + $2B
- - - - - - 0x01A998 06:A988: 02        .byte con_timer + $02
- - - - - - 0x01A999 06:A989: AB        .byte con_anim + $AB
- - - - - - 0x01A99A 06:A98A: 02        .byte con_timer + $02
- - - - - - 0x01A99B 06:A98B: AA        .byte con_anim + $AA
- - - - - - 0x01A99C 06:A98C: 02        .byte con_timer + $02
- - - - - - 0x01A99D 06:A98D: 2A        .byte con_anim + $2A
- - - - - - 0x01A99E 06:A98E: 03        .byte con_timer + $03
- - - - - - 0x01A99F 06:A98F: 2B        .byte con_anim + $2B
- - - - - - 0x01A9A0 06:A990: 02        .byte con_timer + $02
- - - - - - 0x01A9A1 06:A991: AB        .byte con_anim + $AB
- - - - - - 0x01A9A2 06:A992: 02        .byte con_timer + $02
- - - - - - 0x01A9A3 06:A993: AA        .byte con_anim + $AA
- - - - - - 0x01A9A4 06:A994: FF        .byte con_FF



_animation_A995_48:
- D 1 - I - 0x01A9A5 06:A995: 04        .byte con_timer + $04
- D 1 - I - 0x01A9A6 06:A996: 0E        .byte con_anim + $0E
- D 1 - I - 0x01A9A7 06:A997: FF        .byte con_FF



_animation_A998_49:
- D 1 - I - 0x01A9A8 06:A998: 01        .byte con_timer + $01
- D 1 - I - 0x01A9A9 06:A999: 2A        .byte con_anim + $2A
- D 1 - I - 0x01A9AA 06:A99A: 02        .byte con_timer + $02
- D 1 - I - 0x01A9AB 06:A99B: 2B        .byte con_anim + $2B
- D 1 - I - 0x01A9AC 06:A99C: 02        .byte con_timer + $02
- D 1 - I - 0x01A9AD 06:A99D: AB        .byte con_anim + $AB
- D 1 - I - 0x01A9AE 06:A99E: 01        .byte con_timer + $01
- D 1 - I - 0x01A9AF 06:A99F: AA        .byte con_anim + $AA
- D 1 - I - 0x01A9B0 06:A9A0: FE        .byte con_FE 



_animation_A9A1_4A:
- D 1 - I - 0x01A9B1 06:A9A1: 02        .byte con_timer + $02
- D 1 - I - 0x01A9B2 06:A9A2: 0E        .byte con_anim + $0E
- D 1 - I - 0x01A9B3 06:A9A3: FF        .byte con_FF



_animation_A9A4_4B:
- D 1 - I - 0x01A9B4 06:A9A4: 02        .byte con_timer + $02
- D 1 - I - 0x01A9B5 06:A9A5: 0C        .byte con_anim + $0C
- D 1 - I - 0x01A9B6 06:A9A6: 02        .byte con_timer + $02
- D 1 - I - 0x01A9B7 06:A9A7: 2D        .byte con_anim + $2D
- D 1 - I - 0x01A9B8 06:A9A8: 02        .byte con_timer + $02
- D 1 - I - 0x01A9B9 06:A9A9: 2E        .byte con_anim + $2E
- D 1 - I - 0x01A9BA 06:A9AA: FE        .byte con_FE 



_animation_A9AB_4C:
- D 1 - I - 0x01A9BB 06:A9AB: 04        .byte con_timer + $04
- D 1 - I - 0x01A9BC 06:A9AC: 83        .byte con_anim + $83
- D 1 - I - 0x01A9BD 06:A9AD: FF        .byte con_FF



_animation_A9AE_43:
_animation_A9AE_47:
_animation_A9AE_4D:
- D 1 - I - 0x01A9BE 06:A9AE: 02        .byte con_timer + $02
- D 1 - I - 0x01A9BF 06:A9AF: B9        .byte con_anim + $B9
- D 1 - I - 0x01A9C0 06:A9B0: 02        .byte con_timer + $02
- D 1 - I - 0x01A9C1 06:A9B1: BA        .byte con_anim + $BA
- D 1 - I - 0x01A9C2 06:A9B2: 02        .byte con_timer + $02
- D 1 - I - 0x01A9C3 06:A9B3: A2        .byte con_anim + $A2
- D 1 - I - 0x01A9C4 06:A9B4: 02        .byte con_timer + $02
- D 1 - I - 0x01A9C5 06:A9B5: BC        .byte con_anim + $BC
- D 1 - I - 0x01A9C6 06:A9B6: FE        .byte con_FE 



_animation_A9B7_51:
- D 1 - I - 0x01A9C7 06:A9B7: 01        .byte con_timer + $01
- D 1 - I - 0x01A9C8 06:A9B8: 08        .byte con_anim + $08
- D 1 - I - 0x01A9C9 06:A9B9: 01        .byte con_timer + $01
- D 1 - I - 0x01A9CA 06:A9BA: 2C        .byte con_anim + $2C
- D 1 - I - 0x01A9CB 06:A9BB: FF        .byte con_FF



_animation_A9BC_4E:
- D 1 - I - 0x01A9CC 06:A9BC: 03        .byte con_timer + $03
- D 1 - I - 0x01A9CD 06:A9BD: 08        .byte con_anim + $08
- D 1 - I - 0x01A9CE 06:A9BE: 01        .byte con_timer + $01
- D 1 - I - 0x01A9CF 06:A9BF: 2C        .byte con_anim + $2C
- D 1 - I - 0x01A9D0 06:A9C0: FF        .byte con_FF



_animation_A9C1_50:
- D 1 - I - 0x01A9D1 06:A9C1: 03        .byte con_timer + $03
- D 1 - I - 0x01A9D2 06:A9C2: 03        .byte con_anim + $03
- D 1 - I - 0x01A9D3 06:A9C3: 01        .byte con_timer + $01
- D 1 - I - 0x01A9D4 06:A9C4: 0E        .byte con_anim + $0E
- D 1 - I - 0x01A9D5 06:A9C5: FF        .byte con_FF



_animation_A9C6_4F:
- D 1 - I - 0x01A9D6 06:A9C6: 02        .byte con_timer + $02
- D 1 - I - 0x01A9D7 06:A9C7: A3        .byte con_anim + $A3
- D 1 - I - 0x01A9D8 06:A9C8: 02        .byte con_timer + $02
- D 1 - I - 0x01A9D9 06:A9C9: AD        .byte con_anim + $AD
- D 1 - I - 0x01A9DA 06:A9CA: 02        .byte con_timer + $02
- D 1 - I - 0x01A9DB 06:A9CB: BD        .byte con_anim + $BD
- D 1 - I - 0x01A9DC 06:A9CC: FE        .byte con_FE 


; bzk мусор
- - - - - - 0x01A9DD 06:A9CD: 02        .byte con_timer + $02
- - - - - - 0x01A9DE 06:A9CE: 22        .byte con_anim + $22
- - - - - - 0x01A9DF 06:A9CF: 00        .byte con_timer + $00
- - - - - - 0x01A9E0 06:A9D0: 0C        .byte con_anim + $0C



_animation_A9D1_44:
- - - - - - 0x01A9E1 06:A9D1: 02        .byte con_timer + $02
- - - - - - 0x01A9E2 06:A9D2: 03        .byte con_anim + $03
- - - - - - 0x01A9E3 06:A9D3: 01        .byte con_timer + $01
- - - - - - 0x01A9E4 06:A9D4: 19        .byte con_anim + $19
- - - - - - 0x01A9E5 06:A9D5: 02        .byte con_timer + $02
- - - - - - 0x01A9E6 06:A9D6: 28        .byte con_anim + $28
- - - - - - 0x01A9E7 06:A9D7: 00        .byte con_timer + $00
- - - - - - 0x01A9E8 06:A9D8: 02        .byte con_anim + $02


; bzk мусор?
- - - - - - 0x01A9E9 06:A9D9: FF        .byte con_FF



_animation_A9DA_28:
_animation_A9DA_29:
- D 1 - I - 0x01A9EA 06:A9DA: FD        .byte con_FD
- D 1 - I - 0x01A9EB 06:A9DB: DF A9     .word off_A9DF_00
- D 1 - I - 0x01A9ED 06:A9DD: E2 A9     .word off_A9E2_01
off_A9DF_00:
- D 1 - I - 0x01A9EF 06:A9DF: 08        .byte con_timer + $08
- D 1 - I - 0x01A9F0 06:A9E0: 12        .byte con_anim + $12
- D 1 - I - 0x01A9F1 06:A9E1: FF        .byte con_FF
off_A9E2_01:
- D 1 - I - 0x01A9F2 06:A9E2: 08        .byte con_timer + $08
- D 1 - I - 0x01A9F3 06:A9E3: 13        .byte con_anim + $13
- D 1 - I - 0x01A9F4 06:A9E4: FF        .byte con_FF



_animation_A9E5_27:
- D 1 - I - 0x01A9F5 06:A9E5: FD        .byte con_FD
- D 1 - I - 0x01A9F6 06:A9E6: EA A9     .word off_A9EA_00
- D 1 - I - 0x01A9F8 06:A9E8: F1 A9     .word off_A9F1_01
off_A9EA_00:
- D 1 - I - 0x01A9FA 06:A9EA: 02        .byte con_timer + $02
- D 1 - I - 0x01A9FB 06:A9EB: 0C        .byte con_anim + $0C
- D 1 - I - 0x01A9FC 06:A9EC: 02        .byte con_timer + $02
- D 1 - I - 0x01A9FD 06:A9ED: 2E        .byte con_anim + $2E
- D 1 - I - 0x01A9FE 06:A9EE: 02        .byte con_timer + $02
- D 1 - I - 0x01A9FF 06:A9EF: 2D        .byte con_anim + $2D
- D 1 - I - 0x01AA00 06:A9F0: FF        .byte con_FF
off_A9F1_01:
- D 1 - I - 0x01AA01 06:A9F1: 02        .byte con_timer + $02
- D 1 - I - 0x01AA02 06:A9F2: 0C        .byte con_anim + $0C
- D 1 - I - 0x01AA03 06:A9F3: 02        .byte con_timer + $02
- D 1 - I - 0x01AA04 06:A9F4: 2D        .byte con_anim + $2D
- D 1 - I - 0x01AA05 06:A9F5: 02        .byte con_timer + $02
- D 1 - I - 0x01AA06 06:A9F6: 2E        .byte con_anim + $2E
- D 1 - I - 0x01AA07 06:A9F7: FF        .byte con_FF
off_A9F8_02_держит_этажерку:
- D 1 - I - 0x01AA08 06:A9F8: 00        .byte con_timer + $00
- D 1 - I - 0x01AA09 06:A9F9: 17        .byte con_anim + $17
off_A9FA_04:
- D 1 - I - 0x01AA0A 06:A9FA: 03        .byte con_timer + $03
- D 1 - I - 0x01AA0B 06:A9FB: 36        .byte con_anim + $36
- D 1 - I - 0x01AA0C 06:A9FC: 03        .byte con_timer + $03
- D 1 - I - 0x01AA0D 06:A9FD: 17        .byte con_anim + $17
- D 1 - I - 0x01AA0E 06:A9FE: 03        .byte con_timer + $03
- D 1 - I - 0x01AA0F 06:A9FF: 38        .byte con_anim + $38
- D 1 - I - 0x01AA10 06:AA00: 03        .byte con_timer + $03
- D 1 - I - 0x01AA11 06:AA01: 17        .byte con_anim + $17
- - - - - - 0x01AA12 06:AA02: FE        .byte con_FE 
off_AA03_02:
- D 1 - I - 0x01AA13 06:AA03: 02        .byte con_timer + $02
- D 1 - I - 0x01AA14 06:AA04: 37        .byte con_anim + $37
- D 1 - I - 0x01AA15 06:AA05: 02        .byte con_timer + $02
- D 1 - I - 0x01AA16 06:AA06: 17        .byte con_anim + $17
- D 1 - I - 0x01AA17 06:AA07: FE        .byte con_FE 
off_AA08_02:
- D 1 - I - 0x01AA18 06:AA08: 10        .byte con_timer + $10
- D 1 - I - 0x01AA19 06:AA09: 40        .byte con_anim + $40
- - - - - - 0x01AA1A 06:AA0A: FF        .byte con_FF



_animation_AA0B_55:
- - - - - - 0x01AA1B 06:AA0B: 01        .byte con_timer + $01
- - - - - - 0x01AA1C 06:AA0C: 0F        .byte con_anim + $0F
- - - - - - 0x01AA1D 06:AA0D: 01        .byte con_timer + $01
- - - - - - 0x01AA1E 06:AA0E: 31        .byte con_anim + $31
- - - - - - 0x01AA1F 06:AA0F: 01        .byte con_timer + $01
- - - - - - 0x01AA20 06:AA10: B1        .byte con_anim + $B1
- - - - - - 0x01AA21 06:AA11: 01        .byte con_timer + $01
- - - - - - 0x01AA22 06:AA12: 8F        .byte con_anim + $8F
- - - - - - 0x01AA23 06:AA13: FE        .byte con_FE 



sub_AA14:
loc_AA14:
C - - - - - 0x01AA24 06:AA14: A0 02     LDY #$02
C - - - - - 0x01AA26 06:AA16: 4C 1B AA  BNE bra_AA1B
sub_AA19:
C - - - - - 0x01AA29 06:AA19: A0 00     LDY #$00
bra_AA1B:
C D 1 - - - 0x01AA2B 06:AA1B: B9 65 AC  LDA tbl_AC65,Y
C - - - - - 0x01AA2E 06:AA1E: 85 2C     STA ram_002C
C - - - - - 0x01AA30 06:AA20: B9 66 AC  LDA tbl_AC65 + 1,Y
C - - - - - 0x01AA33 06:AA23: 85 2D     STA ram_002D
C - - - - - 0x01AA35 06:AA25: AD 66 04  LDA ram_weather_id
C - - - - - 0x01AA38 06:AA28: 29 7F     AND #$7F
C - - - - - 0x01AA3A 06:AA2A: C9 01     CMP #con_weather_lightning
C - - - - - 0x01AA3C 06:AA2C: D0 19     BNE bra_AA47
C - - - - - 0x01AA3E 06:AA2E: BD 86 04  LDA ram_игрок_состояние,X
C - - - - - 0x01AA41 06:AA31: 30 14     BMI bra_AA47
C - - - - - 0x01AA43 06:AA33: BD F1 04  LDA ram_skill_id,X
C - - - - - 0x01AA46 06:AA36: 4A        LSR
C - - - - - 0x01AA47 06:AA37: B0 0E     BCS bra_AA47
C - - - - - 0x01AA49 06:AA39: BD 30 01  LDA ram_surface_player,X
C - - - - - 0x01AA4C 06:AA3C: F0 09     BEQ bra_AA47    ; если на траве
C - - - - - 0x01AA4E 06:AA3E: C9 03     CMP #$03
C - - - - - 0x01AA50 06:AA40: B0 05     BCS bra_AA47
C - - - - - 0x01AA52 06:AA42: A9 06     LDA #$06
C - - - - - 0x01AA54 06:AA44: 9D 79 04  STA ram_action_id_player,X
bra_AA47:
C - - - - - 0x01AA57 06:AA47: BD 79 04  LDA ram_action_id_player,X
C - - - - - 0x01AA5A 06:AA4A: 10 01     BPL bra_AA4D
C D 1 - - - 0x01AA5C 06:AA4C: 60        RTS
bra_AA4D:
C - - - - - 0x01AA5D 06:AA4D: BD 59 04  LDA ram_movement_id_player,X
C - - - - - 0x01AA60 06:AA50: 30 03     BMI bra_AA55
C - - - - - 0x01AA62 06:AA52: 4C 4C AA  RTS
bra_AA55:
C - - - - - 0x01AA65 06:AA55: BD 86 04  LDA ram_игрок_состояние,X
C - - - - - 0x01AA68 06:AA58: 0A        ASL
C - - - - - 0x01AA69 06:AA59: 30 09     BMI bra_AA64
C - - - - - 0x01AA6B 06:AA5B: 20 AC AA  JSR sub_AAAC
C - - - - - 0x01AA6E 06:AA5E: 0A        ASL
C - - - - - 0x01AA6F 06:AA5F: 10 03     BPL bra_AA64
C - - - - - 0x01AA71 06:AA61: 4C A4 AA  JMP loc_AAA4
bra_AA64:
C - - - - - 0x01AA74 06:AA64: BD 86 04  LDA ram_игрок_состояние,X
C - - - - - 0x01AA77 06:AA67: 29 20     AND #$20
C - - - - - 0x01AA79 06:AA69: F0 0A     BEQ bra_AA75
- - - - - - 0x01AA7B 06:AA6B: 20 AC AA  JSR sub_AAAC
- - - - - - 0x01AA7E 06:AA6E: 29 20     AND #$20
- - - - - - 0x01AA80 06:AA70: D0 03     BNE bra_AA75
- - - - - - 0x01AA82 06:AA72: 4C A4 AA  JMP loc_AAA4
bra_AA75:
C - - - - - 0x01AA85 06:AA75: BD 86 04  LDA ram_игрок_состояние,X
C - - - - - 0x01AA88 06:AA78: 30 13     BMI bra_AA8D
bra_AA7A:
C - - - - - 0x01AA8A 06:AA7A: 20 BD AA  JSR sub_AABD
C - - - - - 0x01AA8D 06:AA7D: F0 15     BEQ bra_AA94
C - - - - - 0x01AA8F 06:AA7F: 85 1C     STA ram_001C
C - - - - - 0x01AA91 06:AA81: 20 B4 AA  JSR sub_AAB4
C - - - - - 0x01AA94 06:AA84: C5 1C     CMP ram_001C
C - - - - - 0x01AA96 06:AA86: 90 1C     BCC bra_AAA4
C - - - - - 0x01AA98 06:AA88: F0 1A     BEQ bra_AAA4
C - - - - - 0x01AA9A 06:AA8A: 4C 94 AA  JMP loc_AA94
bra_AA8D:
C - - - - - 0x01AA9D 06:AA8D: 20 AC AA  JSR sub_AAAC
C - - - - - 0x01AAA0 06:AA90: 10 12     BPL bra_AAA4
C - - - - - 0x01AAA2 06:AA92: 30 E6     BMI bra_AA7A
bra_AA94:
loc_AA94:
C D 1 - - - 0x01AAA4 06:AA94: BD 59 04  LDA ram_movement_id_player,X
C - - - - - 0x01AAA7 06:AA97: 29 7F     AND #$7F
C - - - - - 0x01AAA9 06:AA99: DD 79 04  CMP ram_action_id_player,X
C - - - - - 0x01AAAC 06:AA9C: F0 06     BEQ bra_AAA4
C - - - - - 0x01AAAE 06:AA9E: BD 79 04  LDA ram_action_id_player,X
C - - - - - 0x01AAB1 06:AAA1: 9D 59 04  STA ram_movement_id_player,X
bra_AAA4:
loc_AAA4:
C D 1 - - - 0x01AAB4 06:AAA4: A9 FF     LDA #$FF
C - - - - - 0x01AAB6 06:AAA6: 9D 79 04  STA ram_action_id_player,X
C - - - - - 0x01AAB9 06:AAA9: 4C 4C AA  RTS



sub_AAAC:
C - - - - - 0x01AABC 06:AAAC: BD 79 04  LDA ram_action_id_player,X
C - - - - - 0x01AABF 06:AAAF: 0A        ASL
C - - - - - 0x01AAC0 06:AAB0: A8        TAY
C - - - - - 0x01AAC1 06:AAB1: B1 2C     LDA (ram_002C),Y
C - - - - - 0x01AAC3 06:AAB3: 60        RTS



sub_AAB4:
C - - - - - 0x01AAC4 06:AAB4: BD 79 04  LDA ram_action_id_player,X
loc_AAB7:
C D 1 - - - 0x01AAC7 06:AAB7: 0A        ASL
C - - - - - 0x01AAC8 06:AAB8: A8        TAY
C - - - - - 0x01AAC9 06:AAB9: C8        INY
C - - - - - 0x01AACA 06:AABA: B1 2C     LDA (ram_002C),Y
C - - - - - 0x01AACC 06:AABC: 60        RTS



sub_AABD:
C - - - - - 0x01AACD 06:AABD: BD 59 04  LDA ram_movement_id_player,X
C - - - - - 0x01AAD0 06:AAC0: 4C B7 AA  JMP loc_AAB7



sub_AAC3:
loc_AAC3:
C - - - - - 0x01AAD3 06:AAC3: A0 02     LDY #$02
C - - - - - 0x01AAD5 06:AAC5: 4C CA AA  JMP loc_AACA



sub_AAC8:
C - - - - - 0x01AAD8 06:AAC8: A0 00     LDY #$00
loc_AACA:
C D 1 - - - 0x01AADA 06:AACA: B9 65 AC  LDA tbl_AC65,Y
C - - - - - 0x01AADD 06:AACD: 85 2C     STA ram_002C
C - - - - - 0x01AADF 06:AACF: B9 66 AC  LDA tbl_AC65 + 1,Y
C - - - - - 0x01AAE2 06:AAD2: 85 2D     STA ram_002D
C - - - - - 0x01AAE4 06:AAD4: A9 00     LDA #$00
C - - - - - 0x01AAE6 06:AAD6: 85 1C     STA ram_001C
C - - - - - 0x01AAE8 06:AAD8: BD 99 03  LDA ram_pos_Z_hi_player,X
C - - - - - 0x01AAEB 06:AADB: 10 0B     BPL bra_AAE8
C - - - - - 0x01AAED 06:AADD: BD 86 03  LDA ram_pos_Z_lo_player,X
C - - - - - 0x01AAF0 06:AAE0: C9 F8     CMP #$F8
C - - - - - 0x01AAF2 06:AAE2: B0 04     BCS bra_AAE8
- - - - - - 0x01AAF4 06:AAE4: A9 20     LDA #$20
- - - - - - 0x01AAF6 06:AAE6: 85 1C     STA ram_001C
bra_AAE8:
C - - - - - 0x01AAF8 06:AAE8: BD 86 04  LDA ram_игрок_состояние,X
C - - - - - 0x01AAFB 06:AAEB: 29 08     AND #$08
C - - - - - 0x01AAFD 06:AAED: 85 1D     STA ram_001D
C - - - - - 0x01AAFF 06:AAEF: BD 59 04  LDA ram_movement_id_player,X
C - - - - - 0x01AB02 06:AAF2: 0A        ASL
C - - - - - 0x01AB03 06:AAF3: A8        TAY
C - - - - - 0x01AB04 06:AAF4: B1 2C     LDA (ram_002C),Y
C - - - - - 0x01AB06 06:AAF6: 29 04     AND #$04
C - - - - - 0x01AB08 06:AAF8: 0A        ASL
C - - - - - 0x01AB09 06:AAF9: 25 1D     AND ram_001D
C - - - - - 0x01AB0B 06:AAFB: 45 1D     EOR ram_001D
C - - - - - 0x01AB0D 06:AAFD: 85 1D     STA ram_001D
C - - - - - 0x01AB0F 06:AAFF: B1 2C     LDA (ram_002C),Y
C - - - - - 0x01AB11 06:AB01: 29 89     AND #$89
C - - - - - 0x01AB13 06:AB03: 05 1C     ORA ram_001C
C - - - - - 0x01AB15 06:AB05: 05 1D     ORA ram_001D
C - - - - - 0x01AB17 06:AB07: 9D 86 04  STA ram_игрок_состояние,X
C - - - - - 0x01AB1A 06:AB0A: 60        RTS



sub_AB0B:
C - - - - - 0x01AB1B 06:AB0B: AD 66 04  LDA ram_weather_id
C - - - - - 0x01AB1E 06:AB0E: 29 7F     AND #$7F
C - - - - - 0x01AB20 06:AB10: C9 01     CMP #con_weather_lightning
C - - - - - 0x01AB22 06:AB12: D0 16     BNE bra_AB2A
C - - - - - 0x01AB24 06:AB14: 20 56 98  JSR sub_9856
C - - - - - 0x01AB27 06:AB17: AD 92 04  LDA ram_мяч_состояние
C - - - - - 0x01AB2A 06:AB1A: 30 0E     BMI bra_AB2A
C - - - - - 0x01AB2C 06:AB1C: BD 30 01  LDA ram_surface_player,X
C - - - - - 0x01AB2F 06:AB1F: F0 09     BEQ bra_AB2A    ; если на траве
C - - - - - 0x01AB31 06:AB21: C9 03     CMP #$03
C - - - - - 0x01AB33 06:AB23: B0 05     BCS bra_AB2A
C - - - - - 0x01AB35 06:AB25: A9 FF     LDA #$FF
C - - - - - 0x01AB37 06:AB27: 8D 25 05  STA ram_timer_electric_ball
bra_AB2A:
C - - - - - 0x01AB3A 06:AB2A: AD 85 04  LDA ram_мяч_тип_удара
C - - - - - 0x01AB3D 06:AB2D: 30 22     BMI bra_AB51_RTS
C - - - - - 0x01AB3F 06:AB2F: 29 7F     AND #$7F
C - - - - - 0x01AB41 06:AB31: A8        TAY
C - - - - - 0x01AB42 06:AB32: B9 4D AC  LDA tbl_AC4D_состояние_мяча,Y
C - - - - - 0x01AB45 06:AB35: 29 0F     AND #$0F
C - - - - - 0x01AB47 06:AB37: 85 1C     STA ram_001C
C - - - - - 0x01AB49 06:AB39: AD 92 04  LDA ram_мяч_состояние
C - - - - - 0x01AB4C 06:AB3C: 29 0F     AND #$0F
C - - - - - 0x01AB4E 06:AB3E: C5 1C     CMP ram_001C
C - - - - - 0x01AB50 06:AB40: 90 04     BCC bra_AB46
C - - - - - 0x01AB52 06:AB42: F0 02     BEQ bra_AB46
- - - - - - 0x01AB54 06:AB44: B0 06     BCS bra_AB4C
bra_AB46:
C - - - - - 0x01AB56 06:AB46: AD 85 04  LDA ram_мяч_тип_удара
C - - - - - 0x01AB59 06:AB49: 9D 59 04  STA ram_movement_id_player,X
bra_AB4C:
C - - - - - 0x01AB5C 06:AB4C: A9 FF     LDA #$FF
C - - - - - 0x01AB5E 06:AB4E: 8D 85 04  STA ram_мяч_тип_удара
bra_AB51_RTS:
C - - - - - 0x01AB61 06:AB51: 60        RTS



sub_AB52:
C - - - - - 0x01AB62 06:AB52: A0 00     LDY #$00
bra_AB54:
C - - - - - 0x01AB64 06:AB54: B9 2A 05  LDA ram_флаг_владения_мячом_ком,Y
C - - - - - 0x01AB67 06:AB57: 29 7F     AND #$7F
C - - - - - 0x01AB69 06:AB59: 99 2A 05  STA ram_флаг_владения_мячом_ком,Y
C - - - - - 0x01AB6C 06:AB5C: C8        INY
C - - - - - 0x01AB6D 06:AB5D: C0 02     CPY #$02
C - - - - - 0x01AB6F 06:AB5F: 90 F3     BCC bra_AB54
C - - - - - 0x01AB71 06:AB61: A9 00     LDA #$00
C - - - - - 0x01AB73 06:AB63: 85 1C     STA ram_001C
C - - - - - 0x01AB75 06:AB65: BD 99 03  LDA ram_pos_Z_hi_player,X
C - - - - - 0x01AB78 06:AB68: 10 04     BPL bra_AB6E
C - - - - - 0x01AB7A 06:AB6A: A9 20     LDA #$20
C - - - - - 0x01AB7C 06:AB6C: 85 1C     STA ram_001C
bra_AB6E:
C - - - - - 0x01AB7E 06:AB6E: BD 59 04  LDA ram_movement_id_player,X
C - - - - - 0x01AB81 06:AB71: 29 7F     AND #$7F
C - - - - - 0x01AB83 06:AB73: A8        TAY
C - - - - - 0x01AB84 06:AB74: B9 4D AC  LDA tbl_AC4D_состояние_мяча,Y
C - - - - - 0x01AB87 06:AB77: 05 1C     ORA ram_001C
C - - - - - 0x01AB89 06:AB79: 8D 92 04  STA ram_мяч_состояние
C - - - - - 0x01AB8C 06:AB7C: 2C 92 04  BIT ram_мяч_состояние
C - - - - - 0x01AB8F 06:AB7F: 50 1F     BVC bra_ABA0
C - - - - - 0x01AB91 06:AB81: AC D6 04  LDY ram_игрок_с_мячом
C - - - - - 0x01AB94 06:AB84: B9 86 04  LDA ram_игрок_состояние,Y
C - - - - - 0x01AB97 06:AB87: 09 40     ORA #$40
C - - - - - 0x01AB99 06:AB89: 99 86 04  STA ram_игрок_состояние,Y
C - - - - - 0x01AB9C 06:AB8C: 29 80     AND #$80
C - - - - - 0x01AB9E 06:AB8E: 0D 92 04  ORA ram_мяч_состояние
C - - - - - 0x01ABA1 06:AB91: 8D 92 04  STA ram_мяч_состояние
C - - - - - 0x01ABA4 06:AB94: 98        TYA
C - - - - - 0x01ABA5 06:AB95: 29 01     AND #$01
C - - - - - 0x01ABA7 06:AB97: A8        TAY
C - - - - - 0x01ABA8 06:AB98: B9 2A 05  LDA ram_флаг_владения_мячом_ком,Y
C - - - - - 0x01ABAB 06:AB9B: 09 80     ORA #$80
C - - - - - 0x01ABAD 06:AB9D: 99 2A 05  STA ram_флаг_владения_мячом_ком,Y
bra_ABA0:
C - - - - - 0x01ABB0 06:ABA0: AD 92 04  LDA ram_мяч_состояние
C - - - - - 0x01ABB3 06:ABA3: 29 10     AND #$10
C - - - - - 0x01ABB5 06:ABA5: F0 0B     BEQ bra_ABB2_RTS
C - - - - - 0x01ABB7 06:ABA7: AC D6 04  LDY ram_игрок_с_мячом
C - - - - - 0x01ABBA 06:ABAA: B9 86 04  LDA ram_игрок_состояние,Y
C - - - - - 0x01ABBD 06:ABAD: 09 10     ORA #$10
C - - - - - 0x01ABBF 06:ABAF: 99 86 04  STA ram_игрок_состояние,Y
bra_ABB2_RTS:
C - - - - - 0x01ABC2 06:ABB2: 60        RTS



sub_ABB3:
C - - - - - 0x01ABC3 06:ABB3: A2 00     LDX #$00
bra_ABB5:
C - - - - - 0x01ABC5 06:ABB5: BD 59 04  LDA ram_movement_id_player,X
C - - - - - 0x01ABC8 06:ABB8: 29 7F     AND #$7F
C - - - - - 0x01ABCA 06:ABBA: C9 14     CMP #$14
C - - - - - 0x01ABCC 06:ABBC: D0 1A     BNE bra_ABD8
C - - - - - 0x01ABCE 06:ABBE: BC CA 04  LDY ram_04CA,X
C - - - - - 0x01ABD1 06:ABC1: BD B0 04  LDA ram_смена_угла_движения,X
C - - - - - 0x01ABD4 06:ABC4: 99 B0 04  STA ram_смена_угла_движения,Y
C - - - - - 0x01ABD7 06:ABC7: BD 79 04  LDA ram_action_id_player,X
C - - - - - 0x01ABDA 06:ABCA: 99 79 04  STA ram_action_id_player,Y
C - - - - - 0x01ABDD 06:ABCD: B9 A3 04  LDA ram_направление_движения,Y
C - - - - - 0x01ABE0 06:ABD0: 9D A3 04  STA ram_направление_движения,X
C - - - - - 0x01ABE3 06:ABD3: A9 FF     LDA #$FF
C - - - - - 0x01ABE5 06:ABD5: 9D 79 04  STA ram_action_id_player,X
bra_ABD8:
C - - - - - 0x01ABE8 06:ABD8: E8        INX
C - - - - - 0x01ABE9 06:ABD9: E0 0C     CPX #$0C
C - - - - - 0x01ABEB 06:ABDB: 90 D8     BCC bra_ABB5
C - - - - - 0x01ABED 06:ABDD: 60        RTS



sub_ABDE:
C - - - - - 0x01ABEE 06:ABDE: A2 00     LDX #$00
bra_ABE0:
C - - - - - 0x01ABF0 06:ABE0: BD 86 04  LDA ram_игрок_состояние,X
C - - - - - 0x01ABF3 06:ABE3: 29 FE     AND #$FE
C - - - - - 0x01ABF5 06:ABE5: 9D 86 04  STA ram_игрок_состояние,X
C - - - - - 0x01ABF8 06:ABE8: E8        INX
C - - - - - 0x01ABF9 06:ABE9: E0 0C     CPX #$0C
C - - - - - 0x01ABFB 06:ABEB: 90 F3     BCC bra_ABE0
C - - - - - 0x01ABFD 06:ABED: A2 00     LDX #$00
bra_ABEF:
C - - - - - 0x01ABFF 06:ABEF: BD 59 04  LDA ram_movement_id_player,X
C - - - - - 0x01AC02 06:ABF2: 29 7F     AND #$7F
C - - - - - 0x01AC04 06:ABF4: C9 14     CMP #$14
C - - - - - 0x01AC06 06:ABF6: D0 4F     BNE bra_AC47
C - - - - - 0x01AC08 06:ABF8: BC CA 04  LDY ram_04CA,X
C - - - - - 0x01AC0B 06:ABFB: B9 86 04  LDA ram_игрок_состояние,Y
C - - - - - 0x01AC0E 06:ABFE: 09 01     ORA #$01
C - - - - - 0x01AC10 06:AC00: 9D 86 04  STA ram_игрок_состояние,X
C - - - - - 0x01AC13 06:AC03: 99 86 04  STA ram_игрок_состояние,Y
C - - - - - 0x01AC16 06:AC06: B9 14 03  LDA ram_pos_X_lo_player,Y
C - - - - - 0x01AC19 06:AC09: 9D 14 03  STA ram_pos_X_lo_player,X
C - - - - - 0x01AC1C 06:AC0C: B9 27 03  LDA ram_pos_X_hi_player,Y
C - - - - - 0x01AC1F 06:AC0F: 9D 27 03  STA ram_pos_X_hi_player,X
C - - - - - 0x01AC22 06:AC12: B9 4D 03  LDA ram_pos_Y_lo_player,Y
C - - - - - 0x01AC25 06:AC15: 9D 4D 03  STA ram_pos_Y_lo_player,X
C - - - - - 0x01AC28 06:AC18: B9 60 03  LDA ram_pos_Y_hi_player,Y
C - - - - - 0x01AC2B 06:AC1B: 9D 60 03  STA ram_pos_Y_hi_player,X
C - - - - - 0x01AC2E 06:AC1E: 18        CLC
C - - - - - 0x01AC2F 06:AC1F: B9 86 03  LDA ram_pos_Z_lo_player,Y
C - - - - - 0x01AC32 06:AC22: 69 20     ADC #$20
C - - - - - 0x01AC34 06:AC24: 9D 86 03  STA ram_pos_Z_lo_player,X
C - - - - - 0x01AC37 06:AC27: B9 99 03  LDA ram_pos_Z_hi_player,Y
C - - - - - 0x01AC3A 06:AC2A: 69 00     ADC #$00
C - - - - - 0x01AC3C 06:AC2C: 9D 99 03  STA ram_pos_Z_hi_player,X
C - - - - - 0x01AC3F 06:AC2F: B9 E8 03  LDA ram_spd_X_lo_player,Y
C - - - - - 0x01AC42 06:AC32: 9D E8 03  STA ram_spd_X_lo_player,X
C - - - - - 0x01AC45 06:AC35: B9 F6 03  LDA ram_spd_X_hi_player,Y
C - - - - - 0x01AC48 06:AC38: 9D F6 03  STA ram_spd_X_hi_player,X
C - - - - - 0x01AC4B 06:AC3B: B9 04 04  LDA ram_spd_Y_lo_player,Y
C - - - - - 0x01AC4E 06:AC3E: 9D 04 04  STA ram_spd_Y_lo_player,X
C - - - - - 0x01AC51 06:AC41: B9 12 04  LDA ram_spd_Y_hi_player,Y
C - - - - - 0x01AC54 06:AC44: 9D 12 04  STA ram_spd_Y_hi_player,X
bra_AC47:
C - - - - - 0x01AC57 06:AC47: E8        INX
C - - - - - 0x01AC58 06:AC48: E0 0C     CPX #$0C
C - - - - - 0x01AC5A 06:AC4A: 90 A3     BCC bra_ABEF
C - - - - - 0x01AC5C 06:AC4C: 60        RTS



tbl_AC4D_состояние_мяча:
- D 1 - - - 0x01AC5D 06:AC4D: 00        .byte $00   ; 
- D 1 - - - 0x01AC5E 06:AC4E: 00        .byte $00   ; 
- D 1 - - - 0x01AC5F 06:AC4F: 40        .byte $40   ; 
- D 1 - - - 0x01AC60 06:AC50: 40        .byte $40   ; 
- D 1 - - - 0x01AC61 06:AC51: 80        .byte $80   ; 
- D 1 - - - 0x01AC62 06:AC52: 84        .byte $84   ; 
- D 1 - - - 0x01AC63 06:AC53: 80        .byte $80   ; 
- D 1 - - - 0x01AC64 06:AC54: 00        .byte $00   ; 
- D 1 - - - 0x01AC65 06:AC55: 00        .byte $00   ; 
- D 1 - - - 0x01AC66 06:AC56: C0        .byte $C0   ; 
- D 1 - - - 0x01AC67 06:AC57: 80        .byte $80   ; 
- D 1 - - - 0x01AC68 06:AC58: 00        .byte $00   ; 
- D 1 - - - 0x01AC69 06:AC59: 00        .byte $00   ; 
- - - - - - 0x01AC6A 06:AC5A: 80        .byte $80   ; 
- - - - - - 0x01AC6B 06:AC5B: 80        .byte $80   ; 
- D 1 - - - 0x01AC6C 06:AC5C: 48        .byte $48   ; 
- D 1 - - - 0x01AC6D 06:AC5D: 48        .byte $48   ; 
- D 1 - - - 0x01AC6E 06:AC5E: 50        .byte $50   ; 
- D 1 - - - 0x01AC6F 06:AC5F: 50        .byte $50   ; 
- D 1 - - - 0x01AC70 06:AC60: 40        .byte $40   ; 
- D 1 - - - 0x01AC71 06:AC61: C0        .byte $C0   ; 
- D 1 - - - 0x01AC72 06:AC62: C0        .byte $C0   ; 
- - - - - - 0x01AC73 06:AC63: 84        .byte $84   ; 
- D 1 - - - 0x01AC74 06:AC64: 00        .byte $00   ; 



tbl_AC65:
- D 1 - - - 0x01AC75 06:AC65: 87 AC     .word off_AC87_00
- D 1 - - - 0x01AC77 06:AC67: 69 AC     .word off_AC69_01

off_AC69_01:
- - - - - - 0x01AC79 06:AC69: 00        .byte $00   ; 
- - - - - - 0x01AC7A 06:AC6A: 00        .byte $00   ; 
- D 1 - I - 0x01AC7B 06:AC6B: 24        .byte $24   ; 
- D 1 - I - 0x01AC7C 06:AC6C: 00        .byte $00   ; 
- D 1 - I - 0x01AC7D 06:AC6D: 04        .byte $04   ; 
- D 1 - I - 0x01AC7E 06:AC6E: 03        .byte $03   ; 
- D 1 - I - 0x01AC7F 06:AC6F: 24        .byte $24   ; 
- D 1 - I - 0x01AC80 06:AC70: 03        .byte $03   ; 
- D 1 - I - 0x01AC81 06:AC71: 24        .byte $24   ; 
- D 1 - I - 0x01AC82 06:AC72: 05        .byte $05   ; 
- D 1 - I - 0x01AC83 06:AC73: 24        .byte $24   ; 
- D 1 - I - 0x01AC84 06:AC74: 05        .byte $05   ; 
- D 1 - I - 0x01AC85 06:AC75: 24        .byte $24   ; 
- D 1 - I - 0x01AC86 06:AC76: 00        .byte $00   ; 
- D 1 - I - 0x01AC87 06:AC77: 28        .byte $28   ; 
- D 1 - I - 0x01AC88 06:AC78: 02        .byte $02   ; 
- D 1 - I - 0x01AC89 06:AC79: A0        .byte $A0   ; 
- D 1 - I - 0x01AC8A 06:AC7A: 04        .byte $04   ; 
- D 1 - I - 0x01AC8B 06:AC7B: A0        .byte $A0   ; 
- D 1 - I - 0x01AC8C 06:AC7C: 04        .byte $04   ; 
- - - - - - 0x01AC8D 06:AC7D: A0        .byte $A0   ; 
- - - - - - 0x01AC8E 06:AC7E: 04        .byte $04   ; 
- D 1 - I - 0x01AC8F 06:AC7F: A0        .byte $A0   ; 
- - - - - - 0x01AC90 06:AC80: 04        .byte $04   ; 
- D 1 - I - 0x01AC91 06:AC81: 00        .byte $00   ; 
- D 1 - I - 0x01AC92 06:AC82: 0F        .byte $0F   ; 
- D 1 - I - 0x01AC93 06:AC83: 24        .byte $24   ; 
- D 1 - I - 0x01AC94 06:AC84: 05        .byte $05   ; 
- - - - - - 0x01AC95 06:AC85: A0        .byte $A0   ; 
- - - - - - 0x01AC96 06:AC86: 04        .byte $04   ; 



off_AC87_00:
- D 1 - I - 0x01AC97 06:AC87: 00        .byte $00   ; 
- - - - - - 0x01AC98 06:AC88: 00        .byte $00   ; 
- D 1 - I - 0x01AC99 06:AC89: 24        .byte $24   ; 
- D 1 - I - 0x01AC9A 06:AC8A: 00        .byte $00   ; 
- D 1 - I - 0x01AC9B 06:AC8B: 04        .byte $04   ; 
- D 1 - I - 0x01AC9C 06:AC8C: 03        .byte $03   ; 
- D 1 - I - 0x01AC9D 06:AC8D: 24        .byte $24   ; 
- D 1 - I - 0x01AC9E 06:AC8E: 03        .byte $03   ; 
- D 1 - I - 0x01AC9F 06:AC8F: 24        .byte $24   ; 
- D 1 - I - 0x01ACA0 06:AC90: 0F        .byte $0F   ; 
- D 1 - I - 0x01ACA1 06:AC91: 24        .byte $24   ; 
- D 1 - I - 0x01ACA2 06:AC92: 0F        .byte $0F   ; 
- D 1 - I - 0x01ACA3 06:AC93: 24        .byte $24   ; 
- D 1 - I - 0x01ACA4 06:AC94: 0F        .byte $0F   ; 
- D 1 - I - 0x01ACA5 06:AC95: 20        .byte $20   ; 
- D 1 - I - 0x01ACA6 06:AC96: 04        .byte $04   ; 
- D 1 - I - 0x01ACA7 06:AC97: 20        .byte $20   ; 
- D 1 - I - 0x01ACA8 06:AC98: 04        .byte $04   ; 
- D 1 - I - 0x01ACA9 06:AC99: 60        .byte $60   ; 
- D 1 - I - 0x01ACAA 06:AC9A: 04        .byte $04   ; 
- D 1 - I - 0x01ACAB 06:AC9B: 60        .byte $60   ; 
- D 1 - I - 0x01ACAC 06:AC9C: 04        .byte $04   ; 
- D 1 - I - 0x01ACAD 06:AC9D: 64        .byte $64   ; 
- D 1 - I - 0x01ACAE 06:AC9E: 01        .byte $01   ; 
- D 1 - I - 0x01ACAF 06:AC9F: 24        .byte $24   ; 
- D 1 - I - 0x01ACB0 06:ACA0: 0F        .byte $0F   ; 
- D 1 - I - 0x01ACB1 06:ACA1: 04        .byte $04   ; 
- D 1 - I - 0x01ACB2 06:ACA2: 08        .byte $08   ; 
- D 1 - I - 0x01ACB3 06:ACA3: 04        .byte $04   ; 
- D 1 - I - 0x01ACB4 06:ACA4: 04        .byte $04   ; 
- D 1 - I - 0x01ACB5 06:ACA5: 24        .byte $24   ; 
- D 1 - I - 0x01ACB6 06:ACA6: 03        .byte $03   ; 
- D 1 - I - 0x01ACB7 06:ACA7: 40        .byte $40   ; 
- D 1 - I - 0x01ACB8 06:ACA8: 04        .byte $04   ; 
- D 1 - I - 0x01ACB9 06:ACA9: 04        .byte $04   ; 
- D 1 - I - 0x01ACBA 06:ACAA: 03        .byte $03   ; 
- - - - - - 0x01ACBB 06:ACAB: 20        .byte $20   ; 
- - - - - - 0x01ACBC 06:ACAC: 02        .byte $02   ; 
- - - - - - 0x01ACBD 06:ACAD: 24        .byte $24   ; 
- - - - - - 0x01ACBE 06:ACAE: 0F        .byte $0F   ; 
- D 1 - I - 0x01ACBF 06:ACAF: 01        .byte $01   ; 
- - - - - - 0x01ACC0 06:ACB0: 02        .byte $02   ; 
- - - - - - 0x01ACC1 06:ACB1: 00        .byte $00   ; 
- - - - - - 0x01ACC2 06:ACB2: 0F        .byte $0F   ; 
- D 1 - I - 0x01ACC3 06:ACB3: 00        .byte $00   ; 
- D 1 - I - 0x01ACC4 06:ACB4: 0F        .byte $0F   ; 
- - - - - - 0x01ACC5 06:ACB5: 00        .byte $00   ; 
- - - - - - 0x01ACC6 06:ACB6: 05        .byte $05   ; 
- - - - - - 0x01ACC7 06:ACB7: 00        .byte $00   ; 
- - - - - - 0x01ACC8 06:ACB8: 05        .byte $05   ; 
- D 1 - I - 0x01ACC9 06:ACB9: 20        .byte $20   ; 
- D 1 - I - 0x01ACCA 06:ACBA: 07        .byte $07   ; 
- D 1 - I - 0x01ACCB 06:ACBB: 00        .byte $00   ; 
- D 1 - I - 0x01ACCC 06:ACBC: 0F        .byte $0F   ; 
- D 1 - I - 0x01ACCD 06:ACBD: 00        .byte $00   ; 
- D 1 - I - 0x01ACCE 06:ACBE: 0F        .byte $0F   ; 
- D 1 - I - 0x01ACCF 06:ACBF: 00        .byte $00   ; 
- D 1 - I - 0x01ACD0 06:ACC0: 0F        .byte $0F   ; 
- D 1 - I - 0x01ACD1 06:ACC1: 08        .byte $08   ; 
- D 1 - I - 0x01ACD2 06:ACC2: 03        .byte $03   ; 
- - - - - - 0x01ACD3 06:ACC3: 00        .byte $00   ; 
- - - - - - 0x01ACD4 06:ACC4: 00        .byte $00   ; 
- - - - - - 0x01ACD5 06:ACC5: 00        .byte $00   ; 
- - - - - - 0x01ACD6 06:ACC6: 00        .byte $00   ; 
- D 1 - I - 0x01ACD7 06:ACC7: 24        .byte $24   ; 
- D 1 - I - 0x01ACD8 06:ACC8: 00        .byte $00   ; 
- D 1 - I - 0x01ACD9 06:ACC9: 28        .byte $28   ; 
- D 1 - I - 0x01ACDA 06:ACCA: 02        .byte $02   ; 
- D 1 - I - 0x01ACDB 06:ACCB: 20        .byte $20   ; 
- D 1 - I - 0x01ACDC 06:ACCC: 07        .byte $07   ; 
- D 1 - I - 0x01ACDD 06:ACCD: 00        .byte $00   ; 
- D 1 - I - 0x01ACDE 06:ACCE: 07        .byte $07   ; 
- D 1 - I - 0x01ACDF 06:ACCF: 40        .byte $40   ; 
- D 1 - I - 0x01ACE0 06:ACD0: 04        .byte $04   ; 
- D 1 - I - 0x01ACE1 06:ACD1: 20        .byte $20   ; 
- D 1 - I - 0x01ACE2 06:ACD2: 05        .byte $05   ; 
- D 1 - I - 0x01ACE3 06:ACD3: 00        .byte $00   ; 
- D 1 - I - 0x01ACE4 06:ACD4: 03        .byte $03   ; 
- D 1 - I - 0x01ACE5 06:ACD5: 24        .byte $24   ; 
- D 1 - I - 0x01ACE6 06:ACD6: 04        .byte $04   ; 
- D 1 - I - 0x01ACE7 06:ACD7: 20        .byte $20   ; 
- D 1 - I - 0x01ACE8 06:ACD8: 06        .byte $06   ; 
- D 1 - I - 0x01ACE9 06:ACD9: 20        .byte $20   ; 
- D 1 - I - 0x01ACEA 06:ACDA: 06        .byte $06   ; 
- D 1 - I - 0x01ACEB 06:ACDB: 24        .byte $24   ; 
- D 1 - I - 0x01ACEC 06:ACDC: 04        .byte $04   ; 
- - - - - - 0x01ACED 06:ACDD: 24        .byte $24   ; 
- - - - - - 0x01ACEE 06:ACDE: 07        .byte $07   ; 
- - - - - - 0x01ACEF 06:ACDF: 24        .byte $24   ; 
- - - - - - 0x01ACF0 06:ACE0: 00        .byte $00   ; 
- D 1 - I - 0x01ACF1 06:ACE1: 24        .byte $24   ; 
- D 1 - I - 0x01ACF2 06:ACE2: 0F        .byte $0F   ; 
- D 1 - I - 0x01ACF3 06:ACE3: 24        .byte $24   ; 
- D 1 - I - 0x01ACF4 06:ACE4: 0F        .byte $0F   ; 
- D 1 - I - 0x01ACF5 06:ACE5: 40        .byte $40   ; 
- D 1 - I - 0x01ACF6 06:ACE6: 04        .byte $04   ; 
- D 1 - I - 0x01ACF7 06:ACE7: A0        .byte $A0   ; 
- D 1 - I - 0x01ACF8 06:ACE8: 04        .byte $04   ; 
- D 1 - I - 0x01ACF9 06:ACE9: A2        .byte $A2   ; 
- D 1 - I - 0x01ACFA 06:ACEA: 05        .byte $05   ; 
- D 1 - I - 0x01ACFB 06:ACEB: 82        .byte $82   ; 
- D 1 - I - 0x01ACFC 06:ACEC: 05        .byte $05   ; 
- D 1 - I - 0x01ACFD 06:ACED: 82        .byte $82   ; 
- D 1 - I - 0x01ACFE 06:ACEE: 05        .byte $05   ; 
- D 1 - I - 0x01ACFF 06:ACEF: 82        .byte $82   ; 
- D 1 - I - 0x01AD00 06:ACF0: 05        .byte $05   ; 
- D 1 - I - 0x01AD01 06:ACF1: 80        .byte $80   ; 
- D 1 - I - 0x01AD02 06:ACF2: 05        .byte $05   ; 
- - - - - - 0x01AD03 06:ACF3: 80        .byte $80   ; 
- - - - - - 0x01AD04 06:ACF4: 05        .byte $05   ; 
- D 1 - I - 0x01AD05 06:ACF5: C2        .byte $C2   ; 
- D 1 - I - 0x01AD06 06:ACF6: 05        .byte $05   ; 
- D 1 - I - 0x01AD07 06:ACF7: C2        .byte $C2   ; 
- D 1 - I - 0x01AD08 06:ACF8: 05        .byte $05   ; 
- D 1 - I - 0x01AD09 06:ACF9: C0        .byte $C0   ; 
- D 1 - I - 0x01AD0A 06:ACFA: 05        .byte $05   ; 
- D 1 - I - 0x01AD0B 06:ACFB: C0        .byte $C0   ; 
- D 1 - I - 0x01AD0C 06:ACFC: 05        .byte $05   ; 
- D 1 - I - 0x01AD0D 06:ACFD: 80        .byte $80   ; 
- D 1 - I - 0x01AD0E 06:ACFE: 05        .byte $05   ; 
- D 1 - I - 0x01AD0F 06:ACFF: A4        .byte $A4   ; 
- D 1 - I - 0x01AD10 06:AD00: 0F        .byte $0F   ; 
- D 1 - I - 0x01AD11 06:AD01: A4        .byte $A4   ; 
- D 1 - I - 0x01AD12 06:AD02: 0F        .byte $0F   ; 
- D 1 - I - 0x01AD13 06:AD03: A0        .byte $A0   ; 
- D 1 - I - 0x01AD14 06:AD04: 05        .byte $05   ; 
- D 1 - I - 0x01AD15 06:AD05: A0        .byte $A0   ; 
- D 1 - I - 0x01AD16 06:AD06: 05        .byte $05   ; 
- D 1 - I - 0x01AD17 06:AD07: A0        .byte $A0   ; 
- - - - - - 0x01AD18 06:AD08: 07        .byte $07   ; 
- D 1 - I - 0x01AD19 06:AD09: A0        .byte $A0   ; 
- D 1 - I - 0x01AD1A 06:AD0A: 05        .byte $05   ; 
- D 1 - I - 0x01AD1B 06:AD0B: 80        .byte $80   ; 
- D 1 - I - 0x01AD1C 06:AD0C: 05        .byte $05   ; 
- D 1 - I - 0x01AD1D 06:AD0D: 83        .byte $83   ; 
- - - - - - 0x01AD1E 06:AD0E: 05        .byte $05   ; 
- - - - - - 0x01AD1F 06:AD0F: A0        .byte $A0   ; 
- - - - - - 0x01AD20 06:AD10: 04        .byte $04   ; 
- D 1 - I - 0x01AD21 06:AD11: A0        .byte $A0   ; 
- D 1 - I - 0x01AD22 06:AD12: 07        .byte $07   ; 
- D 1 - I - 0x01AD23 06:AD13: 82        .byte $82   ; 
- D 1 - I - 0x01AD24 06:AD14: 05        .byte $05   ; 
- D 1 - I - 0x01AD25 06:AD15: 83        .byte $83   ; 
- D 1 - I - 0x01AD26 06:AD16: 05        .byte $05   ; 
- D 1 - I - 0x01AD27 06:AD17: A0        .byte $A0   ; 
- D 1 - I - 0x01AD28 06:AD18: 05        .byte $05   ; 
- D 1 - I - 0x01AD29 06:AD19: 82        .byte $82   ; 
- D 1 - I - 0x01AD2A 06:AD1A: 05        .byte $05   ; 
- D 1 - I - 0x01AD2B 06:AD1B: A0        .byte $A0   ; 
- D 1 - I - 0x01AD2C 06:AD1C: 05        .byte $05   ; 
- D 1 - I - 0x01AD2D 06:AD1D: 82        .byte $82   ; 
- D 1 - I - 0x01AD2E 06:AD1E: 05        .byte $05   ; 
- D 1 - I - 0x01AD2F 06:AD1F: A0        .byte $A0   ; 
- D 1 - I - 0x01AD30 06:AD20: 05        .byte $05   ; 
- D 1 - I - 0x01AD31 06:AD21: 82        .byte $82   ; 
- D 1 - I - 0x01AD32 06:AD22: 05        .byte $05   ; 
- D 1 - I - 0x01AD33 06:AD23: A0        .byte $A0   ; 
- D 1 - I - 0x01AD34 06:AD24: 05        .byte $05   ; 
- D 1 - I - 0x01AD35 06:AD25: 82        .byte $82   ; 
- D 1 - I - 0x01AD36 06:AD26: 05        .byte $05   ; 
- D 1 - I - 0x01AD37 06:AD27: A0        .byte $A0   ; 
- D 1 - I - 0x01AD38 06:AD28: 05        .byte $05   ; 
- D 1 - I - 0x01AD39 06:AD29: A0        .byte $A0   ; 
- D 1 - I - 0x01AD3A 06:AD2A: 05        .byte $05   ; 
- D 1 - I - 0x01AD3B 06:AD2B: A0        .byte $A0   ; 
- D 1 - I - 0x01AD3C 06:AD2C: 04        .byte $04   ; 
- D 1 - I - 0x01AD3D 06:AD2D: A0        .byte $A0   ; 
- D 1 - I - 0x01AD3E 06:AD2E: 05        .byte $05   ; 
- D 1 - I - 0x01AD3F 06:AD2F: A0        .byte $A0   ; 
- D 1 - I - 0x01AD40 06:AD30: 06        .byte $06   ; 
- - - - - - 0x01AD41 06:AD31: A4        .byte $A4   ; 
- - - - - - 0x01AD42 06:AD32: 0F        .byte $0F   ; 
- D 1 - I - 0x01AD43 06:AD33: A0        .byte $A0   ; 
- - - - - - 0x01AD44 06:AD34: 04        .byte $04   ; 
- D 1 - I - 0x01AD45 06:AD35: A0        .byte $A0   ; 
- D 1 - I - 0x01AD46 06:AD36: 04        .byte $04   ; 
- D 1 - I - 0x01AD47 06:AD37: 80        .byte $80   ; 
- D 1 - I - 0x01AD48 06:AD38: 05        .byte $05   ; 
- D 1 - I - 0x01AD49 06:AD39: A4        .byte $A4   ; 
- D 1 - I - 0x01AD4A 06:AD3A: 0F        .byte $0F   ; 
- D 1 - I - 0x01AD4B 06:AD3B: A4        .byte $A4   ; 
- D 1 - I - 0x01AD4C 06:AD3C: 0F        .byte $0F   ; 
- D 1 - I - 0x01AD4D 06:AD3D: A8        .byte $A8   ; 
- D 1 - I - 0x01AD4E 06:AD3E: 04        .byte $04   ; 
- D 1 - I - 0x01AD4F 06:AD3F: A0        .byte $A0   ; 
- D 1 - I - 0x01AD50 06:AD40: 05        .byte $05   ; 



sub_AD41:
C - - - - - 0x01AD51 06:AD41: 84 1D     STY ram_001D
C - - - - - 0x01AD53 06:AD43: A9 00     LDA #$00
C - - - - - 0x01AD55 06:AD45: 85 1C     STA ram_001C
C - - - - - 0x01AD57 06:AD47: C0 0A     CPY #$0A
C - - - - - 0x01AD59 06:AD49: 90 07     BCC bra_AD52
C - - - - - 0x01AD5B 06:AD4B: B9 7C 06  LDA ram_067C,Y
C - - - - - 0x01AD5E 06:AD4E: 30 02     BMI bra_AD52
C - - - - - 0x01AD60 06:AD50: E6 1C     INC ram_001C
bra_AD52:
C - - - - - 0x01AD62 06:AD52: B9 59 04  LDA ram_movement_id_player,Y
C - - - - - 0x01AD65 06:AD55: 0A        ASL
C - - - - - 0x01AD66 06:AD56: 18        CLC
C - - - - - 0x01AD67 06:AD57: 65 1C     ADC ram_001C
C - - - - - 0x01AD69 06:AD59: A8        TAY
C - - - - - 0x01AD6A 06:AD5A: B9 97 B0  LDA tbl_B097,Y
C - - - - - 0x01AD6D 06:AD5D: 30 13     BMI bra_AD72_RTS
C - - - - - 0x01AD6F 06:AD5F: 20 8F EC  JSR sub_0x01EC9F_jump_to_pointers_afetr_JSR
- D 1 - I - 0x01AD72 06:AD62: 73 AD     .word ofs_AD73_00
- D 1 - I - 0x01AD74 06:AD64: 73 AD     .word ofs_AD73_01
- D 1 - I - 0x01AD76 06:AD66: 98 AD     .word ofs_AD98_02
- D 1 - I - 0x01AD78 06:AD68: AA AD     .word ofs_ADAA_03
- D 1 - I - 0x01AD7A 06:AD6A: BC AD     .word ofs_ADBC_04
- D 1 - I - 0x01AD7C 06:AD6C: C9 AD     .word ofs_ADC9_05
- D 1 - I - 0x01AD7E 06:AD6E: AA AE     .word ofs_AEAA_06
- D 1 - I - 0x01AD80 06:AD70: 36 AF     .word ofs_AF36_07


; bzk переместить
bra_AD72_RTS:
C D 1 - - - 0x01AD82 06:AD72: 60        RTS



ofs_AD73_00:
ofs_AD73_01:
C - - J - - 0x01AD83 06:AD73: AD 10 05  LDA ram_подтип_супера
C - - - - - 0x01AD86 06:AD76: D0 FA     BNE bra_AD72_RTS
C - - - - - 0x01AD88 06:AD78: AD C9 04  LDA ram_timer_action_ball
C - - - - - 0x01AD8B 06:AD7B: F0 07     BEQ bra_AD84
C - - - - - 0x01AD8D 06:AD7D: A4 1D     LDY ram_001D
C - - - - - 0x01AD8F 06:AD7F: CC D6 04  CPY ram_игрок_с_мячом
C - - - - - 0x01AD92 06:AD82: F0 EE     BEQ bra_AD72_RTS
bra_AD84:
C - - - - - 0x01AD94 06:AD84: A4 1D     LDY ram_001D
C - - - - - 0x01AD96 06:AD86: 8C D6 04  STY ram_игрок_с_мячом
C - - - - - 0x01AD99 06:AD89: A9 05     LDA #$05
loc_AD8B:
C D 1 - - - 0x01AD9B 06:AD8B: 8D 65 04  STA ram_movement_id_ball
C - - - - - 0x01AD9E 06:AD8E: A8        TAY
C - - - - - 0x01AD9F 06:AD8F: B9 4D AC  LDA tbl_AC4D_состояние_мяча,Y
C - - - - - 0x01ADA2 06:AD92: 8D 92 04  STA ram_мяч_состояние
C - - - - - 0x01ADA5 06:AD95: 4C 72 AD  RTS



ofs_AD98_02:
C - - J - - 0x01ADA8 06:AD98: A9 20     LDA #con_sfx_pass_w_foot
C - - - - - 0x01ADAA 06:AD9A: 20 E4 C2  JSR sub_0x01C2F4_play_sound
C - - - - - 0x01ADAD 06:AD9D: A4 1D     LDY ram_001D
C - - - - - 0x01ADAF 06:AD9F: 20 63 AF  JSR sub_AF63
C - - - - - 0x01ADB2 06:ADA2: 8C D6 04  STY ram_игрок_с_мячом
C - - - - - 0x01ADB5 06:ADA5: A9 04     LDA #$04
C - - - - - 0x01ADB7 06:ADA7: 4C 8B AD  JMP loc_AD8B



ofs_ADAA_03:
C - - J - - 0x01ADBA 06:ADAA: A9 23     LDA #con_sfx_recieve_ball
C - - - - - 0x01ADBC 06:ADAC: 20 E4 C2  JSR sub_0x01C2F4_play_sound
C - - - - - 0x01ADBF 06:ADAF: A4 1D     LDY ram_001D
C - - - - - 0x01ADC1 06:ADB1: 20 63 AF  JSR sub_AF63
C - - - - - 0x01ADC4 06:ADB4: 8C D6 04  STY ram_игрок_с_мячом
C - - - - - 0x01ADC7 06:ADB7: A9 0A     LDA #$0A
C - - - - - 0x01ADC9 06:ADB9: 4C 8B AD  JMP loc_AD8B



ofs_ADBC_04:
C - - J - - 0x01ADCC 06:ADBC: A4 1D     LDY ram_001D
C - - - - - 0x01ADCE 06:ADBE: 20 63 AF  JSR sub_AF63
C - - - - - 0x01ADD1 06:ADC1: 8C D6 04  STY ram_игрок_с_мячом
C - - - - - 0x01ADD4 06:ADC4: A9 0C     LDA #$0C
C - - - - - 0x01ADD6 06:ADC6: 4C 8B AD  JMP loc_AD8B



ofs_ADC9_05:
C - - J - - 0x01ADD9 06:ADC9: 20 50 AF  JSR sub_AF50
C - - - - - 0x01ADDC 06:ADCC: A4 1D     LDY ram_001D
C - - - - - 0x01ADDE 06:ADCE: 20 63 AF  JSR sub_AF63
C - - - - - 0x01ADE1 06:ADD1: AD 65 04  LDA ram_movement_id_ball
C - - - - - 0x01ADE4 06:ADD4: 29 7F     AND #$7F
C - - - - - 0x01ADE6 06:ADD6: C9 09     CMP #$09
C - - - - - 0x01ADE8 06:ADD8: F0 11     BEQ bra_ADEB_RTS
C - - - - - 0x01ADEA 06:ADDA: C9 0A     CMP #$0A
C - - - - - 0x01ADEC 06:ADDC: F0 17     BEQ bra_ADF5
C - - - - - 0x01ADEE 06:ADDE: C9 03     CMP #$03
C - - - - - 0x01ADF0 06:ADE0: F0 0C     BEQ bra_ADEE
C - - - - - 0x01ADF2 06:ADE2: C9 15     CMP #$15
C - - - - - 0x01ADF4 06:ADE4: D0 28     BNE bra_AE0E
C - - - - - 0x01ADF6 06:ADE6: B9 86 04  LDA ram_игрок_состояние,Y
C - - - - - 0x01ADF9 06:ADE9: 30 23     BMI bra_AE0E
bra_ADEB_RTS:
C - - - - - 0x01ADFB 06:ADEB: 4C 72 AD  RTS
bra_ADEE:
C - - - - - 0x01ADFE 06:ADEE: CC D6 04  CPY ram_игрок_с_мячом
C - - - - - 0x01AE01 06:ADF1: D0 1B     BNE bra_AE0E
C - - - - - 0x01AE03 06:ADF3: F0 F6     BEQ bra_ADEB_RTS
bra_ADF5:
C - - - - - 0x01AE05 06:ADF5: B9 59 04  LDA ram_movement_id_player,Y
C - - - - - 0x01AE08 06:ADF8: 29 7F     AND #$7F
C - - - - - 0x01AE0A 06:ADFA: C9 20     CMP #$20
C - - - - - 0x01AE0C 06:ADFC: F0 10     BEQ bra_AE0E
C - - - - - 0x01AE0E 06:ADFE: C9 21     CMP #$21
C - - - - - 0x01AE10 06:AE00: F0 0C     BEQ bra_AE0E
C - - - - - 0x01AE12 06:AE02: C9 1D     CMP #$1D
C - - - - - 0x01AE14 06:AE04: F0 08     BEQ bra_AE0E
C - - - - - 0x01AE16 06:AE06: B9 86 04  LDA ram_игрок_состояние,Y
C - - - - - 0x01AE19 06:AE09: 30 03     BMI bra_AE0E
C - - - - - 0x01AE1B 06:AE0B: 4C 72 AD  RTS
bra_AE0E:
C - - - - - 0x01AE1E 06:AE0E: 8C D6 04  STY ram_игрок_с_мячом
C - - - - - 0x01AE21 06:AE11: B9 86 04  LDA ram_игрок_состояние,Y
C - - - - - 0x01AE24 06:AE14: 10 2A     BPL bra_AE40
C - - - - - 0x01AE26 06:AE16: AD 92 04  LDA ram_мяч_состояние
C - - - - - 0x01AE29 06:AE19: 30 1F     BMI bra_AE3A
C - - - - - 0x01AE2B 06:AE1B: B9 2E 04  LDA ram_spd_Z_hi_player,Y
C - - - - - 0x01AE2E 06:AE1E: 10 1A     BPL bra_AE3A
C - - - - - 0x01AE30 06:AE20: A9 43     LDA #con_sfx_land_on_ball
C - - - - - 0x01AE32 06:AE22: 20 E4 C2  JSR sub_0x01C2F4_play_sound
C - - - - - 0x01AE35 06:AE25: A9 02     LDA #$02
C - - - - - 0x01AE37 06:AE27: 20 7B B0  JSR sub_B07B
C - - - - - 0x01AE3A 06:AE2A: A5 5C     LDA ram_flag_gameplay
C - - - - - 0x01AE3C 06:AE2C: 29 40     AND #$40
C - - - - - 0x01AE3E 06:AE2E: F0 05     BEQ bra_AE35
C - - - - - 0x01AE40 06:AE30: A9 11     LDA #$11
C - - - - - 0x01AE42 06:AE32: 4C 8B AD  JMP loc_AD8B
bra_AE35:
C - - - - - 0x01AE45 06:AE35: A9 12     LDA #$12
C - - - - - 0x01AE47 06:AE37: 4C 8B AD  JMP loc_AD8B
bra_AE3A:
C - - - - - 0x01AE4A 06:AE3A: 20 5D B0  JSR sub_B05D
C - - - - - 0x01AE4D 06:AE3D: 4C 87 AE  JMP loc_AE87
bra_AE40:
C - - - - - 0x01AE50 06:AE40: AD 0D 05  LDA ram_timer_wet_ball
C - - - - - 0x01AE53 06:AE43: 10 18     BPL bra_AE5D
C - - - - - 0x01AE55 06:AE45: B9 59 04  LDA ram_movement_id_player,Y
C - - - - - 0x01AE58 06:AE48: 29 7F     AND #$7F
C - - - - - 0x01AE5A 06:AE4A: C9 20     CMP #$20
C - - - - - 0x01AE5C 06:AE4C: F0 27     BEQ bra_AE75
C - - - - - 0x01AE5E 06:AE4E: C9 21     CMP #$21
C - - - - - 0x01AE60 06:AE50: F0 23     BEQ bra_AE75
C - - - - - 0x01AE62 06:AE52: C9 1D     CMP #$1D
C - - - - - 0x01AE64 06:AE54: F0 1F     BEQ bra_AE75
C - - - - - 0x01AE66 06:AE56: C9 01     CMP #$01
C - - - - - 0x01AE68 06:AE58: F0 18     BEQ bra_AE72
C - - - - - 0x01AE6A 06:AE5A: 4C 75 AE  JMP loc_AE75
bra_AE5D:
C - - - - - 0x01AE6D 06:AE5D: B9 59 04  LDA ram_movement_id_player,Y
C - - - - - 0x01AE70 06:AE60: 29 7F     AND #$7F
C - - - - - 0x01AE72 06:AE62: C9 20     CMP #$20
C - - - - - 0x01AE74 06:AE64: F0 0F     BEQ bra_AE75
C - - - - - 0x01AE76 06:AE66: C9 21     CMP #$21
C - - - - - 0x01AE78 06:AE68: F0 27     BEQ bra_AE91
C - - - - - 0x01AE7A 06:AE6A: C9 1D     CMP #$1D
C - - - - - 0x01AE7C 06:AE6C: F0 23     BEQ bra_AE91
C - - - - - 0x01AE7E 06:AE6E: C9 01     CMP #$01
C - - - - - 0x01AE80 06:AE70: D0 03     BNE bra_AE75
bra_AE72:
C - - - - - 0x01AE82 06:AE72: 20 44 B0  JSR sub_B044
bra_AE75:
loc_AE75:
C D 1 - - - 0x01AE85 06:AE75: BD 86 03  LDA ram_pos_Z_lo_player,X
C - - - - - 0x01AE88 06:AE78: D0 05     BNE bra_AE7F
bra_AE7A:
C - - - - - 0x01AE8A 06:AE7A: A9 03     LDA #$03
C - - - - - 0x01AE8C 06:AE7C: 4C 8B AD  JMP loc_AD8B
bra_AE7F:
C - - - - - 0x01AE8F 06:AE7F: 20 5D B0  JSR sub_B05D
C - - - - - 0x01AE92 06:AE82: A9 0B     LDA #$0B
C - - - - - 0x01AE94 06:AE84: 20 7B B0  JSR sub_B07B
loc_AE87:
C D 1 - - - 0x01AE97 06:AE87: A9 23     LDA #con_sfx_recieve_ball
C - - - - - 0x01AE99 06:AE89: 20 E4 C2  JSR sub_0x01C2F4_play_sound
C - - - - - 0x01AE9C 06:AE8C: A9 09     LDA #$09
C - - - - - 0x01AE9E 06:AE8E: 4C 8B AD  JMP loc_AD8B
bra_AE91:
C - - - - - 0x01AEA1 06:AE91: BD 86 03  LDA ram_pos_Z_lo_player,X
C - - - - - 0x01AEA4 06:AE94: 30 E4     BMI bra_AE7A
C - - - - - 0x01AEA6 06:AE96: F0 E2     BEQ bra_AE7A
C - - - - - 0x01AEA8 06:AE98: 20 5D B0  JSR sub_B05D
C - - - - - 0x01AEAB 06:AE9B: A9 23     LDA #con_sfx_recieve_ball
C - - - - - 0x01AEAD 06:AE9D: 20 E4 C2  JSR sub_0x01C2F4_play_sound
C - - - - - 0x01AEB0 06:AEA0: A9 26     LDA #$26
C - - - - - 0x01AEB2 06:AEA2: 20 7B B0  JSR sub_B07B
C - - - - - 0x01AEB5 06:AEA5: A9 15     LDA #$15
C - - - - - 0x01AEB7 06:AEA7: 4C 8B AD  JMP loc_AD8B



ofs_AEAA_06:
C - - J - - 0x01AEBA 06:AEAA: A4 1D     LDY ram_001D
C - - - - - 0x01AEBC 06:AEAC: 20 63 AF  JSR sub_AF63
C - - - - - 0x01AEBF 06:AEAF: 8C D6 04  STY ram_игрок_с_мячом
C - - - - - 0x01AEC2 06:AEB2: 20 50 AF  JSR sub_AF50
C - - - - - 0x01AEC5 06:AEB5: A5 5C     LDA ram_flag_gameplay
C - - - - - 0x01AEC7 06:AEB7: 29 40     AND #$40
C - - - - - 0x01AEC9 06:AEB9: F0 03     BEQ bra_AEBE
C - - - - - 0x01AECB 06:AEBB: 4C 72 AD  RTS
bra_AEBE:
C - - - - - 0x01AECE 06:AEBE: A9 26     LDA #con_sfx_catch_punch
C - - - - - 0x01AED0 06:AEC0: 20 E4 C2  JSR sub_0x01C2F4_play_sound
C - - - - - 0x01AED3 06:AEC3: A4 1D     LDY ram_001D
C - - - - - 0x01AED5 06:AEC5: 8C D6 04  STY ram_игрок_с_мячом
C - - - - - 0x01AED8 06:AEC8: 20 5D B0  JSR sub_B05D
C - - - - - 0x01AEDB 06:AECB: AD F0 04  LDA ram_hp_ball
C - - - - - 0x01AEDE 06:AECE: F0 10     BEQ bra_AEE0
C - - - - - 0x01AEE0 06:AED0: A4 1D     LDY ram_001D
C - - - - - 0x01AEE2 06:AED2: B9 FD 04  LDA ram_защита_поведение,Y
C - - - - - 0x01AEE5 06:AED5: 29 03     AND #$03
C - - - - - 0x01AEE7 06:AED7: A8        TAY
C - - - - - 0x01AEE8 06:AED8: 20 35 EE  JSR sub_0x01EE45_вращение_рандома
C - - - - - 0x01AEEB 06:AEDB: D9 40 B0  CMP tbl_B040,Y
C - - - - - 0x01AEEE 06:AEDE: 90 45     BCC bra_AF25
bra_AEE0:
C - - - - - 0x01AEF0 06:AEE0: AD 92 04  LDA ram_мяч_состояние
C - - - - - 0x01AEF3 06:AEE3: 09 40     ORA #$40
C - - - - - 0x01AEF5 06:AEE5: 8D 92 04  STA ram_мяч_состояние
C - - - - - 0x01AEF8 06:AEE8: A5 57     LDA ram_option_mode_difficulty
C - - - - - 0x01AEFA 06:AEEA: 29 20     AND #con_gm_penalty
C - - - - - 0x01AEFC 06:AEEC: F0 04     BEQ bra_AEF2_не_пенальти
C - - - - - 0x01AEFE 06:AEEE: A9 40     LDA #con_gp_time_up
C - - - - - 0x01AF00 06:AEF0: 85 5C     STA ram_flag_gameplay
bra_AEF2_не_пенальти:
C - - - - - 0x01AF02 06:AEF2: A4 1D     LDY ram_001D
C - - - - - 0x01AF04 06:AEF4: B9 86 04  LDA ram_игрок_состояние,Y
C - - - - - 0x01AF07 06:AEF7: 10 0D     BPL bra_AF06
C - - - - - 0x01AF09 06:AEF9: B9 59 04  LDA ram_movement_id_player,Y
C - - - - - 0x01AF0C 06:AEFC: 29 7F     AND #$7F
C - - - - - 0x01AF0E 06:AEFE: C9 3F     CMP #$3F
C - - - - - 0x01AF10 06:AF00: F0 12     BEQ bra_AF14
C - - - - - 0x01AF12 06:AF02: A9 40     LDA #$40
C - - - - - 0x01AF14 06:AF04: D0 0B     BNE bra_AF11
bra_AF06:
C - - - - - 0x01AF16 06:AF06: B9 59 04  LDA ram_movement_id_player,Y
C - - - - - 0x01AF19 06:AF09: 29 7F     AND #$7F
C - - - - - 0x01AF1B 06:AF0B: C9 29     CMP #$29
C - - - - - 0x01AF1D 06:AF0D: F0 05     BEQ bra_AF14
C - - - - - 0x01AF1F 06:AF0F: A9 0C     LDA #$0C
bra_AF11:
C - - - - - 0x01AF21 06:AF11: 20 7B B0  JSR sub_B07B
bra_AF14:
C - - - - - 0x01AF24 06:AF14: A9 40     LDA #$40
C - - - - - 0x01AF26 06:AF16: 8D 92 04  STA ram_мяч_состояние
C - - - - - 0x01AF29 06:AF19: A4 1D     LDY ram_001D
C - - - - - 0x01AF2B 06:AF1B: A9 02     LDA #$02
C - - - - - 0x01AF2D 06:AF1D: 20 D7 A2  JSR sub_A2D7
C - - - - - 0x01AF30 06:AF20: A9 0F     LDA #$0F
C - - - - - 0x01AF32 06:AF22: 4C 8B AD  JMP loc_AD8B
bra_AF25:
C - - - - - 0x01AF35 06:AF25: A4 1D     LDY ram_001D
C - - - - - 0x01AF37 06:AF27: B9 86 04  LDA ram_игрок_состояние,Y
C - - - - - 0x01AF3A 06:AF2A: 30 05     BMI bra_AF31
C - - - - - 0x01AF3C 06:AF2C: A9 11     LDA #$11
C - - - - - 0x01AF3E 06:AF2E: 20 7B B0  JSR sub_B07B
bra_AF31:
C - - - - - 0x01AF41 06:AF31: A9 17     LDA #$17
C - - - - - 0x01AF43 06:AF33: 4C 8B AD  JMP loc_AD8B



ofs_AF36_07:
C - - J - - 0x01AF46 06:AF36: A4 1D     LDY ram_001D
C - - - - - 0x01AF48 06:AF38: BD F6 03  LDA ram_spd_X_hi_player,X
C - - - - - 0x01AF4B 06:AF3B: 59 A3 04  EOR ram_направление_движения,Y
C - - - - - 0x01AF4E 06:AF3E: 30 03     BMI bra_AF43
C - - - - - 0x01AF50 06:AF40: 4C 72 AD  RTS
bra_AF43:
C - - - - - 0x01AF53 06:AF43: 8C D6 04  STY ram_игрок_с_мячом
C - - - - - 0x01AF56 06:AF46: A9 26     LDA #con_sfx_catch_punch
C - - - - - 0x01AF58 06:AF48: 20 E4 C2  JSR sub_0x01C2F4_play_sound
C - - - - - 0x01AF5B 06:AF4B: A9 10     LDA #$10
C - - - - - 0x01AF5D 06:AF4D: 4C 8B AD  JMP loc_AD8B



sub_AF50:
C - - - - - 0x01AF60 06:AF50: A5 5C     LDA ram_flag_gameplay
C - - - - - 0x01AF62 06:AF52: 29 0C     AND #$0C
C - - - - - 0x01AF64 06:AF54: F0 0C     BEQ bra_AF62_RTS
C - - - - - 0x01AF66 06:AF56: 68        PLA
C - - - - - 0x01AF67 06:AF57: 68        PLA
C - - - - - 0x01AF68 06:AF58: A5 1D     LDA ram_001D
C - - - - - 0x01AF6A 06:AF5A: 8D D6 04  STA ram_игрок_с_мячом
C - - - - - 0x01AF6D 06:AF5D: A9 13     LDA #$13
C - - - - - 0x01AF6F 06:AF5F: 4C 8B AD  JMP loc_AD8B
bra_AF62_RTS:
C - - - - - 0x01AF72 06:AF62: 60        RTS



sub_AF63:
C - - - - - 0x01AF73 06:AF63: AD 25 05  LDA ram_timer_electric_ball
C - - - - - 0x01AF76 06:AF66: F0 12     BEQ bra_AF7A    ; если не наэлектризован
C - - - - - 0x01AF78 06:AF68: AD 92 04  LDA ram_мяч_состояние
C - - - - - 0x01AF7B 06:AF6B: 10 0D     BPL bra_AF7A
C - - - - - 0x01AF7D 06:AF6D: AD F0 04  LDA ram_hp_ball
C - - - - - 0x01AF80 06:AF70: 0D C9 04  ORA ram_timer_action_ball
C - - - - - 0x01AF83 06:AF73: D0 10     BNE bra_AF85
C - - - - - 0x01AF85 06:AF75: A0 03     LDY #$03
C - - - - - 0x01AF87 06:AF77: 4C 9C AF  JMP loc_AF9C
bra_AF7A:
C - - - - - 0x01AF8A 06:AF7A: AD F0 04  LDA ram_hp_ball
C - - - - - 0x01AF8D 06:AF7D: 0D C9 04  ORA ram_timer_action_ball
C - - - - - 0x01AF90 06:AF80: D0 03     BNE bra_AF85
C - - - - - 0x01AF92 06:AF82: 4C 2F B0  RTS
bra_AF85:
C - - - - - 0x01AF95 06:AF85: A4 1D     LDY ram_001D
C - - - - - 0x01AF97 06:AF87: CC D6 04  CPY ram_игрок_с_мячом
C - - - - - 0x01AF9A 06:AF8A: D0 03     BNE bra_AF8F
C - - - - - 0x01AF9C 06:AF8C: 4C 2A B0  JMP loc_B02A
bra_AF8F:
C - - - - - 0x01AF9F 06:AF8F: A0 00     LDY #$00
C - - - - - 0x01AFA1 06:AF91: AD 10 05  LDA ram_подтип_супера
C - - - - - 0x01AFA4 06:AF94: F0 06     BEQ bra_AF9C
C - - - - - 0x01AFA6 06:AF96: C8        INY
C - - - - - 0x01AFA7 06:AF97: C9 04     CMP #$04
C - - - - - 0x01AFA9 06:AF99: 90 01     BCC bra_AF9C
C - - - - - 0x01AFAB 06:AF9B: C8        INY
bra_AF9C:
loc_AF9C:
C D 1 - - - 0x01AFAC 06:AF9C: 84 1E     STY ram_001E
C - - - - - 0x01AFAE 06:AF9E: 98        TYA
C - - - - - 0x01AFAF 06:AF9F: 0A        ASL
C - - - - - 0x01AFB0 06:AFA0: 65 1E     ADC ram_001E
C - - - - - 0x01AFB2 06:AFA2: 85 1E     STA ram_001E
C - - - - - 0x01AFB4 06:AFA4: A8        TAY
C - - - - - 0x01AFB5 06:AFA5: B9 30 B0  LDA tbl_B030,Y
C - - - - - 0x01AFB8 06:AFA8: 2C 0D 05  BIT ram_timer_wet_ball
C - - - - - 0x01AFBB 06:AFAB: 10 03     BPL bra_AFB0
C - - - - - 0x01AFBD 06:AFAD: 18        CLC
C - - - - - 0x01AFBE 06:AFAE: 69 01     ADC #$01
bra_AFB0:
C - - - - - 0x01AFC0 06:AFB0: 84 1E     STY ram_001E
C - - - - - 0x01AFC2 06:AFB2: AC 25 05  LDY ram_timer_electric_ball
C - - - - - 0x01AFC5 06:AFB5: F0 06     BEQ bra_AFBD
C - - - - - 0x01AFC7 06:AFB7: A0 09     LDY #$09
C - - - - - 0x01AFC9 06:AFB9: 84 1E     STY ram_001E
C - - - - - 0x01AFCB 06:AFBB: 69 01     ADC #$01
bra_AFBD:
C - - - - - 0x01AFCD 06:AFBD: A4 1D     LDY ram_001D
C - - - - - 0x01AFCF 06:AFBF: 20 A5 9E  JSR sub_9EA5
C - - - - - 0x01AFD2 06:AFC2: A9 08     LDA #$08
C - - - - - 0x01AFD4 06:AFC4: A0 0C     LDY #$0C
C - - - - - 0x01AFD6 06:AFC6: 20 A5 9E  JSR sub_9EA5
C - - - - - 0x01AFD9 06:AFC9: A4 1D     LDY ram_001D
C - - - - - 0x01AFDB 06:AFCB: B9 E4 04  LDA ram_hp_player,Y
C - - - - - 0x01AFDE 06:AFCE: C0 0A     CPY #$0A
C - - - - - 0x01AFE0 06:AFD0: 90 22     BCC bra_AFF4
C - - - - - 0x01AFE2 06:AFD2: B9 7C 06  LDA ram_067C,Y
C - - - - - 0x01AFE5 06:AFD5: 30 1D     BMI bra_AFF4
C - - - - - 0x01AFE7 06:AFD7: B9 FD 04  LDA ram_защита_поведение,Y
C - - - - - 0x01AFEA 06:AFDA: 29 03     AND #$03
C - - - - - 0x01AFEC 06:AFDC: A8        TAY
C - - - - - 0x01AFED 06:AFDD: 18        CLC
C - - - - - 0x01AFEE 06:AFDE: B9 3C B0  LDA tbl_B03C_defense,Y
C - - - - - 0x01AFF1 06:AFE1: A4 1D     LDY ram_001D
C - - - - - 0x01AFF3 06:AFE3: 79 E4 04  ADC ram_hp_player,Y
C - - - - - 0x01AFF6 06:AFE6: CD F0 04  CMP ram_hp_ball
C - - - - - 0x01AFF9 06:AFE9: B0 44     BCS bra_B02C_RTS
C - - - - - 0x01AFFB 06:AFEB: AD 00 03  LDA ram_frame_cnt
C - - - - - 0x01AFFE 06:AFEE: 29 01     AND #$01
C - - - - - 0x01B000 06:AFF0: F0 07     BEQ bra_AFF9
C - - - - - 0x01B002 06:AFF2: D0 10     BNE bra_B004
bra_AFF4:
C - - - - - 0x01B004 06:AFF4: CD F0 04  CMP ram_hp_ball
C - - - - - 0x01B007 06:AFF7: 90 0B     BCC bra_B004
bra_AFF9:
C - - - - - 0x01B009 06:AFF9: 20 56 98  JSR sub_9856
C - - - - - 0x01B00C 06:AFFC: A9 17     LDA #$17
C - - - - - 0x01B00E 06:AFFE: 8D 65 04  STA ram_movement_id_ball
C - - - - - 0x01B011 06:B001: 8C D6 04  STY ram_игрок_с_мячом
bra_B004:
C - - - - - 0x01B014 06:B004: A4 1E     LDY ram_001E
C - - - - - 0x01B016 06:B006: B9 32 B0  LDA tbl_B030 + 2,Y
C - - - - - 0x01B019 06:B009: 20 E4 C2  JSR sub_0x01C2F4_play_sound
C - - - - - 0x01B01C 06:B00C: B9 31 B0  LDA tbl_B030 + 1,Y
C - - - - - 0x01B01F 06:B00F: A4 1D     LDY ram_001D
C - - - - - 0x01B021 06:B011: 20 7B B0  JSR sub_B07B
C - - - - - 0x01B024 06:B014: B9 59 04  LDA ram_movement_id_player,Y
C - - - - - 0x01B027 06:B017: C9 06     CMP #$06
C - - - - - 0x01B029 06:B019: D0 0C     BNE bra_B027
C - - - - - 0x01B02B 06:B01B: AD F0 04  LDA ram_hp_ball
C - - - - - 0x01B02E 06:B01E: D0 0A     BNE bra_B02A
C - - - - - 0x01B030 06:B020: A9 10     LDA #$10
C - - - - - 0x01B032 06:B022: 8D 25 05  STA ram_timer_electric_ball
C - - - - - 0x01B035 06:B025: D0 03     BNE bra_B02A
bra_B027:
C - - - - - 0x01B037 06:B027: 20 8B 9E  JSR sub_9E8B
bra_B02A:
loc_B02A:
C D 1 - - - 0x01B03A 06:B02A: 68        PLA
C - - - - - 0x01B03B 06:B02B: 68        PLA
bra_B02C_RTS:
C - - - - - 0x01B03C 06:B02C: 4C 72 AD  RTS



tbl_B030:
- D 1 - - - 0x01B040 06:B030: 05        .byte $05   ; 
- D 1 - - - 0x01B041 06:B031: 3C        .byte $3C   ; 
- D 1 - - - 0x01B042 06:B032: 36        .byte con_sfx_убийство

- D 1 - - - 0x01B043 06:B033: 07        .byte $07   ; 
- D 1 - - - 0x01B044 06:B034: 59        .byte $59   ; 
- D 1 - - - 0x01B045 06:B035: 37        .byte con_sfx_прошибание

- D 1 - - - 0x01B046 06:B036: 09        .byte $09   ; 
- D 1 - - - 0x01B047 06:B037: 59        .byte $59   ; 
- D 1 - - - 0x01B048 06:B038: 37        .byte con_sfx_прошибание

- D 1 - - - 0x01B049 06:B039: 00        .byte $00   ; 
- D 1 - - - 0x01B04A 06:B03A: 06        .byte $06   ; 
- D 1 - - - 0x01B04B 06:B03B: 36        .byte con_sfx_убийство



tbl_B03C_defense:
- D 1 - - - 0x01B04C 06:B03C: 14        .byte $14   ; 
- D 1 - - - 0x01B04D 06:B03D: 0F        .byte $0F   ; 
- D 1 - - - 0x01B04E 06:B03E: 0C        .byte $0C   ; 
- D 1 - - - 0x01B04F 06:B03F: 08        .byte $08   ; 



tbl_B040:
- D 1 - - - 0x01B050 06:B040: 40        .byte $40   ; 
- D 1 - - - 0x01B051 06:B041: 50        .byte $50   ; 
- D 1 - - - 0x01B052 06:B042: 60        .byte $60   ; 
- D 1 - - - 0x01B053 06:B043: 70        .byte $70   ; 



sub_B044:
C - - - - - 0x01B054 06:B044: 38        SEC
C - - - - - 0x01B055 06:B045: AD 20 03  LDA ram_pos_X_lo_ball
C - - - - - 0x01B058 06:B048: F9 14 03  SBC ram_pos_X_lo_player,Y
C - - - - - 0x01B05B 06:B04B: AD 33 03  LDA ram_pos_X_hi_ball
C - - - - - 0x01B05E 06:B04E: F9 27 03  SBC ram_pos_X_hi_player,Y
C - - - - - 0x01B061 06:B051: 10 04     BPL bra_B057
C - - - - - 0x01B063 06:B053: A9 80     LDA #$80
C - - - - - 0x01B065 06:B055: D0 02     BNE bra_B059
bra_B057:
C - - - - - 0x01B067 06:B057: A9 00     LDA #$00
bra_B059:
C - - - - - 0x01B069 06:B059: 99 A3 04  STA ram_направление_движения,Y
C - - - - - 0x01B06C 06:B05C: 60        RTS



sub_B05D:
C - - - - - 0x01B06D 06:B05D: AD 0D 05  LDA ram_timer_wet_ball
C - - - - - 0x01B070 06:B060: 10 18     BPL bra_B07A
C - - - - - 0x01B072 06:B062: AD F4 03  LDA ram_spd_X_lo_ball
C - - - - - 0x01B075 06:B065: 99 E8 03  STA ram_spd_X_lo_player,Y
C - - - - - 0x01B078 06:B068: AD 02 04  LDA ram_spd_X_hi_ball
C - - - - - 0x01B07B 06:B06B: 99 F6 03  STA ram_spd_X_hi_player,Y
C - - - - - 0x01B07E 06:B06E: AD 10 04  LDA ram_spd_Y_lo_ball
C - - - - - 0x01B081 06:B071: 99 04 04  STA ram_spd_Y_lo_player,Y
C - - - - - 0x01B084 06:B074: AD 1E 04  LDA ram_spd_Y_hi_ball
C - - - - - 0x01B087 06:B077: 99 12 04  STA ram_spd_Y_hi_player,Y
bra_B07A:
C - - - - - 0x01B08A 06:B07A: 60        RTS
sub_B07B:
C - - - - - 0x01B08B 06:B07B: 85 1E     STA ram_001E
C - - - - - 0x01B08D 06:B07D: B9 59 04  LDA ram_movement_id_player,Y
C - - - - - 0x01B090 06:B080: 29 7F     AND #$7F
C - - - - - 0x01B092 06:B082: C5 1E     CMP ram_001E
C - - - - - 0x01B094 06:B084: F0 10     BEQ bra_B096_RTS
C - - - - - 0x01B096 06:B086: A5 1E     LDA ram_001E
C - - - - - 0x01B098 06:B088: 99 59 04  STA ram_movement_id_player,Y
C - - - - - 0x01B09B 06:B08B: A9 00     LDA #$00
C - - - - - 0x01B09D 06:B08D: 99 87 00  STA ram_animation_timer_player,Y
C - - - - - 0x01B0A0 06:B090: 99 94 00  STA ram_номер_кадра_анимации,Y
C - - - - - 0x01B0A3 06:B093: 99 6C 04  STA ram_animation_sub_id_player,Y
bra_B096_RTS:
C - - - - - 0x01B0A6 06:B096: 60        RTS



tbl_B097:
- - - - - - 0x01B0A7 06:B097: FF        .byte $FF   ; 
- - - - - - 0x01B0A8 06:B098: FF        .byte $FF   ; 
- D 1 - - - 0x01B0A9 06:B099: 05        .byte $05   ; 
- D 1 - - - 0x01B0AA 06:B09A: 06        .byte $06   ; 
- D 1 - - - 0x01B0AB 06:B09B: 05        .byte $05   ; 
- D 1 - - - 0x01B0AC 06:B09C: FF        .byte $FF   ; 
- D 1 - - - 0x01B0AD 06:B09D: 04        .byte $04   ; 
- - - - - - 0x01B0AE 06:B09E: FF        .byte $FF   ; 
- - - - - - 0x01B0AF 06:B09F: FF        .byte $FF   ; 
- - - - - - 0x01B0B0 06:B0A0: FF        .byte $FF   ; 
- - - - - - 0x01B0B1 06:B0A1: FF        .byte $FF   ; 
- - - - - - 0x01B0B2 06:B0A2: FF        .byte $FF   ; 
- - - - - - 0x01B0B3 06:B0A3: FF        .byte $FF   ; 
- - - - - - 0x01B0B4 06:B0A4: FF        .byte $FF   ; 
- D 1 - - - 0x01B0B5 06:B0A5: 00        .byte $00   ; 
- - - - - - 0x01B0B6 06:B0A6: FF        .byte $FF   ; 
- D 1 - - - 0x01B0B7 06:B0A7: 02        .byte $02   ; 
- D 1 - - - 0x01B0B8 06:B0A8: 02        .byte $02   ; 
- - - - - - 0x01B0B9 06:B0A9: FF        .byte $FF   ; 
- - - - - - 0x01B0BA 06:B0AA: FF        .byte $FF   ; 
- - - - - - 0x01B0BB 06:B0AB: FF        .byte $FF   ; 
- - - - - - 0x01B0BC 06:B0AC: FF        .byte $FF   ; 
- - - - - - 0x01B0BD 06:B0AD: FF        .byte $FF   ; 
- - - - - - 0x01B0BE 06:B0AE: FF        .byte $FF   ; 
- - - - - - 0x01B0BF 06:B0AF: FF        .byte $FF   ; 
- - - - - - 0x01B0C0 06:B0B0: 06        .byte $06   ; 
- D 1 - - - 0x01B0C1 06:B0B1: 03        .byte $03   ; 
- - - - - - 0x01B0C2 06:B0B2: FF        .byte $FF   ; 
- D 1 - - - 0x01B0C3 06:B0B3: FF        .byte $FF   ; 
- - - - - - 0x01B0C4 06:B0B4: FF        .byte $FF   ; 
- D 1 - - - 0x01B0C5 06:B0B5: 05        .byte $05   ; 
- D 1 - - - 0x01B0C6 06:B0B6: 06        .byte $06   ; 
- - - - - - 0x01B0C7 06:B0B7: FF        .byte $FF   ; 
- - - - - - 0x01B0C8 06:B0B8: FF        .byte $FF   ; 
- D 1 - - - 0x01B0C9 06:B0B9: 05        .byte $05   ; 
- D 1 - - - 0x01B0CA 06:B0BA: FF        .byte $FF   ; 
- - - - - - 0x01B0CB 06:B0BB: FF        .byte $FF   ; 
- - - - - - 0x01B0CC 06:B0BC: FF        .byte $FF   ; 
- - - - - - 0x01B0CD 06:B0BD: FF        .byte $FF   ; 
- - - - - - 0x01B0CE 06:B0BE: FF        .byte $FF   ; 
- - - - - - 0x01B0CF 06:B0BF: FF        .byte $FF   ; 
- - - - - - 0x01B0D0 06:B0C0: FF        .byte $FF   ; 
- - - - - - 0x01B0D1 06:B0C1: FF        .byte $FF   ; 
- - - - - - 0x01B0D2 06:B0C2: FF        .byte $FF   ; 
- - - - - - 0x01B0D3 06:B0C3: FF        .byte $FF   ; 
- - - - - - 0x01B0D4 06:B0C4: FF        .byte $FF   ; 
- - - - - - 0x01B0D5 06:B0C5: FF        .byte $FF   ; 
- - - - - - 0x01B0D6 06:B0C6: FF        .byte $FF   ; 
- - - - - - 0x01B0D7 06:B0C7: FF        .byte $FF   ; 
- - - - - - 0x01B0D8 06:B0C8: FF        .byte $FF   ; 
- - - - - - 0x01B0D9 06:B0C9: FF        .byte $FF   ; 
- - - - - - 0x01B0DA 06:B0CA: 07        .byte $07   ; 
- - - - - - 0x01B0DB 06:B0CB: FF        .byte $FF   ; 
- - - - - - 0x01B0DC 06:B0CC: FF        .byte $FF   ; 
- - - - - - 0x01B0DD 06:B0CD: FF        .byte $FF   ; 
- - - - - - 0x01B0DE 06:B0CE: FF        .byte $FF   ; 
- - - - - - 0x01B0DF 06:B0CF: FF        .byte $FF   ; 
- - - - - - 0x01B0E0 06:B0D0: FF        .byte $FF   ; 
- D 1 - - - 0x01B0E1 06:B0D1: 05        .byte $05   ; 
- - - - - - 0x01B0E2 06:B0D2: 06        .byte $06   ; 
- - - - - - 0x01B0E3 06:B0D3: FF        .byte $FF   ; 
- - - - - - 0x01B0E4 06:B0D4: FF        .byte $FF   ; 
- - - - - - 0x01B0E5 06:B0D5: FF        .byte $FF   ; 
- - - - - - 0x01B0E6 06:B0D6: FF        .byte $FF   ; 
- D 1 - - - 0x01B0E7 06:B0D7: 05        .byte $05   ; 
- D 1 - - - 0x01B0E8 06:B0D8: 06        .byte $06   ; 
- D 1 - - - 0x01B0E9 06:B0D9: 05        .byte $05   ; 
- D 1 - - - 0x01B0EA 06:B0DA: 06        .byte $06   ; 
- D 1 - - - 0x01B0EB 06:B0DB: FF        .byte $FF   ; 
- D 1 - - - 0x01B0EC 06:B0DC: 07        .byte $07   ; 
- D 1 - - - 0x01B0ED 06:B0DD: 05        .byte $05   ; 
- - - - - - 0x01B0EE 06:B0DE: FF        .byte $FF   ; 
- - - - - - 0x01B0EF 06:B0DF: FF        .byte $FF   ; 
- - - - - - 0x01B0F0 06:B0E0: FF        .byte $FF   ; 
- - - - - - 0x01B0F1 06:B0E1: FF        .byte $FF   ; 
- - - - - - 0x01B0F2 06:B0E2: FF        .byte $FF   ; 
- - - - - - 0x01B0F3 06:B0E3: FF        .byte $FF   ; 
- - - - - - 0x01B0F4 06:B0E4: FF        .byte $FF   ; 
- D 1 - - - 0x01B0F5 06:B0E5: 04        .byte $04   ; 
- - - - - - 0x01B0F6 06:B0E6: FF        .byte $FF   ; 
- - - - - - 0x01B0F7 06:B0E7: FF        .byte $FF   ; 
- D 1 - - - 0x01B0F8 06:B0E8: 07        .byte $07   ; 
- - - - - - 0x01B0F9 06:B0E9: FF        .byte $FF   ; 
- D 1 - - - 0x01B0FA 06:B0EA: 06        .byte $06   ; 
- D 1 - - - 0x01B0FB 06:B0EB: 04        .byte $04   ; 
- - - - - - 0x01B0FC 06:B0EC: FF        .byte $FF   ; 
- - - - - - 0x01B0FD 06:B0ED: FF        .byte $FF   ; 
- - - - - - 0x01B0FE 06:B0EE: 07        .byte $07   ; 
- - - - - - 0x01B0FF 06:B0EF: FF        .byte $FF   ; 
- - - - - - 0x01B100 06:B0F0: FF        .byte $FF   ; 
- - - - - - 0x01B101 06:B0F1: FF        .byte $FF   ; 
- - - - - - 0x01B102 06:B0F2: FF        .byte $FF   ; 
- - - - - - 0x01B103 06:B0F3: FF        .byte $FF   ; 
- - - - - - 0x01B104 06:B0F4: FF        .byte $FF   ; 
- - - - - - 0x01B105 06:B0F5: FF        .byte $FF   ; 
- - - - - - 0x01B106 06:B0F6: FF        .byte $FF   ; 
- D 1 - - - 0x01B107 06:B0F7: 05        .byte $05   ; 
- D 1 - - - 0x01B108 06:B0F8: 06        .byte $06   ; 
- D 1 - - - 0x01B109 06:B0F9: 01        .byte $01   ; 
- - - - - - 0x01B10A 06:B0FA: FF        .byte $FF   ; 
- D 1 - - - 0x01B10B 06:B0FB: 00        .byte $00   ; 
- - - - - - 0x01B10C 06:B0FC: FF        .byte $FF   ; 
- D 1 - - - 0x01B10D 06:B0FD: 00        .byte $00   ; 
- - - - - - 0x01B10E 06:B0FE: FF        .byte $FF   ; 
- D 1 - - - 0x01B10F 06:B0FF: 01        .byte $01   ; 
- - - - - - 0x01B110 06:B100: FF        .byte $FF   ; 
- - - - - - 0x01B111 06:B101: 02        .byte $02   ; 
- - - - - - 0x01B112 06:B102: FF        .byte $FF   ; 
- - - - - - 0x01B113 06:B103: 02        .byte $02   ; 
- - - - - - 0x01B114 06:B104: FF        .byte $FF   ; 
- - - - - - 0x01B115 06:B105: FF        .byte $FF   ; 
- - - - - - 0x01B116 06:B106: FF        .byte $FF   ; 
- - - - - - 0x01B117 06:B107: FF        .byte $FF   ; 
- - - - - - 0x01B118 06:B108: FF        .byte $FF   ; 
- - - - - - 0x01B119 06:B109: FF        .byte $FF   ; 
- - - - - - 0x01B11A 06:B10A: FF        .byte $FF   ; 
- - - - - - 0x01B11B 06:B10B: FF        .byte $FF   ; 
- - - - - - 0x01B11C 06:B10C: FF        .byte $FF   ; 
- - - - - - 0x01B11D 06:B10D: FF        .byte $FF   ; 
- - - - - - 0x01B11E 06:B10E: 07        .byte $07   ; 
- - - - - - 0x01B11F 06:B10F: FF        .byte $FF   ; 
- - - - - - 0x01B120 06:B110: FF        .byte $FF   ; 
- - - - - - 0x01B121 06:B111: FF        .byte $FF   ; 
- - - - - - 0x01B122 06:B112: FF        .byte $FF   ; 
- - - - - - 0x01B123 06:B113: FF        .byte $FF   ; 
- D 1 - - - 0x01B124 06:B114: 07        .byte $07   ; 
- - - - - - 0x01B125 06:B115: FF        .byte $FF   ; 
- D 1 - - - 0x01B126 06:B116: 06        .byte $06   ; 
- - - - - - 0x01B127 06:B117: FF        .byte $FF   ; 
- - - - - - 0x01B128 06:B118: 06        .byte $06   ; 
- - - - - - 0x01B129 06:B119: FF        .byte $FF   ; 
- - - - - - 0x01B12A 06:B11A: 07        .byte $07   ; 
- - - - - - 0x01B12B 06:B11B: FF        .byte $FF   ; 
- - - - - - 0x01B12C 06:B11C: FF        .byte $FF   ; 
- - - - - - 0x01B12D 06:B11D: 00        .byte $00   ; 
- - - - - - 0x01B12E 06:B11E: FF        .byte $FF   ; 
- - - - - - 0x01B12F 06:B11F: 05        .byte $05   ; 
- - - - - - 0x01B130 06:B120: FF        .byte $FF   ; 
- D 1 - - - 0x01B131 06:B121: 05        .byte $05   ; 
- - - - - - 0x01B132 06:B122: 06        .byte $06   ; 
- - - - - - 0x01B133 06:B123: FF        .byte $FF   ; 
- - - - - - 0x01B134 06:B124: FF        .byte $FF   ; 
- - - - - - 0x01B135 06:B125: 00        .byte $00   ; 
- - - - - - 0x01B136 06:B126: FF        .byte $FF   ; 
- - - - - - 0x01B137 06:B127: FF        .byte $FF   ; 
- - - - - - 0x01B138 06:B128: FF        .byte $FF   ; 
- D 1 - - - 0x01B139 06:B129: 00        .byte $00   ; 
- - - - - - 0x01B13A 06:B12A: FF        .byte $FF   ; 
- - - - - - 0x01B13B 06:B12B: FF        .byte $FF   ; 
- - - - - - 0x01B13C 06:B12C: FF        .byte $FF   ; 
- D 1 - - - 0x01B13D 06:B12D: 00        .byte $00   ; 
- - - - - - 0x01B13E 06:B12E: FF        .byte $FF   ; 
- - - - - - 0x01B13F 06:B12F: FF        .byte $FF   ; 
- - - - - - 0x01B140 06:B130: FF        .byte $FF   ; 
- D 1 - - - 0x01B141 06:B131: 00        .byte $00   ; 
- - - - - - 0x01B142 06:B132: FF        .byte $FF   ; 
- - - - - - 0x01B143 06:B133: FF        .byte $FF   ; 
- - - - - - 0x01B144 06:B134: FF        .byte $FF   ; 
- D 1 - - - 0x01B145 06:B135: 00        .byte $00   ; 
- - - - - - 0x01B146 06:B136: FF        .byte $FF   ; 
- - - - - - 0x01B147 06:B137: FF        .byte $FF   ; 
- - - - - - 0x01B148 06:B138: FF        .byte $FF   ; 
- - - - - - 0x01B149 06:B139: FF        .byte $FF   ; 
- - - - - - 0x01B14A 06:B13A: FF        .byte $FF   ; 
- - - - - - 0x01B14B 06:B13B: 05        .byte $05   ; 
- D 1 - - - 0x01B14C 06:B13C: 06        .byte $06   ; 
- - - - - - 0x01B14D 06:B13D: FF        .byte $FF   ; 
- D 1 - - - 0x01B14E 06:B13E: 06        .byte $06   ; 
- - - - - - 0x01B14F 06:B13F: FF        .byte $FF   ; 
- D 1 - - - 0x01B150 06:B140: 07        .byte $07   ; 
- - - - - - 0x01B151 06:B141: FF        .byte $FF   ; 
- - - - - - 0x01B152 06:B142: FF        .byte $FF   ; 
- - - - - - 0x01B153 06:B143: FF        .byte $FF   ; 
- - - - - - 0x01B154 06:B144: FF        .byte $FF   ; 
- D 1 - - - 0x01B155 06:B145: 05        .byte $05   ; 
- - - - - - 0x01B156 06:B146: 06        .byte $06   ; 
- - - - - - 0x01B157 06:B147: FF        .byte $FF   ; 
- - - - - - 0x01B158 06:B148: FF        .byte $FF   ; 
- - - - - - 0x01B159 06:B149: FF        .byte $FF   ; 
- - - - - - 0x01B15A 06:B14A: FF        .byte $FF   ; 
- - - - - - 0x01B15B 06:B14B: FF        .byte $FF   ; 
- - - - - - 0x01B15C 06:B14C: FF        .byte $FF   ; 
- D 1 - - - 0x01B15D 06:B14D: 00        .byte $00   ; 
- D 1 - - - 0x01B15E 06:B14E: 06        .byte $06   ; 
- - - - - - 0x01B15F 06:B14F: FF        .byte $FF   ; 
- D 1 - - - 0x01B160 06:B150: 07        .byte $07   ; 



sub_B151:
C - - - - - 0x01B161 06:B151: 86 43     STX ram_0043
C - - - - - 0x01B163 06:B153: 8A        TXA
C - - - - - 0x01B164 06:B154: 29 01     AND #$01
C - - - - - 0x01B166 06:B156: 49 01     EOR #$01
C - - - - - 0x01B168 06:B158: A8        TAY
C - - - - - 0x01B169 06:B159: 84 44     STY ram_0044
C - - - - - 0x01B16B 06:B15B: 20 01 B3  JSR sub_B301
C - - - - - 0x01B16E 06:B15E: C8        INY
C - - - - - 0x01B16F 06:B15F: 20 37 B3  JSR sub_B337
C - - - - - 0x01B172 06:B162: 10 32     BPL bra_B196
C - - - - - 0x01B174 06:B164: 20 8C B3  JSR sub_B38C
bra_B167:
C - - - - - 0x01B177 06:B167: A6 43     LDX ram_0043
C - - - - - 0x01B179 06:B169: A4 44     LDY ram_0044
C - - - - - 0x01B17B 06:B16B: BD 86 04  LDA ram_игрок_состояние,X
C - - - - - 0x01B17E 06:B16E: 30 05     BMI bra_B175
C - - - - - 0x01B180 06:B170: B9 86 04  LDA ram_игрок_состояние,Y
C - - - - - 0x01B183 06:B173: 30 17     BMI bra_B18C
bra_B175:
C - - - - - 0x01B185 06:B175: A6 44     LDX ram_0044
C - - - - - 0x01B187 06:B177: E4 43     CPX ram_0043
C - - - - - 0x01B189 06:B179: F0 11     BEQ bra_B18C
C - - - - - 0x01B18B 06:B17B: 20 01 B3  JSR sub_B301
C - - - - - 0x01B18E 06:B17E: C8        INY
C - - - - - 0x01B18F 06:B17F: 20 37 B3  JSR sub_B337
C - - - - - 0x01B192 06:B182: 10 08     BPL bra_B18C
C - - - - - 0x01B194 06:B184: 20 96 B3  JSR sub_B396
C - - - - - 0x01B197 06:B187: 20 A0 B3  JSR sub_B3A0
C - - - - - 0x01B19A 06:B18A: B0 0B     BCS bra_B197
bra_B18C:
C - - - - - 0x01B19C 06:B18C: E6 44     INC ram_0044
C - - - - - 0x01B19E 06:B18E: E6 44     INC ram_0044
C - - - - - 0x01B1A0 06:B190: A5 44     LDA ram_0044
C - - - - - 0x01B1A2 06:B192: C9 0C     CMP #$0C
C - - - - - 0x01B1A4 06:B194: 90 D1     BCC bra_B167
bra_B196:
C - - - - - 0x01B1A6 06:B196: 18        CLC
bra_B197:
C - - - - - 0x01B1A7 06:B197: A6 43     LDX ram_0043
C - - - - - 0x01B1A9 06:B199: 60        RTS



sub_B19A:
C - - - - - 0x01B1AA 06:B19A: 86 43     STX ram_0043
C - - - - - 0x01B1AC 06:B19C: 8A        TXA
C - - - - - 0x01B1AD 06:B19D: 29 01     AND #$01
C - - - - - 0x01B1AF 06:B19F: A8        TAY
C - - - - - 0x01B1B0 06:B1A0: 84 44     STY ram_0044
C - - - - - 0x01B1B2 06:B1A2: 20 01 B3  JSR sub_B301
C - - - - - 0x01B1B5 06:B1A5: C8        INY
C - - - - - 0x01B1B6 06:B1A6: 20 37 B3  JSR sub_B337
C - - - - - 0x01B1B9 06:B1A9: 10 24     BPL bra_B1CF
C - - - - - 0x01B1BB 06:B1AB: 20 8C B3  JSR sub_B38C
bra_B1AE:
C - - - - - 0x01B1BE 06:B1AE: A6 44     LDX ram_0044
C - - - - - 0x01B1C0 06:B1B0: E4 43     CPX ram_0043
C - - - - - 0x01B1C2 06:B1B2: F0 11     BEQ bra_B1C5
C - - - - - 0x01B1C4 06:B1B4: 20 01 B3  JSR sub_B301
C - - - - - 0x01B1C7 06:B1B7: C8        INY
C - - - - - 0x01B1C8 06:B1B8: 20 37 B3  JSR sub_B337
C - - - - - 0x01B1CB 06:B1BB: 10 08     BPL bra_B1C5
C - - - - - 0x01B1CD 06:B1BD: 20 96 B3  JSR sub_B396
C - - - - - 0x01B1D0 06:B1C0: 20 A0 B3  JSR sub_B3A0
C - - - - - 0x01B1D3 06:B1C3: B0 0B     BCS bra_B1D0
bra_B1C5:
C - - - - - 0x01B1D5 06:B1C5: E6 44     INC ram_0044
C - - - - - 0x01B1D7 06:B1C7: E6 44     INC ram_0044
C - - - - - 0x01B1D9 06:B1C9: A5 44     LDA ram_0044
C - - - - - 0x01B1DB 06:B1CB: C9 0A     CMP #$0A
C - - - - - 0x01B1DD 06:B1CD: 90 DF     BCC bra_B1AE
bra_B1CF:
C - - - - - 0x01B1DF 06:B1CF: 18        CLC
bra_B1D0:
C - - - - - 0x01B1E0 06:B1D0: A6 43     LDX ram_0043
C - - - - - 0x01B1E2 06:B1D2: 60        RTS



sub_B1D3:
C - - - - - 0x01B1E3 06:B1D3: 86 43     STX ram_0043
C - - - - - 0x01B1E5 06:B1D5: A0 00     LDY #$00
C - - - - - 0x01B1E7 06:B1D7: A5 5C     LDA ram_flag_gameplay
C - - - - - 0x01B1E9 06:B1D9: 29 0C     AND #$0C
C - - - - - 0x01B1EB 06:B1DB: F0 03     BEQ bra_B1E0
C - - - - - 0x01B1ED 06:B1DD: AC D6 04  LDY ram_игрок_с_мячом
bra_B1E0:
C - - - - - 0x01B1F0 06:B1E0: 84 44     STY ram_0044
C - - - - - 0x01B1F2 06:B1E2: 20 13 B3  JSR sub_B313
C - - - - - 0x01B1F5 06:B1E5: 20 37 B3  JSR sub_B337
C - - - - - 0x01B1F8 06:B1E8: 10 29     BPL bra_B213
C - - - - - 0x01B1FA 06:B1EA: 20 8C B3  JSR sub_B38C
bra_B1ED:
C - - - - - 0x01B1FD 06:B1ED: A6 44     LDX ram_0044
C - - - - - 0x01B1FF 06:B1EF: 20 01 B3  JSR sub_B301
C - - - - - 0x01B202 06:B1F2: 20 37 B3  JSR sub_B337
C - - - - - 0x01B205 06:B1F5: 10 0E     BPL bra_B205
C - - - - - 0x01B207 06:B1F7: 20 96 B3  JSR sub_B396
C - - - - - 0x01B20A 06:B1FA: 20 A0 B3  JSR sub_B3A0
C - - - - - 0x01B20D 06:B1FD: 90 06     BCC bra_B205
C - - - - - 0x01B20F 06:B1FF: 20 41 AD  JSR sub_AD41
C - - - - - 0x01B212 06:B202: 38        SEC
C - - - - - 0x01B213 06:B203: B0 0F     BCS bra_B214
bra_B205:
C - - - - - 0x01B215 06:B205: A5 5C     LDA ram_flag_gameplay
C - - - - - 0x01B217 06:B207: 29 0C     AND #$0C
C - - - - - 0x01B219 06:B209: D0 08     BNE bra_B213
C - - - - - 0x01B21B 06:B20B: E6 44     INC ram_0044
C - - - - - 0x01B21D 06:B20D: A5 44     LDA ram_0044
C - - - - - 0x01B21F 06:B20F: C9 0C     CMP #$0C
C - - - - - 0x01B221 06:B211: 90 DA     BCC bra_B1ED
bra_B213:
C - - - - - 0x01B223 06:B213: 18        CLC
bra_B214:
C - - - - - 0x01B224 06:B214: A6 43     LDX ram_0043
C - - - - - 0x01B226 06:B216: 60        RTS



sub_B217:
C - - - - - 0x01B227 06:B217: 86 43     STX ram_0043
C - - - - - 0x01B229 06:B219: A0 00     LDY #$00
C - - - - - 0x01B22B 06:B21B: 84 44     STY ram_0044
C - - - - - 0x01B22D 06:B21D: 20 13 B3  JSR sub_B313
C - - - - - 0x01B230 06:B220: 20 37 B3  JSR sub_B337
C - - - - - 0x01B233 06:B223: 10 4D     BPL bra_B272
C - - - - - 0x01B235 06:B225: 20 8C B3  JSR sub_B38C
bra_B228:
C - - - - - 0x01B238 06:B228: A6 44     LDX ram_0044
C - - - - - 0x01B23A 06:B22A: EC D6 04  CPX ram_игрок_с_мячом
C - - - - - 0x01B23D 06:B22D: F0 09     BEQ bra_B238
C - - - - - 0x01B23F 06:B22F: AD D6 04  LDA ram_игрок_с_мячом
C - - - - - 0x01B242 06:B232: 45 44     EOR ram_0044
C - - - - - 0x01B244 06:B234: 29 01     AND #$01
C - - - - - 0x01B246 06:B236: F0 32     BEQ bra_B26A
bra_B238:
C - - - - - 0x01B248 06:B238: 20 01 B3  JSR sub_B301
C - - - - - 0x01B24B 06:B23B: 20 37 B3  JSR sub_B337
C - - - - - 0x01B24E 06:B23E: 10 2A     BPL bra_B26A
C - - - - - 0x01B250 06:B240: 20 96 B3  JSR sub_B396
C - - - - - 0x01B253 06:B243: 20 A0 B3  JSR sub_B3A0
C - - - - - 0x01B256 06:B246: B0 0D     BCS bra_B255
C - - - - - 0x01B258 06:B248: A4 44     LDY ram_0044
C - - - - - 0x01B25A 06:B24A: CC D6 04  CPY ram_игрок_с_мячом
C - - - - - 0x01B25D 06:B24D: D0 1B     BNE bra_B26A
C - - - - - 0x01B25F 06:B24F: 20 E0 9F  JSR sub_9FE0
C - - - - - 0x01B262 06:B252: 4C 6A B2  JMP loc_B26A
bra_B255:
C - - - - - 0x01B265 06:B255: CC D6 04  CPY ram_игрок_с_мячом
C - - - - - 0x01B268 06:B258: F0 05     BEQ bra_B25F
C - - - - - 0x01B26A 06:B25A: 20 E9 B4  JSR sub_B4E9
C - - - - - 0x01B26D 06:B25D: 90 0B     BCC bra_B26A
bra_B25F:
C - - - - - 0x01B26F 06:B25F: 20 41 AD  JSR sub_AD41
C - - - - - 0x01B272 06:B262: CC D6 04  CPY ram_игрок_с_мячом
C - - - - - 0x01B275 06:B265: F0 03     BEQ bra_B26A
C - - - - - 0x01B277 06:B267: 38        SEC
C - - - - - 0x01B278 06:B268: B0 09     BCS bra_B273
bra_B26A:
loc_B26A:
C D 1 - - - 0x01B27A 06:B26A: E6 44     INC ram_0044
C - - - - - 0x01B27C 06:B26C: A5 44     LDA ram_0044
C - - - - - 0x01B27E 06:B26E: C9 0C     CMP #$0C
C - - - - - 0x01B280 06:B270: 90 B6     BCC bra_B228
bra_B272:
C - - - - - 0x01B282 06:B272: 18        CLC
bra_B273:
C - - - - - 0x01B283 06:B273: A6 43     LDX ram_0043
C - - - - - 0x01B285 06:B275: 60        RTS
- - - - - - 0x01B286 06:B276: 86 43     STX ram_0043
- - - - - - 0x01B288 06:B278: A0 0C     LDY #$0C
- - - - - - 0x01B28A 06:B27A: 84 44     STY ram_0044
- - - - - - 0x01B28C 06:B27C: 20 01 B3  JSR sub_B301
- - - - - - 0x01B28F 06:B27F: 20 37 B3  JSR sub_B337
- - - - - - 0x01B292 06:B282: 10 1C     BPL bra_B2A0
- - - - - - 0x01B294 06:B284: 20 8C B3  JSR sub_B38C
- - - - - - 0x01B297 06:B287: A6 44     LDX ram_0044
- - - - - - 0x01B299 06:B289: 20 13 B3  JSR sub_B313
- - - - - - 0x01B29C 06:B28C: C8        INY
- - - - - - 0x01B29D 06:B28D: 20 37 B3  JSR sub_B337
- - - - - - 0x01B2A0 06:B290: 10 0E     BPL bra_B2A0
- - - - - - 0x01B2A2 06:B292: 20 96 B3  JSR sub_B396
- - - - - - 0x01B2A5 06:B295: 20 A0 B3  JSR sub_B3A0
- - - - - - 0x01B2A8 06:B298: 90 06     BCC bra_B2A0
- - - - - - 0x01B2AA 06:B29A: 20 41 AD  JSR sub_AD41
- - - - - - 0x01B2AD 06:B29D: 38        SEC
- - - - - - 0x01B2AE 06:B29E: B0 01     BCS bra_B2A1
bra_B2A0:
- - - - - - 0x01B2B0 06:B2A0: 18        CLC
bra_B2A1:
- - - - - - 0x01B2B1 06:B2A1: A6 43     LDX ram_0043
- - - - - - 0x01B2B3 06:B2A3: 60        RTS



sub_B2A4:
C - - - - - 0x01B2B4 06:B2A4: 86 43     STX ram_0043
C - - - - - 0x01B2B6 06:B2A6: A0 0D     LDY #$0D
C - - - - - 0x01B2B8 06:B2A8: 84 44     STY ram_0044
C - - - - - 0x01B2BA 06:B2AA: E0 0C     CPX #$0C
C - - - - - 0x01B2BC 06:B2AC: D0 06     BNE bra_B2B4
C - - - - - 0x01B2BE 06:B2AE: 20 13 B3  JSR sub_B313
C - - - - - 0x01B2C1 06:B2B1: 4C B7 B2  JMP loc_B2B7
bra_B2B4:
C - - - - - 0x01B2C4 06:B2B4: 20 01 B3  JSR sub_B301
loc_B2B7:
C D 1 - - - 0x01B2C7 06:B2B7: 20 37 B3  JSR sub_B337
C - - - - - 0x01B2CA 06:B2BA: 10 39     BPL bra_B2F5
C - - - - - 0x01B2CC 06:B2BC: 20 8C B3  JSR sub_B38C
C - - - - - 0x01B2CF 06:B2BF: A6 44     LDX ram_0044
C - - - - - 0x01B2D1 06:B2C1: 20 25 B3  JSR sub_B325
C - - - - - 0x01B2D4 06:B2C4: C8        INY
C - - - - - 0x01B2D5 06:B2C5: 20 37 B3  JSR sub_B337
C - - - - - 0x01B2D8 06:B2C8: 10 2B     BPL bra_B2F5
C - - - - - 0x01B2DA 06:B2CA: 20 96 B3  JSR sub_B396
C - - - - - 0x01B2DD 06:B2CD: 20 A0 B3  JSR sub_B3A0
C - - - - - 0x01B2E0 06:B2D0: 90 23     BCC bra_B2F5
C - - - - - 0x01B2E2 06:B2D2: A6 43     LDX ram_0043
C - - - - - 0x01B2E4 06:B2D4: AD 66 04  LDA ram_weather_id
C - - - - - 0x01B2E7 06:B2D7: 0A        ASL
C - - - - - 0x01B2E8 06:B2D8: A8        TAY
C - - - - - 0x01B2E9 06:B2D9: E0 0C     CPX #$0C
C - - - - - 0x01B2EB 06:B2DB: D0 01     BNE bra_B2DE
C - - - - - 0x01B2ED 06:B2DD: C8        INY
bra_B2DE:
C - - - - - 0x01B2EE 06:B2DE: B9 F9 B2  LDA tbl_B2F9,Y
C - - - - - 0x01B2F1 06:B2E1: 10 0C     BPL bra_B2EF
C - - - - - 0x01B2F3 06:B2E3: C9 FF     CMP #$FF
C - - - - - 0x01B2F5 06:B2E5: F0 0B     BEQ bra_B2F2
C - - - - - 0x01B2F7 06:B2E7: A9 80     LDA #$80
C - - - - - 0x01B2F9 06:B2E9: 8D 25 05  STA ram_timer_electric_ball
C - - - - - 0x01B2FC 06:B2EC: 4C F2 B2  JMP loc_B2F2
bra_B2EF:
C - - - - - 0x01B2FF 06:B2EF: 9D 59 04  STA ram_movement_id_player,X
bra_B2F2:
loc_B2F2:
C D 1 - - - 0x01B302 06:B2F2: 38        SEC
C - - - - - 0x01B303 06:B2F3: B0 01     BCS bra_B2F6
bra_B2F5:
C - - - - - 0x01B305 06:B2F5: 18        CLC
bra_B2F6:
C - - - - - 0x01B306 06:B2F6: A6 43     LDX ram_0043
C - - - - - 0x01B308 06:B2F8: 60        RTS



tbl_B2F9:
- - - - - - 0x01B309 06:B2F9: FF        .byte $FF   ; 
- - - - - - 0x01B30A 06:B2FA: FF        .byte $FF   ; 
- D 1 - - - 0x01B30B 06:B2FB: 06        .byte $06   ; 
- D 1 - - - 0x01B30C 06:B2FC: FE        .byte $FE   ; 
- - - - - - 0x01B30D 06:B2FD: FF        .byte $FF   ; 
- - - - - - 0x01B30E 06:B2FE: FF        .byte $FF   ; 
- - - - - - 0x01B30F 06:B2FF: 55        .byte $55   ; 
- - - - - - 0x01B310 06:B300: 16        .byte $16   ; 



sub_B301:
C - - - - - 0x01B311 06:B301: AD 4B B5  LDA #< tbl_B551
C - - - - - 0x01B314 06:B304: 85 2C     STA ram_002C
C - - - - - 0x01B316 06:B306: AD 4C B5  LDA #> tbl_B551
C - - - - - 0x01B319 06:B309: 85 2D     STA ram_002D
C - - - - - 0x01B31B 06:B30B: BD 59 04  LDA ram_movement_id_player,X
C - - - - - 0x01B31E 06:B30E: 29 7F     AND #$7F
C - - - - - 0x01B320 06:B310: 0A        ASL
C - - - - - 0x01B321 06:B311: A8        TAY
C - - - - - 0x01B322 06:B312: 60        RTS



sub_B313:
C - - - - - 0x01B323 06:B313: AD 4D B5  LDA tbl_B54D
C - - - - - 0x01B326 06:B316: 85 2C     STA ram_002C
C - - - - - 0x01B328 06:B318: AD 4E B5  LDA tbl_B54D + 1
C - - - - - 0x01B32B 06:B31B: 85 2D     STA ram_002D
C - - - - - 0x01B32D 06:B31D: AD 65 04  LDA ram_movement_id_ball
C - - - - - 0x01B330 06:B320: 29 7F     AND #$7F
C - - - - - 0x01B332 06:B322: 0A        ASL
C - - - - - 0x01B333 06:B323: A8        TAY
C - - - - - 0x01B334 06:B324: 60        RTS



sub_B325:
C - - - - - 0x01B335 06:B325: AD 4F B5  LDA tbl_B54F
C - - - - - 0x01B338 06:B328: 85 2C     STA ram_002C
C - - - - - 0x01B33A 06:B32A: AD 50 B5  LDA tbl_B54F + 1
C - - - - - 0x01B33D 06:B32D: 85 2D     STA ram_002D
C - - - - - 0x01B33F 06:B32F: AD 66 04  LDA ram_weather_id
C - - - - - 0x01B342 06:B332: 29 7F     AND #$7F
C - - - - - 0x01B344 06:B334: 0A        ASL
C - - - - - 0x01B345 06:B335: A8        TAY
C - - - - - 0x01B346 06:B336: 60        RTS



sub_B337:
C - - - - - 0x01B347 06:B337: B1 2C     LDA (ram_002C),Y
C - - - - - 0x01B349 06:B339: 10 20     BPL bra_B35B
C - - - - - 0x01B34B 06:B33B: C9 FF     CMP #$FF
C - - - - - 0x01B34D 06:B33D: F0 3D     BEQ bra_B37C
C - - - - - 0x01B34F 06:B33F: 0A        ASL
C - - - - - 0x01B350 06:B340: A8        TAY
C - - - - - 0x01B351 06:B341: AD 47 B5  LDA #< tbl_B643
C - - - - - 0x01B354 06:B344: 85 32     STA ram_0032
C - - - - - 0x01B356 06:B346: AD 48 B5  LDA #> tbl_B643
C - - - - - 0x01B359 06:B349: 85 33     STA ram_0033
C - - - - - 0x01B35B 06:B34B: B1 32     LDA (ram_0032),Y
C - - - - - 0x01B35D 06:B34D: 85 2C     STA ram_002C
C - - - - - 0x01B35F 06:B34F: C8        INY
C - - - - - 0x01B360 06:B350: B1 32     LDA (ram_0032),Y
C - - - - - 0x01B362 06:B352: 85 2D     STA ram_002D
C - - - - - 0x01B364 06:B354: BC 6C 04  LDY ram_animation_sub_id_player,X
C - - - - - 0x01B367 06:B357: B1 2C     LDA (ram_002C),Y
C - - - - - 0x01B369 06:B359: 30 21     BMI bra_B37C
bra_B35B:
C - - - - - 0x01B36B 06:B35B: 0A        ASL
C - - - - - 0x01B36C 06:B35C: 10 22     BPL bra_B380
C - - - - - 0x01B36E 06:B35E: 29 7F     AND #$7F
C - - - - - 0x01B370 06:B360: A8        TAY
C - - - - - 0x01B371 06:B361: AD 49 B5  LDA #< tbl_B65C
C - - - - - 0x01B374 06:B364: 85 32     STA ram_0032
C - - - - - 0x01B376 06:B366: AD 4A B5  LDA #> tbl_B65C
C - - - - - 0x01B379 06:B369: 85 33     STA ram_0033
C - - - - - 0x01B37B 06:B36B: B1 32     LDA (ram_0032),Y
C - - - - - 0x01B37D 06:B36D: 85 2C     STA ram_002C
C - - - - - 0x01B37F 06:B36F: C8        INY
C - - - - - 0x01B380 06:B370: B1 32     LDA (ram_0032),Y
C - - - - - 0x01B382 06:B372: 85 2D     STA ram_002D
C - - - - - 0x01B384 06:B374: BC 94 00  LDY ram_номер_кадра_анимации,X
C - - - - - 0x01B387 06:B377: B1 2C     LDA (ram_002C),Y
C - - - - - 0x01B389 06:B379: 0A        ASL
C - - - - - 0x01B38A 06:B37A: 10 04     BPL bra_B380
bra_B37C:
C - - - - - 0x01B38C 06:B37C: A9 00     LDA #$00
C - - - - - 0x01B38E 06:B37E: F0 0B     BEQ bra_B38B_RTS
bra_B380:
C - - - - - 0x01B390 06:B380: A8        TAY
C - - - - - 0x01B391 06:B381: AD 45 B5  LDA #< tbl_B6BE
C - - - - - 0x01B394 06:B384: 85 2C     STA ram_002C
C - - - - - 0x01B396 06:B386: AD 46 B5  LDA #> tbl_B6BE
C - - - - - 0x01B399 06:B389: 85 2D     STA ram_002D
bra_B38B_RTS:
C - - - - - 0x01B39B 06:B38B: 60        RTS



sub_B38C:
C - - - - - 0x01B39C 06:B38C: B1 2C     LDA (ram_002C),Y
C - - - - - 0x01B39E 06:B38E: 85 2E     STA ram_002E
C - - - - - 0x01B3A0 06:B390: C8        INY
C - - - - - 0x01B3A1 06:B391: B1 2C     LDA (ram_002C),Y
C - - - - - 0x01B3A3 06:B393: 85 2F     STA ram_002F
C - - - - - 0x01B3A5 06:B395: 60        RTS



sub_B396:
C - - - - - 0x01B3A6 06:B396: B1 2C     LDA (ram_002C),Y
C - - - - - 0x01B3A8 06:B398: 85 30     STA ram_0030
C - - - - - 0x01B3AA 06:B39A: C8        INY
C - - - - - 0x01B3AB 06:B39B: B1 2C     LDA (ram_002C),Y
C - - - - - 0x01B3AD 06:B39D: 85 31     STA ram_0031
C - - - - - 0x01B3AF 06:B39F: 60        RTS



sub_B3A0:
C - - - - - 0x01B3B0 06:B3A0: A6 43     LDX ram_0043
C - - - - - 0x01B3B2 06:B3A2: A4 44     LDY ram_0044
C - - - - - 0x01B3B4 06:B3A4: A5 5C     LDA ram_flag_gameplay
C - - - - - 0x01B3B6 06:B3A6: 29 0C     AND #$0C
C - - - - - 0x01B3B8 06:B3A8: D0 0C     BNE bra_B3B6
C - - - - - 0x01B3BA 06:B3AA: B5 D9     LDA ram_flag_visible_player,X
C - - - - - 0x01B3BC 06:B3AC: F0 05     BEQ bra_B3B3
C - - - - - 0x01B3BE 06:B3AE: B9 D9 00  LDA ram_flag_visible_player,Y
C - - - - - 0x01B3C1 06:B3B1: D0 03     BNE bra_B3B6
bra_B3B3:
C - - - - - 0x01B3C3 06:B3B3: 4C E7 B4  JMP loc_B4E7
bra_B3B6:
C - - - - - 0x01B3C6 06:B3B6: A6 43     LDX ram_0043
C - - - - - 0x01B3C8 06:B3B8: A4 44     LDY ram_0044
C - - - - - 0x01B3CA 06:B3BA: 38        SEC
C - - - - - 0x01B3CB 06:B3BB: BD 4D 03  LDA ram_pos_Y_lo_player,X
C - - - - - 0x01B3CE 06:B3BE: F9 4D 03  SBC ram_pos_Y_lo_player,Y
C - - - - - 0x01B3D1 06:B3C1: 85 34     STA ram_0034
C - - - - - 0x01B3D3 06:B3C3: BD 60 03  LDA ram_pos_Y_hi_player,X
C - - - - - 0x01B3D6 06:B3C6: F9 60 03  SBC ram_pos_Y_hi_player,Y
C - - - - - 0x01B3D9 06:B3C9: 30 17     BMI bra_B3E2
C - - - - - 0x01B3DB 06:B3CB: D0 3D     BNE bra_B40A
C - - - - - 0x01B3DD 06:B3CD: A5 34     LDA ram_0034
C - - - - - 0x01B3DF 06:B3CF: 29 E0     AND #$E0
C - - - - - 0x01B3E1 06:B3D1: D0 37     BNE bra_B40A
C - - - - - 0x01B3E3 06:B3D3: A0 02     LDY #$02
C - - - - - 0x01B3E5 06:B3D5: 38        SEC
C - - - - - 0x01B3E6 06:B3D6: A5 34     LDA ram_0034
C - - - - - 0x01B3E8 06:B3D8: F1 2E     SBC (ram_002E),Y
C - - - - - 0x01B3EA 06:B3DA: 90 06     BCC bra_B3E2
C - - - - - 0x01B3EC 06:B3DC: F1 30     SBC (ram_0030),Y
C - - - - - 0x01B3EE 06:B3DE: 90 02     BCC bra_B3E2
C - - - - - 0x01B3F0 06:B3E0: B0 28     BCS bra_B40A
bra_B3E2:
C - - - - - 0x01B3F2 06:B3E2: A4 44     LDY ram_0044
C - - - - - 0x01B3F4 06:B3E4: 38        SEC
C - - - - - 0x01B3F5 06:B3E5: B9 4D 03  LDA ram_pos_Y_lo_player,Y
C - - - - - 0x01B3F8 06:B3E8: FD 4D 03  SBC ram_pos_Y_lo_player,X
C - - - - - 0x01B3FB 06:B3EB: 85 34     STA ram_0034
C - - - - - 0x01B3FD 06:B3ED: B9 60 03  LDA ram_pos_Y_hi_player,Y
C - - - - - 0x01B400 06:B3F0: FD 60 03  SBC ram_pos_Y_hi_player,X
C - - - - - 0x01B403 06:B3F3: 30 18     BMI bra_B40D
C - - - - - 0x01B405 06:B3F5: D0 13     BNE bra_B40A
C - - - - - 0x01B407 06:B3F7: A5 34     LDA ram_0034
C - - - - - 0x01B409 06:B3F9: 29 E0     AND #$E0
C - - - - - 0x01B40B 06:B3FB: D0 0D     BNE bra_B40A
C - - - - - 0x01B40D 06:B3FD: A0 02     LDY #$02
C - - - - - 0x01B40F 06:B3FF: 38        SEC
C - - - - - 0x01B410 06:B400: A5 34     LDA ram_0034
C - - - - - 0x01B412 06:B402: F1 2E     SBC (ram_002E),Y
C - - - - - 0x01B414 06:B404: 30 07     BMI bra_B40D
C - - - - - 0x01B416 06:B406: F1 30     SBC (ram_0030),Y
C - - - - - 0x01B418 06:B408: 30 03     BMI bra_B40D
bra_B40A:
C - - - - - 0x01B41A 06:B40A: 4C E7 B4  JMP loc_B4E7
bra_B40D:
C - - - - - 0x01B41D 06:B40D: A9 00     LDA #$00
C - - - - - 0x01B41F 06:B40F: 85 1D     STA ram_001D
C - - - - - 0x01B421 06:B411: 85 1F     STA ram_001F
C - - - - - 0x01B423 06:B413: A9 01     LDA #$01
C - - - - - 0x01B425 06:B415: 85 1E     STA ram_001E
C - - - - - 0x01B427 06:B417: 85 20     STA ram_0020
C - - - - - 0x01B429 06:B419: A6 43     LDX ram_0043
C - - - - - 0x01B42B 06:B41B: A4 44     LDY ram_0044
C - - - - - 0x01B42D 06:B41D: BD A3 04  LDA ram_направление_движения,X
C - - - - - 0x01B430 06:B420: 10 04     BPL bra_B426
C - - - - - 0x01B432 06:B422: E6 1D     INC ram_001D
C - - - - - 0x01B434 06:B424: C6 1E     DEC ram_001E
bra_B426:
C - - - - - 0x01B436 06:B426: B9 A3 04  LDA ram_направление_движения,Y
C - - - - - 0x01B439 06:B429: 10 04     BPL bra_B42F
C - - - - - 0x01B43B 06:B42B: E6 1F     INC ram_001F
C - - - - - 0x01B43D 06:B42D: C6 20     DEC ram_0020
bra_B42F:
C - - - - - 0x01B43F 06:B42F: 38        SEC
C - - - - - 0x01B440 06:B430: BD 14 03  LDA ram_pos_X_lo_player,X
C - - - - - 0x01B443 06:B433: F9 14 03  SBC ram_pos_X_lo_player,Y
C - - - - - 0x01B446 06:B436: 85 34     STA ram_0034
C - - - - - 0x01B448 06:B438: BD 27 03  LDA ram_pos_X_hi_player,X
C - - - - - 0x01B44B 06:B43B: F9 27 03  SBC ram_pos_X_hi_player,Y
C - - - - - 0x01B44E 06:B43E: 30 19     BMI bra_B459
C - - - - - 0x01B450 06:B440: D0 41     BNE bra_B483
C - - - - - 0x01B452 06:B442: A5 34     LDA ram_0034
C - - - - - 0x01B454 06:B444: 29 E0     AND #$E0
C - - - - - 0x01B456 06:B446: D0 3B     BNE bra_B483
C - - - - - 0x01B458 06:B448: A4 1D     LDY ram_001D
C - - - - - 0x01B45A 06:B44A: 38        SEC
C - - - - - 0x01B45B 06:B44B: A5 34     LDA ram_0034
C - - - - - 0x01B45D 06:B44D: F1 2E     SBC (ram_002E),Y
C - - - - - 0x01B45F 06:B44F: 30 08     BMI bra_B459
C - - - - - 0x01B461 06:B451: A4 20     LDY ram_0020
C - - - - - 0x01B463 06:B453: F1 30     SBC (ram_0030),Y
C - - - - - 0x01B465 06:B455: 30 02     BMI bra_B459
C - - - - - 0x01B467 06:B457: 10 2A     BPL bra_B483
bra_B459:
C - - - - - 0x01B469 06:B459: A4 44     LDY ram_0044
C - - - - - 0x01B46B 06:B45B: 38        SEC
C - - - - - 0x01B46C 06:B45C: B9 14 03  LDA ram_pos_X_lo_player,Y
C - - - - - 0x01B46F 06:B45F: FD 14 03  SBC ram_pos_X_lo_player,X
C - - - - - 0x01B472 06:B462: 85 34     STA ram_0034
C - - - - - 0x01B474 06:B464: B9 27 03  LDA ram_pos_X_hi_player,Y
C - - - - - 0x01B477 06:B467: FD 27 03  SBC ram_pos_X_hi_player,X
C - - - - - 0x01B47A 06:B46A: 30 1A     BMI bra_B486
C - - - - - 0x01B47C 06:B46C: D0 15     BNE bra_B483
C - - - - - 0x01B47E 06:B46E: A5 34     LDA ram_0034
C - - - - - 0x01B480 06:B470: 29 E0     AND #$E0
C - - - - - 0x01B482 06:B472: D0 0F     BNE bra_B483
C - - - - - 0x01B484 06:B474: A4 1E     LDY ram_001E
C - - - - - 0x01B486 06:B476: 38        SEC
C - - - - - 0x01B487 06:B477: A5 34     LDA ram_0034
C - - - - - 0x01B489 06:B479: F1 2E     SBC (ram_002E),Y
C - - - - - 0x01B48B 06:B47B: 30 09     BMI bra_B486
C - - - - - 0x01B48D 06:B47D: A4 1F     LDY ram_001F
C - - - - - 0x01B48F 06:B47F: F1 30     SBC (ram_0030),Y
C - - - - - 0x01B491 06:B481: 30 03     BMI bra_B486
bra_B483:
C - - - - - 0x01B493 06:B483: 4C E7 B4  JMP loc_B4E7
bra_B486:
C - - - - - 0x01B496 06:B486: A6 43     LDX ram_0043
C - - - - - 0x01B498 06:B488: A4 44     LDY ram_0044
C - - - - - 0x01B49A 06:B48A: 38        SEC
C - - - - - 0x01B49B 06:B48B: BD 86 03  LDA ram_pos_Z_lo_player,X
C - - - - - 0x01B49E 06:B48E: F9 86 03  SBC ram_pos_Z_lo_player,Y
C - - - - - 0x01B4A1 06:B491: 85 34     STA ram_0034
C - - - - - 0x01B4A3 06:B493: BD 99 03  LDA ram_pos_Z_hi_player,X
C - - - - - 0x01B4A6 06:B496: F9 99 03  SBC ram_pos_Z_hi_player,Y
C - - - - - 0x01B4A9 06:B499: 30 19     BMI bra_B4B4
C - - - - - 0x01B4AB 06:B49B: D0 41     BNE bra_B4DE
C - - - - - 0x01B4AD 06:B49D: A5 34     LDA ram_0034
C - - - - - 0x01B4AF 06:B49F: 29 C0     AND #$C0
C - - - - - 0x01B4B1 06:B4A1: D0 3B     BNE bra_B4DE
C - - - - - 0x01B4B3 06:B4A3: A0 04     LDY #$04
C - - - - - 0x01B4B5 06:B4A5: 38        SEC
C - - - - - 0x01B4B6 06:B4A6: A5 34     LDA ram_0034
C - - - - - 0x01B4B8 06:B4A8: F1 2E     SBC (ram_002E),Y
C - - - - - 0x01B4BA 06:B4AA: 30 08     BMI bra_B4B4
C - - - - - 0x01B4BC 06:B4AC: A0 03     LDY #$03
C - - - - - 0x01B4BE 06:B4AE: F1 30     SBC (ram_0030),Y
C - - - - - 0x01B4C0 06:B4B0: 30 02     BMI bra_B4B4
C - - - - - 0x01B4C2 06:B4B2: 10 2A     BPL bra_B4DE
bra_B4B4:
C - - - - - 0x01B4C4 06:B4B4: A4 44     LDY ram_0044
C - - - - - 0x01B4C6 06:B4B6: 38        SEC
C - - - - - 0x01B4C7 06:B4B7: B9 86 03  LDA ram_pos_Z_lo_player,Y
C - - - - - 0x01B4CA 06:B4BA: FD 86 03  SBC ram_pos_Z_lo_player,X
C - - - - - 0x01B4CD 06:B4BD: 85 34     STA ram_0034
C - - - - - 0x01B4CF 06:B4BF: B9 99 03  LDA ram_pos_Z_hi_player,Y
C - - - - - 0x01B4D2 06:B4C2: FD 99 03  SBC ram_pos_Z_hi_player,X
C - - - - - 0x01B4D5 06:B4C5: 30 1A     BMI bra_B4E1
C - - - - - 0x01B4D7 06:B4C7: D0 15     BNE bra_B4DE
C - - - - - 0x01B4D9 06:B4C9: A5 34     LDA ram_0034
C - - - - - 0x01B4DB 06:B4CB: 29 C0     AND #$C0
C - - - - - 0x01B4DD 06:B4CD: D0 0F     BNE bra_B4DE
C - - - - - 0x01B4DF 06:B4CF: A0 04     LDY #$04
C - - - - - 0x01B4E1 06:B4D1: 38        SEC
C - - - - - 0x01B4E2 06:B4D2: A5 34     LDA ram_0034
C - - - - - 0x01B4E4 06:B4D4: F1 30     SBC (ram_0030),Y
C - - - - - 0x01B4E6 06:B4D6: 30 09     BMI bra_B4E1
C - - - - - 0x01B4E8 06:B4D8: A0 03     LDY #$03
C - - - - - 0x01B4EA 06:B4DA: F1 2E     SBC (ram_002E),Y
C - - - - - 0x01B4EC 06:B4DC: 30 03     BMI bra_B4E1
bra_B4DE:
C - - - - - 0x01B4EE 06:B4DE: 4C E7 B4  JMP loc_B4E7
bra_B4E1:
C - - - - - 0x01B4F1 06:B4E1: 38        SEC
C - - - - - 0x01B4F2 06:B4E2: A4 44     LDY ram_0044
C - - - - - 0x01B4F4 06:B4E4: 4C E8 B4  RTS
loc_B4E7:
C D 1 - - - 0x01B4F7 06:B4E7: 18        CLC
C D 1 - - - 0x01B4F8 06:B4E8: 60        RTS



sub_B4E9:
C - - - - - 0x01B4F9 06:B4E9: 84 1C     STY ram_001C
C - - - - - 0x01B4FB 06:B4EB: AC D6 04  LDY ram_игрок_с_мячом
C - - - - - 0x01B4FE 06:B4EE: 20 08 B5  JSR sub_B508
C - - - - - 0x01B501 06:B4F1: 85 1E     STA ram_001E
C - - - - - 0x01B503 06:B4F3: A4 1C     LDY ram_001C
C - - - - - 0x01B505 06:B4F5: 20 08 B5  JSR sub_B508
C - - - - - 0x01B508 06:B4F8: C5 1E     CMP ram_001E
C - - - - - 0x01B50A 06:B4FA: 90 07     BCC bra_B503
C - - - - - 0x01B50C 06:B4FC: F0 05     BEQ bra_B503
C - - - - - 0x01B50E 06:B4FE: EA        NOP
C - - - - - 0x01B50F 06:B4FF: 38        SEC
C - - - - - 0x01B510 06:B500: 4C 05 B5  JMP loc_B505
bra_B503:
C - - - - - 0x01B513 06:B503: EA        NOP
C - - - - - 0x01B514 06:B504: 18        CLC
loc_B505:
C D 1 - - - 0x01B515 06:B505: A4 1C     LDY ram_001C
C - - - - - 0x01B517 06:B507: 60        RTS



sub_B508:
C - - - - - 0x01B518 06:B508: C0 0A     CPY #$0A
C - - - - - 0x01B51A 06:B50A: 90 0A     BCC bra_B516
C - - - - - 0x01B51C 06:B50C: B9 7C 06  LDA ram_067C,Y
C - - - - - 0x01B51F 06:B50F: 30 05     BMI bra_B516
C - - - - - 0x01B521 06:B511: A0 09     LDY #$09
C - - - - - 0x01B523 06:B513: 4C 37 B5  JMP loc_B537
bra_B516:
C - - - - - 0x01B526 06:B516: B9 59 04  LDA ram_movement_id_player,Y
C - - - - - 0x01B529 06:B519: 29 7F     AND #$7F
C - - - - - 0x01B52B 06:B51B: C9 23     CMP #$23
C - - - - - 0x01B52D 06:B51D: D0 05     BNE bra_B524
C - - - - - 0x01B52F 06:B51F: A0 08     LDY #$08
C - - - - - 0x01B531 06:B521: 4C 37 B5  JMP loc_B537
bra_B524:
C - - - - - 0x01B534 06:B524: B9 86 04  LDA ram_игрок_состояние,Y
C - - - - - 0x01B537 06:B527: 29 98     AND #$98
C - - - - - 0x01B539 06:B529: 4A        LSR
C - - - - - 0x01B53A 06:B52A: 4A        LSR
C - - - - - 0x01B53B 06:B52B: 4A        LSR
C - - - - - 0x01B53C 06:B52C: 85 1D     STA ram_001D
C - - - - - 0x01B53E 06:B52E: 29 10     AND #$10
C - - - - - 0x01B540 06:B530: 4A        LSR
C - - - - - 0x01B541 06:B531: 4A        LSR
C - - - - - 0x01B542 06:B532: 05 1D     ORA ram_001D
C - - - - - 0x01B544 06:B534: 29 07     AND #$07
C - - - - - 0x01B546 06:B536: A8        TAY
loc_B537:
C D 1 - - - 0x01B547 06:B537: B9 3B B5  LDA tbl_B53B,Y
C - - - - - 0x01B54A 06:B53A: 60        RTS



tbl_B53B:
- D 1 - - - 0x01B54B 06:B53B: 06        .byte $06   ; 
- D 1 - - - 0x01B54C 06:B53C: 06        .byte $06   ; 
- - - - - - 0x01B54D 06:B53D: 0F        .byte $0F   ; 
- - - - - - 0x01B54E 06:B53E: 0F        .byte $0F   ; 
- D 1 - - - 0x01B54F 06:B53F: 06        .byte $06   ; 
- D 1 - - - 0x01B550 06:B540: 06        .byte $06   ; 
- - - - - - 0x01B551 06:B541: 06        .byte $06   ; 
- - - - - - 0x01B552 06:B542: 06        .byte $06   ; 
- D 1 - - - 0x01B553 06:B543: 08        .byte $08   ; 
- D 1 - - - 0x01B554 06:B544: 0A        .byte $0A   ; 


; bzk
tbl_B54D:
- D 1 - - - 0x01B55D 06:B54D: 0B B6     .word off_B60B
tbl_B54F:
- D 1 - - - 0x01B55F 06:B54F: 39 B6     .word off_B639



tbl_B551:
- D 1 - I - 0x01B561 06:B551: 01        .byte $01   ; 
- D 1 - I - 0x01B562 06:B552: 01        .byte $01   ; 
- D 1 - I - 0x01B563 06:B553: 83        .byte $83   ; 
- D 1 - I - 0x01B564 06:B554: 01        .byte $01   ; 
- D 1 - I - 0x01B565 06:B555: 01        .byte $01   ; 
- D 1 - I - 0x01B566 06:B556: 02        .byte $02   ; 
- D 1 - I - 0x01B567 06:B557: 03        .byte $03   ; 
- D 1 - I - 0x01B568 06:B558: 03        .byte $03   ; 
- D 1 - I - 0x01B569 06:B559: FF        .byte $FF   ; 
- D 1 - I - 0x01B56A 06:B55A: FF        .byte $FF   ; 
- D 1 - I - 0x01B56B 06:B55B: FF        .byte $FF   ; 
- D 1 - I - 0x01B56C 06:B55C: FF        .byte $FF   ; 
- D 1 - I - 0x01B56D 06:B55D: FF        .byte $FF   ; 
- D 1 - I - 0x01B56E 06:B55E: FF        .byte $FF   ; 
- D 1 - I - 0x01B56F 06:B55F: 80        .byte $80   ; 
- D 1 - I - 0x01B570 06:B560: 01        .byte $01   ; 
- D 1 - I - 0x01B571 06:B561: 81        .byte $81   ; 
- D 1 - I - 0x01B572 06:B562: 01        .byte $01   ; 
- D 1 - I - 0x01B573 06:B563: FF        .byte $FF   ; 
- D 1 - I - 0x01B574 06:B564: 01        .byte $01   ; 
- D 1 - I - 0x01B575 06:B565: FF        .byte $FF   ; 
- D 1 - I - 0x01B576 06:B566: 01        .byte $01   ; 
- D 1 - I - 0x01B577 06:B567: FF        .byte $FF   ; 
- D 1 - I - 0x01B578 06:B568: 01        .byte $01   ; 
- D 1 - I - 0x01B579 06:B569: FF        .byte $FF   ; 
- D 1 - I - 0x01B57A 06:B56A: 01        .byte $01   ; 
- D 1 - I - 0x01B57B 06:B56B: 82        .byte $82   ; 
- - - - - - 0x01B57C 06:B56C: 01        .byte $01   ; 
- D 1 - I - 0x01B57D 06:B56D: 01        .byte $01   ; 
- - - - - - 0x01B57E 06:B56E: 01        .byte $01   ; 
- D 1 - I - 0x01B57F 06:B56F: 15        .byte $15   ; 
- D 1 - I - 0x01B580 06:B570: 01        .byte $01   ; 
- D 1 - I - 0x01B581 06:B571: FF        .byte $FF   ; 
- D 1 - I - 0x01B582 06:B572: 01        .byte $01   ; 
- D 1 - I - 0x01B583 06:B573: 01        .byte $01   ; 
- D 1 - I - 0x01B584 06:B574: 01        .byte $01   ; 
- - - - - - 0x01B585 06:B575: 01        .byte $01   ; 
- - - - - - 0x01B586 06:B576: 01        .byte $01   ; 
- - - - - - 0x01B587 06:B577: 01        .byte $01   ; 
- - - - - - 0x01B588 06:B578: 01        .byte $01   ; 
- D 1 - I - 0x01B589 06:B579: FF        .byte $FF   ; 
- - - - - - 0x01B58A 06:B57A: FF        .byte $FF   ; 
- - - - - - 0x01B58B 06:B57B: FF        .byte $FF   ; 
- - - - - - 0x01B58C 06:B57C: FF        .byte $FF   ; 
- D 1 - I - 0x01B58D 06:B57D: FF        .byte $FF   ; 
- D 1 - I - 0x01B58E 06:B57E: FF        .byte $FF   ; 
- - - - - - 0x01B58F 06:B57F: FF        .byte $FF   ; 
- - - - - - 0x01B590 06:B580: FF        .byte $FF   ; 
- - - - - - 0x01B591 06:B581: FF        .byte $FF   ; 
- - - - - - 0x01B592 06:B582: FF        .byte $FF   ; 
- D 1 - I - 0x01B593 06:B583: 0F        .byte $0F   ; 
- D 1 - I - 0x01B594 06:B584: 0F        .byte $0F   ; 
- D 1 - I - 0x01B595 06:B585: FF        .byte $FF   ; 
- - - - - - 0x01B596 06:B586: FF        .byte $FF   ; 
- D 1 - I - 0x01B597 06:B587: FF        .byte $FF   ; 
- - - - - - 0x01B598 06:B588: FF        .byte $FF   ; 
- D 1 - I - 0x01B599 06:B589: FF        .byte $FF   ; 
- - - - - - 0x01B59A 06:B58A: FF        .byte $FF   ; 
- D 1 - I - 0x01B59B 06:B58B: 01        .byte $01   ; 
- D 1 - I - 0x01B59C 06:B58C: 01        .byte $01   ; 
- - - - - - 0x01B59D 06:B58D: FF        .byte $FF   ; 
- - - - - - 0x01B59E 06:B58E: FF        .byte $FF   ; 
- - - - - - 0x01B59F 06:B58F: FF        .byte $FF   ; 
- - - - - - 0x01B5A0 06:B590: FF        .byte $FF   ; 
- D 1 - I - 0x01B5A1 06:B591: 01        .byte $01   ; 
- D 1 - I - 0x01B5A2 06:B592: 01        .byte $01   ; 
- D 1 - I - 0x01B5A3 06:B593: 01        .byte $01   ; 
- D 1 - I - 0x01B5A4 06:B594: 01        .byte $01   ; 
- D 1 - I - 0x01B5A5 06:B595: 0F        .byte $0F   ; 
- D 1 - I - 0x01B5A6 06:B596: 0F        .byte $0F   ; 
- D 1 - I - 0x01B5A7 06:B597: 10        .byte $10   ; 
- D 1 - I - 0x01B5A8 06:B598: 10        .byte $10   ; 
- D 1 - I - 0x01B5A9 06:B599: FF        .byte $FF   ; 
- D 1 - I - 0x01B5AA 06:B59A: 01        .byte $01   ; 
- D 1 - I - 0x01B5AB 06:B59B: 01        .byte $01   ; 
- - - - - - 0x01B5AC 06:B59C: 01        .byte $01   ; 
- D 1 - I - 0x01B5AD 06:B59D: FF        .byte $FF   ; 
- D 1 - I - 0x01B5AE 06:B59E: FF        .byte $FF   ; 
- D 1 - I - 0x01B5AF 06:B59F: 03        .byte $03   ; 
- - - - - - 0x01B5B0 06:B5A0: 03        .byte $03   ; 
- D 1 - I - 0x01B5B1 06:B5A1: 01        .byte $01   ; 
- D 1 - I - 0x01B5B2 06:B5A2: 20        .byte $20   ; 
- D 1 - I - 0x01B5B3 06:B5A3: 01        .byte $01   ; 
- D 1 - I - 0x01B5B4 06:B5A4: 20        .byte $20   ; 
- D 1 - I - 0x01B5B5 06:B5A5: 04        .byte $04   ; 
- - - - - - 0x01B5B6 06:B5A6: 04        .byte $04   ; 
- - - - - - 0x01B5B7 06:B5A7: 4D        .byte $4D   ; 
- - - - - - 0x01B5B8 06:B5A8: 01        .byte $01   ; 
- - - - - - 0x01B5B9 06:B5A9: 01        .byte $01   ; 
- - - - - - 0x01B5BA 06:B5AA: 01        .byte $01   ; 
- D 1 - I - 0x01B5BB 06:B5AB: FF        .byte $FF   ; 
- D 1 - I - 0x01B5BC 06:B5AC: FF        .byte $FF   ; 
- D 1 - I - 0x01B5BD 06:B5AD: FF        .byte $FF   ; 
- D 1 - I - 0x01B5BE 06:B5AE: FF        .byte $FF   ; 
- D 1 - I - 0x01B5BF 06:B5AF: FF        .byte $FF   ; 
- D 1 - I - 0x01B5C0 06:B5B0: 21        .byte $21   ; 
- D 1 - I - 0x01B5C1 06:B5B1: 13        .byte $13   ; 
- D 1 - I - 0x01B5C2 06:B5B2: 01        .byte $01   ; 
- D 1 - I - 0x01B5C3 06:B5B3: 42        .byte $42   ; 
- D 1 - I - 0x01B5C4 06:B5B4: 42        .byte $42   ; 
- D 1 - I - 0x01B5C5 06:B5B5: 40        .byte $40   ; 
- D 1 - I - 0x01B5C6 06:B5B6: 01        .byte $01   ; 
- D 1 - I - 0x01B5C7 06:B5B7: 43        .byte $43   ; 
- D 1 - I - 0x01B5C8 06:B5B8: 01        .byte $01   ; 
- D 1 - I - 0x01B5C9 06:B5B9: 41        .byte $41   ; 
- D 1 - I - 0x01B5CA 06:B5BA: 01        .byte $01   ; 
- D 1 - I - 0x01B5CB 06:B5BB: 41        .byte $41   ; 
- D 1 - I - 0x01B5CC 06:B5BC: 01        .byte $01   ; 
- - - - - - 0x01B5CD 06:B5BD: 41        .byte $41   ; 
- - - - - - 0x01B5CE 06:B5BE: 01        .byte $01   ; 
- D 1 - I - 0x01B5CF 06:B5BF: FF        .byte $FF   ; 
- D 1 - I - 0x01B5D0 06:B5C0: 01        .byte $01   ; 
- D 1 - I - 0x01B5D1 06:B5C1: FF        .byte $FF   ; 
- D 1 - I - 0x01B5D2 06:B5C2: 01        .byte $01   ; 
- - - - - - 0x01B5D3 06:B5C3: FF        .byte $FF   ; 
- D 1 - I - 0x01B5D4 06:B5C4: 01        .byte $01   ; 
- D 1 - I - 0x01B5D5 06:B5C5: FF        .byte $FF   ; 
- D 1 - I - 0x01B5D6 06:B5C6: 01        .byte $01   ; 
- D 1 - I - 0x01B5D7 06:B5C7: FF        .byte $FF   ; 
- D 1 - I - 0x01B5D8 06:B5C8: 0F        .byte $0F   ; 
- D 1 - I - 0x01B5D9 06:B5C9: FF        .byte $FF   ; 
- D 1 - I - 0x01B5DA 06:B5CA: FF        .byte $FF   ; 
- D 1 - I - 0x01B5DB 06:B5CB: FF        .byte $FF   ; 
- D 1 - I - 0x01B5DC 06:B5CC: FF        .byte $FF   ; 
- D 1 - I - 0x01B5DD 06:B5CD: 01        .byte $01   ; 
- D 1 - I - 0x01B5DE 06:B5CE: 20        .byte $20   ; 
- D 1 - I - 0x01B5DF 06:B5CF: 01        .byte $01   ; 
- D 1 - I - 0x01B5E0 06:B5D0: 20        .byte $20   ; 
- D 1 - I - 0x01B5E1 06:B5D1: 01        .byte $01   ; 
- D 1 - I - 0x01B5E2 06:B5D2: 01        .byte $01   ; 
- D 1 - I - 0x01B5E3 06:B5D3: 48        .byte $48   ; 
- D 1 - I - 0x01B5E4 06:B5D4: 48        .byte $48   ; 
- D 1 - I - 0x01B5E5 06:B5D5: FF        .byte $FF   ; 
- D 1 - I - 0x01B5E6 06:B5D6: 49        .byte $49   ; 
- D 1 - I - 0x01B5E7 06:B5D7: 4B        .byte $4B   ; 
- D 1 - I - 0x01B5E8 06:B5D8: 4B        .byte $4B   ; 
- - - - - - 0x01B5E9 06:B5D9: 01        .byte $01   ; 
- - - - - - 0x01B5EA 06:B5DA: 01        .byte $01   ; 
- D 1 - I - 0x01B5EB 06:B5DB: 13        .byte $13   ; 
- D 1 - I - 0x01B5EC 06:B5DC: 01        .byte $01   ; 
- D 1 - I - 0x01B5ED 06:B5DD: FF        .byte $FF   ; 
- D 1 - I - 0x01B5EE 06:B5DE: 01        .byte $01   ; 
- D 1 - I - 0x01B5EF 06:B5DF: 4B        .byte $4B   ; 
- D 1 - I - 0x01B5F0 06:B5E0: 4B        .byte $4B   ; 
- D 1 - I - 0x01B5F1 06:B5E1: FF        .byte $FF   ; 
- D 1 - I - 0x01B5F2 06:B5E2: 01        .byte $01   ; 
- D 1 - I - 0x01B5F3 06:B5E3: 4B        .byte $4B   ; 
- D 1 - I - 0x01B5F4 06:B5E4: 4B        .byte $4B   ; 
- D 1 - I - 0x01B5F5 06:B5E5: FF        .byte $FF   ; 
- - - - - - 0x01B5F6 06:B5E6: 01        .byte $01   ; 
- D 1 - I - 0x01B5F7 06:B5E7: 03        .byte $03   ; 
- D 1 - I - 0x01B5F8 06:B5E8: 03        .byte $03   ; 
- D 1 - I - 0x01B5F9 06:B5E9: FF        .byte $FF   ; 
- D 1 - I - 0x01B5FA 06:B5EA: 01        .byte $01   ; 
- D 1 - I - 0x01B5FB 06:B5EB: 4C        .byte $4C   ; 
- D 1 - I - 0x01B5FC 06:B5EC: 4C        .byte $4C   ; 
- D 1 - I - 0x01B5FD 06:B5ED: FF        .byte $FF   ; 
- - - - - - 0x01B5FE 06:B5EE: 01        .byte $01   ; 
- D 1 - I - 0x01B5FF 06:B5EF: 03        .byte $03   ; 
- D 1 - I - 0x01B600 06:B5F0: 03        .byte $03   ; 
- D 1 - I - 0x01B601 06:B5F1: FF        .byte $FF   ; 
- - - - - - 0x01B602 06:B5F2: 01        .byte $01   ; 
- D 1 - I - 0x01B603 06:B5F3: FF        .byte $FF   ; 
- - - - - - 0x01B604 06:B5F4: 01        .byte $01   ; 
- D 1 - I - 0x01B605 06:B5F5: 01        .byte $01   ; 
- D 1 - I - 0x01B606 06:B5F6: 01        .byte $01   ; 
- D 1 - I - 0x01B607 06:B5F7: 01        .byte $01   ; 
- D 1 - I - 0x01B608 06:B5F8: 01        .byte $01   ; 
- D 1 - I - 0x01B609 06:B5F9: 48        .byte $48   ; 
- D 1 - I - 0x01B60A 06:B5FA: 48        .byte $48   ; 
- - - - - - 0x01B60B 06:B5FB: FF        .byte $FF   ; 
- - - - - - 0x01B60C 06:B5FC: FF        .byte $FF   ; 
- D 1 - I - 0x01B60D 06:B5FD: 01        .byte $01   ; 
- D 1 - I - 0x01B60E 06:B5FE: 01        .byte $01   ; 
- D 1 - I - 0x01B60F 06:B5FF: 4E        .byte $4E   ; 
- D 1 - I - 0x01B610 06:B600: 4E        .byte $4E   ; 
- D 1 - I - 0x01B611 06:B601: FF        .byte $FF   ; 
- D 1 - I - 0x01B612 06:B602: 0F        .byte $0F   ; 
- D 1 - I - 0x01B613 06:B603: FF        .byte $FF   ; 
- D 1 - I - 0x01B614 06:B604: FF        .byte $FF   ; 
- D 1 - I - 0x01B615 06:B605: FF        .byte $FF   ; 
- D 1 - I - 0x01B616 06:B606: FF        .byte $FF   ; 
- D 1 - I - 0x01B617 06:B607: 01        .byte $01   ; 
- D 1 - I - 0x01B618 06:B608: 01        .byte $01   ; 
- D 1 - I - 0x01B619 06:B609: 21        .byte $21   ; 
- D 1 - I - 0x01B61A 06:B60A: 21        .byte $21   ; 



off_B60B:
- - - - - - 0x01B61B 06:B60B: FF        .byte $FF   ; 
- - - - - - 0x01B61C 06:B60C: FF        .byte $FF   ; 
- D 1 - I - 0x01B61D 06:B60D: 00        .byte $00   ; 
- - - - - - 0x01B61E 06:B60E: 00        .byte $00   ; 
- D 1 - I - 0x01B61F 06:B60F: FF        .byte $FF   ; 
- - - - - - 0x01B620 06:B610: FF        .byte $FF   ; 
- D 1 - I - 0x01B621 06:B611: 00        .byte $00   ; 
- - - - - - 0x01B622 06:B612: 00        .byte $00   ; 
- D 1 - I - 0x01B623 06:B613: 00        .byte $00   ; 
- - - - - - 0x01B624 06:B614: 00        .byte $00   ; 
- D 1 - I - 0x01B625 06:B615: 00        .byte $00   ; 
- - - - - - 0x01B626 06:B616: 00        .byte $00   ; 
- D 1 - I - 0x01B627 06:B617: 00        .byte $00   ; 
- - - - - - 0x01B628 06:B618: 00        .byte $00   ; 
- D 1 - I - 0x01B629 06:B619: 00        .byte $00   ; 
- - - - - - 0x01B62A 06:B61A: 00        .byte $00   ; 
- D 1 - I - 0x01B62B 06:B61B: 00        .byte $00   ; 
- - - - - - 0x01B62C 06:B61C: 00        .byte $00   ; 
- D 1 - I - 0x01B62D 06:B61D: 00        .byte $00   ; 
- - - - - - 0x01B62E 06:B61E: 00        .byte $00   ; 
- D 1 - I - 0x01B62F 06:B61F: 00        .byte $00   ; 
- - - - - - 0x01B630 06:B620: 00        .byte $00   ; 
- - - - - - 0x01B631 06:B621: 00        .byte $00   ; 
- - - - - - 0x01B632 06:B622: 00        .byte $00   ; 
- D 1 - I - 0x01B633 06:B623: 00        .byte $00   ; 
- - - - - - 0x01B634 06:B624: 00        .byte $00   ; 
- - - - - - 0x01B635 06:B625: 00        .byte $00   ; 
- - - - - - 0x01B636 06:B626: 00        .byte $00   ; 
- - - - - - 0x01B637 06:B627: FF        .byte $FF   ; 
- - - - - - 0x01B638 06:B628: 00        .byte $00   ; 
- D 1 - I - 0x01B639 06:B629: FF        .byte $FF   ; 
- - - - - - 0x01B63A 06:B62A: FF        .byte $FF   ; 
- D 1 - I - 0x01B63B 06:B62B: 00        .byte $00   ; 
- - - - - - 0x01B63C 06:B62C: 00        .byte $00   ; 
- D 1 - I - 0x01B63D 06:B62D: 00        .byte $00   ; 
- - - - - - 0x01B63E 06:B62E: 00        .byte $00   ; 
- D 1 - I - 0x01B63F 06:B62F: 00        .byte $00   ; 
- - - - - - 0x01B640 06:B630: 00        .byte $00   ; 
- D 1 - I - 0x01B641 06:B631: 00        .byte $00   ; 
- - - - - - 0x01B642 06:B632: 00        .byte $00   ; 
- D 1 - I - 0x01B643 06:B633: 00        .byte $00   ; 
- - - - - - 0x01B644 06:B634: 00        .byte $00   ; 
- D 1 - I - 0x01B645 06:B635: 00        .byte $00   ; 
- - - - - - 0x01B646 06:B636: 00        .byte $00   ; 
- - - - - - 0x01B647 06:B637: 00        .byte $00   ; 
- - - - - - 0x01B648 06:B638: 00        .byte $00   ; 



off_B639:
- D 1 - I - 0x01B649 06:B639: FF        .byte $FF   ; 
- D 1 - I - 0x01B64A 06:B63A: FF        .byte $FF   ; 
- - - - - - 0x01B64B 06:B63B: 22        .byte $22   ; 
- D 1 - I - 0x01B64C 06:B63C: 22        .byte $22   ; 
- - - - - - 0x01B64D 06:B63D: FF        .byte $FF   ; 
- D 1 - I - 0x01B64E 06:B63E: FF        .byte $FF   ; 
- - - - - - 0x01B64F 06:B63F: 23        .byte $23   ; 
- D 1 - I - 0x01B650 06:B640: 23        .byte $23   ; 
- - - - - - 0x01B651 06:B641: FF        .byte $FF   ; 
- D 1 - I - 0x01B652 06:B642: FF        .byte $FF   ; 



tbl_B643:
- D 1 - I - 0x01B653 06:B643: 4B B6     .word off_B64B_00
- D 1 - I - 0x01B655 06:B645: 4E B6     .word off_B64E_01
- D 1 - I - 0x01B657 06:B647: 51 B6     .word off_B651_02
- D 1 - I - 0x01B659 06:B649: 54 B6     .word off_B654_03
off_B64B_00:
- D 1 - I - 0x01B65B 06:B64B: 44        .byte $44   ; 
- D 1 - I - 0x01B65C 06:B64C: 45        .byte $45   ; 
- D 1 - I - 0x01B65D 06:B64D: 45        .byte $45   ; 
off_B64E_01:
- D 1 - I - 0x01B65E 06:B64E: 44        .byte $44   ; 
- D 1 - I - 0x01B65F 06:B64F: 4A        .byte $4A   ; 
- D 1 - I - 0x01B660 06:B650: 4A        .byte $4A   ; 
off_B651_02:
- D 1 - I - 0x01B661 06:B651: 47        .byte $47   ; 
- D 1 - I - 0x01B662 06:B652: 46        .byte $46   ; 
- D 1 - I - 0x01B663 06:B653: 46        .byte $46   ; 
off_B654_03:
- D 1 - I - 0x01B664 06:B654: 01        .byte $01   ; 
- D 1 - I - 0x01B665 06:B655: 1E        .byte $1E   ; 
- D 1 - I - 0x01B666 06:B656: 1F        .byte $1F   ; 
- D 1 - I - 0x01B667 06:B657: 01        .byte $01   ; 
- D 1 - I - 0x01B668 06:B658: 01        .byte $01   ; 
- D 1 - I - 0x01B669 06:B659: 01        .byte $01   ; 
- D 1 - I - 0x01B66A 06:B65A: 01        .byte $01   ; 
- D 1 - I - 0x01B66B 06:B65B: 01        .byte $01   ; 



tbl_B65C:
- D 1 - I - 0x01B66C 06:B65C: 7A B6     .word off_B67A_00
- D 1 - I - 0x01B66E 06:B65E: 82 B6     .word off_B682_01
- D 1 - I - 0x01B670 06:B660: 87 B6     .word off_B687_02
- D 1 - I - 0x01B672 06:B662: 8A B6     .word off_B68A_03
- D 1 - I - 0x01B674 06:B664: 90 B6     .word off_B690_04
- D 1 - I - 0x01B676 06:B666: 93 B6     .word off_B693_05
- D 1 - I - 0x01B678 06:B668: 97 B6     .word off_B697_06
- D 1 - I - 0x01B67A 06:B66A: 9A B6     .word off_B69A_07
- D 1 - I - 0x01B67C 06:B66C: 9E B6     .word off_B69E_08
- D 1 - I - 0x01B67E 06:B66E: A4 B6     .word off_B6A4_09
- D 1 - I - 0x01B680 06:B670: A8 B6     .word off_B6A8_0A
- D 1 - I - 0x01B682 06:B672: AB B6     .word off_B6AB_0B
- D 1 - I - 0x01B684 06:B674: AE B6     .word off_B6AE_0C
- - - - - - 0x01B686 06:B676: B3 B6     .word off_B6B3_0D
- D 1 - I - 0x01B688 06:B678: B6 B6     .word off_B6B6_0E
off_B67A_00:
- D 1 - I - 0x01B68A 06:B67A: FF        .byte $FF   ; 
- D 1 - I - 0x01B68B 06:B67B: 0A        .byte $0A   ; 
- D 1 - I - 0x01B68C 06:B67C: 0B        .byte $0B   ; 
- D 1 - I - 0x01B68D 06:B67D: 0C        .byte $0C   ; 
- D 1 - I - 0x01B68E 06:B67E: 0D        .byte $0D   ; 
- D 1 - I - 0x01B68F 06:B67F: 0E        .byte $0E   ; 
- D 1 - I - 0x01B690 06:B680: FF        .byte $FF   ; 
- - - - - - 0x01B691 06:B681: FF        .byte $FF   ; 
off_B682_01:
- D 1 - I - 0x01B692 06:B682: FF        .byte $FF   ; 
- D 1 - I - 0x01B693 06:B683: 08        .byte $08   ; 
- D 1 - I - 0x01B694 06:B684: 09        .byte $09   ; 
- - - - - - 0x01B695 06:B685: FF        .byte $FF   ; 
- - - - - - 0x01B696 06:B686: FF        .byte $FF   ; 
off_B687_02:
- D 1 - I - 0x01B697 06:B687: 0F        .byte $0F   ; 
- D 1 - I - 0x01B698 06:B688: 04        .byte $04   ; 
- - - - - - 0x01B699 06:B689: FF        .byte $FF   ; 
off_B68A_03:
- D 1 - I - 0x01B69A 06:B68A: FF        .byte $FF   ; 
- D 1 - I - 0x01B69B 06:B68B: 05        .byte $05   ; 
- D 1 - I - 0x01B69C 06:B68C: 06        .byte $06   ; 
- D 1 - I - 0x01B69D 06:B68D: 07        .byte $07   ; 
- - - - - - 0x01B69E 06:B68E: FF        .byte $FF   ; 
- - - - - - 0x01B69F 06:B68F: FF        .byte $FF   ; 
off_B690_04:
- D 1 - I - 0x01B6A0 06:B690: 08        .byte $08   ; 
- D 1 - I - 0x01B6A1 06:B691: 09        .byte $09   ; 
- - - - - - 0x01B6A2 06:B692: FF        .byte $FF   ; 
off_B693_05:
- D 1 - I - 0x01B6A3 06:B693: 05        .byte $05   ; 
- D 1 - I - 0x01B6A4 06:B694: 06        .byte $06   ; 
- D 1 - I - 0x01B6A5 06:B695: 07        .byte $07   ; 
- - - - - - 0x01B6A6 06:B696: FF        .byte $FF   ; 
off_B697_06:
- D 1 - I - 0x01B6A7 06:B697: 11        .byte $11   ; 
- - - - - - 0x01B6A8 06:B698: FF        .byte $FF   ; 
- - - - - - 0x01B6A9 06:B699: FF        .byte $FF   ; 
off_B69A_07:
- D 1 - I - 0x01B6AA 06:B69A: FF        .byte $FF   ; 
- D 1 - I - 0x01B6AB 06:B69B: FF        .byte $FF   ; 
- D 1 - I - 0x01B6AC 06:B69C: 12        .byte $12   ; 
- - - - - - 0x01B6AD 06:B69D: FF        .byte $FF   ; 
off_B69E_08:
- D 1 - I - 0x01B6AE 06:B69E: 01        .byte $01   ; 
- D 1 - I - 0x01B6AF 06:B69F: 01        .byte $01   ; 
- D 1 - I - 0x01B6B0 06:B6A0: 01        .byte $01   ; 
- D 1 - I - 0x01B6B1 06:B6A1: FF        .byte $FF   ; 
- D 1 - I - 0x01B6B2 06:B6A2: FF        .byte $FF   ; 
- - - - - - 0x01B6B3 06:B6A3: FF        .byte $FF   ; 
off_B6A4_09:
- D 1 - I - 0x01B6B4 06:B6A4: FF        .byte $FF   ; 
- D 1 - I - 0x01B6B5 06:B6A5: 14        .byte $14   ; 
- D 1 - I - 0x01B6B6 06:B6A6: FF        .byte $FF   ; 
- D 1 - I - 0x01B6B7 06:B6A7: FF        .byte $FF   ; 
off_B6A8_0A:
- D 1 - I - 0x01B6B8 06:B6A8: 16        .byte $16   ; 
- D 1 - I - 0x01B6B9 06:B6A9: 17        .byte $17   ; 
- - - - - - 0x01B6BA 06:B6AA: FF        .byte $FF   ; 
off_B6AB_0B:
- D 1 - I - 0x01B6BB 06:B6AB: 18        .byte $18   ; 
- D 1 - I - 0x01B6BC 06:B6AC: 19        .byte $19   ; 
- D 1 - I - 0x01B6BD 06:B6AD: FF        .byte $FF   ; 
off_B6AE_0C:
- D 1 - I - 0x01B6BE 06:B6AE: 1A        .byte $1A   ; 
- D 1 - I - 0x01B6BF 06:B6AF: 1B        .byte $1B   ; 
- D 1 - I - 0x01B6C0 06:B6B0: 1C        .byte $1C   ; 
- D 1 - I - 0x01B6C1 06:B6B1: 1D        .byte $1D   ; 
- - - - - - 0x01B6C2 06:B6B2: FF        .byte $FF   ; 
off_B6B3_0D:
- - - - - - 0x01B6C3 06:B6B3: FF        .byte $FF   ; 
- - - - - - 0x01B6C4 06:B6B4: 01        .byte $01   ; 
- - - - - - 0x01B6C5 06:B6B5: FF        .byte $FF   ; 
off_B6B6_0E:
- D 1 - I - 0x01B6C6 06:B6B6: FF        .byte $FF   ; 
- D 1 - I - 0x01B6C7 06:B6B7: FF        .byte $FF   ; 
- D 1 - I - 0x01B6C8 06:B6B8: FF        .byte $FF   ; 
- D 1 - I - 0x01B6C9 06:B6B9: FF        .byte $FF   ; 
- D 1 - I - 0x01B6CA 06:B6BA: FF        .byte $FF   ; 
- D 1 - I - 0x01B6CB 06:B6BB: FF        .byte $FF   ; 
- D 1 - I - 0x01B6CC 06:B6BC: FF        .byte $FF   ; 
- D 1 - I - 0x01B6CD 06:B6BD: 13        .byte $13   ; 



tbl_B6BE:
- D 1 - I - 0x01B6CE 06:B6BE: 06 B7     .word off_B706_00
- D 1 - I - 0x01B6D0 06:B6C0: 0B B7     .word off_B70B_01
- D 1 - I - 0x01B6D2 06:B6C2: 10 B7     .word off_B710_02
- D 1 - I - 0x01B6D4 06:B6C4: 15 B7     .word off_B715_03
- D 1 - I - 0x01B6D6 06:B6C6: 1A B7     .word off_B71A_04
- D 1 - I - 0x01B6D8 06:B6C8: 1F B7     .word off_B71F_05
- D 1 - I - 0x01B6DA 06:B6CA: 24 B7     .word off_B724_06
- D 1 - I - 0x01B6DC 06:B6CC: 29 B7     .word off_B729_07
- D 1 - I - 0x01B6DE 06:B6CE: 2E B7     .word off_B72E_08
- D 1 - I - 0x01B6E0 06:B6D0: 33 B7     .word off_B733_09
- D 1 - I - 0x01B6E2 06:B6D2: 38 B7     .word off_B738_0A
- D 1 - I - 0x01B6E4 06:B6D4: 3D B7     .word off_B73D_0B
- D 1 - I - 0x01B6E6 06:B6D6: 42 B7     .word off_B742_0C
- D 1 - I - 0x01B6E8 06:B6D8: 47 B7     .word off_B747_0D
- D 1 - I - 0x01B6EA 06:B6DA: 4C B7     .word off_B74C_0E
- D 1 - I - 0x01B6EC 06:B6DC: 51 B7     .word off_B751_0F
- D 1 - I - 0x01B6EE 06:B6DE: 56 B7     .word off_B756_10
- D 1 - I - 0x01B6F0 06:B6E0: 5B B7     .word off_B75B_11
- D 1 - I - 0x01B6F2 06:B6E2: 60 B7     .word off_B760_12
- D 1 - I - 0x01B6F4 06:B6E4: 65 B7     .word off_B765_13
- D 1 - I - 0x01B6F6 06:B6E6: 6A B7     .word off_B76A_14
- D 1 - I - 0x01B6F8 06:B6E8: 6F B7     .word off_B76F_15
- D 1 - I - 0x01B6FA 06:B6EA: 74 B7     .word off_B774_16
- D 1 - I - 0x01B6FC 06:B6EC: 79 B7     .word off_B779_17
- D 1 - I - 0x01B6FE 06:B6EE: 7E B7     .word off_B77E_18
- D 1 - I - 0x01B700 06:B6F0: 83 B7     .word off_B783_19
- D 1 - I - 0x01B702 06:B6F2: 88 B7     .word off_B788_1A
- D 1 - I - 0x01B704 06:B6F4: 8D B7     .word off_B78D_1B
- D 1 - I - 0x01B706 06:B6F6: 92 B7     .word off_B792_1C
- D 1 - I - 0x01B708 06:B6F8: 97 B7     .word off_B797_1D
- D 1 - I - 0x01B70A 06:B6FA: 9C B7     .word off_B79C_1E
- D 1 - I - 0x01B70C 06:B6FC: A1 B7     .word off_B7A1_1F
- D 1 - I - 0x01B70E 06:B6FE: A6 B7     .word off_B7A6_20
- D 1 - I - 0x01B710 06:B700: AB B7     .word off_B7AB_21
- D 1 - I - 0x01B712 06:B702: B0 B7     .word off_B7B0_22
- D 1 - I - 0x01B714 06:B704: B5 B7     .word off_B7B5_23
off_B706_00:
- D 1 - I - 0x01B716 06:B706: 08        .byte $08   ; 
- D 1 - I - 0x01B717 06:B707: 08        .byte $08   ; 
- D 1 - I - 0x01B718 06:B708: 06        .byte $06   ; 
- D 1 - I - 0x01B719 06:B709: 10        .byte $10   ; 
- D 1 - I - 0x01B71A 06:B70A: 00        .byte $00   ; 
off_B70B_01:
- D 1 - I - 0x01B71B 06:B70B: 08        .byte $08   ; 
- D 1 - I - 0x01B71C 06:B70C: 08        .byte $08   ; 
- D 1 - I - 0x01B71D 06:B70D: 04        .byte $04   ; 
- D 1 - I - 0x01B71E 06:B70E: 20        .byte $20   ; 
- D 1 - I - 0x01B71F 06:B70F: 00        .byte $00   ; 
off_B710_02:
- D 1 - I - 0x01B720 06:B710: 08        .byte $08   ; 
- D 1 - I - 0x01B721 06:B711: 08        .byte $08   ; 
- D 1 - I - 0x01B722 06:B712: 04        .byte $04   ; 
- D 1 - I - 0x01B723 06:B713: 18        .byte $18   ; 
- D 1 - I - 0x01B724 06:B714: 00        .byte $00   ; 
off_B715_03:
- D 1 - I - 0x01B725 06:B715: 10        .byte $10   ; 
- D 1 - I - 0x01B726 06:B716: 10        .byte $10   ; 
- D 1 - I - 0x01B727 06:B717: 04        .byte $04   ; 
- D 1 - I - 0x01B728 06:B718: 10        .byte $10   ; 
- D 1 - I - 0x01B729 06:B719: 00        .byte $00   ; 
off_B71A_04:
- D 1 - I - 0x01B72A 06:B71A: F8        .byte $F8   ; 
- D 1 - I - 0x01B72B 06:B71B: 10        .byte $10   ; 
- D 1 - I - 0x01B72C 06:B71C: 04        .byte $04   ; 
- D 1 - I - 0x01B72D 06:B71D: 0C        .byte $0C   ; 
- D 1 - I - 0x01B72E 06:B71E: 00        .byte $00   ; 
off_B71F_05:
- D 1 - I - 0x01B72F 06:B71F: 0C        .byte $0C   ; 
- D 1 - I - 0x01B730 06:B720: 02        .byte $02   ; 
- D 1 - I - 0x01B731 06:B721: 04        .byte $04   ; 
- D 1 - I - 0x01B732 06:B722: 0C        .byte $0C   ; 
- D 1 - I - 0x01B733 06:B723: FC        .byte $FC   ; 
off_B724_06:
- D 1 - I - 0x01B734 06:B724: 08        .byte $08   ; 
- D 1 - I - 0x01B735 06:B725: 02        .byte $02   ; 
- D 1 - I - 0x01B736 06:B726: 04        .byte $04   ; 
- D 1 - I - 0x01B737 06:B727: 0C        .byte $0C   ; 
- D 1 - I - 0x01B738 06:B728: FC        .byte $FC   ; 
off_B729_07:
- D 1 - I - 0x01B739 06:B729: 08        .byte $08   ; 
- D 1 - I - 0x01B73A 06:B72A: 10        .byte $10   ; 
- D 1 - I - 0x01B73B 06:B72B: 04        .byte $04   ; 
- D 1 - I - 0x01B73C 06:B72C: 0C        .byte $0C   ; 
- D 1 - I - 0x01B73D 06:B72D: FC        .byte $FC   ; 
off_B72E_08:
- D 1 - I - 0x01B73E 06:B72E: 0C        .byte $0C   ; 
- D 1 - I - 0x01B73F 06:B72F: 04        .byte $04   ; 
- D 1 - I - 0x01B740 06:B730: 04        .byte $04   ; 
- D 1 - I - 0x01B741 06:B731: 20        .byte $20   ; 
- D 1 - I - 0x01B742 06:B732: E8        .byte $E8   ; 
off_B733_09:
- D 1 - I - 0x01B743 06:B733: 04        .byte $04   ; 
- D 1 - I - 0x01B744 06:B734: 0C        .byte $0C   ; 
- D 1 - I - 0x01B745 06:B735: 04        .byte $04   ; 
- D 1 - I - 0x01B746 06:B736: 20        .byte $20   ; 
- D 1 - I - 0x01B747 06:B737: E8        .byte $E8   ; 
off_B738_0A:
- D 1 - I - 0x01B748 06:B738: 08        .byte $08   ; 
- D 1 - I - 0x01B749 06:B739: 08        .byte $08   ; 
- D 1 - I - 0x01B74A 06:B73A: 04        .byte $04   ; 
- D 1 - I - 0x01B74B 06:B73B: 18        .byte $18   ; 
- D 1 - I - 0x01B74C 06:B73C: F0        .byte $F0   ; 
off_B73D_0B:
- D 1 - I - 0x01B74D 06:B73D: 00        .byte $00   ; 
- D 1 - I - 0x01B74E 06:B73E: 10        .byte $10   ; 
- D 1 - I - 0x01B74F 06:B73F: 04        .byte $04   ; 
- D 1 - I - 0x01B750 06:B740: 18        .byte $18   ; 
- D 1 - I - 0x01B751 06:B741: F0        .byte $F0   ; 
off_B742_0C:
- D 1 - I - 0x01B752 06:B742: 08        .byte $08   ; 
- D 1 - I - 0x01B753 06:B743: 08        .byte $08   ; 
- D 1 - I - 0x01B754 06:B744: 04        .byte $04   ; 
- D 1 - I - 0x01B755 06:B745: 20        .byte $20   ; 
- D 1 - I - 0x01B756 06:B746: F0        .byte $F0   ; 
off_B747_0D:
- D 1 - I - 0x01B757 06:B747: 10        .byte $10   ; 
- D 1 - I - 0x01B758 06:B748: 08        .byte $08   ; 
- D 1 - I - 0x01B759 06:B749: 04        .byte $04   ; 
- D 1 - I - 0x01B75A 06:B74A: 18        .byte $18   ; 
- D 1 - I - 0x01B75B 06:B74B: F0        .byte $F0   ; 
off_B74C_0E:
- D 1 - I - 0x01B75C 06:B74C: 10        .byte $10   ; 
- D 1 - I - 0x01B75D 06:B74D: 00        .byte $00   ; 
- D 1 - I - 0x01B75E 06:B74E: 04        .byte $04   ; 
- D 1 - I - 0x01B75F 06:B74F: 18        .byte $18   ; 
- D 1 - I - 0x01B760 06:B750: F0        .byte $F0   ; 
off_B751_0F:
- D 1 - I - 0x01B761 06:B751: 04        .byte $04   ; 
- D 1 - I - 0x01B762 06:B752: 12        .byte $12   ; 
- D 1 - I - 0x01B763 06:B753: 06        .byte $06   ; 
- D 1 - I - 0x01B764 06:B754: 14        .byte $14   ; 
- D 1 - I - 0x01B765 06:B755: F4        .byte $F4   ; 
off_B756_10:
- D 1 - I - 0x01B766 06:B756: 00        .byte $00   ; 
- D 1 - I - 0x01B767 06:B757: 10        .byte $10   ; 
- D 1 - I - 0x01B768 06:B758: 04        .byte $04   ; 
- D 1 - I - 0x01B769 06:B759: 0F        .byte $0F   ; 
- D 1 - I - 0x01B76A 06:B75A: 00        .byte $00   ; 
off_B75B_11:
- D 1 - I - 0x01B76B 06:B75B: 08        .byte $08   ; 
- D 1 - I - 0x01B76C 06:B75C: 08        .byte $08   ; 
- - - - - - 0x01B76D 06:B75D: 04        .byte $04   ; 
- D 1 - I - 0x01B76E 06:B75E: 0C        .byte $0C   ; 
- D 1 - I - 0x01B76F 06:B75F: 00        .byte $00   ; 
off_B760_12:
- D 1 - I - 0x01B770 06:B760: 08        .byte $08   ; 
- D 1 - I - 0x01B771 06:B761: 08        .byte $08   ; 
- - - - - - 0x01B772 06:B762: 04        .byte $04   ; 
- D 1 - I - 0x01B773 06:B763: 20        .byte $20   ; 
- - - - - - 0x01B774 06:B764: E8        .byte $E8   ; 
off_B765_13:
- D 1 - I - 0x01B775 06:B765: 08        .byte $08   ; 
- D 1 - I - 0x01B776 06:B766: 08        .byte $08   ; 
- D 1 - I - 0x01B777 06:B767: 04        .byte $04   ; 
- D 1 - I - 0x01B778 06:B768: 20        .byte $20   ; 
- D 1 - I - 0x01B779 06:B769: FE        .byte $FE   ; 
off_B76A_14:
- D 1 - I - 0x01B77A 06:B76A: 00        .byte $00   ; 
- D 1 - I - 0x01B77B 06:B76B: 10        .byte $10   ; 
- D 1 - I - 0x01B77C 06:B76C: 04        .byte $04   ; 
- D 1 - I - 0x01B77D 06:B76D: 0C        .byte $0C   ; 
- D 1 - I - 0x01B77E 06:B76E: 00        .byte $00   ; 
off_B76F_15:
- D 1 - I - 0x01B77F 06:B76F: 08        .byte $08   ; 
- D 1 - I - 0x01B780 06:B770: 08        .byte $08   ; 
- D 1 - I - 0x01B781 06:B771: 04        .byte $04   ; 
- D 1 - I - 0x01B782 06:B772: 20        .byte $20   ; 
- D 1 - I - 0x01B783 06:B773: 00        .byte $00   ; 
off_B774_16:
- D 1 - I - 0x01B784 06:B774: 08        .byte $08   ; 
- D 1 - I - 0x01B785 06:B775: 08        .byte $08   ; 
- D 1 - I - 0x01B786 06:B776: 04        .byte $04   ; 
- D 1 - I - 0x01B787 06:B777: 0C        .byte $0C   ; 
- D 1 - I - 0x01B788 06:B778: 00        .byte $00   ; 
off_B779_17:
- D 1 - I - 0x01B789 06:B779: 08        .byte $08   ; 
- - - - - - 0x01B78A 06:B77A: 10        .byte $10   ; 
- D 1 - I - 0x01B78B 06:B77B: 04        .byte $04   ; 
- - - - - - 0x01B78C 06:B77C: 0C        .byte $0C   ; 
- - - - - - 0x01B78D 06:B77D: 00        .byte $00   ; 
off_B77E_18:
- D 1 - I - 0x01B78E 06:B77E: 08        .byte $08   ; 
- D 1 - I - 0x01B78F 06:B77F: 10        .byte $10   ; 
- D 1 - I - 0x01B790 06:B780: 04        .byte $04   ; 
- D 1 - I - 0x01B791 06:B781: 0C        .byte $0C   ; 
- D 1 - I - 0x01B792 06:B782: F8        .byte $F8   ; 
off_B783_19:
- D 1 - I - 0x01B793 06:B783: 10        .byte $10   ; 
- D 1 - I - 0x01B794 06:B784: 08        .byte $08   ; 
- D 1 - I - 0x01B795 06:B785: 04        .byte $04   ; 
- D 1 - I - 0x01B796 06:B786: 0C        .byte $0C   ; 
- D 1 - I - 0x01B797 06:B787: F8        .byte $F8   ; 
off_B788_1A:
- D 1 - I - 0x01B798 06:B788: 0C        .byte $0C   ; 
- D 1 - I - 0x01B799 06:B789: 0C        .byte $0C   ; 
- D 1 - I - 0x01B79A 06:B78A: 04        .byte $04   ; 
- D 1 - I - 0x01B79B 06:B78B: 1E        .byte $1E   ; 
- D 1 - I - 0x01B79C 06:B78C: FE        .byte $FE   ; 
off_B78D_1B:
- D 1 - I - 0x01B79D 06:B78D: 0C        .byte $0C   ; 
- D 1 - I - 0x01B79E 06:B78E: 0C        .byte $0C   ; 
- D 1 - I - 0x01B79F 06:B78F: 04        .byte $04   ; 
- D 1 - I - 0x01B7A0 06:B790: 1E        .byte $1E   ; 
- - - - - - 0x01B7A1 06:B791: FE        .byte $FE   ; 
off_B792_1C:
- D 1 - I - 0x01B7A2 06:B792: 0C        .byte $0C   ; 
- D 1 - I - 0x01B7A3 06:B793: 0C        .byte $0C   ; 
- D 1 - I - 0x01B7A4 06:B794: 04        .byte $04   ; 
- D 1 - I - 0x01B7A5 06:B795: 1E        .byte $1E   ; 
- - - - - - 0x01B7A6 06:B796: FE        .byte $FE   ; 
off_B797_1D:
- - - - - - 0x01B7A7 06:B797: 0C        .byte $0C   ; 
- D 1 - I - 0x01B7A8 06:B798: 0C        .byte $0C   ; 
- D 1 - I - 0x01B7A9 06:B799: 04        .byte $04   ; 
- D 1 - I - 0x01B7AA 06:B79A: 1E        .byte $1E   ; 
- D 1 - I - 0x01B7AB 06:B79B: FE        .byte $FE   ; 
off_B79C_1E:
- D 1 - I - 0x01B7AC 06:B79C: 04        .byte $04   ; 
- D 1 - I - 0x01B7AD 06:B79D: 0C        .byte $0C   ; 
- D 1 - I - 0x01B7AE 06:B79E: 08        .byte $08   ; 
- D 1 - I - 0x01B7AF 06:B79F: 20        .byte $20   ; 
- D 1 - I - 0x01B7B0 06:B7A0: 00        .byte $00   ; 
off_B7A1_1F:
- - - - - - 0x01B7B1 06:B7A1: 08        .byte $08   ; 
- - - - - - 0x01B7B2 06:B7A2: 08        .byte $08   ; 
- D 1 - I - 0x01B7B3 06:B7A3: 04        .byte $04   ; 
- - - - - - 0x01B7B4 06:B7A4: 40        .byte $40   ; 
- - - - - - 0x01B7B5 06:B7A5: 00        .byte $00   ; 
off_B7A6_20:
- D 1 - I - 0x01B7B6 06:B7A6: 04        .byte $04   ; 
- D 1 - I - 0x01B7B7 06:B7A7: 0C        .byte $0C   ; 
- D 1 - I - 0x01B7B8 06:B7A8: 0C        .byte $0C   ; 
- D 1 - I - 0x01B7B9 06:B7A9: 18        .byte $18   ; 
- D 1 - I - 0x01B7BA 06:B7AA: 00        .byte $00   ; 
off_B7AB_21:
- D 1 - I - 0x01B7BB 06:B7AB: 0C        .byte $0C   ; 
- D 1 - I - 0x01B7BC 06:B7AC: 0C        .byte $0C   ; 
- D 1 - I - 0x01B7BD 06:B7AD: 12        .byte $12   ; 
- D 1 - I - 0x01B7BE 06:B7AE: 20        .byte $20   ; 
- D 1 - I - 0x01B7BF 06:B7AF: 00        .byte $00   ; 
off_B7B0_22:
- D 1 - I - 0x01B7C0 06:B7B0: 20        .byte $20   ; 
- D 1 - I - 0x01B7C1 06:B7B1: 20        .byte $20   ; 
- D 1 - I - 0x01B7C2 06:B7B2: 10        .byte $10   ; 
- D 1 - I - 0x01B7C3 06:B7B3: 20        .byte $20   ; 
- D 1 - I - 0x01B7C4 06:B7B4: 00        .byte $00   ; 
off_B7B5_23:
- - - - - - 0x01B7C5 06:B7B5: 08        .byte $08   ; 
- - - - - - 0x01B7C6 06:B7B6: 08        .byte $08   ; 
- - - - - - 0x01B7C7 06:B7B7: 04        .byte $04   ; 
- - - - - - 0x01B7C8 06:B7B8: 20        .byte $20   ; 
- - - - - - 0x01B7C9 06:B7B9: 00        .byte $00   ; 



sub_B7BA:
C - - - - - 0x01B7CA 06:B7BA: A9 00     LDA #$00
C - - - - - 0x01B7CC 06:B7BC: 85 1C     STA ram_001C
C - - - - - 0x01B7CE 06:B7BE: A5 58     LDA ram_script
C - - - - - 0x01B7D0 06:B7C0: F0 03     BEQ bra_B7C5_gameplay
C - - - - - 0x01B7D2 06:B7C2: 4C 9B B8  RTS
bra_B7C5_gameplay:
C - - - - - 0x01B7D5 06:B7C5: E0 0C     CPX #$0C
C - - - - - 0x01B7D7 06:B7C7: D0 02     BNE bra_B7CB
C - - - - - 0x01B7D9 06:B7C9: A9 02     LDA #$02
bra_B7CB:
C - - - - - 0x01B7DB 06:B7CB: 85 1D     STA ram_001D
C - - - - - 0x01B7DD 06:B7CD: A4 1D     LDY ram_001D
C - - - - - 0x01B7DF 06:B7CF: 38        SEC
C - - - - - 0x01B7E0 06:B7D0: BD 4D 03  LDA ram_pos_Y_lo_player,X
C - - - - - 0x01B7E3 06:B7D3: 85 30     STA ram_0030
C - - - - - 0x01B7E5 06:B7D5: F9 9C B8  SBC tbl_B89C,Y
C - - - - - 0x01B7E8 06:B7D8: 85 2C     STA ram_002C
C - - - - - 0x01B7EA 06:B7DA: BD 60 03  LDA ram_pos_Y_hi_player,X
C - - - - - 0x01B7ED 06:B7DD: 85 31     STA ram_0031
C - - - - - 0x01B7EF 06:B7DF: F9 9D B8  SBC tbl_B89D,Y
C - - - - - 0x01B7F2 06:B7E2: 85 2D     STA ram_002D
C - - - - - 0x01B7F4 06:B7E4: 30 16     BMI bra_B7FC
C - - - - - 0x01B7F6 06:B7E6: 38        SEC
C - - - - - 0x01B7F7 06:B7E7: BD 4D 03  LDA ram_pos_Y_lo_player,X
C - - - - - 0x01B7FA 06:B7EA: F9 A0 B8  SBC tbl_B8A0,Y
C - - - - - 0x01B7FD 06:B7ED: BD 60 03  LDA ram_pos_Y_hi_player,X
C - - - - - 0x01B800 06:B7F0: F9 A1 B8  SBC tbl_B8A1,Y
C - - - - - 0x01B803 06:B7F3: 30 1B     BMI bra_B810
C - - - - - 0x01B805 06:B7F5: A5 1D     LDA ram_001D
C - - - - - 0x01B807 06:B7F7: 09 04     ORA #$04
C - - - - - 0x01B809 06:B7F9: A8        TAY
C - - - - - 0x01B80A 06:B7FA: 10 08     BPL bra_B804
bra_B7FC:
C - - - - - 0x01B80C 06:B7FC: A4 1D     LDY ram_001D
C - - - - - 0x01B80E 06:B7FE: A9 00     LDA #$00
C - - - - - 0x01B810 06:B800: 85 2C     STA ram_002C
C - - - - - 0x01B812 06:B802: 85 2D     STA ram_002D
bra_B804:
C - - - - - 0x01B814 06:B804: B9 9C B8  LDA tbl_B89C,Y
C - - - - - 0x01B817 06:B807: 85 30     STA ram_0030
C - - - - - 0x01B819 06:B809: B9 9D B8  LDA tbl_B89D,Y
C - - - - - 0x01B81C 06:B80C: 85 31     STA ram_0031
C - - - - - 0x01B81E 06:B80E: E6 1C     INC ram_001C
bra_B810:
C - - - - - 0x01B820 06:B810: A0 00     LDY #$00
bra_B812:
C - - - - - 0x01B822 06:B812: 46 2D     LSR ram_002D
C - - - - - 0x01B824 06:B814: 66 2C     ROR ram_002C
C - - - - - 0x01B826 06:B816: C8        INY
C - - - - - 0x01B827 06:B817: C0 03     CPY #$03
C - - - - - 0x01B829 06:B819: 90 F7     BCC bra_B812
C - - - - - 0x01B82B 06:B81B: A4 1D     LDY ram_001D
C - - - - - 0x01B82D 06:B81D: 38        SEC
C - - - - - 0x01B82E 06:B81E: B9 A4 B8  LDA tbl_B8A4,Y
C - - - - - 0x01B831 06:B821: E5 2C     SBC ram_002C
C - - - - - 0x01B833 06:B823: 85 2E     STA ram_002E
C - - - - - 0x01B835 06:B825: B9 A5 B8  LDA tbl_B8A5,Y
C - - - - - 0x01B838 06:B828: E5 2D     SBC ram_002D
C - - - - - 0x01B83A 06:B82A: 85 2F     STA ram_002F
C - - - - - 0x01B83C 06:B82C: 38        SEC
C - - - - - 0x01B83D 06:B82D: BD 14 03  LDA ram_pos_X_lo_player,X
C - - - - - 0x01B840 06:B830: 85 32     STA ram_0032
C - - - - - 0x01B842 06:B832: E5 2E     SBC ram_002E
C - - - - - 0x01B844 06:B834: BD 27 03  LDA ram_pos_X_hi_player,X
C - - - - - 0x01B847 06:B837: 85 33     STA ram_0033
C - - - - - 0x01B849 06:B839: E5 2F     SBC ram_002F
C - - - - - 0x01B84B 06:B83B: 30 23     BMI bra_B860
C - - - - - 0x01B84D 06:B83D: 18        CLC
C - - - - - 0x01B84E 06:B83E: B9 A8 B8  LDA tbl_B8A8,Y
C - - - - - 0x01B851 06:B841: 65 2C     ADC ram_002C
C - - - - - 0x01B853 06:B843: 85 2E     STA ram_002E
C - - - - - 0x01B855 06:B845: B9 A9 B8  LDA tbl_B8A9,Y
C - - - - - 0x01B858 06:B848: 65 2D     ADC ram_002D
C - - - - - 0x01B85A 06:B84A: 85 2F     STA ram_002F
C - - - - - 0x01B85C 06:B84C: 38        SEC
C - - - - - 0x01B85D 06:B84D: BD 14 03  LDA ram_pos_X_lo_player,X
C - - - - - 0x01B860 06:B850: E5 2E     SBC ram_002E
C - - - - - 0x01B862 06:B852: BD 27 03  LDA ram_pos_X_hi_player,X
C - - - - - 0x01B865 06:B855: E5 2F     SBC ram_002F
C - - - - - 0x01B867 06:B857: 30 2D     BMI bra_B886
C - - - - - 0x01B869 06:B859: A5 1D     LDA ram_001D
C - - - - - 0x01B86B 06:B85B: 09 04     ORA #$04
C - - - - - 0x01B86D 06:B85D: A8        TAY
C - - - - - 0x01B86E 06:B85E: 10 13     BPL bra_B873
bra_B860:
C - - - - - 0x01B870 06:B860: A4 1D     LDY ram_001D
C - - - - - 0x01B872 06:B862: 18        CLC
C - - - - - 0x01B873 06:B863: A5 2C     LDA ram_002C
C - - - - - 0x01B875 06:B865: 49 FF     EOR #$FF
C - - - - - 0x01B877 06:B867: 69 01     ADC #$01
C - - - - - 0x01B879 06:B869: 85 2C     STA ram_002C
C - - - - - 0x01B87B 06:B86B: A5 2D     LDA ram_002D
C - - - - - 0x01B87D 06:B86D: 49 FF     EOR #$FF
C - - - - - 0x01B87F 06:B86F: 69 00     ADC #$00
C - - - - - 0x01B881 06:B871: 85 2D     STA ram_002D
bra_B873:
C - - - - - 0x01B883 06:B873: 18        CLC
C - - - - - 0x01B884 06:B874: B9 A4 B8  LDA tbl_B8A4,Y
C - - - - - 0x01B887 06:B877: 65 2C     ADC ram_002C
C - - - - - 0x01B889 06:B879: 85 32     STA ram_0032
C - - - - - 0x01B88B 06:B87B: B9 A5 B8  LDA tbl_B8A5,Y
C - - - - - 0x01B88E 06:B87E: 65 2D     ADC ram_002D
C - - - - - 0x01B890 06:B880: 85 33     STA ram_0033
C - - - - - 0x01B892 06:B882: E6 1C     INC ram_001C
C - - - - - 0x01B894 06:B884: E6 1C     INC ram_001C
bra_B886:
C - - - - - 0x01B896 06:B886: A5 5C     LDA ram_flag_gameplay
C - - - - - 0x01B898 06:B888: 29 0C     AND #$0C
C - - - - - 0x01B89A 06:B88A: F0 0F     BEQ bra_B89B_RTS
C - - - - - 0x01B89C 06:B88C: EC D6 04  CPX ram_игрок_с_мячом
C - - - - - 0x01B89F 06:B88F: D0 0A     BNE bra_B89B_RTS
C - - - - - 0x01B8A1 06:B891: A5 57     LDA ram_option_mode_difficulty
C - - - - - 0x01B8A3 06:B893: 29 20     AND #con_gm_penalty
C - - - - - 0x01B8A5 06:B895: D0 04     BNE bra_B89B_RTS
C - - - - - 0x01B8A7 06:B897: A9 00     LDA #$00
C - - - - - 0x01B8A9 06:B899: 85 1C     STA ram_001C
bra_B89B_RTS:
C D 1 - - - 0x01B8AB 06:B89B: 60        RTS



tbl_B89C:
- D 1 - - - 0x01B8AC 06:B89C: 28        .byte $28   ; 
tbl_B89D:
- D 1 - - - 0x01B8AD 06:B89D: 00        .byte $00   ; 
- D 1 - - - 0x01B8AE 06:B89E: 30        .byte $30   ; 
- D 1 - - - 0x01B8AF 06:B89F: 00        .byte $00   ; 



tbl_B8A0:
- D 1 - - - 0x01B8B0 06:B8A0: 60        .byte $60   ; 
tbl_B8A1:
- D 1 - - - 0x01B8B1 06:B8A1: 01        .byte $01   ; 
- D 1 - - - 0x01B8B2 06:B8A2: 5C        .byte $5C   ; 
- D 1 - - - 0x01B8B3 06:B8A3: 01        .byte $01   ; 



tbl_B8A4:
- D 1 - - - 0x01B8B4 06:B8A4: A8        .byte $A8   ; 
tbl_B8A5:
- D 1 - - - 0x01B8B5 06:B8A5: 00        .byte $00   ; 
- D 1 - - - 0x01B8B6 06:B8A6: A0        .byte $A0   ; 
- D 1 - - - 0x01B8B7 06:B8A7: 00        .byte $00   ; 



tbl_B8A8:
- D 1 - - - 0x01B8B8 06:B8A8: 58        .byte $58   ; 
tbl_B8A9:
- D 1 - - - 0x01B8B9 06:B8A9: 03        .byte $03   ; 
- D 1 - - - 0x01B8BA 06:B8AA: 60        .byte $60   ; 
- D 1 - - - 0x01B8BB 06:B8AB: 03        .byte $03   ; 



sub_B8AC:
C - - - - - 0x01B8BC 06:B8AC: A5 1C     LDA ram_001C
C - - - - - 0x01B8BE 06:B8AE: F0 14     BEQ bra_B8C4_RTS
C - - - - - 0x01B8C0 06:B8B0: A5 30     LDA ram_0030
C - - - - - 0x01B8C2 06:B8B2: 9D 4D 03  STA ram_pos_Y_lo_player,X
C - - - - - 0x01B8C5 06:B8B5: A5 31     LDA ram_0031
C - - - - - 0x01B8C7 06:B8B7: 9D 60 03  STA ram_pos_Y_hi_player,X
C - - - - - 0x01B8CA 06:B8BA: A5 32     LDA ram_0032
C - - - - - 0x01B8CC 06:B8BC: 9D 14 03  STA ram_pos_X_lo_player,X
C - - - - - 0x01B8CF 06:B8BF: A5 33     LDA ram_0033
C - - - - - 0x01B8D1 06:B8C1: 9D 27 03  STA ram_pos_X_hi_player,X
bra_B8C4_RTS:
C - - - - - 0x01B8D4 06:B8C4: 60        RTS



sub_B8C5:
C - - - - - 0x01B8D5 06:B8C5: 20 BA B7  JSR sub_B7BA
C - - - - - 0x01B8D8 06:B8C8: A5 1C     LDA ram_001C
C - - - - - 0x01B8DA 06:B8CA: D0 03     BNE bra_B8CF
C - - - - - 0x01B8DC 06:B8CC: 4C 2B BA  JMP loc_BA2B
bra_B8CF:
C - - - - - 0x01B8DF 06:B8CF: C9 01     CMP #$01
C - - - - - 0x01B8E1 06:B8D1: D0 03     BNE bra_B8D6
C - - - - - 0x01B8E3 06:B8D3: 4C F5 B9  JMP loc_B9F5
bra_B8D6:
C - - - - - 0x01B8E6 06:B8D6: A5 5C     LDA ram_flag_gameplay
C - - - - - 0x01B8E8 06:B8D8: 29 0C     AND #$0C
C - - - - - 0x01B8EA 06:B8DA: F0 09     BEQ bra_B8E5
C - - - - - 0x01B8EC 06:B8DC: A5 57     LDA ram_option_mode_difficulty
C - - - - - 0x01B8EE 06:B8DE: 29 20     AND #con_gm_penalty
C - - - - - 0x01B8F0 06:B8E0: D0 03     BNE bra_B8E5
C - - - - - 0x01B8F2 06:B8E2: 4C 30 BA  RTS
bra_B8E5:
C - - - - - 0x01B8F5 06:B8E5: 20 B6 BA  JSR sub_BAB6
C - - - - - 0x01B8F8 06:B8E8: A5 1C     LDA ram_001C
C - - - - - 0x01B8FA 06:B8EA: F0 5E     BEQ bra_B94A
C - - - - - 0x01B8FC 06:B8EC: 30 77     BMI bra_B965
C - - - - - 0x01B8FE 06:B8EE: AD 0E 05  LDA ram_flag_transparent_ball
C - - - - - 0x01B901 06:B8F1: F0 03     BEQ bra_B8F6
C - - - - - 0x01B903 06:B8F3: 4C BB B9  JMP loc_B9BB
bra_B8F6:
C - - - - - 0x01B906 06:B8F6: 20 99 BB  JSR sub_BB99
C - - - - - 0x01B909 06:B8F9: 20 31 BA  JSR sub_BA31
C - - - - - 0x01B90C 06:B8FC: AD F0 04  LDA ram_hp_ball
C - - - - - 0x01B90F 06:B8FF: F0 19     BEQ bra_B91A
C - - - - - 0x01B911 06:B901: 20 C8 BC  JSR sub_BCC8
C - - - - - 0x01B914 06:B904: A9 27     LDA #con_sfx_goalpost
C - - - - - 0x01B916 06:B906: 20 E4 C2  JSR sub_0x01C2F4_play_sound
C - - - - - 0x01B919 06:B909: AD C9 04  LDA ram_timer_action_ball
C - - - - - 0x01B91C 06:B90C: 4A        LSR
C - - - - - 0x01B91D 06:B90D: 29 1F     AND #$1F
C - - - - - 0x01B91F 06:B90F: 8D 23 05  STA ram_0523
C - - - - - 0x01B922 06:B912: A9 00     LDA #$00
C - - - - - 0x01B924 06:B914: 8D F0 04  STA ram_hp_ball
C - - - - - 0x01B927 06:B917: 8D 10 05  STA ram_подтип_супера
bra_B91A:
C - - - - - 0x01B92A 06:B91A: AD C9 04  LDA ram_timer_action_ball
C - - - - - 0x01B92D 06:B91D: F0 0B     BEQ bra_B92A
C - - - - - 0x01B92F 06:B91F: BD 2E 04  LDA ram_spd_Z_hi_player,X
C - - - - - 0x01B932 06:B922: F0 06     BEQ bra_B92A
C - - - - - 0x01B934 06:B924: 20 2B BD  JSR sub_BD2B
C - - - - - 0x01B937 06:B927: 4C 30 BA  RTS
bra_B92A:
C - - - - - 0x01B93A 06:B92A: 20 D9 BC  JSR sub_BCD9
C - - - - - 0x01B93D 06:B92D: AD 23 05  LDA ram_0523
C - - - - - 0x01B940 06:B930: D0 66     BNE bra_B998
C - - - - - 0x01B942 06:B932: 20 64 BC  JSR sub_BC64
C - - - - - 0x01B945 06:B935: 20 87 A1  JSR sub_A187_ограничение_максимальной_скорости
C - - - - - 0x01B948 06:B938: 20 56 98  JSR sub_9856
bra_B93B:
C - - - - - 0x01B94B 06:B93B: BD F6 03  LDA ram_spd_X_hi_player,X
C - - - - - 0x01B94E 06:B93E: 0A        ASL
C - - - - - 0x01B94F 06:B93F: 7E F6 03  ROR ram_spd_X_hi_player,X
C - - - - - 0x01B952 06:B942: 7E E8 03  ROR ram_spd_X_lo_player,X
C - - - - - 0x01B955 06:B945: C8        INY
C - - - - - 0x01B956 06:B946: C0 01     CPY #$01
C - - - - - 0x01B958 06:B948: 90 F1     BCC bra_B93B
bra_B94A:
C - - - - - 0x01B95A 06:B94A: AD 0E 05  LDA ram_flag_transparent_ball
C - - - - - 0x01B95D 06:B94D: 30 49     BMI bra_B998
C - - - - - 0x01B95F 06:B94F: F0 47     BEQ bra_B998
- - - - - - 0x01B961 06:B951: 85 1C     STA ram_001C
- - - - - - 0x01B963 06:B953: 20 99 BB  JSR sub_BB99
- - - - - - 0x01B966 06:B956: 20 64 BC  JSR sub_BC64
- - - - - - 0x01B969 06:B959: 20 87 A1  JSR sub_A187_ограничение_максимальной_скорости
- - - - - - 0x01B96C 06:B95C: 20 56 98  JSR sub_9856
- - - - - - 0x01B96F 06:B95F: 20 31 BA  JSR sub_BA31
- - - - - - 0x01B972 06:B962: 4C 30 BA  RTS
bra_B965:
C - - - - - 0x01B975 06:B965: AD 0E 05  LDA ram_flag_transparent_ball
C - - - - - 0x01B978 06:B968: F0 8C     BEQ bra_B8F6
C - - - - - 0x01B97A 06:B96A: 30 03     BMI bra_B96F
C - - - - - 0x01B97C 06:B96C: 4C BB B9  JMP loc_B9BB
bra_B96F:
C - - - - - 0x01B97F 06:B96F: BD F6 03  LDA ram_spd_X_hi_player,X
C - - - - - 0x01B982 06:B972: 1D E8 03  ORA ram_spd_X_lo_player,X
C - - - - - 0x01B985 06:B975: F0 1E     BEQ bra_B995_RTS
C - - - - - 0x01B987 06:B977: A9 27     LDA #con_sfx_goalpost
C - - - - - 0x01B989 06:B979: 20 E4 C2  JSR sub_0x01C2F4_play_sound
C - - - - - 0x01B98C 06:B97C: 20 CA BB  JSR sub_BBCA
C - - - - - 0x01B98F 06:B97F: 20 87 A1  JSR sub_A187_ограничение_максимальной_скорости
C - - - - - 0x01B992 06:B982: A9 00     LDA #$00
C - - - - - 0x01B994 06:B984: 8D C9 04  STA ram_timer_action_ball
C - - - - - 0x01B997 06:B987: 8D 10 05  STA ram_подтип_супера
C - - - - - 0x01B99A 06:B98A: A9 80     LDA #$80
C - - - - - 0x01B99C 06:B98C: 8D 0F 05  STA ram_номер_супера
C - - - - - 0x01B99F 06:B98F: 20 BA B7  JSR sub_B7BA
C - - - - - 0x01B9A2 06:B992: 20 AC B8  JSR sub_B8AC
bra_B995_RTS:
C - - - - - 0x01B9A5 06:B995: 4C 30 BA  RTS
bra_B998:
C - - - - - 0x01B9A8 06:B998: A9 00     LDA #$00
C - - - - - 0x01B9AA 06:B99A: 85 1C     STA ram_001C
C - - - - - 0x01B9AC 06:B99C: AD 92 04  LDA ram_мяч_состояние
C - - - - - 0x01B9AF 06:B99F: 10 08     BPL bra_B9A9
C - - - - - 0x01B9B1 06:B9A1: BD 86 03  LDA ram_pos_Z_lo_player,X
C - - - - - 0x01B9B4 06:B9A4: 1D 99 03  ORA ram_pos_Z_hi_player,X
C - - - - - 0x01B9B7 06:B9A7: D0 0A     BNE bra_B9B3
bra_B9A9:
C - - - - - 0x01B9B9 06:B9A9: AD 5C 00  LDA ram_flag_gameplay
C - - - - - 0x01B9BC 06:B9AC: 29 02     AND #$02
C - - - - - 0x01B9BE 06:B9AE: D0 08     BNE bra_B9B8_RTS
C - - - - - 0x01B9C0 06:B9B0: 20 31 BA  JSR sub_BA31
bra_B9B3:
C - - - - - 0x01B9C3 06:B9B3: A5 1C     LDA ram_001C
C - - - - - 0x01B9C5 06:B9B5: 8D 0E 05  STA ram_flag_transparent_ball
bra_B9B8_RTS:
C - - - - - 0x01B9C8 06:B9B8: 4C 30 BA  RTS



loc_B9BB:
C D 1 - - - 0x01B9CB 06:B9BB: AD 5C 00  LDA ram_flag_gameplay
C - - - - - 0x01B9CE 06:B9BE: 29 40     AND #$40
C - - - - - 0x01B9D0 06:B9C0: D0 29     BNE bra_B9EB
C - - - - - 0x01B9D2 06:B9C2: AD 0E 05  LDA ram_flag_transparent_ball
C - - - - - 0x01B9D5 06:B9C5: C9 FF     CMP #$FF
C - - - - - 0x01B9D7 06:B9C7: D0 22     BNE bra_B9EB
C - - - - - 0x01B9D9 06:B9C9: A9 00     LDA #$00
C - - - - - 0x01B9DB 06:B9CB: 20 55 BD  JSR sub_BD55
C - - - - - 0x01B9DE 06:B9CE: A9 2D     LDA #con_sfx_violation
C - - - - - 0x01B9E0 06:B9D0: 20 E4 C2  JSR sub_0x01C2F4_play_sound
C - - - - - 0x01B9E3 06:B9D3: BD 14 03  LDA ram_pos_X_lo_player,X
C - - - - - 0x01B9E6 06:B9D6: 8D 17 05  STA ram_подающий_X_lo
C - - - - - 0x01B9E9 06:B9D9: BD 27 03  LDA ram_pos_X_hi_player,X
C - - - - - 0x01B9EC 06:B9DC: 8D 18 05  STA ram_подающий_X_hi
C - - - - - 0x01B9EF 06:B9DF: BD 4D 03  LDA ram_pos_Y_lo_player,X
C - - - - - 0x01B9F2 06:B9E2: 8D 19 05  STA ram_подающий_Y_lo
C - - - - - 0x01B9F5 06:B9E5: BD 60 03  LDA ram_pos_Y_hi_player,X
C - - - - - 0x01B9F8 06:B9E8: 8D 1A 05  STA ram_подающий_Y_hi
bra_B9EB:
C - - - - - 0x01B9FB 06:B9EB: A5 1C     LDA ram_001C
C - - - - - 0x01B9FD 06:B9ED: 29 7F     AND #$7F
C - - - - - 0x01B9FF 06:B9EF: 8D 0E 05  STA ram_flag_transparent_ball
C - - - - - 0x01BA02 06:B9F2: 4C 30 BA  RTS



loc_B9F5:
C D 1 - - - 0x01BA05 06:B9F5: AD 5C 00  LDA ram_flag_gameplay
C - - - - - 0x01BA08 06:B9F8: 29 40     AND #$40
C - - - - - 0x01BA0A 06:B9FA: D0 27     BNE bra_BA23
C - - - - - 0x01BA0C 06:B9FC: AD 0E 05  LDA ram_flag_transparent_ball
C - - - - - 0x01BA0F 06:B9FF: 10 22     BPL bra_BA23
C - - - - - 0x01BA11 06:BA01: A9 01     LDA #$01
C - - - - - 0x01BA13 06:BA03: 20 55 BD  JSR sub_BD55
C - - - - - 0x01BA16 06:BA06: A9 2D     LDA #con_sfx_violation
C - - - - - 0x01BA18 06:BA08: 20 E4 C2  JSR sub_0x01C2F4_play_sound
C - - - - - 0x01BA1B 06:BA0B: BD 14 03  LDA ram_pos_X_lo_player,X
C - - - - - 0x01BA1E 06:BA0E: 8D 17 05  STA ram_подающий_X_lo
C - - - - - 0x01BA21 06:BA11: BD 27 03  LDA ram_pos_X_hi_player,X
C - - - - - 0x01BA24 06:BA14: 8D 18 05  STA ram_подающий_X_hi
C - - - - - 0x01BA27 06:BA17: BD 4D 03  LDA ram_pos_Y_lo_player,X
C - - - - - 0x01BA2A 06:BA1A: 8D 19 05  STA ram_подающий_Y_lo
C - - - - - 0x01BA2D 06:BA1D: BD 60 03  LDA ram_pos_Y_hi_player,X
C - - - - - 0x01BA30 06:BA20: 8D 1A 05  STA ram_подающий_Y_hi
bra_BA23:
C - - - - - 0x01BA33 06:BA23: A5 1C     LDA ram_001C
C - - - - - 0x01BA35 06:BA25: 8D 0E 05  STA ram_flag_transparent_ball
C - - - - - 0x01BA38 06:BA28: 4C 30 BA  RTS



loc_BA2B:
C D 1 - - - 0x01BA3B 06:BA2B: A9 FF     LDA #$FF
C - - - - - 0x01BA3D 06:BA2D: 8D 0E 05  STA ram_flag_transparent_ball
C D 1 - - - 0x01BA40 06:BA30: 60        RTS



sub_BA31:
C - - - - - 0x01BA41 06:BA31: AD 5C 00  LDA ram_flag_gameplay
C - - - - - 0x01BA44 06:BA34: 29 40     AND #$40
C - - - - - 0x01BA46 06:BA36: D0 7D     BNE bra_BAB5_RTS
C - - - - - 0x01BA48 06:BA38: AD 92 04  LDA ram_мяч_состояние
C - - - - - 0x01BA4B 06:BA3B: 29 40     AND #$40
C - - - - - 0x01BA4D 06:BA3D: D0 76     BNE bra_BAB5_RTS
C - - - - - 0x01BA4F 06:BA3F: A9 00     LDA #$00
C - - - - - 0x01BA51 06:BA41: 8D 80 00  STA ram_animation_id_ball
C - - - - - 0x01BA54 06:BA44: AD 66 04  LDA ram_weather_id
C - - - - - 0x01BA57 06:BA47: 29 7F     AND #$7F
C - - - - - 0x01BA59 06:BA49: C9 01     CMP #con_weather_lightning
C - - - - - 0x01BA5B 06:BA4B: D0 07     BNE bra_BA54
- - - - - - 0x01BA5D 06:BA4D: A9 60     LDA #$60
- - - - - - 0x01BA5F 06:BA4F: 8D 3F 01  STA ram_длительность_погоды_ХЗ
- - - - - - 0x01BA62 06:BA52: D0 05     BNE bra_BA59
bra_BA54:
C - - - - - 0x01BA64 06:BA54: A9 00     LDA #con_weather_none
C - - - - - 0x01BA66 06:BA56: 8D 66 04  STA ram_weather_id
bra_BA59:
C - - - - - 0x01BA69 06:BA59: 24 5C     BIT ram_flag_gameplay
C - - - - - 0x01BA6B 06:BA5B: 70 58     BVS bra_BAB5_RTS
C - - - - - 0x01BA6D 06:BA5D: A9 02     LDA #$02
C - - - - - 0x01BA6F 06:BA5F: 20 55 BD  JSR sub_BD55
C - - - - - 0x01BA72 06:BA62: AD CC 05  LDA ram_счетчик_смен
C - - - - - 0x01BA75 06:BA65: 29 01     AND #$01
C - - - - - 0x01BA77 06:BA67: A8        TAY
C - - - - - 0x01BA78 06:BA68: A5 57     LDA ram_option_mode_difficulty
C - - - - - 0x01BA7A 06:BA6A: 29 20     AND #con_gm_penalty
C - - - - - 0x01BA7C 06:BA6C: F0 07     BEQ bra_BA75_не_пенальти
C - - - - - 0x01BA7E 06:BA6E: BD 27 03  LDA ram_pos_X_hi_player,X
C - - - - - 0x01BA81 06:BA71: F0 42     BEQ bra_BAB5_RTS
C - - - - - 0x01BA83 06:BA73: D0 08     BNE bra_BA7D
bra_BA75_не_пенальти:
C - - - - - 0x01BA85 06:BA75: A0 00     LDY #$00
C - - - - - 0x01BA87 06:BA77: BD 27 03  LDA ram_pos_X_hi_player,X
C - - - - - 0x01BA8A 06:BA7A: D0 01     BNE bra_BA7D
C - - - - - 0x01BA8C 06:BA7C: C8        INY
bra_BA7D:
C - - - - - 0x01BA8D 06:BA7D: A9 01     LDA #$01
C - - - - - 0x01BA8F 06:BA7F: 99 2A 05  STA ram_флаг_владения_мячом_ком,Y
C - - - - - 0x01BA92 06:BA82: 18        CLC
C - - - - - 0x01BA93 06:BA83: B9 2E 05  LDA ram_счет_команды,Y
C - - - - - 0x01BA96 06:BA86: 69 01     ADC #$01
C - - - - - 0x01BA98 06:BA88: 99 2E 05  STA ram_счет_команды,Y
C - - - - - 0x01BA9B 06:BA8B: 29 0F     AND #$0F
C - - - - - 0x01BA9D 06:BA8D: C9 0A     CMP #$0A
C - - - - - 0x01BA9F 06:BA8F: 90 14     BCC bra_BAA5
- - - - - - 0x01BAA1 06:BA91: 18        CLC
- - - - - - 0x01BAA2 06:BA92: B9 2E 05  LDA ram_счет_команды,Y
- - - - - - 0x01BAA5 06:BA95: 29 F0     AND #$F0
- - - - - - 0x01BAA7 06:BA97: 69 10     ADC #$10
- - - - - - 0x01BAA9 06:BA99: 99 2E 05  STA ram_счет_команды,Y
- - - - - - 0x01BAAC 06:BA9C: C9 A0     CMP #$A0
- - - - - - 0x01BAAE 06:BA9E: 90 05     BCC bra_BAA5
- - - - - - 0x01BAB0 06:BAA0: A9 99     LDA #$99
- - - - - - 0x01BAB2 06:BAA2: 99 2E 05  STA ram_счет_команды,Y
bra_BAA5:
C - - - - - 0x01BAB5 06:BAA5: 98        TYA
C - - - - - 0x01BAB6 06:BAA6: 49 01     EOR #$01
C - - - - - 0x01BAB8 06:BAA8: 09 0A     ORA #$0A
C - - - - - 0x01BABA 06:BAAA: A8        TAY
C - - - - - 0x01BABB 06:BAAB: A9 14     LDA #$14
C - - - - - 0x01BABD 06:BAAD: 20 B5 9E  JSR sub_9EB5
C - - - - - 0x01BAC0 06:BAB0: A9 2E     LDA #con_sfx_score_a_goal
C - - - - - 0x01BAC2 06:BAB2: 20 E4 C2  JSR sub_0x01C2F4_play_sound
bra_BAB5_RTS:
C - - - - - 0x01BAC5 06:BAB5: 60        RTS



sub_BAB6:
C - - - - - 0x01BAC6 06:BAB6: A9 00     LDA #$00
C - - - - - 0x01BAC8 06:BAB8: 85 1C     STA ram_001C
C - - - - - 0x01BACA 06:BABA: 38        SEC
C - - - - - 0x01BACB 06:BABB: AD 89 BB  LDA tbl_BB89
C - - - - - 0x01BACE 06:BABE: 85 2E     STA ram_002E
C - - - - - 0x01BAD0 06:BAC0: FD 14 03  SBC ram_pos_X_lo_player,X
C - - - - - 0x01BAD3 06:BAC3: AD 8A BB  LDA tbl_BB89 + 1
C - - - - - 0x01BAD6 06:BAC6: FD 27 03  SBC ram_pos_X_hi_player,X
C - - - - - 0x01BAD9 06:BAC9: B0 14     BCS bra_BADF
C - - - - - 0x01BADB 06:BACB: 38        SEC
C - - - - - 0x01BADC 06:BACC: AD 8B BB  LDA tbl_BB8B
C - - - - - 0x01BADF 06:BACF: 85 2E     STA ram_002E
C - - - - - 0x01BAE1 06:BAD1: FD 14 03  SBC ram_pos_X_lo_player,X
C - - - - - 0x01BAE4 06:BAD4: AD 8C BB  LDA tbl_BB8B + 1
C - - - - - 0x01BAE7 06:BAD7: FD 27 03  SBC ram_pos_X_hi_player,X
C - - - - - 0x01BAEA 06:BADA: 90 03     BCC bra_BADF
C - - - - - 0x01BAEC 06:BADC: 4C E1 BA  JMP loc_BAE1
bra_BADF:
C - - - - - 0x01BAEF 06:BADF: E6 1C     INC ram_001C
loc_BAE1:
C D 1 - - - 0x01BAF1 06:BAE1: 38        SEC
C - - - - - 0x01BAF2 06:BAE2: AD 8D BB  LDA tbl_BB8D
C - - - - - 0x01BAF5 06:BAE5: 85 30     STA ram_0030
C - - - - - 0x01BAF7 06:BAE7: FD 4D 03  SBC ram_pos_Y_lo_player,X
C - - - - - 0x01BAFA 06:BAEA: AD 8E BB  LDA tbl_BB8D + 1
C - - - - - 0x01BAFD 06:BAED: 85 31     STA ram_0031
C - - - - - 0x01BAFF 06:BAEF: FD 60 03  SBC ram_pos_Y_hi_player,X
C - - - - - 0x01BB02 06:BAF2: B0 2C     BCS bra_BB20
C - - - - - 0x01BB04 06:BAF4: 38        SEC
C - - - - - 0x01BB05 06:BAF5: AD 91 BB  LDA tbl_BB91
C - - - - - 0x01BB08 06:BAF8: 85 30     STA ram_0030
C - - - - - 0x01BB0A 06:BAFA: FD 4D 03  SBC ram_pos_Y_lo_player,X
C - - - - - 0x01BB0D 06:BAFD: AD 92 BB  LDA tbl_BB91 + 1
C - - - - - 0x01BB10 06:BB00: 85 31     STA ram_0031
C - - - - - 0x01BB12 06:BB02: FD 60 03  SBC ram_pos_Y_hi_player,X
C - - - - - 0x01BB15 06:BB05: 90 2C     BCC bra_BB33
C - - - - - 0x01BB17 06:BB07: BD 4D 03  LDA ram_pos_Y_lo_player,X
C - - - - - 0x01BB1A 06:BB0A: C9 C0     CMP #$C0
C - - - - - 0x01BB1C 06:BB0C: 90 05     BCC bra_BB13
C - - - - - 0x01BB1E 06:BB0E: E6 30     INC ram_0030
C - - - - - 0x01BB20 06:BB10: 4C 50 BB  JMP loc_BB50
bra_BB13:
C - - - - - 0x01BB23 06:BB13: AD 8D BB  LDA tbl_BB8D
C - - - - - 0x01BB26 06:BB16: 85 30     STA ram_0030
C - - - - - 0x01BB28 06:BB18: AD 8E BB  LDA tbl_BB8D + 1
C - - - - - 0x01BB2B 06:BB1B: 85 31     STA ram_0031
C - - - - - 0x01BB2D 06:BB1D: 4C 50 BB  JMP loc_BB50
bra_BB20:
C - - - - - 0x01BB30 06:BB20: 38        SEC
C - - - - - 0x01BB31 06:BB21: AD 8F BB  LDA tbl_BB8F
C - - - - - 0x01BB34 06:BB24: FD 4D 03  SBC ram_pos_Y_lo_player,X
C - - - - - 0x01BB37 06:BB27: 85 20     STA ram_0020
C - - - - - 0x01BB39 06:BB29: AD 90 BB  LDA tbl_BB8F + 1
C - - - - - 0x01BB3C 06:BB2C: FD 60 03  SBC ram_pos_Y_hi_player,X
C - - - - - 0x01BB3F 06:BB2F: B0 19     BCS bra_BB4A
C - - - - - 0x01BB41 06:BB31: 90 11     BCC bra_BB44
bra_BB33:
C - - - - - 0x01BB43 06:BB33: 38        SEC
C - - - - - 0x01BB44 06:BB34: AD 93 BB  LDA tbl_BB93
C - - - - - 0x01BB47 06:BB37: FD 4D 03  SBC ram_pos_Y_lo_player,X
C - - - - - 0x01BB4A 06:BB3A: 85 20     STA ram_0020
C - - - - - 0x01BB4C 06:BB3C: AD 94 BB  LDA tbl_BB93 + 1
C - - - - - 0x01BB4F 06:BB3F: FD 60 03  SBC ram_pos_Y_hi_player,X
C - - - - - 0x01BB52 06:BB42: 90 06     BCC bra_BB4A
bra_BB44:
C - - - - - 0x01BB54 06:BB44: A5 1C     LDA ram_001C
C - - - - - 0x01BB56 06:BB46: 09 80     ORA #$80
C - - - - - 0x01BB58 06:BB48: 85 1C     STA ram_001C
bra_BB4A:
C - - - - - 0x01BB5A 06:BB4A: A5 1C     LDA ram_001C
C - - - - - 0x01BB5C 06:BB4C: 09 02     ORA #$02
C - - - - - 0x01BB5E 06:BB4E: 85 1C     STA ram_001C
loc_BB50:
C D 1 - - - 0x01BB60 06:BB50: 38        SEC
C - - - - - 0x01BB61 06:BB51: AD 95 BB  LDA tbl_BB95
C - - - - - 0x01BB64 06:BB54: 85 32     STA ram_0032
C - - - - - 0x01BB66 06:BB56: FD 86 03  SBC ram_pos_Z_lo_player,X
C - - - - - 0x01BB69 06:BB59: AD 96 BB  LDA tbl_BB95 + 1
C - - - - - 0x01BB6C 06:BB5C: 85 33     STA ram_0033
C - - - - - 0x01BB6E 06:BB5E: FD 99 03  SBC ram_pos_Z_hi_player,X
C - - - - - 0x01BB71 06:BB61: 30 03     BMI bra_BB66
C - - - - - 0x01BB73 06:BB63: 4C 88 BB  RTS
bra_BB66:
C - - - - - 0x01BB76 06:BB66: 38        SEC
C - - - - - 0x01BB77 06:BB67: AD 97 BB  LDA tbl_BB97
C - - - - - 0x01BB7A 06:BB6A: FD 86 03  SBC ram_pos_Z_lo_player,X
C - - - - - 0x01BB7D 06:BB6D: AD 98 BB  LDA tbl_BB97 + 1
C - - - - - 0x01BB80 06:BB70: FD 99 03  SBC ram_pos_Z_hi_player,X
C - - - - - 0x01BB83 06:BB73: 30 0B     BMI bra_BB80
C - - - - - 0x01BB85 06:BB75: A5 1C     LDA ram_001C
C - - - - - 0x01BB87 06:BB77: D0 07     BNE bra_BB80
C - - - - - 0x01BB89 06:BB79: 09 84     ORA #$84
C - - - - - 0x01BB8B 06:BB7B: 85 1C     STA ram_001C
C - - - - - 0x01BB8D 06:BB7D: 4C 88 BB  RTS
bra_BB80:
C - - - - - 0x01BB90 06:BB80: A5 1C     LDA ram_001C
C - - - - - 0x01BB92 06:BB82: 29 7F     AND #$7F
C - - - - - 0x01BB94 06:BB84: 09 04     ORA #$04
C - - - - - 0x01BB96 06:BB86: 85 1C     STA ram_001C
C D 1 - - - 0x01BB98 06:BB88: 60        RTS



tbl_BB89:
- D 1 - - - 0x01BB99 06:BB89: 70        .byte $70   ; 
- D 1 - - - 0x01BB9A 06:BB8A: 00        .byte $00   ; 

tbl_BB8B:
- D 1 - - - 0x01BB9B 06:BB8B: 90        .byte $90   ; 
- D 1 - - - 0x01BB9C 06:BB8C: 03        .byte $03   ; 

tbl_BB8D:
- D 1 - - - 0x01BB9D 06:BB8D: A4        .byte $A4   ; 
- D 1 - - - 0x01BB9E 06:BB8E: 00        .byte $00   ; 

tbl_BB8F:
- D 1 - - - 0x01BB9F 06:BB8F: 95        .byte $95   ; 
- D 1 - - - 0x01BBA0 06:BB90: 00        .byte $00   ; 

tbl_BB91:
- D 1 - - - 0x01BBA1 06:BB91: E4        .byte $E4   ; 
- D 1 - - - 0x01BBA2 06:BB92: 00        .byte $00   ; 

tbl_BB93:
- D 1 - - - 0x01BBA3 06:BB93: F3        .byte $F3   ; 
- D 1 - - - 0x01BBA4 06:BB94: 00        .byte $00   ; 

tbl_BB95:
- D 1 - - - 0x01BBA5 06:BB95: 2F        .byte $2F   ; 
- D 1 - - - 0x01BBA6 06:BB96: 00        .byte $00   ; 

tbl_BB97:
- D 1 - - - 0x01BBA7 06:BB97: 3F        .byte $3F   ; 
- D 1 - - - 0x01BBA8 06:BB98: 00        .byte $00   ; 



sub_BB99:
C - - - - - 0x01BBA9 06:BB99: A5 1C     LDA ram_001C
C - - - - - 0x01BBAB 06:BB9B: 29 01     AND #$01
C - - - - - 0x01BBAD 06:BB9D: F0 0A     BEQ bra_BBA9
C - - - - - 0x01BBAF 06:BB9F: A5 2E     LDA ram_002E
C - - - - - 0x01BBB1 06:BBA1: 9D 14 03  STA ram_pos_X_lo_player,X
C - - - - - 0x01BBB4 06:BBA4: A5 2F     LDA ram_002F
C - - - - - 0x01BBB6 06:BBA6: 9D 27 03  STA ram_pos_X_hi_player,X
bra_BBA9:
C - - - - - 0x01BBB9 06:BBA9: A5 1C     LDA ram_001C
C - - - - - 0x01BBBB 06:BBAB: 29 02     AND #$02
C - - - - - 0x01BBBD 06:BBAD: F0 0A     BEQ bra_BBB9
C - - - - - 0x01BBBF 06:BBAF: A5 30     LDA ram_0030
C - - - - - 0x01BBC1 06:BBB1: 9D 4D 03  STA ram_pos_Y_lo_player,X
C - - - - - 0x01BBC4 06:BBB4: A5 31     LDA ram_0031
C - - - - - 0x01BBC6 06:BBB6: 9D 60 03  STA ram_pos_Y_hi_player,X
bra_BBB9:
C - - - - - 0x01BBC9 06:BBB9: A5 1C     LDA ram_001C
C - - - - - 0x01BBCB 06:BBBB: 29 04     AND #$04
C - - - - - 0x01BBCD 06:BBBD: F0 0A     BEQ bra_BBC9_RTS
C - - - - - 0x01BBCF 06:BBBF: A5 32     LDA ram_0032
C - - - - - 0x01BBD1 06:BBC1: 9D 86 03  STA ram_pos_Z_lo_player,X
C - - - - - 0x01BBD4 06:BBC4: A5 33     LDA ram_0033
C - - - - - 0x01BBD6 06:BBC6: 9D 99 03  STA ram_pos_Z_hi_player,X
bra_BBC9_RTS:
C - - - - - 0x01BBD9 06:BBC9: 60        RTS



sub_BBCA:
C - - - - - 0x01BBDA 06:BBCA: AD C9 04  LDA ram_timer_action_ball
C - - - - - 0x01BBDD 06:BBCD: D0 06     BNE bra_BBD5
C - - - - - 0x01BBDF 06:BBCF: 20 7E BC  JSR sub_BC7E
C - - - - - 0x01BBE2 06:BBD2: 4C 3B BC  RTS
bra_BBD5:
C - - - - - 0x01BBE5 06:BBD5: A9 00     LDA #$00
C - - - - - 0x01BBE7 06:BBD7: 8D C9 04  STA ram_timer_action_ball
C - - - - - 0x01BBEA 06:BBDA: 8D 10 05  STA ram_подтип_супера
C - - - - - 0x01BBED 06:BBDD: A5 1C     LDA ram_001C
C - - - - - 0x01BBEF 06:BBDF: 29 02     AND #$02
C - - - - - 0x01BBF1 06:BBE1: D0 1C     BNE bra_BBFF
C - - - - - 0x01BBF3 06:BBE3: BD 86 03  LDA ram_pos_Z_lo_player,X
C - - - - - 0x01BBF6 06:BBE6: 29 0E     AND #$0E
C - - - - - 0x01BBF8 06:BBE8: A8        TAY
C - - - - - 0x01BBF9 06:BBE9: 18        CLC
C - - - - - 0x01BBFA 06:BBEA: B9 3C BC  LDA tbl_BC3C,Y
C - - - - - 0x01BBFD 06:BBED: 7D 20 04  ADC ram_spd_Z_lo_player,X
C - - - - - 0x01BC00 06:BBF0: 9D 20 04  STA ram_spd_Z_lo_player,X
C - - - - - 0x01BC03 06:BBF3: B9 3D BC  LDA tbl_BC3D,Y
C - - - - - 0x01BC06 06:BBF6: 7D 2E 04  ADC ram_spd_Z_hi_player,X
C - - - - - 0x01BC09 06:BBF9: 9D 2E 04  STA ram_spd_Z_hi_player,X
C - - - - - 0x01BC0C 06:BBFC: 4C 1A BC  JMP loc_BC1A
bra_BBFF:
C - - - - - 0x01BC0F 06:BBFF: 18        CLC
C - - - - - 0x01BC10 06:BC00: 49 FF     EOR #$FF
C - - - - - 0x01BC12 06:BC02: 69 01     ADC #$01
C - - - - - 0x01BC14 06:BC04: 29 0E     AND #$0E
C - - - - - 0x01BC16 06:BC06: A8        TAY
C - - - - - 0x01BC17 06:BC07: 18        CLC
C - - - - - 0x01BC18 06:BC08: B9 4C BC  LDA tbl_BC4C,Y
C - - - - - 0x01BC1B 06:BC0B: 7D 04 04  ADC ram_spd_Y_lo_player,X
C - - - - - 0x01BC1E 06:BC0E: 9D 04 04  STA ram_spd_Y_lo_player,X
C - - - - - 0x01BC21 06:BC11: B9 4D BC  LDA tbl_BC4D,Y
C - - - - - 0x01BC24 06:BC14: 7D 12 04  ADC ram_spd_Y_hi_player,X
C - - - - - 0x01BC27 06:BC17: 9D 12 04  STA ram_spd_Y_hi_player,X
loc_BC1A:
C D 1 - - - 0x01BC2A 06:BC1A: 98        TYA
C - - - - - 0x01BC2B 06:BC1B: 4A        LSR
C - - - - - 0x01BC2C 06:BC1C: A8        TAY
C - - - - - 0x01BC2D 06:BC1D: B9 5C BC  LDA tbl_BC5C,Y
C - - - - - 0x01BC30 06:BC20: 10 03     BPL bra_BC25
C - - - - - 0x01BC32 06:BC22: 20 7E BC  JSR sub_BC7E
bra_BC25:
C - - - - - 0x01BC35 06:BC25: B9 5C BC  LDA tbl_BC5C,Y
C - - - - - 0x01BC38 06:BC28: 29 7F     AND #$7F
C - - - - - 0x01BC3A 06:BC2A: A8        TAY
loc_BC2B:
C - - - - - 0x01BC3B 06:BC2B: 88        DEY
C - - - - - 0x01BC3C 06:BC2C: 30 0D     BMI bra_BC3B_RTS
- - - - - - 0x01BC3E 06:BC2E: BD F6 03  LDA ram_spd_X_hi_player,X
- - - - - - 0x01BC41 06:BC31: 0A        ASL
- - - - - - 0x01BC42 06:BC32: 7E F6 03  ROR ram_spd_X_hi_player,X
- - - - - - 0x01BC45 06:BC35: 7E E8 03  ROR ram_spd_X_lo_player,X
- - - - - - 0x01BC48 06:BC38: 4C 2B BC  JMP loc_BC2B
bra_BC3B_RTS:
C D 1 - - - 0x01BC4B 06:BC3B: 60        RTS



tbl_BC3C:
- D 1 - - - 0x01BC4C 06:BC3C: 00        .byte $00   ; 
tbl_BC3D:
- D 1 - - - 0x01BC4D 06:BC3D: F8        .byte $F8   ; 
- - - - - - 0x01BC4E 06:BC3E: 00        .byte $00   ; 
- - - - - - 0x01BC4F 06:BC3F: F6        .byte $F6   ; 
- - - - - - 0x01BC50 06:BC40: 00        .byte $00   ; 
- - - - - - 0x01BC51 06:BC41: FC        .byte $FC   ; 
- D 1 - - - 0x01BC52 06:BC42: 00        .byte $00   ; 
- D 1 - - - 0x01BC53 06:BC43: 00        .byte $00   ; 
- D 1 - - - 0x01BC54 06:BC44: 00        .byte $00   ; 
- D 1 - - - 0x01BC55 06:BC45: 01        .byte $01   ; 
- - - - - - 0x01BC56 06:BC46: 00        .byte $00   ; 
- - - - - - 0x01BC57 06:BC47: 02        .byte $02   ; 
- - - - - - 0x01BC58 06:BC48: 00        .byte $00   ; 
- - - - - - 0x01BC59 06:BC49: 08        .byte $08   ; 
- - - - - - 0x01BC5A 06:BC4A: 00        .byte $00   ; 
- - - - - - 0x01BC5B 06:BC4B: 08        .byte $08   ; 



tbl_BC4C:
- - - - - - 0x01BC5C 06:BC4C: 00        .byte $00   ; 
tbl_BC4D:
- - - - - - 0x01BC5D 06:BC4D: F8        .byte $F8   ; 
- - - - - - 0x01BC5E 06:BC4E: 00        .byte $00   ; 
- - - - - - 0x01BC5F 06:BC4F: F8        .byte $F8   ; 
- - - - - - 0x01BC60 06:BC50: 00        .byte $00   ; 
- - - - - - 0x01BC61 06:BC51: FC        .byte $FC   ; 
- - - - - - 0x01BC62 06:BC52: 00        .byte $00   ; 
- - - - - - 0x01BC63 06:BC53: 00        .byte $00   ; 
- - - - - - 0x01BC64 06:BC54: 00        .byte $00   ; 
- - - - - - 0x01BC65 06:BC55: 00        .byte $00   ; 
- - - - - - 0x01BC66 06:BC56: 00        .byte $00   ; 
- - - - - - 0x01BC67 06:BC57: 04        .byte $04   ; 
- - - - - - 0x01BC68 06:BC58: 00        .byte $00   ; 
- - - - - - 0x01BC69 06:BC59: 08        .byte $08   ; 
- D 1 - - - 0x01BC6A 06:BC5A: 00        .byte $00   ; 
- D 1 - - - 0x01BC6B 06:BC5B: 08        .byte $08   ; 



tbl_BC5C:
- D 1 - - - 0x01BC6C 06:BC5C: 00        .byte $00   ; 
- - - - - - 0x01BC6D 06:BC5D: 81        .byte $81   ; 
- - - - - - 0x01BC6E 06:BC5E: 80        .byte $80   ; 
- D 1 - - - 0x01BC6F 06:BC5F: 80        .byte $80   ; 
- D 1 - - - 0x01BC70 06:BC60: 80        .byte $80   ; 
- - - - - - 0x01BC71 06:BC61: 80        .byte $80   ; 
- - - - - - 0x01BC72 06:BC62: 81        .byte $81   ; 
- D 1 - - - 0x01BC73 06:BC63: 00        .byte $00   ; 



sub_BC64:
C - - - - - 0x01BC74 06:BC64: A5 1C     LDA ram_001C
C - - - - - 0x01BC76 06:BC66: 85 1D     STA ram_001D
C - - - - - 0x01BC78 06:BC68: 46 1D     LSR ram_001D
C - - - - - 0x01BC7A 06:BC6A: 90 03     BCC bra_BC6F
C - - - - - 0x01BC7C 06:BC6C: 20 7E BC  JSR sub_BC7E
bra_BC6F:
C - - - - - 0x01BC7F 06:BC6F: 46 1D     LSR ram_001D
C - - - - - 0x01BC81 06:BC71: 90 03     BCC bra_BC76
C - - - - - 0x01BC83 06:BC73: 20 9C BC  JSR sub_BC9C
bra_BC76:
C - - - - - 0x01BC86 06:BC76: 46 1D     LSR ram_001D
C - - - - - 0x01BC88 06:BC78: 90 03     BCC bra_BC7D_RTS
C - - - - - 0x01BC8A 06:BC7A: 20 B2 BC  JSR sub_BCB2
bra_BC7D_RTS:
C - - - - - 0x01BC8D 06:BC7D: 60        RTS



sub_BC7E:
C - - - - - 0x01BC8E 06:BC7E: 18        CLC
C - - - - - 0x01BC8F 06:BC7F: BD E8 03  LDA ram_spd_X_lo_player,X
C - - - - - 0x01BC92 06:BC82: 49 FF     EOR #$FF
C - - - - - 0x01BC94 06:BC84: 69 01     ADC #$01
C - - - - - 0x01BC96 06:BC86: 9D E8 03  STA ram_spd_X_lo_player,X
C - - - - - 0x01BC99 06:BC89: BD F6 03  LDA ram_spd_X_hi_player,X
C - - - - - 0x01BC9C 06:BC8C: 49 FF     EOR #$FF
C - - - - - 0x01BC9E 06:BC8E: 69 00     ADC #$00
C - - - - - 0x01BCA0 06:BC90: 9D F6 03  STA ram_spd_X_hi_player,X
C - - - - - 0x01BCA3 06:BC93: BD A3 04  LDA ram_направление_движения,X
C - - - - - 0x01BCA6 06:BC96: 49 80     EOR #$80
C - - - - - 0x01BCA8 06:BC98: 9D A3 04  STA ram_направление_движения,X
C - - - - - 0x01BCAB 06:BC9B: 60        RTS



sub_BC9C:
C - - - - - 0x01BCAC 06:BC9C: 18        CLC
C - - - - - 0x01BCAD 06:BC9D: BD 04 04  LDA ram_spd_Y_lo_player,X
C - - - - - 0x01BCB0 06:BCA0: 49 FF     EOR #$FF
C - - - - - 0x01BCB2 06:BCA2: 69 01     ADC #$01
C - - - - - 0x01BCB4 06:BCA4: 9D 04 04  STA ram_spd_Y_lo_player,X
C - - - - - 0x01BCB7 06:BCA7: BD 12 04  LDA ram_spd_Y_hi_player,X
C - - - - - 0x01BCBA 06:BCAA: 49 FF     EOR #$FF
C - - - - - 0x01BCBC 06:BCAC: 69 00     ADC #$00
C - - - - - 0x01BCBE 06:BCAE: 9D 12 04  STA ram_spd_Y_hi_player,X
C - - - - - 0x01BCC1 06:BCB1: 60        RTS



sub_BCB2:
C - - - - - 0x01BCC2 06:BCB2: 18        CLC
C - - - - - 0x01BCC3 06:BCB3: BD 20 04  LDA ram_spd_Z_lo_player,X
C - - - - - 0x01BCC6 06:BCB6: 49 FF     EOR #$FF
C - - - - - 0x01BCC8 06:BCB8: 69 01     ADC #$01
C - - - - - 0x01BCCA 06:BCBA: 9D 20 04  STA ram_spd_Z_lo_player,X
C - - - - - 0x01BCCD 06:BCBD: BD 2E 04  LDA ram_spd_Z_hi_player,X
C - - - - - 0x01BCD0 06:BCC0: 49 FF     EOR #$FF
C - - - - - 0x01BCD2 06:BCC2: 69 00     ADC #$00
C - - - - - 0x01BCD4 06:BCC4: 9D 2E 04  STA ram_spd_Z_hi_player,X
C - - - - - 0x01BCD7 06:BCC7: 60        RTS



sub_BCC8:
C - - - - - 0x01BCD8 06:BCC8: 20 F6 BC  JSR sub_BCF6
C - - - - - 0x01BCDB 06:BCCB: 24 1D     BIT ram_001D
C - - - - - 0x01BCDD 06:BCCD: 70 26     BVS bra_BCF5_RTS
C - - - - - 0x01BCDF 06:BCCF: AD 23 05  LDA ram_0523
C - - - - - 0x01BCE2 06:BCD2: F0 21     BEQ bra_BCF5_RTS
C - - - - - 0x01BCE4 06:BCD4: E6 1D     INC ram_001D
C - - - - - 0x01BCE6 06:BCD6: 4C EB BC  JMP loc_BCEB



sub_BCD9:
C - - - - - 0x01BCE9 06:BCD9: 20 F6 BC  JSR sub_BCF6
C - - - - - 0x01BCEC 06:BCDC: 24 1D     BIT ram_001D
C - - - - - 0x01BCEE 06:BCDE: 70 15     BVS bra_BCF5_RTS
C - - - - - 0x01BCF0 06:BCE0: A5 1C     LDA ram_001C
C - - - - - 0x01BCF2 06:BCE2: 29 01     AND #$01
C - - - - - 0x01BCF4 06:BCE4: F0 05     BEQ bra_BCEB
C - - - - - 0x01BCF6 06:BCE6: AD 23 05  LDA ram_0523
C - - - - - 0x01BCF9 06:BCE9: D0 0A     BNE bra_BCF5_RTS
bra_BCEB:
loc_BCEB:
C D 1 - - - 0x01BCFB 06:BCEB: AD E5 00  LDA ram_flag_visible_ball
C - - - - - 0x01BCFE 06:BCEE: F0 05     BEQ bra_BCF5_RTS
C - - - - - 0x01BD00 06:BCF0: A5 1D     LDA ram_001D
C - - - - - 0x01BD02 06:BCF2: 8D F5 05  STA ram_флаг_гола
bra_BCF5_RTS:
C - - - - - 0x01BD05 06:BCF5: 60        RTS



sub_BCF6:
C - - - - - 0x01BD06 06:BCF6: AD AD 03  LDA ram_camera_aim
C - - - - - 0x01BD09 06:BCF9: 29 0F     AND #$0F
C - - - - - 0x01BD0B 06:BCFB: C9 0C     CMP #$0C
C - - - - - 0x01BD0D 06:BCFD: D0 27     BNE bra_BD26    ; если камера не целится на мяч
C - - - - - 0x01BD0F 06:BCFF: AD 23 05  LDA ram_0523
C - - - - - 0x01BD12 06:BD02: F0 03     BEQ bra_BD07
C - - - - - 0x01BD14 06:BD04: CE 23 05  DEC ram_0523
bra_BD07:
C - - - - - 0x01BD17 06:BD07: AD ED 00  LDA ram_pos_X_hi_camera
C - - - - - 0x01BD1A 06:BD0A: D0 0B     BNE bra_BD17
C - - - - - 0x01BD1C 06:BD0C: AD EC 00  LDA ram_pos_X_lo_camera
C - - - - - 0x01BD1F 06:BD0F: C9 48     CMP #$48
C - - - - - 0x01BD21 06:BD11: B0 13     BCS bra_BD26
C - - - - - 0x01BD23 06:BD13: A9 80     LDA #$80
C - - - - - 0x01BD25 06:BD15: D0 11     BNE bra_BD28
bra_BD17:
C - - - - - 0x01BD27 06:BD17: C9 02     CMP #$02
C - - - - - 0x01BD29 06:BD19: D0 0B     BNE bra_BD26
C - - - - - 0x01BD2B 06:BD1B: AD EC 00  LDA ram_pos_X_lo_camera
C - - - - - 0x01BD2E 06:BD1E: C9 B8     CMP #$B8
C - - - - - 0x01BD30 06:BD20: 90 04     BCC bra_BD26
C - - - - - 0x01BD32 06:BD22: A9 00     LDA #$00
C - - - - - 0x01BD34 06:BD24: F0 02     BEQ bra_BD28
bra_BD26:
C - - - - - 0x01BD36 06:BD26: A9 FF     LDA #$FF
bra_BD28:
C - - - - - 0x01BD38 06:BD28: 85 1D     STA ram_001D
C - - - - - 0x01BD3A 06:BD2A: 60        RTS



sub_BD2B:
C - - - - - 0x01BD3B 06:BD2B: 20 F6 BC  JSR sub_BCF6
C - - - - - 0x01BD3E 06:BD2E: A0 00     LDY #$00
C - - - - - 0x01BD40 06:BD30: 24 1D     BIT ram_001D
C - - - - - 0x01BD42 06:BD32: 70 1E     BVS bra_BD52_RTS
C - - - - - 0x01BD44 06:BD34: 30 01     BMI bra_BD37
C - - - - - 0x01BD46 06:BD36: C8        INY
bra_BD37:
C - - - - - 0x01BD47 06:BD37: A9 27     LDA #con_sfx_goalpost
C - - - - - 0x01BD49 06:BD39: 20 E4 C2  JSR sub_0x01C2F4_play_sound
C - - - - - 0x01BD4C 06:BD3C: A9 02     LDA #$02
C - - - - - 0x01BD4E 06:BD3E: 05 1D     ORA ram_001D
C - - - - - 0x01BD50 06:BD40: 85 1D     STA ram_001D
C - - - - - 0x01BD52 06:BD42: B9 53 BD  LDA tbl_BD53_weather,Y
C - - - - - 0x01BD55 06:BD45: 8D 66 04  STA ram_weather_id
C - - - - - 0x01BD58 06:BD48: A5 1D     LDA ram_001D
C - - - - - 0x01BD5A 06:BD4A: 8D F5 05  STA ram_флаг_гола
C - - - - - 0x01BD5D 06:BD4D: A9 01     LDA #$01
C - - - - - 0x01BD5F 06:BD4F: 8D 0E 05  STA ram_flag_transparent_ball
bra_BD52_RTS:
C - - - - - 0x01BD62 06:BD52: 60        RTS

tbl_BD53_weather:
- D 1 - - - 0x01BD63 06:BD53: 86        .byte con_weather_teared_net_left + $80    ; 
- D 1 - - - 0x01BD64 06:BD54: 85        .byte con_weather_teared_net_right + $80   ; 



sub_BD55:
C - - - - - 0x01BD65 06:BD55: A8        TAY
C - - - - - 0x01BD66 06:BD56: 2C 5C 00  BIT ram_flag_gameplay
C - - - - - 0x01BD69 06:BD59: 70 0B     BVS bra_BD66_RTS
C - - - - - 0x01BD6B 06:BD5B: AD 5C 00  LDA ram_flag_gameplay
C - - - - - 0x01BD6E 06:BD5E: 29 80     AND #con_gp_pause
C - - - - - 0x01BD70 06:BD60: 19 67 BD  ORA tbl_BD67,Y
C - - - - - 0x01BD73 06:BD63: 8D 5C 00  STA ram_flag_gameplay
bra_BD66_RTS:
C - - - - - 0x01BD76 06:BD66: 60        RTS

tbl_BD67:
- D 1 - - - 0x01BD77 06:BD67: 48        .byte con_gp_corner_gk
- D 1 - - - 0x01BD78 06:BD68: 44        .byte con_gp_out
- D 1 - - - 0x01BD79 06:BD69: 42        .byte con_gp_goal



sub_0x01BD7A:
C - - - - - 0x01BD7A 06:BD6A: 20 B3 AB  JSR sub_ABB3
C - - - - - 0x01BD7D 06:BD6D: A5 57     LDA ram_option_mode_difficulty
C - - - - - 0x01BD7F 06:BD6F: 29 20     AND #con_gm_penalty
C - - - - - 0x01BD81 06:BD71: D0 50     BNE bra_BDC3_пенальти
C - - - - - 0x01BD83 06:BD73: A2 00     LDX #$00
bra_BD75_loop:
C - - - - - 0x01BD85 06:BD75: 20 32 BE  JSR sub_BE32
C - - - - - 0x01BD88 06:BD78: E8        INX
C - - - - - 0x01BD89 06:BD79: E0 0C     CPX #$0C
C - - - - - 0x01BD8B 06:BD7B: 90 F8     BCC bra_BD75_loop
loc_BD7D:
C D 1 - - - 0x01BD8D 06:BD7D: A2 00     LDX #$00
bra_BD7F_loop:
C - - - - - 0x01BD8F 06:BD7F: 20 C8 AA  JSR sub_AAC8
C - - - - - 0x01BD92 06:BD82: E8        INX
C - - - - - 0x01BD93 06:BD83: E0 0C     CPX #$0C
C - - - - - 0x01BD95 06:BD85: 90 F8     BCC bra_BD7F_loop
C - - - - - 0x01BD97 06:BD87: A2 0C     LDX #$0C
C - - - - - 0x01BD99 06:BD89: 20 0B AB  JSR sub_AB0B
C - - - - - 0x01BD9C 06:BD8C: 20 9D 8C  JSR sub_8C9D_обработка_движения_мяча
C - - - - - 0x01BD9F 06:BD8F: 20 09 96  JSR sub_9609
C - - - - - 0x01BDA2 06:BD92: 20 C5 B8  JSR sub_B8C5
C - - - - - 0x01BDA5 06:BD95: AD 92 04  LDA ram_мяч_состояние
C - - - - - 0x01BDA8 06:BD98: 29 40     AND #$40
C - - - - - 0x01BDAA 06:BD9A: F0 17     BEQ bra_BDB3
C - - - - - 0x01BDAC 06:BD9C: AD 65 04  LDA ram_movement_id_ball
C - - - - - 0x01BDAF 06:BD9F: 29 7F     AND #$7F
C - - - - - 0x01BDB1 06:BDA1: C9 03     CMP #$03
C - - - - - 0x01BDB3 06:BDA3: F0 0B     BEQ bra_BDB0
C - - - - - 0x01BDB5 06:BDA5: C9 09     CMP #$09
C - - - - - 0x01BDB7 06:BDA7: F0 07     BEQ bra_BDB0
C - - - - - 0x01BDB9 06:BDA9: C9 14     CMP #$14
C - - - - - 0x01BDBB 06:BDAB: F0 03     BEQ bra_BDB0
C - - - - - 0x01BDBD 06:BDAD: 4C B3 BD  JMP loc_BDB3
bra_BDB0:
C - - - - - 0x01BDC0 06:BDB0: 20 17 B2  JSR sub_B217
bra_BDB3:
loc_BDB3:
C D 1 - - - 0x01BDC3 06:BDB3: 20 52 AB  JSR sub_AB52
C - - - - - 0x01BDC6 06:BDB6: 20 8C EB  JSR sub_0x01EB9C
C - - - - - 0x01BDC9 06:BDB9: 20 EF D5  JSR sub_0x01D5FF
C - - - - - 0x01BDCC 06:BDBC: 20 A4 B2  JSR sub_B2A4
C - - - - - 0x01BDCF 06:BDBF: 20 DE AB  JSR sub_ABDE
C - - - - - 0x01BDD2 06:BDC2: 60        RTS
bra_BDC3_пенальти:
C - - - - - 0x01BDD3 06:BDC3: 20 B3 AB  JSR sub_ABB3
C - - - - - 0x01BDD6 06:BDC6: AD CC 05  LDA ram_счетчик_смен
C - - - - - 0x01BDD9 06:BDC9: 29 0F     AND #$0F
C - - - - - 0x01BDDB 06:BDCB: AA        TAX
C - - - - - 0x01BDDC 06:BDCC: 20 32 BE  JSR sub_BE32
C - - - - - 0x01BDDF 06:BDCF: AD CC 05  LDA ram_счетчик_смен
C - - - - - 0x01BDE2 06:BDD2: 29 01     AND #$01
C - - - - - 0x01BDE4 06:BDD4: 49 01     EOR #$01
C - - - - - 0x01BDE6 06:BDD6: 09 0A     ORA #$0A
C - - - - - 0x01BDE8 06:BDD8: AA        TAX
C - - - - - 0x01BDE9 06:BDD9: 20 32 BE  JSR sub_BE32
C - - - - - 0x01BDEC 06:BDDC: 4C 7D BD  JMP loc_BD7D



loc_BDDF:
C D 1 - - - 0x01BDEF 06:BDDF: A2 00     LDX #$00
C - - - - - 0x01BDF1 06:BDE1: 20 19 AA  JSR sub_AA19
C - - - - - 0x01BDF4 06:BDE4: 20 2D 80  JSR sub_802D_обработка_движения_игрока
C - - - - - 0x01BDF7 06:BDE7: 20 8C EB  JSR sub_0x01EB9C
C - - - - - 0x01BDFA 06:BDEA: 20 C8 AA  JSR sub_AAC8
C - - - - - 0x01BDFD 06:BDED: A2 0C     LDX #$0C
C - - - - - 0x01BDFF 06:BDEF: 20 0B AB  JSR sub_AB0B
C - - - - - 0x01BE02 06:BDF2: 20 9D 8C  JSR sub_8C9D_обработка_движения_мяча
C - - - - - 0x01BE05 06:BDF5: 20 52 AB  JSR sub_AB52
C - - - - - 0x01BE08 06:BDF8: 20 8C EB  JSR sub_0x01EB9C
C - - - - - 0x01BE0B 06:BDFB: 60        RTS



loc_BDFC:
C D 1 - - - 0x01BE0C 06:BDFC: EE E2 05  INC ram_таймер_катсцены
C - - - - - 0x01BE0F 06:BDFF: A2 01     LDX #$01
bra_BE01_loop:
C - - - - - 0x01BE11 06:BE01: AD E2 05  LDA ram_таймер_катсцены
C - - - - - 0x01BE14 06:BE04: C9 04     CMP #$04
C - - - - - 0x01BE16 06:BE06: 90 09     BCC bra_BE11
C - - - - - 0x01BE18 06:BE08: 20 19 AA  JSR sub_AA19
C - - - - - 0x01BE1B 06:BE0B: 20 2D 80  JSR sub_802D_обработка_движения_игрока
C - - - - - 0x01BE1E 06:BE0E: 20 C8 AA  JSR sub_AAC8
bra_BE11:
C - - - - - 0x01BE21 06:BE11: 20 8C EB  JSR sub_0x01EB9C
C - - - - - 0x01BE24 06:BE14: CA        DEX
C - - - - - 0x01BE25 06:BE15: 10 EA     BPL bra_BE01_loop
C - - - - - 0x01BE27 06:BE17: A2 0C     LDX #$0C
C - - - - - 0x01BE29 06:BE19: AD E2 05  LDA ram_таймер_катсцены
C - - - - - 0x01BE2C 06:BE1C: C9 04     CMP #$04
C - - - - - 0x01BE2E 06:BE1E: 90 0E     BCC bra_BE2E
C - - - - - 0x01BE30 06:BE20: A9 00     LDA #$00
C - - - - - 0x01BE32 06:BE22: 8D E2 05  STA ram_таймер_катсцены
C - - - - - 0x01BE35 06:BE25: 20 0B AB  JSR sub_AB0B
C - - - - - 0x01BE38 06:BE28: 20 9D 8C  JSR sub_8C9D_обработка_движения_мяча
C - - - - - 0x01BE3B 06:BE2B: 20 52 AB  JSR sub_AB52
bra_BE2E:
C - - - - - 0x01BE3E 06:BE2E: 20 8C EB  JSR sub_0x01EB9C
C - - - - - 0x01BE41 06:BE31: 60        RTS



sub_BE32:
C - - - - - 0x01BE42 06:BE32: 20 19 AA  JSR sub_AA19
C - - - - - 0x01BE45 06:BE35: 20 76 C2  JSR sub_0x01C286
C - - - - - 0x01BE48 06:BE38: 20 2D 80  JSR sub_802D_обработка_движения_игрока
C - - - - - 0x01BE4B 06:BE3B: 20 A4 B2  JSR sub_B2A4
C - - - - - 0x01BE4E 06:BE3E: 20 8C EB  JSR sub_0x01EB9C
C - - - - - 0x01BE51 06:BE41: 60        RTS



sub_0x01BE52:
C - - - - - 0x01BE52 06:BE42: A2 01     LDX #$01
bra_BE44_loop:
C - - - - - 0x01BE54 06:BE44: 8A        TXA
C - - - - - 0x01BE55 06:BE45: 29 01     AND #$01
C - - - - - 0x01BE57 06:BE47: A8        TAY
C - - - - - 0x01BE58 06:BE48: B9 2A 05  LDA ram_флаг_владения_мячом_ком,Y
C - - - - - 0x01BE5B 06:BE4B: 29 01     AND #$01
C - - - - - 0x01BE5D 06:BE4D: F0 58     BEQ bra_BEA7
C - - - - - 0x01BE5F 06:BE4F: A5 59     LDA ram_subscript
C - - - - - 0x01BE61 06:BE51: C9 05     CMP #$05
C - - - - - 0x01BE63 06:BE53: F0 08     BEQ bra_BE5D
C - - - - - 0x01BE65 06:BE55: A9 80     LDA #$80
C - - - - - 0x01BE67 06:BE57: 8D AD 03  STA ram_camera_aim
C - - - - - 0x01BE6A 06:BE5A: 4C 76 BE  JMP loc_BE76
bra_BE5D:
C - - - - - 0x01BE6D 06:BE5D: AD E2 05  LDA ram_таймер_катсцены
C - - - - - 0x01BE70 06:BE60: C9 40     CMP #$40
C - - - - - 0x01BE72 06:BE62: B0 0C     BCS bra_BE70
C - - - - - 0x01BE74 06:BE64: 8A        TXA
C - - - - - 0x01BE75 06:BE65: 8D AD 03  STA ram_camera_aim
C - - - - - 0x01BE78 06:BE68: 49 01     EOR #$01
C - - - - - 0x01BE7A 06:BE6A: 8D D6 04  STA ram_игрок_с_мячом
C - - - - - 0x01BE7D 06:BE6D: 4C 76 BE  JMP loc_BE76
bra_BE70:
C - - - - - 0x01BE80 06:BE70: 8A        TXA
C - - - - - 0x01BE81 06:BE71: 09 40     ORA #$40
C - - - - - 0x01BE83 06:BE73: 8D AD 03  STA ram_camera_aim
loc_BE76:
C D 1 - - - 0x01BE86 06:BE76: 20 B2 C2  JSR sub_0x01C2C2
C - - - - - 0x01BE89 06:BE79: 20 14 AA  JSR sub_AA14
C - - - - - 0x01BE8C 06:BE7C: 20 D0 C2  JSR sub_0x01C2E0
C - - - - - 0x01BE8F 06:BE7F: 20 C3 AA  JSR sub_AAC3
C - - - - - 0x01BE92 06:BE82: 20 8C EB  JSR sub_0x01EB9C
C - - - - - 0x01BE95 06:BE85: BD 27 03  LDA ram_pos_X_hi_player,X
C - - - - - 0x01BE98 06:BE88: F0 0B     BEQ bra_BE95
C - - - - - 0x01BE9A 06:BE8A: C9 02     CMP #$02
C - - - - - 0x01BE9C 06:BE8C: D0 19     BNE bra_BEA7
C - - - - - 0x01BE9E 06:BE8E: BD 14 03  LDA ram_pos_X_lo_player,X
C - - - - - 0x01BEA1 06:BE91: 10 14     BPL bra_BEA7
C - - - - - 0x01BEA3 06:BE93: 30 05     BMI bra_BE9A
bra_BE95:
C - - - - - 0x01BEA5 06:BE95: BD 14 03  LDA ram_pos_X_lo_player,X
C - - - - - 0x01BEA8 06:BE98: 30 0D     BMI bra_BEA7
bra_BE9A:
C - - - - - 0x01BEAA 06:BE9A: AD B2 05  LDA ram_flag_brightness
C - - - - - 0x01BEAD 06:BE9D: 10 08     BPL bra_BEA7
C - - - - - 0x01BEAF 06:BE9F: 20 47 D0  JSR sub_0x01D057
C - - - - - 0x01BEB2 06:BEA2: A9 00     LDA #$00
C - - - - - 0x01BEB4 06:BEA4: 8D E8 05  STA ram_footprint_hi_2006
bra_BEA7:
C - - - - - 0x01BEB7 06:BEA7: CA        DEX
C - - - - - 0x01BEB8 06:BEA8: 10 9A     BPL bra_BE44_loop
C - - - - - 0x01BEBA 06:BEAA: AD B2 05  LDA ram_flag_brightness
C - - - - - 0x01BEBD 06:BEAD: 10 1C     BPL bra_BECB_RTS
C - - - - - 0x01BEBF 06:BEAF: AD 00 03  LDA ram_frame_cnt
C - - - - - 0x01BEC2 06:BEB2: 29 3F     AND #$3F
C - - - - - 0x01BEC4 06:BEB4: D0 04     BNE bra_BEBA
C - - - - - 0x01BEC6 06:BEB6: A9 3F     LDA #con_sfx_spec_noise
C - - - - - 0x01BEC8 06:BEB8: D0 0E     BNE bra_BEC8
bra_BEBA:
C - - - - - 0x01BECA 06:BEBA: AD 00 03  LDA ram_frame_cnt
C - - - - - 0x01BECD 06:BEBD: 29 07     AND #$07
C - - - - - 0x01BECF 06:BEBF: D0 0A     BNE bra_BECB_RTS
C - - - - - 0x01BED1 06:BEC1: 20 35 EE  JSR sub_0x01EE45_вращение_рандома
C - - - - - 0x01BED4 06:BEC4: 10 05     BPL bra_BECB_RTS
C - - - - - 0x01BED6 06:BEC6: A9 40     LDA #con_sfx_spec_whistle
bra_BEC8:
C - - - - - 0x01BED8 06:BEC8: 20 E4 C2  JSR sub_0x01C2F4_play_sound
bra_BECB_RTS:
C - - - - - 0x01BEDB 06:BECB: 60        RTS



sub_0x01BEDC:
C - - - - - 0x01BEDC 06:BECC: AD 5C 00  LDA ram_flag_gameplay
C - - - - - 0x01BEDF 06:BECF: 29 02     AND #$02
C - - - - - 0x01BEE1 06:BED1: D0 14     BNE bra_BEE7_RTS
C - - - - - 0x01BEE3 06:BED3: A2 0E     LDX #$0E
C - - - - - 0x01BEE5 06:BED5: A5 59     LDA ram_subscript
C - - - - - 0x01BEE7 06:BED7: C9 01     CMP #$01
C - - - - - 0x01BEE9 06:BED9: D0 01     BNE bra_BEDC
C - - - - - 0x01BEEB 06:BEDB: E8        INX
bra_BEDC:
C - - - - - 0x01BEEC 06:BEDC: 20 D6 CB  JSR sub_0x01CBE6_циферки
C - - - - - 0x01BEEF 06:BEDF: 20 8C EB  JSR sub_0x01EB9C
C - - - - - 0x01BEF2 06:BEE2: E8        INX
C - - - - - 0x01BEF3 06:BEE3: E0 13     CPX #$13
C - - - - - 0x01BEF5 06:BEE5: 90 F5     BCC bra_BEDC
bra_BEE7_RTS:
C - - - - - 0x01BEF7 06:BEE7: 60        RTS



.segment "BANK_06_ID"
- D 1 - - - 0x01C00F 06:BFFF: 06        .byte con_prg_bank + $06   ; 



