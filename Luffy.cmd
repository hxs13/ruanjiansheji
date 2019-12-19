; The CMD file.
;
; Two parts: 1. Command definition and  2. State entry
; (state entry is after the commands def section)
;
; 1. Command definition
; ---------------------
; Note: The commands are CASE-SENSITIVE, and so are the command names.
; The eight directions are:
;   B, DB, D, DF, F, UF, U, UB     (all CAPS)
;   corresponding to back, down-back, down, downforward, etc.
; The six buttons are:
;   a, b, c, x, y, z               (all lower case)
;   In default key config, abc are are the bottom, and xyz are on the
;   top row. For 2 button characters, we recommend you use a and b.
;   For 6 button characters, use abc for kicks and xyz for punches.
;
; Each [Command] section defines a command that you can use for
; state entry, as well as in the CNS file.
; The command section should look like:
;
;   [Command]
;   name = some_name
;   command = the_command
;   time = time (optional)
;   buffer.time = time (optional)
;
; - some_name
;   A name to give that command. You'll use this name to refer to
;   that command in the state entry, as well as the CNS. It is case-
;   sensitive (QCB_a is NOT the same as Qcb_a or QCB_A).
;
; - command
;   list of buttons or directions, separated by commas. Each of these
;   buttons or directions is referred to as a "symbol".
;   Directions and buttons can be preceded by special characters:
;   slash (/) - means the key must be held down
;          egs. command = /D       ;hold the down direction
;               command = /DB, a   ;hold down-back while you press a
;   tilde (~) - to detect key releases
;          egs. command = ~a       ;release the a button
;               command = ~D, F, a ;release down, press fwd, then a
;          If you want to detect "charge moves", you can specify
;          the time the key must be held down for (in game-ticks)
;          egs. command = ~30a     ;hold a for at least 30 ticks, then release
;   dollar ($) - Direction-only: detect as 4-way
;          egs. command = $D       ;will detect if D, DB or DF is held
;               command = $B       ;will detect if B, DB or UB is held
;   plus (+) - Buttons only: simultaneous press
;          egs. command = a+b      ;press a and b at the same time
;               command = x+y+z    ;press x, y and z at the same time
;   greater-than (>) - means there must be no other keys pressed or released
;                      between the previous and the current symbol.
;          egs. command = a, >~a   ;press a and release it without having hit
;                                  ;or released any other keys in between
;   You can combine the symbols:
;     eg. command = ~30$D, a+b     ;hold D, DB or DF for 30 ticks, release,
;                                  ;then press a and b together
;
;   Note: Successive direction symbols are always expanded in a manner similar
;         to this example:
;           command = F, F
;         is expanded when MUGEN reads it, to become equivalent to:
;           command = F, >~F, >F
;
;   It is recommended that for most "motion" commads, eg. quarter-circle-fwd,
;   you start off with a "release direction". This makes the command easier
;   to do.
;
; - time (optional)
;   Time allowed to do the command, given in game-ticks. The default
;   value for this is set in the [Defaults] section below. A typical
;   value is 15.
;
; - buffer.time (optional)
;   Time that the command will be buffered for. If the command is done
;   successfully, then it will be valid for this time. The simplest
;   case is to set this to 1. That means that the command is valid
;   only in the same tick it is performed. With a higher value, such
;   as 3 or 4, you can get a "looser" feel to the command. The result
;   is that combos can become easier to do because you can perform
;   the command early. Attacks just as you regain control (eg. from
;   getting up) also become easier to do. The side effect of this is
;   that the command is continuously asserted, so it will seem as if
;   you had performed the move rapidly in succession during the valid
;   time. To understand this, try setting buffer.time to 30 and hit
;   a fast attack, such as KFM's light punch.
;   The default value for this is set in the [Defaults] section below. 
;   This parameter does not affect hold-only commands (eg. /F). It
;   will be assumed to be 1 for those commands.
;
; If you have two or more commands with the same name, all of them will
; work. You can use it to allow multiple motions for the same move.
;
; Some common commands examples are given below.
;
; [Command] ;Quarter circle forward + x
; name = "QCF_x"
; command = ~D, DF, F, x
;
; [Command] ;Half circle back + a
; name = "HCB_a"
; command = ~F, DF, D, DB, B, a
;
; [Command] ;Two quarter circles forward + y
; name = "2QCF_y"
; command = ~D, DF, F, D, DF, F, y
;
; [Command] ;Tap b rapidly
; name = "5b"
; command = b, b, b, b, b
; time = 30
;
; [Command] ;Charge back, then forward + z
; name = "charge_B_F_z"
; command = ~60$B, F, z
; time = 10
;
; [Command] ;Charge down, then up + c
; name = "charge_D_U_c"
; command = ~60$D, U, c
; time = 10


;-| Button Remapping |-----------------------------------------------------
; This section lets you remap the player's buttons (to easily change the
; button configuration). The format is:
;   old_button = new_button
; If new_button is left blank, the button cannot be pressed.
[command]
name = "Holdz"
command = /z
time = 15

[command]
name = "thow"
command = F,a
time = 15

[command]
name = "hold_backatras"
command = /B
time = 15

[command]
name = "down2"
command = D,D
time = 15

[command]
name = "baki"
command = ~B,s
time = 15

[command]
name = "y,z"
command = y+z
time = 15

[command]
name = "BH"
command = D,y
time = 15

[command]
name = "SSS"
command = s,F
time = 15

[command]
name = "pressleft"
command = /F
time = 15

[command]
name = "pressup"
command = /U
time = 15

[command]
name = "combofinal"
command = U,/a
time = 15

[command]
name = "gatling_up"
command = U,a
time = 15

[command]
name = "snakeshot"
command = F,z
time = 15
;--------------
[command]
name = "fwd"
command = F
time = 15

[command]
name = "back"
command = B
time = 15

[command]
name = "F"
command = F
time = 15

[command]
name = "hold_y"
command = /y
time = 15

[command]
name = "right"
command = B
time = 15

[command]
name = "left"
command = F
time = 15

[command]
name = "down"
command = D
time = 15

[command]
name = "hold_x"
command = /x
time = 15

[command]
name = "up"
command = U
time = 15

[command]
name = "Bazookar"
command = F,a
time = 15
;-------------------

[command]
name = "rf"
command = B,a
time = 15

[command]
name = "golpe"
command = D,z
time = 15

[command]
name = "llll"
command = D,z
time = 15

[command]
name = "lot2"
command = F,a
time = 15

[command]
name = "lot"
command = B,s
time = 15

[command]
name = "haki"
command = F,s
time = 15

