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
	.globl _incializarEntities
	.globl _cpct_memset
	.globl _player
	.globl _inicializarPantalla
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
;src/game.c:13: void inicializarPantalla(){
;	---------------------------------
; Function inicializarPantalla
; ---------------------------------
_inicializarPantalla::
;src/game.c:15: cpct_clearScreen(0);
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
	.dw _g_naves_0
;src/game.c:24: void play(){
;	---------------------------------
; Function play
; ---------------------------------
_play::
;src/game.c:26: inicializarPantalla();
	call	_inicializarPantalla
;src/game.c:27: incializarEntities();
	call	_incializarEntities
;src/game.c:30: while(1){
00102$:
;src/game.c:33: drawAll(&player);
	ld	hl,#_player
	push	hl
	call	_drawAll
	pop	af
	jr	00102$
	.area _CODE
	.area _INITIALIZER
	.area _CABS (ABS)
