;--------------------------------------------------------
; File Created by SDCC : free open source ANSI-C Compiler
; Version 3.5.5 #9498 (Linux)
;--------------------------------------------------------
	.module main
	.optsdcc -mz80
	
;--------------------------------------------------------
; Public variables in this module
;--------------------------------------------------------
	.globl _main
	.globl _inicializar
	.globl _redibujarProta
	.globl _borrarProta
	.globl _comprobarTeclado
	.globl _moverDerecha
	.globl _moverIzquierda
	.globl _dibujarMapa
	.globl _dibujaRotulo
	.globl _dibujarProta
	.globl _interrupcion
	.globl _cpct_etm_setTileset2x4
	.globl _cpct_etm_drawTileBox2x4
	.globl _cpct_getScreenPtr
	.globl _cpct_setPALColour
	.globl _cpct_setPalette
	.globl _cpct_setVideoMode
	.globl _cpct_drawSpriteMaskedAlignedTable
	.globl _cpct_drawSprite
	.globl _cpct_isAnyKeyPressed
	.globl _cpct_isKeyPressed
	.globl _cpct_scanKeyboard_if
	.globl _cpct_setInterruptHandler
	.globl _cpct_disableFirmware
	.globl _mapa
	.globl _prota
;--------------------------------------------------------
; special function registers
;--------------------------------------------------------
;--------------------------------------------------------
; ram data
;--------------------------------------------------------
	.area _DATA
_prota::
	.ds 7
_mapa::
	.ds 2
