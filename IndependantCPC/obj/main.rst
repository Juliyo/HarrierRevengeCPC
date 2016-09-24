                              1 ;--------------------------------------------------------
                              2 ; File Created by SDCC : free open source ANSI-C Compiler
                              3 ; Version 3.5.5 #9498 (Linux)
                              4 ;--------------------------------------------------------
                              5 	.module main
                              6 	.optsdcc -mz80
                              7 	
                              8 ;--------------------------------------------------------
                              9 ; Public variables in this module
                             10 ;--------------------------------------------------------
                             11 	.globl _main
                             12 	.globl _inicializar
                             13 	.globl _play
                             14 	.globl _cpct_setPALColour
                             15 	.globl _cpct_setPalette
                             16 	.globl _cpct_setVideoMode
                             17 	.globl _cpct_disableFirmware
                             18 ;--------------------------------------------------------
                             19 ; special function registers
                             20 ;--------------------------------------------------------
                             21 ;--------------------------------------------------------
                             22 ; ram data
                             23 ;--------------------------------------------------------
                             24 	.area _DATA
                             25 ;--------------------------------------------------------
                             26 ; ram data
                             27 ;--------------------------------------------------------
                             28 	.area _INITIALIZED
                             29 ;--------------------------------------------------------
                             30 ; absolute external ram data
                             31 ;--------------------------------------------------------
                             32 	.area _DABS (ABS)
                             33 ;--------------------------------------------------------
                             34 ; global & static initialisations
                             35 ;--------------------------------------------------------
                             36 	.area _HOME
                             37 	.area _GSINIT
                             38 	.area _GSFINAL
                             39 	.area _GSINIT
                             40 ;--------------------------------------------------------
                             41 ; Home
                             42 ;--------------------------------------------------------
                             43 	.area _HOME
                             44 	.area _HOME
                             45 ;--------------------------------------------------------
                             46 ; code
                             47 ;--------------------------------------------------------
                             48 	.area _CODE
                             49 ;src/main.c:23: void inicializar(){
                             50 ;	---------------------------------
                             51 ; Function inicializar
                             52 ; ---------------------------------
   435C                      53 _inicializar::
                             54 ;src/main.c:24: cpct_disableFirmware();
   435C CD 9F 45      [17]   55 	call	_cpct_disableFirmware
                             56 ;src/main.c:25: cpct_setBorder(HW_BLACK);
   435F 21 10 14      [10]   57 	ld	hl,#0x1410
   4362 E5            [11]   58 	push	hl
   4363 CD C0 44      [17]   59 	call	_cpct_setPALColour
                             60 ;src/main.c:26: cpct_setPalette(g_palette,16);
   4366 21 10 00      [10]   61 	ld	hl,#0x0010
   4369 E5            [11]   62 	push	hl
   436A 21 00 40      [10]   63 	ld	hl,#_g_palette
   436D E5            [11]   64 	push	hl
   436E CD 33 44      [17]   65 	call	_cpct_setPalette
                             66 ;src/main.c:29: cpct_setVideoMode(0);
   4371 2E 00         [ 7]   67 	ld	l,#0x00
   4373 CD 7B 45      [17]   68 	call	_cpct_setVideoMode
   4376 C9            [10]   69 	ret
                             70 ;src/main.c:32: void main(void) {
                             71 ;	---------------------------------
                             72 ; Function main
                             73 ; ---------------------------------
   4377                      74 _main::
                             75 ;src/main.c:34: inicializar();
   4377 CD 5C 43      [17]   76 	call	_inicializar
                             77 ;src/main.c:37: while (1){
   437A                      78 00102$:
                             79 ;src/main.c:38: play();
   437A CD 3E 43      [17]   80 	call	_play
   437D 18 FB         [12]   81 	jr	00102$
                             82 	.area _CODE
                             83 	.area _INITIALIZER
                             84 	.area _CABS (ABS)
