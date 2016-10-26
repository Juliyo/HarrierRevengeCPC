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
	.globl _menu
	.globl _inicializar
	.globl _interrupcion
	.globl _playmusic
	.globl _play
	.globl _cpct_akp_musicPlay
	.globl _cpct_akp_musicInit
	.globl _cpct_getScreenPtr
	.globl _cpct_setPALColour
	.globl _cpct_setPalette
	.globl _cpct_setVideoMode
	.globl _cpct_drawStringM0
	.globl _cpct_drawSprite
	.globl _cpct_isKeyPressed
	.globl _cpct_scanKeyboard_if
	.globl _cpct_scanKeyboard_f
	.globl _cpct_memset
	.globl _cpct_setInterruptHandler
	.globl _cpct_disableFirmware
	.globl _mostrarMenu
;--------------------------------------------------------
; special function registers
;--------------------------------------------------------
;--------------------------------------------------------
; ram data
;--------------------------------------------------------
	.area _DATA
_interrupcion_kk_1_84:
	.ds 1
;--------------------------------------------------------
; ram data
;--------------------------------------------------------
	.area _INITIALIZED
_mostrarMenu::
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
;src/main.c:30: void playmusic() {
;	---------------------------------
; Function playmusic
; ---------------------------------
_playmusic::
;src/main.c:45: __endasm;
	exx
	.db	#0x08
	push	af
	push	bc
	push	de
	push	hl
	call	_cpct_akp_musicPlay
	pop	hl
	pop	de
	pop	bc
	pop	af
	.db	#0x08
	exx
	ret
;src/main.c:48: void interrupcion() {
;	---------------------------------
; Function interrupcion
; ---------------------------------
_interrupcion::
;src/main.c:51: if (++kk == 5) {
	ld	hl, #_interrupcion_kk_1_84+0
	inc	(hl)
	ld	a,(#_interrupcion_kk_1_84 + 0)
	sub	a, #0x05
	ret	NZ
;src/main.c:52: playmusic();
	call	_playmusic
;src/main.c:53: cpct_scanKeyboard_if();
	call	_cpct_scanKeyboard_if
;src/main.c:54: kk = 0;
	ld	hl,#_interrupcion_kk_1_84 + 0
	ld	(hl), #0x00
	ret
;src/main.c:57: void inicializar(){
;	---------------------------------
; Function inicializar
; ---------------------------------
_inicializar::
;src/main.c:58: cpct_disableFirmware();
	call	_cpct_disableFirmware
;src/main.c:59: cpct_setBorder(HW_BLACK);
	ld	hl,#0x1410
	push	hl
	call	_cpct_setPALColour
;src/main.c:60: cpct_setPalette(g_palette,16);
	ld	hl,#0x0010
	push	hl
	ld	hl,#_g_palette
	push	hl
	call	_cpct_setPalette
;src/main.c:63: cpct_setVideoMode(0);
	ld	l,#0x00
	call	_cpct_setVideoMode
;src/main.c:65: cpct_akp_musicInit(g_mysong);    // Initialize the music
	ld	hl,#_g_mysong
	push	hl
	call	_cpct_akp_musicInit
	pop	af
;src/main.c:66: cpct_setInterruptHandler(interrupcion);
	ld	hl,#_interrupcion
	call	_cpct_setInterruptHandler
	ret
;src/main.c:69: void menu(){
;	---------------------------------
; Function menu
; ---------------------------------
_menu::
;src/main.c:72: cpct_clearScreen(0);
	ld	hl,#0x4000
	push	hl
	xor	a, a
	push	af
	inc	sp
	ld	h, #0xC0
	push	hl
	call	_cpct_memset
;src/main.c:73: cpct_drawSprite (g_flores1_0,
	ld	hl,#0x0A28
	push	hl
	ld	hl,#0xC000
	push	hl
	ld	hl,#_g_flores1_0
	push	hl
	call	_cpct_drawSprite
;src/main.c:76: cpct_drawSprite (g_flores1_1,
	ld	hl,#0x0A28
	push	hl
	ld	h, #0xC0
	push	hl
	ld	hl,#_g_flores1_1
	push	hl
	call	_cpct_drawSprite
;src/main.c:80: cpct_drawSprite (g_flores2_0,
	ld	hl,#0x0A28
	push	hl
	ld	hl,#0xE6E0
	push	hl
	ld	hl,#_g_flores2_0
	push	hl
	call	_cpct_drawSprite
;src/main.c:83: cpct_drawSprite (g_flores2_1,
	ld	hl,#0x0A28
	push	hl
	ld	hl,#0xE708
	push	hl
	ld	hl,#_g_flores2_1
	push	hl
	call	_cpct_drawSprite
;src/main.c:87: cpct_drawSprite (g_portada_0,
	ld	hl,#0x4228
	push	hl
	ld	hl,#0xD050
	push	hl
	ld	hl,#_g_portada_0
	push	hl
	call	_cpct_drawSprite
;src/main.c:90: cpct_drawSprite (g_portada_1,
	ld	hl,#0x4228
	push	hl
	ld	hl,#0xD078
	push	hl
	ld	hl,#_g_portada_1
	push	hl
	call	_cpct_drawSprite
;src/main.c:94: cpct_drawStringM0("PRESS ENTER", cpct_getScreenPtr(CPCT_VMEM_START, 17, 160), 6, 0);
	ld	hl,#0xA011
	push	hl
	ld	hl,#0xC000
	push	hl
	call	_cpct_getScreenPtr
	ld	c,l
	ld	b,h
	ld	hl,#0x0006
	push	hl
	push	bc
	ld	hl,#___str_0
	push	hl
	call	_cpct_drawStringM0
	ld	hl,#6
	add	hl,sp
	ld	sp,hl
;src/main.c:95: if(player.vida == 0){
	ld	a, (#(_player + 0x0049) + 0)
	or	a, a
	jr	NZ,00102$
;src/main.c:96: cpct_drawStringM0("GAME OVER", cpct_getScreenPtr(CPCT_VMEM_START, 20, 110), 3, 0);
	ld	hl,#0x6E14
	push	hl
	ld	hl,#0xC000
	push	hl
	call	_cpct_getScreenPtr
	ld	c,l
	ld	b,h
	ld	hl,#0x0003
	push	hl
	push	bc
	ld	hl,#___str_1
	push	hl
	call	_cpct_drawStringM0
	ld	hl,#6
	add	hl,sp
	ld	sp,hl
00102$:
;src/main.c:98: if(basesCapturadas == 6){
	ld	a,(#_basesCapturadas + 0)
	sub	a, #0x06
	jr	NZ,00105$
;src/main.c:99: cpct_drawStringM0("YOU WON!", cpct_getScreenPtr(CPCT_VMEM_START, 24, 110), 3, 0);
	ld	hl,#0x6E18
	push	hl
	ld	hl,#0xC000
	push	hl
	call	_cpct_getScreenPtr
	ld	c,l
	ld	b,h
	ld	hl,#0x0003
	push	hl
	push	bc
	ld	hl,#___str_2
	push	hl
	call	_cpct_drawStringM0
	ld	hl,#6
	add	hl,sp
	ld	sp,hl
;src/main.c:101: do{
00105$:
;src/main.c:102: cpct_scanKeyboard_f();
	call	_cpct_scanKeyboard_f
;src/main.c:103: }while(!cpct_isKeyPressed(Key_Enter));
	ld	hl,#0x4000
	call	_cpct_isKeyPressed
	ld	a,l
	or	a, a
	jr	Z,00105$
;src/main.c:104: mostrarMenu = 0;
	ld	hl,#_mostrarMenu + 0
	ld	(hl), #0x00
	ret
___str_0:
	.ascii "PRESS ENTER"
	.db 0x00
___str_1:
	.ascii "GAME OVER"
	.db 0x00
___str_2:
	.ascii "YOU WON!"
	.db 0x00
;src/main.c:109: void main(void) {
;	---------------------------------
; Function main
; ---------------------------------
_main::
;src/main.c:111: inicializar();
	call	_inicializar
;src/main.c:114: while (1){
00104$:
;src/main.c:115: cpct_akp_musicPlay();
	call	_cpct_akp_musicPlay
;src/main.c:116: if(mostrarMenu % 2 == 0){
	ld	hl,#_mostrarMenu+0
	bit	0, (hl)
	jr	NZ,00102$
;src/main.c:117: menu();
	call	_menu
00102$:
;src/main.c:119: play();
	call	_play
	jr	00104$
	.area _CODE
	.area _INITIALIZER
__xinit__mostrarMenu:
	.db #0x01	; 1
	.area _CABS (ABS)
