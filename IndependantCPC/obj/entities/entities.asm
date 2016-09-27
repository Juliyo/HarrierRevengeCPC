;--------------------------------------------------------
; File Created by SDCC : free open source ANSI-C Compiler
; Version 3.5.5 #9498 (Linux)
;--------------------------------------------------------
	.module entities
	.optsdcc -mz80
	
;--------------------------------------------------------
; Public variables in this module
;--------------------------------------------------------
	.globl _flipByMolto
	.globl _cpct_etm_drawTileBox2x4
	.globl _cpct_getScreenPtr
	.globl _cpct_drawSpriteMaskedAlignedTable
	.globl _incializarEntities
	.globl _accion
	.globl _flipSprite
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
;src/entities/entities.c:12: cpctm_createTransparentMaskTable(g_tablatrans,0x0100,M0,0);
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
;src/entities/entities.c:14: void incializarEntities(){
;	---------------------------------
; Function incializarEntities
; ---------------------------------
_incializarEntities::
;src/entities/entities.c:16: }
	ret
;src/entities/entities.c:20: void accion(TPlayer* player, TPlayerStatus action, TPlayerDirection dir){
;	---------------------------------
; Function accion
; ---------------------------------
_accion::
	push	ix
	ld	ix,#0
	add	ix,sp
;src/entities/entities.c:21: switch(action){
	ld	a,6 (ix)
	dec	a
	jp	NZ,00108$
;src/entities/entities.c:23: switch(dir){
	ld	a,#0x03
	sub	a, 7 (ix)
	jp	C,00108$
	ld	e,7 (ix)
	ld	d,#0x00
	ld	hl,#00120$
	add	hl,de
	add	hl,de
;src/entities/entities.c:24: case d_up:
	jp	(hl)
00120$:
	jr	00102$
	jr	00103$
	jr	00105$
	jr	00104$
00102$:
;src/entities/entities.c:25: moverArriba(player);
	ld	l,4 (ix)
	ld	h,5 (ix)
	push	hl
	call	_moverArriba
	pop	af
;src/entities/entities.c:26: flipSprite(player,dir);
	ld	a,7 (ix)
	push	af
	inc	sp
	ld	l,4 (ix)
	ld	h,5 (ix)
	push	hl
	call	_flipSprite
	pop	af
	inc	sp
;src/entities/entities.c:27: break;
	jr	00108$
;src/entities/entities.c:28: case d_down:
00103$:
;src/entities/entities.c:29: moverAbajo(player);
	ld	l,4 (ix)
	ld	h,5 (ix)
	push	hl
	call	_moverAbajo
	pop	af
;src/entities/entities.c:30: flipSprite(player,dir);
	ld	a,7 (ix)
	push	af
	inc	sp
	ld	l,4 (ix)
	ld	h,5 (ix)
	push	hl
	call	_flipSprite
	pop	af
	inc	sp
;src/entities/entities.c:31: break;
	jr	00108$
;src/entities/entities.c:32: case d_left:
00104$:
;src/entities/entities.c:33: moverIzquierda(player);
	ld	l,4 (ix)
	ld	h,5 (ix)
	push	hl
	call	_moverIzquierda
	pop	af
;src/entities/entities.c:34: flipSprite(player,dir);
	ld	a,7 (ix)
	push	af
	inc	sp
	ld	l,4 (ix)
	ld	h,5 (ix)
	push	hl
	call	_flipSprite
	pop	af
	inc	sp
;src/entities/entities.c:35: break;
	jr	00108$
;src/entities/entities.c:36: case d_right:
00105$:
;src/entities/entities.c:37: moverDerecha(player);
	ld	l,4 (ix)
	ld	h,5 (ix)
	push	hl
	call	_moverDerecha
	pop	af
;src/entities/entities.c:38: flipSprite(player,dir);
	ld	a,7 (ix)
	push	af
	inc	sp
	ld	l,4 (ix)
	ld	h,5 (ix)
	push	hl
	call	_flipSprite
	pop	af
	inc	sp
;src/entities/entities.c:43: }
00108$:
	pop	ix
	ret
;src/entities/entities.c:47: void flipSprite(TPlayer* player, TPlayerDirection dir){
;	---------------------------------
; Function flipSprite
; ---------------------------------
_flipSprite::
	push	ix
	ld	ix,#0
	add	ix,sp
	dec	sp
;src/entities/entities.c:48: if(player->curr_dir != dir){
	ld	c,4 (ix)
	ld	b,5 (ix)
	ld	hl,#0x0007
	add	hl,bc
	ex	de,hl
	ld	a,(de)
	ld	-1 (ix),a
	ld	a,6 (ix)
	sub	a, -1 (ix)
	jr	Z,00108$
;src/entities/entities.c:49: switch(dir){
	ld	a,#0x03
	sub	a, 6 (ix)
	jr	C,00105$
;src/entities/entities.c:59: player->sprite = g_naves_3;
	inc	bc
	inc	bc
	inc	bc
	inc	bc
	inc	bc
;src/entities/entities.c:49: switch(dir){
	push	de
	ld	e,6 (ix)
	ld	d,#0x00
	ld	hl,#00119$
	add	hl,de
	add	hl,de
;src/entities/entities.c:50: case d_up:
	pop	de
	jp	(hl)
00119$:
	jr	00101$
	jr	00102$
	jr	00104$
	jr	00103$
00101$:
;src/entities/entities.c:52: flipByMolto();
	push	de
	call	_flipByMolto
	pop	de
;src/entities/entities.c:53: break;
	jr	00105$
;src/entities/entities.c:54: case d_down:
00102$:
;src/entities/entities.c:56: flipByMolto();
	push	de
	call	_flipByMolto
	pop	de
;src/entities/entities.c:57: break;
	jr	00105$
;src/entities/entities.c:58: case d_left:
00103$:
;src/entities/entities.c:59: player->sprite = g_naves_3;
	ld	a,#<(_g_naves_3)
	ld	(bc),a
	inc	bc
	ld	a,#>(_g_naves_3)
	ld	(bc),a
;src/entities/entities.c:60: break;
	jr	00105$
;src/entities/entities.c:61: case d_right:
00104$:
;src/entities/entities.c:62: player->sprite = g_naves_1;
	ld	a,#<(_g_naves_1)
	ld	(bc),a
	inc	bc
	ld	a,#>(_g_naves_1)
	ld	(bc),a
;src/entities/entities.c:64: }
00105$:
;src/entities/entities.c:65: player->curr_dir = dir; 
	ld	a,6 (ix)
	ld	(de),a
00108$:
	inc	sp
	pop	ix
	ret
;src/entities/entities.c:70: void flipByMolto(){
;	---------------------------------
; Function flipByMolto
; ---------------------------------
_flipByMolto::
	push	ix
	ld	ix,#0
	add	ix,sp
	ld	hl,#-22
	add	hl,sp
	ld	sp,hl
;src/entities/entities.c:77: for(i=0;i<FILA/2;i++){
	ld	hl,#0x0000
	add	hl,sp
	ld	-2 (ix),l
	ld	-1 (ix),h
	ld	e,#0x00
;src/entities/entities.c:78: for(j=0;j<COLUMNA;j++){
00109$:
	ld	a,e
	rlca
	rlca
	rlca
	rlca
	and	a,#0xF0
	ld	-5 (ix),a
	ld	a,#0x0F
	sub	a, e
	rlca
	rlca
	rlca
	and	a,#0xF8
	ld	-6 (ix),a
	ld	d,#0x00
00103$:
;src/entities/entities.c:79: aux[j]=g_naves_0[i*FILA+j];
	ld	a,d
	add	a, -2 (ix)
	ld	-4 (ix),a
	ld	a,#0x00
	adc	a, -1 (ix)
	ld	-3 (ix),a
	ld	a,-5 (ix)
	add	a, d
	ld	c,a
	ld	iy,#_g_naves_0
	ld	b,#0x00
	add	iy, bc
	ld	c, 0 (iy)
	ld	l,-4 (ix)
	ld	h,-3 (ix)
	ld	(hl),c
;src/entities/entities.c:80: g_naves_0[i*FILA+j] = g_naves_0[(FILA-i-1)*(COLUMNA)+j];
	ld	a,-6 (ix)
	add	a, d
	add	a,#<(_g_naves_0)
	ld	l,a
	ld	a,#>(_g_naves_0)
	adc	a, #0x00
	ld	h,a
	ld	b,(hl)
	ld	0 (iy), b
;src/entities/entities.c:81: g_naves_0[(FILA-i-1)*(COLUMNA)+j] = aux[j];
	ld	(hl),c
;src/entities/entities.c:78: for(j=0;j<COLUMNA;j++){
	inc	d
	ld	a,d
	sub	a, #0x08
	jr	C,00103$
;src/entities/entities.c:77: for(i=0;i<FILA/2;i++){
	inc	e
	ld	a,e
	sub	a, #0x08
	jr	C,00109$
	ld	sp, ix
	pop	ix
	ret
;src/entities/entities.c:85: void moverArriba(TPlayer* player){
;	---------------------------------
; Function moverArriba
; ---------------------------------
_moverArriba::
	push	ix
	ld	ix,#0
	add	ix,sp
;src/entities/entities.c:86: if (player->y > 0) {
	ld	c,4 (ix)
	ld	b,5 (ix)
	ld	e, c
	ld	d, b
	inc	de
	ld	a,(de)
	or	a, a
	jr	Z,00106$
;src/entities/entities.c:87: if(player->y%2 == 0)
	bit	0, a
	jr	NZ,00102$
;src/entities/entities.c:88: player->y-=2;
	add	a,#0xFE
	ld	(de),a
	jr	00103$
00102$:
;src/entities/entities.c:90: player->y--;
	add	a,#0xFF
	ld	(de),a
00103$:
;src/entities/entities.c:92: player->draw  = SI;
	ld	hl,#0x0004
	add	hl,bc
	ld	(hl),#0x01
00106$:
	pop	ix
	ret
;src/entities/entities.c:99: void moverAbajo(TPlayer* player){
;	---------------------------------
; Function moverAbajo
; ---------------------------------
_moverAbajo::
	push	ix
	ld	ix,#0
	add	ix,sp
	dec	sp
;src/entities/entities.c:100: if (player->y + G_NAVES_0_H < ALTO) {
	ld	c,4 (ix)
	ld	b,5 (ix)
	ld	e, c
	ld	d, b
	inc	de
	ld	a,(de)
	ld	-1 (ix), a
	ld	l, a
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
	jr	NC,00106$
;src/entities/entities.c:101: if(player->y%2 == 0)
	bit	0, -1 (ix)
	jr	NZ,00102$
;src/entities/entities.c:102: player->y+=2;
	ld	a,-1 (ix)
	add	a, #0x02
	ld	(de),a
	jr	00103$
00102$:
;src/entities/entities.c:104: player->y++;
	ld	a,-1 (ix)
	inc	a
	ld	(de),a
00103$:
;src/entities/entities.c:106: player->draw  = SI;
	ld	hl,#0x0004
	add	hl,bc
	ld	(hl),#0x01
00106$:
	inc	sp
	pop	ix
	ret
;src/entities/entities.c:113: void moverIzquierda(TPlayer* player){
;	---------------------------------
; Function moverIzquierda
; ---------------------------------
_moverIzquierda::
;src/entities/entities.c:114: if (player->x > 0) {
	pop	de
	pop	bc
	push	bc
	push	de
	ld	a,(bc)
	or	a, a
	ret	Z
;src/entities/entities.c:115: player->x--;
	add	a,#0xFF
	ld	(bc),a
;src/entities/entities.c:116: player->draw  = SI;
	ld	hl,#0x0004
	add	hl,bc
	ld	(hl),#0x01
	ret
;src/entities/entities.c:122: void moverDerecha(TPlayer* player){
;	---------------------------------
; Function moverDerecha
; ---------------------------------
_moverDerecha::
	push	ix
	ld	ix,#0
	add	ix,sp
;src/entities/entities.c:123: if (player->x + G_NAVES_0_W < ANCHO) {
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
;src/entities/entities.c:124: player->x++;
	inc	e
	ld	a,e
	ld	(bc),a
;src/entities/entities.c:125: player->draw  = SI;
	ld	hl,#0x0004
	add	hl,bc
	ld	(hl),#0x01
00103$:
	pop	ix
	ret
;src/entities/entities.c:133: u8 updatePlayer(TPlayer* player){
;	---------------------------------
; Function updatePlayer
; ---------------------------------
_updatePlayer::
;src/entities/entities.c:135: return 1;
	ld	l,#0x01
	ret
;src/entities/entities.c:138: void redibujarPlayer(TPlayer* player){
;	---------------------------------
; Function redibujarPlayer
; ---------------------------------
_redibujarPlayer::
	push	ix
	ld	ix,#0
	add	ix,sp
;src/entities/entities.c:139: if (player->draw) {
	ld	c,4 (ix)
	ld	b,5 (ix)
	ld	hl,#0x0004
	add	hl,bc
	ex	de,hl
	ld	a,(de)
	or	a, a
	jr	Z,00103$
;src/entities/entities.c:140: borrarPlayer(player);
	push	bc
	push	de
	push	bc
	call	_borrarPlayer
	pop	af
	pop	de
	pop	bc
;src/entities/entities.c:141: player->px = player->x;
	push	bc
	pop	iy
	inc	iy
	inc	iy
	ld	a,(bc)
	ld	0 (iy), a
;src/entities/entities.c:142: player->py = player->y;
	push	bc
	pop	iy
	inc	iy
	inc	iy
	inc	iy
	ld	l, c
	ld	h, b
	inc	hl
	ld	l,(hl)
	ld	0 (iy), l
;src/entities/entities.c:143: dibujarPlayer(player);
	push	de
	push	bc
	call	_dibujarPlayer
	pop	af
	pop	de
;src/entities/entities.c:144: player->draw = NO;
	xor	a, a
	ld	(de),a
00103$:
	pop	ix
	ret
;src/entities/entities.c:148: void borrarPlayer(TPlayer* player){
;	---------------------------------
; Function borrarPlayer
; ---------------------------------
_borrarPlayer::
	push	ix
	ld	ix,#0
	add	ix,sp
;src/entities/entities.c:149: u8 w = 4 + (player->px & 1);
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
;src/entities/entities.c:150: u8 h = 4 + (player->py & 3 ? 1 : 0);
	ex	de,hl
	inc	hl
	inc	hl
	inc	hl
	ld	e,(hl)
	ld	a,e
	and	a, #0x03
	jr	Z,00103$
	ld	d,#0x01
	jr	00104$
00103$:
	ld	d,#0x00
00104$:
	inc	d
	inc	d
	inc	d
	inc	d
;src/entities/entities.c:151: cpct_etm_drawTileBox2x4(player->px / 2, player->py /4, w, h, g_map1_W, ORIGEN_MAPA, mapa);
	ld	hl,(_mapa)
	srl	e
	srl	e
	srl	c
	push	hl
	ld	hl,#0xC000
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
;src/entities/entities.c:154: void dibujarPlayer(TPlayer* player){
;	---------------------------------
; Function dibujarPlayer
; ---------------------------------
_dibujarPlayer::
	push	ix
	ld	ix,#0
	add	ix,sp
;src/entities/entities.c:155: u8* vmem = cpct_getScreenPtr(CPCT_VMEM_START,player->x, player->y);
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
;src/entities/entities.c:156: cpct_drawSpriteMaskedAlignedTable(player->sprite,vmem,G_NAVES_0_W,G_NAVES_0_H, g_tablatrans);
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
;src/entities/entities.c:159: void drawAll(TPlayer* player){
;	---------------------------------
; Function drawAll
; ---------------------------------
_drawAll::
;src/entities/entities.c:161: redibujarPlayer(player);
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
