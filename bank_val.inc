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



; ram_NMI_flag                  = $4F
con_nmi_off                     = $00 ; выключить NMI
con_nmi_disable_irq             = $80 ; выключить IRQ
con_nmi_enable_irq              = $C0 ; включить IRQ



; ram_option_mode_difficulty    = $57 ; game mode (режим игры)
con_gm_demo                     = $00 ; демо
con_gm_penalty                  = $20 ; пк из меню
con_gm_minibattle               = $40 ; минибатл
con_gm_walkthrough              = $80 ; прохождение



; ram_script                    = $58
con_script_gameplay             = $00 ; игра на поле
con_script_logo                 = $01 ; логотип, мисако, жми старт
con_script_menu                 = $02 ; любые меню, где можно выбирать опции (а также VS экран)
con_script_credits              = $03 ; финальные титры



; ram_flag_gameplay             = $5C
con_gp_normal                   = $00 ; нормальная игра, возможность двигаться игроками, без нарушений в данный момент
con_gp_kick_off                 = $01 ; игроки стоят на разводке
con_gp_violation                = $20 ; нарушение
con_gp_time_up                  = $40 ; время вышло
con_gp_goal                     = $42 ; гол
con_gp_out                      = $44 ; аут
con_gp_corner_gk                = $48 ; угловой (corner kick) и от ворот (goal kick)
con_gp_pk                       = $60 ; пенальти которые после матча
con_gp_pause                    = $80 ; пауза



; ram_weather_id                = $0466
con_weather_none                = $00 ; нет
con_weather_lightning           = $01 ; молния
con_weather_rain                = $02 ; дождь
con_weather_tornado             = $03 ; смерч
con_weather_wind                = $04 ; ветер
con_weather_teared_net_right    = $05 ; рваная сетка справа
con_weather_teared_net_left     = $06 ; рваная сетка слева



; ram_surface_player            = $0130
con_НА_ТРАВЕ                    = $00 ; трава или сухая земля, не тонет и не оставляет следов
con_НА_ЛУЖЕ                     = $01 ; скользит и оставляет следы
con_НА_ГРЯЗИ                    = $02 ; тонет и оставляет следы
con_НА_ПЕСКЕ                    = $03 ; оставляет следы



; ram_hud_mode                  = $05F8
con_hud_kick_off                = $00 ; 
con_hud_goal                    = $01 ; 
con_hud_game_set                = $02 ; 
con_hud_pk                      = $03 ; 
con_hud_penalty                 = $04 ; 
con_hud_freekick                = $05 ; 
con_hud_minimap                 = $06 ; 



; ram_sound_id                      = $07FF
con_music_off   				    = $00 ; 
con_music_logo                      = $01 ; 
con_music_menu                      = $02 ; 
con_music_ПОЛЕ_03                   = $03 ; 
con_music_ПОЛЕ_04                   = $04 ; 
con_music_ПОЛЕ_05                   = $05 ; 
con_music_ПОЛЕ_06                   = $06 ; 
con_music_ПОЛЕ_07                   = $07 ; 
con_music_screen_vs                 = $08 ; 
con_music_screen_score              = $09 ; 
con_music_walkthrough               = $0A ; прохождение
con_music_КУБОК					    = $0B ; экран с кубком на башке
con_music_spectators                = $0C ; зрители
con_music_ПЕНАЛЬТИ                  = $0D ; 
con_music_ФИНАЛ					    = $0E ; 
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
con_sfx_pass_w_foot                 = $20 ; 
; unused                            = $21 ; 
con_sfx_pass_w_head				    = $22 ; 
con_sfx_recieve_ball                = $23 ; принять мяч на грудь или голову
con_sfx_run_w_ball                  = $24 ; бег с мячом - средний бег как у ботов
; unused                            = $25 ; 
con_sfx_catch_punch                 = $26 ; ловля/отбитие для киперов
con_sfx_goalpost                    = $27 ; штанга
con_sfx_КРАСНЫЙ_СУПЕР               = $28 ; 
con_sfx_УДАР                        = $29 ; 
con_sfx_СУПЕР                       = $2A ; 
con_sfx_jump                        = $2B ; прыжок
con_sfx_land_on_ground              = $2C ; приземление на землю
con_sfx_violation                   = $2D ; нарушение - мяч вне игры, фрикик, пенальти; также пауза
con_sfx_score_a_goal                = $2E ; 
; unused                            = $2F ; 
; unused                            = $30 ; 
con_sfx_time_up                     = $31 ; 
con_sfx_move_cursor                 = $32 ; сдвинуть курсор
con_sfx_yes                         = $33 ; положительный
con_sfx_no                          = $34 ; отрицательный
con_sfx_print_text                  = $35 ; печать текста
con_sfx_убийство                    = $36 ; при попадании локтем или подкатом, когда убиваешь игрока или сам убиваешься
con_sfx_прошибание                  = $37 ; 
con_sfx_spin_guinea                 = $38 ; удар этажеркой, кулак кипера после крутилки
con_sfx_унесло_вихрем               = $39 ; 
; unused                            = $3A ; 
con_sfx_elbow_tackle                = $3B ; локоть/подкат
con_sfx_spin_normal                 = $3C ; зачистка, вратарская крутилка, ветряная крутилка
con_sfx_bounce_from_ground_ball     = $3D ; отскок мяча от земли
con_sfx_bounce_from_ground_special  = $3E ; отскок супера от земли
con_sfx_spec_noise                  = $3F ; шум зрителей
con_sfx_spec_whistle                = $40 ; свист зрителей
con_sfx_wind                        = $41 ; ветер
; unused                            = $42 ; 
con_sfx_land_on_ball                = $43 ; прыжок на мяч
con_sfx_unk_44                      = $44 ; не помню откуда, наподобие змеи
con_sfx_lightning                   = $45 ; молния
con_sfx_unk_46                      = $46 ; наподобие неправильного ответа, но не 2F	
con_sfx_ТЕЛЕФОН_ЦИФРА_1             = $47 ; 
con_sfx_ТЕЛЕФОН_ЦИФРА_2             = $48 ; 
con_sfx_ТЕЛЕФОН_ЦИФРА_3             = $49 ; 
con_sfx_ТЕЛЕФОН_ЦИФРА_4             = $4A ; 
con_sfx_ГУДКИ_В_ТРУБКЕ              = $4B ; ты звонишь и слышишь гудки (вроде)
con_sfx_ТЕБЕ_ЗВОНЯТ                 = $4C ; тебе звонят (наверное)
con_sfx_КЛИЕНТ_ПОДНИМАЕТ_ТРУБКУ     = $4D ; тот кому ты звонишь поднимает трубку
con_sfx_ТЫ_ПОДНИМАЕШЬ_ТРУБКУ        = $4E ; ты поднимаешь и набираешь номер