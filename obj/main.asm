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
	.globl _play
	.globl _cpct_getScreenPtr
	.globl _cpct_setPALColour
	.globl _cpct_setPalette
	.globl _cpct_setVideoMode
	.globl _cpct_drawStringM0
	.globl _cpct_drawSprite
	.globl _cpct_isKeyPressed
	.globl _cpct_scanKeyboard_f
	.globl _cpct_memset
	.globl _cpct_disableFirmware
	.globl _mostrarMenu
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
;src/main.c:28: void inicializar(){
;	---------------------------------
; Function inicializar
; ---------------------------------
_inicializar::
;src/main.c:29: cpct_disableFirmware();
	call	_cpct_disableFirmware
;src/main.c:30: cpct_setBorder(HW_BLACK);
	ld	hl,#0x1410
	push	hl
	call	_cpct_setPALColour
;src/main.c:31: cpct_setPalette(g_palette,16);
	ld	hl,#0x0010
	push	hl
	ld	hl,#_g_palette
	push	hl
	call	_cpct_setPalette
;src/main.c:34: cpct_setVideoMode(0);
	ld	l,#0x00
	call	_cpct_setVideoMode
	ret
;src/main.c:37: void menu(){
;	---------------------------------
; Function menu
; ---------------------------------
_menu::
;src/main.c:40: cpct_clearScreen(0);
	ld	hl,#0x4000
	push	hl
	xor	a, a
	push	af
	inc	sp
	ld	h, #0xC0
	push	hl
	call	_cpct_memset
;src/main.c:41: cpct_drawSprite (g_flores1_0,
	ld	hl,#0x0A28
	push	hl
	ld	hl,#0xC000
	push	hl
	ld	hl,#_g_flores1_0
	push	hl
	call	_cpct_drawSprite
;src/main.c:44: cpct_drawSprite (g_flores1_1,
	ld	hl,#0x0A28
	push	hl
	ld	h, #0xC0
	push	hl
	ld	hl,#_g_flores1_1
	push	hl
	call	_cpct_drawSprite
;src/main.c:48: cpct_drawSprite (g_flores2_0,
	ld	hl,#0x0A28
	push	hl
	ld	hl,#0xE6E0
	push	hl
	ld	hl,#_g_flores2_0
	push	hl
	call	_cpct_drawSprite
;src/main.c:51: cpct_drawSprite (g_flores2_1,
	ld	hl,#0x0A28
	push	hl
	ld	hl,#0xE708
	push	hl
	ld	hl,#_g_flores2_1
	push	hl
	call	_cpct_drawSprite
;src/main.c:55: cpct_drawSprite (g_portada_0,
	ld	hl,#0x4228
	push	hl
	ld	hl,#0xD050
	push	hl
	ld	hl,#_g_portada_0
	push	hl
	call	_cpct_drawSprite
;src/main.c:58: cpct_drawSprite (g_portada_1,
	ld	hl,#0x4228
	push	hl
	ld	hl,#0xD078
	push	hl
	ld	hl,#_g_portada_1
	push	hl
	call	_cpct_drawSprite
;src/main.c:62: cpct_drawStringM0("PRESS ENTER", cpct_getScreenPtr(CPCT_VMEM_START, 17, 160), 6, 0);
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
;src/main.c:63: if(player.vida == 0){
	ld	a, (#(_player + 0x0049) + 0)
	or	a, a
	jr	NZ,00102$
;src/main.c:64: cpct_drawStringM0("GAME OVER", cpct_getScreenPtr(CPCT_VMEM_START, 20, 110), 3, 0);
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
;src/main.c:66: if(basesCapturadas == 6){
	ld	a,(#_basesCapturadas + 0)
	sub	a, #0x06
	jr	NZ,00105$
;src/main.c:67: cpct_drawStringM0("YOU WON!", cpct_getScreenPtr(CPCT_VMEM_START, 20, 110), 3, 0);
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
	ld	hl,#___str_2
	push	hl
	call	_cpct_drawStringM0
	ld	hl,#6
	add	hl,sp
	ld	sp,hl
;src/main.c:69: do{
00105$:
;src/main.c:70: cpct_scanKeyboard_f();
	call	_cpct_scanKeyboard_f
;src/main.c:71: }while(!cpct_isKeyPressed(Key_Enter));
	ld	hl,#0x4000
	call	_cpct_isKeyPressed
	ld	a,l
	or	a, a
	jr	Z,00105$
;src/main.c:72: mostrarMenu = 0;
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
;src/main.c:77: void main(void) {
;	---------------------------------
; Function main
; ---------------------------------
_main::
;src/main.c:79: inicializar();
	call	_inicializar
;src/main.c:82: while (1){
00104$:
;src/main.c:83: if(mostrarMenu % 2 == 0){
	ld	hl,#_mostrarMenu+0
	bit	0, (hl)
	jr	NZ,00102$
;src/main.c:84: menu();
	call	_menu
00102$:
;src/main.c:86: play();
	call	_play
	jr	00104$
	.area _CODE
	.area _INITIALIZER
__xinit__mostrarMenu:
	.db #0x01	; 1
	.area _CABS (ABS)
