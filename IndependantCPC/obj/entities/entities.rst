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
                             16 	.globl _moverAbajo
                             17 	.globl _moverIzquierda
                             18 	.globl _moverDerecha
                             19 	.globl _updatePlayer
                             20 	.globl _redibujarPlayer
                             21 	.globl _borrarPlayer
                             22 	.globl _dibujarPlayer
                             23 	.globl _drawAll
                             24 ;--------------------------------------------------------
                             25 ; special function registers
                             26 ;--------------------------------------------------------
                             27 ;--------------------------------------------------------
                             28 ; ram data
                             29 ;--------------------------------------------------------
                             30 	.area _DATA
                             31 ;--------------------------------------------------------
                             32 ; ram data
                             33 ;--------------------------------------------------------
                             34 	.area _INITIALIZED
                             35 ;--------------------------------------------------------
                             36 ; absolute external ram data
                             37 ;--------------------------------------------------------
                             38 	.area _DABS (ABS)
                             39 ;--------------------------------------------------------
                             40 ; global & static initialisations
                             41 ;--------------------------------------------------------
                             42 	.area _HOME
                             43 	.area _GSINIT
                             44 	.area _GSFINAL
                             45 	.area _GSINIT
                             46 ;--------------------------------------------------------
                             47 ; Home
                             48 ;--------------------------------------------------------
                             49 	.area _HOME
                             50 	.area _HOME
                             51 ;--------------------------------------------------------
                             52 ; code
                             53 ;--------------------------------------------------------
                             54 	.area _CODE
                             55 ;src/entities/entities.c:8: void incializarEntities(){
                             56 ;	---------------------------------
                             57 ; Function incializarEntities
                             58 ; ---------------------------------
   43AF                      59 _incializarEntities::
                             60 ;src/entities/entities.c:10: }
   43AF C9            [10]   61 	ret
                             62 ;src/entities/entities.c:14: void accion(TPlayer* player, TPlayerStatus action, TPlayerDirection dir){
                             63 ;	---------------------------------
                             64 ; Function accion
                             65 ; ---------------------------------
   43B0                      66 _accion::
   43B0 DD E5         [15]   67 	push	ix
   43B2 DD 21 00 00   [14]   68 	ld	ix,#0
   43B6 DD 39         [15]   69 	add	ix,sp
                             70 ;src/entities/entities.c:15: switch(action){
   43B8 DD 7E 06      [19]   71 	ld	a,6 (ix)
   43BB 3D            [ 4]   72 	dec	a
   43BC 20 4C         [12]   73 	jr	NZ,00108$
                             74 ;src/entities/entities.c:17: switch(dir){
   43BE 3E 03         [ 7]   75 	ld	a,#0x03
   43C0 DD 96 07      [19]   76 	sub	a, 7 (ix)
   43C3 38 45         [12]   77 	jr	C,00108$
   43C5 DD 5E 07      [19]   78 	ld	e,7 (ix)
   43C8 16 00         [ 7]   79 	ld	d,#0x00
   43CA 21 D0 43      [10]   80 	ld	hl,#00120$
   43CD 19            [11]   81 	add	hl,de
   43CE 19            [11]   82 	add	hl,de
                             83 ;src/entities/entities.c:18: case d_up:
   43CF E9            [ 4]   84 	jp	(hl)
   43D0                      85 00120$:
   43D0 18 06         [12]   86 	jr	00102$
   43D2 18 11         [12]   87 	jr	00103$
   43D4 18 29         [12]   88 	jr	00105$
   43D6 18 1A         [12]   89 	jr	00104$
   43D8                      90 00102$:
                             91 ;src/entities/entities.c:19: moverArriba(player);
   43D8 DD 6E 04      [19]   92 	ld	l,4 (ix)
   43DB DD 66 05      [19]   93 	ld	h,5 (ix)
   43DE E5            [11]   94 	push	hl
   43DF CD 0D 44      [17]   95 	call	_moverArriba
   43E2 F1            [10]   96 	pop	af
                             97 ;src/entities/entities.c:20: break;
   43E3 18 25         [12]   98 	jr	00108$
                             99 ;src/entities/entities.c:21: case d_down:
   43E5                     100 00103$:
                            101 ;src/entities/entities.c:22: moverAbajo(player);
   43E5 DD 6E 04      [19]  102 	ld	l,4 (ix)
   43E8 DD 66 05      [19]  103 	ld	h,5 (ix)
   43EB E5            [11]  104 	push	hl
   43EC CD 19 44      [17]  105 	call	_moverAbajo
   43EF F1            [10]  106 	pop	af
                            107 ;src/entities/entities.c:23: break;
   43F0 18 18         [12]  108 	jr	00108$
                            109 ;src/entities/entities.c:24: case d_left:
   43F2                     110 00104$:
                            111 ;src/entities/entities.c:25: moverIzquierda(player);
   43F2 DD 6E 04      [19]  112 	ld	l,4 (ix)
   43F5 DD 66 05      [19]  113 	ld	h,5 (ix)
   43F8 E5            [11]  114 	push	hl
   43F9 CD 44 44      [17]  115 	call	_moverIzquierda
   43FC F1            [10]  116 	pop	af
                            117 ;src/entities/entities.c:26: break;
   43FD 18 0B         [12]  118 	jr	00108$
                            119 ;src/entities/entities.c:27: case d_right:
   43FF                     120 00105$:
                            121 ;src/entities/entities.c:28: moverDerecha(player);
   43FF DD 6E 04      [19]  122 	ld	l,4 (ix)
   4402 DD 66 05      [19]  123 	ld	h,5 (ix)
   4405 E5            [11]  124 	push	hl
   4406 CD 4F 44      [17]  125 	call	_moverDerecha
   4409 F1            [10]  126 	pop	af
                            127 ;src/entities/entities.c:33: }
   440A                     128 00108$:
   440A DD E1         [14]  129 	pop	ix
   440C C9            [10]  130 	ret
                            131 ;src/entities/entities.c:36: void moverArriba(TPlayer* player){
                            132 ;	---------------------------------
                            133 ; Function moverArriba
                            134 ; ---------------------------------
   440D                     135 _moverArriba::
                            136 ;src/entities/entities.c:37: if (player->y > 0) {
   440D D1            [10]  137 	pop	de
   440E C1            [10]  138 	pop	bc
   440F C5            [11]  139 	push	bc
   4410 D5            [11]  140 	push	de
   4411 03            [ 6]  141 	inc	bc
   4412 0A            [ 7]  142 	ld	a,(bc)
   4413 B7            [ 4]  143 	or	a, a
   4414 C8            [11]  144 	ret	Z
                            145 ;src/entities/entities.c:38: player->y--;
   4415 C6 FF         [ 7]  146 	add	a,#0xFF
   4417 02            [ 7]  147 	ld	(bc),a
   4418 C9            [10]  148 	ret
                            149 ;src/entities/entities.c:45: void moverAbajo(TPlayer* player){
                            150 ;	---------------------------------
                            151 ; Function moverAbajo
                            152 ; ---------------------------------
   4419                     153 _moverAbajo::
   4419 DD E5         [15]  154 	push	ix
   441B DD 21 00 00   [14]  155 	ld	ix,#0
   441F DD 39         [15]  156 	add	ix,sp
                            157 ;src/entities/entities.c:46: if (player->y + G_NAVES_0_H < ALTO) {
   4421 DD 4E 04      [19]  158 	ld	c,4 (ix)
   4424 DD 46 05      [19]  159 	ld	b,5 (ix)
   4427 03            [ 6]  160 	inc	bc
   4428 0A            [ 7]  161 	ld	a,(bc)
   4429 5F            [ 4]  162 	ld	e,a
   442A 6B            [ 4]  163 	ld	l,e
   442B 26 00         [ 7]  164 	ld	h,#0x00
   442D D5            [11]  165 	push	de
   442E 11 10 00      [10]  166 	ld	de,#0x0010
   4431 19            [11]  167 	add	hl, de
   4432 D1            [10]  168 	pop	de
   4433 7D            [ 4]  169 	ld	a,l
   4434 D6 C8         [ 7]  170 	sub	a, #0xC8
   4436 7C            [ 4]  171 	ld	a,h
   4437 17            [ 4]  172 	rla
   4438 3F            [ 4]  173 	ccf
   4439 1F            [ 4]  174 	rra
   443A DE 80         [ 7]  175 	sbc	a, #0x80
   443C 30 03         [12]  176 	jr	NC,00103$
                            177 ;src/entities/entities.c:47: player->y++;
   443E 1C            [ 4]  178 	inc	e
   443F 7B            [ 4]  179 	ld	a,e
   4440 02            [ 7]  180 	ld	(bc),a
   4441                     181 00103$:
   4441 DD E1         [14]  182 	pop	ix
   4443 C9            [10]  183 	ret
                            184 ;src/entities/entities.c:54: void moverIzquierda(TPlayer* player){
                            185 ;	---------------------------------
                            186 ; Function moverIzquierda
                            187 ; ---------------------------------
   4444                     188 _moverIzquierda::
                            189 ;src/entities/entities.c:55: if (player->x > 0) {
   4444 D1            [10]  190 	pop	de
   4445 C1            [10]  191 	pop	bc
   4446 C5            [11]  192 	push	bc
   4447 D5            [11]  193 	push	de
   4448 0A            [ 7]  194 	ld	a,(bc)
   4449 B7            [ 4]  195 	or	a, a
   444A C8            [11]  196 	ret	Z
                            197 ;src/entities/entities.c:56: player->x--;
   444B C6 FF         [ 7]  198 	add	a,#0xFF
   444D 02            [ 7]  199 	ld	(bc),a
   444E C9            [10]  200 	ret
                            201 ;src/entities/entities.c:62: void moverDerecha(TPlayer* player){
                            202 ;	---------------------------------
                            203 ; Function moverDerecha
                            204 ; ---------------------------------
   444F                     205 _moverDerecha::
   444F DD E5         [15]  206 	push	ix
   4451 DD 21 00 00   [14]  207 	ld	ix,#0
   4455 DD 39         [15]  208 	add	ix,sp
                            209 ;src/entities/entities.c:63: if (player->x + G_NAVES_0_W < ANCHO) {
   4457 DD 4E 04      [19]  210 	ld	c,4 (ix)
   445A DD 46 05      [19]  211 	ld	b,5 (ix)
   445D 0A            [ 7]  212 	ld	a,(bc)
   445E 5F            [ 4]  213 	ld	e,a
   445F 6B            [ 4]  214 	ld	l,e
   4460 26 00         [ 7]  215 	ld	h,#0x00
   4462 D5            [11]  216 	push	de
   4463 11 08 00      [10]  217 	ld	de,#0x0008
   4466 19            [11]  218 	add	hl, de
   4467 D1            [10]  219 	pop	de
   4468 7D            [ 4]  220 	ld	a,l
   4469 D6 50         [ 7]  221 	sub	a, #0x50
   446B 7C            [ 4]  222 	ld	a,h
   446C 17            [ 4]  223 	rla
   446D 3F            [ 4]  224 	ccf
   446E 1F            [ 4]  225 	rra
   446F DE 80         [ 7]  226 	sbc	a, #0x80
   4471 30 03         [12]  227 	jr	NC,00103$
                            228 ;src/entities/entities.c:64: player->x++;
   4473 1C            [ 4]  229 	inc	e
   4474 7B            [ 4]  230 	ld	a,e
   4475 02            [ 7]  231 	ld	(bc),a
   4476                     232 00103$:
   4476 DD E1         [14]  233 	pop	ix
   4478 C9            [10]  234 	ret
                            235 ;src/entities/entities.c:72: void updatePlayer(TPlayer* player){
                            236 ;	---------------------------------
                            237 ; Function updatePlayer
                            238 ; ---------------------------------
   4479                     239 _updatePlayer::
                            240 ;src/entities/entities.c:74: }
   4479 C9            [10]  241 	ret
                            242 ;src/entities/entities.c:76: void redibujarPlayer(TPlayer* player){
                            243 ;	---------------------------------
                            244 ; Function redibujarPlayer
                            245 ; ---------------------------------
   447A                     246 _redibujarPlayer::
   447A DD E5         [15]  247 	push	ix
   447C DD 21 00 00   [14]  248 	ld	ix,#0
   4480 DD 39         [15]  249 	add	ix,sp
                            250 ;src/entities/entities.c:77: borrarPlayer(player);
   4482 DD 6E 04      [19]  251 	ld	l,4 (ix)
   4485 DD 66 05      [19]  252 	ld	h,5 (ix)
   4488 E5            [11]  253 	push	hl
   4489 CD AB 44      [17]  254 	call	_borrarPlayer
   448C F1            [10]  255 	pop	af
                            256 ;src/entities/entities.c:78: player->px = player->x;
   448D DD 4E 04      [19]  257 	ld	c,4 (ix)
   4490 DD 46 05      [19]  258 	ld	b,5 (ix)
   4493 59            [ 4]  259 	ld	e, c
   4494 50            [ 4]  260 	ld	d, b
   4495 13            [ 6]  261 	inc	de
   4496 13            [ 6]  262 	inc	de
   4497 0A            [ 7]  263 	ld	a,(bc)
   4498 12            [ 7]  264 	ld	(de),a
                            265 ;src/entities/entities.c:79: player->py = player->y;
   4499 59            [ 4]  266 	ld	e, c
   449A 50            [ 4]  267 	ld	d, b
   449B 13            [ 6]  268 	inc	de
   449C 13            [ 6]  269 	inc	de
   449D 13            [ 6]  270 	inc	de
   449E 69            [ 4]  271 	ld	l, c
   449F 60            [ 4]  272 	ld	h, b
   44A0 23            [ 6]  273 	inc	hl
   44A1 7E            [ 7]  274 	ld	a,(hl)
   44A2 12            [ 7]  275 	ld	(de),a
                            276 ;src/entities/entities.c:80: dibujarPlayer(player);
   44A3 C5            [11]  277 	push	bc
   44A4 CD AC 44      [17]  278 	call	_dibujarPlayer
   44A7 F1            [10]  279 	pop	af
   44A8 DD E1         [14]  280 	pop	ix
   44AA C9            [10]  281 	ret
                            282 ;src/entities/entities.c:83: void borrarPlayer(TPlayer* player){
                            283 ;	---------------------------------
                            284 ; Function borrarPlayer
                            285 ; ---------------------------------
   44AB                     286 _borrarPlayer::
                            287 ;src/entities/entities.c:85: }
   44AB C9            [10]  288 	ret
                            289 ;src/entities/entities.c:87: void dibujarPlayer(TPlayer* player){
                            290 ;	---------------------------------
                            291 ; Function dibujarPlayer
                            292 ; ---------------------------------
   44AC                     293 _dibujarPlayer::
   44AC DD E5         [15]  294 	push	ix
   44AE DD 21 00 00   [14]  295 	ld	ix,#0
   44B2 DD 39         [15]  296 	add	ix,sp
                            297 ;src/entities/entities.c:88: u8* vmem = cpct_getScreenPtr(CPCT_VMEM_START,player->x, player->y);
   44B4 DD 4E 04      [19]  298 	ld	c,4 (ix)
   44B7 DD 46 05      [19]  299 	ld	b,5 (ix)
   44BA 69            [ 4]  300 	ld	l, c
   44BB 60            [ 4]  301 	ld	h, b
   44BC 23            [ 6]  302 	inc	hl
   44BD 56            [ 7]  303 	ld	d,(hl)
   44BE 0A            [ 7]  304 	ld	a,(bc)
   44BF C5            [11]  305 	push	bc
   44C0 D5            [11]  306 	push	de
   44C1 33            [ 6]  307 	inc	sp
   44C2 F5            [11]  308 	push	af
   44C3 33            [ 6]  309 	inc	sp
   44C4 21 00 C0      [10]  310 	ld	hl,#0xC000
   44C7 E5            [11]  311 	push	hl
   44C8 CD 67 46      [17]  312 	call	_cpct_getScreenPtr
   44CB EB            [ 4]  313 	ex	de,hl
                            314 ;src/entities/entities.c:89: cpct_drawSprite(player->sprite,vmem,G_NAVES_0_W,G_NAVES_0_H);
   44CC E1            [10]  315 	pop	hl
   44CD 01 04 00      [10]  316 	ld	bc, #0x0004
   44D0 09            [11]  317 	add	hl, bc
   44D1 4E            [ 7]  318 	ld	c,(hl)
   44D2 23            [ 6]  319 	inc	hl
   44D3 46            [ 7]  320 	ld	b,(hl)
   44D4 21 08 10      [10]  321 	ld	hl,#0x1008
   44D7 E5            [11]  322 	push	hl
   44D8 D5            [11]  323 	push	de
   44D9 C5            [11]  324 	push	bc
   44DA CD 83 45      [17]  325 	call	_cpct_drawSprite
   44DD DD E1         [14]  326 	pop	ix
   44DF C9            [10]  327 	ret
                            328 ;src/entities/entities.c:92: void drawAll(TPlayer* player){
                            329 ;	---------------------------------
                            330 ; Function drawAll
                            331 ; ---------------------------------
   44E0                     332 _drawAll::
                            333 ;src/entities/entities.c:94: dibujarPlayer(player);
   44E0 C1            [10]  334 	pop	bc
   44E1 E1            [10]  335 	pop	hl
   44E2 E5            [11]  336 	push	hl
   44E3 C5            [11]  337 	push	bc
   44E4 E5            [11]  338 	push	hl
   44E5 CD AC 44      [17]  339 	call	_dibujarPlayer
   44E8 F1            [10]  340 	pop	af
   44E9 C9            [10]  341 	ret
                            342 	.area _CODE
                            343 	.area _INITIALIZER
                            344 	.area _CABS (ABS)
