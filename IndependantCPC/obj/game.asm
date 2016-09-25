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
	.globl _cpct_etm_setTileset2x4
	.globl _cpct_etm_drawTileBox2x4
	.globl _cpct_waitVSYNC
	.globl _cpct_isAnyKeyPressed
	.globl _cpct_isKeyPressed
	.globl _cpct_scanKeyboard_if
	.globl _cpct_memset
	.globl _mapa
	.globl _player
	.globl _inicializarPantalla
	.globl _dibujarMapa
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
_mapa::
	.ds 2
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
;src/game.c:22: void inicializarPantalla(){
;	---------------------------------
; Function inicializarPantalla
; ---------------------------------
_inicializarPantalla::
;src/game.c:24: cpct_clearScreen(0);
	ld	hl,#0x4000
	push	hl
	xor	a, a
	push	af
	inc	sp
	ld	h, #0xC0
	push	hl
	call	_cpct_memset
;src/game.c:26: mapa = g_map1;
	ld	hl,#_g_map1+0
	ld	(_mapa),hl
;src/game.c:27: cpct_etm_setTileset2x4(g_tileset);
	ld	hl,#_g_tileset
	call	_cpct_etm_setTileset2x4
;src/game.c:28: dibujarMapa();
	call	_dibujarMapa
	ret
_player:
	.db #0x14	; 20
	.db #0x9D	; 157
	.byte (_player + 0)
	.byte (_player + 1)
	.db #0x01	; 1
	.dw _g_naves_0
;src/game.c:32: void dibujarMapa(){
;	---------------------------------
; Function dibujarMapa
; ---------------------------------
_dibujarMapa::
;src/game.c:33: cpct_etm_drawTilemap2x4(g_map1_W, g_map1_H, ORIGEN_MAPA, mapa);
	ld	hl,(_mapa)
	push	hl
	ld	hl,#0xC000
	push	hl
	ld	hl,#0x2832
	push	hl
	ld	l, #0x00
	push	hl
	xor	a, a
	push	af
	inc	sp
	call	_cpct_etm_drawTileBox2x4
	ret
;src/game.c:36: void updateUser(){
;	---------------------------------
; Function updateUser
; ---------------------------------
_updateUser::
;src/game.c:38: cpct_scanKeyboard_if();
	call	_cpct_scanKeyboard_if
;src/game.c:39: if(cpct_isAnyKeyPressed()){
	call	_cpct_isAnyKeyPressed
	ld	a,l
	or	a, a
	ret	Z
;src/game.c:40: if(cpct_isKeyPressed(Key_CursorUp)){
	ld	hl,#0x0100
	call	_cpct_isKeyPressed
	ld	a,l
	or	a, a
	jr	Z,00110$
;src/game.c:41: accion(&player, es_mover, d_up);
	ld	hl,#0x0001
	push	hl
	ld	hl,#_player
	push	hl
	call	_accion
	pop	af
	pop	af
	ret
00110$:
;src/game.c:42: }else if(cpct_isKeyPressed(Key_CursorDown)){
	ld	hl,#0x0400
	call	_cpct_isKeyPressed
	ld	a,l
	or	a, a
	jr	Z,00107$
;src/game.c:43: accion(&player, es_mover, d_down);
	ld	hl,#0x0101
	push	hl
	ld	hl,#_player
	push	hl
	call	_accion
	pop	af
	pop	af
	ret
00107$:
;src/game.c:44: }else if(cpct_isKeyPressed(Key_CursorRight)){
	ld	hl,#0x0200
	call	_cpct_isKeyPressed
	ld	a,l
	or	a, a
	jr	Z,00104$
;src/game.c:45: accion(&player,es_mover,d_right);
	ld	hl,#0x0201
	push	hl
	ld	hl,#_player
	push	hl
	call	_accion
	pop	af
	pop	af
	ret
00104$:
;src/game.c:46: }else if(cpct_isKeyPressed(Key_CursorLeft)){
	ld	hl,#0x0101
	call	_cpct_isKeyPressed
	ld	a,l
	or	a, a
	ret	Z
;src/game.c:47: accion(&player,es_mover,d_left);
	ld	hl,#0x0301
	push	hl
	ld	hl,#_player
	push	hl
	call	_accion
	pop	af
	pop	af
	ret
;src/game.c:55: void play(){
;	---------------------------------
; Function play
; ---------------------------------
_play::
	push	ix
	ld	ix,#0
	add	ix,sp
	dec	sp
;src/game.c:57: u8 alive = 1;
	ld	-1 (ix),#0x01
;src/game.c:59: inicializarPantalla();
	call	_inicializarPantalla
;src/game.c:60: incializarEntities();
	call	_incializarEntities
;src/game.c:63: while(alive){
00101$:
	ld	a,-1 (ix)
	or	a, a
	jr	Z,00104$
;src/game.c:64: updateUser();	
	call	_updateUser
;src/game.c:65: alive = updatePlayer(&player);
	ld	hl,#_player
	push	hl
	call	_updatePlayer
	pop	af
	ld	-1 (ix),l
;src/game.c:67: cpct_waitVSYNC();
	call	_cpct_waitVSYNC
;src/game.c:68: drawAll(&player);
	ld	hl,#_player
	push	hl
	call	_drawAll
	pop	af
	jr	00101$
00104$:
	inc	sp
	pop	ix
	ret
	.area _CODE
	.area _INITIALIZER
__xinit__mapa:
	.dw #0x0000
	.area _CABS (ABS)
