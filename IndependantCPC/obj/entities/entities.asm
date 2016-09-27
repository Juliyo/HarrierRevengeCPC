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
	.globl _enemigos
	.globl _incializarEntities
	.globl _accion
	.globl _flipSprite
	.globl _moverArriba
	.globl _moverAbajo
	.globl _moverIzquierda
	.globl _moverDerecha
	.globl _updatePlayer
	.globl _updateEntities
	.globl _redibujarEntity
	.globl _borrarEntity
	.globl _dibujarEntity
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
;src/entities/entities.c:14: cpctm_createTransparentMaskTable(g_tablatrans,0x0100,M0,0);
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
;src/entities/entities.c:33: void incializarEntities(){
;	---------------------------------
; Function incializarEntities
; ---------------------------------
_incializarEntities::
;src/entities/entities.c:35: }
	ret
_enemigos:
	.db #0x32	; 50	'2'
	.db #0x9D	; 157
	.db #0x14	; 20
	.db #0x9D	; 157
	.db #0x01	; 1
	.dw _g_naves_0
	.db #0x00	; 0
	.db #0x14	; 20
	.db #0x32	; 50	'2'
	.db #0x14	; 20
	.db #0x32	; 50	'2'
	.db #0x01	; 1
	.dw _g_naves_0
	.db #0x00	; 0
