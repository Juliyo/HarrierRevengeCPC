;--------------------------------------------------------
; File Created by SDCC : free open source ANSI-C Compiler
; Version 3.5.5 #9498 (Linux)
;--------------------------------------------------------
	.module game
	.optsdcc -mz80
	
;--------------------------------------------------------
; Public variables in this module
;--------------------------------------------------------
	.globl _dibujarPuntos
	.globl _explosionBala
	.globl _getBases
	.globl _getEnemies
	.globl _calculaAllEntities
	.globl _calculaEntity
	.globl _drawAll
	.globl _dibujarEntity
	.globl _borrarEntity
	.globl _updateY
	.globl _updateX
	.globl _updatePlayer
	.globl _disparar
	.globl _playerHerido
	.globl _accion
	.globl _incializarEntities
	.globl _restarEnemigo
	.globl _aparecerEnemigo
	.globl _resetearTimepoEnMapa
	.globl _cpct_etm_setTileset2x4
	.globl _cpct_etm_drawTileBox2x4
	.globl _cpct_getScreenPtr
	.globl _cpct_waitVSYNC
	.globl _cpct_drawStringM0
	.globl _cpct_drawSolidBox
	.globl _cpct_isAnyKeyPressed
	.globl _cpct_isKeyPressed
	.globl _cpct_scanKeyboard_if
	.globl _cpct_memset
	.globl _sprintf
	.globl _count
	.globl _wshot_cycles
	.globl _prev_basesCapturadas
	.globl _basesCapturadas
	.globl _salirMenu
	.globl _previousMap
	.globl _mapaActual
	.globl _mapa
	.globl _mapas
	.globl _hearth
	.globl _player
	.globl _inicializarPantalla
	.globl _dibujarMapa
	.globl _resetearDrawEnemigos
	.globl _cambiarMapa
	.globl _resetearBala
	.globl _cambiarDerecha
	.globl _cambiarIzquierda
	.globl _cambiarArriba
	.globl _cambiarAbajo
	.globl _updateUser
	.globl _checkCollision
	.globl _calculaColisiones
	.globl _drawHUD
	.globl _dibujarBase
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
_mapaActual::
	.ds 1
_previousMap::
	.ds 1
_salirMenu::
	.ds 1
_basesCapturadas::
	.ds 1
_prev_basesCapturadas::
	.ds 1
_wshot_cycles::
	.ds 1
