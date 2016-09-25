;--------------------------------------------------------
; File Created by SDCC : free open source ANSI-C Compiler
; Version 3.5.5 #9498 (Linux)
;--------------------------------------------------------
	.module entities
	.optsdcc -mz80
	
;--------------------------------------------------------
; Public variables in this module
;--------------------------------------------------------
	.globl _cpct_etm_drawTileBox2x4
	.globl _cpct_getScreenPtr
	.globl _cpct_drawSpriteMaskedAlignedTable
	.globl _incializarEntities
	.globl _accion
	.globl _moverArriba
	.globl _moverAbajo
	.globl _moverIzquierda
	.globl _moverDerecha
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
;src/entities/entities.c:9: cpctm_createTransparentMaskTable(g_tablatrans,0x0100,M0,0);
;	---------------------------------
; Function dummy_cpct_transparentMaskTable0M0_container
; ---------------------------------
_dummy_cpct_transparentMaskTable0M0_container::
	.area _g_tablatrans_ (ABS) 
	.org 0x0100 
	 _g_tablatrans::
	.db 0xFF, 0xAA, 0x55, 0x00, 0xAA, 0xAA, 0x00, 0x00 
	.db 0x55, 0x00, 0x55, 0x00, 0x00, 0x00, 0x00, 0x00 
	.db 0xAA, 0xAA, 0x00, 0x00, 0xAA, 0xAA, 0x00, 0x00 
	.db 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00 
	.db 0x55, 0x00, 0x55, 0x00, 0x00, 0x00, 0x00, 0x00 
	.db 0x55, 0x00, 0x55, 0x00, 0x00, 0x00, 0x00, 0x00 
	.db 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00 
	.db 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00 
	.db 0xAA, 0xAA, 0x00, 0x00, 0xAA, 0xAA, 0x00, 0x00 
	.db 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00 
	.db 0xAA, 0xAA, 0x00, 0x00, 0xAA, 0xAA, 0x00, 0x00 
	.db 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00 
	.db 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00 
	.db 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00 
	.db 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00 
	.db 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00 
	.db 0x55, 0x00, 0x55, 0x00, 0x00, 0x00, 0x00, 0x00 
	.db 0x55, 0x00, 0x55, 0x00, 0x00, 0x00, 0x00, 0x00 
	.db 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00 
	.db 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00 
	.db 0x55, 0x00, 0x55, 0x00, 0x00, 0x00, 0x00, 0x00 
	.db 0x55, 0x00, 0x55, 0x00, 0x00, 0x00, 0x00, 0x00 
	.db 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00 
	.db 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00 
	.db 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00 
	.db 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00 
	.db 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00 
	.db 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00 
	.db 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00 
	.db 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00 
	.db 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00 
	.db 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00 
	.area _CSEG (REL, CON) 
;src/entities/entities.c:11: void incializarEntities(){
;	---------------------------------
; Function incializarEntities
; ---------------------------------
_incializarEntities::
;src/entities/entities.c:13: }
	ret
