; keep your global constant values inside this file

; MISC разное
con_prg_bank                    = $00 ; номер prg банка
con_chr_bank                    = $00 ; номер chr банка



; ram_btn_hold                  = $04
; ram_btn_press                 = $08
con_btn_Right                   = $01 ; 
con_btn_Left                    = $02 ; 
con_btn_Down                    = $04 ; 
con_btn_Up                      = $08 ; 
con_btn_Start                   = $10 ; 
con_btn_Select                  = $20 ; 
con_btn_B                       = $40 ; 
con_btn_A                       = $80 ; 

con_btns_Dpad                   = con_btn_Right + con_btn_Left + con_btn_Down + con_btn_Up  ; 0F
con_btns_AB                     = con_btn_A + con_btn_B                                     ; C0
con_btns_SS                     = con_btn_Start + con_btn_Select                            ; 30
con_btns__ABSS                  = con_btn_A + con_btn_B + con_btn_Start + con_btn_Select    ; F0



; ram_флаг_nmi                  = $4F
con_nmi_выкл                    = $00 ; выключить NMI
con_nmi_irq_выкл                = $80 ; выключить IRQ во время NMI
con_nmi_irq_вкл                 = $C0 ; включить IRQ во время NMI



; ram_опция_режим_и_сложность    = $57 ; game mode (режим игры)
con_gm_демо                     = $00 ; 
con_gm_пенальти                 = $20 ; 
con_gm_минибатл                 = $40 ; 
con_gm_прохождение              = $80 ; прохождение



; ram_script                    = $58
con_script_игра_на_поле         = $00 ; игра на поле
con_script_логотип              = $01 ; логотип, мисако, жми старт
con_script_меню                 = $02 ; любые меню, где можно выбирать опции (а также VS экран)
con_script_титры                = $03 ; финальные титры



; ram_flag_gameplay             = $5C
con_gp_игра                     = $00 ; нормальная игра, возможность двигаться игроками, без нарушений в данный момент
con_gp_разводка                 = $01 ; 
con_gp_нарушение                = $20 ; 
con_gp_время_вышло              = $40 ; 
con_gp_гол                      = $42 ; 
con_gp_аут                      = $44 ; 
con_gp_угловой_от_ворот         = $48 ; угловой (corner kick) и от ворот (goal kick)
con_gp_пенальти                 = $60 ; пенальти которые после матча
con_gp_пауза                    = $80 ; пауза



; ram_погода_id                 = $0466
con_погода_none                 = $00 ; нет
con_погода_lightning            = $01 ; молния
con_погода_rain                 = $02 ; дождь
con_погода_tornado              = $03 ; смерч
con_погода_wind                 = $04 ; ветер
con_погода_teared_net_right     = $05 ; рваная сетка справа
con_погода_teared_net_left      = $06 ; рваная сетка слева



; ram_surface_игрок             = $0130
con_на_траве                    = $00 ; трава или сухая земля, не тонет и не оставляет следов
con_на_луже                     = $01 ; скользит и оставляет следы
con_на_грязи                    = $02 ; тонет и оставляет следы
con_на_песке                    = $03 ; оставляет следы



; ram_содержимое_hud            = $05F8
con_hud_kick_off                = $00 ; 
con_hud_goal                    = $01 ; 
con_hud_game_set                = $02 ; 
con_hud_pk                      = $03 ; 
con_hud_penalty                 = $04 ; 
con_hud_freekick                = $05 ; 
con_hud_миникарта               = $06 ; 



