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
                             14 	.globl _accion
                             15 	.globl _moverArriba
                             16 	.globl _updatePlayer
                             17 	.globl _redibujarPlayer
                             18 	.globl _borrarPlayer
                             19 	.globl _dibujarPlayer
                             20 	.globl _drawAll
                             21 ;--------------------------------------------------------
                             22 ; special function registers
                             23 ;--------------------------------------------------------
                             24 ;--------------------------------------------------------
                             25 ; ram data
                             26 ;--------------------------------------------------------
                             27 	.area _DATA
                             28 ;--------------------------------------------------------
                             29 ; ram data
                             30 ;--------------------------------------------------------
                             31 	.area _INITIALIZED
                             32 ;--------------------------------------------------------
                             33 ; absolute external ram data
                             34 ;--------------------------------------------------------
                             35 	.area _DABS (ABS)
                             36 ;--------------------------------------------------------
                             37 ; global & static initialisations
                             38 ;--------------------------------------------------------
                             39 	.area _HOME
                             40 	.area _GSINIT
                             41 	.area _GSFINAL
                             42 	.area _GSINIT
                             43 ;--------------------------------------------------------
                             44 ; Home
                             45 ;--------------------------------------------------------
                             46 	.area _HOME
                             47 	.area _HOME
                             48 ;--------------------------------------------------------
                             49 ; code
                             50 ;--------------------------------------------------------
                             51 	.area _CODE
                             52 ;src/entities/entities.c:8: void incializarEntities(){
                             53 ;	---------------------------------
                             54 ; Function incializarEntities
                             55 ; ---------------------------------
   437F                      56 _incializarEntities::
                             57 ;src/entities/entities.c:10: }
   437F C9            [10]   58 	ret
                             59 ;src/entities/entities.c:14: void accion(TPlayer* player, TPlayerStatus action, TPlayerDirection dir){
                             60 ;	---------------------------------
                             61 ; Function accion
                             62 ; ---------------------------------
   4380                      63 _accion::
                             64 ;src/entities/entities.c:15: switch(action){
   4380 21 04 00      [10]   65 	ld	hl, #4+0
   4383 39            [11]   66 	add	hl, sp
   4384 7E            [ 7]   67 	ld	a, (hl)
   4385 3D            [ 4]   68 	dec	a
   4386 C0            [11]   69 	ret	NZ
                             70 ;src/entities/entities.c:17: switch(dir){
   4387 21 05 00      [10]   71 	ld	hl, #5+0
   438A 39            [11]   72 	add	hl, sp
   438B 7E            [ 7]   73 	ld	a, (hl)
   438C B7            [ 4]   74 	or	a, a
   438D C0            [11]   75 	ret	NZ
                             76 ;src/entities/entities.c:19: moverArriba(player);
   438E C1            [10]   77 	pop	bc
   438F E1            [10]   78 	pop	hl
   4390 E5            [11]   79 	push	hl
   4391 C5            [11]   80 	push	bc
   4392 E5            [11]   81 	push	hl
   4393 CD 98 43      [17]   82 	call	_moverArriba
   4396 F1            [10]   83 	pop	af
                             84 ;src/entities/entities.c:25: }
   4397 C9            [10]   85 	ret
                             86 ;src/entities/entities.c:28: void moverArriba(TPlayer* player){
                             87 ;	---------------------------------
                             88 ; Function moverArriba
                             89 ; ---------------------------------
   4398                      90 _moverArriba::
   4398 DD E5         [15]   91 	push	ix
   439A DD 21 00 00   [14]   92 	ld	ix,#0
   439E DD 39         [15]   93 	add	ix,sp
                             94 ;src/entities/entities.c:29: if (player->y + G_NAVES_0_H < ALTO) {
   43A0 DD 4E 04      [19]   95 	ld	c,4 (ix)
   43A3 DD 46 05      [19]   96 	ld	b,5 (ix)
   43A6 03            [ 6]   97 	inc	bc
   43A7 0A            [ 7]   98 	ld	a,(bc)
   43A8 5F            [ 4]   99 	ld	e,a
   43A9 6B            [ 4]  100 	ld	l,e
   43AA 26 00         [ 7]  101 	ld	h,#0x00
   43AC D5            [11]  102 	push	de
   43AD 11 10 00      [10]  103 	ld	de,#0x0010
   43B0 19            [11]  104 	add	hl, de
   43B1 D1            [10]  105 	pop	de
   43B2 7D            [ 4]  106 	ld	a,l
   43B3 D6 C8         [ 7]  107 	sub	a, #0xC8
   43B5 7C            [ 4]  108 	ld	a,h
   43B6 17            [ 4]  109 	rla
   43B7 3F            [ 4]  110 	ccf
   43B8 1F            [ 4]  111 	rra
   43B9 DE 80         [ 7]  112 	sbc	a, #0x80
   43BB 30 03         [12]  113 	jr	NC,00103$
                            114 ;src/entities/entities.c:30: player->y--;
   43BD 1D            [ 4]  115 	dec	e
   43BE 7B            [ 4]  116 	ld	a,e
   43BF 02            [ 7]  117 	ld	(bc),a
   43C0                     118 00103$:
   43C0 DD E1         [14]  119 	pop	ix
   43C2 C9            [10]  120 	ret
                            121 ;src/entities/entities.c:37: void updatePlayer(TPlayer* player){
                            122 ;	---------------------------------
                            123 ; Function updatePlayer
                            124 ; ---------------------------------
   43C3                     125 _updatePlayer::
                            126 ;src/entities/entities.c:39: }
   43C3 C9            [10]  127 	ret
                            128 ;src/entities/entities.c:41: void redibujarPlayer(TPlayer* player){
                            129 ;	---------------------------------
                            130 ; Function redibujarPlayer
                            131 ; ---------------------------------
   43C4                     132 _redibujarPlayer::
   43C4 DD E5         [15]  133 	push	ix
   43C6 DD 21 00 00   [14]  134 	ld	ix,#0
   43CA DD 39         [15]  135 	add	ix,sp
                            136 ;src/entities/entities.c:42: borrarPlayer(player);
   43CC DD 6E 04      [19]  137 	ld	l,4 (ix)
   43CF DD 66 05      [19]  138 	ld	h,5 (ix)
   43D2 E5            [11]  139 	push	hl
   43D3 CD F5 43      [17]  140 	call	_borrarPlayer
   43D6 F1            [10]  141 	pop	af
                            142 ;src/entities/entities.c:43: player->px = player->x;
   43D7 DD 4E 04      [19]  143 	ld	c,4 (ix)
   43DA DD 46 05      [19]  144 	ld	b,5 (ix)
   43DD 59            [ 4]  145 	ld	e, c
   43DE 50            [ 4]  146 	ld	d, b
   43DF 13            [ 6]  147 	inc	de
   43E0 13            [ 6]  148 	inc	de
   43E1 0A            [ 7]  149 	ld	a,(bc)
   43E2 12            [ 7]  150 	ld	(de),a
                            151 ;src/entities/entities.c:44: player->py = player->y;
   43E3 59            [ 4]  152 	ld	e, c
   43E4 50            [ 4]  153 	ld	d, b
   43E5 13            [ 6]  154 	inc	de
   43E6 13            [ 6]  155 	inc	de
   43E7 13            [ 6]  156 	inc	de
   43E8 69            [ 4]  157 	ld	l, c
   43E9 60            [ 4]  158 	ld	h, b
   43EA 23            [ 6]  159 	inc	hl
   43EB 7E            [ 7]  160 	ld	a,(hl)
   43EC 12            [ 7]  161 	ld	(de),a
                            162 ;src/entities/entities.c:45: dibujarPlayer(player);
   43ED C5            [11]  163 	push	bc
   43EE CD F6 43      [17]  164 	call	_dibujarPlayer
   43F1 F1            [10]  165 	pop	af
   43F2 DD E1         [14]  166 	pop	ix
   43F4 C9            [10]  167 	ret
                            168 ;src/entities/entities.c:48: void borrarPlayer(TPlayer* player){
                            169 ;	---------------------------------
                            170 ; Function borrarPlayer
                            171 ; ---------------------------------
   43F5                     172 _borrarPlayer::
                            173 ;src/entities/entities.c:50: }
   43F5 C9            [10]  174 	ret
                            175 ;src/entities/entities.c:52: void dibujarPlayer(TPlayer* player){
                            176 ;	---------------------------------
                            177 ; Function dibujarPlayer
                            178 ; ---------------------------------
   43F6                     179 _dibujarPlayer::
   43F6 DD E5         [15]  180 	push	ix
   43F8 DD 21 00 00   [14]  181 	ld	ix,#0
   43FC DD 39         [15]  182 	add	ix,sp
                            183 ;src/entities/entities.c:53: u8* vmem = cpct_getScreenPtr(CPCT_VMEM_START,player->x, player->y);
   43FE DD 4E 04      [19]  184 	ld	c,4 (ix)
   4401 DD 46 05      [19]  185 	ld	b,5 (ix)
   4404 69            [ 4]  186 	ld	l, c
   4405 60            [ 4]  187 	ld	h, b
   4406 23            [ 6]  188 	inc	hl
   4407 56            [ 7]  189 	ld	d,(hl)
   4408 0A            [ 7]  190 	ld	a,(bc)
   4409 C5            [11]  191 	push	bc
   440A D5            [11]  192 	push	de
   440B 33            [ 6]  193 	inc	sp
   440C F5            [11]  194 	push	af
   440D 33            [ 6]  195 	inc	sp
   440E 21 00 C0      [10]  196 	ld	hl,#0xC000
   4411 E5            [11]  197 	push	hl
   4412 CD B1 45      [17]  198 	call	_cpct_getScreenPtr
   4415 EB            [ 4]  199 	ex	de,hl
                            200 ;src/entities/entities.c:54: cpct_drawSprite(player->sprite,vmem,G_NAVES_0_W,G_NAVES_0_H);
   4416 E1            [10]  201 	pop	hl
   4417 01 04 00      [10]  202 	ld	bc, #0x0004
   441A 09            [11]  203 	add	hl, bc
   441B 4E            [ 7]  204 	ld	c,(hl)
   441C 23            [ 6]  205 	inc	hl
   441D 46            [ 7]  206 	ld	b,(hl)
   441E 21 08 10      [10]  207 	ld	hl,#0x1008
   4421 E5            [11]  208 	push	hl
   4422 D5            [11]  209 	push	de
   4423 C5            [11]  210 	push	bc
   4424 CD CD 44      [17]  211 	call	_cpct_drawSprite
   4427 DD E1         [14]  212 	pop	ix
   4429 C9            [10]  213 	ret
                            214 ;src/entities/entities.c:57: void drawAll(TPlayer* player){
                            215 ;	---------------------------------
                            216 ; Function drawAll
                            217 ; ---------------------------------
   442A                     218 _drawAll::
                            219 ;src/entities/entities.c:59: dibujarPlayer(player);
   442A C1            [10]  220 	pop	bc
   442B E1            [10]  221 	pop	hl
   442C E5            [11]  222 	push	hl
   442D C5            [11]  223 	push	bc
   442E E5            [11]  224 	push	hl
   442F CD F6 43      [17]  225 	call	_dibujarPlayer
   4432 F1            [10]  226 	pop	af
   4433 C9            [10]  227 	ret
                            228 	.area _CODE
                            229 	.area _INITIALIZER
                            230 	.area _CABS (ABS)
