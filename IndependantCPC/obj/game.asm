;--------------------------------------------------------
; File Created by SDCC : free open source ANSI-C Compiler
; Version 3.5.5 #9498 (Linux)
;--------------------------------------------------------
	.module game
	.optsdcc -mz80
	
;--------------------------------------------------------
; Public variables in this module
;--------------------------------------------------------
	.globl _drawAll
	.globl _updatePlayer
	.globl _accion
	.globl _incializarEntities
	.globl _cpct_waitVSYNC
	.globl _cpct_isKeyPressed
	.globl _cpct_scanKeyboard_f
	.globl _cpct_memset
	.globl _player
	.globl _inicializarPantalla
	.globl _updateUser
	.globl _play
;--------------------------------------------------------
; special function registers
;--------------------------------------------------------
;--------------------------------------------------------
; ram data
;--------------------------------------------------------
	.area _DATA
;--------------------------------------------------------
; ram data
;--------------------------------------------------------
	.area _INITIALIZED
;--------------------------------------------------------
; absolute external ram data
;--------------------------------------------------------
	.area _DABS (ABS)
;--------------------------------------------------------
; global & static initialisations
;--------------------------------------------------------
	.area _HOME
	.area _GSINIT
	.area _GSFINAL
	.area _GSINIT
;--------------------------------------------------------
; Home
;--------------------------------------------------------
	.area _HOME
	.area _HOME
;--------------------------------------------------------
; code
;--------------------------------------------------------
	.area _CODE
;src/game.c:15: void inicializarPantalla(){
;	---------------------------------
; Function inicializarPantalla
; ---------------------------------
_inicializarPantalla::
;src/game.c:17: cpct_clearScreen(0);
	ld	hl,#0x4000
	push	hl
	xor	a, a
	push	af
	inc	sp
	ld	h, #0xC0
	push	hl
	call	_cpct_memset
	ret
_player:
	.db #0x64	; 100	'd'
	.db #0x32	; 50	'2'
	.byte (_player + 0)
	.byte (_player + 1)
	.dw _g_naves_1
;src/game.c:22: void updateUser(){
;	---------------------------------
; Function updateUser
; ---------------------------------
_updateUser::
;src/game.c:24: cpct_scanKeyboard_f();
	call	_cpct_scanKeyboard_f
;src/game.c:26: if(cpct_isKeyPressed(Key_CursorUp)){
	ld	hl,#0x0100
	call	_cpct_isKeyPressed
	ld	a, l
	or	a, a
	jr	Z,00110$
;src/game.c:27: accion(&player, es_mover, d_up);
	ld	hl,#0x0001
	push	hl
	ld	hl,#_player
	push	hl
	call	_accion
	pop	af
	pop	af
	ret
00110$:
;src/game.c:28: }else if(cpct_isKeyPressed(Key_CursorDown)){
	ld	hl,#0x0400
	call	_cpct_isKeyPressed
	ld	a,l
	or	a, a
	jr	Z,00107$
;src/game.c:29: accion(&player, es_mover, d_down);
	ld	hl,#0x0101
	push	hl
	ld	hl,#_player
	push	hl
	call	_accion
	pop	af
	pop	af
	ret
00107$:
;src/game.c:30: }else if(cpct_isKeyPressed(Key_CursorRight)){
	ld	hl,#0x0200
	call	_cpct_isKeyPressed
	ld	a,l
	or	a, a
	jr	Z,00104$
;src/game.c:31: accion(&player,es_mover,d_right);
	ld	hl,#0x0201
	push	hl
	ld	hl,#_player
	push	hl
	call	_accion
	pop	af
	pop	af
	ret
00104$:
;src/game.c:32: }else if(cpct_isKeyPressed(Key_CursorLeft)){
	ld	hl,#0x0101
	call	_cpct_isKeyPressed
	ld	a,l
	or	a, a
	ret	Z
;src/game.c:33: accion(&player,es_mover,d_left);
	ld	hl,#0x0301
	push	hl
	ld	hl,#_player
	push	hl
	call	_accion
	pop	af
	pop	af
	ret
;src/game.c:39: void play(){
;	---------------------------------
; Function play
; ---------------------------------
_play::
;src/game.c:41: inicializarPantalla();
	call	_inicializarPantalla
;src/game.c:42: incializarEntities();
	call	_incializarEntities
;src/game.c:45: while(1){
00102$:
;src/game.c:46: updateUser();	
	call	_updateUser
;src/game.c:47: updatePlayer(&player);
	ld	hl,#_player
	push	hl
	call	_updatePlayer
	pop	af
;src/game.c:49: cpct_waitVSYNC();
	call	_cpct_waitVSYNC
;src/game.c:50: drawAll(&player);
	ld	hl,#_player
	push	hl
	call	_drawAll
	pop	af
	jr	00102$
	.area _CODE
	.area _INITIALIZER
	.area _CABS (ABS)
