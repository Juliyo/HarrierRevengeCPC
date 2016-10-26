;--------------------------------------------------------
; File Created by SDCC : free open source ANSI-C Compiler
; Version 3.5.5 #9498 (Linux)
;--------------------------------------------------------
	.module wavemanager
	.optsdcc -mz80
	
;--------------------------------------------------------
; Public variables in this module
;--------------------------------------------------------
	.globl _getRandomUniform
	.globl _getEnemies
	.globl _contarEnemigos
	.globl _enemigos_actual
	.globl _seed
	.globl _d_samemap
	.globl _s_samemap
	.globl _mapaPrev
	.globl _aparecerEnemigo
	.globl _respawnearEnemigo
	.globl _inicializarWaveManager
	.globl _updateTiempoEnMapa
	.globl _resetearTimepoEnMapa
	.globl _respawnearEnemigoPorBorde
	.globl _posicionAleatoriaBorde
	.globl _revivirEnemigo
	.globl _restarEnemigo
;--------------------------------------------------------
; special function registers
;--------------------------------------------------------
;--------------------------------------------------------
; ram data
;--------------------------------------------------------
	.area _DATA
_mapaPrev::
	.ds 1
;--------------------------------------------------------
; ram data
;--------------------------------------------------------
	.area _INITIALIZED
_s_samemap::
	.ds 2
_d_samemap::
	.ds 2
_seed::
	.ds 1
