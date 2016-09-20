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
	.globl _cpct_setPALColour
	.globl _cpct_setPalette
	.globl _cpct_setVideoMode
	.globl _cpct_drawSprite
	.globl _cpct_disableFirmware
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
;src/main.c:34: void main(void) {
;	---------------------------------
; Function main
; ---------------------------------
_main::
;src/main.c:36: cpct_disableFirmware();
	call	_cpct_disableFirmware
;src/main.c:37: cpct_setVideoMode(0);
	ld	l,#0x00
	call	_cpct_setVideoMode
;src/main.c:38: cpct_setBorder(HW_BLACK);
	ld	hl,#0x1410
	push	hl
	call	_cpct_setPALColour
;src/main.c:40: cpct_setPalette(g_palette,16);
	ld	hl,#0x0010
	push	hl
	ld	hl,#_g_palette
	push	hl
	call	_cpct_setPalette
;src/main.c:43: cpct_drawSprite(g_ghost,VMEM_START,8,16);
	ld	hl,#0x1008
	push	hl
	ld	hl,#0xC000
	push	hl
	ld	hl,#_g_ghost
	push	hl
	call	_cpct_drawSprite
;src/main.c:46: while (1);
00102$:
	jr	00102$
	.area _CODE
	.area _INITIALIZER
	.area _CABS (ABS)