_interrupcion_kk_1_77:
	.ds 1
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
;src/main.c:36: cpctm_createTransparentMaskTable(g_tablatrans,0x0100, M0, 0);
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
;src/main.c:51: void interrupcion() {
;	---------------------------------
; Function interrupcion
; ---------------------------------
_interrupcion::
;src/main.c:54: if (++kk == 5) {
	ld	hl, #_interrupcion_kk_1_77+0
	inc	(hl)
	ld	a,(#_interrupcion_kk_1_77 + 0)
	sub	a, #0x05
	ret	NZ
;src/main.c:56: cpct_scanKeyboard_if();
	call	_cpct_scanKeyboard_if
;src/main.c:57: kk = 0;
	ld	hl,#_interrupcion_kk_1_77 + 0
	ld	(hl), #0x00
	ret
;src/main.c:61: void dibujarProta(){
;	---------------------------------
; Function dibujarProta
; ---------------------------------
_dibujarProta::
;src/main.c:63: u8* pvmem	= cpct_getScreenPtr(CPCT_VMEM_START, prota.x, prota.y);
	ld	hl, #_prota + 1
	ld	d,(hl)
	ld	hl, #_prota + 0
	ld	b,(hl)
	push	de
	inc	sp
	push	bc
	inc	sp
	ld	hl,#0xC000
	push	hl
	call	_cpct_getScreenPtr
	ex	de,hl
;src/main.c:73: G_NAVE_0_H, g_tablatrans);
;src/main.c:72: cpct_drawSpriteMaskedAlignedTable (prota.sprite, pvmem, G_NAVE_0_W, 
	ld	bc, (#_prota + 4)
	ld	hl,#_g_tablatrans
	push	hl
	ld	hl,#0x1008
	push	hl
	push	de
	push	bc
	call	_cpct_drawSpriteMaskedAlignedTable
	ret
;src/main.c:78: void dibujaRotulo(){
;	---------------------------------
; Function dibujaRotulo
; ---------------------------------
_dibujaRotulo::
;src/main.c:79: cpct_drawSprite(g_retropolis_0, 
	ld	hl,#0x4228
	push	hl
	ld	hl,#0xC000
	push	hl
	ld	hl,#_g_retropolis_0
	push	hl
	call	_cpct_drawSprite
;src/main.c:82: cpct_drawSprite(g_retropolis_1,
	ld	hl,#0x4228
	push	hl
	ld	h, #0xC0
	push	hl
	ld	hl,#_g_retropolis_1
	push	hl
	call	_cpct_drawSprite
	ret
;src/main.c:88: void dibujarMapa(){
;	---------------------------------
; Function dibujarMapa
; ---------------------------------
_dibujarMapa::
;src/main.c:89: cpct_etm_drawTilemap2x4(g_map1_W, g_map1_H, cpctm_screenPtr(CPCT_VMEM_START,0,68)
	ld	hl,(_mapa)
	push	hl
	ld	hl,#0xE280
	push	hl
	ld	hl,#0x2821
	push	hl
	ld	l, #0x00
	push	hl
	xor	a, a
	push	af
	inc	sp
	call	_cpct_etm_drawTileBox2x4
	ret
;src/main.c:96: void moverIzquierda(){
;	---------------------------------
; Function moverIzquierda
; ---------------------------------
_moverIzquierda::
;src/main.c:97: if(prota.x > 0 ){
	ld	bc,#_prota+0
	ld	a,(bc)
	or	a, a
	ret	Z
;src/main.c:98: prota.x--;
	add	a,#0xFF
	ld	(bc),a
;src/main.c:99: prota.mover = SI;
	ld	hl,#(_prota + 0x0006)
	ld	(hl),#0x01
	ret
;src/main.c:103: void moverDerecha(){
;	---------------------------------
; Function moverDerecha
; ---------------------------------
_moverDerecha::
;src/main.c:104: if(prota.x < LIMITE_DERECHO){
	ld	hl,#_prota+0
	ld	c,(hl)
	ld	a,c
	sub	a, #0x48
	ret	NC
;src/main.c:105: prota.x++;
	inc	c
	ld	(hl),c
;src/main.c:106: prota.mover = SI;
	ld	hl,#(_prota + 0x0006)
	ld	(hl),#0x01
	ret
;src/main.c:110: void comprobarTeclado(){
;	---------------------------------
; Function comprobarTeclado
; ---------------------------------
_comprobarTeclado::
;src/main.c:112: cpct_scanKeyboard_if();
	call	_cpct_scanKeyboard_if
;src/main.c:113: if(cpct_isAnyKeyPressed()){
	call	_cpct_isAnyKeyPressed
	ld	a,l
	or	a, a
	ret	Z
;src/main.c:114: if(cpct_isKeyPressed(Key_CursorLeft)){
	ld	hl,#0x0101
	call	_cpct_isKeyPressed
	ld	a,l
	or	a, a
;src/main.c:115: moverIzquierda();
	jp	NZ,_moverIzquierda
;src/main.c:116: }else if(cpct_isKeyPressed(Key_CursorRight)){
	ld	hl,#0x0200
	call	_cpct_isKeyPressed
	ld	a,l
	or	a, a
	ret	Z
;src/main.c:117: moverDerecha();
	jp  _moverDerecha
;src/main.c:128: void borrarProta(){
;	---------------------------------
; Function borrarProta
; ---------------------------------
_borrarProta::
	push	ix
	ld	ix,#0
	add	ix,sp
	push	af
	dec	sp
;src/main.c:130: u8 w = 2 + (prota.px & 1);
	ld	hl, #_prota + 2
	ld	c,(hl)
	ld	a,c
	and	a, #0x01
	ld	b,a
	inc	b
	inc	b
;src/main.c:131: u8 h = 7 + (prota.py & 3 ? 1: 0);
	ld	hl, #_prota + 3
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
	ld	-3 (ix),a
;src/main.c:132: cpct_etm_drawTileBox2x4 (prota.px/2, (prota.py - ORIGEN_MAPA_Y)/4,w, h,g_map1_W,ORIGEN_MAPA,mapa);
	ld	iy,(_mapa)
	ld	d,#0x00
	ld	a,e
	add	a,#0xBC
	ld	-2 (ix),a
	ld	a,d
	adc	a,#0xFF
	ld	-1 (ix),a
	ld	l,-2 (ix)
	ld	h,-1 (ix)
	bit	7, -1 (ix)
	jr	Z,00105$
	ld	hl,#0xFFBF
	add	hl,de
00105$:
	sra	h
	rr	l
	sra	h
	rr	l
	ld	d,l
	srl	c
	push	iy
	ld	hl,#0xE280
	push	hl
	ld	a,#0x28
	push	af
	inc	sp
	ld	a,-3 (ix)
	push	af
	inc	sp
	push	bc
	inc	sp
	push	de
	inc	sp
	ld	a,c
	push	af
	inc	sp
	call	_cpct_etm_drawTileBox2x4
	ld	sp, ix
	pop	ix
	ret
;src/main.c:136: void redibujarProta(){
;	---------------------------------
; Function redibujarProta
; ---------------------------------
_redibujarProta::
;src/main.c:138: borrarProta();
	call	_borrarProta
;src/main.c:139: prota.px = prota.x;
	ld	bc,#_prota + 2
	ld	a, (#_prota + 0)
	ld	(bc),a
;src/main.c:140: prota.py = prota.y;
	ld	bc,#_prota + 3
	ld	a, (#_prota + 1)
	ld	(bc),a
;src/main.c:141: dibujarProta();
	jp  _dibujarProta
;src/main.c:148: void inicializar(){
;	---------------------------------
; Function inicializar
; ---------------------------------
_inicializar::
;src/main.c:150: cpct_disableFirmware();
	call	_cpct_disableFirmware
;src/main.c:151: cpct_setVideoMode(0);
	ld	l,#0x00
	call	_cpct_setVideoMode
;src/main.c:152: cpct_setBorder(HW_BLACK);
	ld	hl,#0x1410
	push	hl
	call	_cpct_setPALColour
;src/main.c:153: cpct_setPalette(g_palette, 16);
	ld	hl,#0x0010
	push	hl
	ld	hl,#_g_palette
	push	hl
	call	_cpct_setPalette
;src/main.c:155: prota.x = prota.px = 20;
	ld	hl,#(_prota + 0x0002)
	ld	(hl),#0x14
	ld	hl,#_prota
	ld	(hl),#0x14
;src/main.c:156: prota.y = prota.py = 160;
	ld	hl,#(_prota + 0x0003)
	ld	(hl),#0xA0
	ld	hl,#(_prota + 0x0001)
	ld	(hl),#0xA0
;src/main.c:157: prota.mover = NO;
	ld	hl,#(_prota + 0x0006)
	ld	(hl),#0x00
;src/main.c:158: prota.sprite = g_nave_0;
	ld	hl,#_g_nave_0
	ld	((_prota + 0x0004)), hl
;src/main.c:160: dibujaRotulo();
	call	_dibujaRotulo
;src/main.c:163: mapa = g_map1;
	ld	hl,#_g_map1+0
	ld	(_mapa),hl
;src/main.c:164: cpct_etm_setTileset2x4(g_tileset);
	ld	hl,#_g_tileset
	call	_cpct_etm_setTileset2x4
;src/main.c:165: dibujarMapa();
	call	_dibujarMapa
;src/main.c:167: dibujarProta();
	call	_dibujarProta
;src/main.c:169: cpct_setInterruptHandler(interrupcion);
	ld	hl,#_interrupcion
	call	_cpct_setInterruptHandler
	ret
;src/main.c:180: void main(void) {
;	---------------------------------
; Function main
; ---------------------------------
_main::
;src/main.c:182: inicializar();
	call	_inicializar
;src/main.c:186: while (1){
00104$:
;src/main.c:187: comprobarTeclado();
	call	_comprobarTeclado
;src/main.c:188: if(prota.mover){
	ld	a, (#(_prota + 0x0006) + 0)
	or	a, a
	jr	Z,00104$
;src/main.c:189: redibujarProta(); //es muy lento dibujarlo todo el rato
	call	_redibujarProta
;src/main.c:190: prota.mover = NO;
	ld	hl,#(_prota + 0x0006)
	ld	(hl),#0x00
	jr	00104$
	.area _CODE
	.area _INITIALIZER
	.area _CABS (ABS)