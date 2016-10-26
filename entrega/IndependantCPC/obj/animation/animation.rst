                              1 ;--------------------------------------------------------
                              2 ; File Created by SDCC : free open source ANSI-C Compiler
                              3 ; Version 3.5.5 #9498 (Linux)
                              4 ;--------------------------------------------------------
                              5 	.module animation
                              6 	.optsdcc -mz80
                              7 	
                              8 ;--------------------------------------------------------
                              9 ; Public variables in this module
                             10 ;--------------------------------------------------------
                             11 	.globl _calculaEntity
                             12 	.globl _borrarEntity
                             13 	.globl _explosion
                             14 	.globl _g_frames
                             15 	.globl _getExplosion
                             16 	.globl _explosionBala
                             17 	.globl _updateXY
                             18 	.globl _updateExplosion
                             19 ;--------------------------------------------------------
                             20 ; special function registers
                             21 ;--------------------------------------------------------
                             22 ;--------------------------------------------------------
                             23 ; ram data
                             24 ;--------------------------------------------------------
                             25 	.area _DATA
                             26 ;--------------------------------------------------------
                             27 ; ram data
                             28 ;--------------------------------------------------------
                             29 	.area _INITIALIZED
                             30 ;--------------------------------------------------------
                             31 ; absolute external ram data
                             32 ;--------------------------------------------------------
                             33 	.area _DABS (ABS)
                             34 ;--------------------------------------------------------
                             35 ; global & static initialisations
                             36 ;--------------------------------------------------------
                             37 	.area _HOME
                             38 	.area _GSINIT
                             39 	.area _GSFINAL
                             40 	.area _GSINIT
                             41 ;--------------------------------------------------------
                             42 ; Home
                             43 ;--------------------------------------------------------
                             44 	.area _HOME
                             45 	.area _HOME
                             46 ;--------------------------------------------------------
                             47 ; code
                             48 ;--------------------------------------------------------
                             49 	.area _CODE
                             50 ;src/animation/animation.c:40: TStaticAnimation* getExplosion(){
                             51 ;	---------------------------------
                             52 ; Function getExplosion
                             53 ; ---------------------------------
   63BD                      54 _getExplosion::
                             55 ;src/animation/animation.c:41: return &explosion;
   63BD 21 DD 63      [10]   56 	ld	hl,#_explosion
   63C0 C9            [10]   57 	ret
   63C1                      58 _g_frames:
   63C1 C0 53                59 	.dw _g_explosion_00
   63C3 E0 53                60 	.dw _g_explosion_01
   63C5 00 54                61 	.dw _g_explosion_02
   63C7 20 54                62 	.dw _g_explosion_03
   63C9 40 54                63 	.dw _g_explosion_04
   63CB 60 54                64 	.dw _g_explosion_05
   63CD 80 54                65 	.dw _g_explosion_06
   63CF A0 54                66 	.dw _g_explosion_07
   63D1 C0 54                67 	.dw _g_explosion_08
   63D3 E0 54                68 	.dw _g_explosion_09
   63D5 00 55                69 	.dw _g_explosion_10
   63D7 20 55                70 	.dw _g_explosion_11
   63D9 00                   71 	.db 0x00
   63DA 00                   72 	.db 0x00
   63DB 00                   73 	.db 0x00
   63DC 00                   74 	.db 0x00
   63DD                      75 _explosion:
   63DD 00                   76 	.db #0x00	; 0
   63DE 00 00                77 	.dw #0x0000
   63E0 00 00                78 	.dw #0x0000
   63E2 00 00                79 	.dw #0x0000
   63E4 00 00                80 	.dw #0x0000
   63E6 00                   81 	.db #0x00	; 0
   63E7 00                   82 	.db #0x00	; 0
   63E8 00                   83 	.db #0x00	; 0
   63E9 00 00                84 	.dw #0x0000
   63EB 00 00                85 	.dw #0x0000
   63ED 00 00                86 	.dw #0x0000
   63EF 00 00                87 	.dw #0x0000
   63F1 04                   88 	.db #0x04	; 4
   63F2 08                   89 	.db #0x08	; 8
   63F3 00                   90 	.db #0x00	; 0
   63F4 00                   91 	.db #0x00	; 0
   63F5 00                   92 	.byte #0x00
   63F6 00                   93 	.byte #0x00
   63F7 00                   94 	.byte #0x00
   63F8 00                   95 	.byte #0x00
   63F9 00                   96 	.db #0x00	; 0
   63FA 00                   97 	.db #0x00	; 0
   63FB 00                   98 	.db #0x00	; 0
   63FC 00                   99 	.db #0x00	; 0
   63FD 00                  100 	.db #0x00	; 0
   63FE 00                  101 	.db #0x00	; 0
   63FF 00 00               102 	.dw #0x0000
                            103 ;src/animation/animation.c:46: void explosionBala(TBullet* bullet){
                            104 ;	---------------------------------
                            105 ; Function explosionBala
                            106 ; ---------------------------------
   6401                     107 _explosionBala::
   6401 DD E5         [15]  108 	push	ix
   6403 DD 21 00 00   [14]  109 	ld	ix,#0
   6407 DD 39         [15]  110 	add	ix,sp
   6409 F5            [11]  111 	push	af
                            112 ;src/animation/animation.c:48: if(bullet->state == es_disparado){
   640A DD 4E 04      [19]  113 	ld	c,4 (ix)
   640D DD 46 05      [19]  114 	ld	b,5 (ix)
   6410 21 02 00      [10]  115 	ld	hl,#0x0002
   6413 09            [11]  116 	add	hl,bc
   6414 E3            [19]  117 	ex	(sp), hl
   6415 E1            [10]  118 	pop	hl
   6416 E5            [11]  119 	push	hl
   6417 7E            [ 7]  120 	ld	a,(hl)
   6418 D6 02         [ 7]  121 	sub	a, #0x02
   641A 20 50         [12]  122 	jr	NZ,00103$
                            123 ;src/animation/animation.c:50: exp = &explosion;
                            124 ;src/animation/animation.c:51: exp->n_frames = 0;
   641C 21 DD 63      [10]  125 	ld	hl,#_explosion
   641F 36 00         [10]  126 	ld	(hl),#0x00
                            127 ;src/animation/animation.c:52: exp->ent.draw = SI;
   6421 21 E8 63      [10]  128 	ld	hl,#(_explosion + 0x000b)
   6424 36 01         [10]  129 	ld	(hl),#0x01
                            130 ;src/animation/animation.c:54: updateXY(&exp->ent, bullet->ent.x, bullet->ent.y);
   6426 C5            [11]  131 	push	bc
   6427 FD E1         [14]  132 	pop	iy
   6429 69            [ 4]  133 	ld	l, c
   642A 60            [ 4]  134 	ld	h, b
   642B 11 05 00      [10]  135 	ld	de, #0x0005
   642E 19            [11]  136 	add	hl, de
   642F 5E            [ 7]  137 	ld	e,(hl)
   6430 23            [ 6]  138 	inc	hl
   6431 56            [ 7]  139 	ld	d,(hl)
   6432 FD 6E 03      [19]  140 	ld	l,3 (iy)
   6435 FD 66 04      [19]  141 	ld	h,4 (iy)
   6438 C5            [11]  142 	push	bc
   6439 D5            [11]  143 	push	de
   643A E5            [11]  144 	push	hl
   643B 21 DE 63      [10]  145 	ld	hl,#(_explosion + 0x0001)
   643E E5            [11]  146 	push	hl
   643F CD 71 64      [17]  147 	call	_updateXY
   6442 21 06 00      [10]  148 	ld	hl,#6
   6445 39            [11]  149 	add	hl,sp
   6446 F9            [ 6]  150 	ld	sp,hl
   6447 C1            [10]  151 	pop	bc
                            152 ;src/animation/animation.c:56: exp->ent.sprites[0] = g_frames[0];
   6448 ED 5B C1 63   [20]  153 	ld	de, (#_g_frames + 0)
   644C ED 53 E9 63   [20]  154 	ld	((_explosion + 0x000c)), de
                            155 ;src/animation/animation.c:57: exp->ent.curr_dir = 0;
   6450 21 F3 63      [10]  156 	ld	hl,#(_explosion + 0x0016)
   6453 36 00         [10]  157 	ld	(hl),#0x00
                            158 ;src/animation/animation.c:58: exp->ent.cuadrante = mapaActual;
   6455 21 FA 63      [10]  159 	ld	hl,#(_explosion + 0x001d)
   6458 3A 03 86      [13]  160 	ld	a,(#_mapaActual + 0)
   645B 77            [ 7]  161 	ld	(hl),a
                            162 ;src/animation/animation.c:59: bullet->ent.draw = NO;
   645C 21 0D 00      [10]  163 	ld	hl,#0x000D
   645F 09            [11]  164 	add	hl,bc
   6460 36 00         [10]  165 	ld	(hl),#0x00
                            166 ;src/animation/animation.c:60: bullet->ent.vivo = NO;
   6462 21 1E 00      [10]  167 	ld	hl,#0x001E
   6465 09            [11]  168 	add	hl,bc
   6466 36 00         [10]  169 	ld	(hl),#0x00
                            170 ;src/animation/animation.c:61: bullet->state = es_explotando;	//Cambiamos a la bala estado explotando
   6468 E1            [10]  171 	pop	hl
   6469 E5            [11]  172 	push	hl
   646A 36 03         [10]  173 	ld	(hl),#0x03
   646C                     174 00103$:
   646C DD F9         [10]  175 	ld	sp, ix
   646E DD E1         [14]  176 	pop	ix
   6470 C9            [10]  177 	ret
                            178 ;src/animation/animation.c:67: void updateXY(TEntity* ent1, i16 x, i16 y){
                            179 ;	---------------------------------
                            180 ; Function updateXY
                            181 ; ---------------------------------
   6471                     182 _updateXY::
                            183 ;src/animation/animation.c:68: ent1->x = x;
   6471 D1            [10]  184 	pop	de
   6472 C1            [10]  185 	pop	bc
   6473 C5            [11]  186 	push	bc
   6474 D5            [11]  187 	push	de
   6475 69            [ 4]  188 	ld	l, c
   6476 60            [ 4]  189 	ld	h, b
   6477 FD 21 04 00   [14]  190 	ld	iy,#4
   647B FD 39         [15]  191 	add	iy,sp
   647D FD 7E 00      [19]  192 	ld	a,0 (iy)
   6480 77            [ 7]  193 	ld	(hl),a
   6481 23            [ 6]  194 	inc	hl
   6482 FD 7E 01      [19]  195 	ld	a,1 (iy)
   6485 77            [ 7]  196 	ld	(hl),a
                            197 ;src/animation/animation.c:69: ent1->y = y;
   6486 59            [ 4]  198 	ld	e, c
   6487 50            [ 4]  199 	ld	d, b
   6488 13            [ 6]  200 	inc	de
   6489 13            [ 6]  201 	inc	de
   648A FD 21 06 00   [14]  202 	ld	iy,#6
   648E FD 39         [15]  203 	add	iy,sp
   6490 FD 7E 00      [19]  204 	ld	a,0 (iy)
   6493 12            [ 7]  205 	ld	(de),a
   6494 13            [ 6]  206 	inc	de
   6495 FD 7E 01      [19]  207 	ld	a,1 (iy)
   6498 12            [ 7]  208 	ld	(de),a
                            209 ;src/animation/animation.c:70: ent1->px = x;
   6499 21 04 00      [10]  210 	ld	hl,#0x0004
   649C 09            [11]  211 	add	hl,bc
   649D FD 21 04 00   [14]  212 	ld	iy,#4
   64A1 FD 39         [15]  213 	add	iy,sp
   64A3 FD 7E 00      [19]  214 	ld	a,0 (iy)
   64A6 77            [ 7]  215 	ld	(hl),a
   64A7 23            [ 6]  216 	inc	hl
   64A8 FD 7E 01      [19]  217 	ld	a,1 (iy)
   64AB 77            [ 7]  218 	ld	(hl),a
                            219 ;src/animation/animation.c:71: ent1->py = y;
   64AC 21 06 00      [10]  220 	ld	hl,#0x0006
   64AF 09            [11]  221 	add	hl,bc
   64B0 FD 21 06 00   [14]  222 	ld	iy,#6
   64B4 FD 39         [15]  223 	add	iy,sp
   64B6 FD 7E 00      [19]  224 	ld	a,0 (iy)
   64B9 77            [ 7]  225 	ld	(hl),a
   64BA 23            [ 6]  226 	inc	hl
   64BB FD 7E 01      [19]  227 	ld	a,1 (iy)
   64BE 77            [ 7]  228 	ld	(hl),a
   64BF C9            [10]  229 	ret
                            230 ;src/animation/animation.c:74: void updateExplosion(TBullet* bullet){
                            231 ;	---------------------------------
                            232 ; Function updateExplosion
                            233 ; ---------------------------------
   64C0                     234 _updateExplosion::
   64C0 DD E5         [15]  235 	push	ix
   64C2 DD 21 00 00   [14]  236 	ld	ix,#0
   64C6 DD 39         [15]  237 	add	ix,sp
                            238 ;src/animation/animation.c:76: if(bullet->state == es_explotando){	//Solo se updatea si está en estado de explosión	
   64C8 DD 4E 04      [19]  239 	ld	c,4 (ix)
   64CB DD 46 05      [19]  240 	ld	b,5 (ix)
   64CE 03            [ 6]  241 	inc	bc
   64CF 03            [ 6]  242 	inc	bc
   64D0 0A            [ 7]  243 	ld	a,(bc)
   64D1 D6 03         [ 7]  244 	sub	a, #0x03
   64D3 20 4B         [12]  245 	jr	NZ,00105$
                            246 ;src/animation/animation.c:77: exp = &explosion;
                            247 ;src/animation/animation.c:78: exp->ent.draw = SI;
   64D5 21 E8 63      [10]  248 	ld	hl,#(_explosion + 0x000b)
   64D8 36 01         [10]  249 	ld	(hl),#0x01
                            250 ;src/animation/animation.c:79: exp->ent.cuadrante = mapaActual;
   64DA 21 FA 63      [10]  251 	ld	hl,#(_explosion + 0x001d)
   64DD 3A 03 86      [13]  252 	ld	a,(#_mapaActual + 0)
   64E0 77            [ 7]  253 	ld	(hl),a
                            254 ;src/animation/animation.c:81: exp->ent.sprites[0] = g_frames[exp->n_frames];
   64E1 11 C1 63      [10]  255 	ld	de,#_g_frames+0
   64E4 21 DD 63      [10]  256 	ld	hl, #_explosion + 0
   64E7 6E            [ 7]  257 	ld	l,(hl)
   64E8 26 00         [ 7]  258 	ld	h,#0x00
   64EA 29            [11]  259 	add	hl, hl
   64EB 19            [11]  260 	add	hl,de
   64EC 5E            [ 7]  261 	ld	e,(hl)
   64ED 23            [ 6]  262 	inc	hl
   64EE 56            [ 7]  263 	ld	d,(hl)
   64EF ED 53 E9 63   [20]  264 	ld	((_explosion + 0x000c)), de
                            265 ;src/animation/animation.c:82: exp->n_frames = exp->n_frames + 1;
   64F3 3A DD 63      [13]  266 	ld	a, (#_explosion + 0)
   64F6 3C            [ 4]  267 	inc	a
   64F7 32 DD 63      [13]  268 	ld	(#_explosion),a
                            269 ;src/animation/animation.c:83: if(exp->n_frames == EXPLOSION_FRAMES - 1){
   64FA D6 0D         [ 7]  270 	sub	a, #0x0D
   64FC 20 22         [12]  271 	jr	NZ,00105$
                            272 ;src/animation/animation.c:84: calculaEntity(&exp->ent,SI);
   64FE C5            [11]  273 	push	bc
   64FF 3E 01         [ 7]  274 	ld	a,#0x01
   6501 F5            [11]  275 	push	af
   6502 33            [ 6]  276 	inc	sp
   6503 21 DE 63      [10]  277 	ld	hl,#(_explosion + 0x0001)
   6506 E5            [11]  278 	push	hl
   6507 CD 6C 95      [17]  279 	call	_calculaEntity
   650A 33            [ 6]  280 	inc	sp
   650B 21 DE 63      [10]  281 	ld	hl,#(_explosion + 0x0001)
   650E E3            [19]  282 	ex	(sp),hl
   650F CD BA 94      [17]  283 	call	_borrarEntity
   6512 F1            [10]  284 	pop	af
   6513 C1            [10]  285 	pop	bc
                            286 ;src/animation/animation.c:86: exp->ent.draw = NO;
   6514 21 E8 63      [10]  287 	ld	hl,#(_explosion + 0x000b)
   6517 36 00         [10]  288 	ld	(hl),#0x00
                            289 ;src/animation/animation.c:87: bullet->state = es_static;
   6519 AF            [ 4]  290 	xor	a, a
   651A 02            [ 7]  291 	ld	(bc),a
                            292 ;src/animation/animation.c:88: exp->n_frames = 0;
   651B 21 DD 63      [10]  293 	ld	hl,#_explosion
   651E 36 00         [10]  294 	ld	(hl),#0x00
   6520                     295 00105$:
   6520 DD E1         [14]  296 	pop	ix
   6522 C9            [10]  297 	ret
                            298 	.area _CODE
                            299 	.area _INITIALIZER
                            300 	.area _CABS (ABS)
