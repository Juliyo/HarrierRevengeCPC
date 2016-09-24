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
                             84 ;src/entities/entities.c:24: }
   4397 C9            [10]   85 	ret
                             86 ;src/entities/entities.c:27: void moverArriba(TPlayer* player){
                             87 ;	---------------------------------
                             88 ; Function moverArriba
                             89 ; ---------------------------------
   4398                      90 _moverArriba::
   4398 DD E5         [15]   91 	push	ix
   439A DD 21 00 00   [14]   92 	ld	ix,#0
   439E DD 39         [15]   93 	add	ix,sp
                             94 ;src/entities/entities.c:28: if (player->x + G_NAVES_0_W < ALTO) {
   43A0 DD 4E 04      [19]   95 	ld	c,4 (ix)
   43A3 DD 46 05      [19]   96 	ld	b,5 (ix)
   43A6 0A            [ 7]   97 	ld	a,(bc)
   43A7 5F            [ 4]   98 	ld	e,a
   43A8 6B            [ 4]   99 	ld	l,e
   43A9 26 00         [ 7]  100 	ld	h,#0x00
   43AB D5            [11]  101 	push	de
   43AC 11 08 00      [10]  102 	ld	de,#0x0008
   43AF 19            [11]  103 	add	hl, de
   43B0 D1            [10]  104 	pop	de
   43B1 7D            [ 4]  105 	ld	a,l
   43B2 D6 50         [ 7]  106 	sub	a, #0x50
   43B4 7C            [ 4]  107 	ld	a,h
   43B5 17            [ 4]  108 	rla
   43B6 3F            [ 4]  109 	ccf
   43B7 1F            [ 4]  110 	rra
   43B8 DE 80         [ 7]  111 	sbc	a, #0x80
   43BA 30 03         [12]  112 	jr	NC,00103$
                            113 ;src/entities/entities.c:29: player->x++;
   43BC 1C            [ 4]  114 	inc	e
   43BD 7B            [ 4]  115 	ld	a,e
   43BE 02            [ 7]  116 	ld	(bc),a
   43BF                     117 00103$:
   43BF DD E1         [14]  118 	pop	ix
   43C1 C9            [10]  119 	ret
                            120 ;src/entities/entities.c:35: void updatePlayer(TPlayer* player){
                            121 ;	---------------------------------
                            122 ; Function updatePlayer
                            123 ; ---------------------------------
   43C2                     124 _updatePlayer::
                            125 ;src/entities/entities.c:37: }
   43C2 C9            [10]  126 	ret
                            127 ;src/entities/entities.c:39: void redibujarPlayer(TPlayer* player){
                            128 ;	---------------------------------
                            129 ; Function redibujarPlayer
                            130 ; ---------------------------------
   43C3                     131 _redibujarPlayer::
   43C3 DD E5         [15]  132 	push	ix
   43C5 DD 21 00 00   [14]  133 	ld	ix,#0
   43C9 DD 39         [15]  134 	add	ix,sp
                            135 ;src/entities/entities.c:40: borrarPlayer(player);
   43CB DD 6E 04      [19]  136 	ld	l,4 (ix)
   43CE DD 66 05      [19]  137 	ld	h,5 (ix)
   43D1 E5            [11]  138 	push	hl
   43D2 CD F4 43      [17]  139 	call	_borrarPlayer
   43D5 F1            [10]  140 	pop	af
                            141 ;src/entities/entities.c:41: player->px = player->x;
   43D6 DD 4E 04      [19]  142 	ld	c,4 (ix)
   43D9 DD 46 05      [19]  143 	ld	b,5 (ix)
   43DC 59            [ 4]  144 	ld	e, c
   43DD 50            [ 4]  145 	ld	d, b
   43DE 13            [ 6]  146 	inc	de
   43DF 13            [ 6]  147 	inc	de
   43E0 0A            [ 7]  148 	ld	a,(bc)
   43E1 12            [ 7]  149 	ld	(de),a
                            150 ;src/entities/entities.c:42: player->py = player->y;
   43E2 59            [ 4]  151 	ld	e, c
   43E3 50            [ 4]  152 	ld	d, b
   43E4 13            [ 6]  153 	inc	de
   43E5 13            [ 6]  154 	inc	de
   43E6 13            [ 6]  155 	inc	de
   43E7 69            [ 4]  156 	ld	l, c
   43E8 60            [ 4]  157 	ld	h, b
   43E9 23            [ 6]  158 	inc	hl
   43EA 7E            [ 7]  159 	ld	a,(hl)
   43EB 12            [ 7]  160 	ld	(de),a
                            161 ;src/entities/entities.c:43: dibujarPlayer(player);
   43EC C5            [11]  162 	push	bc
   43ED CD F5 43      [17]  163 	call	_dibujarPlayer
   43F0 F1            [10]  164 	pop	af
   43F1 DD E1         [14]  165 	pop	ix
   43F3 C9            [10]  166 	ret
                            167 ;src/entities/entities.c:46: void borrarPlayer(TPlayer* player){
                            168 ;	---------------------------------
                            169 ; Function borrarPlayer
                            170 ; ---------------------------------
   43F4                     171 _borrarPlayer::
                            172 ;src/entities/entities.c:48: }
   43F4 C9            [10]  173 	ret
                            174 ;src/entities/entities.c:50: void dibujarPlayer(TPlayer* player){
                            175 ;	---------------------------------
                            176 ; Function dibujarPlayer
                            177 ; ---------------------------------
   43F5                     178 _dibujarPlayer::
   43F5 DD E5         [15]  179 	push	ix
   43F7 DD 21 00 00   [14]  180 	ld	ix,#0
   43FB DD 39         [15]  181 	add	ix,sp
                            182 ;src/entities/entities.c:51: u8* vmem = cpct_getScreenPtr(CPCT_VMEM_START,player->x, player->y);
   43FD DD 4E 04      [19]  183 	ld	c,4 (ix)
   4400 DD 46 05      [19]  184 	ld	b,5 (ix)
   4403 69            [ 4]  185 	ld	l, c
   4404 60            [ 4]  186 	ld	h, b
   4405 23            [ 6]  187 	inc	hl
   4406 56            [ 7]  188 	ld	d,(hl)
   4407 0A            [ 7]  189 	ld	a,(bc)
   4408 C5            [11]  190 	push	bc
   4409 D5            [11]  191 	push	de
   440A 33            [ 6]  192 	inc	sp
   440B F5            [11]  193 	push	af
   440C 33            [ 6]  194 	inc	sp
   440D 21 00 C0      [10]  195 	ld	hl,#0xC000
   4410 E5            [11]  196 	push	hl
   4411 CD B0 45      [17]  197 	call	_cpct_getScreenPtr
   4414 EB            [ 4]  198 	ex	de,hl
                            199 ;src/entities/entities.c:52: cpct_drawSprite(player->sprite,vmem,G_NAVES_0_W,G_NAVES_0_H);
   4415 E1            [10]  200 	pop	hl
   4416 01 04 00      [10]  201 	ld	bc, #0x0004
   4419 09            [11]  202 	add	hl, bc
   441A 4E            [ 7]  203 	ld	c,(hl)
   441B 23            [ 6]  204 	inc	hl
   441C 46            [ 7]  205 	ld	b,(hl)
   441D 21 08 10      [10]  206 	ld	hl,#0x1008
   4420 E5            [11]  207 	push	hl
   4421 D5            [11]  208 	push	de
   4422 C5            [11]  209 	push	bc
   4423 CD CC 44      [17]  210 	call	_cpct_drawSprite
   4426 DD E1         [14]  211 	pop	ix
   4428 C9            [10]  212 	ret
                            213 ;src/entities/entities.c:55: void drawAll(TPlayer* player){
                            214 ;	---------------------------------
                            215 ; Function drawAll
                            216 ; ---------------------------------
   4429                     217 _drawAll::
                            218 ;src/entities/entities.c:57: dibujarPlayer(player);
   4429 C1            [10]  219 	pop	bc
   442A E1            [10]  220 	pop	hl
   442B E5            [11]  221 	push	hl
   442C C5            [11]  222 	push	bc
   442D E5            [11]  223 	push	hl
   442E CD F5 43      [17]  224 	call	_dibujarPlayer
   4431 F1            [10]  225 	pop	af
   4432 C9            [10]  226 	ret
                            227 	.area _CODE
                            228 	.area _INITIALIZER
                            229 	.area _CABS (ABS)
