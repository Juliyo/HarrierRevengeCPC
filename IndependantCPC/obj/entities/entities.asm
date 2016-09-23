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
;src/entities/entities.c:12: void dibujarPlayer(TPlayer* player){
;	---------------------------------
; Function dibujarPlayer
; ---------------------------------
_dibujarPlayer::
	push	ix
	ld	ix,#0
	add	ix,sp
;src/entities/entities.c:13: u8* vmem = cpct_getScreenPtr(CPCT_VMEM_START,player->x, player->y);
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
;src/entities/entities.c:14: cpct_drawSprite(player->sprite,vmem,G_NAVES_0_W,G_NAVES_0_H);
	pop	hl
	inc	hl
	inc	hl
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
;src/entities/entities.c:17: void drawAll(TPlayer* player){
;	---------------------------------
; Function drawAll
; ---------------------------------
_drawAll::
;src/entities/entities.c:19: dibujarPlayer(player);
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
