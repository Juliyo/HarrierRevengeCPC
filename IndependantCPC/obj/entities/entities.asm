;--------------------------------------------------------
; File Created by SDCC : free open source ANSI-C Compiler
; Version 3.5.5 #9498 (Linux)
;--------------------------------------------------------
	.module entities
	.optsdcc -mz80
	
;--------------------------------------------------------
; Public variables in this module
;--------------------------------------------------------
	.globl _cpct_getScreenPtr
	.globl _cpct_drawSprite
	.globl _incializarEntities
	.globl _accion
	.globl _moverArriba
	.globl _updatePlayer
	.globl _redibujarPlayer
	.globl _borrarPlayer
	.globl _dibujarPlayer
	.globl _drawAll
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
;src/entities/entities.c:8: void incializarEntities(){
;	---------------------------------
; Function incializarEntities
; ---------------------------------
_incializarEntities::
;src/entities/entities.c:10: }
	ret
;src/entities/entities.c:14: void accion(TPlayer* player, TPlayerStatus action, TPlayerDirection dir){
;	---------------------------------
; Function accion
; ---------------------------------
_accion::
;src/entities/entities.c:15: switch(action){
	ld	hl, #4+0
	add	hl, sp
	ld	a, (hl)
	dec	a
	ret	NZ
;src/entities/entities.c:17: switch(dir){
	ld	hl, #5+0
	add	hl, sp
	ld	a, (hl)
	or	a, a
	ret	NZ
;src/entities/entities.c:19: moverArriba(player);
	pop	bc
	pop	hl
	push	hl
	push	bc
	push	hl
	call	_moverArriba
	pop	af
;src/entities/entities.c:25: }
	ret
;src/entities/entities.c:28: void moverArriba(TPlayer* player){
;	---------------------------------
; Function moverArriba
; ---------------------------------
_moverArriba::
	push	ix
	ld	ix,#0
	add	ix,sp
;src/entities/entities.c:29: if (player->y + G_NAVES_0_H < ALTO) {
	ld	c,4 (ix)
	ld	b,5 (ix)
	inc	bc
	ld	a,(bc)
	ld	e,a
	ld	l,e
	ld	h,#0x00
	push	de
	ld	de,#0x0010
	add	hl, de
	pop	de
	ld	a,l
	sub	a, #0xC8
	ld	a,h
	rla
	ccf
	rra
	sbc	a, #0x80
	jr	NC,00103$
;src/entities/entities.c:30: player->y--;
	dec	e
	ld	a,e
	ld	(bc),a
00103$:
	pop	ix
	ret
;src/entities/entities.c:37: void updatePlayer(TPlayer* player){
;	---------------------------------
; Function updatePlayer
; ---------------------------------
_updatePlayer::
;src/entities/entities.c:39: }
	ret
;src/entities/entities.c:41: void redibujarPlayer(TPlayer* player){
;	---------------------------------
; Function redibujarPlayer
; ---------------------------------
_redibujarPlayer::
	push	ix
	ld	ix,#0
	add	ix,sp
;src/entities/entities.c:42: borrarPlayer(player);
	ld	l,4 (ix)
	ld	h,5 (ix)
	push	hl
	call	_borrarPlayer
	pop	af
;src/entities/entities.c:43: player->px = player->x;
	ld	c,4 (ix)
	ld	b,5 (ix)
	ld	e, c
	ld	d, b
	inc	de
	inc	de
	ld	a,(bc)
	ld	(de),a
;src/entities/entities.c:44: player->py = player->y;
	ld	e, c
	ld	d, b
	inc	de
	inc	de
	inc	de
	ld	l, c
	ld	h, b
	inc	hl
	ld	a,(hl)
	ld	(de),a
;src/entities/entities.c:45: dibujarPlayer(player);
	push	bc
	call	_dibujarPlayer
	pop	af
	pop	ix
	ret
;src/entities/entities.c:48: void borrarPlayer(TPlayer* player){
;	---------------------------------
; Function borrarPlayer
; ---------------------------------
_borrarPlayer::
;src/entities/entities.c:50: }
	ret
;src/entities/entities.c:52: void dibujarPlayer(TPlayer* player){
;	---------------------------------
; Function dibujarPlayer
; ---------------------------------
_dibujarPlayer::
	push	ix
	ld	ix,#0
	add	ix,sp
;src/entities/entities.c:53: u8* vmem = cpct_getScreenPtr(CPCT_VMEM_START,player->x, player->y);
	ld	c,4 (ix)
	ld	b,5 (ix)
	ld	l, c
	ld	h, b
	inc	hl
	ld	d,(hl)
	ld	a,(bc)
	push	bc
	push	de
	inc	sp
	push	af
	inc	sp
	ld	hl,#0xC000
	push	hl
	call	_cpct_getScreenPtr
	ex	de,hl
;src/entities/entities.c:54: cpct_drawSprite(player->sprite,vmem,G_NAVES_0_W,G_NAVES_0_H);
	pop	hl
	ld	bc, #0x0004
	add	hl, bc
	ld	c,(hl)
	inc	hl
	ld	b,(hl)
	ld	hl,#0x1008
	push	hl
	push	de
	push	bc
	call	_cpct_drawSprite
	pop	ix
	ret
;src/entities/entities.c:57: void drawAll(TPlayer* player){
;	---------------------------------
; Function drawAll
; ---------------------------------
_drawAll::
;src/entities/entities.c:59: dibujarPlayer(player);
	pop	bc
	pop	hl
	push	hl
	push	bc
	push	hl
	call	_dibujarPlayer
	pop	af
	ret
	.area _CODE
	.area _INITIALIZER
	.area _CABS (ABS)
