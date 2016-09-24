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
   438C                      53 _inicializar::
                             54 ;src/main.c:24: cpct_disableFirmware();
   438C CD 56 46      [17]   55 	call	_cpct_disableFirmware
                             56 ;src/main.c:25: cpct_setBorder(HW_BLACK);
   438F 21 10 14      [10]   57 	ld	hl,#0x1410
   4392 E5            [11]   58 	push	hl
   4393 CD 77 45      [17]   59 	call	_cpct_setPALColour
                             60 ;src/main.c:26: cpct_setPalette(g_palette,16);
   4396 21 10 00      [10]   61 	ld	hl,#0x0010
   4399 E5            [11]   62 	push	hl
   439A 21 00 40      [10]   63 	ld	hl,#_g_palette
   439D E5            [11]   64 	push	hl
   439E CD EA 44      [17]   65 	call	_cpct_setPalette
                             66 ;src/main.c:29: cpct_setVideoMode(0);
   43A1 2E 00         [ 7]   67 	ld	l,#0x00
   43A3 CD 32 46      [17]   68 	call	_cpct_setVideoMode
   43A6 C9            [10]   69 	ret
                             70 ;src/main.c:32: void main(void) {
                             71 ;	---------------------------------
                             72 ; Function main
                             73 ; ---------------------------------
   43A7                      74 _main::
                             75 ;src/main.c:34: inicializar();
   43A7 CD 8C 43      [17]   76 	call	_inicializar
                             77 ;src/main.c:37: while (1){
   43AA                      78 00102$:
                             79 ;src/main.c:38: play();
   43AA CD 6E 43      [17]   80 	call	_play
   43AD 18 FB         [12]   81 	jr	00102$
                             82 	.area _CODE
                             83 	.area _INITIALIZER
                             84 	.area _CABS (ABS)