; ram_номер_музыки                  = $055A
; ram_номер_звука                   = $07FF
con_music_выкл                      = $00 ; 
con_music_логотип                   = $01 ; 
con_music_меню                      = $02 ; 
con_music_поле_03                   = $03 ; 
con_music_поле_04                   = $04 ; 
con_music_поле_05                   = $05 ; 
con_music_поле_06                   = $06 ; 
con_music_поле_07                   = $07 ; 
con_music_экран_vs                  = $08 ; 
con_music_экран_со_счетом           = $09 ; 
con_music_прохождение               = $0A ; 
con_music_кубок                     = $0B ; экран с кубком на башке
con_music_зрители                   = $0C ; 
con_music_пенальти                  = $0D ; 
con_music_финал                     = $0E ; 
; unused                            = $0F ; 
; unused                            = $10 ; 
; unused                            = $11 ; 
; unused                            = $12 ; 
; unused                            = $13 ; 
; unused                            = $14 ; 
; unused                            = $15 ; 
; unused                            = $16 ; 
; unused                            = $17 ; 
; unused                            = $18 ; 
; unused                            = $19 ; 
; unused                            = $1A ; 
; unused                            = $1B ; 
; unused                            = $1C ; 
; unused                            = $1D ; 
; unused                            = $1E ; 
; unused                            = $1F ; 
con_sfx_пас_ногой                   = $20 ; 
; unused                            = $21 ; 
con_sfx_пас_головой                 = $22 ; 
con_sfx_принять_мяч                 = $23 ; на грудь или голову
con_sfx_бег_с_мячои                 = $24 ; средний бег как у ботов
; unused                            = $25 ; 
con_sfx_словить_отбить              = $26 ; для киперов
con_sfx_штанга                      = $27 ; 
con_sfx_красный_супер               = $28 ; 
con_sfx_удар                        = $29 ; 
con_sfx_супер                       = $2A ; уникальный супер игрока/команды
con_sfx_прыжок                      = $2B ; 
con_sfx_приземление                 = $2C ; на землю
con_sfx_нарушение                   = $2D ; мяч вне игры, фрикик, пенальти, пауза на Start
con_sfx_гол                         = $2E ; 
; unused                            = $2F ; 
; unused                            = $30 ; 
con_sfx_время_вышло                 = $31 ; 
con_sfx_сдвинуть_курсор             = $32 ; 
con_sfx_yes                         = $33 ; положительный
con_sfx_no                          = $34 ; отрицательный
con_sfx_печать_текста               = $35 ; 
con_sfx_убийство                    = $36 ; при попадании локтем или подкатом, когда убиваешь игрока или сам убиваешься
con_sfx_прошибание                  = $37 ; 
con_sfx_крутилка_гвинейская         = $38 ; удар этажеркой, кулак кипера после крутилки
con_sfx_унесло_вихрем               = $39 ; 
; unused                            = $3A ; 
con_sfx_локоть_подкат               = $3B ; 
con_sfx_крутилка_обычная            = $3C ; зачистка, вратарская крутилка, ветряная крутилка
con_sfx_отскок_мяча_от_земли        = $3D ; 
con_sfx_отскок_супера_от_земли      = $3E ; 
con_sfx_шум_зрителей                = $3F ; 
con_sfx_свист_зрителей              = $40 ; 
con_sfx_ветер                       = $41 ; 
; unused                            = $42 ; 
con_sfx_прыжок_на_мяч               = $43 ; 
con_sfx_unk_44                      = $44 ; не помню откуда, наподобие змеи
con_sfx_молния                      = $45 ; молния
con_sfx_unk_46                      = $46 ; наподобие неправильного ответа, но не 2F    
con_sfx_телефон_цифра_1             = $47 ; 
con_sfx_телефон_цифра_2             = $48 ; 
con_sfx_телефон_цифра_3             = $49 ; 
con_sfx_телефон_цифра_4             = $4A ; 
con_sfx_гудки_в_трубке              = $4B ; ты звонишь и слышишь гудки (вроде)
con_sfx_тебе_звонят                 = $4C ; тебе звонят (наверное)
con_sfx_клиент_поднимает_трубку     = $4D ; тот кому ты звонишь поднимает трубку
con_sfx_ты_поднимаешь_трубку        = $4E ; ты поднимаешь и набираешь номер