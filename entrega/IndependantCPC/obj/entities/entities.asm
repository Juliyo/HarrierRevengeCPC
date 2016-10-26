;--------------------------------------------------------
; File Created by SDCC : free open source ANSI-C Compiler
; Version 3.5.5 #9498 (Linux)
;--------------------------------------------------------
	.module entities
	.optsdcc -mz80
	
;--------------------------------------------------------
; Public variables in this module
;--------------------------------------------------------
	.globl _calculaDireccion
	.globl _updateEntities
	.globl _getExplosion
	.globl _updateExplosion
	.globl _inicializarWaveManager
	.globl _resetearTimepoEnMapa
	.globl _updateTiempoEnMapa
	.globl _dibujarMapa
	.globl _cpct_etm_drawTileBox2x4
	.globl _cpct_getScreenPtr
	.globl _cpct_drawSpriteMaskedAlignedTable
	.globl _bulletsTurno
	.globl _turno
	.globl _count1
	.globl _puntos
	.globl _bases
	.globl _enemigos
	.globl _incializarEntities
	.globl _accion
	.globl _flipSprite
	.globl _moverArriba
	.globl _moverAbajo
	.globl _moverIzquierda
	.globl _moverDerecha
	.globl _updatePlayer
	.globl _corregirPosicion
	.globl _updateX
	.globl _updateY
	.globl _disparar
	.globl _updateBullet
	.globl _playerHerido
	.globl _contarEnemigos
	.globl _updateIA
	.globl _comprobarEjeX
	.globl _comprobarEjeY
	.globl _moverHaciaPuntoDeControl
	.globl _abs
	.globl _updateIAState
	.globl _comprobarSiDisparo
	.globl _redibujarEntity
	.globl _borrarEntity
	.globl _dibujarEntity
	.globl _calculaEntity
	.globl _calculaAllEntities
	.globl _drawAll
	.globl _getEnemies
	.globl _getBases
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
_count1::
	.ds 1
_turno::
	.ds 1