_count::
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
;src/game.c:116: void inicializarPantalla(){
;	---------------------------------
; Function inicializarPantalla
; ---------------------------------
_inicializarPantalla::
;src/game.c:119: TEntity* ent = &hearth;
;src/game.c:121: cpct_clearScreen(0);
	ld	hl,#0x4000
	push	hl
	xor	a, a
	push	af
	inc	sp
	ld	h, #0xC0
	push	hl
	call	_cpct_memset
;src/game.c:122: mapaActual = 0;
	ld	hl,#_mapaActual + 0
	ld	(hl), #0x00
;src/game.c:123: previousMap = 0;
	ld	hl,#_previousMap + 0
	ld	(hl), #0x00
;src/game.c:124: mapa = g_map11;
	ld	hl,#_g_map11+0
	ld	(_mapa),hl
;src/game.c:125: cpct_etm_setTileset2x4(g_tileset);
	ld	hl,#_g_tileset
	call	_cpct_etm_setTileset2x4
;src/game.c:126: dibujarMapa();
	call	_dibujarMapa
;src/game.c:127: cpct_drawStringM0("Score: 000",cpct_getScreenPtr(CPCT_VMEM_START,36,23),2,0);
	ld	hl,#0x1724
	push	hl
	ld	hl,#0xC000
	push	hl
	call	_cpct_getScreenPtr
	ld	c,l
	ld	b,h
	ld	hl,#0x0002
	push	hl
	push	bc
	ld	hl,#___str_0
	push	hl
	call	_cpct_drawStringM0
	ld	hl,#6
	add	hl,sp
	ld	sp,hl
;src/game.c:128: cpct_drawStringM0("Bases:   0",cpct_getScreenPtr(CPCT_VMEM_START,36,5),2,0);
	ld	hl,#0x0524
	push	hl
	ld	hl,#0xC000
	push	hl
	call	_cpct_getScreenPtr
	ld	c,l
	ld	b,h
	ld	hl,#0x0002
	push	hl
	push	bc
	ld	hl,#___str_1
	push	hl
	call	_cpct_drawStringM0
	ld	hl,#6
	add	hl,sp
	ld	sp,hl
;src/game.c:129: for(i = 0; i < player.vida; ++i){
	ld	c,#0x00
00103$:
	ld	hl, #(_player + 0x0049) + 0
	ld	b,(hl)
	ld	a,c
	sub	a, b
	jr	NC,00101$
;src/game.c:130: ent->vmem = cpct_getScreenPtr(CPCT_VMEM_START,ent->x, ent->y);
	ld	hl,#_hearth
	inc	hl
	inc	hl
	ld	e,(hl)
	inc	hl
	ld	d,(hl)
	ld	b,e
	ld	hl, (#_hearth + 0)
	ld	d,l
	push	bc
	ld	c, d
	push	bc
	ld	hl,#0xC000
	push	hl
	call	_cpct_getScreenPtr
	ld	e,l
	ld	d,h
	pop	bc
	ld	((_hearth + 0x0021)), de
;src/game.c:131: dibujarEntity(ent,ent->sw,ent->sh);
	ld	hl,#_hearth + 20
	ld	b, (hl)
	ld	hl,#_hearth
	ld	de, #0x0013
	add	hl, de
	ld	d,(hl)
	push	bc
	ld	c, d
	push	bc
	ld	hl,#_hearth
	push	hl
	call	_dibujarEntity
	pop	af
	pop	af
	pop	bc
;src/game.c:132: ent->x+=10;
	ld	de, (#_hearth + 0)
	ld	hl,#0x000A
	add	hl,de
	ld	e,l
	ld	d,h
	ld	(_hearth), de
;src/game.c:129: for(i = 0; i < player.vida; ++i){
	inc	c
	jr	00103$
00101$:
;src/game.c:135: count = 0;
	ld	hl,#_count + 0
	ld	(hl), #0x00
;src/game.c:136: ent->x = 2;
	ld	hl,#0x0002
	ld	(_hearth), hl
	ret
_player:
	.db #0x00	; 0
	.db #0x01	; 1
	.db #0x00	; 0
	.dw #0x0000
	.dw #0x0000
	.dw #0x0000
	.dw #0x0000
	.db #0x03	; 3
	.db #0x06	; 6
	.db #0x00	; 0
	.dw _g_bala_0
	.dw _g_bala_1
	.dw _g_bala_2
	.dw _g_bala_3
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
	.dw #0x000A
	.dw #0x00AA
	.dw #0x000A
	.dw #0x00AA
	.db #0x01	; 1
	.db #0x02	; 2
	.db #0x01	; 1
	.dw _g_naves_0
	.dw _g_naves_1
	.dw _g_naves_2
	.dw _g_naves_3
	.db #0x06	; 6
	.db #0x0C	; 12
	.db #0x00	; 0
	.db #0x01	; 1
	.db #0x0A	; 10
	.db #0xAA	; 170
	.db #0x06	; 6
	.db #0x0C	; 12
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.dw #0x0000
	.db #0x03	; 3
	.db #0x03	; 3
	.dw #0x0000
	.dw #0x0000
_hearth:
	.dw #0x0002
	.dw #0x000A
	.dw #0x0002
	.dw #0x000A
	.db #0x01	; 1
	.db #0x01	; 1
	.db #0x01	; 1
	.dw _g_hearth
	.dw #0x0000
	.dw #0x0000
	.dw #0x0000
	.db #0x09	; 9
	.db #0x10	; 16
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
_mapas:
	.dw _g_map11
	.dw _g_map12
	.dw _g_map21
	.dw _g_map22
	.dw _g_map31
	.dw _g_map32
___str_0:
	.ascii "Score: 000"
	.db 0x00
___str_1:
	.ascii "Bases:   0"
	.db 0x00
;src/game.c:142: void dibujarMapa(){
;	---------------------------------
; Function dibujarMapa
; ---------------------------------
_dibujarMapa::
;src/game.c:143: cpct_etm_drawTilemap2x4(g_map11_W, g_map11_H, ORIGEN_MAPA, mapa);
	ld	hl,(_mapa)
	push	hl
	ld	hl,#0xC190
	push	hl
	ld	hl,#0x2828
	push	hl
	ld	l, #0x00
	push	hl
	xor	a, a
	push	af
	inc	sp
	call	_cpct_etm_drawTileBox2x4
	ret
;src/game.c:145: void resetearDrawEnemigos(){
;	---------------------------------
; Function resetearDrawEnemigos
; ---------------------------------
_resetearDrawEnemigos::
	push	ix
	ld	ix,#0
	add	ix,sp
	push	af
	dec	sp
;src/game.c:148: enemigos = getEnemies();
	call	_getEnemies
	inc	sp
	inc	sp
	push	hl
;src/game.c:149: for(i=0;i<NUM_ENEMIGOS;++i){
	ld	-1 (ix),#0x00
	ld	de,#0x0000
00104$:
;src/game.c:150: if(enemigos[i].ent.vivo == 1)
	ld	a,-3 (ix)
	add	a, e
	ld	c,a
	ld	a,-2 (ix)
	adc	a, d
	ld	b,a
	ld	l, c
	ld	h, b
	push	bc
	ld	bc, #0x0041
	add	hl, bc
	pop	bc
	ld	l,(hl)
	dec	l
	jr	NZ,00105$
;src/game.c:151: enemigos[i].ent.draw = SI;
	ld	hl,#0x0030
	add	hl,bc
	ld	(hl),#0x01
00105$:
;src/game.c:149: for(i=0;i<NUM_ENEMIGOS;++i){
	ld	hl,#0x004E
	add	hl,de
	ex	de,hl
	inc	-1 (ix)
	ld	a,-1 (ix)
	sub	a, #0x03
	jr	C,00104$
	ld	sp, ix
	pop	ix
	ret
;src/game.c:154: u8 cambiarMapa(u8 suma, u8 cantidad){
;	---------------------------------
; Function cambiarMapa
; ---------------------------------
_cambiarMapa::
	push	ix
	ld	ix,#0
	add	ix,sp
;src/game.c:156: if(suma % 2 != 0){ //tengo que sumar
	bit	0, 4 (ix)
	jr	Z,00102$
;src/game.c:157: mapaActual = mapaActual + cantidad;
	ld	hl,#_mapaActual
	ld	a,(hl)
	add	a, 5 (ix)
	ld	(hl),a
;src/game.c:158: mapa = mapas[mapaActual];
	ld	bc,#_mapas+0
	ld	iy,#_mapaActual
	ld	l,0 (iy)
	ld	h,#0x00
	add	hl, hl
	add	hl,bc
	ld	a,(hl)
	ld	iy,#_mapa
	ld	0 (iy),a
	inc	hl
	ld	a,(hl)
	ld	(#_mapa + 1),a
;src/game.c:159: dibujarMapa();
	call	_dibujarMapa
	jr	00103$
00102$:
;src/game.c:161: mapaActual = mapaActual - cantidad;
	ld	hl,#_mapaActual
	ld	a,(hl)
	sub	a, 5 (ix)
	ld	(hl),a
;src/game.c:162: mapa = mapas[mapaActual];
	ld	bc,#_mapas+0
	ld	iy,#_mapaActual
	ld	l,0 (iy)
	ld	h,#0x00
	add	hl, hl
	add	hl,bc
	ld	a,(hl)
	ld	iy,#_mapa
	ld	0 (iy),a
	inc	hl
	ld	a,(hl)
	ld	(#_mapa + 1),a
;src/game.c:163: dibujarMapa();
	call	_dibujarMapa
00103$:
;src/game.c:165: resetearDrawEnemigos();
	call	_resetearDrawEnemigos
;src/game.c:166: resetearBala(&player.bullet);
	ld	hl,#_player
	push	hl
	call	_resetearBala
	pop	af
;src/game.c:167: base = &bases[mapaActual];
	ld	bc,#_bases+0
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
;src/game.c:168: base->ent.draw = SI;
	ld	bc,#0x000E
	add	hl,bc
	ld	(hl),#0x01
;src/game.c:170: return mapaActual;
	ld	iy,#_mapaActual
	ld	l,0 (iy)
	pop	ix
	ret
;src/game.c:172: void resetearBala(TBullet* bullet){
;	---------------------------------
; Function resetearBala
; ---------------------------------
_resetearBala::
;src/game.c:176: bullet->ent.draw = NO;
	pop	de
	pop	bc
	push	bc
	push	de
	ld	hl,#0x000D
	add	hl,bc
	ld	(hl),#0x00
;src/game.c:177: bullet->ent.vivo = NO;
	ld	hl,#0x001E
	add	hl,bc
	ld	(hl),#0x00
;src/game.c:178: bullet->state = es_static;
	inc	bc
	inc	bc
	xor	a, a
	ld	(bc),a
	ret
;src/game.c:181: void cambiarDerecha(TEntity* ent){
;	---------------------------------
; Function cambiarDerecha
; ---------------------------------
_cambiarDerecha::
;src/game.c:182: if(mapaActual >= 0 && mapaActual < 6 && mapaActual % 2 == 0){ //pongo a mano el numero de mapas que hay en total y se mueve si son pares
	ld	a,(#_mapaActual + 0)
	sub	a, #0x06
	ret	NC
	ld	hl,#_mapaActual+0
	bit	0, (hl)
	ret	NZ
;src/game.c:183: mapaActual = cambiarMapa(1,1);
	ld	hl,#0x0101
	push	hl
	call	_cambiarMapa
	pop	af
	ld	iy,#_mapaActual
	ld	0 (iy),l
;src/game.c:184: ent->cuadrante = mapaActual;
	pop	de
	pop	bc
	push	bc
	push	de
	ld	hl,#0x001C
	add	hl,bc
	ld	a,(#_mapaActual + 0)
	ld	(hl),a
;src/game.c:185: updateX(ent,0); //esto es para cambiar la posision del player cuando cambia de mapa.
	ld	hl,#0x0000
	push	hl
	push	bc
	call	_updateX
	pop	af
	pop	af
;src/game.c:186: aparecerEnemigo();
	jp  _aparecerEnemigo
;src/game.c:190: void cambiarIzquierda(TEntity* ent){
;	---------------------------------
; Function cambiarIzquierda
; ---------------------------------
_cambiarIzquierda::
;src/game.c:191: if(mapaActual >= 0 && mapaActual < 6 && mapaActual % 2 != 0){ //pongo a mano el numero de mapas que hay en total y se mueve si son impares
	ld	a,(#_mapaActual + 0)
	sub	a, #0x06
	ret	NC
	ld	hl,#_mapaActual+0
	bit	0, (hl)
	ret	Z
;src/game.c:192: mapaActual = cambiarMapa(0,1);
	ld	hl,#0x0100
	push	hl
	call	_cambiarMapa
	pop	af
	ld	iy,#_mapaActual
	ld	0 (iy),l
;src/game.c:193: ent->cuadrante = mapaActual;
	pop	de
	pop	bc
	push	bc
	push	de
	ld	hl,#0x001C
	add	hl,bc
	ld	a,(#_mapaActual + 0)
	ld	(hl),a
;src/game.c:194: updateX(ent,74);//80-6 == ancho del mapa - ancho sprite(en bytes), poner en variables
	ld	hl,#0x004A
	push	hl
	push	bc
	call	_updateX
	pop	af
	pop	af
;src/game.c:195: aparecerEnemigo();
	jp  _aparecerEnemigo
;src/game.c:199: void cambiarArriba(TEntity* ent){
;	---------------------------------
; Function cambiarArriba
; ---------------------------------
_cambiarArriba::
;src/game.c:200: if(mapaActual >= 0 && mapaActual < 4){//desde los 4 primeros mapas puedo subir
	ld	a,(#_mapaActual + 0)
	sub	a, #0x04
	ret	NC
;src/game.c:201: mapaActual = cambiarMapa(1,2);
	ld	hl,#0x0201
	push	hl
	call	_cambiarMapa
	pop	af
	ld	iy,#_mapaActual
	ld	0 (iy),l
;src/game.c:202: ent->cuadrante = mapaActual;
	pop	de
	pop	bc
	push	bc
	push	de
	ld	hl,#0x001C
	add	hl,bc
	ld	a,(#_mapaActual + 0)
	ld	(hl),a
;src/game.c:203: updateY(ent, 188);ent->y = 188;//200-12 == alto del mapa - alto sprite, poner en variables
	push	bc
	ld	hl,#0x00BC
	push	hl
	push	bc
	call	_updateY
	pop	af
	pop	af
	pop	bc
	inc	bc
	inc	bc
	ld	h,b
	ld	l, c
	ld	(hl),#0xBC
	inc	hl
	ld	(hl),#0x00
;src/game.c:204: aparecerEnemigo();
	jp  _aparecerEnemigo
;src/game.c:209: void cambiarAbajo(TEntity* ent){
;	---------------------------------
; Function cambiarAbajo
; ---------------------------------
_cambiarAbajo::
;src/game.c:210: if(mapaActual > 1 && mapaActual < 6){ //desde los 4 ultimos mapas puedo bajar
	ld	a,#0x01
	ld	iy,#_mapaActual
	sub	a, 0 (iy)
	ret	NC
	ld	a,(#_mapaActual + 0)
	sub	a, #0x06
	ret	NC
;src/game.c:211: mapaActual = cambiarMapa(0,2);
	ld	hl,#0x0200
	push	hl
	call	_cambiarMapa
	pop	af
	ld	iy,#_mapaActual
	ld	0 (iy),l
;src/game.c:212: ent->cuadrante = mapaActual;
	pop	de
	pop	bc
	push	bc
	push	de
	ld	hl,#0x001C
	add	hl,bc
	ld	a,(#_mapaActual + 0)
	ld	(hl),a
;src/game.c:213: updateY(ent, 40); //en 40 comienza el mapa a pintarse
	ld	hl,#0x0028
	push	hl
	push	bc
	call	_updateY
	pop	af
	pop	af
;src/game.c:214: aparecerEnemigo();
	jp  _aparecerEnemigo
;src/game.c:218: void updateUser(){
;	---------------------------------
; Function updateUser
; ---------------------------------
_updateUser::
;src/game.c:219: TPlayer* p = &player;
;src/game.c:221: cpct_scanKeyboard_if();
	call	_cpct_scanKeyboard_if
;src/game.c:222: if(cpct_isAnyKeyPressed()){
	call	_cpct_isAnyKeyPressed
	ld	a, l
	or	a, a
	ret	Z
;src/game.c:223: if(cpct_isKeyPressed(Key_Space)){
	ld	hl,#0x8005
	call	_cpct_isKeyPressed
;src/game.c:224: disparar(&player.bullet, player.ent.x, player.ent.y, player.ent.curr_dir);
;src/game.c:223: if(cpct_isKeyPressed(Key_Space)){
	ld	a,l
	or	a, a
	jr	Z,00102$
;src/game.c:224: disparar(&player.bullet, player.ent.x, player.ent.y, player.ent.curr_dir);
	ld	hl, #_player + 59
	ld	c,(hl)
	ld	de, (#_player + 40)
	ld	hl, (#(_player + 0x0026) + 0)
	ld	b,l
	ld	d, c
	push	de
	push	bc
	inc	sp
	ld	hl,#_player
	push	hl
	call	_disparar
	pop	af
	pop	af
	inc	sp
00102$:
;src/game.c:226: if(cpct_isKeyPressed(Key_CursorUp)){
	ld	hl,#0x0100
	call	_cpct_isKeyPressed
;src/game.c:229: p->bullet.ent.cuadrante = mapaActual;
;src/game.c:227: if(accion(&player.ent, es_mover, d_up) == d_up){
	ld	bc,#(_player + 0x0026)
;src/game.c:229: p->bullet.ent.cuadrante = mapaActual;
;src/game.c:226: if(cpct_isKeyPressed(Key_CursorUp)){
	ld	a,l
	or	a, a
	jr	Z,00123$
;src/game.c:227: if(accion(&player.ent, es_mover, d_up) == d_up){
	ld	hl,#0x0001
	push	hl
	push	bc
	call	_accion
	pop	af
	pop	af
	ld	a,l
	or	a, a
	ret	NZ
;src/game.c:228: cambiarArriba(&player.ent);
	ld	hl,#(_player + 0x0026)
	push	hl
	call	_cambiarArriba
	pop	af
;src/game.c:229: p->bullet.ent.cuadrante = mapaActual;
	ld	hl,#(_player + 0x001f)
	ld	a,(#_mapaActual + 0)
	ld	(hl),a
	ret
00123$:
;src/game.c:231: }else if(cpct_isKeyPressed(Key_CursorDown)){
	push	bc
	ld	hl,#0x0400
	call	_cpct_isKeyPressed
	pop	bc
	ld	a,l
	or	a, a
	jr	Z,00120$
;src/game.c:232: if(accion(&player.ent, es_mover, d_down) == d_down){
	ld	hl,#0x0201
	push	hl
	push	bc
	call	_accion
	pop	af
	pop	af
	ld	a,l
	sub	a, #0x02
	ret	NZ
;src/game.c:233: cambiarAbajo(&player.ent);
	ld	hl,#(_player + 0x0026)
	push	hl
	call	_cambiarAbajo
	pop	af
;src/game.c:234: p->bullet.ent.cuadrante = mapaActual;
	ld	hl,#(_player + 0x001f)
	ld	a,(#_mapaActual + 0)
	ld	(hl),a
	ret
00120$:
;src/game.c:236: }else if(cpct_isKeyPressed(Key_CursorRight)){
	push	bc
	ld	hl,#0x0200
	call	_cpct_isKeyPressed
	pop	bc
	ld	a,l
	or	a, a
	jr	Z,00117$
;src/game.c:237: if(accion(&player.ent,es_mover,d_right) == d_right){
	ld	hl,#0x0101
	push	hl
	push	bc
	call	_accion
	pop	af
	pop	af
	dec	l
	ret	NZ
;src/game.c:238: cambiarDerecha(&player.ent);
	ld	hl,#(_player + 0x0026)
	push	hl
	call	_cambiarDerecha
	pop	af
;src/game.c:239: p->bullet.ent.cuadrante = mapaActual;
	ld	hl,#(_player + 0x001f)
	ld	a,(#_mapaActual + 0)
	ld	(hl),a
	ret
00117$:
;src/game.c:241: }else if(cpct_isKeyPressed(Key_CursorLeft)){
	push	bc
	ld	hl,#0x0101
	call	_cpct_isKeyPressed
	pop	bc
	ld	a,l
	or	a, a
	jr	Z,00114$
;src/game.c:242: if(accion(&player.ent,es_mover,d_left) == d_left){
	ld	hl,#0x0301
	push	hl
	push	bc
	call	_accion
	pop	af
	pop	af
	ld	a,l
	sub	a, #0x03
	ret	NZ
;src/game.c:243: cambiarIzquierda(&player.ent);
	ld	hl,#(_player + 0x0026)
	push	hl
	call	_cambiarIzquierda
	pop	af
;src/game.c:244: p->bullet.ent.cuadrante = mapaActual;
	ld	hl,#(_player + 0x001f)
	ld	a,(#_mapaActual + 0)
	ld	(hl),a
	ret
00114$:
;src/game.c:246: }else if(cpct_isKeyPressed(Key_Esc)){
	ld	hl,#0x0408
	call	_cpct_isKeyPressed
	ld	a,l
	or	a, a
	ret	Z
;src/game.c:247: salirMenu = 1;
	ld	hl,#_salirMenu + 0
	ld	(hl), #0x01
	ret
;src/game.c:253: u8 checkCollision(TCollision *col1, TCollision *col2){
;	---------------------------------
; Function checkCollision
; ---------------------------------
_checkCollision::
	push	ix
	ld	ix,#0
	add	ix,sp
	ld	hl,#-9
	add	hl,sp
	ld	sp,hl
;src/game.c:255: if (col1->x < col2->x + col2->w &&
	ld	a,4 (ix)
	ld	-4 (ix),a
	ld	a,5 (ix)
	ld	-3 (ix),a
	ld	l,-4 (ix)
	ld	h,-3 (ix)
	ld	c,(hl)
	ld	a,6 (ix)
	ld	-6 (ix),a
	ld	a,7 (ix)
	ld	-5 (ix),a
	ld	l,-6 (ix)
	ld	h,-5 (ix)
	ld	b,(hl)
	ld	-8 (ix),b
	ld	-7 (ix),#0x00
	ld	l,-6 (ix)
	ld	h,-5 (ix)
	inc	hl
	inc	hl
	ld	e,(hl)
	ld	d,#0x00
	ld	l,-8 (ix)
	ld	h,-7 (ix)
	add	hl,de
	ld	-2 (ix),c
	ld	-1 (ix),#0x00
	ld	a,-2 (ix)
	sub	a, l
	ld	a,-1 (ix)
	sbc	a, h
	jp	PO, 00125$
	xor	a, #0x80
00125$:
	jp	P,00102$
;src/game.c:256: col1->x + col1->w > col2->x &&
	ld	l,-4 (ix)
	ld	h,-3 (ix)
	inc	hl
	inc	hl
	ld	c,(hl)
	ld	b,#0x00
	ld	l,-2 (ix)
	ld	h,-1 (ix)
	add	hl,bc
	ld	a,-8 (ix)
	sub	a, l
	ld	a,-7 (ix)
	sbc	a, h
	jp	PO, 00126$
	xor	a, #0x80
00126$:
	jp	P,00102$
;src/game.c:257: col1->y < col2->y + col2->h &&
	ld	a,-4 (ix)
	ld	-2 (ix),a
	ld	a,-3 (ix)
	ld	-1 (ix),a
	ld	l,-2 (ix)
	ld	h,-1 (ix)
	inc	hl
	ld	a,(hl)
	ld	-2 (ix),a
	ld	a,-6 (ix)
	ld	-8 (ix),a
	ld	a,-5 (ix)
	ld	-7 (ix),a
	ld	l,-8 (ix)
	ld	h,-7 (ix)
	inc	hl
	ld	a,(hl)
	ld	-8 (ix), a
	ld	-8 (ix),a
	ld	-7 (ix),#0x00
	ld	l,-6 (ix)
	ld	h,-5 (ix)
	inc	hl
	inc	hl
	inc	hl
	ld	a,(hl)
	ld	-6 (ix), a
	ld	-6 (ix),a
	ld	-5 (ix),#0x00
	ld	a,-8 (ix)
	add	a, -6 (ix)
	ld	-6 (ix),a
	ld	a,-7 (ix)
	adc	a, -5 (ix)
	ld	-5 (ix),a
	ld	a,-2 (ix)
	ld	-2 (ix),a
	ld	-1 (ix),#0x00
	ld	a,-2 (ix)
	sub	a, -6 (ix)
	ld	a,-1 (ix)
	sbc	a, -5 (ix)
	jp	PO, 00127$
	xor	a, #0x80
00127$:
	jp	P,00102$
;src/game.c:258: col1->h + col1->y > col2->y) {
	ld	a,-4 (ix)
	ld	-6 (ix),a
	ld	a,-3 (ix)
	ld	-5 (ix),a
	ld	l,-6 (ix)
	ld	h,-5 (ix)
	inc	hl
	inc	hl
	inc	hl
	ld	a,(hl)
	ld	-6 (ix), a
	ld	-6 (ix),a
	ld	-5 (ix),#0x00
	ld	a,-6 (ix)
	add	a, -2 (ix)
	ld	-2 (ix),a
	ld	a,-5 (ix)
	adc	a, -1 (ix)
	ld	-1 (ix),a
	ld	a,-8 (ix)
	sub	a, -2 (ix)
	ld	a,-7 (ix)
	sbc	a, -1 (ix)
	jp	PO, 00128$
	xor	a, #0x80
00128$:
	jp	P,00102$
;src/game.c:260: collide = 1;
	ld	-9 (ix),#0x01
	jr	00103$
00102$:
;src/game.c:262: collide = 0;
	ld	-9 (ix),#0x00
00103$:
;src/game.c:266: return collide;
	ld	l,-9 (ix)
	ld	sp, ix
	pop	ix
	ret
;src/game.c:269: void calculaColisiones(){
;	---------------------------------
; Function calculaColisiones
; ---------------------------------
_calculaColisiones::
	push	ix
	ld	ix,#0
	add	ix,sp
	ld	hl,#-11
	add	hl,sp
	ld	sp,hl
;src/game.c:275: p = &player;
;src/game.c:276: enemigos = getEnemies();
	call	_getEnemies
	ld	-10 (ix),l
	ld	-9 (ix),h
;src/game.c:277: bases = getBases();
	call	_getBases
	ld	-8 (ix),l
	ld	-7 (ix),h
;src/game.c:279: for(i=0;i<NUM_ENEMIGOS;++i){
	ld	-11 (ix),#0x00
	ld	-2 (ix),#0x00
	ld	-1 (ix),#0x00
	ld	-4 (ix),#0x00
	ld	-3 (ix),#0x00
00131$:
;src/game.c:280: if(mapaActual == enemigos[i].ent.cuadrante && enemigos[i].ent.vivo == 1){
	ld	a,-10 (ix)
	add	a, -4 (ix)
	ld	-6 (ix),a
	ld	a,-9 (ix)
	adc	a, -3 (ix)
	ld	-5 (ix),a
	ld	l,-6 (ix)
	ld	h,-5 (ix)
	ld	de, #0x0042
	add	hl, de
	ld	c,(hl)
	ld	a,(#_mapaActual + 0)
	sub	a, c
	jr	NZ,00104$
	ld	l,-6 (ix)
	ld	h,-5 (ix)
	ld	de, #0x0041
	add	hl, de
	ld	c,(hl)
	dec	c
	jr	NZ,00104$
;src/game.c:281: collide = checkCollision(&player.ent.coll, &enemigos[i].ent.coll);
	ld	a,-6 (ix)
	add	a, #0x3D
	ld	c,a
	ld	a,-5 (ix)
	adc	a, #0x00
	ld	b,a
	push	bc
	ld	hl,#(_player + 0x003d)
	push	hl
	call	_checkCollision
	pop	af
	pop	af
;src/game.c:282: if(collide){
	ld	a,l
	or	a, a
	jr	Z,00104$
;src/game.c:283: playerHerido(&player);
	ld	hl,#_player
	push	hl
	call	_playerHerido
	pop	af
;src/game.c:284: break;
	jr	00112$
00104$:
;src/game.c:287: if(enemigos[i].ent.vivo == 1 && enemigos[i].bullet.ent.cuadrante == mapaActual && enemigos[i].bullet.ent.vivo){
	ld	a,-10 (ix)
	add	a, -2 (ix)
	ld	c,a
	ld	a,-9 (ix)
	adc	a, -1 (ix)
	ld	b,a
	push	bc
	pop	iy
	ld	e,65 (iy)
	dec	e
	jr	NZ,00132$
	push	bc
	pop	iy
	ld	e,31 (iy)
	ld	a,(#_mapaActual + 0)
	sub	a, e
	jr	NZ,00132$
	push	bc
	pop	iy
	ld	a,30 (iy)
	or	a, a
	jr	Z,00132$
;src/game.c:289: collide = checkCollision(&enemigos[i].bullet.ent.coll, &player.ent.coll);
	ld	hl,#0x001A
	add	hl,bc
	ld	bc,#(_player + 0x003d)
	push	bc
	push	hl
	call	_checkCollision
	pop	af
	pop	af
;src/game.c:290: if(collide){
	ld	a,l
	or	a, a
	jr	Z,00132$
;src/game.c:291: playerHerido(&player);
	ld	hl,#_player
	push	hl
	call	_playerHerido
	pop	af
;src/game.c:292: break;
	jr	00112$
00132$:
;src/game.c:279: for(i=0;i<NUM_ENEMIGOS;++i){
	ld	a,-2 (ix)
	add	a, #0x4E
	ld	-2 (ix),a
	ld	a,-1 (ix)
	adc	a, #0x00
	ld	-1 (ix),a
	ld	a,-4 (ix)
	add	a, #0x4E
	ld	-4 (ix),a
	ld	a,-3 (ix)
	adc	a, #0x00
	ld	-3 (ix),a
	inc	-11 (ix)
	ld	a,-11 (ix)
	sub	a, #0x03
	jp	C,00131$
00112$:
;src/game.c:298: if(player.bullet.ent.vivo == SI){
	ld	hl, #_player + 30
	ld	c,(hl)
;src/game.c:310: p->puntuacion = p->puntuacion + 100;
;src/game.c:298: if(player.bullet.ent.vivo == SI){
	dec	c
	jp	NZ,00120$
;src/game.c:300: for(i=0;i<NUM_ENEMIGOS;++i){
	ld	-11 (ix),#0x00
	ld	-6 (ix),#0x00
	ld	-5 (ix),#0x00
00133$:
;src/game.c:301: if(mapaActual == enemigos[i].ent.cuadrante && enemigos[i].ent.vivo == 1){
	ld	a,-10 (ix)
	add	a, -6 (ix)
	ld	c,a
	ld	a,-9 (ix)
	adc	a, -5 (ix)
	ld	b,a
	ld	hl,#0x0026
	add	hl,bc
	ex	de,hl
	push	bc
	pop	iy
	ld	a,66 (iy)
	ld	-4 (ix),a
	ld	a,(#_mapaActual + 0)
	sub	a, -4 (ix)
	jp	NZ,00134$
	ld	hl,#0x0041
	add	hl,bc
	ld	-4 (ix),l
	ld	-3 (ix),h
	ld	l,-4 (ix)
	ld	h,-3 (ix)
	ld	l,(hl)
	dec	l
	jr	NZ,00134$
;src/game.c:302: collide = checkCollision(&player.bullet.ent.coll, &enemigos[i].ent.coll);
	ld	hl,#0x003D
	add	hl,bc
	push	bc
	push	de
	push	hl
	ld	hl,#(_player + 0x001a)
	push	hl
	call	_checkCollision
	pop	af
	pop	af
	pop	de
	pop	bc
;src/game.c:303: if(collide){
	ld	a,l
	or	a, a
	jr	Z,00134$
;src/game.c:305: explosionBala(&player.bullet);
	push	bc
	push	de
	ld	hl,#_player
	push	hl
	call	_explosionBala
	pop	af
	call	_restarEnemigo
	pop	de
	push	de
	ld	a,#0x01
	push	af
	inc	sp
	push	de
	call	_calculaEntity
	pop	af
	inc	sp
	pop	de
	pop	bc
;src/game.c:308: enemigos[i].ent.draw = SI;
	ld	hl,#0x0030
	add	hl,bc
	ld	-2 (ix),l
	ld	-1 (ix),h
	ld	l,-2 (ix)
	ld	h,-1 (ix)
	ld	(hl),#0x01
;src/game.c:309: borrarEntity(&enemigos[i].ent);
	push	bc
	push	de
	call	_borrarEntity
	pop	af
	pop	bc
;src/game.c:310: p->puntuacion = p->puntuacion + 100;
	ld	de, (#(_player + 0x004b) + 0)
	ld	hl,#0x0064
	add	hl,de
	ld	e,l
	ld	d,h
	ld	((_player + 0x004b)), de
;src/game.c:311: enemigos[i].ent.vivo = 0;
	ld	l,-4 (ix)
	ld	h,-3 (ix)
	ld	(hl),#0x00
;src/game.c:312: enemigos[i].ent.draw = NO;
	ld	l,-2 (ix)
	ld	h,-1 (ix)
	ld	(hl),#0x00
;src/game.c:313: enemigos[i].bullet.ent.vivo = NO;
	ld	hl,#0x001E
	add	hl,bc
	ld	(hl),#0x00
;src/game.c:314: enemigos[i].bullet.ent.draw = NO;
	ld	hl,#0x000D
	add	hl,bc
	ld	(hl),#0x00
;src/game.c:316: resetearTimepoEnMapa();
	call	_resetearTimepoEnMapa
;src/game.c:317: break;
	jr	00120$
00134$:
;src/game.c:300: for(i=0;i<NUM_ENEMIGOS;++i){
	ld	a,-6 (ix)
	add	a, #0x4E
	ld	-6 (ix),a
	ld	a,-5 (ix)
	adc	a, #0x00
	ld	-5 (ix),a
	inc	-11 (ix)
	ld	a,-11 (ix)
	sub	a, #0x03
	jp	C,00133$
00120$:
;src/game.c:326: collide = checkCollision(&player.ent.coll, &bases[mapaActual].ent.coll);
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
	ld	e,-8 (ix)
	ld	d,-7 (ix)
	add	hl,de
	ld	bc,#0x001B
	add	hl,bc
	push	hl
	ld	hl,#(_player + 0x003d)
	push	hl
	call	_checkCollision
	pop	af
	pop	af
;src/game.c:328: if(collide){
	ld	a, l
	or	a, a
	jp	Z,00135$
;src/game.c:329: bases[mapaActual].ent.draw = SI;
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
	ld	e,-8 (ix)
	ld	d,-7 (ix)
	add	hl,de
	ld	bc,#0x000E
	add	hl,bc
	ld	(hl),#0x01
;src/game.c:330: p->ent.draw = SI;
	ld	hl,#(_player + 0x0030)
	ld	(hl),#0x01
;src/game.c:333: if(bases[mapaActual].whom == 1){
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
	ld	e,-8 (ix)
	ld	d,-7 (ix)
	add	hl,de
	ld	c,(hl)
	dec	c
	jp	NZ,00135$
;src/game.c:335: bases[mapaActual].cycles++;
	inc	hl
	inc	hl
	inc	hl
	ld	c,(hl)
	inc	c
	ld	(hl),c
;src/game.c:336: if(bases[mapaActual].cycles >= bases[mapaActual].waitCycles){
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
	ld	a,l
	add	a, -8 (ix)
	ld	c,a
	ld	a,h
	adc	a, -7 (ix)
	ld	b,a
	ld	l, c
	ld	h, b
	inc	hl
	inc	hl
	inc	hl
	ld	e,(hl)
	ld	l, c
	ld	h, b
	inc	hl
	inc	hl
	ld	c,(hl)
	ld	a,e
	sub	a, c
	jp	C,00135$
;src/game.c:338: basesCapturadas++; //Aumentamos la cuenta de bases capturadas
	ld	iy,#_basesCapturadas
	inc	0 (iy)
;src/game.c:340: if(wshot_cycles >= 5)
	ld	a,(#_wshot_cycles + 0)
	sub	a, #0x05
	jr	C,00122$
;src/game.c:341: wshot_cycles -= 7;
	ld	hl,#_wshot_cycles
	ld	a,(hl)
	add	a,#0xF9
	ld	(hl),a
00122$:
;src/game.c:342: p->puntuacion = p->puntuacion + 500;
	ld	bc, (#(_player + 0x004b) + 0)
	ld	hl,#0x01F4
	add	hl,bc
	ld	c,l
	ld	b,h
	ld	((_player + 0x004b)), bc
;src/game.c:343: bases[mapaActual].whom = 0;
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
	ld	e,-8 (ix)
	ld	d,-7 (ix)
	add	hl,de
	ld	(hl),#0x00
;src/game.c:344: bases[mapaActual].ent.sprites[0] = g_capturada;
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
	ld	e,-8 (ix)
	ld	d,-7 (ix)
	add	hl,de
	ld	bc,#0x000F
	add	hl,bc
	ld	bc,#_g_capturada+0
	ld	(hl),c
	inc	hl
	ld	(hl),b
;src/game.c:345: bases[mapaActual].ent.draw = SI;
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
	ld	e,-8 (ix)
	ld	d,-7 (ix)
	add	hl,de
	ld	bc,#0x000E
	add	hl,bc
	ld	(hl),#0x01
;src/game.c:346: if(p->vida + 1 <= 3){
	ld	hl,#_player + 73
	ld	c,(hl)
	ld	e,c
	ld	d,#0x00
	inc	de
	ld	a,#0x03
	cp	a, e
	ld	a,#0x00
	sbc	a, d
	jp	PO, 00225$
	xor	a, #0x80
00225$:
	jp	M,00135$
;src/game.c:347: p->vida++;
	inc	c
	ld	(hl),c
00135$:
	ld	sp, ix
	pop	ix
	ret
;src/game.c:362: void drawHUD(){
;	---------------------------------
; Function drawHUD
; ---------------------------------
_drawHUD::
;src/game.c:364: TPlayer* p = &player;
;src/game.c:365: TEntity* ent = &hearth;
;src/game.c:367: if(player.vida != player.pvida){
	ld	hl, #(_player + 0x0049) + 0
	ld	c,(hl)
	ld	hl, #_player + 74
	ld	b,(hl)
	ld	a,c
	sub	a, b
	jp	Z,00106$
;src/game.c:370: ent->vmem = cpct_getScreenPtr(CPCT_VMEM_START,ent->x, ent->y);
;src/game.c:371: dibujarEntity(ent,ent->sw,ent->sh);
;src/game.c:368: if(player.vida > player.pvida){
	ld	a,b
	sub	a, c
	jr	NC,00103$
;src/game.c:369: for(i = 0; i < player.vida; ++i){
	ld	c,#0x00
00108$:
	ld	hl, #(_player + 0x0049) + 0
	ld	b,(hl)
	ld	a,c
	sub	a, b
	jr	NC,00104$
;src/game.c:370: ent->vmem = cpct_getScreenPtr(CPCT_VMEM_START,ent->x, ent->y);
	ld	hl, (#(_hearth + 0x0002) + 0)
	ld	b,l
	ld	hl, (#_hearth + 0)
	ld	a,l
	push	bc
	push	bc
	inc	sp
	push	af
	inc	sp
	ld	hl,#0xC000
	push	hl
	call	_cpct_getScreenPtr
	ld	e,l
	ld	d,h
	pop	bc
	ld	((_hearth + 0x0021)), de
;src/game.c:371: dibujarEntity(ent,ent->sw,ent->sh);
	ld	hl, #(_hearth + 0x0014) + 0
	ld	b,(hl)
	ld	hl, #(_hearth + 0x0013) + 0
	ld	d,(hl)
	push	bc
	ld	c, d
	push	bc
	ld	hl,#_hearth
	push	hl
	call	_dibujarEntity
	pop	af
	pop	af
	pop	bc
;src/game.c:372: ent->x+=10;
	ld	de, (#_hearth + 0)
	ld	hl,#0x000A
	add	hl,de
	ld	e,l
	ld	d,h
	ld	(_hearth), de
;src/game.c:369: for(i = 0; i < player.vida; ++i){
	inc	c
	jr	00108$
00103$:
;src/game.c:380: ,ent->sh
	ld	hl, #(_hearth + 0x0014) + 0
	ld	d,(hl)
;src/game.c:379: ,ent->sw
	ld	hl, #(_hearth + 0x0013) + 0
	ld	e,(hl)
;src/game.c:377: cpct_getScreenPtr(CPCT_VMEM_START,2 + 10*(player.vida),ent->y)
	ld	hl, (#(_hearth + 0x0002) + 0)
	ld	b,l
	ld	a,c
	add	a, a
	add	a, a
	add	a, c
	add	a, a
	add	a, #0x02
	push	de
	push	bc
	inc	sp
	push	af
	inc	sp
	ld	hl,#0xC000
	push	hl
	call	_cpct_getScreenPtr
	ld	c,l
	ld	b,h
	xor	a, a
	push	af
	inc	sp
	push	bc
	call	_cpct_drawSolidBox
	pop	af
	pop	af
	inc	sp
00104$:
;src/game.c:383: ent->x = 2;
	ld	hl,#0x0002
	ld	(_hearth), hl
;src/game.c:384: p->pvida = p->vida;
	ld	hl,#_player + 73
	ld	c, (hl)
	ld	hl,#(_player + 0x004a)
	ld	(hl),c
00106$:
;src/game.c:387: dibujarPuntos();
	call	_dibujarPuntos
;src/game.c:388: dibujarBase();
	call	_dibujarBase
	ret
;src/game.c:390: void dibujarBase(){
;	---------------------------------
; Function dibujarBase
; ---------------------------------
_dibujarBase::
	push	ix
	ld	ix,#0
	add	ix,sp
	push	af
	push	af
;src/game.c:392: if(basesCapturadas != prev_basesCapturadas){
	ld	a,(#_basesCapturadas + 0)
	ld	iy,#_prev_basesCapturadas
	sub	a, 0 (iy)
	jr	Z,00103$
;src/game.c:395: cpct_getScreenPtr(CPCT_VMEM_START,71,5)
	ld	hl,#0x0547
	push	hl
	ld	hl,#0xC000
	push	hl
	call	_cpct_getScreenPtr
	ld	c,l
	ld	b,h
	ld	hl,#0x0806
	push	hl
	xor	a, a
	push	af
	inc	sp
	push	bc
	call	_cpct_drawSolidBox
	pop	af
	pop	af
	inc	sp
;src/game.c:400: sprintf(strPts,"%d",basesCapturadas);
	ld	hl,#_basesCapturadas + 0
	ld	e, (hl)
	ld	d,#0x00
	ld	hl,#0x0000
	add	hl,sp
	push	hl
	push	de
	ld	de,#___str_2
	push	de
	push	hl
	call	_sprintf
	ld	hl,#6
	add	hl,sp
	ld	sp,hl
	ld	hl,#0x0547
	push	hl
	ld	hl,#0xC000
	push	hl
	call	_cpct_getScreenPtr
	ex	de,hl
	pop	bc
	ld	hl,#0x0002
	push	hl
	push	de
	push	bc
	call	_cpct_drawStringM0
	ld	hl,#6
	add	hl,sp
	ld	sp,hl
;src/game.c:402: prev_basesCapturadas = basesCapturadas;
	ld	a,(#_basesCapturadas + 0)
	ld	(#_prev_basesCapturadas + 0),a
00103$:
	ld	sp, ix
	pop	ix
	ret
___str_2:
	.ascii "%d"
	.db 0x00
;src/game.c:405: void dibujarPuntos(){
;	---------------------------------
; Function dibujarPuntos
; ---------------------------------
_dibujarPuntos::
	push	ix
	ld	ix,#0
	add	ix,sp
	push	af
	push	af
;src/game.c:406: TPlayer* p = &player;
;src/game.c:408: if(p->puntuacion != p->puntuacionPrev){
	ld	bc, (#(_player + 0x004b) + 0)
	ld	de, (#(_player + 0x004d) + 0)
	ld	a,c
	sub	a, e
	jr	NZ,00109$
	ld	a,b
	sub	a, d
	jr	Z,00103$
00109$:
;src/game.c:412: cpct_getScreenPtr(CPCT_VMEM_START,63,23)
	ld	hl,#0x173F
	push	hl
	ld	hl,#0xC000
	push	hl
	call	_cpct_getScreenPtr
	ld	c,l
	ld	b,h
	ld	hl,#0x0814
	push	hl
	xor	a, a
	push	af
	inc	sp
	push	bc
	call	_cpct_drawSolidBox
	pop	af
	pop	af
	inc	sp
;src/game.c:417: sprintf(strPts,"%d",p->puntuacion);
	ld	de, (#(_player + 0x004b) + 0)
	ld	hl,#0x0000
	add	hl,sp
	push	hl
	push	de
	ld	de,#___str_3
	push	de
	push	hl
	call	_sprintf
	ld	hl,#6
	add	hl,sp
	ld	sp,hl
	ld	hl,#0x173F
	push	hl
	ld	hl,#0xC000
	push	hl
	call	_cpct_getScreenPtr
	ex	de,hl
	pop	bc
	ld	hl,#0x0002
	push	hl
	push	de
	push	bc
	call	_cpct_drawStringM0
	ld	hl,#6
	add	hl,sp
	ld	sp,hl
;src/game.c:419: p->puntuacionPrev = p->puntuacion;
	ld	bc, (#(_player + 0x004b) + 0)
	ld	((_player + 0x004d)), bc
00103$:
	ld	sp, ix
	pop	ix
	ret
___str_3:
	.ascii "%d"
	.db 0x00
;src/game.c:423: void play(){
;	---------------------------------
; Function play
; ---------------------------------
_play::
;src/game.c:425: salirMenu = 0;
	ld	hl,#_salirMenu + 0
	ld	(hl), #0x00
;src/game.c:426: incializarEntities(&player);
	ld	hl,#_player
	push	hl
	call	_incializarEntities
	pop	af
;src/game.c:427: inicializarPantalla();
	call	_inicializarPantalla
;src/game.c:430: while(player.vida>0){
00105$:
	ld	a, (#_player + 73)
	or	a, a
	ret	Z
;src/game.c:431: updateUser();
	call	_updateUser
;src/game.c:432: updatePlayer(&player);
	ld	hl,#_player
	push	hl
	call	_updatePlayer
	pop	af
;src/game.c:433: updateEntities();
	call	_updateEntities
;src/game.c:435: calculaColisiones();
	call	_calculaColisiones
;src/game.c:436: calculaAllEntities(&player);
	ld	hl,#_player
	push	hl
	call	_calculaAllEntities
	pop	af
;src/game.c:438: cpct_waitVSYNC();
	call	_cpct_waitVSYNC
;src/game.c:440: drawAll(&player);
	ld	hl,#_player
	push	hl
	call	_drawAll
	pop	af
;src/game.c:441: drawHUD();
	call	_drawHUD
;src/game.c:443: if(salirMenu % 2 == 1){
	ld	a,(#_salirMenu + 0)
	and	a, #0x01
	dec	a
	ret	Z
;src/game.c:445: return;
	jr	00102$
00102$:
;src/game.c:447: if(basesCapturadas == 6){
	ld	a,(#_basesCapturadas + 0)
	sub	a, #0x06
	jr	NZ,00105$
;src/game.c:448: salirMenu = 1;
	ld	hl,#_salirMenu + 0
	ld	(hl), #0x01
;src/game.c:449: return;
	ret
	.area _CODE
	.area _INITIALIZER
__xinit__mapa:
	.dw #0x0000
__xinit__mapaActual:
	.db #0x00	; 0
__xinit__previousMap:
	.db #0x00	; 0
__xinit__salirMenu:
	.db #0x00	; 0
__xinit__basesCapturadas:
	.db #0x00	; 0
__xinit__prev_basesCapturadas:
	.db #0x00	; 0
__xinit__wshot_cycles:
	.db #0x1E	; 30
__xinit__count:
	.db #0x00	; 0
	.area _CABS (ABS)