;src/entities/entities.c:17: void accion(TPlayer* player, TPlayerStatus action, TPlayerDirection dir){
;	---------------------------------
; Function accion
; ---------------------------------
_accion::
	push	ix
	ld	ix,#0
	add	ix,sp
;src/entities/entities.c:18: switch(action){
	ld	a,6 (ix)
	dec	a
	jr	NZ,00108$
;src/entities/entities.c:20: switch(dir){
	ld	a,#0x03
	sub	a, 7 (ix)
	jr	C,00108$
	ld	e,7 (ix)
	ld	d,#0x00
	ld	hl,#00120$
	add	hl,de
	add	hl,de
;src/entities/entities.c:21: case d_up:
	jp	(hl)
00120$:
	jr	00102$
	jr	00103$
	jr	00105$
	jr	00104$
00102$:
;src/entities/entities.c:22: moverArriba(player);
	ld	l,4 (ix)
	ld	h,5 (ix)
	push	hl
	call	_moverArriba
	pop	af
;src/entities/entities.c:23: break;
	jr	00108$
;src/entities/entities.c:24: case d_down:
00103$:
;src/entities/entities.c:25: moverAbajo(player);
	ld	l,4 (ix)
	ld	h,5 (ix)
	push	hl
	call	_moverAbajo
	pop	af
;src/entities/entities.c:26: break;
	jr	00108$
;src/entities/entities.c:27: case d_left:
00104$:
;src/entities/entities.c:28: moverIzquierda(player);
	ld	l,4 (ix)
	ld	h,5 (ix)
	push	hl
	call	_moverIzquierda
	pop	af
;src/entities/entities.c:29: break;
	jr	00108$
;src/entities/entities.c:30: case d_right:
00105$:
;src/entities/entities.c:31: moverDerecha(player);
	ld	l,4 (ix)
	ld	h,5 (ix)
	push	hl
	call	_moverDerecha
	pop	af
;src/entities/entities.c:36: }
00108$:
	pop	ix
	ret
;src/entities/entities.c:39: void moverArriba(TPlayer* player){
;	---------------------------------
; Function moverArriba
; ---------------------------------
_moverArriba::
;src/entities/entities.c:40: if (player->y > 0) {
	pop	de
	pop	bc
	push	bc
	push	de
	inc	bc
	ld	a,(bc)
	or	a, a
	ret	Z
;src/entities/entities.c:41: player->y--;
	add	a,#0xFF
	ld	(bc),a
	ret
;src/entities/entities.c:48: void moverAbajo(TPlayer* player){
;	---------------------------------
; Function moverAbajo
; ---------------------------------
_moverAbajo::
	push	ix
	ld	ix,#0
	add	ix,sp
;src/entities/entities.c:49: if (player->y + G_NAVES_0_H < ALTO) {
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
;src/entities/entities.c:50: player->y++;
	inc	e
	ld	a,e
	ld	(bc),a
00103$:
	pop	ix
	ret
;src/entities/entities.c:57: void moverIzquierda(TPlayer* player){
;	---------------------------------
; Function moverIzquierda
; ---------------------------------
_moverIzquierda::
;src/entities/entities.c:58: if (player->x > 0) {
	pop	de
	pop	bc
	push	bc
	push	de
	ld	a,(bc)
	or	a, a
	ret	Z
;src/entities/entities.c:59: player->x--;
	add	a,#0xFF
	ld	(bc),a
	ret
;src/entities/entities.c:65: void moverDerecha(TPlayer* player){
;	---------------------------------
; Function moverDerecha
; ---------------------------------
_moverDerecha::
	push	ix
	ld	ix,#0
	add	ix,sp
;src/entities/entities.c:66: if (player->x + G_NAVES_0_W < ANCHO) {
	ld	c,4 (ix)
	ld	b,5 (ix)
	ld	a,(bc)
	ld	e,a
	ld	l,e
	ld	h,#0x00
	push	de
	ld	de,#0x0008
	add	hl, de
	pop	de
	ld	a,l
	sub	a, #0x50
	ld	a,h
	rla
	ccf
	rra
	sbc	a, #0x80
	jr	NC,00103$
;src/entities/entities.c:67: player->x++;
	inc	e
	ld	a,e
	ld	(bc),a
00103$:
	pop	ix
	ret
;src/entities/entities.c:75: u8 updatePlayer(TPlayer* player){
;	---------------------------------
; Function updatePlayer
; ---------------------------------
_updatePlayer::
;src/entities/entities.c:85: return 1;
	ld	l,#0x01
	ret
;src/entities/entities.c:88: void redibujarPlayer(TPlayer* player){
;	---------------------------------
; Function redibujarPlayer
; ---------------------------------
_redibujarPlayer::
	push	ix
	ld	ix,#0
	add	ix,sp
;src/entities/entities.c:89: borrarPlayer(player);
	ld	l,4 (ix)
	ld	h,5 (ix)
	push	hl
	call	_borrarPlayer
	pop	af
;src/entities/entities.c:90: player->px = player->x;
	ld	c,4 (ix)
	ld	b,5 (ix)
	ld	e, c
	ld	d, b
	inc	de
	inc	de
	ld	a,(bc)
	ld	(de),a
;src/entities/entities.c:91: player->py = player->y;
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
;src/entities/entities.c:92: dibujarPlayer(player);
	push	bc
	call	_dibujarPlayer
	pop	af
	pop	ix
	ret
;src/entities/entities.c:95: void borrarPlayer(TPlayer* player){
;	---------------------------------
; Function borrarPlayer
; ---------------------------------
_borrarPlayer::
	push	ix
	ld	ix,#0
	add	ix,sp
;src/entities/entities.c:96: u8 w = 4 + (player->px & 1);
	ld	e,4 (ix)
	ld	d,5 (ix)
	ld	l, e
	ld	h, d
	inc	hl
	inc	hl
	ld	c,(hl)
	ld	a,c
	and	a, #0x01
	ld	b,a
	inc	b
	inc	b
	inc	b
	inc	b
;src/entities/entities.c:97: u8 h = 7 + (player->py & 3 ? 1 : 0);
	ex	de,hl
	inc	hl
	inc	hl
	inc	hl
	ld	e,(hl)
	ld	a,e
	and	a, #0x03
	jr	Z,00103$
	ld	a,#0x01
	jr	00104$
00103$:
	ld	a,#0x00
00104$:
	add	a, #0x07
	ld	d,a
;src/entities/entities.c:98: cpct_etm_drawTileBox2x4(player->px / 2, player->py /4, w, h, g_map1_W, 0, mapa);
	ld	hl,(_mapa)
	srl	e
	srl	e
	srl	c
	push	hl
	ld	hl,#0x0000
	push	hl
	ld	a,#0x28
	push	af
	inc	sp
	push	de
	inc	sp
	push	bc
	inc	sp
	ld	a,e
	push	af
	inc	sp
	ld	a,c
	push	af
	inc	sp
	call	_cpct_etm_drawTileBox2x4
	pop	ix
	ret
;src/entities/entities.c:101: void dibujarPlayer(TPlayer* player){
;	---------------------------------
; Function dibujarPlayer
; ---------------------------------
_dibujarPlayer::
	push	ix
	ld	ix,#0
	add	ix,sp
;src/entities/entities.c:103: u8* vmem = cpct_getScreenPtr(CPCT_VMEM_START,player->x, player->y);
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
;src/entities/entities.c:105: cpct_drawSpriteMaskedAlignedTable(player->sprite,vmem,G_NAVES_0_W,G_NAVES_0_H, g_tablatrans);
	pop	hl
	ld	bc, #0x0005
	add	hl, bc
	ld	c,(hl)
	inc	hl
	ld	b,(hl)
	ld	hl,#_g_tablatrans
	push	hl
	ld	hl,#0x1008
	push	hl
	push	de
	push	bc
	call	_cpct_drawSpriteMaskedAlignedTable
	pop	ix
	ret
;src/entities/entities.c:109: void drawAll(TPlayer* player){
;	---------------------------------
; Function drawAll
; ---------------------------------
_drawAll::
;src/entities/entities.c:111: redibujarPlayer(player);
	pop	bc
	pop	hl
	push	hl
	push	bc
	push	hl
	call	_redibujarPlayer
	pop	af
	ret
	.area _CODE
	.area _INITIALIZER
	.area _CABS (ABS)