;src/entities/entities.c:39: void accion(TEntity* ent, TPlayerStatus action, TPlayerDirection dir){
;	---------------------------------
; Function accion
; ---------------------------------
_accion::
	push	ix
	ld	ix,#0
	add	ix,sp
;src/entities/entities.c:40: switch(action){
	ld	a,6 (ix)
	dec	a
	jp	NZ,00108$
;src/entities/entities.c:42: switch(dir){
	ld	a,#0x03
	sub	a, 7 (ix)
	jp	C,00108$
	ld	e,7 (ix)
	ld	d,#0x00
	ld	hl,#00120$
	add	hl,de
	add	hl,de
;src/entities/entities.c:43: case d_up:
	jp	(hl)
00120$:
	jr	00102$
	jr	00103$
	jr	00105$
	jr	00104$
00102$:
;src/entities/entities.c:44: moverArriba(ent);
	ld	l,4 (ix)
	ld	h,5 (ix)
	push	hl
	call	_moverArriba
	pop	af
;src/entities/entities.c:45: flipSprite(ent,dir);
	ld	a,7 (ix)
	push	af
	inc	sp
	ld	l,4 (ix)
	ld	h,5 (ix)
	push	hl
	call	_flipSprite
	pop	af
	inc	sp
;src/entities/entities.c:46: break;
	jr	00108$
;src/entities/entities.c:47: case d_down:
00103$:
;src/entities/entities.c:48: moverAbajo(ent);
	ld	l,4 (ix)
	ld	h,5 (ix)
	push	hl
	call	_moverAbajo
	pop	af
;src/entities/entities.c:49: flipSprite(ent,dir);
	ld	a,7 (ix)
	push	af
	inc	sp
	ld	l,4 (ix)
	ld	h,5 (ix)
	push	hl
	call	_flipSprite
	pop	af
	inc	sp
;src/entities/entities.c:50: break;
	jr	00108$
;src/entities/entities.c:51: case d_left:
00104$:
;src/entities/entities.c:52: moverIzquierda(ent);
	ld	l,4 (ix)
	ld	h,5 (ix)
	push	hl
	call	_moverIzquierda
	pop	af
;src/entities/entities.c:53: flipSprite(ent,dir);
	ld	a,7 (ix)
	push	af
	inc	sp
	ld	l,4 (ix)
	ld	h,5 (ix)
	push	hl
	call	_flipSprite
	pop	af
	inc	sp
;src/entities/entities.c:54: break;
	jr	00108$
;src/entities/entities.c:55: case d_right:
00105$:
;src/entities/entities.c:56: moverDerecha(ent);
	ld	l,4 (ix)
	ld	h,5 (ix)
	push	hl
	call	_moverDerecha
	pop	af
;src/entities/entities.c:57: flipSprite(ent,dir);
	ld	a,7 (ix)
	push	af
	inc	sp
	ld	l,4 (ix)
	ld	h,5 (ix)
	push	hl
	call	_flipSprite
	pop	af
	inc	sp
;src/entities/entities.c:62: }
00108$:
	pop	ix
	ret
;src/entities/entities.c:66: void flipSprite(TEntity* ent, TPlayerDirection dir){
;	---------------------------------
; Function flipSprite
; ---------------------------------
_flipSprite::
	push	ix
	ld	ix,#0
	add	ix,sp
	dec	sp
;src/entities/entities.c:67: if(ent->curr_dir != dir){
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
;src/entities/entities.c:68: switch(dir){
	ld	a,#0x03
	sub	a, 6 (ix)
	jr	C,00105$
;src/entities/entities.c:70: ent->sprite = g_naves_0;
	inc	bc
	inc	bc
	inc	bc
	inc	bc
	inc	bc
;src/entities/entities.c:68: switch(dir){
	push	de
	ld	e,6 (ix)
	ld	d,#0x00
	ld	hl,#00119$
	add	hl,de
	add	hl,de
;src/entities/entities.c:69: case d_up:
	pop	de
	jp	(hl)
00119$:
	jr	00101$
	jr	00102$
	jr	00104$
	jr	00103$
00101$:
;src/entities/entities.c:70: ent->sprite = g_naves_0;
	ld	a,#<(_g_naves_0)
	ld	(bc),a
	inc	bc
	ld	a,#>(_g_naves_0)
	ld	(bc),a
;src/entities/entities.c:72: break;
	jr	00105$
;src/entities/entities.c:73: case d_down:
00102$:
;src/entities/entities.c:74: ent->sprite = g_naves_2;
	ld	a,#<(_g_naves_2)
	ld	(bc),a
	inc	bc
	ld	a,#>(_g_naves_2)
	ld	(bc),a
;src/entities/entities.c:76: break;
	jr	00105$
;src/entities/entities.c:77: case d_left:
00103$:
;src/entities/entities.c:78: ent->sprite = g_naves_3;
	ld	a,#<(_g_naves_3)
	ld	(bc),a
	inc	bc
	ld	a,#>(_g_naves_3)
	ld	(bc),a
;src/entities/entities.c:79: break;
	jr	00105$
;src/entities/entities.c:80: case d_right:
00104$:
;src/entities/entities.c:81: ent->sprite = g_naves_1;
	ld	a,#<(_g_naves_1)
	ld	(bc),a
	inc	bc
	ld	a,#>(_g_naves_1)
	ld	(bc),a
;src/entities/entities.c:83: }
00105$:
;src/entities/entities.c:84: ent->curr_dir = dir; 
	ld	a,6 (ix)
	ld	(de),a
00108$:
	inc	sp
	pop	ix
	ret
;src/entities/entities.c:104: void moverArriba(TEntity* ent){
;	---------------------------------
; Function moverArriba
; ---------------------------------
_moverArriba::
	push	ix
	ld	ix,#0
	add	ix,sp
;src/entities/entities.c:105: if (ent->y > 0) {
	ld	c,4 (ix)
	ld	b,5 (ix)
	ld	e, c
	ld	d, b
	inc	de
	ld	a,(de)
	or	a, a
	jr	Z,00106$
;src/entities/entities.c:106: if(ent->y%2 == 0)
	bit	0, a
	jr	NZ,00102$
;src/entities/entities.c:107: ent->y-=2;
	add	a,#0xFE
	ld	(de),a
	jr	00103$
00102$:
;src/entities/entities.c:109: ent->y--;
	add	a,#0xFF
	ld	(de),a
00103$:
;src/entities/entities.c:111: ent->draw  = SI;
	ld	hl,#0x0004
	add	hl,bc
	ld	(hl),#0x01
00106$:
	pop	ix
	ret
;src/entities/entities.c:118: void moverAbajo(TEntity* ent){
;	---------------------------------
; Function moverAbajo
; ---------------------------------
_moverAbajo::
	push	ix
	ld	ix,#0
	add	ix,sp
	dec	sp
;src/entities/entities.c:119: if (ent->y + G_NAVES_0_H < ALTO) {
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
;src/entities/entities.c:120: if(ent->y%2 == 0)
	bit	0, -1 (ix)
	jr	NZ,00102$
;src/entities/entities.c:121: ent->y+=2;
	ld	a,-1 (ix)
	add	a, #0x02
	ld	(de),a
	jr	00103$
00102$:
;src/entities/entities.c:123: ent->y++;
	ld	a,-1 (ix)
	inc	a
	ld	(de),a
00103$:
;src/entities/entities.c:125: ent->draw  = SI;
	ld	hl,#0x0004
	add	hl,bc
	ld	(hl),#0x01
00106$:
	inc	sp
	pop	ix
	ret
;src/entities/entities.c:132: void moverIzquierda(TEntity* ent){
;	---------------------------------
; Function moverIzquierda
; ---------------------------------
_moverIzquierda::
;src/entities/entities.c:133: if (ent->x > 0) {
	pop	de
	pop	bc
	push	bc
	push	de
	ld	a,(bc)
	or	a, a
	ret	Z
;src/entities/entities.c:134: ent->x--;
	add	a,#0xFF
	ld	(bc),a
;src/entities/entities.c:135: ent->draw  = SI;
	ld	hl,#0x0004
	add	hl,bc
	ld	(hl),#0x01
	ret
;src/entities/entities.c:141: void moverDerecha(TEntity* ent){
;	---------------------------------
; Function moverDerecha
; ---------------------------------
_moverDerecha::
	push	ix
	ld	ix,#0
	add	ix,sp
;src/entities/entities.c:142: if (ent->x + G_NAVES_0_W < ANCHO) {
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
;src/entities/entities.c:143: ent->x++;
	inc	e
	ld	a,e
	ld	(bc),a
;src/entities/entities.c:144: ent->draw  = SI;
	ld	hl,#0x0004
	add	hl,bc
	ld	(hl),#0x01
00103$:
	pop	ix
	ret
;src/entities/entities.c:152: u8 updatePlayer(TEntity* player){
;	---------------------------------
; Function updatePlayer
; ---------------------------------
_updatePlayer::
;src/entities/entities.c:154: return 1;
	ld	l,#0x01
	ret
;src/entities/entities.c:157: void updateEntities(){
;	---------------------------------
; Function updateEntities
; ---------------------------------
_updateEntities::
	ret
;src/entities/entities.c:169: void redibujarEntity(TEntity* ent, u8 w, u8 h){
;	---------------------------------
; Function redibujarEntity
; ---------------------------------
_redibujarEntity::
	push	ix
	ld	ix,#0
	add	ix,sp
;src/entities/entities.c:170: if (ent->draw) {
	ld	c,4 (ix)
	ld	b,5 (ix)
	ld	hl,#0x0004
	add	hl,bc
	ex	de,hl
	ld	a,(de)
	or	a, a
	jr	Z,00103$
;src/entities/entities.c:171: borrarEntity(ent);
	push	bc
	push	de
	push	bc
	call	_borrarEntity
	pop	af
	pop	de
	pop	bc
;src/entities/entities.c:172: ent->px = ent->x;
	push	bc
	pop	iy
	inc	iy
	inc	iy
	ld	a,(bc)
	ld	0 (iy), a
;src/entities/entities.c:173: ent->py = ent->y;
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
;src/entities/entities.c:174: dibujarEntity(ent, w, h);
	push	de
	ld	h,7 (ix)
	ld	l,6 (ix)
	push	hl
	push	bc
	call	_dibujarEntity
	pop	af
	pop	af
	pop	de
;src/entities/entities.c:175: ent->draw = NO;
	xor	a, a
	ld	(de),a
00103$:
	pop	ix
	ret
;src/entities/entities.c:179: void borrarEntity(TEntity* ent){
;	---------------------------------
; Function borrarEntity
; ---------------------------------
_borrarEntity::
	push	ix
	ld	ix,#0
	add	ix,sp
;src/entities/entities.c:180: u8 w = 4 + (ent->px & 1);
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
;src/entities/entities.c:181: u8 h = 4 + (ent->py & 3 ? 1 : 0);
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
;src/entities/entities.c:182: cpct_etm_drawTileBox2x4(ent->px / 2, ent->py /4, w, h, g_map1_W, ORIGEN_MAPA, mapa);
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
;src/entities/entities.c:185: void dibujarEntity(TEntity* ent, u8 w, u8 h){
;	---------------------------------
; Function dibujarEntity
; ---------------------------------
_dibujarEntity::
	push	ix
	ld	ix,#0
	add	ix,sp
;src/entities/entities.c:186: u8* vmem = cpct_getScreenPtr(CPCT_VMEM_START,ent->x, ent->y);
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
;src/entities/entities.c:187: cpct_drawSpriteMaskedAlignedTable(ent->sprite,vmem,w,h, g_tablatrans);
	pop	hl
	ld	bc, #0x0005
	add	hl, bc
	ld	c,(hl)
	inc	hl
	ld	b,(hl)
	ld	hl,#_g_tablatrans
	push	hl
	ld	h,7 (ix)
	ld	l,6 (ix)
	push	hl
	push	de
	push	bc
	call	_cpct_drawSpriteMaskedAlignedTable
	pop	ix
	ret
;src/entities/entities.c:190: void drawAll(TEntity* player){
;	---------------------------------
; Function drawAll
; ---------------------------------
_drawAll::
	push	ix
	ld	ix,#0
	add	ix,sp
;src/entities/entities.c:193: redibujarEntity(player, G_NAVES_0_W, G_NAVES_0_H);
	ld	hl,#0x1008
	push	hl
	ld	l,4 (ix)
	ld	h,5 (ix)
	push	hl
	call	_redibujarEntity
	pop	af
	pop	af
;src/entities/entities.c:196: for(i = 0; i < NUM_ENEMIGOS; i++){
	ld	c,#0x00
00102$:
;src/entities/entities.c:197: redibujarEntity(&enemigos[i], G_NAVES_0_W, G_NAVES_0_H);
	ld	l,c
	ld	h,#0x00
	add	hl, hl
	add	hl, hl
	add	hl, hl
	ld	de,#_enemigos
	add	hl,de
	ex	de,hl
	push	bc
	ld	hl,#0x1008
	push	hl
	push	de
	call	_redibujarEntity
	pop	af
	pop	af
	pop	bc
;src/entities/entities.c:196: for(i = 0; i < NUM_ENEMIGOS; i++){
	inc	c
	ld	a,c
	sub	a, #0x02
	jr	C,00102$
	pop	ix
	ret
	.area _CODE
	.area _INITIALIZER
	.area _CABS (ABS)