[command]
name = "hol_s"
command = /s
time = 15

[command]
name = "nodod"
command = F,b
time = 15


[command]
name = "DOODGE"
command = B,b
time = 15

[command]
name = "hold_z"
command = D,z
time = 15
;-------------


[command]
name = "snake"
command = b+c
time = 15

[command]
name = "Snake of"
command = D,z
time = 15

[command]
name = "gomo no snake"
command = b+c
time = 15

[command]
name = "bosu"
command = D,z
time = 15

[command]
name = "hold_a"
command = /a
time = 15

[command]
name = "QCF_Y"
command = D,F,z
time = 15

[Remap]
[command]
name = "sstamp"
command = D,b
time = 15

x = x
[command]
name = "bback"
command = B
time = 15

y = y
[command]
name = "wwalk"
command = F
time = 15

z = z

[command]
name = "superrun"
command = D,z
time = 15
;---------------


a = a
[command]
name = "gomono"
command = B,B,b
time = 15

b = b
[command]
name = "Elephant Gun2"
command = D,z
time = 15

c = c
[command]
name = "haki desactivado"
command = a+b
time = 15

s = s

;-| Default Values |-------------------------------------------------------
[command]
name = "High Jump Back"
command = D,U,B
time = 15

[Defaults]
; Default value for the "time" parameter of a Command. Minimum 1.
[command]
name = "High Jump"
command = D,U
time = 15

command.time = 15

; Default value for the "buffer.time" parameter of a Command. Minimum 1,
; maximum 30.
;-------50
;-| Super Motions |--------------------------------------------------------
[command]
name = "Power Charge"
command = s
time = 30
[command]
name = "Nightmare Luffy"
command = DB,a
time = 30
[command]
name = "Nightmare Luffy"
command = D,DB,B,D,DF,F+a
time = 30

[command]
name = "Red Hawk"
command = D,D,c
time = 30
[command]
name = "Red Hawk"
command = D,DB,B,D,DB,B+c
time = 30

[command]
name = "Hakushou Haki"
command = D,y
time = 30
[command]
name = "Hakushou Haki"
command = D,DB,B,D,DB,B+a
time = 30


[command]
name = "BK"
command = D,x
time = 30


[command]
name = "Super Jet Gatling"
command = F,x
time = 30
[command]
name = "Super Jet Gatling"
command = D,DB,B,D,DB,B+a
time = 30

[command]
name = "Gigant Jet Shell"
command = D,a
time = 30
;--------------

[command]
name = "Gigant Jet Shell"
command = D,DB,B,D,DB,B+b
time = 30

[command]
name = "Elephant Gatling Gun"
command = D,y
time = 30
[command]
name = "Elephant Gatling Gun"
command = D,DB,B,D,DB,B+a
time = 30

[command]
name = "Gigant Bazooka"
command = y
time = 30
[command]
name = "Gigant Bazooka"
command = D,DF,F,D,DF,F+a
time = 30

[command]
name = "Gear Second"
command = D,s
time = 30
[command]
name = "Gear Second"
command = D,DF,F,D,DF,F+a
time = 30

[command]
name = "Gear Third"
command = DF,c
time = 30
[command]
name = "Gear Third"
command = D,DF,F,D,DF,F+c
time = 30

;---------70

;-| Special Motions |------------------------------------------------------
[Command]
name = "Gatling"
command = B,c
time = 30
[Command]
name = "Gatling"
command = D,DB,B+c
time = 30

[Command]
name = "Kane"
command = F,c
time = 15
[Command]
name = "Kane"
command = D,DF,F+c
time = 15

[command]
name = "kanon"
command = b,c
time = 30


[command]
name = "Haki"
command = D,D,c
time = 15


[command]
name = "Hanabi"
command = B,B,b
time = 30
[command]
name = "Hanabi"
command = F,D,DF+b
time = 30

[Command]
name = "StampGatling"
command = z
time = 15
[Command]
name = "StampGatling"
command = D,DB,B+b
time = 15
;80--------------
[Command]
name = "Ono"
command = B,z
time = 30
[Command]
name = "Ono"
command = D,DF,F+b
time = 30

[Command]
name = "Hammer"
command = B,x
time = 15
[Command]
name = "Hammer"
command = D,DF,F+b
time = 15

[Command]
name = "Snake"
command = D,z
time = 15

;90-----------
[Command]
name = "Snake"
command = B,DF,F+a
time = 15

[command]
name = "Fuusen"
command = D,c
time = 30
[command]
name = "Fuusen"
command = B,D,DB+a
time = 30

[command]
name = "Storm"
command = B,c
time = 30
[command]
name = "Storm"
command = F,D,DF+a
time = 30

[Command]
name = "SuperPistol"
command = D,z
time = 15
[Command]
name = "SuperPistol"
command = D,DB,B+a
time = 15

[Command]
name = "Rifle"
command = z
time = 15
[Command]
name = "Rifle"
command = D,DB,B+a
time = 15

[Command]
name = "Bazooka"
command = x
time = 15

;--100
[Command]
name = "Bazooka"
command = D,DF,F+a
time = 15

[Command]
name = "Gatoringu"
command = B,a
time = 30

;-| Double Tap |-----------------------------------------------------------
[Command]
name = "FF"     ;Required (do not remove)
command = F, F
time = 10

[Command]
name = "BB"     ;Required (do not remove)
command = B, B
time = 10

[command]
name = "superrun"
command = DF
time = 10

;-| 2/3 Button Combination |-----------------------------------------------
[Command]
name = "hold_a"
command = /a
time = 1

[Command]
name = "hold_b"
command = /b
time = 1

[Command]
name = "hold_c"
command = /c
time = 1

[Command]
name = "hold_s"
command = /s
time = 1



[Command]
name = "recovery";Required (do not remove)
command = a+b
time = 1
;110--

[Command]
name = "FF"
command = F, F
time = 10

[Command]
name = "BB"
command = B, B
time = 10

[Command]
name = "UU"
command = U, U
time = 10

[Command]
name = "DD"
command = D, D
time = 10



;-| Dir + Button |---------------------------------------------------------
[Command]
name = "down_a"
command = /$D,a
time = 1

[Command]
name = "down_b"
command = /$D,b
time = 1

[Command]
name = "down_c"
command = /$D,c
time = 1
;117--------

;-| Single Button |---------------------------------------------------------
[Command]
name = "a"
command = a
time = 1

[Command]
name = "b"
command = b
time = 1
;119----
[Command]
name = "c"
command = c
time = 1

[Command]
name = "x"
command = x
time = 1

