; keep your global constant values inside this file



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



; ram_btn_menu                  = $05CD
con___btn_nothing               = $00 ; 
con___btn_Start                 = $01 ; 
con___btn_Select                = $02 ; 
con___btn_A                     = $03 ; 
con___btn_B                     = $04 ; 
con___btn_Up                    = $05 ; 
con___btn_Down                  = $06 ; 
con___btn_Left                  = $07 ; 
con___btn_Right                 = $08 ; 



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
; не используется                   = $0F ; 
; не используется                   = $10 ; 
; не используется                   = $11 ; 
; не используется                   = $12 ; 
; не используется                   = $13 ; 
; не используется                   = $14 ; 
; не используется                   = $15 ; 
; не используется                   = $16 ; 
; не используется                   = $17 ; 
; не используется                   = $18 ; 
; не используется                   = $19 ; 
; не используется                   = $1A ; 
; не используется                   = $1B ; 
; не используется                   = $1C ; 
; не используется                   = $1D ; 
; не используется                   = $1E ; 
; не используется                   = $1F ; 
con_sfx_pass_w_foot                 = $20 ; 
; не используется                   = $21 ; 
con_sfx_pass_w_head				    = $22 ; 
con_sfx_recieve_ball                = $23 ; принять мяч на грудь или голову
con_sfx_run_w_ball                  = $24 ; бег с мячом - средний бег как у ботов
; не используется                   = $25 ; 
con_sfx_catch_punch                 = $26 ; ловля/отбитие для киперов
con_sfx_goalpost                    = $27 ; штанга
con_sfx_КРАСНЫЙ_СУПЕР               = $28 ; 
con_sfx_УДАР                        = $29 ; 
con_sfx_СУПЕР                       = $2A ; 
con_sfx_jump                        = $2B ; прыжок
con_sfx_land_on_ground              = $2C ; приземление на землю
con_sfx_violation                   = $2D ; нарушение - мяч вне игры, фрикик, пенальти
con_sfx_score_a_goal                = $2E ; 
; не используется                   = $2F ; 
; не используется                   = $30 ; 
con_sfx_time_up                     = $31 ; 
con_sfx_move_cursor                 = $32 ; сдвинуть курсор
con_sfx_yes                         = $33 ; положительный
con_sfx_no                          = $34 ; отрицательный
con_sfx_print_text                  = $35 ; печать текста
con_sfx_убийство                    = $36 ; при попадании локтем или подкатом, когда убиваешь игрока или сам убиваешься
con_sfx_прошибание                  = $37 ; 
con_sfx_spin_guinea                 = $38 ; удар этажеркой, кулак кипера после крутилки
con_sfx_УНЕСЛО_ВИХРЕМ               = $39 ; 
; не используется                   = $3A ; 
con_sfx_elbow_tackle                = $3B ; локоть/подкат
con_sfx_spin_normal                 = $3C ; зачистка, вратарская крутилка, ветряная крутилка
con_sfx_bounce_from_ground_ball     = $3D ; отскок мяча от земли
con_sfx_bounce_from_ground_special  = $3E ; отскок супера от земли
con_sfx_spec_noise                  = $3F ; шум зрителей
con_sfx_spec_whistle                = $40 ; свист зрителей
con_sfx_wind                        = $41 ; ветер
; не используется				    = $42 ; 
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