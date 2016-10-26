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
   6371                      54 _getExplosion::
                             55 ;src/animation/animation.c:41: return &explosion;
   6371 21 91 63      [10]   56 	ld	hl,#_explosion
   6374 C9            [10]   57 	ret
   6375                      58 _g_frames:
   6375 C0 53                59 	.dw _g_explosion_00
   6377 E0 53                60 	.dw _g_explosion_01
   6379 00 54                61 	.dw _g_explosion_02
   637B 20 54                62 	.dw _g_explosion_03
   637D 40 54                63 	.dw _g_explosion_04
   637F 60 54                64 	.dw _g_explosion_05
   6381 80 54                65 	.dw _g_explosion_06
   6383 A0 54                66 	.dw _g_explosion_07
   6385 C0 54                67 	.dw _g_explosion_08
   6387 E0 54                68 	.dw _g_explosion_09
   6389 00 55                69 	.dw _g_explosion_10
   638B 20 55                70 	.dw _g_explosion_11
   638D 00                   71 	.db 0x00
   638E 00                   72 	.db 0x00
   638F 00                   73 	.db 0x00
   6390 00                   74 	.db 0x00
   6391                      75 _explosion:
   6391 00                   76 	.db #0x00	; 0
   6392 00 00                77 	.dw #0x0000
   6394 00 00                78 	.dw #0x0000
   6396 00 00                79 	.dw #0x0000
   6398 00 00                80 	.dw #0x0000
   639A 00                   81 	.db #0x00	; 0
   639B 00                   82 	.db #0x00	; 0
   639C 00                   83 	.db #0x00	; 0
   639D 00 00                84 	.dw #0x0000
   639F 00 00                85 	.dw #0x0000
   63A1 00 00                86 	.dw #0x0000
   63A3 00 00                87 	.dw #0x0000
   63A5 04                   88 	.db #0x04	; 4
   63A6 08                   89 	.db #0x08	; 8
   63A7 00                   90 	.db #0x00	; 0
   63A8 00                   91 	.db #0x00	; 0
   63A9 00                   92 	.byte #0x00
   63AA 00                   93 	.byte #0x00
   63AB 00                   94 	.byte #0x00
   63AC 00                   95 	.byte #0x00
   63AD 00                   96 	.db #0x00	; 0
   63AE 00                   97 	.db #0x00	; 0
   63AF 00                   98 	.db #0x00	; 0
   63B0 00                   99 	.db #0x00	; 0
   63B1 00                  100 	.db #0x00	; 0
   63B2 00                  101 	.db #0x00	; 0
   63B3 00 00               102 	.dw #0x0000
                            103 ;src/animation/animation.c:46: void explosionBala(TBullet* bullet){
                            104 ;	---------------------------------
                            105 ; Function explosionBala
                            106 ; ---------------------------------
   63B5                     107 _explosionBala::
   63B5 DD E5         [15]  108 	push	ix
   63B7 DD 21 00 00   [14]  109 	ld	ix,#0
   63BB DD 39         [15]  110 	add	ix,sp
   63BD F5            [11]  111 	push	af
                            112 ;src/animation/animation.c:48: if(bullet->state == es_disparado){
   63BE DD 4E 04      [19]  113 	ld	c,4 (ix)
   63C1 DD 46 05      [19]  114 	ld	b,5 (ix)
   63C4 21 02 00      [10]  115 	ld	hl,#0x0002
   63C7 09            [11]  116 	add	hl,bc
   63C8 E3            [19]  117 	ex	(sp), hl
   63C9 E1            [10]  118 	pop	hl
   63CA E5            [11]  119 	push	hl
   63CB 7E            [ 7]  120 	ld	a,(hl)
   63CC D6 02         [ 7]  121 	sub	a, #0x02
   63CE 20 50         [12]  122 	jr	NZ,00103$
                            123 ;src/animation/animation.c:50: exp = &explosion;
                            124 ;src/animation/animation.c:51: exp->n_frames = 0;
   63D0 21 91 63      [10]  125 	ld	hl,#_explosion
   63D3 36 00         [10]  126 	ld	(hl),#0x00
                            127 ;src/animation/animation.c:52: exp->ent.draw = SI;
   63D5 21 9C 63      [10]  128 	ld	hl,#(_explosion + 0x000b)
   63D8 36 01         [10]  129 	ld	(hl),#0x01
                            130 ;src/animation/animation.c:54: updateXY(&exp->ent, bullet->ent.x, bullet->ent.y);
   63DA C5            [11]  131 	push	bc
   63DB FD E1         [14]  132 	pop	iy
   63DD 69            [ 4]  133 	ld	l, c
   63DE 60            [ 4]  134 	ld	h, b
   63DF 11 05 00      [10]  135 	ld	de, #0x0005
   63E2 19            [11]  136 	add	hl, de
   63E3 5E            [ 7]  137 	ld	e,(hl)
   63E4 23            [ 6]  138 	inc	hl
   63E5 56            [ 7]  139 	ld	d,(hl)
   63E6 FD 6E 03      [19]  140 	ld	l,3 (iy)
   63E9 FD 66 04      [19]  141 	ld	h,4 (iy)
   63EC C5            [11]  142 	push	bc
   63ED D5            [11]  143 	push	de
   63EE E5            [11]  144 	push	hl
   63EF 21 92 63      [10]  145 	ld	hl,#(_explosion + 0x0001)
   63F2 E5            [11]  146 	push	hl
   63F3 CD 25 64      [17]  147 	call	_updateXY
   63F6 21 06 00      [10]  148 	ld	hl,#6
   63F9 39            [11]  149 	add	hl,sp
   63FA F9            [ 6]  150 	ld	sp,hl
   63FB C1            [10]  151 	pop	bc
                            152 ;src/animation/animation.c:56: exp->ent.sprites[0] = g_frames[0];
   63FC ED 5B 75 63   [20]  153 	ld	de, (#_g_frames + 0)
   6400 ED 53 9D 63   [20]  154 	ld	((_explosion + 0x000c)), de
                            155 ;src/animation/animation.c:57: exp->ent.curr_dir = 0;
   6404 21 A7 63      [10]  156 	ld	hl,#(_explosion + 0x0016)
   6407 36 00         [10]  157 	ld	(hl),#0x00
                            158 ;src/animation/animation.c:58: exp->ent.cuadrante = mapaActual;
   6409 21 AE 63      [10]  159 	ld	hl,#(_explosion + 0x001d)
   640C 3A 8F 85      [13]  160 	ld	a,(#_mapaActual + 0)
   640F 77            [ 7]  161 	ld	(hl),a
                            162 ;src/animation/animation.c:59: bullet->ent.draw = NO;
   6410 21 0D 00      [10]  163 	ld	hl,#0x000D
   6413 09            [11]  164 	add	hl,bc
   6414 36 00         [10]  165 	ld	(hl),#0x00
                            166 ;src/animation/animation.c:60: bullet->ent.vivo = NO;
   6416 21 1E 00      [10]  167 	ld	hl,#0x001E
   6419 09            [11]  168 	add	hl,bc
   641A 36 00         [10]  169 	ld	(hl),#0x00
                            170 ;src/animation/animation.c:61: bullet->state = es_explotando;	//Cambiamos a la bala estado explotando
   641C E1            [10]  171 	pop	hl
   641D E5            [11]  172 	push	hl
   641E 36 03         [10]  173 	ld	(hl),#0x03
   6420                     174 00103$:
   6420 DD F9         [10]  175 	ld	sp, ix
   6422 DD E1         [14]  176 	pop	ix
   6424 C9            [10]  177 	ret
                            178 ;src/animation/animation.c:67: void updateXY(TEntity* ent1, i16 x, i16 y){
                            179 ;	---------------------------------
                            180 ; Function updateXY
                            181 ; ---------------------------------
   6425                     182 _updateXY::
                            183 ;src/animation/animation.c:68: ent1->x = x;
   6425 D1            [10]  184 	pop	de
   6426 C1            [10]  185 	pop	bc
   6427 C5            [11]  186 	push	bc
   6428 D5            [11]  187 	push	de
   6429 69            [ 4]  188 	ld	l, c
   642A 60            [ 4]  189 	ld	h, b
   642B FD 21 04 00   [14]  190 	ld	iy,#4
   642F FD 39         [15]  191 	add	iy,sp
   6431 FD 7E 00      [19]  192 	ld	a,0 (iy)
   6434 77            [ 7]  193 	ld	(hl),a
   6435 23            [ 6]  194 	inc	hl
   6436 FD 7E 01      [19]  195 	ld	a,1 (iy)
   6439 77            [ 7]  196 	ld	(hl),a
                            197 ;src/animation/animation.c:69: ent1->y = y;
   643A 59            [ 4]  198 	ld	e, c
   643B 50            [ 4]  199 	ld	d, b
   643C 13            [ 6]  200 	inc	de
   643D 13            [ 6]  201 	inc	de
   643E FD 21 06 00   [14]  202 	ld	iy,#6
   6442 FD 39         [15]  203 	add	iy,sp
   6444 FD 7E 00      [19]  204 	ld	a,0 (iy)
   6447 12            [ 7]  205 	ld	(de),a
   6448 13            [ 6]  206 	inc	de
   6449 FD 7E 01      [19]  207 	ld	a,1 (iy)
   644C 12            [ 7]  208 	ld	(de),a
                            209 ;src/animation/animation.c:70: ent1->px = x;
   644D 21 04 00      [10]  210 	ld	hl,#0x0004
   6450 09            [11]  211 	add	hl,bc
   6451 FD 21 04 00   [14]  212 	ld	iy,#4
   6455 FD 39         [15]  213 	add	iy,sp
   6457 FD 7E 00      [19]  214 	ld	a,0 (iy)
   645A 77            [ 7]  215 	ld	(hl),a
   645B 23            [ 6]  216 	inc	hl
   645C FD 7E 01      [19]  217 	ld	a,1 (iy)
   645F 77            [ 7]  218 	ld	(hl),a
                            219 ;src/animation/animation.c:71: ent1->py = y;
   6460 21 06 00      [10]  220 	ld	hl,#0x0006
   6463 09            [11]  221 	add	hl,bc
   6464 FD 21 06 00   [14]  222 	ld	iy,#6
   6468 FD 39         [15]  223 	add	iy,sp
   646A FD 7E 00      [19]  224 	ld	a,0 (iy)
   646D 77            [ 7]  225 	ld	(hl),a
   646E 23            [ 6]  226 	inc	hl
   646F FD 7E 01      [19]  227 	ld	a,1 (iy)
   6472 77            [ 7]  228 	ld	(hl),a
   6473 C9            [10]  229 	ret
                            230 ;src/animation/animation.c:74: void updateExplosion(TBullet* bullet){
                            231 ;	---------------------------------
                            232 ; Function updateExplosion
                            233 ; ---------------------------------
   6474                     234 _updateExplosion::
   6474 DD E5         [15]  235 	push	ix
   6476 DD 21 00 00   [14]  236 	ld	ix,#0
   647A DD 39         [15]  237 	add	ix,sp
                            238 ;src/animation/animation.c:76: if(bullet->state == es_explotando){	//Solo se updatea si está en estado de explosión	
   647C DD 4E 04      [19]  239 	ld	c,4 (ix)
   647F DD 46 05      [19]  240 	ld	b,5 (ix)
   6482 03            [ 6]  241 	inc	bc
   6483 03            [ 6]  242 	inc	bc
   6484 0A            [ 7]  243 	ld	a,(bc)
   6485 D6 03         [ 7]  244 	sub	a, #0x03
   6487 20 4B         [12]  245 	jr	NZ,00105$
                            246 ;src/animation/animation.c:77: exp = &explosion;
                            247 ;src/animation/animation.c:78: exp->ent.draw = SI;
   6489 21 9C 63      [10]  248 	ld	hl,#(_explosion + 0x000b)
   648C 36 01         [10]  249 	ld	(hl),#0x01
                            250 ;src/animation/animation.c:79: exp->ent.cuadrante = mapaActual;
   648E 21 AE 63      [10]  251 	ld	hl,#(_explosion + 0x001d)
   6491 3A 8F 85      [13]  252 	ld	a,(#_mapaActual + 0)
   6494 77            [ 7]  253 	ld	(hl),a
                            254 ;src/animation/animation.c:81: exp->ent.sprites[0] = g_frames[exp->n_frames];
   6495 11 75 63      [10]  255 	ld	de,#_g_frames+0
   6498 21 91 63      [10]  256 	ld	hl, #_explosion + 0
   649B 6E            [ 7]  257 	ld	l,(hl)
   649C 26 00         [ 7]  258 	ld	h,#0x00
   649E 29            [11]  259 	add	hl, hl
   649F 19            [11]  260 	add	hl,de
   64A0 5E            [ 7]  261 	ld	e,(hl)
   64A1 23            [ 6]  262 	inc	hl
   64A2 56            [ 7]  263 	ld	d,(hl)
   64A3 ED 53 9D 63   [20]  264 	ld	((_explosion + 0x000c)), de
                            265 ;src/animation/animation.c:82: exp->n_frames = exp->n_frames + 1;
   64A7 3A 91 63      [13]  266 	ld	a, (#_explosion + 0)
   64AA 3C            [ 4]  267 	inc	a
   64AB 32 91 63      [13]  268 	ld	(#_explosion),a
                            269 ;src/animation/animation.c:83: if(exp->n_frames == EXPLOSION_FRAMES - 1){
   64AE D6 0D         [ 7]  270 	sub	a, #0x0D
   64B0 20 22         [12]  271 	jr	NZ,00105$
                            272 ;src/animation/animation.c:84: calculaEntity(&exp->ent,SI);
   64B2 C5            [11]  273 	push	bc
   64B3 3E 01         [ 7]  274 	ld	a,#0x01
   64B5 F5            [11]  275 	push	af
   64B6 33            [ 6]  276 	inc	sp
   64B7 21 92 63      [10]  277 	ld	hl,#(_explosion + 0x0001)
   64BA E5            [11]  278 	push	hl
   64BB CD F8 94      [17]  279 	call	_calculaEntity
   64BE 33            [ 6]  280 	inc	sp
   64BF 21 92 63      [10]  281 	ld	hl,#(_explosion + 0x0001)
   64C2 E3            [19]  282 	ex	(sp),hl
   64C3 CD 46 94      [17]  283 	call	_borrarEntity
   64C6 F1            [10]  284 	pop	af
   64C7 C1            [10]  285 	pop	bc
                            286 ;src/animation/animation.c:86: exp->ent.draw = NO;
   64C8 21 9C 63      [10]  287 	ld	hl,#(_explosion + 0x000b)
   64CB 36 00         [10]  288 	ld	(hl),#0x00
                            289 ;src/animation/animation.c:87: bullet->state = es_static;
   64CD AF            [ 4]  290 	xor	a, a
   64CE 02            [ 7]  291 	ld	(bc),a
                            292 ;src/animation/animation.c:88: exp->n_frames = 0;
   64CF 21 91 63      [10]  293 	ld	hl,#_explosion
   64D2 36 00         [10]  294 	ld	(hl),#0x00
   64D4                     295 00105$:
   64D4 DD E1         [14]  296 	pop	ix
   64D6 C9            [10]  297 	ret
                            298 	.area _CODE
                            299 	.area _INITIALIZER
                            300 	.area _CABS (ABS)
