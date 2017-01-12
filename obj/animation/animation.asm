;--------------------------------------------------------
; File Created by SDCC : free open source ANSI-C Compiler
; Version 3.5.5 #9498 (Linux)
;--------------------------------------------------------
	.module animation
	.optsdcc -mz80
	
;--------------------------------------------------------
; Public variables in this module
;--------------------------------------------------------
	.globl _calculaEntity
	.globl _borrarEntity
	.globl _explosion
	.globl _g_frames
	.globl _getExplosion
	.globl _explosionBala
	.globl _updateXY
	.globl _updateExplosion
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
;src/animation/animation.c:40: TStaticAnimation* getExplosion(){
;	---------------------------------
; Function getExplosion
; ---------------------------------
_getExplosion::
;src/animation/animation.c:41: return &explosion;
	ld	hl,#_explosion
	ret
_g_frames:
	.dw _g_explosion_00
	.dw _g_explosion_01
	.dw _g_explosion_02
	.dw _g_explosion_03
	.dw _g_explosion_04
	.dw _g_explosion_05
	.dw _g_explosion_06
	.dw _g_explosion_07
	.dw _g_explosion_08
	.dw _g_explosion_09
	.dw _g_explosion_10
	.dw _g_explosion_11
	.db 0x00
	.db 0x00
	.db 0x00
	.db 0x00
_explosion:
	.db #0x00	; 0
	.dw #0x0000
	.dw #0x0000
	.dw #0x0000
	.dw #0x0000
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.dw #0x0000
	.dw #0x0000
	.dw #0x0000
	.dw #0x0000
	.db #0x04	; 4
	.db #0x08	; 8
	.db #0x00	; 0
	.db #0x00	; 0
	.byte #0x00
	.byte #0x00
	.byte #0x00
	.byte #0x00
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.dw #0x0000
;src/animation/animation.c:46: void explosionBala(TBullet* bullet){
;	---------------------------------
; Function explosionBala
; ---------------------------------
_explosionBala::
	push	ix
	ld	ix,#0
	add	ix,sp
	push	af
;src/animation/animation.c:48: if(bullet->state == es_disparado){
	ld	c,4 (ix)
	ld	b,5 (ix)
	ld	hl,#0x0002
	add	hl,bc
	ex	(sp), hl
	pop	hl
	push	hl
	ld	a,(hl)
	sub	a, #0x02
	jr	NZ,00103$
;src/animation/animation.c:50: exp = &explosion;
;src/animation/animation.c:51: exp->n_frames = 0;
	ld	hl,#_explosion
	ld	(hl),#0x00
;src/animation/animation.c:52: exp->ent.draw = SI;
	ld	hl,#(_explosion + 0x000b)
	ld	(hl),#0x01
;src/animation/animation.c:54: updateXY(&exp->ent, bullet->ent.x, bullet->ent.y);
	push	bc
	pop	iy
	ld	l, c
	ld	h, b
	ld	de, #0x0005
	add	hl, de
	ld	e,(hl)
	inc	hl
	ld	d,(hl)
	ld	l,3 (iy)
	ld	h,4 (iy)
	push	bc
	push	de
	push	hl
	ld	hl,#(_explosion + 0x0001)
	push	hl
	call	_updateXY
	ld	hl,#6
	add	hl,sp
	ld	sp,hl
	pop	bc
;src/animation/animation.c:56: exp->ent.sprites[0] = g_frames[0];
	ld	de, (#_g_frames + 0)
	ld	((_explosion + 0x000c)), de
;src/animation/animation.c:57: exp->ent.curr_dir = 0;
	ld	hl,#(_explosion + 0x0016)
	ld	(hl),#0x00
;src/animation/animation.c:58: exp->ent.cuadrante = mapaActual;
	ld	hl,#(_explosion + 0x001d)
	ld	a,(#_mapaActual + 0)
	ld	(hl),a
;src/animation/animation.c:59: bullet->ent.draw = NO;
	ld	hl,#0x000D
	add	hl,bc
	ld	(hl),#0x00
;src/animation/animation.c:60: bullet->ent.vivo = NO;
	ld	hl,#0x001E
	add	hl,bc
	ld	(hl),#0x00
;src/animation/animation.c:61: bullet->state = es_explotando;	//Cambiamos a la bala estado explotando
	pop	hl
	push	hl
	ld	(hl),#0x03
00103$:
	ld	sp, ix
	pop	ix
	ret
;src/animation/animation.c:67: void updateXY(TEntity* ent1, i16 x, i16 y){
;	---------------------------------
; Function updateXY
; ---------------------------------
_updateXY::
;src/animation/animation.c:68: ent1->x = x;
	pop	de
	pop	bc
	push	bc
	push	de
	ld	l, c
	ld	h, b
	ld	iy,#4
	add	iy,sp
	ld	a,0 (iy)
	ld	(hl),a
	inc	hl
	ld	a,1 (iy)
	ld	(hl),a
;src/animation/animation.c:69: ent1->y = y;
	ld	e, c
	ld	d, b
	inc	de
	inc	de
	ld	iy,#6
	add	iy,sp
	ld	a,0 (iy)
	ld	(de),a
	inc	de
	ld	a,1 (iy)
	ld	(de),a
;src/animation/animation.c:70: ent1->px = x;
	ld	hl,#0x0004
	add	hl,bc
	ld	iy,#4
	add	iy,sp
	ld	a,0 (iy)
	ld	(hl),a
	inc	hl
	ld	a,1 (iy)
	ld	(hl),a
;src/animation/animation.c:71: ent1->py = y;
	ld	hl,#0x0006
	add	hl,bc
	ld	iy,#6
	add	iy,sp
	ld	a,0 (iy)
	ld	(hl),a
	inc	hl
	ld	a,1 (iy)
	ld	(hl),a
	ret
;src/animation/animation.c:74: void updateExplosion(TBullet* bullet){
;	---------------------------------
; Function updateExplosion
; ---------------------------------
_updateExplosion::
	push	ix
	ld	ix,#0
	add	ix,sp
;src/animation/animation.c:76: if(bullet->state == es_explotando){	//Solo se updatea si está en estado de explosión	
	ld	c,4 (ix)
	ld	b,5 (ix)
	inc	bc
	inc	bc
	ld	a,(bc)
	sub	a, #0x03
	jr	NZ,00105$
;src/animation/animation.c:77: exp = &explosion;
;src/animation/animation.c:78: exp->ent.draw = SI;
	ld	hl,#(_explosion + 0x000b)
	ld	(hl),#0x01
;src/animation/animation.c:79: exp->ent.cuadrante = mapaActual;
	ld	hl,#(_explosion + 0x001d)
	ld	a,(#_mapaActual + 0)
	ld	(hl),a
;src/animation/animation.c:81: exp->ent.sprites[0] = g_frames[exp->n_frames];
	ld	de,#_g_frames+0
	ld	hl, #_explosion + 0
	ld	l,(hl)
	ld	h,#0x00
	add	hl, hl
	add	hl,de
	ld	e,(hl)
	inc	hl
	ld	d,(hl)
	ld	((_explosion + 0x000c)), de
;src/animation/animation.c:82: exp->n_frames = exp->n_frames + 1;
	ld	a, (#_explosion + 0)
	inc	a
	ld	(#_explosion),a
;src/animation/animation.c:83: if(exp->n_frames == EXPLOSION_FRAMES - 1){
	sub	a, #0x0D
	jr	NZ,00105$
;src/animation/animation.c:84: calculaEntity(&exp->ent,SI);
	push	bc
	ld	a,#0x01
	push	af
	inc	sp
	ld	hl,#(_explosion + 0x0001)
	push	hl
	call	_calculaEntity
	inc	sp
	ld	hl,#(_explosion + 0x0001)
	ex	(sp),hl
	call	_borrarEntity
	pop	af
	pop	bc
;src/animation/animation.c:86: exp->ent.draw = NO;
	ld	hl,#(_explosion + 0x000b)
	ld	(hl),#0x00
;src/animation/animation.c:87: bullet->state = es_static;
	xor	a, a
	ld	(bc),a
;src/animation/animation.c:88: exp->n_frames = 0;
	ld	hl,#_explosion
	ld	(hl),#0x00
00105$:
	pop	ix
	ret
	.area _CODE
	.area _INITIALIZER
	.area _CABS (ABS)
