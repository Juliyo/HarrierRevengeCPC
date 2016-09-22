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
	.globl _dibujarPlayer
	.globl _cpct_getScreenPtr
	.globl _cpct_setPALColour
	.globl _cpct_setPalette
	.globl _cpct_setVideoMode
	.globl _cpct_drawSprite
	.globl _cpct_disableFirmware
	.globl _player
;--------------------------------------------------------
; special function registers
;--------------------------------------------------------
;--------------------------------------------------------
; ram data
;--------------------------------------------------------
	.area _DATA
_player::
	.ds 4
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
;src/main.c:32: void dibujarPlayer(){
;	---------------------------------
; Function dibujarPlayer
; ---------------------------------
_dibujarPlayer::
;src/main.c:33: u8* vmem = cpct_getScreenPtr(CPCT_VMEM_START,player.x, player.y);
	ld	hl, #_player + 1
	ld	d,(hl)
	ld	hl, #_player + 0
	ld	b,(hl)
	push	de
	inc	sp
	push	bc
	inc	sp
	ld	hl,#0xC000
	push	hl
	call	_cpct_getScreenPtr
	ld	e,l
	ld	d,h
;src/main.c:34: cpct_drawSprite(player.sprite,vmem,8,17);
	ld	bc, (#_player + 2)
	ld	hl,#0x1108
	push	hl
	push	de
	push	bc
	call	_cpct_drawSprite
	ret
;src/main.c:37: void inicializar(){
;	---------------------------------
; Function inicializar
; ---------------------------------
_inicializar::
;src/main.c:40: cpct_disableFirmware();
	call	_cpct_disableFirmware
;src/main.c:41: cpct_setVideoMode(0);
	ld	l,#0x00
	call	_cpct_setVideoMode
;src/main.c:42: cpct_setBorder(HW_BLACK);
	ld	hl,#0x1410
	push	hl
	call	_cpct_setPALColour
;src/main.c:43: cpct_setPalette(g_palette,16);
	ld	hl,#0x0010
	push	hl
	ld	hl,#_g_palette
	push	hl
	call	_cpct_setPalette
;src/main.c:45: player.x = 100;
	ld	hl,#_player
	ld	(hl),#0x64
;src/main.c:46: player.y = 50;
	ld	bc,#_player + 1
	ld	a,#0x32
	ld	(bc),a
;src/main.c:47: player.sprite = g_naves_0;
	ld	hl,#_g_naves_0
	ld	((_player + 0x0002)), hl
;src/main.c:51: vmem = cpct_getScreenPtr(CPCT_VMEM_START,player.x, player.y);
	ld	a,(bc)
	ld	d,a
	ld	hl, #_player + 0
	ld	b,(hl)
	push	de
	inc	sp
	push	bc
	inc	sp
	ld	hl,#0xC000
	push	hl
	call	_cpct_getScreenPtr
	ld	e,l
	ld	d,h
;src/main.c:52: cpct_drawSprite(player.sprite,vmem,8,17);
	ld	bc, (#(_player + 0x0002) + 0)
	ld	hl,#0x1108
	push	hl
	push	de
	push	bc
	call	_cpct_drawSprite
	ret
;src/main.c:56: void main(void) {
;	---------------------------------
; Function main
; ---------------------------------
_main::
;src/main.c:60: inicializar();
	call	_inicializar
;src/main.c:63: while (1);
00102$:
	jr	00102$
	.area _CODE
	.area _INITIALIZER
	.area _CABS (ABS)