_bulletsTurno::
	.ds 1
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
;src/entities/entities.c:30: cpctm_createTransparentMaskTable(g_tablatrans,0x0100,M0,0);
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
;src/entities/entities.c:433: void incializarEntities(TPlayer* p){
;	---------------------------------
; Function incializarEntities
; ---------------------------------
_incializarEntities::
	push	ix
	ld	ix,#0
	add	ix,sp
	push	af
	push	af
	dec	sp
;src/entities/entities.c:434: TBase* bases = getBases();
	call	_getBases
	ld	-2 (ix),l
	ld	-1 (ix),h
;src/entities/entities.c:435: TEnemy* enes = getEnemies();
	call	_getEnemies
	ld	-4 (ix),l
	ld	-3 (ix),h
;src/entities/entities.c:438: p->vida = 3;
	ld	c,4 (ix)
	ld	b,5 (ix)
	ld	hl,#0x0049
	add	hl,bc
	ld	(hl),#0x03
;src/entities/entities.c:439: p->pvida = 3;
	ld	hl,#0x004A
	add	hl,bc
	ld	(hl),#0x03
;src/entities/entities.c:440: p->ent.x = px_spawn;
	ld	hl,#0x0026
	add	hl,bc
	ld	(hl),#0x0A
	inc	hl
	ld	(hl),#0x00
;src/entities/entities.c:441: p->ent.y = py_spawn;
	ld	hl,#0x0028
	add	hl,bc
	ld	(hl),#0xAA
	inc	hl
	ld	(hl),#0x00
;src/entities/entities.c:442: p->ent.draw = SI;
	ld	hl,#0x0030
	add	hl,bc
	ld	(hl),#0x01
;src/entities/entities.c:443: p->puntuacion = 0;
	ld	hl,#0x004B
	add	hl,bc
	xor	a, a
	ld	(hl), a
	inc	hl
	ld	(hl), a
;src/entities/entities.c:444: p->puntuacionPrev = 0;
	ld	hl,#0x004D
	add	hl,bc
	xor	a, a
	ld	(hl), a
	inc	hl
	ld	(hl), a
;src/entities/entities.c:446: for(i = 0; i < NUM_BASES; ++i){
	ld	c,#0x00
	ld	de,#0x0000
00105$:
;src/entities/entities.c:447: bases[i].whom = 1;
	ld	l,-2 (ix)
	ld	h,-1 (ix)
	add	hl,de
	ld	(hl),#0x01
;src/entities/entities.c:448: bases[i].ent.sprites[0] = NULL;
	ld	iy,#0x000F
	push	bc
	ld	c, l
	ld	b, h
	add	iy, bc
	pop	bc
	ld	0 (iy),#0x00
	ld	1 (iy),#0x00
;src/entities/entities.c:449: bases[i].cycles = 0;
	inc	hl
	inc	hl
	inc	hl
	ld	b,h
	ld	h, b
	ld	(hl),#0x00
;src/entities/entities.c:446: for(i = 0; i < NUM_BASES; ++i){
	ld	hl,#0x0027
	add	hl,de
	ex	de,hl
	inc	c
	ld	a,c
	sub	a, #0x06
	jr	C,00105$
;src/entities/entities.c:451: for(i = 0; i< NUM_ENEMIGOS; ++i){
	ld	-5 (ix),#0x00
	ld	bc,#0x0000
00107$:
;src/entities/entities.c:452: if(enes[i].ent.cuadrante == 0){
	ld	a,-4 (ix)
	add	a, c
	ld	e,a
	ld	a,-3 (ix)
	adc	a, b
	ld	d,a
	push	de
	pop	iy
	ld	a,66 (iy)
	or	a, a
	jr	NZ,00108$
;src/entities/entities.c:453: enes[i].ent.vivo = 0;
	ld	hl,#0x0041
	add	hl,de
	ld	(hl),#0x00
;src/entities/entities.c:454: enes[i].bullet.ent.vivo = 0;
	ld	hl,#0x001E
	add	hl,de
	ld	(hl),#0x00
;src/entities/entities.c:455: enes[i].ent.draw = NO;
	ld	hl,#0x0030
	add	hl,de
	ld	(hl),#0x00
00108$:
;src/entities/entities.c:451: for(i = 0; i< NUM_ENEMIGOS; ++i){
	ld	hl,#0x004E
	add	hl,bc
	ld	c,l
	ld	b,h
	inc	-5 (ix)
	ld	a,-5 (ix)
	sub	a, #0x03
	jr	C,00107$
;src/entities/entities.c:458: wshot_cycles = 30;
	ld	hl,#_wshot_cycles + 0
	ld	(hl), #0x1E
;src/entities/entities.c:459: basesCapturadas = 0;
	ld	hl,#_basesCapturadas + 0
	ld	(hl), #0x00
;src/entities/entities.c:460: prev_basesCapturadas = 0;
	ld	hl,#_prev_basesCapturadas + 0
	ld	(hl), #0x00
;src/entities/entities.c:462: inicializarWaveManager();
	call	_inicializarWaveManager
	ld	sp, ix
	pop	ix
	ret
_enemigos:
	.db #0x00	; 0
	.db #0x01	; 1
	.db #0x00	; 0
	.dw #0x0000
	.dw #0x0000
	.dw #0x0000
	.dw #0x0000
	.db #0x02	; 2
	.db #0x04	; 4
	.db #0x00	; 0
	.dw _g_bala_enemiga
	.dw _g_bala_enemiga
	.dw _g_bala_enemiga
	.dw _g_bala_enemiga
	.db #0x02	; 2
	.db #0x04	; 4
	.db #0x00	; 0
	.db #0x02	; 2
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x02	; 2
	.db #0x04	; 4
	.db #0x00	; 0
	.db #0x02	; 2
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.dw #0x0000
	.dw #0x0032
	.dw #0x009D
	.dw #0x0032
	.dw #0x009D
	.db #0x01	; 1
	.db #0x02	; 2
	.db #0x01	; 1
	.dw _g_naveEnemiga1_0
	.dw _g_naveEnemiga1_1
	.dw _g_naveEnemiga1_2
	.dw _g_naveEnemiga1_3
	.db #0x04	; 4
	.db #0x08	; 8
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x32	; 50	'2'
	.db #0x9D	; 157
	.db #0x04	; 4
	.db #0x08	; 8
	.db #0x01	; 1
	.db #0x02	; 2
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.dw #0x0000
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x01	; 1
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x01	; 1
	.db #0x00	; 0
	.dw #0x0000
	.dw #0x0000
	.dw #0x0000
	.dw #0x0000
	.db #0x02	; 2
	.db #0x04	; 4
	.db #0x00	; 0
	.dw _g_bala_enemiga
	.dw _g_bala_enemiga
	.dw _g_bala_enemiga
	.dw _g_bala_enemiga
	.db #0x02	; 2
	.db #0x04	; 4
	.db #0x00	; 0
	.db #0x02	; 2
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x02	; 2
	.db #0x04	; 4
	.db #0x00	; 0
	.db #0x04	; 4
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.dw #0x0000
	.dw #0x0014
	.dw #0x0032
	.dw #0x0014
	.dw #0x0032
	.db #0x01	; 1
	.db #0x02	; 2
	.db #0x01	; 1
	.dw _g_naveEnemiga2_0
	.dw _g_naveEnemiga2_1
	.dw _g_naveEnemiga2_2
	.dw _g_naveEnemiga2_3
	.db #0x04	; 4
	.db #0x08	; 8
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x14	; 20
	.db #0x32	; 50	'2'
	.db #0x04	; 4
	.db #0x08	; 8
	.db #0x01	; 1
	.db #0x04	; 4
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.dw #0x0000
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x01	; 1
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x01	; 1
	.db #0x00	; 0
	.dw #0x0000
	.dw #0x0000
	.dw #0x0000
	.dw #0x0000
	.db #0x02	; 2
	.db #0x04	; 4
	.db #0x00	; 0
	.dw _g_bala_enemiga
	.dw _g_bala_enemiga
	.dw _g_bala_enemiga
	.dw _g_bala_enemiga
	.db #0x02	; 2
	.db #0x04	; 4
	.db #0x00	; 0
	.db #0x02	; 2
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x02	; 2
	.db #0x04	; 4
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.dw #0x0000
	.dw #0x0023
	.dw #0x0078
	.dw #0x0023
	.dw #0x0078
	.db #0x01	; 1
	.db #0x02	; 2
	.db #0x01	; 1
	.dw _g_naveEnemiga3_0
	.dw _g_naveEnemiga3_1
	.dw _g_naveEnemiga3_2
	.dw _g_naveEnemiga3_3
	.db #0x04	; 4
	.db #0x08	; 8
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x23	; 35
	.db #0x78	; 120	'x'
	.db #0x04	; 4
	.db #0x08	; 8
	.db #0x01	; 1
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.dw #0x0000
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x01	; 1
	.db #0x00	; 0
	.db #0x00	; 0
_bases:
	.db #0x01	; 1
	.db #0x64	; 100	'd'
	.db #0xC8	; 200
	.db #0x00	; 0
	.dw #0x0030
	.dw #0x009C
	.dw #0x0030
	.dw #0x009C
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x01	; 1
	.dw #0x0000
	.dw #0x0000
	.dw #0x0000
	.dw #0x0000
	.db #0x08	; 8
	.db #0x14	; 20
	.db #0x00	; 0
	.db #0x03	; 3
	.db #0x30	; 48	'0'
	.db #0x9C	; 156
	.db #0x08	; 8
	.db #0x14	; 20
	.db #0x01	; 1
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.dw #0x0000
	.db #0x01	; 1
	.db #0x64	; 100	'd'
	.db #0xE8	; 232
	.db #0x00	; 0
	.dw #0x002E
	.dw #0x0064
	.dw #0x002E
	.dw #0x0064
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x01	; 1
	.dw #0x0000
	.dw #0x0000
	.dw #0x0000
	.dw #0x0000
	.db #0x08	; 8
	.db #0x14	; 20
	.db #0x00	; 0
	.db #0x03	; 3
	.db #0x2E	; 46
	.db #0x64	; 100	'd'
	.db #0x08	; 8
	.db #0x14	; 20
	.db #0x01	; 1
	.db #0x01	; 1
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.dw #0x0000
	.db #0x01	; 1
	.db #0x64	; 100	'd'
	.db #0xE8	; 232
	.db #0x00	; 0
	.dw #0x0004
	.dw #0x0070
	.dw #0x0004
	.dw #0x0070
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x01	; 1
	.dw #0x0000
	.dw #0x0000
	.dw #0x0000
	.dw #0x0000
	.db #0x08	; 8
	.db #0x14	; 20
	.db #0x00	; 0
	.db #0x03	; 3
	.db #0x04	; 4
	.db #0x70	; 112	'p'
	.db #0x08	; 8
	.db #0x14	; 20
	.db #0x01	; 1
	.db #0x02	; 2
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.dw #0x0000
	.db #0x01	; 1
	.db #0x64	; 100	'd'
	.db #0xE8	; 232
	.db #0x00	; 0
	.dw #0x0044
	.dw #0x0088
	.dw #0x0088
	.dw #0x0088
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x01	; 1
	.dw #0x0000
	.dw #0x0000
	.dw #0x0000
	.dw #0x0000
	.db #0x08	; 8
	.db #0x14	; 20
	.db #0x00	; 0
	.db #0x03	; 3
	.db #0x44	; 68	'D'
	.db #0x88	; 136
	.db #0x08	; 8
	.db #0x14	; 20
	.db #0x01	; 1
	.db #0x03	; 3
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.dw #0x0000
	.db #0x01	; 1
	.db #0x64	; 100	'd'
	.db #0xE8	; 232
	.db #0x00	; 0
	.dw #0x0004
	.dw #0x0044
	.dw #0x0004
	.dw #0x0044
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x01	; 1
	.dw #0x0000
	.dw #0x0000
	.dw #0x0000
	.dw #0x0000
	.db #0x08	; 8
	.db #0x14	; 20
	.db #0x00	; 0
	.db #0x03	; 3
	.db #0x04	; 4
	.db #0x44	; 68	'D'
	.db #0x08	; 8
	.db #0x14	; 20
	.db #0x01	; 1
	.db #0x04	; 4
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.dw #0x0000
	.db #0x01	; 1
	.db #0x64	; 100	'd'
	.db #0xE8	; 232
	.db #0x00	; 0
	.dw #0x0044
	.dw #0x0068
	.dw #0x0044
	.dw #0x0068
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x01	; 1
	.dw #0x0000
	.dw #0x0000
	.dw #0x0000
	.dw #0x0000
	.db #0x08	; 8
	.db #0x14	; 20
	.db #0x00	; 0
	.db #0x03	; 3
	.db #0x44	; 68	'D'
	.db #0x68	; 104	'h'
	.db #0x08	; 8
	.db #0x14	; 20
	.db #0x01	; 1
	.db #0x05	; 5
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.dw #0x0000
_puntos:
	.db #0x28	; 40
	.db #0x3C	; 60
	.db #0x28	; 40
	.db #0xB9	; 185
	.db #0x41	; 65	'A'
	.db #0x64	; 100	'd'
	.db #0x0A	; 10
	.db #0x64	; 100	'd'
;src/entities/entities.c:466: TPlayerDirection accion(TEntity* ent, TPlayerStatus action, TPlayerDirection dir){
;	---------------------------------
; Function accion
; ---------------------------------
_accion::
	push	ix
	ld	ix,#0
	add	ix,sp
	dec	sp
;src/entities/entities.c:468: switch(action){
	ld	a,6 (ix)
	dec	a
	jp	NZ,00107$
;src/entities/entities.c:470: switch(dir){
	ld	a,#0x03
	sub	a, 7 (ix)
	jp	C,00107$
	ld	e,7 (ix)
	ld	d,#0x00
	ld	hl,#00120$
	add	hl,de
	add	hl,de
;src/entities/entities.c:471: case d_up:
	jp	(hl)
00120$:
	jr	00102$
	jr	00105$
	jr	00103$
	jr	00104$
00102$:
;src/entities/entities.c:472: collision = moverArriba(ent);
	ld	l,4 (ix)
	ld	h,5 (ix)
	push	hl
	call	_moverArriba
	pop	af
	ld	c,l
;src/entities/entities.c:473: flipSprite(ent,dir);
	push	bc
	ld	a,7 (ix)
	push	af
	inc	sp
	ld	l,4 (ix)
	ld	h,5 (ix)
	push	hl
	call	_flipSprite
	pop	af
	inc	sp
	pop	bc
;src/entities/entities.c:474: break;
	jr	00107$
;src/entities/entities.c:475: case d_down:
00103$:
;src/entities/entities.c:476: collision = moverAbajo(ent);
	ld	l,4 (ix)
	ld	h,5 (ix)
	push	hl
	call	_moverAbajo
	pop	af
	ld	c,l
;src/entities/entities.c:477: flipSprite(ent,dir);
	push	bc
	ld	a,7 (ix)
	push	af
	inc	sp
	ld	l,4 (ix)
	ld	h,5 (ix)
	push	hl
	call	_flipSprite
	pop	af
	inc	sp
	pop	bc
;src/entities/entities.c:478: break;
	jr	00107$
;src/entities/entities.c:479: case d_left:
00104$:
;src/entities/entities.c:480: collision = moverIzquierda(ent);
	ld	l,4 (ix)
	ld	h,5 (ix)
	push	hl
	call	_moverIzquierda
	pop	af
	ld	c,l
;src/entities/entities.c:481: flipSprite(ent,dir);
	push	bc
	ld	a,7 (ix)
	push	af
	inc	sp
	ld	l,4 (ix)
	ld	h,5 (ix)
	push	hl
	call	_flipSprite
	pop	af
	inc	sp
	pop	bc
;src/entities/entities.c:482: break;
	jr	00107$
;src/entities/entities.c:483: case d_right:
00105$:
;src/entities/entities.c:484: collision = moverDerecha(ent);
	ld	l,4 (ix)
	ld	h,5 (ix)
	push	hl
	call	_moverDerecha
	pop	af
	ld	c,l
;src/entities/entities.c:485: flipSprite(ent,dir);
	push	bc
	ld	a,7 (ix)
	push	af
	inc	sp
	ld	l,4 (ix)
	ld	h,5 (ix)
	push	hl
	call	_flipSprite
	pop	af
	inc	sp
	pop	bc
;src/entities/entities.c:490: }
00107$:
;src/entities/entities.c:491: return collision;
	ld	l,c
	inc	sp
	pop	ix
	ret
;src/entities/entities.c:495: void flipSprite(TEntity* ent, TPlayerDirection dir){
;	---------------------------------
; Function flipSprite
; ---------------------------------
_flipSprite::
;src/entities/entities.c:496: if(ent->curr_dir != dir){
	pop	de
	pop	bc
	push	bc
	push	de
	ld	hl,#0x0015
	add	hl,bc
	ld	c,l
	ld	b,h
	ld	a,(bc)
	ld	e,a
	ld	iy,#4
	add	iy,sp
	ld	a,0 (iy)
	sub	a, e
	ret	Z
;src/entities/entities.c:497: ent->curr_dir = dir; 
	ld	a,0 (iy)
	ld	(bc),a
	ret
;src/entities/entities.c:501: TPlayerDirection moverArriba(TEntity* ent){
;	---------------------------------
; Function moverArriba
; ---------------------------------
_moverArriba::
	push	ix
	ld	ix,#0
	add	ix,sp
	push	af
;src/entities/entities.c:504: ent->y -= ent->vy;
	ld	c,4 (ix)
	ld	b,5 (ix)
	ld	hl,#0x0002
	add	hl,bc
	ex	(sp), hl
	pop	hl
	push	hl
	ld	e,(hl)
	inc	hl
	ld	d,(hl)
	push	bc
	pop	iy
	ld	l,9 (iy)
	ld	h,#0x00
	ld	a,e
	sub	a, l
	ld	e,a
	ld	a,d
	sbc	a, h
	ld	d,a
	pop	hl
	push	hl
	ld	(hl),e
	inc	hl
	ld	(hl),d
;src/entities/entities.c:505: if(MAX(ORIGEN_MAPA_Y, ent->y) == ORIGEN_MAPA_Y){
	pop	hl
	push	hl
	ld	a, (hl)
	inc	hl
	ld	h,(hl)
	ld	l,a
	ld	a,e
	sub	a, #0x28
	ld	a,d
	rla
	ccf
	rra
	sbc	a, #0x80
	jr	NC,00106$
	ld	hl,#0x0028
00106$:
	ld	a,l
	sub	a,#0x28
	jr	NZ,00102$
	or	a,h
	jr	NZ,00102$
;src/entities/entities.c:506: ent->y = ORIGEN_MAPA_Y;
	pop	hl
	push	hl
	ld	(hl),#0x28
	inc	hl
	ld	(hl),#0x00
;src/entities/entities.c:508: collision = d_up;
	ld	e,#0x00
	jr	00103$
00102$:
;src/entities/entities.c:510: collision = d_nothing;
	ld	e,#0x04
00103$:
;src/entities/entities.c:513: ent->draw  = SI;
	ld	hl,#0x000A
	add	hl,bc
	ld	(hl),#0x01
;src/entities/entities.c:515: return collision;
	ld	l,e
	ld	sp, ix
	pop	ix
	ret
;src/entities/entities.c:518: TPlayerDirection moverAbajo(TEntity* ent){
;	---------------------------------
; Function moverAbajo
; ---------------------------------
_moverAbajo::
	push	ix
	ld	ix,#0
	add	ix,sp
	ld	hl,#-6
	add	hl,sp
	ld	sp,hl
;src/entities/entities.c:521: ent->y += ent->vy;
	ld	c,4 (ix)
	ld	b,5 (ix)
	ld	hl,#0x0002
	add	hl,bc
	ld	-4 (ix),l
	ld	-3 (ix),h
	ld	l,-4 (ix)
	ld	h,-3 (ix)
	ld	e,(hl)
	inc	hl
	ld	d,(hl)
	push	bc
	pop	iy
	ld	l,9 (iy)
	ld	h,#0x00
	add	hl,de
	ex	de,hl
	ld	l,-4 (ix)
	ld	h,-3 (ix)
	ld	(hl),e
	inc	hl
	ld	(hl),d
	ld	l,-4 (ix)
	ld	h,-3 (ix)
	ld	a,(hl)
	ld	-6 (ix),a
	inc	hl
	ld	a,(hl)
	ld	-5 (ix),a
;src/entities/entities.c:522: if(MIN(ent->y, ALTO - ent->sh) != ent->y){
	push	bc
	pop	iy
	ld	l,20 (iy)
	ld	h,#0x00
	ld	a,#0xC8
	sub	a, l
	ld	-2 (ix),a
	ld	a,#0x00
	sbc	a, h
	ld	-1 (ix),a
	ld	a,e
	sub	a, -2 (ix)
	ld	a,d
	sbc	a, -1 (ix)
	jp	PO, 00116$
	xor	a, #0x80
00116$:
	jp	P,00106$
	pop	de
	push	de
	jr	00107$
00106$:
	ld	e,-2 (ix)
	ld	d,-1 (ix)
00107$:
	ld	a,-6 (ix)
	sub	a, e
	jr	NZ,00117$
	ld	a,-5 (ix)
	sub	a, d
	jr	Z,00102$
00117$:
;src/entities/entities.c:523: ent->y = ALTO - ent->sh;
	ld	l,-4 (ix)
	ld	h,-3 (ix)
	ld	a,-2 (ix)
	ld	(hl),a
	inc	hl
	ld	a,-1 (ix)
	ld	(hl),a
;src/entities/entities.c:524: collision =  d_down;
	ld	e,#0x02
	jr	00103$
00102$:
;src/entities/entities.c:526: collision = d_nothing;
	ld	e,#0x04
00103$:
;src/entities/entities.c:529: ent->draw  = SI;
	ld	hl,#0x000A
	add	hl,bc
	ld	(hl),#0x01
;src/entities/entities.c:531: return collision;
	ld	l,e
	ld	sp, ix
	pop	ix
	ret
;src/entities/entities.c:534: TPlayerDirection moverIzquierda(TEntity* ent){
;	---------------------------------
; Function moverIzquierda
; ---------------------------------
_moverIzquierda::
	push	ix
	ld	ix,#0
	add	ix,sp
;src/entities/entities.c:537: ent->x -= ent->vx;
	ld	c,4 (ix)
	ld	b,5 (ix)
	ld	l, c
	ld	h, b
	ld	e,(hl)
	inc	hl
	ld	d,(hl)
	push	bc
	pop	iy
	ld	l,8 (iy)
	ld	h,#0x00
	ld	a,e
	sub	a, l
	ld	e,a
	ld	a,d
	sbc	a, h
	ld	d,a
	ld	l, c
	ld	h, b
	ld	(hl),e
	inc	hl
	ld	(hl),d
;src/entities/entities.c:538: if(MAX(0, ent->x) == 0){
	ld	l, c
	ld	h, b
	ld	a, (hl)
	inc	hl
	ld	h,(hl)
	ld	l,a
	bit	7, d
	jr	Z,00106$
	ld	hl,#0x0000
00106$:
	ld	a,h
	or	a,l
	jr	NZ,00102$
;src/entities/entities.c:539: ent->x = 0;
	ld	l, c
	ld	h, b
	xor	a, a
	ld	(hl), a
	inc	hl
	ld	(hl), a
;src/entities/entities.c:541: collision = d_left;
	ld	e,#0x03
	jr	00103$
00102$:
;src/entities/entities.c:543: collision = d_nothing;
	ld	e,#0x04
00103$:
;src/entities/entities.c:545: ent->draw  = SI;
	ld	hl,#0x000A
	add	hl,bc
	ld	(hl),#0x01
;src/entities/entities.c:547: return collision;
	ld	l,e
	pop	ix
	ret
;src/entities/entities.c:549: TPlayerDirection moverDerecha(TEntity* ent){
;	---------------------------------
; Function moverDerecha
; ---------------------------------
_moverDerecha::
	push	ix
	ld	ix,#0
	add	ix,sp
	push	af
	push	af
;src/entities/entities.c:552: ent->x += ent->vx;
	ld	c,4 (ix)
	ld	b,5 (ix)
	ld	l, c
	ld	h, b
	ld	e,(hl)
	inc	hl
	ld	d,(hl)
	push	bc
	pop	iy
	ld	l,8 (iy)
	ld	h,#0x00
	add	hl,de
	ex	de,hl
	ld	l, c
	ld	h, b
	ld	(hl),e
	inc	hl
	ld	(hl),d
;src/entities/entities.c:553: if(MIN(ent->x, ANCHO - ent->sw) != ent->x){
	ld	a,(bc)
	ld	-2 (ix),a
	inc	bc
	ld	a,(bc)
	ld	-1 (ix),a
	dec	bc
	push	bc
	pop	iy
	ld	l,19 (iy)
	ld	h,#0x00
	ld	a,#0x50
	sub	a, l
	ld	-4 (ix),a
	ld	a,#0x00
	sbc	a, h
	ld	-3 (ix),a
	ld	a,e
	sub	a, -4 (ix)
	ld	a,d
	sbc	a, -3 (ix)
	jp	PO, 00116$
	xor	a, #0x80
00116$:
	jp	P,00106$
	ld	e,-2 (ix)
	ld	d,-1 (ix)
	jr	00107$
00106$:
	pop	de
	push	de
00107$:
	ld	a,-2 (ix)
	sub	a, e
	jr	NZ,00117$
	ld	a,-1 (ix)
	sub	a, d
	jr	Z,00102$
00117$:
;src/entities/entities.c:555: ent->x = ANCHO - ent->sw;
	ld	l, c
	ld	h, b
	ld	a,-4 (ix)
	ld	(hl),a
	inc	hl
	ld	a,-3 (ix)
	ld	(hl),a
;src/entities/entities.c:556: collision = d_right;
	ld	e,#0x01
	jr	00103$
00102$:
;src/entities/entities.c:558: collision = d_nothing;
	ld	e,#0x04
00103$:
;src/entities/entities.c:561: ent->draw  = SI;
	ld	hl,#0x000A
	add	hl,bc
	ld	(hl),#0x01
;src/entities/entities.c:563: return collision;
	ld	l,e
	ld	sp, ix
	pop	ix
	ret
;src/entities/entities.c:567: void updatePlayer(TPlayer* player){
;	---------------------------------
; Function updatePlayer
; ---------------------------------
_updatePlayer::
;src/entities/entities.c:568: if(previousMap == mapaActual){
	ld	a,(#_previousMap + 0)
	ld	iy,#_mapaActual
	sub	a, 0 (iy)
	jr	NZ,00102$
;src/entities/entities.c:570: updateTiempoEnMapa();
	call	_updateTiempoEnMapa
	jr	00103$
00102$:
;src/entities/entities.c:572: previousMap = mapaActual;
	ld	a,(#_mapaActual + 0)
	ld	(#_previousMap + 0),a
;src/entities/entities.c:573: resetearTimepoEnMapa();
	call	_resetearTimepoEnMapa
00103$:
;src/entities/entities.c:576: updateBullet(&player->bullet);
	pop	de
	pop	bc
	push	bc
	push	de
	push	bc
	call	_updateBullet
	pop	af
	ret
;src/entities/entities.c:580: void corregirPosicion(TBullet* bullet, u8 x, u8 y, TPlayerDirection dir){
;	---------------------------------
; Function corregirPosicion
; ---------------------------------
_corregirPosicion::
	push	ix
	ld	ix,#0
	add	ix,sp
;src/entities/entities.c:591: x = ANCHO - bullet->ent.sw;
	ld	c,4 (ix)
	ld	b,5 (ix)
;src/entities/entities.c:581: switch(dir){
	ld	a,#0x03
	sub	a, 8 (ix)
	jp	C,00115$
;src/entities/entities.c:583: x+=2;
	ld	e,6 (ix)
	inc	e
	inc	e
;src/entities/entities.c:581: switch(dir){
	push	de
	ld	e,8 (ix)
	ld	d,#0x00
	ld	hl,#00138$
	add	hl,de
	add	hl,de
;src/entities/entities.c:582: case d_up:
	pop	de
	jp	(hl)
00138$:
	jr	00101$
	jr	00104$
	jr	00111$
	jr	00108$
00101$:
;src/entities/entities.c:583: x+=2;
	ld	6 (ix),e
;src/entities/entities.c:584: if(y >= ORIGEN_MAPA_Y + 7 )
	ld	a,7 (ix)
	sub	a, #0x2F
	jp	C,00115$
;src/entities/entities.c:585: y-=7;
	ld	a,7 (ix)
	add	a,#0xF9
	ld	7 (ix),a
;src/entities/entities.c:586: break;
	jp	00115$
;src/entities/entities.c:587: case d_right:
00104$:
;src/entities/entities.c:588: if(x + 7 <= ANCHO)
	ld	e,6 (ix)
	ld	d,#0x00
	ld	hl,#0x0007
	add	hl,de
	ld	a,#0x50
	cp	a, l
	ld	a,#0x00
	sbc	a, h
	jp	PO, 00139$
	xor	a, #0x80
00139$:
	jp	M,00106$
;src/entities/entities.c:589: x+=7;
	ld	a,6 (ix)
	add	a, #0x07
	ld	6 (ix),a
	jr	00107$
00106$:
;src/entities/entities.c:591: x = ANCHO - bullet->ent.sw;
	push	bc
	pop	iy
	ld	e,22 (iy)
	ld	a,#0x50
	sub	a, e
	ld	6 (ix),a
00107$:
;src/entities/entities.c:592: y+=3;
	inc	7 (ix)
	inc	7 (ix)
	inc	7 (ix)
;src/entities/entities.c:594: break;
	jr	00115$
;src/entities/entities.c:595: case d_left:
00108$:
;src/entities/entities.c:596: if(x > 6)
	ld	a,#0x06
	sub	a, 6 (ix)
	jr	NC,00110$
;src/entities/entities.c:597: x-=5;
	ld	a,6 (ix)
	add	a,#0xFB
	ld	6 (ix),a
00110$:
;src/entities/entities.c:598: y+=2;
	inc	7 (ix)
	inc	7 (ix)
;src/entities/entities.c:600: break;
	jr	00115$
;src/entities/entities.c:601: case d_down:
00111$:
;src/entities/entities.c:602: if(y + 15 <= ALTO)
	ld	l,7 (ix)
	ld	h,#0x00
	push	de
	ld	de,#0x000F
	add	hl, de
	pop	de
	ld	a,#0xC8
	cp	a, l
	ld	a,#0x00
	sbc	a, h
	jp	PO, 00140$
	xor	a, #0x80
00140$:
	jp	M,00113$
;src/entities/entities.c:603: y +=15;
	ld	a,7 (ix)
	add	a, #0x0F
	ld	7 (ix),a
	jr	00114$
00113$:
;src/entities/entities.c:605: y = ALTO - bullet->ent.sh;
	push	bc
	pop	iy
	ld	d,23 (iy)
	ld	a,#0xC8
	sub	a, d
	ld	7 (ix),a
00114$:
;src/entities/entities.c:606: x +=2;
	ld	6 (ix),e
;src/entities/entities.c:608: }
00115$:
;src/entities/entities.c:610: bullet->ent.x = x;
	ld	l, c
	ld	h, b
	inc	hl
	inc	hl
	inc	hl
	ld	e,6 (ix)
	ld	d,#0x00
	ld	(hl),e
	inc	hl
	ld	(hl),d
;src/entities/entities.c:611: bullet->ent.y = y;
	ld	hl,#0x0005
	add	hl,bc
	ld	c,7 (ix)
	ld	b,#0x00
	ld	(hl),c
	inc	hl
	ld	(hl),b
	pop	ix
	ret
;src/entities/entities.c:613: void updateX(TEntity* ent, i16 x){
;	---------------------------------
; Function updateX
; ---------------------------------
_updateX::
;src/entities/entities.c:614: ent->x = x;
	pop	bc
	pop	hl
	push	hl
	push	bc
	ld	iy,#4
	add	iy,sp
	ld	a,0 (iy)
	ld	(hl),a
	inc	hl
	ld	a,1 (iy)
	ld	(hl),a
;src/entities/entities.c:615: ent->coll.x = x;
	ld	bc,#0x0017-1
	add	hl,bc
	ld	c,0 (iy)
	ld	(hl),c
	ret
;src/entities/entities.c:617: void updateY(TEntity* ent, i16 y){
;	---------------------------------
; Function updateY
; ---------------------------------
_updateY::
;src/entities/entities.c:618: ent->y = y;
	pop	de
	pop	bc
	push	bc
	push	de
	ld	e, c
	ld	d, b
	inc	de
	inc	de
	ld	iy,#4
	add	iy,sp
	ld	a,0 (iy)
	ld	(de),a
	inc	de
	ld	a,1 (iy)
	ld	(de),a
;src/entities/entities.c:619: ent->coll.y = y;
	ld	hl,#0x0018
	add	hl,bc
	ld	c,0 (iy)
	ld	(hl),c
	ret
;src/entities/entities.c:621: void disparar(TBullet* bullet, u8 x, u8 y, TPlayerDirection dir){
;	---------------------------------
; Function disparar
; ---------------------------------
_disparar::
	push	ix
	ld	ix,#0
	add	ix,sp
;src/entities/entities.c:622: if(bullet->state == es_static){
	ld	c,4 (ix)
	ld	b,5 (ix)
	ld	l, c
	ld	h, b
	inc	hl
	inc	hl
	ld	a,(hl)
	or	a, a
	jr	NZ,00103$
;src/entities/entities.c:623: bullet->state = es_disparado;
	ld	(hl),#0x02
;src/entities/entities.c:624: corregirPosicion(bullet,x,y,dir);
	push	bc
	ld	h,8 (ix)
	ld	l,7 (ix)
	push	hl
	ld	a,6 (ix)
	push	af
	inc	sp
	push	bc
	call	_corregirPosicion
	pop	af
	pop	af
	inc	sp
	pop	bc
;src/entities/entities.c:625: bullet->ent.px = bullet->ent.x;
	ld	l, c
	ld	h, b
	ld	iy,#0x0007
	add	iy, bc
	inc	hl
	inc	hl
	inc	hl
	ld	e,(hl)
	inc	hl
	ld	d,(hl)
	ld	0 (iy),e
	ld	1 (iy),d
;src/entities/entities.c:626: bullet->ent.py = bullet->ent.y;
	ld	iy,#0x0009
	add	iy, bc
	ld	l, c
	ld	h, b
	ld	de, #0x0005
	add	hl, de
	ld	e,(hl)
	inc	hl
	ld	d,(hl)
	ld	0 (iy),e
	ld	1 (iy),d
;src/entities/entities.c:627: bullet->ent.draw = SI;
	ld	hl,#0x000D
	add	hl,bc
	ld	(hl),#0x01
;src/entities/entities.c:628: bullet->ent.vivo = SI;
	ld	hl,#0x001E
	add	hl,bc
	ld	(hl),#0x01
;src/entities/entities.c:629: bullet->ent.curr_dir = dir;
	ld	hl,#0x0018
	add	hl,bc
	ld	a,8 (ix)
	ld	(hl),a
00103$:
	pop	ix
	ret
;src/entities/entities.c:633: void updateBullet(TBullet* bullet){
;	---------------------------------
; Function updateBullet
; ---------------------------------
_updateBullet::
	push	ix
	ld	ix,#0
	add	ix,sp
	push	af
	push	af
	dec	sp
;src/entities/entities.c:635: switch(bullet->state){
	ld	c,4 (ix)
	ld	b,5 (ix)
	ld	e, c
	ld	d, b
	inc	de
	inc	de
	ld	a,(de)
	ld	l,a
	sub	a, #0x02
	jr	Z,00101$
	ld	a,l
	sub	a, #0x03
	jr	Z,00107$
	jp	00109$
;src/entities/entities.c:636: case es_disparado:	//Solo updateamos la bala si ha sido disparada
00101$:
;src/entities/entities.c:638: if(bullet->frameCount >= bullet->frameLimit){
	ld	a,(bc)
	ld	-1 (ix),a
	ld	l, c
	ld	h, b
	inc	hl
	ld	a,-1 (ix)
	sub	a,(hl)
	jr	C,00105$
;src/entities/entities.c:639: bullet->ent.draw = SI;
	ld	hl,#0x0003
	add	hl,bc
	ld	-3 (ix),l
	ld	-2 (ix),h
	ld	hl,#0x000D
	add	hl,bc
	ex	(sp), hl
	pop	hl
	push	hl
	ld	(hl),#0x01
;src/entities/entities.c:642: if(accion(&bullet->ent, es_mover, bullet->ent.curr_dir) != d_nothing){
	push	bc
	pop	iy
	ld	h,24 (iy)
	push	bc
	push	de
	push	hl
	inc	sp
	ld	a,#0x01
	push	af
	inc	sp
	ld	l,-3 (ix)
	ld	h,-2 (ix)
	push	hl
	call	_accion
	pop	af
	pop	af
	pop	de
	pop	bc
	ld	a,l
	sub	a, #0x04
	jr	Z,00103$
;src/entities/entities.c:643: bullet->state = es_static;
	xor	a, a
	ld	(de),a
;src/entities/entities.c:644: calculaEntity(&bullet->ent, SI);
	push	bc
	ld	a,#0x01
	push	af
	inc	sp
	ld	l,-3 (ix)
	ld	h,-2 (ix)
	push	hl
	call	_calculaEntity
	pop	af
	inc	sp
	ld	l,-3 (ix)
	ld	h,-2 (ix)
	push	hl
	call	_borrarEntity
	pop	af
	pop	bc
;src/entities/entities.c:646: bullet->ent.draw = NO;
	pop	hl
	push	hl
	ld	(hl),#0x00
;src/entities/entities.c:647: bullet->ent.vivo = NO;
	ld	hl,#0x001E
	add	hl,bc
	ld	(hl),#0x00
00103$:
;src/entities/entities.c:650: bullet->frameCount = 0;
	xor	a, a
	ld	(bc),a
	jr	00109$
00105$:
;src/entities/entities.c:652: bullet->frameCount++;
	ld	a,-1 (ix)
	inc	a
	ld	(bc),a
;src/entities/entities.c:654: break;
	jr	00109$
;src/entities/entities.c:656: case es_explotando:
00107$:
;src/entities/entities.c:657: updateExplosion(bullet);
	push	bc
	call	_updateExplosion
	pop	af
;src/entities/entities.c:659: }
00109$:
	ld	sp, ix
	pop	ix
	ret
;src/entities/entities.c:663: void playerHerido(TPlayer* player){
;	---------------------------------
; Function playerHerido
; ---------------------------------
_playerHerido::
	push	ix
	ld	ix,#0
	add	ix,sp
;src/entities/entities.c:664: TBase* bases = getBases();
	call	_getBases
	ld	c,l
	ld	b,h
;src/entities/entities.c:665: player->vida--;
	ld	e,4 (ix)
	ld	d,5 (ix)
	ld	hl,#0x0049
	add	hl,de
	ld	a,(hl)
	add	a,#0xFF
	ld	(hl),a
;src/entities/entities.c:666: player->ent.x = px_spawn;
	ld	hl,#0x0026
	add	hl,de
	ld	(hl),#0x0A
	inc	hl
	ld	(hl),#0x00
;src/entities/entities.c:667: player->ent.y = py_spawn;
	ld	hl,#0x0028
	add	hl,de
	ld	(hl),#0xAA
	inc	hl
	ld	(hl),#0x00
;src/entities/entities.c:668: player->ent.draw = SI;
	ld	hl,#0x0030
	add	hl,de
	ld	(hl),#0x01
;src/entities/entities.c:669: mapaActual = 0;
	ld	hl,#_mapaActual + 0
	ld	(hl), #0x00
;src/entities/entities.c:670: player->ent.cuadrante = 0;
	ld	hl,#0x0042
	add	hl,de
	ld	(hl),#0x00
;src/entities/entities.c:671: mapa = mapas[0];
	ld	hl, #_mapas + 0
	ld	a,(hl)
	ld	iy,#_mapa
	ld	0 (iy),a
	inc	hl
	ld	a,(hl)
	ld	(#_mapa + 1),a
;src/entities/entities.c:672: bases[mapaActual].ent.draw = SI;
	ld	hl,#0x000E
	add	hl,bc
	ld	(hl),#0x01
;src/entities/entities.c:673: dibujarMapa();
	pop	ix
	jp	_dibujarMapa
;src/entities/entities.c:676: void updateEntities(){
;	---------------------------------
; Function updateEntities
; ---------------------------------
_updateEntities::
;src/entities/entities.c:683: for(i=0;i<NUM_ENEMIGOS;++i){
	ld	c,#0x00
	ld	de,#0x0000
00102$:
;src/entities/entities.c:686: updateBullet(&enemigos[i].bullet);
	ld	hl,#_enemigos
	add	hl,de
	push	bc
	push	de
	push	hl
	call	_updateBullet
	pop	af
	pop	de
	pop	bc
;src/entities/entities.c:683: for(i=0;i<NUM_ENEMIGOS;++i){
	ld	hl,#0x004E
	add	hl,de
	ex	de,hl
	inc	c
	ld	a,c
	sub	a, #0x03
	jr	C,00102$
;src/entities/entities.c:694: updateIA();
	jp  _updateIA
;src/entities/entities.c:696: u8 contarEnemigos(){
;	---------------------------------
; Function contarEnemigos
; ---------------------------------
_contarEnemigos::
	push	ix
	ld	ix,#0
	add	ix,sp
	push	af
	dec	sp
;src/entities/entities.c:699: for(i=0;i<NUM_ENEMIGOS;++i){
	ld	-2 (ix),#0x00
	ld	-3 (ix),#0x00
	ld	bc,#0x0000
00105$:
;src/entities/entities.c:700: if(enemigos[i].ent.cuadrante == mapaActual && enemigos[i].ent.vivo == 1){
	ld	hl,#_enemigos
	add	hl,bc
	ld	e,l
	ld	d,h
	push	bc
	ld	bc, #0x0042
	add	hl, bc
	pop	bc
	ld	a,(hl)
	ld	-1 (ix),a
	ld	a,(#_mapaActual + 0)
	sub	a, -1 (ix)
	jr	NZ,00106$
	push	de
	pop	iy
	ld	e,65 (iy)
	dec	e
	jr	NZ,00106$
;src/entities/entities.c:701: cuenta++;
	inc	-2 (ix)
00106$:
;src/entities/entities.c:699: for(i=0;i<NUM_ENEMIGOS;++i){
	ld	hl,#0x004E
	add	hl,bc
	ld	c,l
	ld	b,h
	inc	-3 (ix)
	ld	a,-3 (ix)
	sub	a, #0x03
	jr	C,00105$
;src/entities/entities.c:704: return cuenta;
	ld	l,-2 (ix)
	ld	sp, ix
	pop	ix
	ret
;src/entities/entities.c:707: void updateIA(){
;	---------------------------------
; Function updateIA
; ---------------------------------
_updateIA::
	push	ix
	ld	ix,#0
	add	ix,sp
	push	af
;src/entities/entities.c:713: for(i=0;i<NUM_ENEMIGOS;++i){
	ld	-2 (ix),#0x00
	ld	bc,#0x0000
00105$:
;src/entities/entities.c:716: if(enemigos[i].ent.cuadrante == mapaActual && enemigos[i].ent.vivo){
	ld	hl,#_enemigos
	add	hl,bc
	ex	de,hl
	push	de
	pop	iy
	ld	a,66 (iy)
	ld	-1 (ix),a
	ld	a,(#_mapaActual + 0)
	sub	a, -1 (ix)
	jr	NZ,00106$
	push	de
	pop	iy
	ld	a,65 (iy)
	or	a, a
	jr	Z,00106$
;src/entities/entities.c:718: updateIAState(&enemigos[i]);
	push	bc
	push	de
	call	_updateIAState
	pop	af
	pop	bc
00106$:
;src/entities/entities.c:713: for(i=0;i<NUM_ENEMIGOS;++i){
	ld	hl,#0x004E
	add	hl,bc
	ld	c,l
	ld	b,h
	inc	-2 (ix)
	ld	a,-2 (ix)
	sub	a, #0x03
	jr	C,00105$
	ld	sp, ix
	pop	ix
	ret
;src/entities/entities.c:727: TPlayerDirection comprobarEjeX(TEnemy* ene){
;	---------------------------------
; Function comprobarEjeX
; ---------------------------------
_comprobarEjeX::
	push	ix
	ld	ix,#0
	add	ix,sp
;src/entities/entities.c:730: if(ene->ent.x > puntos[ene->puntoDeControl].x){	//Si se cumple movemos hacia la izquierda
	ld	c,4 (ix)
	ld	b,5 (ix)
	ld	l, c
	ld	h, b
	ld	de, #0x0026
	add	hl, de
	ld	e,(hl)
	inc	hl
	ld	d,(hl)
	ld	l, c
	ld	h, b
	ld	bc, #0x004D
	add	hl, bc
	ld	l,(hl)
	ld	h,#0x00
	add	hl, hl
	ld	bc,#_puntos
	add	hl,bc
	ld	c,(hl)
	ld	b,#0x00
	ld	a,c
	sub	a, e
	ld	a,b
	sbc	a, d
	jp	PO, 00110$
	xor	a, #0x80
00110$:
	jp	P,00102$
;src/entities/entities.c:731: dir = d_left;
	ld	l,#0x03
	jr	00103$
00102$:
;src/entities/entities.c:733: dir = d_right;
	ld	l,#0x01
00103$:
;src/entities/entities.c:736: return dir;
	pop	ix
	ret
;src/entities/entities.c:738: TPlayerDirection comprobarEjeY(TEnemy* ene){
;	---------------------------------
; Function comprobarEjeY
; ---------------------------------
_comprobarEjeY::
	push	ix
	ld	ix,#0
	add	ix,sp
;src/entities/entities.c:741: if(ene->ent.y > puntos[ene->puntoDeControl].y){	//Si se cumple movemos hacia la derecha
	ld	c,4 (ix)
	ld	b,5 (ix)
	ld	l, c
	ld	h, b
	ld	de, #0x0028
	add	hl, de
	ld	e,(hl)
	inc	hl
	ld	d,(hl)
	ld	l, c
	ld	h, b
	ld	bc, #0x004D
	add	hl, bc
	ld	l,(hl)
	ld	h,#0x00
	add	hl, hl
	ld	bc,#_puntos
	add	hl,bc
	inc	hl
	ld	c,(hl)
	ld	b,#0x00
	ld	a,c
	sub	a, e
	ld	a,b
	sbc	a, d
	jp	PO, 00110$
	xor	a, #0x80
00110$:
	jp	P,00102$
;src/entities/entities.c:742: dir = d_up;
	ld	l,#0x00
	jr	00103$
00102$:
;src/entities/entities.c:744: dir = d_down;
	ld	l,#0x02
00103$:
;src/entities/entities.c:747: return dir;
	pop	ix
	ret
;src/entities/entities.c:749: u8 moverHaciaPuntoDeControl(TEnemy* ene){
;	---------------------------------
; Function moverHaciaPuntoDeControl
; ---------------------------------
_moverHaciaPuntoDeControl::
	push	ix
	ld	ix,#0
	add	ix,sp
	ld	hl,#-10
	add	hl,sp
	ld	sp,hl
;src/entities/entities.c:752: u8 llego = NO;
	ld	-10 (ix),#0x00
;src/entities/entities.c:753: if(++ene->cycles >= ene->wait_cycles){
	ld	c,4 (ix)
	ld	b,5 (ix)
	ld	hl,#0x004A
	add	hl,bc
	ld	-4 (ix),l
	ld	-3 (ix),h
	ld	l,-4 (ix)
	ld	h,-3 (ix)
	ld	e,(hl)
	inc	e
	ld	l,-4 (ix)
	ld	h,-3 (ix)
	ld	(hl),e
	ld	l, c
	ld	h, b
	push	bc
	ld	bc, #0x004B
	add	hl, bc
	pop	bc
	ld	d,(hl)
;src/entities/entities.c:756: diff = abs(ene->ent.x - puntos[ene->puntoDeControl].x);	
	ld	hl,#0x0026
	add	hl,bc
	ld	-7 (ix),l
	ld	-6 (ix),h
;src/entities/entities.c:764: ene->ent.curr_dir = dir;
	ld	hl,#0x003B
	add	hl,bc
	ld	-9 (ix),l
	ld	-8 (ix),h
;src/entities/entities.c:753: if(++ene->cycles >= ene->wait_cycles){
	ld	a,e
	sub	a, d
	jp	C,00106$
;src/entities/entities.c:754: dir = comprobarEjeX(ene);
	push	bc
	push	bc
	call	_comprobarEjeX
	pop	af
	pop	bc
	ld	-5 (ix),l
;src/entities/entities.c:756: diff = abs(ene->ent.x - puntos[ene->puntoDeControl].x);	
	ld	l,-7 (ix)
	ld	h,-6 (ix)
	ld	a,(hl)
	ld	-2 (ix),a
	inc	hl
	ld	a,(hl)
	ld	-1 (ix),a
	ld	hl,#0x004D
	add	hl,bc
	ex	de,hl
	ld	a,(de)
	ld	l,a
	ld	h,#0x00
	add	hl, hl
	ld	a,#<(_puntos)
	add	a, l
	ld	l,a
	ld	a,#>(_puntos)
	adc	a, h
	ld	h,a
	ld	l,(hl)
	ld	h,#0x00
	ld	a,-2 (ix)
	sub	a, l
	ld	l,a
	ld	a,-1 (ix)
	sbc	a, h
	ld	h,a
	push	bc
	push	de
	push	hl
	call	_abs
	pop	af
	pop	de
	pop	bc
;src/entities/entities.c:757: if(diff <= 2){
	ld	a,#0x02
	cp	a, l
	ld	a,#0x00
	sbc	a, h
	jp	PO, 00121$
	xor	a, #0x80
00121$:
	jp	M,00104$
;src/entities/entities.c:758: dir = comprobarEjeY(ene);
	push	bc
	push	de
	push	bc
	call	_comprobarEjeY
	pop	af
	pop	de
	pop	bc
	ld	-5 (ix),l
;src/entities/entities.c:759: diff = abs(ene->ent.y - puntos[ene->puntoDeControl].y);	
	ld	l, c
	ld	h, b
	ld	bc, #0x0028
	add	hl, bc
	ld	c,(hl)
	inc	hl
	ld	b,(hl)
	ld	a,(de)
	ld	l,a
	ld	h,#0x00
	add	hl, hl
	ld	de,#_puntos
	add	hl,de
	inc	hl
	ld	e,(hl)
	ld	d,#0x00
	ld	a,c
	sub	a, e
	ld	c,a
	ld	a,b
	sbc	a, d
	ld	b,a
	push	bc
	call	_abs
	pop	af
;src/entities/entities.c:760: if(diff <= 2){
	ld	a,#0x02
	cp	a, l
	ld	a,#0x00
	sbc	a, h
	jp	PO, 00122$
	xor	a, #0x80
00122$:
	jp	M,00104$
;src/entities/entities.c:761: llego = SI;
	ld	-10 (ix),#0x01
00104$:
;src/entities/entities.c:764: ene->ent.curr_dir = dir;
	ld	l,-9 (ix)
	ld	h,-8 (ix)
	ld	a,-5 (ix)
	ld	(hl),a
;src/entities/entities.c:765: ene->cycles = 0; //Reseteamos el ciclo actual de espera
	ld	l,-4 (ix)
	ld	h,-3 (ix)
	ld	(hl),#0x00
00106$:
;src/entities/entities.c:768: accion(&ene->ent, es_mover, ene->ent.curr_dir);
	ld	l,-9 (ix)
	ld	h,-8 (ix)
	ld	b,(hl)
	push	bc
	inc	sp
	ld	a,#0x01
	push	af
	inc	sp
	ld	l,-7 (ix)
	ld	h,-6 (ix)
	push	hl
	call	_accion
	pop	af
	pop	af
;src/entities/entities.c:770: return llego;
	ld	l,-10 (ix)
	ld	sp, ix
	pop	ix
	ret
;src/entities/entities.c:772: i16 abs(i16 num){
;	---------------------------------
; Function abs
; ---------------------------------
_abs::
;src/entities/entities.c:775: if(num<0){
	ld	iy,#2
	add	iy,sp
	bit	7,1 (iy)
	jr	Z,00102$
;src/entities/entities.c:776: numPositivo -= num;
	xor	a, a
	sub	a, 0 (iy)
	ld	l,a
	ld	a, #0x00
	sbc	a, 1 (iy)
	ld	h,a
	ret
00102$:
;src/entities/entities.c:778: numPositivo=num;
	pop	bc
	pop	hl
	push	hl
	push	bc
;src/entities/entities.c:781: return numPositivo;
	ret
;src/entities/entities.c:784: TPlayerDirection calculaDireccion(){
;	---------------------------------
; Function calculaDireccion
; ---------------------------------
_calculaDireccion::
	dec	sp
;src/entities/entities.c:786: switch(mapaActual){
	ld	a,#0x05
	ld	iy,#_mapaActual
	sub	a, 0 (iy)
	jr	C,00107$
	ld	iy,#_mapaActual
	ld	e,0 (iy)
	ld	d,#0x00
	ld	hl,#00114$
	add	hl,de
	add	hl,de
;src/entities/entities.c:787: case 0:
	jp	(hl)
00114$:
	jr	00101$
	jr	00102$
	jr	00103$
	jr	00104$
	jr	00105$
	jr	00106$
00101$:
;src/entities/entities.c:788: dir = d_right;
	ld	l,#0x01
;src/entities/entities.c:789: break;
	jr	00107$
;src/entities/entities.c:790: case 1:
00102$:
;src/entities/entities.c:791: dir = d_up;
	ld	l,#0x00
;src/entities/entities.c:792: break;
	jr	00107$
;src/entities/entities.c:793: case 2:
00103$:
;src/entities/entities.c:794: dir = d_right;
	ld	l,#0x01
;src/entities/entities.c:795: break;
	jr	00107$
;src/entities/entities.c:796: case 3:
00104$:
;src/entities/entities.c:797: dir = d_up;
	ld	l,#0x00
;src/entities/entities.c:798: break;
	jr	00107$
;src/entities/entities.c:799: case 4:
00105$:
;src/entities/entities.c:800: dir = d_down;
	ld	l,#0x02
;src/entities/entities.c:801: break;
	jr	00107$
;src/entities/entities.c:802: case 5:
00106$:
;src/entities/entities.c:803: dir = d_down;
	ld	l,#0x02
;src/entities/entities.c:805: }
00107$:
;src/entities/entities.c:806: return dir;
	inc	sp
	ret
;src/entities/entities.c:809: void updateIAState(TEnemy* ene){
;	---------------------------------
; Function updateIAState
; ---------------------------------
_updateIAState::
	push	ix
	ld	ix,#0
	add	ix,sp
	ld	hl,#-10
	add	hl,sp
	ld	sp,hl
;src/entities/entities.c:810: TPlayer* p = &player;
;src/entities/entities.c:811: TCoord* c = &puntos[0];
;src/entities/entities.c:812: TBase* bases = getBases();
	call	_getBases
	ld	-9 (ix),l
	ld	-8 (ix),h
;src/entities/entities.c:814: switch(ene->statusIA){
	ld	a,4 (ix)
	ld	-5 (ix),a
	ld	a,5 (ix)
	ld	-4 (ix),a
	ld	a,-5 (ix)
	add	a, #0x49
	ld	-7 (ix),a
	ld	a,-4 (ix)
	adc	a, #0x00
	ld	-6 (ix),a
	ld	l,-7 (ix)
	ld	h,-6 (ix)
	ld	a,(hl)
	ld	-1 (ix), a
	or	a, a
	jr	Z,00101$
	ld	a,-1 (ix)
	sub	a, #0x03
	jp	Z,00110$
	jp	00122$
;src/entities/entities.c:815: case s_mover:
00101$:
;src/entities/entities.c:818: if(basesCapturadas >= 5 && contarEnemigos() == 1 && count == 0){
	ld	a,(#_basesCapturadas + 0)
	sub	a, #0x05
	jr	C,00103$
	call	_contarEnemigos
	dec	l
	jr	NZ,00103$
	ld	a,(#_count + 0)
	or	a, a
	jr	NZ,00103$
;src/entities/entities.c:819: ene->statusIA = s_huir;
	ld	l,-7 (ix)
	ld	h,-6 (ix)
	ld	(hl),#0x03
;src/entities/entities.c:820: count++;
	ld	hl, #_count+0
	inc	(hl)
;src/entities/entities.c:821: break;		//Salimos
	jp	00122$
00103$:
;src/entities/entities.c:824: if(moverHaciaPuntoDeControl(ene))	//si devuelve true es que ha llegado al siguiente
	ld	l,-5 (ix)
	ld	h,-4 (ix)
	push	hl
	call	_moverHaciaPuntoDeControl
	pop	af
	ld	-1 (ix),l
;src/entities/entities.c:825: ene->puntoDeControl++;			//punto de control por lo que ahora cambia de destino
	ld	a,-5 (ix)
	add	a, #0x4D
	ld	-7 (ix),a
	ld	a,-4 (ix)
	adc	a, #0x00
	ld	-6 (ix),a
;src/entities/entities.c:824: if(moverHaciaPuntoDeControl(ene))	//si devuelve true es que ha llegado al siguiente
	ld	a,-1 (ix)
	or	a, a
	jr	Z,00107$
;src/entities/entities.c:825: ene->puntoDeControl++;			//punto de control por lo que ahora cambia de destino
	ld	l,-7 (ix)
	ld	h,-6 (ix)
	ld	a,(hl)
	ld	-1 (ix), a
	ld	c, a
	inc	c
	ld	l,-7 (ix)
	ld	h,-6 (ix)
	ld	(hl),c
00107$:
;src/entities/entities.c:826: if(ene->puntoDeControl > 3){
	ld	l,-7 (ix)
	ld	h,-6 (ix)
	ld	c,(hl)
	ld	a,#0x03
	sub	a, c
	jr	NC,00109$
;src/entities/entities.c:828: c->x = p->ent.x;
	ld	bc, (#(_player + 0x0026) + 0)
	ld	hl,#_puntos
	ld	(hl),c
;src/entities/entities.c:829: c->y = p->ent.y;
	ld	bc, (#(_player + 0x0026) + 2)
	ld	hl,#(_puntos + 0x0001)
	ld	(hl),c
;src/entities/entities.c:830: ene->puntoDeControl = 0;
	ld	l,-7 (ix)
	ld	h,-6 (ix)
	ld	(hl),#0x00
00109$:
;src/entities/entities.c:832: comprobarSiDisparo(ene, p);
	ld	hl,#_player
	push	hl
	ld	l,-5 (ix)
	ld	h,-4 (ix)
	push	hl
	call	_comprobarSiDisparo
	pop	af
	pop	af
;src/entities/entities.c:833: break;
	jp	00122$
;src/entities/entities.c:834: case s_huir:
00110$:
;src/entities/entities.c:835: ene->ent.curr_dir = calculaDireccion();
	ld	a,-5 (ix)
	add	a, #0x26
	ld	c,a
	ld	a,-4 (ix)
	adc	a, #0x00
	ld	b,a
	ld	a,-5 (ix)
	add	a, #0x3B
	ld	l,a
	ld	a,-4 (ix)
	adc	a, #0x00
	ld	h,a
	push	hl
	push	bc
	call	_calculaDireccion
	ld	d,l
	pop	bc
	pop	hl
	ld	(hl),d
;src/entities/entities.c:836: if(accion(&ene->ent, es_mover, ene->ent.curr_dir) != d_nothing){
	push	bc
	ld	e, #0x01
	push	de
	push	bc
	call	_accion
	pop	af
	pop	af
	pop	bc
	ld	a,l
	sub	a, #0x04
	jp	Z,00122$
;src/entities/entities.c:837: calculaEntity(&ene->ent, SI);
	push	bc
	ld	a,#0x01
	push	af
	inc	sp
	push	bc
	call	_calculaEntity
	pop	af
	inc	sp
	call	_borrarEntity
	pop	af
;src/entities/entities.c:839: ene->ent.cuadrante++;
	ld	a,-5 (ix)
	add	a, #0x42
	ld	l,a
	ld	a,-4 (ix)
	adc	a, #0x00
	ld	h,a
	ld	c,(hl)
	inc	c
	ld	(hl),c
;src/entities/entities.c:840: if(ene->ent.cuadrante > 5)
	ld	a,#0x05
	sub	a, c
	jr	NC,00135$
;src/entities/entities.c:841: ene->ent.cuadrante = 0;
	ld	(hl),#0x00
;src/entities/entities.c:842: for(i = 0; i<NUM_BASES; i++){
00135$:
	ld	-10 (ix),#0x00
	ld	-7 (ix),#0x00
	ld	-6 (ix),#0x00
00120$:
;src/entities/entities.c:843: if(bases[i].whom == 0 && bases[i].ent.cuadrante != mapaActual){
	ld	a,-9 (ix)
	add	a, -7 (ix)
	ld	-5 (ix),a
	ld	a,-8 (ix)
	adc	a, -6 (ix)
	ld	-4 (ix),a
	ld	l,-5 (ix)
	ld	h,-4 (ix)
	ld	a,(hl)
	or	a, a
	jr	NZ,00121$
	ld	l,-5 (ix)
	ld	h,-4 (ix)
	ld	de, #0x0020
	add	hl, de
	ld	c,(hl)
	ld	a,(#_mapaActual + 0)
	sub	a, c
	jr	Z,00121$
;src/entities/entities.c:844: bases[i].whom = 1;
	ld	l,-5 (ix)
	ld	h,-4 (ix)
	ld	(hl),#0x01
;src/entities/entities.c:845: bases[i].cycles = 0;
	ld	a,-5 (ix)
	add	a, #0x03
	ld	-3 (ix),a
	ld	a,-4 (ix)
	adc	a, #0x00
	ld	-2 (ix),a
	ld	l,-3 (ix)
	ld	h,-2 (ix)
	ld	(hl),#0x00
;src/entities/entities.c:846: bases[i].ent.sprites[0] = NULL;
	ld	a,-5 (ix)
	add	a, #0x0F
	ld	-3 (ix),a
	ld	a,-4 (ix)
	adc	a, #0x00
	ld	-2 (ix),a
	ld	l,-3 (ix)
	ld	h,-2 (ix)
	ld	(hl),#0x00
	inc	hl
	ld	(hl),#0x00
;src/entities/entities.c:847: basesCapturadas--;
	ld	hl, #_basesCapturadas+0
	dec	(hl)
;src/entities/entities.c:848: break;
	jr	00122$
00121$:
;src/entities/entities.c:842: for(i = 0; i<NUM_BASES; i++){
	ld	a,-7 (ix)
	add	a, #0x27
	ld	-7 (ix),a
	ld	a,-6 (ix)
	adc	a, #0x00
	ld	-6 (ix),a
	inc	-10 (ix)
	ld	a,-10 (ix)
	sub	a, #0x06
	jp	C,00120$
;src/entities/entities.c:857: }
00122$:
	ld	sp, ix
	pop	ix
	ret
;src/entities/entities.c:859: void comprobarSiDisparo(TEnemy* ene, TPlayer* p){
;	---------------------------------
; Function comprobarSiDisparo
; ---------------------------------
_comprobarSiDisparo::
	push	ix
	ld	ix,#0
	add	ix,sp
	ld	hl,#-15
	add	hl,sp
	ld	sp,hl
;src/entities/entities.c:862: if(++ene->shot_cycles >= wshot_cycles){
	ld	c,4 (ix)
	ld	b,5 (ix)
	ld	hl,#0x004C
	add	hl,bc
	ex	de,hl
	ld	a,(de)
	inc	a
	ld	-11 (ix), a
	ld	(de),a
	ld	hl,#_wshot_cycles
	ld	a,-11 (ix)
	sub	a, (hl)
	jp	C,00114$
;src/entities/entities.c:863: diff = abs(ene->ent.x - p->ent.x);	
	ld	hl,#0x0026
	add	hl,bc
	ld	-4 (ix),l
	ld	-3 (ix),h
	ld	l,-4 (ix)
	ld	h,-3 (ix)
	ld	a,(hl)
	ld	-6 (ix),a
	inc	hl
	ld	a,(hl)
	ld	-5 (ix),a
	ld	a,6 (ix)
	ld	-13 (ix),a
	ld	a,7 (ix)
	ld	-12 (ix),a
	ld	a,-13 (ix)
	add	a, #0x26
	ld	-10 (ix),a
	ld	a,-12 (ix)
	adc	a, #0x00
	ld	-9 (ix),a
	ld	l,-10 (ix)
	ld	h,-9 (ix)
	ld	a, (hl)
	inc	hl
	ld	h,(hl)
	ld	l,a
	ld	a,-6 (ix)
	sub	a, l
	ld	l,a
	ld	a,-5 (ix)
	sbc	a, h
	ld	h,a
	push	bc
	push	de
	push	hl
	call	_abs
	pop	af
	pop	de
	pop	bc
	ld	-6 (ix),l
	ld	-5 (ix),h
;src/entities/entities.c:865: if(ene->ent.y > p->ent.y){	//Si se cumple sabemos dir de disparo
	ld	hl,#0x0028
	add	hl,bc
	ld	-8 (ix),l
	ld	-7 (ix),h
	ld	l,-8 (ix)
	ld	h,-7 (ix)
	ld	a,(hl)
	ld	-15 (ix),a
	inc	hl
	ld	a,(hl)
	ld	-14 (ix),a
	push	hl
	ld	l,-13 (ix)
	ld	h,-12 (ix)
	push	hl
	pop	iy
	pop	hl
;src/entities/entities.c:870: ene->ent.curr_dir = dir;
	ld	hl,#0x003B
	add	hl,bc
	ld	-13 (ix),l
	ld	-12 (ix),h
;src/entities/entities.c:865: if(ene->ent.y > p->ent.y){	//Si se cumple sabemos dir de disparo
	ld	a,40 (iy)
	ld	-2 (ix),a
	ld	a,41 (iy)
	ld	-1 (ix),a
;src/entities/entities.c:864: if(diff <= 2){//Disparo en direccion dir
	ld	a,#0x02
	cp	a, -6 (ix)
	ld	a,#0x00
	sbc	a, -5 (ix)
	jp	PO, 00136$
	xor	a, #0x80
00136$:
	jp	M,00110$
;src/entities/entities.c:865: if(ene->ent.y > p->ent.y){	//Si se cumple sabemos dir de disparo
	ld	a,-2 (ix)
	sub	a, -15 (ix)
	ld	a,-1 (ix)
	sbc	a, -14 (ix)
	jp	PO, 00137$
	xor	a, #0x80
00137$:
	jp	P,00102$
;src/entities/entities.c:866: dir = d_up;
	ld	a,#0x00
	jr	00103$
00102$:
;src/entities/entities.c:868: dir = d_down;
	ld	a,#0x02
00103$:
;src/entities/entities.c:870: ene->ent.curr_dir = dir;
	ld	l,-13 (ix)
	ld	h,-12 (ix)
	ld	(hl),a
;src/entities/entities.c:871: disparar(&ene->bullet, ene->ent.x, ene->ent.y, dir);
	ld	l,-8 (ix)
	ld	h,-7 (ix)
	push	af
	ld	a, (hl)
	inc	hl
	ld	h,(hl)
	ld	l,a
	pop	af
	ld	-6 (ix),l
	ld	l,-4 (ix)
	ld	h,-3 (ix)
	push	af
	ld	a, (hl)
	inc	hl
	ld	h,(hl)
	ld	l,a
	pop	af
	ld	-11 (ix),l
	push	de
	push	af
	inc	sp
	ld	h,-6 (ix)
	ld	l,-11 (ix)
	push	hl
	push	bc
	call	_disparar
	pop	af
	pop	af
	inc	sp
	pop	de
	jp	00111$
00110$:
;src/entities/entities.c:873: diff = abs(ene->ent.y - p->ent.y);	
	ld	a,-15 (ix)
	sub	a, -2 (ix)
	ld	l,a
	ld	a,-14 (ix)
	sbc	a, -1 (ix)
	ld	h,a
	push	bc
	push	de
	push	hl
	call	_abs
	pop	af
	pop	de
	pop	bc
;src/entities/entities.c:874: if(diff <= 2){
	ld	a,#0x02
	cp	a, l
	ld	a,#0x00
	sbc	a, h
	jp	PO, 00138$
	xor	a, #0x80
00138$:
	jp	M,00111$
;src/entities/entities.c:875: if(ene->ent.x > p->ent.x){	//Si se cumple sabemos dir de disparo
	ld	l,-4 (ix)
	ld	h,-3 (ix)
	ld	a,(hl)
	ld	-2 (ix),a
	inc	hl
	ld	a,(hl)
	ld	-1 (ix),a
	ld	l,-10 (ix)
	ld	h,-9 (ix)
	ld	a, (hl)
	inc	hl
	ld	h,(hl)
	sub	a, -2 (ix)
	ld	a,h
	sbc	a, -1 (ix)
	jp	PO, 00139$
	xor	a, #0x80
00139$:
	jp	P,00105$
;src/entities/entities.c:876: dir = d_left;
	ld	a,#0x03
	jr	00106$
00105$:
;src/entities/entities.c:878: dir = d_right;
	ld	a,#0x01
00106$:
;src/entities/entities.c:880: ene->ent.curr_dir = dir;
	ld	l,-13 (ix)
	ld	h,-12 (ix)
	ld	(hl),a
;src/entities/entities.c:881: disparar(&ene->bullet, ene->ent.x, ene->ent.y, dir);
	ld	l,-8 (ix)
	ld	h,-7 (ix)
	push	af
	ld	a, (hl)
	inc	hl
	ld	h,(hl)
	ld	l,a
	pop	af
	ld	-2 (ix),l
	ld	l,-4 (ix)
	ld	h,-3 (ix)
	push	af
	ld	a, (hl)
	inc	hl
	ld	h,(hl)
	ld	l,a
	pop	af
	ld	-15 (ix),l
	push	de
	push	af
	inc	sp
	ld	h,-2 (ix)
	ld	l,-15 (ix)
	push	hl
	push	bc
	call	_disparar
	pop	af
	pop	af
	inc	sp
	pop	de
00111$:
;src/entities/entities.c:885: ene->shot_cycles = 0;
	xor	a, a
	ld	(de),a
00114$:
	ld	sp, ix
	pop	ix
	ret
;src/entities/entities.c:891: void redibujarEntity(TEntity* ent, u8 w, u8 h){
;	---------------------------------
; Function redibujarEntity
; ---------------------------------
_redibujarEntity::
	push	ix
	ld	ix,#0
	add	ix,sp
	dec	sp
;src/entities/entities.c:892: if (ent->draw && ent->cuadrante == mapaActual) {
	ld	c,4 (ix)
	ld	b,5 (ix)
	ld	hl,#0x000A
	add	hl,bc
	ex	de,hl
	ld	a,(de)
	or	a, a
	jr	Z,00104$
	push	bc
	pop	iy
	ld	a,28 (iy)
	ld	-1 (ix),a
	ld	a,(#_mapaActual + 0)
	sub	a, -1 (ix)
	jr	NZ,00104$
;src/entities/entities.c:893: borrarEntity(ent);
	push	bc
	push	de
	push	bc
	call	_borrarEntity
	pop	af
	pop	de
	pop	bc
;src/entities/entities.c:894: ent->px = ent->x;
	ld	iy,#0x0004
	add	iy, bc
	ld	l, c
	ld	h, b
	ld	a, (hl)
	inc	hl
	ld	h,(hl)
	ld	0 (iy), a
	ld	1 (iy),h
;src/entities/entities.c:895: ent->py = ent->y;
	ld	iy,#0x0006
	add	iy, bc
	ld	l, c
	ld	h, b
	inc	hl
	inc	hl
	ld	a, (hl)
	inc	hl
	ld	h,(hl)
	ld	0 (iy), a
	ld	1 (iy),h
;src/entities/entities.c:896: dibujarEntity(ent, w, h);
	push	de
	ld	h,7 (ix)
	ld	l,6 (ix)
	push	hl
	push	bc
	call	_dibujarEntity
	pop	af
	pop	af
	pop	de
;src/entities/entities.c:897: ent->draw = NO;
	xor	a, a
	ld	(de),a
00104$:
	inc	sp
	pop	ix
	ret
;src/entities/entities.c:901: void borrarEntity(TEntity* ent){
;	---------------------------------
; Function borrarEntity
; ---------------------------------
_borrarEntity::
	push	ix
	ld	ix,#0
	add	ix,sp
	push	af
	push	af
;src/entities/entities.c:902: if(ent->draw){
	ld	c,4 (ix)
	ld	b,5 (ix)
	push	bc
	pop	iy
	ld	a,10 (iy)
	or	a, a
	jr	Z,00103$
;src/entities/entities.c:903: cpct_etm_drawTileBox2x4(ent->tpx, ent->tpy, ent->tw, ent->th, g_map11_W, ORIGEN_MAPA, mapa);
	ld	hl,(_mapa)
	ld	-3 (ix),l
	ld	-2 (ix),h
	ld	l, c
	ld	h, b
	ld	de, #0x001E
	add	hl, de
	ld	a,(hl)
	ld	-1 (ix),a
	ld	l, c
	ld	h, b
	ld	de, #0x001D
	add	hl, de
	ld	a,(hl)
	ld	-4 (ix),a
	ld	l, c
	ld	h, b
	ld	de, #0x0020
	add	hl, de
	ld	e,(hl)
	ld	l, c
	ld	h, b
	ld	bc, #0x001F
	add	hl, bc
	ld	b,(hl)
	ld	l,-3 (ix)
	ld	h,-2 (ix)
	push	hl
	ld	hl,#0xC190
	push	hl
	ld	a,#0x28
	push	af
	inc	sp
	ld	a,-1 (ix)
	push	af
	inc	sp
	ld	d, -4 (ix)
	push	de
	push	bc
	inc	sp
	call	_cpct_etm_drawTileBox2x4
00103$:
	ld	sp, ix
	pop	ix
	ret
;src/entities/entities.c:907: void dibujarEntity(TEntity* ent, u8 w, u8 h){
;	---------------------------------
; Function dibujarEntity
; ---------------------------------
_dibujarEntity::
	push	ix
	ld	ix,#0
	add	ix,sp
	push	af
;src/entities/entities.c:908: if (ent->draw) {
	ld	c,4 (ix)
	ld	b,5 (ix)
	push	bc
	pop	iy
	ld	a,10 (iy)
	or	a, a
	jr	Z,00103$
;src/entities/entities.c:909: cpct_drawSpriteMaskedAlignedTable(ent->sprites[ent->curr_dir],ent->vmem, w, h, g_tablatrans);
	ld	l, c
	ld	h, b
	ld	de, #0x0021
	add	hl, de
	ld	e,(hl)
	inc	hl
	ld	d,(hl)
	ld	hl,#0x000B
	add	hl,bc
	ex	(sp), hl
	ld	l, c
	ld	h, b
	ld	bc, #0x0015
	add	hl, bc
	ld	c,(hl)
	sla	c
	pop	hl
	push	hl
	ld	b,#0x00
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
00103$:
	ld	sp, ix
	pop	ix
	ret
;src/entities/entities.c:914: void calculaEntity(TEntity* ent, u8 origen){
;	---------------------------------
; Function calculaEntity
; ---------------------------------
_calculaEntity::
	push	ix
	ld	ix,#0
	add	ix,sp
	ld	hl,#-6
	add	hl,sp
	ld	sp,hl
;src/entities/entities.c:918: ent->tw = ent->sw/2 + (ent->px & 1);
	ld	a,4 (ix)
	ld	-6 (ix),a
	ld	a,5 (ix)
	ld	-5 (ix),a
	ld	a,-6 (ix)
	add	a, #0x1D
	ld	c,a
	ld	a,-5 (ix)
	adc	a, #0x00
	ld	b,a
	pop	hl
	push	hl
	ld	de, #0x0013
	add	hl, de
	ld	e,(hl)
	srl	e
	ld	a,-6 (ix)
	add	a, #0x04
	ld	-2 (ix),a
	ld	a,-5 (ix)
	adc	a, #0x00
	ld	-1 (ix),a
	ld	l,-2 (ix)
	ld	h,-1 (ix)
	ld	d,(hl)
	inc	hl
	ld	h,(hl)
	ld	a,d
	and	a, #0x01
	add	a,e
	ld	(bc),a
;src/entities/entities.c:922: ent->th = ent->sh/4 + (ent->py & 3 ? 1 : 0);
	ld	a,-6 (ix)
	add	a, #0x1E
	ld	c,a
	ld	a,-5 (ix)
	adc	a, #0x00
	ld	b,a
	pop	hl
	push	hl
	ld	de, #0x0014
	add	hl, de
	ld	e,(hl)
	srl	e
	srl	e
	ld	a,-6 (ix)
	add	a, #0x06
	ld	-4 (ix),a
	ld	a,-5 (ix)
	adc	a, #0x00
	ld	-3 (ix),a
	ld	l,-4 (ix)
	ld	h,-3 (ix)
	ld	d,(hl)
	inc	hl
	ld	l,(hl)
	ld	a,d
	and	a, #0x03
	jr	Z,00106$
	ld	d,#0x01
	jr	00107$
00106$:
	ld	d,#0x00
00107$:
	ld	a,e
	add	a, d
	ld	(bc),a
;src/entities/entities.c:924: ent->tpx = ent->px / 2;
	ld	a,-6 (ix)
	add	a, #0x1F
	ld	c,a
	ld	a,-5 (ix)
	adc	a, #0x00
	ld	b,a
	ld	l,-2 (ix)
	ld	h,-1 (ix)
	ld	e,(hl)
	inc	hl
	ld	d,(hl)
	ld	l, e
	ld	h, d
	bit	7, d
	jr	Z,00108$
	ex	de,hl
	inc	hl
00108$:
	sra	h
	rr	l
	ld	a,l
	ld	(bc),a
;src/entities/entities.c:922: ent->th = ent->sh/4 + (ent->py & 3 ? 1 : 0);
	ld	l,-4 (ix)
	ld	h,-3 (ix)
	ld	c,(hl)
	inc	hl
	ld	b,(hl)
;src/entities/entities.c:926: ent->tpy = (ent->py - ORIGEN_MAPA_Y) / 4;
	ld	a,-6 (ix)
	add	a, #0x20
	ld	e,a
	ld	a,-5 (ix)
	adc	a, #0x00
	ld	d,a
;src/entities/entities.c:925: if(origen == SI)
	ld	a,6 (ix)
	dec	a
	jr	NZ,00102$
;src/entities/entities.c:926: ent->tpy = (ent->py - ORIGEN_MAPA_Y) / 4;
	ld	a,c
	add	a,#0xD8
	ld	-4 (ix),a
	ld	a,b
	adc	a,#0xFF
	ld	-3 (ix),a
	ld	l,-4 (ix)
	ld	h,-3 (ix)
	bit	7, -3 (ix)
	jr	Z,00109$
	ld	hl,#0xFFDB
	add	hl,bc
00109$:
	sra	h
	rr	l
	sra	h
	rr	l
	ld	a,l
	ld	(de),a
	jr	00103$
00102$:
;src/entities/entities.c:928: ent->tpy = (ent->py) / 4;
	ld	l, c
	ld	h, b
	bit	7, b
	jr	Z,00110$
	ld	l, c
	ld	h, b
	inc	hl
	inc	hl
	inc	hl
00110$:
	sra	h
	rr	l
	sra	h
	rr	l
	ld	a,l
	ld	(de),a
00103$:
;src/entities/entities.c:929: ent->coll.x = ent->x;
	ld	a,-6 (ix)
	add	a, #0x17
	ld	c,a
	ld	a,-5 (ix)
	adc	a, #0x00
	ld	b,a
	pop	hl
	push	hl
	ld	e,(hl)
	inc	hl
	ld	d,(hl)
	ld	a,e
	ld	(bc),a
;src/entities/entities.c:930: ent->coll.y = ent->y;
	ld	iy,#0x0018
	pop	de
	push	de
	add	iy, de
	pop	hl
	push	hl
	inc	hl
	inc	hl
	push	hl
	ld	c,(hl)
	inc	hl
	ld	b,(hl)
	pop	hl
	ld	0 (iy), c
;src/entities/entities.c:931: ent->vmem = cpct_getScreenPtr(CPCT_VMEM_START,ent->x, ent->y);
	ld	a,-6 (ix)
	add	a, #0x21
	ld	c,a
	ld	a,-5 (ix)
	adc	a, #0x00
	ld	b,a
	ld	e,(hl)
	inc	hl
	ld	d,(hl)
	ld	a,e
	pop	hl
	push	hl
	ld	e,(hl)
	inc	hl
	ld	d,(hl)
	ld	d,e
	push	bc
	push	af
	inc	sp
	push	de
	inc	sp
	ld	hl,#0xC000
	push	hl
	call	_cpct_getScreenPtr
	ex	de,hl
	pop	bc
	ld	a,e
	ld	(bc),a
	inc	bc
	ld	a,d
	ld	(bc),a
	ld	sp, ix
	pop	ix
	ret
;src/entities/entities.c:935: void calculaAllEntities(TPlayer* player){
;	---------------------------------
; Function calculaAllEntities
; ---------------------------------
_calculaAllEntities::
	push	ix
	ld	ix,#0
	add	ix,sp
	push	af
	push	af
;src/entities/entities.c:938: exp = getExplosion();
	call	_getExplosion
	ld	c,l
	ld	b,h
;src/entities/entities.c:939: calculaEntity(&player->ent, SI);
	ld	e,4 (ix)
	ld	d,5 (ix)
	ld	iy,#0x0026
	add	iy, de
	push	bc
	push	de
	ld	a,#0x01
	push	af
	inc	sp
	push	iy
	call	_calculaEntity
	pop	af
	inc	sp
	pop	de
	pop	bc
;src/entities/entities.c:940: calculaEntity(&player->bullet.ent, SI);
	inc	de
	inc	de
	inc	de
	push	bc
	ld	a,#0x01
	push	af
	inc	sp
	push	de
	call	_calculaEntity
	pop	af
	inc	sp
	pop	bc
;src/entities/entities.c:941: calculaEntity(&exp->ent, SI);
	inc	bc
	ld	a,#0x01
	push	af
	inc	sp
	push	bc
	call	_calculaEntity
	pop	af
	inc	sp
;src/entities/entities.c:942: for(i=0;i < NUM_ENEMIGOS;++i){
	ld	-4 (ix),#0x00
	ld	bc,#0x0000
00104$:
;src/entities/entities.c:943: if(enemigos[i].ent.cuadrante == mapaActual){
	ld	hl,#_enemigos
	add	hl,bc
	ex	de,hl
	ld	hl,#0x0026
	add	hl,de
	ld	-2 (ix),l
	ld	-1 (ix),h
	push	de
	pop	iy
	ld	a,66 (iy)
	ld	-3 (ix),a
	ld	a,(#_mapaActual + 0)
	sub	a, -3 (ix)
	jr	NZ,00105$
;src/entities/entities.c:944: calculaEntity(&enemigos[i].ent, SI);
	ld	l,-2 (ix)
	ld	h,-1 (ix)
	push	hl
	pop	iy
	push	bc
	push	de
	ld	a,#0x01
	push	af
	inc	sp
	push	iy
	call	_calculaEntity
	pop	af
	inc	sp
	pop	de
	pop	bc
;src/entities/entities.c:945: calculaEntity(&enemigos[i].bullet.ent, SI);
	inc	de
	inc	de
	inc	de
	push	bc
	ld	a,#0x01
	push	af
	inc	sp
	push	de
	call	_calculaEntity
	pop	af
	inc	sp
	pop	bc
00105$:
;src/entities/entities.c:942: for(i=0;i < NUM_ENEMIGOS;++i){
	ld	hl,#0x004E
	add	hl,bc
	ld	c,l
	ld	b,h
	inc	-4 (ix)
	ld	a,-4 (ix)
	sub	a, #0x03
	jr	C,00104$
;src/entities/entities.c:949: calculaEntity(&bases[mapaActual].ent, SI);
	ld	bc,(_mapaActual)
	ld	b,#0x00
	ld	l, c
	ld	h, b
	add	hl, hl
	add	hl, hl
	add	hl, hl
	add	hl, bc
	add	hl, hl
	add	hl, bc
	add	hl, hl
	add	hl, bc
	ld	de,#_bases
	add	hl,de
	ld	bc,#0x0004
	add	hl,bc
	ld	c, l
	ld	b, h
	ld	a,#0x01
	push	af
	inc	sp
	push	bc
	call	_calculaEntity
	ld	sp,ix
	pop	ix
	ret
;src/entities/entities.c:953: void drawAll(TPlayer* player){
;	---------------------------------
; Function drawAll
; ---------------------------------
_drawAll::
	push	ix
	ld	ix,#0
	add	ix,sp
	ld	hl,#-7
	add	hl,sp
	ld	sp,hl
;src/entities/entities.c:957: exp = getExplosion();
	call	_getExplosion
	inc	sp
	inc	sp
	push	hl
;src/entities/entities.c:958: bases = getBases();
	call	_getBases
	ld	c,l
	ld	b,h
;src/entities/entities.c:965: if(bases[mapaActual].ent.sprites[0] != NULL){
	ld	de,(_mapaActual)
	ld	d,#0x00
	ld	l, e
	ld	h, d
	add	hl, hl
	add	hl, hl
	add	hl, hl
	add	hl, de
	add	hl, hl
	add	hl, de
	add	hl, hl
	add	hl, de
	add	hl,bc
	ld	c,l
	ld	b,h
	ld	hl,#0x0004
	add	hl,bc
	ex	de,hl
	push	bc
	pop	iy
	ld	l,15 (iy)
	ld	a, 16 (iy)
	or	a,l
	jr	Z,00102$
;src/entities/entities.c:966: redibujarEntity(&bases[mapaActual].ent, bases[mapaActual].ent.sw, bases[mapaActual].ent.sh);
	ld	l, c
	ld	h, b
	push	bc
	ld	bc, #0x0018
	add	hl, bc
	pop	bc
	ld	a,(hl)
	ld	l, c
	ld	h, b
	ld	bc, #0x0017
	add	hl, bc
	ld	b,(hl)
	push	af
	inc	sp
	push	bc
	inc	sp
	push	de
	call	_redibujarEntity
	pop	af
	pop	af
00102$:
;src/entities/entities.c:969: redibujarEntity(&player->bullet.ent, player->bullet.ent.sw, player->bullet.ent.sh);
	ld	e,4 (ix)
	ld	d,5 (ix)
	push	de
	pop	iy
	inc	iy
	inc	iy
	inc	iy
	ld	l, e
	ld	h, d
	ld	bc, #0x0017
	add	hl, bc
	ld	a,(hl)
	ld	l, e
	ld	h, d
	ld	bc, #0x0016
	add	hl, bc
	ld	b,(hl)
	push	de
	push	af
	inc	sp
	push	bc
	inc	sp
	push	iy
	call	_redibujarEntity
	pop	af
	pop	af
	pop	de
;src/entities/entities.c:970: redibujarEntity(&player->ent, player->ent.sw, player->ent.sh);
	ld	hl,#0x0026
	add	hl,de
	ld	c,l
	ld	b,h
	push	de
	pop	iy
	ld	a,58 (iy)
	ex	de,hl
	ld	de, #0x0039
	add	hl, de
	ld	d,(hl)
	push	af
	inc	sp
	push	de
	inc	sp
	push	bc
	call	_redibujarEntity
	pop	af
	pop	af
;src/entities/entities.c:971: redibujarEntity(&exp->ent,exp->ent.sw,exp->ent.sh);
	pop	bc
	push	bc
	inc	bc
	push	bc
	pop	iy
	ld	e,20 (iy)
	push	bc
	pop	iy
	ld	d,19 (iy)
	ld	a,e
	push	af
	inc	sp
	push	de
	inc	sp
	push	bc
	call	_redibujarEntity
	pop	af
	pop	af
;src/entities/entities.c:973: for(i = 0; i < NUM_ENEMIGOS; ++i){
	ld	-5 (ix),#0x00
	ld	-2 (ix),#0x00
	ld	-1 (ix),#0x00
00106$:
;src/entities/entities.c:974: if(enemigos[i].ent.cuadrante == mapaActual){
	ld	a,#<(_enemigos)
	add	a, -2 (ix)
	ld	e,a
	ld	a,#>(_enemigos)
	adc	a, -1 (ix)
	ld	d,a
	ld	hl,#0x0026
	add	hl,de
	ld	-4 (ix),l
	ld	-3 (ix),h
	ld	l, e
	ld	h, d
	ld	bc, #0x0042
	add	hl, bc
	ld	c,(hl)
	ld	a,(#_mapaActual + 0)
	sub	a, c
	jr	NZ,00107$
;src/entities/entities.c:975: redibujarEntity(&enemigos[i].ent, enemigos[i].ent.sw, enemigos[i].ent.sh);
	push	de
	pop	iy
	ld	c,58 (iy)
	ld	l, e
	ld	h, d
	push	bc
	ld	bc, #0x0039
	add	hl, bc
	pop	bc
	ld	h,(hl)
	ld	l,-4 (ix)
	ld	b,-3 (ix)
	push	de
	ld	a,c
	push	af
	inc	sp
	push	hl
	inc	sp
	ld	h, b
	push	hl
	call	_redibujarEntity
	pop	af
	pop	af
	pop	de
;src/entities/entities.c:976: redibujarEntity(&enemigos[i].bullet.ent, enemigos[i].bullet.ent.sw, enemigos[i].bullet.ent.sh);
	ld	c, e
	ld	b, d
	inc	bc
	inc	bc
	inc	bc
	push	de
	pop	iy
	ld	a,23 (iy)
	ex	de,hl
	ld	de, #0x0016
	add	hl, de
	ld	d,(hl)
	push	af
	inc	sp
	push	de
	inc	sp
	push	bc
	call	_redibujarEntity
	pop	af
	pop	af
00107$:
;src/entities/entities.c:973: for(i = 0; i < NUM_ENEMIGOS; ++i){
	ld	a,-2 (ix)
	add	a, #0x4E
	ld	-2 (ix),a
	ld	a,-1 (ix)
	adc	a, #0x00
	ld	-1 (ix),a
	inc	-5 (ix)
	ld	a,-5 (ix)
	sub	a, #0x03
	jr	C,00106$
	ld	sp, ix
	pop	ix
	ret
;src/entities/entities.c:983: TEnemy* getEnemies(){
;	---------------------------------
; Function getEnemies
; ---------------------------------
_getEnemies::
;src/entities/entities.c:984: return enemigos;
	ld	hl,#_enemigos
	ret
;src/entities/entities.c:987: TBase* getBases(){
;	---------------------------------
; Function getBases
; ---------------------------------
_getBases::
;src/entities/entities.c:988: return bases;
	ld	hl,#_bases
	ret
	.area _CODE
	.area _INITIALIZER
__xinit__count1:
	.db #0x00	; 0
__xinit__turno:
	.db #0x00	; 0
__xinit__bulletsTurno:
	.db #0x00	; 0
	.area _CABS (ABS)