[Command]
name = "y"
command = y
time = 1

[Command]
name = "z"
command = z
time = 1

[Command]
name = "s"
command = s
time = 1

;-| Hold Dir |--------------------------------------------------------------
[Command]
name = "holdfwd"
command = /$F
time = 1

[Command]
name = "holdback";Required (do not remove)
command = /$B
time = 1

[Command]
name = "holdup" ;Required (do not remove)
command = /$U
time = 1

[Command]
name = "holddown";Required (do not remove)
command = /$D
time = 1

;---------- Comandos de la Inteligencia Artificial-----------------
; Comandos activadores
[Command]
name = "AI Prueba"
command = y+z ; con el botón A+B activamos la AI
time = 1

[Command]
name = "AI desactivado"
command = b+c ; Con el boton B+C desactivamos la AI
time = 1

;---------- comandos para que la PC active la IA -------------------------
[command]
name = "AI1"
command = D,x
time = 15

[command]
name = "AI2"
command = b,c,b,c,b,c,b,c,b,c,b,c
time = 1

[command]
name = "AI3"
command = b,c,b,c,b,c,b,c,b,c,b
time = 1

[command]
name = "AI4"
command = a,b,a,b,a,b,a,b,a,b,a
time = 1

[command]
name = "AI5"
command = b,a,b,a,b,a,b,a,b,a,b
time = 1

[command]
name = "AI6"
command = b,b,b,b,z,b,z,b,z,z,z
time = 1

[command]
name = "AI7"
command = b,x,b,b,x,b,b,b,b,b,x
time = 1

[command]
name = "AI8"
command = b,y,b,b,b,y,b,b,b,b,y
time = 1

[command]
name = "AI9"
command = b,b,b,b,s,z,y,x,c,b,a
time = 1

[command]
name = "AI10"
command = z,b,x,y,b,b,c,b,b,b,a
time = 1

[command]
name = "AI11"
command = b,x,b,b,x,b,b,b,b,b,z
time = 1

[command]
name = "AI12"
command = b,y,b,s,b,y,b,b,b,b,y
time = 1

[command]
name = "AI13"
command = b,b,b,z,s,z,y,x,c,b,a
time = 1

[command]
name = "AI14"
command = z,b,x,y,b,b,c,b,b,c,a
time = 1

