                              1 ;--------------------------------------------------------
                              2 ; File Created by SDCC : free open source ANSI-C Compiler
                              3 ; Version 3.5.5 #9498 (Linux)
                              4 ;--------------------------------------------------------
                              5 	.module entities
                              6 	.optsdcc -mz80
                              7 	
                              8 ;--------------------------------------------------------
                              9 ; Public variables in this module
                             10 ;--------------------------------------------------------
                             11 	.globl _cpct_getScreenPtr
                             12 	.globl _cpct_drawSprite
                             13 	.globl _incializarEntities
                             14 	.globl _dibujarPlayer
                             15 	.globl _drawAll
                             16 ;--------------------------------------------------------
                             17 ; special function registers
                             18 ;--------------------------------------------------------
                             19 ;--------------------------------------------------------
                             20 ; ram data
                             21 ;--------------------------------------------------------
                             22 	.area _DATA
                             23 ;--------------------------------------------------------
                             24 ; ram data
                             25 ;--------------------------------------------------------
                             26 	.area _INITIALIZED
                             27 ;--------------------------------------------------------
                             28 ; absolute external ram data
                             29 ;--------------------------------------------------------
                             30 	.area _DABS (ABS)
                             31 ;--------------------------------------------------------
                             32 ; global & static initialisations
                             33 ;--------------------------------------------------------
                             34 	.area _HOME
                             35 	.area _GSINIT
                             36 	.area _GSFINAL
                             37 	.area _GSINIT
                             38 ;--------------------------------------------------------
                             39 ; Home
                             40 ;--------------------------------------------------------
                             41 	.area _HOME
                             42 	.area _HOME
                             43 ;--------------------------------------------------------
                             44 ; code
                             45 ;--------------------------------------------------------
                             46 	.area _CODE
                             47 ;src/entities/entities.c:8: void incializarEntities(){
                             48 ;	---------------------------------
                             49 ; Function incializarEntities
                             50 ; ---------------------------------
   4045                      51 _incializarEntities::
                             52 ;src/entities/entities.c:10: }
   4045 C9            [10]   53 	ret
                             54 ;src/entities/entities.c:12: void dibujarPlayer(TPlayer* player){
                             55 ;	---------------------------------
                             56 ; Function dibujarPlayer
                             57 ; ---------------------------------
   4046                      58 _dibujarPlayer::
   4046 DD E5         [15]   59 	push	ix
   4048 DD 21 00 00   [14]   60 	ld	ix,#0
   404C DD 39         [15]   61 	add	ix,sp
                             62 ;src/entities/entities.c:13: u8* vmem = cpct_getScreenPtr(CPCT_VMEM_START,player->x, player->y);
   404E DD 4E 04      [19]   63 	ld	c,4 (ix)
   4051 DD 46 05      [19]   64 	ld	b,5 (ix)
   4054 69            [ 4]   65 	ld	l, c
   4055 60            [ 4]   66 	ld	h, b
   4056 23            [ 6]   67 	inc	hl
   4057 56            [ 7]   68 	ld	d,(hl)
   4058 0A            [ 7]   69 	ld	a,(bc)
   4059 C5            [11]   70 	push	bc
   405A D5            [11]   71 	push	de
   405B 33            [ 6]   72 	inc	sp
   405C F5            [11]   73 	push	af
   405D 33            [ 6]   74 	inc	sp
   405E 21 00 C0      [10]   75 	ld	hl,#0xC000
   4061 E5            [11]   76 	push	hl
   4062 CD 6F 44      [17]   77 	call	_cpct_getScreenPtr
   4065 EB            [ 4]   78 	ex	de,hl
                             79 ;src/entities/entities.c:14: cpct_drawSprite(player->sprite,vmem,G_NAVES_0_W,G_NAVES_0_H);
   4066 E1            [10]   80 	pop	hl
   4067 23            [ 6]   81 	inc	hl
   4068 23            [ 6]   82 	inc	hl
   4069 4E            [ 7]   83 	ld	c,(hl)
   406A 23            [ 6]   84 	inc	hl
   406B 46            [ 7]   85 	ld	b,(hl)
   406C 21 08 10      [10]   86 	ld	hl,#0x1008
   406F E5            [11]   87 	push	hl
   4070 D5            [11]   88 	push	de
   4071 C5            [11]   89 	push	bc
   4072 CD 9D 43      [17]   90 	call	_cpct_drawSprite
   4075 DD E1         [14]   91 	pop	ix
   4077 C9            [10]   92 	ret
                             93 ;src/entities/entities.c:17: void drawAll(TPlayer* player){
                             94 ;	---------------------------------
                             95 ; Function drawAll
                             96 ; ---------------------------------
   4078                      97 _drawAll::
                             98 ;src/entities/entities.c:19: dibujarPlayer(player);
   4078 C1            [10]   99 	pop	bc
   4079 E1            [10]  100 	pop	hl
   407A E5            [11]  101 	push	hl
   407B C5            [11]  102 	push	bc
   407C E5            [11]  103 	push	hl
   407D CD 46 40      [17]  104 	call	_dibujarPlayer
   4080 F1            [10]  105 	pop	af
   4081 C9            [10]  106 	ret
                            107 	.area _CODE
                            108 	.area _INITIALIZER
                            109 	.area _CABS (ABS)