_enemigos_actual::
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
;src/entities/wavemanager.c:18: void aparecerEnemigo(){
;	---------------------------------
; Function aparecerEnemigo
; ---------------------------------
_aparecerEnemigo::
;src/entities/wavemanager.c:23: if(contarEnemigos() == 0 && basesCapturadas >= 3){
	call	_contarEnemigos
	ld	a,l
	or	a, a
	ret	NZ
	ld	a,(#_basesCapturadas + 0)
	sub	a, #0x03
	ret	C
;src/entities/wavemanager.c:24: enemies = getEnemies();
	call	_getEnemies
;src/entities/wavemanager.c:26: random_number = getRandomUniform(seed)%3;
	push	hl
	ld	a,(_seed)
	push	af
	inc	sp
	call	_getRandomUniform
	inc	sp
	ld	d,l
	ld	a,#0x03
	push	af
	inc	sp
	push	de
	inc	sp
	call	__moduchar
	pop	af
	pop	bc
;src/entities/wavemanager.c:27: respawnearEnemigo(&enemies[random_number]);
	ld	e,l
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
	add	hl, hl
	add	hl,bc
	push	hl
	call	_respawnearEnemigo
	pop	af
	ret
;src/entities/wavemanager.c:31: void respawnearEnemigo(TEnemy* enemy){
;	---------------------------------
; Function respawnearEnemigo
; ---------------------------------
_respawnearEnemigo::
	push	ix
	ld	ix,#0
	add	ix,sp
	dec	sp
;src/entities/wavemanager.c:32: revivirEnemigo(enemy, getRandomUniform(seed)%70 + 5, getRandomUniform(seed)%141 + 50, getRandomUniform(seed)%3);
	ld	a,(_seed)
	push	af
	inc	sp
	call	_getRandomUniform
	inc	sp
	ld	b,l
	ld	a,#0x03
	push	af
	inc	sp
	push	bc
	inc	sp
	call	__moduchar
	pop	af
	ld	-1 (ix),l
	ld	a,(_seed)
	push	af
	inc	sp
	call	_getRandomUniform
	inc	sp
	ld	b,l
	ld	a,#0x8D
	push	af
	inc	sp
	push	bc
	inc	sp
	call	__moduchar
	pop	af
	ld	c,l
	ld	b,#0x00
	ld	hl,#0x0032
	add	hl,bc
	push	hl
	ld	a,(_seed)
	push	af
	inc	sp
	call	_getRandomUniform
	inc	sp
	ld	b,l
	ld	a,#0x46
	push	af
	inc	sp
	push	bc
	inc	sp
	call	__moduchar
	pop	af
	ld	c,l
	pop	de
	ld	b,#0x00
	inc	bc
	inc	bc
	inc	bc
	inc	bc
	inc	bc
	ld	a,-1 (ix)
	push	af
	inc	sp
	push	de
	push	bc
	ld	l,4 (ix)
	ld	h,5 (ix)
	push	hl
	call	_revivirEnemigo
	ld	hl,#7
	add	hl,sp
	ld	sp,hl
	inc	sp
	pop	ix
	ret
;src/entities/wavemanager.c:35: void inicializarWaveManager(){
;	---------------------------------
; Function inicializarWaveManager
; ---------------------------------
_inicializarWaveManager::
;src/entities/wavemanager.c:36: seed = 1;
	ld	hl,#_seed + 0
	ld	(hl), #0x01
;src/entities/wavemanager.c:37: s_samemap = 0;
	ld	hl,#0x0000
	ld	(_s_samemap),hl
;src/entities/wavemanager.c:38: d_samemap = 150;
	ld	l, #0x96
	ld	(_d_samemap),hl
;src/entities/wavemanager.c:39: enemigos_actual = NUM_ENEMIGOS;
	ld	hl,#_enemigos_actual + 0
	ld	(hl), #0x03
	ret
;src/entities/wavemanager.c:42: void updateTiempoEnMapa(){
;	---------------------------------
; Function updateTiempoEnMapa
; ---------------------------------
_updateTiempoEnMapa::
;src/entities/wavemanager.c:43: if(++s_samemap >= d_samemap){
	ld	hl, #_s_samemap+0
	inc	(hl)
	jr	NZ,00117$
	ld	hl, #_s_samemap+1
	inc	(hl)
00117$:
	ld	hl,#_d_samemap
	ld	a,(#_s_samemap + 0)
	sub	a, (hl)
	ld	a,(#_s_samemap + 1)
	inc	hl
	sbc	a, (hl)
	jr	C,00104$
;src/entities/wavemanager.c:44: if(contarEnemigos() == 0)
	call	_contarEnemigos
	ld	a,l
	or	a, a
	jr	NZ,00102$
;src/entities/wavemanager.c:45: respawnearEnemigoPorBorde();
	call	_respawnearEnemigoPorBorde
00102$:
;src/entities/wavemanager.c:46: s_samemap = 0;
	ld	hl,#0x0000
	ld	(_s_samemap),hl
00104$:
;src/entities/wavemanager.c:48: seed++;
	ld	hl, #_seed+0
	inc	(hl)
;src/entities/wavemanager.c:50: seed = 1;
	ret
;src/entities/wavemanager.c:52: void resetearTimepoEnMapa(){
;	---------------------------------
; Function resetearTimepoEnMapa
; ---------------------------------
_resetearTimepoEnMapa::
;src/entities/wavemanager.c:53: s_samemap = 0;
	ld	hl,#0x0000
	ld	(_s_samemap),hl
	ret
;src/entities/wavemanager.c:57: void respawnearEnemigoPorBorde(){
;	---------------------------------
; Function respawnearEnemigoPorBorde
; ---------------------------------
_respawnearEnemigoPorBorde::
;src/entities/wavemanager.c:61: random_number = getRandomUniform(seed)%3;
	ld	a,(_seed)
	push	af
	inc	sp
	call	_getRandomUniform
	inc	sp
	ld	b,l
	ld	a,#0x03
	push	af
	inc	sp
	push	bc
	inc	sp
	call	__moduchar
;src/entities/wavemanager.c:62: enemies = getEnemies();
	ex	(sp),hl
	call	_getEnemies
	ld	c,l
	ld	b,h
	pop	hl
;src/entities/wavemanager.c:67: posicionAleatoriaBorde(&enemies[random_number]);
	ld	e,l
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
	add	hl, hl
	add	hl,bc
	push	hl
	call	_posicionAleatoriaBorde
	pop	af
	ret
;src/entities/wavemanager.c:74: void posicionAleatoriaBorde(TEnemy* enemy){
;	---------------------------------
; Function posicionAleatoriaBorde
; ---------------------------------
_posicionAleatoriaBorde::
	push	ix
	ld	ix,#0
	add	ix,sp
	push	af
	push	af
;src/entities/wavemanager.c:78: switch(mapaActual){
	ld	a,#0x05
	ld	iy,#_mapaActual
	sub	a, 0 (iy)
	jp	C,00128$
;src/entities/wavemanager.c:97: revivirEnemigo(enemy, ANCHO - enemy->ent.sw, getRandomUniform(seed)%141 + 50, d_left);	
	ld	a,4 (ix)
	ld	-2 (ix),a
	ld	a,5 (ix)
	ld	-1 (ix),a
	ld	a,-2 (ix)
	add	a, #0x39
	ld	-4 (ix),a
	ld	a,-1 (ix)
	adc	a, #0x00
	ld	-3 (ix),a
;src/entities/wavemanager.c:99: revivirEnemigo(enemy, getRandomUniform(seed)%70 + 5, ALTO - enemy->ent.sh, d_up);
	ld	a,-2 (ix)
	add	a, #0x3A
	ld	c,a
	ld	a,-1 (ix)
	adc	a, #0x00
	ld	b,a
;src/entities/wavemanager.c:78: switch(mapaActual){
	ld	iy,#_mapaActual
	ld	e,0 (iy)
	ld	d,#0x00
	ld	hl,#00163$
	add	hl,de
	add	hl,de
	add	hl,de
	jp	(hl)
00163$:
	jp	00128$
	jp	00102$
	jp	00106$
	jp	00113$
	jp	00120$
	jp	00124$
;src/entities/wavemanager.c:80: case 0:													//Reaparece por arriba
;src/entities/wavemanager.c:83: break;
	jp	00128$
;src/entities/wavemanager.c:84: case 1:
00102$:
;src/entities/wavemanager.c:85: random_number = getRandomUniform(seed)%2;											//Aleatorio 0 o 1
	ld	a,(_seed)
	push	af
	inc	sp
	call	_getRandomUniform
	inc	sp
	ld	a,l
	and	a, #0x01
	ld	c,a
	ld	b,#0x00
;src/entities/wavemanager.c:86: if(random_number == 1){														//Reaparece por arriba
	dec	c
	jr	NZ,00104$
	ld	a,b
	or	a, a
	jr	NZ,00104$
;src/entities/wavemanager.c:87: revivirEnemigo(enemy, getRandomUniform(seed)%70 + 5, ORIGEN_MAPA_Y, d_down);
	ld	a,(_seed)
	push	af
	inc	sp
	call	_getRandomUniform
	inc	sp
	ld	b,l
	ld	a,#0x46
	push	af
	inc	sp
	push	bc
	inc	sp
	call	__moduchar
	pop	af
	ld	c,l
	ld	b,#0x00
	inc	bc
	inc	bc
	inc	bc
	inc	bc
	inc	bc
	ld	a,#0x02
	push	af
	inc	sp
	ld	hl,#0x0028
	push	hl
	push	bc
	ld	l,4 (ix)
	ld	h,5 (ix)
	push	hl
	call	_revivirEnemigo
	ld	hl,#7
	add	hl,sp
	ld	sp,hl
	jp	00128$
00104$:
;src/entities/wavemanager.c:89: revivirEnemigo(enemy, 0, getRandomUniform(seed)%141 + 50, d_right);	
	ld	a,(_seed)
	push	af
	inc	sp
	call	_getRandomUniform
	inc	sp
	ld	b,l
	ld	a,#0x8D
	push	af
	inc	sp
	push	bc
	inc	sp
	call	__moduchar
	pop	af
	ld	c,l
	ld	b,#0x00
	ld	hl,#0x0032
	add	hl,bc
	ld	c,l
	ld	b,h
	ld	a,#0x01
	push	af
	inc	sp
	push	bc
	ld	hl,#0x0000
	push	hl
	ld	l,4 (ix)
	ld	h,5 (ix)
	push	hl
	call	_revivirEnemigo
	ld	hl,#7
	add	hl,sp
	ld	sp,hl
;src/entities/wavemanager.c:91: break;
	jp	00128$
;src/entities/wavemanager.c:92: case 2:
00106$:
;src/entities/wavemanager.c:93: random_number = getRandomUniform(seed)%3 + 1;											//Aleatorio 0 o 1
	push	bc
	ld	a,(_seed)
	push	af
	inc	sp
	call	_getRandomUniform
	inc	sp
	ld	d,l
	ld	a,#0x03
	push	af
	inc	sp
	push	de
	inc	sp
	call	__moduchar
	pop	af
	pop	bc
	ld	h,#0x00
	inc	hl
;src/entities/wavemanager.c:94: if(random_number == 1){																				//Reaparece por arriba
	ld	a,l
	dec	a
	jr	NZ,00111$
	ld	a,h
	or	a, a
	jr	NZ,00111$
;src/entities/wavemanager.c:95: revivirEnemigo(enemy, getRandomUniform(seed)%70 + 5, ORIGEN_MAPA_Y, d_down);
	ld	a,(_seed)
	push	af
	inc	sp
	call	_getRandomUniform
	inc	sp
	ld	b,l
	ld	a,#0x46
	push	af
	inc	sp
	push	bc
	inc	sp
	call	__moduchar
	pop	af
	ld	c,l
	ld	b,#0x00
	inc	bc
	inc	bc
	inc	bc
	inc	bc
	inc	bc
	ld	a,#0x02
	push	af
	inc	sp
	ld	hl,#0x0028
	push	hl
	push	bc
	ld	l,4 (ix)
	ld	h,5 (ix)
	push	hl
	call	_revivirEnemigo
	ld	hl,#7
	add	hl,sp
	ld	sp,hl
	jp	00128$
00111$:
;src/entities/wavemanager.c:96: }else if(random_number == 2){																		//Reaparece por derecha
	ld	a,l
	sub	a,#0x02
	jr	NZ,00108$
	or	a,h
	jr	NZ,00108$
;src/entities/wavemanager.c:97: revivirEnemigo(enemy, ANCHO - enemy->ent.sw, getRandomUniform(seed)%141 + 50, d_left);	
	ld	a,(_seed)
	push	af
	inc	sp
	call	_getRandomUniform
	inc	sp
	ld	b,l
	ld	a,#0x8D
	push	af
	inc	sp
	push	bc
	inc	sp
	call	__moduchar
	pop	af
	ld	c,l
	ld	b,#0x00
	ld	hl,#0x0032
	add	hl,bc
	ld	c,l
	ld	b,h
	pop	hl
	push	hl
	ld	e,(hl)
	ld	d,#0x00
	ld	a,#0x50
	sub	a, e
	ld	e,a
	ld	a,#0x00
	sbc	a, d
	ld	d,a
	ld	a,#0x03
	push	af
	inc	sp
	push	bc
	push	de
	ld	l,-2 (ix)
	ld	h,-1 (ix)
	push	hl
	call	_revivirEnemigo
	ld	hl,#7
	add	hl,sp
	ld	sp,hl
	jp	00128$
00108$:
;src/entities/wavemanager.c:99: revivirEnemigo(enemy, getRandomUniform(seed)%70 + 5, ALTO - enemy->ent.sh, d_up);
	ld	a,(bc)
	ld	c,a
	ld	b,#0x00
	ld	a,#0xC8
	sub	a, c
	ld	c,a
	ld	a,#0x00
	sbc	a, b
	ld	b,a
	push	bc
	ld	a,(_seed)
	push	af
	inc	sp
	call	_getRandomUniform
	inc	sp
	ld	d,l
	ld	a,#0x46
	push	af
	inc	sp
	push	de
	inc	sp
	call	__moduchar
	pop	af
	ld	e,l
	pop	bc
	ld	d,#0x00
	inc	de
	inc	de
	inc	de
	inc	de
	inc	de
	xor	a, a
	push	af
	inc	sp
	push	bc
	push	de
	ld	l,-2 (ix)
	ld	h,-1 (ix)
	push	hl
	call	_revivirEnemigo
	ld	hl,#7
	add	hl,sp
	ld	sp,hl
;src/entities/wavemanager.c:101: break;
	jp	00128$
;src/entities/wavemanager.c:102: case 3:
00113$:
;src/entities/wavemanager.c:103: random_number = getRandomUniform(seed)%3 + 1;											//Aleatorio 0 o 1
	push	bc
	ld	a,(_seed)
	push	af
	inc	sp
	call	_getRandomUniform
	inc	sp
	ld	d,l
	ld	a,#0x03
	push	af
	inc	sp
	push	de
	inc	sp
	call	__moduchar
	pop	af
	pop	bc
	ld	h,#0x00
	inc	hl
;src/entities/wavemanager.c:104: if(random_number == 1){																				//Reaparece por arriba
	ld	a,l
	dec	a
	jr	NZ,00118$
	ld	a,h
	or	a, a
	jr	NZ,00118$
;src/entities/wavemanager.c:105: revivirEnemigo(enemy, getRandomUniform(seed)%70 + 5, ORIGEN_MAPA_Y, d_down);
	ld	a,(_seed)
	push	af
	inc	sp
	call	_getRandomUniform
	inc	sp
	ld	b,l
	ld	a,#0x46
	push	af
	inc	sp
	push	bc
	inc	sp
	call	__moduchar
	pop	af
	ld	c,l
	ld	b,#0x00
	inc	bc
	inc	bc
	inc	bc
	inc	bc
	inc	bc
	ld	a,#0x02
	push	af
	inc	sp
	ld	hl,#0x0028
	push	hl
	push	bc
	ld	l,4 (ix)
	ld	h,5 (ix)
	push	hl
	call	_revivirEnemigo
	ld	hl,#7
	add	hl,sp
	ld	sp,hl
	jp	00128$
00118$:
;src/entities/wavemanager.c:106: }else if(random_number == 2){																		//Reaparece por izquierda
	ld	a,l
	sub	a,#0x02
	jr	NZ,00115$
	or	a,h
	jr	NZ,00115$
;src/entities/wavemanager.c:107: revivirEnemigo(enemy, 0, getRandomUniform(seed)%141 + 50, d_right);		
	ld	a,(_seed)
	push	af
	inc	sp
	call	_getRandomUniform
	inc	sp
	ld	b,l
	ld	a,#0x8D
	push	af
	inc	sp
	push	bc
	inc	sp
	call	__moduchar
	pop	af
	ld	c,l
	ld	b,#0x00
	ld	hl,#0x0032
	add	hl,bc
	ld	c,l
	ld	b,h
	ld	a,#0x01
	push	af
	inc	sp
	push	bc
	ld	hl,#0x0000
	push	hl
	ld	l,4 (ix)
	ld	h,5 (ix)
	push	hl
	call	_revivirEnemigo
	ld	hl,#7
	add	hl,sp
	ld	sp,hl
	jp	00128$
00115$:
;src/entities/wavemanager.c:109: revivirEnemigo(enemy, getRandomUniform(seed)%70 + 5, ALTO - enemy->ent.sh, d_up);
	ld	a,(bc)
	ld	c,a
	ld	b,#0x00
	ld	a,#0xC8
	sub	a, c
	ld	c,a
	ld	a,#0x00
	sbc	a, b
	ld	b,a
	push	bc
	ld	a,(_seed)
	push	af
	inc	sp
	call	_getRandomUniform
	inc	sp
	ld	d,l
	ld	a,#0x46
	push	af
	inc	sp
	push	de
	inc	sp
	call	__moduchar
	pop	af
	ld	e,l
	pop	bc
	ld	d,#0x00
	inc	de
	inc	de
	inc	de
	inc	de
	inc	de
	xor	a, a
	push	af
	inc	sp
	push	bc
	push	de
	ld	l,-2 (ix)
	ld	h,-1 (ix)
	push	hl
	call	_revivirEnemigo
	ld	hl,#7
	add	hl,sp
	ld	sp,hl
;src/entities/wavemanager.c:111: break;
	jp	00128$
;src/entities/wavemanager.c:112: case 4:
00120$:
;src/entities/wavemanager.c:113: random_number = getRandomUniform(seed)%2;											//Aleatorio 0 o 1
	push	bc
	ld	a,(_seed)
	push	af
	inc	sp
	call	_getRandomUniform
	inc	sp
	pop	bc
	ld	a,l
	and	a, #0x01
	ld	e,a
	ld	d,#0x00
;src/entities/wavemanager.c:114: if(random_number == 1){														//Reaparece por abajo
	dec	e
	jr	NZ,00122$
	ld	a,d
	or	a, a
	jr	NZ,00122$
;src/entities/wavemanager.c:115: revivirEnemigo(enemy, getRandomUniform(seed)%70 + 5, ALTO - enemy->ent.sh, d_up);
	ld	a,(bc)
	ld	c,a
	ld	b,#0x00
	ld	a,#0xC8
	sub	a, c
	ld	c,a
	ld	a,#0x00
	sbc	a, b
	ld	b,a
	push	bc
	ld	a,(_seed)
	push	af
	inc	sp
	call	_getRandomUniform
	inc	sp
	ld	d,l
	ld	a,#0x46
	push	af
	inc	sp
	push	de
	inc	sp
	call	__moduchar
	pop	af
	ld	e,l
	pop	bc
	ld	d,#0x00
	inc	de
	inc	de
	inc	de
	inc	de
	inc	de
	xor	a, a
	push	af
	inc	sp
	push	bc
	push	de
	ld	l,-2 (ix)
	ld	h,-1 (ix)
	push	hl
	call	_revivirEnemigo
	ld	hl,#7
	add	hl,sp
	ld	sp,hl
	jp	00128$
00122$:
;src/entities/wavemanager.c:117: revivirEnemigo(enemy, ANCHO - enemy->ent.sw, getRandomUniform(seed)%141 + 50, d_left);	
	ld	a,(_seed)
	push	af
	inc	sp
	call	_getRandomUniform
	inc	sp
	ld	b,l
	ld	a,#0x8D
	push	af
	inc	sp
	push	bc
	inc	sp
	call	__moduchar
	pop	af
	ld	c,l
	ld	b,#0x00
	ld	hl,#0x0032
	add	hl,bc
	ld	c,l
	ld	b,h
	pop	hl
	push	hl
	ld	e,(hl)
	ld	d,#0x00
	ld	a,#0x50
	sub	a, e
	ld	e,a
	ld	a,#0x00
	sbc	a, d
	ld	d,a
	ld	a,#0x03
	push	af
	inc	sp
	push	bc
	push	de
	ld	l,-2 (ix)
	ld	h,-1 (ix)
	push	hl
	call	_revivirEnemigo
	ld	hl,#7
	add	hl,sp
	ld	sp,hl
;src/entities/wavemanager.c:119: break;
	jp	00128$
;src/entities/wavemanager.c:120: case 5:
00124$:
;src/entities/wavemanager.c:121: random_number = getRandomUniform(seed)%2;											//Aleatorio 0 o 1
	push	bc
	ld	a,(_seed)
	push	af
	inc	sp
	call	_getRandomUniform
	inc	sp
	pop	bc
	ld	a,l
	and	a, #0x01
	ld	e,a
	ld	d,#0x00
;src/entities/wavemanager.c:122: if(random_number == 1){														//Reaparece por izquierda
	dec	e
	jr	NZ,00126$
	ld	a,d
	or	a, a
	jr	NZ,00126$
;src/entities/wavemanager.c:123: revivirEnemigo(enemy, 0, getRandomUniform(seed)%141 + 50, d_right);	
	ld	a,(_seed)
	push	af
	inc	sp
	call	_getRandomUniform
	inc	sp
	ld	b,l
	ld	a,#0x8D
	push	af
	inc	sp
	push	bc
	inc	sp
	call	__moduchar
	pop	af
	ld	c,l
	ld	b,#0x00
	ld	hl,#0x0032
	add	hl,bc
	ld	c,l
	ld	b,h
	ld	a,#0x01
	push	af
	inc	sp
	push	bc
	ld	hl,#0x0000
	push	hl
	ld	l,4 (ix)
	ld	h,5 (ix)
	push	hl
	call	_revivirEnemigo
	ld	hl,#7
	add	hl,sp
	ld	sp,hl
	jr	00128$
00126$:
;src/entities/wavemanager.c:125: revivirEnemigo(enemy, getRandomUniform(seed)%70 + 5, ALTO - enemy->ent.sh, d_up);	
	ld	a,(bc)
	ld	c,a
	ld	b,#0x00
	ld	a,#0xC8
	sub	a, c
	ld	c,a
	ld	a,#0x00
	sbc	a, b
	ld	b,a
	push	bc
	ld	a,(_seed)
	push	af
	inc	sp
	call	_getRandomUniform
	inc	sp
	ld	d,l
	ld	a,#0x46
	push	af
	inc	sp
	push	de
	inc	sp
	call	__moduchar
	pop	af
	ld	e,l
	pop	bc
	ld	d,#0x00
	inc	de
	inc	de
	inc	de
	inc	de
	inc	de
	xor	a, a
	push	af
	inc	sp
	push	bc
	push	de
	ld	l,-2 (ix)
	ld	h,-1 (ix)
	push	hl
	call	_revivirEnemigo
	ld	hl,#7
	add	hl,sp
	ld	sp,hl
;src/entities/wavemanager.c:128: }
00128$:
;src/entities/wavemanager.c:130: enemigos_actual++;
	ld	hl, #_enemigos_actual+0
	inc	(hl)
	ld	sp, ix
	pop	ix
	ret
;src/entities/wavemanager.c:133: void revivirEnemigo(TEnemy* enemy, i16 x, i16 y, TPlayerDirection dir){
;	---------------------------------
; Function revivirEnemigo
; ---------------------------------
_revivirEnemigo::
	push	ix
	ld	ix,#0
	add	ix,sp
;src/entities/wavemanager.c:134: enemy->ent.vivo = SI;
	ld	c,4 (ix)
	ld	b,5 (ix)
	ld	hl,#0x0026
	add	hl,bc
	ex	de,hl
	ld	hl,#0x0041
	add	hl,bc
	ld	(hl),#0x01
;src/entities/wavemanager.c:135: enemy->ent.draw = SI;
	ld	hl,#0x0030
	add	hl,bc
	ld	(hl),#0x01
;src/entities/wavemanager.c:136: enemy->ent.x = x;
	ld	a,6 (ix)
	ld	(de),a
	inc	de
	ld	a,7 (ix)
	ld	(de),a
;src/entities/wavemanager.c:137: enemy->ent.y = y;
	ld	hl,#0x0028
	add	hl,bc
	ld	a,8 (ix)
	ld	(hl),a
	inc	hl
	ld	a,9 (ix)
	ld	(hl),a
;src/entities/wavemanager.c:138: enemy->ent.px = x;
	ld	hl,#0x002A
	add	hl,bc
	ld	a,6 (ix)
	ld	(hl),a
	inc	hl
	ld	a,7 (ix)
	ld	(hl),a
;src/entities/wavemanager.c:139: enemy->ent.py = y;
	ld	hl,#0x002C
	add	hl,bc
	ld	a,8 (ix)
	ld	(hl),a
	inc	hl
	ld	a,9 (ix)
	ld	(hl),a
;src/entities/wavemanager.c:140: enemy->ent.cuadrante = mapaActual;
	ld	hl,#0x0042
	add	hl,bc
	ld	a,(#_mapaActual + 0)
	ld	(hl),a
;src/entities/wavemanager.c:141: enemy->statusIA = s_mover;
	ld	hl,#0x0049
	add	hl,bc
	ld	(hl),#0x00
;src/entities/wavemanager.c:142: enemy->ent.curr_dir = dir;
	ld	hl,#0x003B
	add	hl,bc
	ld	a,10 (ix)
	ld	(hl),a
;src/entities/wavemanager.c:143: enemy->bullet.ent.cuadrante = mapaActual;
	ld	hl,#0x001F
	add	hl,bc
	ld	a,(#_mapaActual + 0)
	ld	(hl),a
	pop	ix
	ret
;src/entities/wavemanager.c:148: void restarEnemigo(){
;	---------------------------------
; Function restarEnemigo
; ---------------------------------
_restarEnemigo::
;src/entities/wavemanager.c:149: enemigos_actual--;
	ld	hl, #_enemigos_actual+0
	dec	(hl)
	ret
	.area _CODE
	.area _INITIALIZER
__xinit__s_samemap:
	.dw #0x0000
__xinit__d_samemap:
	.dw #0x0096
__xinit__seed:
	.db #0x01	; 1
__xinit__enemigos_actual:
	.db #0x03	; 3
	.area _CABS (ABS)