;---------------------------------------------------------------------------
; 2. State entry
; --------------
; This is where you define what commands bring you to what states.
;
; Each state entry block looks like:
;   [State -1, Label]           ;Change Label to any name you want to use to
;                               ;identify the state with.
;   type = ChangeState          ;Don't change this
;   value = new_state_number
;   trigger1 = command = command_name
;   . . .  (any additional triggers)
;
; - new_state_number is the number of the state to change to
; - command_name is the name of the command (from the section above)
; - Useful triggers to know:
;   - statetype
;       S, C or A : current state-type of player (stand, crouch, air)
;   - ctrl
;       0 or 1 : 1 if player has control. Unless "interrupting" another
;                move, you'll want ctrl = 1
;   - stateno
;       number of state player is in - useful for "move interrupts"
;   - movecontact
;       0 or 1 : 1 if player's last attack touched the opponent
;                useful for "move interrupts"
;
; Note: The order of state entry is important.
;   State entry with a certain command must come before another state
;   entry with a command that is the subset of the first.
;   For example, command "fwd_a" must be listed before "a", and
;   "fwd_ab" should come before both of the others.
;
; For reference on triggers, see CNS documentation.
;
; Just for your information (skip if you're not interested):
; This part is an extension of the CNS. "State -1" is a special state
; that is executed once every game-tick, regardless of what other state
; you are in.


; Don't remove the following line. It's required by the CMD standard.
[Statedef -1]


[State -1,sstampw]
type = ChangeState
value = 3870
triggerall = command = "sstamp"
triggerall = var(18) != 1
triggerall = var(2) != 1
trigger1 = statetype != A
trigger1 = ctrl


;Gomu Onoo
[State -1, Gomu Onoo]
type = ChangeState
value = 61300
triggerall = var(41) = 1
trigger1 = command = "Storm"
trigger1 = (statetype = s) && ctrl


;Kawarimi
;[State -1, Kawarimi]
;type = HitOverride
;trigger1 = life = 1
;triggerall = !ishelper
;time = 0
;attr = SCA,NA,SA,HA,NP,SP,HP,NT,ST,HT
;stateno = ifelse(statetype = S,4800,4800)


;===========================================================================
;This is not a move, but it sets up var(1) to be 1 if conditions are right
;for a combo into a special move (used below).
;Since a lot of special moves rely on the same conditions, this reduces
;redundant logic.
[State -1, Combo condition Reset]
type = VarSet
trigger1 = 1
var(1) = 0

[State -1, Combo condition Check]
type = VarSet
trigger1 = statetype != A
trigger1 = ctrl
trigger2 = (stateno = [200,299]) || (stateno = [400,499])
trigger2 = stateno != 440 ;Except for sweep kick
trigger2 = movecontact
var(1) = 1

[State -1, gearmoves3]
type = ChangeState
value = 30102
triggerall =  var(18) = 1
triggerall = var(2) != 1
triggerall = command = "a"
trigger1 = statetype != A
trigger1 = ctrl

[State -1, gearmoves3]
type = ChangeState
value = 3040
triggerall =  var(18) = 1
triggerall = var(2) != 1
triggerall = command = "a"
trigger1 = statetype = A
trigger1 = ctrl

[State -1, gearmoves3]
type = ChangeState
value = 30104
triggerall =  var(18) = 1
triggerall = var(2) != 1
triggerall = command = "b"
trigger1 = statetype != A
trigger1 = ctrl

[State -1,gearmoves3]
type = ChangeState
value = 3020
triggerall =  var(18) = 1
triggerall = var(2) != 1
triggerall = command = "b"
trigger1 = statetype = A
trigger1 = ctrl

[State -1, gearmoves3]
type = ChangeState
value = 30103
triggerall =  var(18) = 1
triggerall = var(2) != 1
triggerall = command = "x"
trigger1 = statetype != A
trigger1 = ctrl

[State -1, gearmoves3]
type = ChangeState
value = 30300
triggerall =  var(18) = 1
triggerall = var(2) != 1
triggerall = command = "x"
trigger1 = statetype = A
trigger1 = ctrl





[State -1, gearmoves3]
type = ChangeState
value = 3070
triggerall =  var(18) = 1
triggerall = var(2) != 1
triggerall = command = "z"
trigger1 = statetype != A
trigger1 = ctrl

[State -1, gearmoves3]
type = ChangeState
value = 3070
triggerall =  var(18) = 1
triggerall = var(2) != 1
triggerall = command = "z"
trigger1 = statetype = A
trigger1 = ctrl
[State -1, gearmoves3]
type = ChangeState
value = 3080
triggerall =  var(18) = 1
triggerall = var(2) != 1
triggerall = command = "c"
trigger1 = statetype != A
trigger1 = ctrl

[State -1, gearmoves3]
type = ChangeState
value = 3080
triggerall =  var(18) = 1
triggerall = var(2) != 1
triggerall = command = "c"
trigger1 = statetype = A
trigger1 = ctrl

;[State 100, 4]
;type = ChangeState
;trigger1 = life <= 25
;trigger2 = (gethitvar(damage) > life)
;value = 4800
;ctrl


[State -1, JetGatling]
type = ChangeState
value = 3500
triggerall = var(2) = 1
triggerall = command = "Super Jet Gatling"
triggerall = power >= 2000
trigger1 = statetype != A
trigger1 = ctrl
trigger2 = (stateno = 200) && (Time > 8)
trigger3 = (stateno = 210) && (Time > 8)
trigger4 = (stateno = 1000)
trigger5 = (stateno = 1100)
trigger6 = (stateno = 1200)
trigger7 = (stateno = 1300) && (Time > 12)
trigger8 = (stateno = 1400) && (time > 22)
trigger9 = (stateno = 1500) && (time > 7)
trigger10 = (stateno = 1600) && (time > 6)
trigger11 = (stateno = 1700) && (Time > 12)
trigger12 = (stateno = 1800) && (Time > 12)
trigger13 = (stateno = 1900) && (Time > 12)

[State -1, Red Hawk]
type = ChangeState
value = 3400
triggerall = var(41)= 1
triggerall = command = "Red Hawk"
triggerall = power >= 0
trigger1 = statetype != A
trigger1 = ctrl
trigger2 = (stateno = 200) && (Time > 8)
trigger3 = (stateno = 210) && (Time > 8)
trigger4 = (stateno = 1000)
trigger5 = (stateno = 1100)
trigger6 = (stateno = 1200)
trigger7 = (stateno = 1300) && (Time > 12)
trigger8 = (stateno = 1400) && (time > 22)
trigger9 = (stateno = 1500) && (time > 7)
trigger10 = (stateno = 1600) && (time > 6)
trigger11 = (stateno = 1700) && (Time > 12)
trigger12 = (stateno = 1800) && (Time > 12)
trigger13 = (stateno = 1900) && (Time > 12)



[State -1, Haoshoku Haki]
type = ChangeState
value = 3100
triggerall = power >= 3000
triggerall = var(2) != 1
triggerall =  var(18) = 1
triggerall = command = "Hakushou Haki"
trigger1 = statetype != A
trigger1 = ctrl
trigger2 = (stateno = 200) && (Time > 8)
trigger3 = (stateno = 210) && (Time > 8)
trigger4 = (stateno = 1000)
trigger5 = (stateno = 1100)
trigger6 = (stateno = 1200)
trigger7 = (stateno = 1300) && (Time > 12)
trigger8 = (stateno = 1400) && (time > 22)
trigger9 = (stateno = 1500) && (time > 7)
trigger10 = (stateno = 1600) && (time > 6)
trigger11 = (stateno = 1700) && (Time > 12)
trigger12 = (stateno = 1800) && (Time > 12)
trigger13 = (stateno = 1900) && (Time > 12)


[State -1, Haoshoku Haki]
type = ChangeState
value = 3300
triggerall = var(29) != 1
triggerall = var(2) != 1
triggerall = command = "SuperPistol"
triggerall = power >= 2000
trigger1 = statetype != A
trigger1 = ctrl
trigger2 = (stateno = 200) && (Time > 8)
trigger3 = (stateno = 210) && (Time > 8)
trigger4 = (stateno = 1000)
trigger5 = (stateno = 1100)
trigger6 = (stateno = 1200)
trigger7 = (stateno = 1300) && (Time > 12)
trigger8 = (stateno = 1400) && (time > 22)
trigger9 = (stateno = 1500) && (time > 7)
trigger10 = (stateno = 1600) && (time > 6)
trigger11 = (stateno = 1700) && (Time > 12)
trigger12 = (stateno = 1800) && (Time > 12)
trigger13 = (stateno = 1900) && (Time > 12)


[State -1, Haoshoku Haki]
type = ChangeState
value = 3300
triggerall = var(29) != 1
triggerall = var(2) = 1
triggerall = command = "SuperPistol"
triggerall = power >= 2000
trigger1 = statetype != A
trigger1 = ctrl
trigger2 = (stateno = 200) && (Time > 8)
trigger3 = (stateno = 210) && (Time > 8)
trigger4 = (stateno = 1000)
trigger5 = (stateno = 1100)
trigger6 = (stateno = 1200)
trigger7 = (stateno = 1300) && (Time > 12)
trigger8 = (stateno = 1400) && (time > 22)
trigger9 = (stateno = 1500) && (time > 7)
trigger10 = (stateno = 1600) && (time > 6)
trigger11 = (stateno = 1700) && (Time > 12)
trigger12 = (stateno = 1800) && (Time > 12)
trigger13 = (stateno = 1900) && (Time > 12)




[State -1, Gear Second - End]
type = ChangeState
value = 3842432
triggerall = var(18) = 1
triggerall = command = "Gear Second"
trigger1 = statetype != A
trigger1 = ctrl


[State -1, Gear Second - End]
type = ChangeState
value = 3001
triggerall = var(2) = 1
triggerall = command = "Gear Second"
trigger1 = statetype != A
trigger1 = ctrl

[State -1, Gear Second]
type = ChangeState
value = 780077
triggerall = var(29) != 1
triggerall = var(2) != 1
triggerall = command = "Gear Second"
triggerall = power >= 1000
trigger1 = statetype != A
trigger1 = ctrl


[State -1, Gigant Bazooka]
type = ChangeState
value = 3090
triggerall =  var(18) = 1
triggerall = var(2) != 1
triggerall = command = "Gigant Bazooka"
triggerall = power >= 1000
trigger1 = ctrl
trigger7 = (stateno = 3000) && (time > 27)
trigger8 = (stateno = 3010) && (time > 6)
trigger9 = (stateno = 3020)

[State -1, Gigant Jet Shell]
type = ChangeState
value = 2400
triggerall = command = "Gigant Jet Shell"
trigger1 = statetype != A
trigger1 = ctrl
triggerall = var(2) != 1
trigger2 = (stateno = 200) && (movecontact = 1)
trigger3 = (stateno = 201) && (movecontact = 1)
trigger4 = (stateno = 202) && (movecontact = 1)
trigger5 = (stateno = 210) && (Time > 7)
trigger6 = (stateno = 300) && (movecontact = 1)

[State -1, Gigant Jet Shell]
type = ChangeState
value = 42400
triggerall = command = "Gigant Jet Shell"
trigger1 = statetype = A
trigger1 = ctrl
triggerall = var(2) != 1
trigger2 = (stateno = 200) && (movecontact = 1)
trigger3 = (stateno = 201) && (movecontact = 1)
trigger4 = (stateno = 202) && (movecontact = 1)
trigger5 = (stateno = 210) && (Time > 7)
trigger6 = (stateno = 300) && (movecontact = 1)

[State -1, Jet Hammer]
type = ChangeState
value = 660
triggerall = var(2) = 1
triggerall = command = "Hammer"
trigger1 = statetype = A
trigger1 = ctrl
trigger2 = (stateno = 600) && (movecontact = 1)
trigger3 = (stateno = 610) && (movecontact = 1)
trigger4 = (stateno = 620) && (movecontact = 1)


[State -1, Combo gear 2]
type = ChangeState
value = 90753
triggerall = var(2) = 1
triggerall = var(41) != 1
triggerall = command = "BK"
trigger1 = ctrl


[State -1, Jet Bazooka - Air]
type = ChangeState
value = 2340
triggerall = var(2) = 1
triggerall = command = "Bazooka"
trigger1 = statetype = a
trigger1 = ctrl
trigger2 = (stateno = 600) && (movecontact = 1)
trigger3 = (stateno = 610) && (movecontact = 1)
trigger8 = (stateno = 1710) && (Time > 7)

[State -1, Super Jet Pistol]
type = ChangeState
value = 2352533
triggerall = var(2) != 1
triggerall = command = "SuperPistol"
trigger1 = statetype = A
trigger1 = ctrl
trigger2 = stateno = 1350 && (movecontact = 1)
trigger3 = (stateno = 600) && (movecontact = 1)
trigger4 = (stateno = 610) && (movecontact = 1)
trigger5 = (stateno = 630) && (movecontact = 1)

[State -1, Super Jet Pistol]
type = ChangeState
value = 2330
triggerall = var(2) = 1
triggerall = command = "SuperPistol"
trigger1 = statetype = A
trigger1 = ctrl
trigger2 = stateno = 1350 && (movecontact = 1)
trigger3 = (stateno = 600) && (movecontact = 1)
trigger4 = (stateno = 610) && (movecontact = 1)
trigger5 = (stateno = 630) && (movecontact = 1)

[State -1, Super Jet Pistol]
type = ChangeState
value = 900
triggerall = var(2) != 1
triggerall = command = "snakeshot"
trigger1 = statetype != A
trigger1 = ctrl
trigger2 = stateno = 1350 && (movecontact = 1)
trigger3 = (stateno = 600) && (movecontact = 1)
trigger4 = (stateno = 610) && (movecontact = 1)
trigger5 = (stateno = 630) && (movecontact = 1)

[State -1, Jet ono]
type = ChangeState
triggerall = var(2) = 1
value = 1900
triggerall = command = "Ono"
trigger1 = statetype != A
trigger1 = ctrl
trigger2 = (stateno = 600) && (movecontact = 1)
trigger3 = (stateno = 610) && (movecontact = 1)
trigger4 = (stateno = 620) && (movecontact = 1)
trigger5 = (stateno = [2500,2503]) && (time > 24)
; Burst Kiai
[State -1, Burst Kiai]
type = ChangeState
triggerall = var(41) = 1
Triggerall = power >= 1000
value =7841500
triggerall = command = "a"
Triggerall = MoveType = H
trigger1 =  ctrl = 0


[State -1, Jet sstamp]
type = ChangeState
triggerall = var(2) = 1
value = 36870
triggerall = command = "sstamp"
trigger1 = statetype != A
trigger1 = ctrl
trigger2 = (stateno = 600) && (movecontact = 1)
trigger3 = (stateno = 610) && (movecontact = 1)
trigger4 = (stateno = 620) && (movecontact = 1)
trigger5 = (stateno = [2500,2503]) && (time > 24)

[State -1, Jet Rifle]
type = ChangeState
triggerall = var(2) = 1
value = 1200;2310
triggerall = command = "Rifle"
trigger1 = statetype != A
trigger1 = ctrl
trigger2 = (stateno = 2201) && (movecontact = 1)
trigger3 = (stateno = 2210) && (movecontact = 1)
trigger4 = (stateno = 2220) && (movecontact = 1)
trigger5 = (stateno = [2500,2503]) && (time > 24)
trigger6 = (stateno = 2600) && (time > 30)

[State -1, Jet Bazooka]
type = ChangeState
triggerall = var(2) = 1
value = 2300
triggerall = command = "Bazooka"
trigger1 = statetype =  s
trigger1 = ctrl
trigger2 = (stateno = 2201) && (movecontact = 1)
trigger3 = (stateno = 2210) && (movecontact = 1)
trigger4 = (stateno = 2220) && (movecontact = 1)


[State -1, Armanent Gatoringu]
type = ChangeState
value = 320
triggerall = var(2) != 1
triggerall = command = "y"
trigger1 = statetype != A
trigger1 = ctrl
trigger2 = (stateno = 200) && (Time > 8)
trigger3 = (stateno = 201) && (Time > 8)
trigger4 = (stateno = 202) && (Time > 8)
trigger5 = (stateno = 210) && (Time > 10)
trigger6 = (stateno = 221)
trigger7 = (stateno = 222)
trigger8 = (stateno = 223)
trigger9 = (stateno = 1020) && (Time > 12)
trigger10 = (stateno = 1200) && (time > 22)
trigger11 = (stateno = 1401)
trigger12 = (stateno = 1520) && (time > 10)



[State -1, Armanent Kane]
type = ChangeState
value = 1700
triggerall = var(1) = 1
triggerall = command = "Kane"
trigger1 = statetype != A
trigger1 = ctrl
trigger2 = (stateno = 200) && (Time > 8)
trigger3 = (stateno = 201) && (Time > 8)
trigger4 = (stateno = 202) && (Time > 8)
trigger5 = (stateno = 210) && (Time > 10)
trigger6 = (stateno = 221)
trigger7 = (stateno = 222)
trigger8 = (stateno = 223)
trigger9 = (stateno = 1020) && (Time > 12)
trigger10 = (stateno = 1200) && (time > 22)
trigger11 = (stateno = 1401)
trigger12 = (stateno = 1520) && (time > 10)

[State -1, Stamp Gatling]
type = ChangeState
value = 1600
triggerall = var(41) = 1
triggerall = command = "StampGatling"
trigger1 = statetype = A
trigger1 = ctrl
trigger2 = (stateno = 600) && (movecontact = 1)
trigger3 = (stateno = 610) && (movecontact = 1)
trigger4 = (stateno = 620) && (movecontact = 1)

[State -1, Stamp Gatling]
type = ChangeState
value = 16800
triggerall = var(2) != 1
triggerall = command = "StampGatling"
trigger1 = statetype = A
trigger1 = ctrl
trigger2 = (stateno = 600) && (movecontact = 1)
trigger3 = (stateno = 610) && (movecontact = 1)
trigger4 = (stateno = 620) && (movecontact = 1)

[State -1, Stamp Gatling]
type = ChangeState
value = 16600
triggerall = var(2)= 1
triggerall = command = "StampGatling"
trigger1 = statetype = A
trigger1 = ctrl
trigger2 = (stateno = 600) && (movecontact = 1)
trigger3 = (stateno = 610) && (movecontact = 1)
trigger4 = (stateno = 620) && (movecontact = 1)

[State -1, Gomu Hanabi - Air]
type = ChangeState
value = 2005
triggerall = command = "Fuusen"
trigger1 = statetype = A
trigger1 = ctrl



;Dodge
[State -1, Dodge]
type = ChangeState
value = 160
triggerall = statetype = S
trigger1 =   command = "haki desactivado"
trigger1 = ctrl
trigger2 = command = "holdfwd" ||  command = "holdback"
trigger2 = stateno = 400 && time =[16,48]

;Dodge
[State -1, 2Dodge]
type = ChangeState
value = 40105
triggerall = statetype = S
trigger1 =   command = "DOODGE"
trigger1 = ctrl

;Dodge
[State -1, 3Dodge]
type = ChangeState
value = 50105
triggerall = statetype = S
trigger1 =   command = "nodod"
trigger1 = ctrl



[State -1,bosu r]
type = ChangeState
value = 8037
triggerall = var(41) = 1
triggerall = command = "snake"
trigger1 = statetype != A
trigger1 = ctrl
;------


[State -1, Gear Second]
type = ChangeState
value = 3
triggerall = var(41) = 1
triggerall = command = "BK"
trigger1 = statetype != A
trigger1 = ctrl


[State -1, Combo]
type = ChangeState
value = 90753
triggerall = var(2) != 1
triggerall = command = "BK"
trigger1 = ctrl



[State -1, Jet Hammer]
type = ChangeState
value = 90753
triggerall = var(2) = 1
triggerall = command = "BK"
trigger1 = statetype = A
trigger1 = ctrl
trigger2 = (stateno = 600) && (movecontact = 1)
trigger3 = (stateno = 610) && (movecontact = 1)
trigger4 = (stateno = 620) && (movecontact = 1)

;-
[State -1,gia 3]
type = ChangeState
value = 38037
triggerall = var(7) = 1
triggerall = power = 1
trigger1 = statetype != A
trigger1 = ctrl



[State -1, Gomu Ono]
type = ChangeState
value = 1900
triggerall = var(2) != 1
triggerall = command = "Ono"
trigger1 = statetype != A
trigger1 = ctrl
trigger2 = (stateno = 600) && (movecontact = 1)
trigger3 = (stateno = 610) && (movecontact = 1)
trigger4 = (stateno = 620) && (movecontact = 1)
trigger5 = (stateno = [2500,2503]) && (time > 24)

[State -1, Gomu Hammer]
type = ChangeState
value = 660
triggerall = var(2) != 1
triggerall = command = "Hammer"
trigger1 = statetype = A
trigger1 = ctrl
trigger2 = (stateno = 600) && (movecontact = 1)
trigger3 =(stateno = 610) && (movecontact = 1)
trigger4 = (stateno = 620) && (movecontact = 1)

[State -1, bosu]
type = ChangeState
value = 832
triggerall = var(29) != 1
triggerall = command = "gomo no snake"
trigger1 = statetype != A
trigger1 = ctrl
trigger2 = (stateno = 200) && (time > 10)
trigger3 = (stateno = 201) && (time > 8)
trigger4 = (stateno = 210) && (movecontact = 1)
trigger5 = (stateno = 220) && (time > 23)
trigger6 = (stateno = 300) && (time > 11)
trigger7 = (stateno = 310) && (time > 10)
trigger8 = (stateno = 1100) && (time > 32)
trigger9 = (stateno = 1700) && (time > 35)



[State -1, punch - Air]
type = ChangeState
value = 525717
triggerall = var(2) != 1
triggerall = command = "b"
trigger1 = statetype = A
trigger1 = ctrl


[State -1, punch - Air]
type = ChangeState
value =525333
triggerall = var(2) = 1
triggerall = command = "b"
trigger1 = statetype = A
trigger1 = ctrl


[State -1, Gomu Fuusen]
type = ChangeState
value = 1400
triggerall = var(1)
triggerall = command = "Fuusen"
trigger1 = statetype != A
trigger1 = ctrl

[State -1, Gomu Storm]
type = ChangeState
value = 1300
triggerall = var(2) != 1
triggerall = command = "Storm"
trigger1 = ctrl
trigger1 = statetype != A
trigger2 = (stateno = 600) && (Time > 8)
trigger3 = (stateno = 610) && (Time > 8)
trigger4 = (stateno = 620) && (Time > 8)

[State -1, Gomu Storm]
type = ChangeState
value = 1300
triggerall = var(2) = 1
triggerall = command = "Storm"
trigger1 = ctrl
trigger1 = statetype != A
trigger2 = (stateno = 600) && (Time > 8)
trigger3 = (stateno = 610) && (Time > 8)
trigger4 = (stateno = 620) && (Time > 8)





[State -1, Gomu Rifle]
type = ChangeState
value = 1200
triggerall = var(2) != 1
triggerall = command = "Rifle"
trigger1 = statetype != A
trigger1 = ctrl
trigger2 = (stateno = 200) && (Time > 8)
trigger3 = (stateno = 201) && (Time > 8)
trigger4 = (stateno = 202) && (Time > 8)
trigger5 = (stateno = 210) && (Time > 10)
trigger6 = (stateno = 221)
trigger7 = (stateno = 222)
trigger8 = (stateno = 223)
trigger9 = (stateno = 1020) && (Time > 12)
trigger10 = (stateno = 1200) && (time > 22)
trigger11 = (stateno = 1301) && (time > 7)
trigger12 = (stateno = 1302) && (time > 6)
trigger13 = (stateno = 1520) && (time > 10)

[State -1, Gomu Bazooka - Air]
type = ChangeState
value = 1150
triggerall = var(2) != 1
triggerall = command = "Bazooka"
trigger1 = statetype = A
trigger1 = ctrl
trigger2 = (stateno = 600) && (movecontact = 1)
trigger3 = (stateno = 610) && (movecontact = 1)
trigger8 = (stateno = 1710) && (Time > 7)

[State -1, Gomu Bazooka]
type = ChangeState
value = 1100
triggerall = var(2) != 1
triggerall = command = "Bazooka"
trigger1 = statetype = S
trigger1 = ctrl

[State -1, Gatoringu]
type = ChangeState
value = 12300
triggerall = var(2) != 1
triggerall = command = "rf"
trigger1 = statetype != A
trigger1 = ctrl
trigger2 = (stateno = 2201) && (movecontact = 1)
trigger3 = (stateno = 2210) && (movecontact = 1)
trigger4 = (stateno = 2220) && (movecontact = 1)



[State -1, Gatoringu]
type = ChangeState
value = 2311000
triggerall = var(2) != 1
triggerall = command = "rf"
trigger1 = statetype = A
trigger1 = ctrl
trigger2 = (stateno = 2201) && (movecontact = 1)
trigger3 = (stateno = 2210) && (movecontact = 1)
trigger4 = (stateno = 2220) && (movecontact = 1)



[State -1, Gatoringu]
type = ChangeState
value = 12311000
triggerall = var(2) = 1
triggerall = command = "rf"
trigger1 = statetype = A
trigger1 = ctrl
trigger2 = (stateno = 2201) && (movecontact = 1)
trigger3 = (stateno = 2210) && (movecontact = 1)
trigger4 = (stateno = 2220) && (movecontact = 1)
;---------------------------------------------------------------------------

;Power Charge
[State -1, Power Charge]
type = ChangeState
value = 1901
triggerall = command = "hol_s"
triggerall = power < 3000
trigger1 = statetype = s
trigger1 = ctrl
;---------------------------------------------------------------------------

[State -1, desgaste]
type = ChangeState
value = 3201
triggerall = stateno != 546332
triggerall = var(7)= 1
trigger1 = power = 0
trigger1 = ctrl = 0
[State -1, desgaste sN]
type = ChangeState
value = 3201
triggerall = var(8)= 1
trigger1 = power = 0
trigger1 = ctrl = 0
;Power full
[State -1, Power Charge]
type = ChangeState
value = 15601
triggerall = var(29) != 1
triggerall = var(19)!= 1
triggerall = command = "hol_s"
triggerall = power > 3000
trigger1 = statetype= s
trigger1 = ctrl

;------


;---------------------------------------------------------------------------
[State -1, Run Fwd]
type = ChangeState
triggerall = var(2)= 1
trigger1 = command = "FF"
value = 1333201
trigger1 = statetype = S
trigger1 = ctrl

;---------------------------------------------------------------------------
[State -1, Run Back]
triggerall = var(2)= 1
type = ChangeState
trigger1 = command = "BB"
value =  6433334
trigger1 = statetype = S
trigger1 = ctrl

;---------------------------------------------------------------------------
[State -1, Run Fwd]
type = ChangeState
trigger1 = command = "FF"
value = 163322
trigger1 = statetype = A
trigger1 = ctrl

;---------------------------------------------------------------------------
[State -1, Run Back]
type = ChangeState
trigger1 = command = "BB"
value = 163321
trigger1 = statetype = A
trigger1 = ctrl

;---------------------------------------------------------------------------
[State -1, Run Fwd]
type = ChangeState
value = 100
trigger1 = command = "FF"
trigger1 = statetype = S
trigger1 = ctrl

;---------------------------------------------------------------------------
[State -1, Run Back]
type = ChangeState
value = 105
trigger1 = command = "BB"
trigger1 = statetype = S
trigger1 = ctrl

;---------------------------------------------------------------------------
[State -1, Jet Pistol]
type = ChangeState
triggerall = var(2)= 1
triggerall = command = "Gigant Jet Shell"
value = 322200
trigger1 = statetype != A
trigger1 = ctrl
trigger2 = (stateno = 2200) && (movecontact = 1)
trigger3 = (stateno = 2201) && (movecontact = 1)
trigger4 = (stateno = 2210) && (movecontact = 1)

;---------------------------------------------------------------------------
[State -1, Jet Pistol - Air]
type = ChangeState
value = 2220
triggerall = var(2)= 1
triggerall = command = "Gigant Jet Shell"
trigger1 = statetype = A
trigger1 = ctrl
trigger2 = stateno = 1350 && (movecontact = 1)
trigger3 = (stateno = 600) && (movecontact = 1)
trigger4 = (stateno = 610) && (movecontact = 1)
trigger5 = (stateno = 630) && (movecontact = 1)

;---------------------------------------------------------------------------
[State -1, Jet Stomp]
type = ChangeState
triggerall = var(2)= 1
triggerall = command = "Gatoringu"
value = 2210
trigger1 = statetype != A
trigger1 = ctrl

;---------------------------------------------------------------------------
;[State -1, Jet Yari]
;type = ChangeState
;value = 2230
;triggerall = var(2)= 1
;triggerall = command = "sstamp"
;trigger1 = statetype = A
;trigger1 = ctrl
;trigger2 = stateno = 1350 && (movecontact = 1)


;---------------------------------------------------------------------------

;comando libre
[State -1, air kane]
type = ChangeState
triggerall = command = "sstamp"
value = 34534523
trigger1 = statetype = A
trigger1 = ctrl

[State -1, thow]
type = ChangeState
value = 1414120
triggerall = command = "thow"
trigger1 = statetype != A
trigger1 = ctrl
trigger2 = (stateno = 200) && (movecontact = 1)
trigger3 = (stateno = 201) && (movecontact = 1)
trigger4 = (stateno = 300) && (movecontact = 1)
trigger5 = (stateno = 312) && (movecontact = 1)

;----------
;51100
;----------------------------------------------------------------------------
[State -1, Punch]
type = ChangeState
value = 200
triggerall = var(2) != 1
triggerall = command = "a"
trigger1 = statetype != A
trigger1 = ctrl
trigger2 = (stateno = 200) && (movecontact = 1)
trigger3 = (stateno = 201) && (movecontact = 1)
trigger4 = (stateno = 300) && (movecontact = 1)
trigger5 = (stateno = 312) && (movecontact = 1)
;KING KONG GUN 6803072
; kong gun 4534010
;calvarien 46331
;snakeman calvarien 546331
; punch gear 4 233020
;30102
;snakeman 801400
;COMBO ;90854
; organ gun 4563099
;--mamba black 54563099
;----------------------------------------------------------------------------
[State -1, jetPunch]
type = ChangeState
value = 2600
triggerall = var(2) = 1
triggerall = command = "a"
trigger1 = statetype != A
trigger1 = ctrl
trigger2 = (stateno = 200) && (movecontact = 1)
trigger3 = (stateno = 201) && (movecontact = 1)
trigger4 = (stateno = 300) && (movecontact = 1)
trigger5 = (stateno = 312) && (movecontact = 1)



;---------------------------------------------------------------------------



[State -1,Standing Medium Kick]
type=ChangeState
value=500
triggerall=Command="b"
trigger1=statetype=S||statetype=C
trigger1=ctrl



[State -1,Standing Strong Kick]
type=ChangeState
value=510
triggerall=Command="b"
trigger1=stateno=500&&movecontact

[State -1,Standing Strong Kick]
type=ChangeState
value=520
triggerall=Command="b"
trigger1=stateno=510&&movecontact

[State -1,Standing Strong Kick]
type=ChangeState
value=530
triggerall=Command="b"
trigger1=stateno=520&&movecontact


[State -1,Standing Strong Kick]
type=ChangeState
value=540
trigger1 = var(2) = 1
triggerall=Command="b"
trigger1=stateno=530&&movecontact


[State -1,Standing Strong Kick]
type=ChangeState
value=540
trigger1 = var(2) != 1&&var(19) != 1
triggerall=Command="b"
trigger1=stateno=530&&movecontact


;---------------------------------------------------------------------------
[State -1, Armanent Pistol]
type = ChangeState
value = 220
triggerall = var(1) = 1
triggerall = command = "c"
trigger1 = statetype != A
trigger1 = ctrl
trigger2 = (stateno = 200) && (movecontact = 1)
trigger3 = (stateno = 201) && (movecontact = 1)
trigger4 = (stateno = 210) && (movecontact = 1)
trigger5 = (stateno = 210) && (time > 13)
trigger6 = (stateno = 300) && (movecontact = 1)
trigger7 = (stateno = 312) && (movecontact = 1)

;---------------------------------------------------------------------------
[State -1, Jump Light Attack]
type = ChangeState
value = 600
triggerall = var(2) != 1
triggerall = command = "c"
trigger1 = statetype = A
trigger1 = ctrl
;---------------------------------------------------------------------------
[State -1, Jump Light Attack]
type = ChangeState
value = 1212600
triggerall = var(2) = 1
triggerall = command = "c"
trigger1 = statetype = A
trigger1 = ctrl

;---------------------------------------------------------------------------
[State -1, Rocket]
type = ChangeState
value = 6111110
triggerall = var(2) = 1
triggerall = command = "a"
trigger1 = statetype = A
trigger1 = ctrl

;---------------------------------------------------------------------------
[State -1, Jump Medium Attack]
type = ChangeState
value = 610
triggerall = command = "a"
triggerall = var(2) != 1
trigger1 = statetype = A
trigger1 = ctrl
trigger2 = (stateno = 600) && (movecontact = 1)

;---------------------------------------------------------------------------
; con esto la pc activa la IA

[State -2, AI activada por la PC]
type = VarSet
trigger1 = (command = "AI1") ||(Command = "AI2") || (Command = "AI3") || (Command = "AI4") || (Command = "AI5")
trigger2 = (Command = "AI6") || (Command = "AI7") || (Command = "AI8") || (Command = "AI9") || (Command = "AI10")
trigger4 = (Command = "AI11") || (Command = "AI12") || (Command = "AI13") || (Command = "AI14")
var(9) = 1


;---------------------------------------------------------------------------
----------------------------------------
[State -1, Teleport]
type = ChangeState
value = 310
triggerall = var(2) = 1
trigger1 = command = "y"
trigger1 = statetype = S
trigger1 = ctrl
[State -1, Teleport]
type = ChangeState
value = 4110
triggerall = var(2) = 1
trigger1 = command = "y"
trigger1 =statetype = A
trigger1 = ctrl

;---------------------------------------------------------------------------
;Air Teleport
[State -1, Air Teleport]
type = ChangeState
value = 320
triggerall = var(2) != 1
trigger1 = command = "y"
trigger1 = statetype = S
trigger1 = ctrl

;[State -1, Air Teleport]
;type = ChangeState
;value = 340123
;triggerall = var(2) != 1
;trigger1 = command = "y"
;trigger1 =  statetype = A
;trigger1 = ctrl


;---------------------------------------------------------------------------
[State -1, High Jump]
type = ChangeState
value = 1170
triggerall = command = "High Jump"
trigger1 = var(2) != 1
triggerall = statetype != A
trigger1   = ctrl

;---------------------------------------------------------------------------
[State -1, High Jump jet]
type = ChangeState
value = 11070
triggerall = command = "High Jump"
trigger1 = var(2) = 1
triggerall = statetype != A
trigger1   = ctrl


[State -1, Gear Third]
type = ChangeState
triggerall = var(8) = 1
value = 3201
trigger1 = power = 0

;----------------------------------------------------------------------------
; Wall jump
[State -1, Wall Jump]
type = ChangeState
value = 480000
trigger1 = command = "holdfwd"
triggerall = statetype = A
triggerall = backedgebodydist <= 1 && backedgebodydist > -100000
triggerall = Pos Y < -30
triggerall = Vel X <= 0
triggerall = var(1) = 0
triggerall = power > 0
triggerall = ctrl
;----------------------------------------------------------------------------


[State -1, Jump Li]
type = ChangeState
value = 72000
triggerall = var(41) = 1
triggerall = command = "gomono"
trigger1 = statetype = S
trigger1 = ctrl
;------------------------------------------------
[State -1, Gomu Onoo]
type = ChangeState
value = 72000
triggerall = var(41) = 1
triggerall = command = "Hanabi"
trigger1 = statetype != A
trigger1 = ctrl
trigger2 = (stateno = 200) && (Time > 8)
trigger3 = (stateno = 201) && (Time > 8)
trigger4 = (stateno = 202) && (Time > 8)
trigger5 = (stateno = 210) && (Time > 10)
trigger6 = (stateno = 221)
trigger7 = (stateno = 222)
trigger8 = (stateno = 223)


