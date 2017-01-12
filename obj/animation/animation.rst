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
   6389                      54 _getExplosion::
                             55 ;src/animation/animation.c:41: return &explosion;
   6389 21 A9 63      [10]   56 	ld	hl,#_explosion
   638C C9            [10]   57 	ret
   638D                      58 _g_frames:
   638D C0 53                59 	.dw _g_explosion_00
   638F E0 53                60 	.dw _g_explosion_01
   6391 00 54                61 	.dw _g_explosion_02
   6393 20 54                62 	.dw _g_explosion_03
   6395 40 54                63 	.dw _g_explosion_04
   6397 60 54                64 	.dw _g_explosion_05
   6399 80 54                65 	.dw _g_explosion_06
   639B A0 54                66 	.dw _g_explosion_07
   639D C0 54                67 	.dw _g_explosion_08
   639F E0 54                68 	.dw _g_explosion_09
   63A1 00 55                69 	.dw _g_explosion_10
   63A3 20 55                70 	.dw _g_explosion_11
   63A5 00                   71 	.db 0x00
   63A6 00                   72 	.db 0x00
   63A7 00                   73 	.db 0x00
   63A8 00                   74 	.db 0x00
   63A9                      75 _explosion:
   63A9 00                   76 	.db #0x00	; 0
   63AA 00 00                77 	.dw #0x0000
   63AC 00 00                78 	.dw #0x0000
   63AE 00 00                79 	.dw #0x0000
   63B0 00 00                80 	.dw #0x0000
   63B2 00                   81 	.db #0x00	; 0
   63B3 00                   82 	.db #0x00	; 0
   63B4 00                   83 	.db #0x00	; 0
   63B5 00 00                84 	.dw #0x0000
   63B7 00 00                85 	.dw #0x0000
   63B9 00 00                86 	.dw #0x0000
   63BB 00 00                87 	.dw #0x0000
   63BD 04                   88 	.db #0x04	; 4
   63BE 08                   89 	.db #0x08	; 8
   63BF 00                   90 	.db #0x00	; 0
   63C0 00                   91 	.db #0x00	; 0
   63C1 00                   92 	.byte #0x00
   63C2 00                   93 	.byte #0x00
   63C3 00                   94 	.byte #0x00
   63C4 00                   95 	.byte #0x00
   63C5 00                   96 	.db #0x00	; 0
   63C6 00                   97 	.db #0x00	; 0
   63C7 00                   98 	.db #0x00	; 0
   63C8 00                   99 	.db #0x00	; 0
   63C9 00                  100 	.db #0x00	; 0
   63CA 00                  101 	.db #0x00	; 0
   63CB 00 00               102 	.dw #0x0000
                            103 ;src/animation/animation.c:46: void explosionBala(TBullet* bullet){
                            104 ;	---------------------------------
                            105 ; Function explosionBala
                            106 ; ---------------------------------
   63CD                     107 _explosionBala::
   63CD DD E5         [15]  108 	push	ix
   63CF DD 21 00 00   [14]  109 	ld	ix,#0
   63D3 DD 39         [15]  110 	add	ix,sp
   63D5 F5            [11]  111 	push	af
                            112 ;src/animation/animation.c:48: if(bullet->state == es_disparado){
   63D6 DD 4E 04      [19]  113 	ld	c,4 (ix)
   63D9 DD 46 05      [19]  114 	ld	b,5 (ix)
   63DC 21 02 00      [10]  115 	ld	hl,#0x0002
   63DF 09            [11]  116 	add	hl,bc
   63E0 E3            [19]  117 	ex	(sp), hl
   63E1 E1            [10]  118 	pop	hl
   63E2 E5            [11]  119 	push	hl
   63E3 7E            [ 7]  120 	ld	a,(hl)
   63E4 D6 02         [ 7]  121 	sub	a, #0x02
   63E6 20 50         [12]  122 	jr	NZ,00103$
                            123 ;src/animation/animation.c:50: exp = &explosion;
                            124 ;src/animation/animation.c:51: exp->n_frames = 0;
   63E8 21 A9 63      [10]  125 	ld	hl,#_explosion
   63EB 36 00         [10]  126 	ld	(hl),#0x00
                            127 ;src/animation/animation.c:52: exp->ent.draw = SI;
   63ED 21 B4 63      [10]  128 	ld	hl,#(_explosion + 0x000b)
   63F0 36 01         [10]  129 	ld	(hl),#0x01
                            130 ;src/animation/animation.c:54: updateXY(&exp->ent, bullet->ent.x, bullet->ent.y);
   63F2 C5            [11]  131 	push	bc
   63F3 FD E1         [14]  132 	pop	iy
   63F5 69            [ 4]  133 	ld	l, c
   63F6 60            [ 4]  134 	ld	h, b
   63F7 11 05 00      [10]  135 	ld	de, #0x0005
   63FA 19            [11]  136 	add	hl, de
   63FB 5E            [ 7]  137 	ld	e,(hl)
   63FC 23            [ 6]  138 	inc	hl
   63FD 56            [ 7]  139 	ld	d,(hl)
   63FE FD 6E 03      [19]  140 	ld	l,3 (iy)
   6401 FD 66 04      [19]  141 	ld	h,4 (iy)
   6404 C5            [11]  142 	push	bc
   6405 D5            [11]  143 	push	de
   6406 E5            [11]  144 	push	hl
   6407 21 AA 63      [10]  145 	ld	hl,#(_explosion + 0x0001)
   640A E5            [11]  146 	push	hl
   640B CD 3D 64      [17]  147 	call	_updateXY
   640E 21 06 00      [10]  148 	ld	hl,#6
   6411 39            [11]  149 	add	hl,sp
   6412 F9            [ 6]  150 	ld	sp,hl
   6413 C1            [10]  151 	pop	bc
                            152 ;src/animation/animation.c:56: exp->ent.sprites[0] = g_frames[0];
   6414 ED 5B 8D 63   [20]  153 	ld	de, (#_g_frames + 0)
   6418 ED 53 B5 63   [20]  154 	ld	((_explosion + 0x000c)), de
                            155 ;src/animation/animation.c:57: exp->ent.curr_dir = 0;
   641C 21 BF 63      [10]  156 	ld	hl,#(_explosion + 0x0016)
   641F 36 00         [10]  157 	ld	(hl),#0x00
                            158 ;src/animation/animation.c:58: exp->ent.cuadrante = mapaActual;
   6421 21 C6 63      [10]  159 	ld	hl,#(_explosion + 0x001d)
   6424 3A 7D 7D      [13]  160 	ld	a,(#_mapaActual + 0)
   6427 77            [ 7]  161 	ld	(hl),a
                            162 ;src/animation/animation.c:59: bullet->ent.draw = NO;
   6428 21 0D 00      [10]  163 	ld	hl,#0x000D
   642B 09            [11]  164 	add	hl,bc
   642C 36 00         [10]  165 	ld	(hl),#0x00
                            166 ;src/animation/animation.c:60: bullet->ent.vivo = NO;
   642E 21 1E 00      [10]  167 	ld	hl,#0x001E
   6431 09            [11]  168 	add	hl,bc
   6432 36 00         [10]  169 	ld	(hl),#0x00
                            170 ;src/animation/animation.c:61: bullet->state = es_explotando;	//Cambiamos a la bala estado explotando
   6434 E1            [10]  171 	pop	hl
   6435 E5            [11]  172 	push	hl
   6436 36 03         [10]  173 	ld	(hl),#0x03
   6438                     174 00103$:
   6438 DD F9         [10]  175 	ld	sp, ix
   643A DD E1         [14]  176 	pop	ix
   643C C9            [10]  177 	ret
                            178 ;src/animation/animation.c:67: void updateXY(TEntity* ent1, i16 x, i16 y){
                            179 ;	---------------------------------
                            180 ; Function updateXY
                            181 ; ---------------------------------
   643D                     182 _updateXY::
                            183 ;src/animation/animation.c:68: ent1->x = x;
   643D D1            [10]  184 	pop	de
   643E C1            [10]  185 	pop	bc
   643F C5            [11]  186 	push	bc
   6440 D5            [11]  187 	push	de
   6441 69            [ 4]  188 	ld	l, c
   6442 60            [ 4]  189 	ld	h, b
   6443 FD 21 04 00   [14]  190 	ld	iy,#4
   6447 FD 39         [15]  191 	add	iy,sp
   6449 FD 7E 00      [19]  192 	ld	a,0 (iy)
   644C 77            [ 7]  193 	ld	(hl),a
   644D 23            [ 6]  194 	inc	hl
   644E FD 7E 01      [19]  195 	ld	a,1 (iy)
   6451 77            [ 7]  196 	ld	(hl),a
                            197 ;src/animation/animation.c:69: ent1->y = y;
   6452 59            [ 4]  198 	ld	e, c
   6453 50            [ 4]  199 	ld	d, b
   6454 13            [ 6]  200 	inc	de
   6455 13            [ 6]  201 	inc	de
   6456 FD 21 06 00   [14]  202 	ld	iy,#6
   645A FD 39         [15]  203 	add	iy,sp
   645C FD 7E 00      [19]  204 	ld	a,0 (iy)
   645F 12            [ 7]  205 	ld	(de),a
   6460 13            [ 6]  206 	inc	de
   6461 FD 7E 01      [19]  207 	ld	a,1 (iy)
   6464 12            [ 7]  208 	ld	(de),a
                            209 ;src/animation/animation.c:70: ent1->px = x;
   6465 21 04 00      [10]  210 	ld	hl,#0x0004
   6468 09            [11]  211 	add	hl,bc
   6469 FD 21 04 00   [14]  212 	ld	iy,#4
   646D FD 39         [15]  213 	add	iy,sp
   646F FD 7E 00      [19]  214 	ld	a,0 (iy)
   6472 77            [ 7]  215 	ld	(hl),a
   6473 23            [ 6]  216 	inc	hl
   6474 FD 7E 01      [19]  217 	ld	a,1 (iy)
   6477 77            [ 7]  218 	ld	(hl),a
                            219 ;src/animation/animation.c:71: ent1->py = y;
   6478 21 06 00      [10]  220 	ld	hl,#0x0006
   647B 09            [11]  221 	add	hl,bc
   647C FD 21 06 00   [14]  222 	ld	iy,#6
   6480 FD 39         [15]  223 	add	iy,sp
   6482 FD 7E 00      [19]  224 	ld	a,0 (iy)
   6485 77            [ 7]  225 	ld	(hl),a
   6486 23            [ 6]  226 	inc	hl
   6487 FD 7E 01      [19]  227 	ld	a,1 (iy)
   648A 77            [ 7]  228 	ld	(hl),a
   648B C9            [10]  229 	ret
                            230 ;src/animation/animation.c:74: void updateExplosion(TBullet* bullet){
                            231 ;	---------------------------------
                            232 ; Function updateExplosion
                            233 ; ---------------------------------
   648C                     234 _updateExplosion::
   648C DD E5         [15]  235 	push	ix
   648E DD 21 00 00   [14]  236 	ld	ix,#0
   6492 DD 39         [15]  237 	add	ix,sp
                            238 ;src/animation/animation.c:76: if(bullet->state == es_explotando){	//Solo se updatea si está en estado de explosión	
   6494 DD 4E 04      [19]  239 	ld	c,4 (ix)
   6497 DD 46 05      [19]  240 	ld	b,5 (ix)
   649A 03            [ 6]  241 	inc	bc
   649B 03            [ 6]  242 	inc	bc
   649C 0A            [ 7]  243 	ld	a,(bc)
   649D D6 03         [ 7]  244 	sub	a, #0x03
   649F 20 4B         [12]  245 	jr	NZ,00105$
                            246 ;src/animation/animation.c:77: exp = &explosion;
                            247 ;src/animation/animation.c:78: exp->ent.draw = SI;
   64A1 21 B4 63      [10]  248 	ld	hl,#(_explosion + 0x000b)
   64A4 36 01         [10]  249 	ld	(hl),#0x01
                            250 ;src/animation/animation.c:79: exp->ent.cuadrante = mapaActual;
   64A6 21 C6 63      [10]  251 	ld	hl,#(_explosion + 0x001d)
   64A9 3A 7D 7D      [13]  252 	ld	a,(#_mapaActual + 0)
   64AC 77            [ 7]  253 	ld	(hl),a
                            254 ;src/animation/animation.c:81: exp->ent.sprites[0] = g_frames[exp->n_frames];
   64AD 11 8D 63      [10]  255 	ld	de,#_g_frames+0
   64B0 21 A9 63      [10]  256 	ld	hl, #_explosion + 0
   64B3 6E            [ 7]  257 	ld	l,(hl)
   64B4 26 00         [ 7]  258 	ld	h,#0x00
   64B6 29            [11]  259 	add	hl, hl
   64B7 19            [11]  260 	add	hl,de
   64B8 5E            [ 7]  261 	ld	e,(hl)
   64B9 23            [ 6]  262 	inc	hl
   64BA 56            [ 7]  263 	ld	d,(hl)
   64BB ED 53 B5 63   [20]  264 	ld	((_explosion + 0x000c)), de
                            265 ;src/animation/animation.c:82: exp->n_frames = exp->n_frames + 1;
   64BF 3A A9 63      [13]  266 	ld	a, (#_explosion + 0)
   64C2 3C            [ 4]  267 	inc	a
   64C3 32 A9 63      [13]  268 	ld	(#_explosion),a
                            269 ;src/animation/animation.c:83: if(exp->n_frames == EXPLOSION_FRAMES - 1){
   64C6 D6 0D         [ 7]  270 	sub	a, #0x0D
   64C8 20 22         [12]  271 	jr	NZ,00105$
                            272 ;src/animation/animation.c:84: calculaEntity(&exp->ent,SI);
   64CA C5            [11]  273 	push	bc
   64CB 3E 01         [ 7]  274 	ld	a,#0x01
   64CD F5            [11]  275 	push	af
   64CE 33            [ 6]  276 	inc	sp
   64CF 21 AA 63      [10]  277 	ld	hl,#(_explosion + 0x0001)
   64D2 E5            [11]  278 	push	hl
   64D3 CD E6 8C      [17]  279 	call	_calculaEntity
   64D6 33            [ 6]  280 	inc	sp
   64D7 21 AA 63      [10]  281 	ld	hl,#(_explosion + 0x0001)
   64DA E3            [19]  282 	ex	(sp),hl
   64DB CD 34 8C      [17]  283 	call	_borrarEntity
   64DE F1            [10]  284 	pop	af
   64DF C1            [10]  285 	pop	bc
                            286 ;src/animation/animation.c:86: exp->ent.draw = NO;
   64E0 21 B4 63      [10]  287 	ld	hl,#(_explosion + 0x000b)
   64E3 36 00         [10]  288 	ld	(hl),#0x00
                            289 ;src/animation/animation.c:87: bullet->state = es_static;
   64E5 AF            [ 4]  290 	xor	a, a
   64E6 02            [ 7]  291 	ld	(bc),a
                            292 ;src/animation/animation.c:88: exp->n_frames = 0;
   64E7 21 A9 63      [10]  293 	ld	hl,#_explosion
   64EA 36 00         [10]  294 	ld	(hl),#0x00
   64EC                     295 00105$:
   64EC DD E1         [14]  296 	pop	ix
   64EE C9            [10]  297 	ret
                            298 	.area _CODE
                            299 	.area _INITIALIZER
                            300 	.area _CABS (ABS)
