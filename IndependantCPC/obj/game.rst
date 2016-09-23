                              1 ;--------------------------------------------------------
                              2 ; File Created by SDCC : free open source ANSI-C Compiler
                              3 ; Version 3.5.5 #9498 (Linux)
                              4 ;--------------------------------------------------------
                              5 	.module game
                              6 	.optsdcc -mz80
                              7 	
                              8 ;--------------------------------------------------------
                              9 ; Public variables in this module
                             10 ;--------------------------------------------------------
                             11 	.globl _drawAll
                             12 	.globl _incializarEntities
                             13 	.globl _cpct_memset
                             14 	.globl _player
                             15 	.globl _inicializarPantalla
                             16 	.globl _play
                             17 ;--------------------------------------------------------
                             18 ; special function registers
                             19 ;--------------------------------------------------------
                             20 ;--------------------------------------------------------
                             21 ; ram data
                             22 ;--------------------------------------------------------
                             23 	.area _DATA
                             24 ;--------------------------------------------------------
                             25 ; ram data
                             26 ;--------------------------------------------------------
                             27 	.area _INITIALIZED
                             28 ;--------------------------------------------------------
                             29 ; absolute external ram data
                             30 ;--------------------------------------------------------
                             31 	.area _DABS (ABS)
                             32 ;--------------------------------------------------------
                             33 ; global & static initialisations
                             34 ;--------------------------------------------------------
                             35 	.area _HOME
                             36 	.area _GSINIT
                             37 	.area _GSFINAL
                             38 	.area _GSINIT
                             39 ;--------------------------------------------------------
                             40 ; Home
                             41 ;--------------------------------------------------------
                             42 	.area _HOME
                             43 	.area _HOME
                             44 ;--------------------------------------------------------
                             45 ; code
                             46 ;--------------------------------------------------------
                             47 	.area _CODE
                             48 ;src/game.c:13: void inicializarPantalla(){
                             49 ;	---------------------------------
                             50 ; Function inicializarPantalla
                             51 ; ---------------------------------
   4000                      52 _inicializarPantalla::
                             53 ;src/game.c:15: cpct_clearScreen(0);
   4000 21 00 40      [10]   54 	ld	hl,#0x4000
   4003 E5            [11]   55 	push	hl
   4004 AF            [ 4]   56 	xor	a, a
   4005 F5            [11]   57 	push	af
   4006 33            [ 6]   58 	inc	sp
   4007 26 C0         [ 7]   59 	ld	h, #0xC0
   4009 E5            [11]   60 	push	hl
   400A CD 50 44      [17]   61 	call	_cpct_memset
   400D C9            [10]   62 	ret
   400E                      63 _player:
   400E 64                   64 	.db #0x64	; 100	'd'
   400F 32                   65 	.db #0x32	; 50	'2'
   4010 92 40                66 	.dw _g_naves_0
                             67 ;src/game.c:24: void play(){
                             68 ;	---------------------------------
                             69 ; Function play
                             70 ; ---------------------------------
   4012                      71 _play::
                             72 ;src/game.c:26: inicializarPantalla();
   4012 CD 00 40      [17]   73 	call	_inicializarPantalla
                             74 ;src/game.c:27: incializarEntities();
   4015 CD 45 40      [17]   75 	call	_incializarEntities
                             76 ;src/game.c:30: while(1){
   4018                      77 00102$:
                             78 ;src/game.c:33: drawAll(&player);
   4018 21 0E 40      [10]   79 	ld	hl,#_player
   401B E5            [11]   80 	push	hl
   401C CD 78 40      [17]   81 	call	_drawAll
   401F F1            [10]   82 	pop	af
   4020 18 F6         [12]   83 	jr	00102$
                             84 	.area _CODE
                             85 	.area _INITIALIZER
                             86 	.area _CABS (ABS)
