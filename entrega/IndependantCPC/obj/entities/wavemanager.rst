                              1 ;--------------------------------------------------------
                              2 ; File Created by SDCC : free open source ANSI-C Compiler
                              3 ; Version 3.5.5 #9498 (Linux)
                              4 ;--------------------------------------------------------
                              5 	.module wavemanager
                              6 	.optsdcc -mz80
                              7 	
                              8 ;--------------------------------------------------------
                              9 ; Public variables in this module
                             10 ;--------------------------------------------------------
                             11 	.globl _getRandomUniform
                             12 	.globl _getEnemies
                             13 	.globl _contarEnemigos
                             14 	.globl _enemigos_actual
                             15 	.globl _seed
                             16 	.globl _d_samemap
                             17 	.globl _s_samemap
                             18 	.globl _mapaPrev
                             19 	.globl _aparecerEnemigo
                             20 	.globl _respawnearEnemigo
                             21 	.globl _inicializarWaveManager
                             22 	.globl _updateTiempoEnMapa
                             23 	.globl _resetearTimepoEnMapa
                             24 	.globl _respawnearEnemigoPorBorde
                             25 	.globl _posicionAleatoriaBorde
                             26 	.globl _revivirEnemigo
                             27 	.globl _restarEnemigo
                             28 ;--------------------------------------------------------
                             29 ; special function registers
                             30 ;--------------------------------------------------------
                             31 ;--------------------------------------------------------
                             32 ; ram data
                             33 ;--------------------------------------------------------
                             34 	.area _DATA
   858B                      35 _mapaPrev::
   858B                      36 	.ds 1
                             37 ;--------------------------------------------------------
                             38 ; ram data
                             39 ;--------------------------------------------------------
                             40 	.area _INITIALIZED
   859A                      41 _s_samemap::
   859A                      42 	.ds 2
   859C                      43 _d_samemap::
   859C                      44 	.ds 2
   859E                      45 _seed::
   859E                      46 	.ds 1
   859F                      47 _enemigos_actual::
   859F                      48 	.ds 1
                             49 ;--------------------------------------------------------
                             50 ; absolute external ram data
                             51 ;--------------------------------------------------------
                             52 	.area _DABS (ABS)
                             53 ;--------------------------------------------------------
                             54 ; global & static initialisations
                             55 ;--------------------------------------------------------
                             56 	.area _HOME
                             57 	.area _GSINIT
                             58 	.area _GSFINAL
                             59 	.area _GSINIT
                             60 ;--------------------------------------------------------
                             61 ; Home
                             62 ;--------------------------------------------------------
                             63 	.area _HOME
                             64 	.area _HOME
                             65 ;--------------------------------------------------------
                             66 ; code
                             67 ;--------------------------------------------------------
                             68 	.area _CODE
                             69 ;src/entities/wavemanager.c:18: void aparecerEnemigo(){
                             70 ;	---------------------------------
                             71 ; Function aparecerEnemigo
                             72 ; ---------------------------------
   64D7                      73 _aparecerEnemigo::
                             74 ;src/entities/wavemanager.c:23: if(contarEnemigos() == 0 && basesCapturadas >= 3){
   64D7 CD DA 8D      [17]   75 	call	_contarEnemigos
   64DA 7D            [ 4]   76 	ld	a,l
   64DB B7            [ 4]   77 	or	a, a
   64DC C0            [11]   78 	ret	NZ
   64DD 3A 92 85      [13]   79 	ld	a,(#_basesCapturadas + 0)
   64E0 D6 03         [ 7]   80 	sub	a, #0x03
   64E2 D8            [11]   81 	ret	C
                             82 ;src/entities/wavemanager.c:24: enemies = getEnemies();
   64E3 CD 5D 98      [17]   83 	call	_getEnemies
                             84 ;src/entities/wavemanager.c:26: random_number = getRandomUniform(seed)%3;
   64E6 E5            [11]   85 	push	hl
   64E7 3A 9E 85      [13]   86 	ld	a,(_seed)
   64EA F5            [11]   87 	push	af
   64EB 33            [ 6]   88 	inc	sp
   64EC CD 47 6A      [17]   89 	call	_getRandomUniform
   64EF 33            [ 6]   90 	inc	sp
   64F0 55            [ 4]   91 	ld	d,l
   64F1 3E 03         [ 7]   92 	ld	a,#0x03
   64F3 F5            [11]   93 	push	af
   64F4 33            [ 6]   94 	inc	sp
   64F5 D5            [11]   95 	push	de
   64F6 33            [ 6]   96 	inc	sp
   64F7 CD A3 6E      [17]   97 	call	__moduchar
   64FA F1            [10]   98 	pop	af
   64FB C1            [10]   99 	pop	bc
                            100 ;src/entities/wavemanager.c:27: respawnearEnemigo(&enemies[random_number]);
   64FC 5D            [ 4]  101 	ld	e,l
   64FD 16 00         [ 7]  102 	ld	d,#0x00
   64FF 6B            [ 4]  103 	ld	l, e
   6500 62            [ 4]  104 	ld	h, d
   6501 29            [11]  105 	add	hl, hl
   6502 29            [11]  106 	add	hl, hl
   6503 29            [11]  107 	add	hl, hl
   6504 19            [11]  108 	add	hl, de
   6505 29            [11]  109 	add	hl, hl
   6506 19            [11]  110 	add	hl, de
   6507 29            [11]  111 	add	hl, hl
   6508 19            [11]  112 	add	hl, de
   6509 29            [11]  113 	add	hl, hl
   650A 09            [11]  114 	add	hl,bc
   650B E5            [11]  115 	push	hl
   650C CD 11 65      [17]  116 	call	_respawnearEnemigo
   650F F1            [10]  117 	pop	af
   6510 C9            [10]  118 	ret
                            119 ;src/entities/wavemanager.c:31: void respawnearEnemigo(TEnemy* enemy){
                            120 ;	---------------------------------
                            121 ; Function respawnearEnemigo
                            122 ; ---------------------------------
   6511                     123 _respawnearEnemigo::
   6511 DD E5         [15]  124 	push	ix
   6513 DD 21 00 00   [14]  125 	ld	ix,#0
   6517 DD 39         [15]  126 	add	ix,sp
   6519 3B            [ 6]  127 	dec	sp
                            128 ;src/entities/wavemanager.c:32: revivirEnemigo(enemy, getRandomUniform(seed)%70 + 5, getRandomUniform(seed)%141 + 50, getRandomUniform(seed)%3);
   651A 3A 9E 85      [13]  129 	ld	a,(_seed)
   651D F5            [11]  130 	push	af
   651E 33            [ 6]  131 	inc	sp
   651F CD 47 6A      [17]  132 	call	_getRandomUniform
   6522 33            [ 6]  133 	inc	sp
   6523 45            [ 4]  134 	ld	b,l
   6524 3E 03         [ 7]  135 	ld	a,#0x03
   6526 F5            [11]  136 	push	af
   6527 33            [ 6]  137 	inc	sp
   6528 C5            [11]  138 	push	bc
   6529 33            [ 6]  139 	inc	sp
   652A CD A3 6E      [17]  140 	call	__moduchar
   652D F1            [10]  141 	pop	af
   652E DD 75 FF      [19]  142 	ld	-1 (ix),l
   6531 3A 9E 85      [13]  143 	ld	a,(_seed)
   6534 F5            [11]  144 	push	af
   6535 33            [ 6]  145 	inc	sp
   6536 CD 47 6A      [17]  146 	call	_getRandomUniform
   6539 33            [ 6]  147 	inc	sp
   653A 45            [ 4]  148 	ld	b,l
   653B 3E 8D         [ 7]  149 	ld	a,#0x8D
   653D F5            [11]  150 	push	af
   653E 33            [ 6]  151 	inc	sp
   653F C5            [11]  152 	push	bc
   6540 33            [ 6]  153 	inc	sp
   6541 CD A3 6E      [17]  154 	call	__moduchar
   6544 F1            [10]  155 	pop	af
   6545 4D            [ 4]  156 	ld	c,l
   6546 06 00         [ 7]  157 	ld	b,#0x00
   6548 21 32 00      [10]  158 	ld	hl,#0x0032
   654B 09            [11]  159 	add	hl,bc
   654C E5            [11]  160 	push	hl
   654D 3A 9E 85      [13]  161 	ld	a,(_seed)
   6550 F5            [11]  162 	push	af
   6551 33            [ 6]  163 	inc	sp
   6552 CD 47 6A      [17]  164 	call	_getRandomUniform
   6555 33            [ 6]  165 	inc	sp
   6556 45            [ 4]  166 	ld	b,l
   6557 3E 46         [ 7]  167 	ld	a,#0x46
   6559 F5            [11]  168 	push	af
   655A 33            [ 6]  169 	inc	sp
   655B C5            [11]  170 	push	bc
   655C 33            [ 6]  171 	inc	sp
   655D CD A3 6E      [17]  172 	call	__moduchar
   6560 F1            [10]  173 	pop	af
   6561 4D            [ 4]  174 	ld	c,l
   6562 D1            [10]  175 	pop	de
   6563 06 00         [ 7]  176 	ld	b,#0x00
   6565 03            [ 6]  177 	inc	bc
   6566 03            [ 6]  178 	inc	bc
   6567 03            [ 6]  179 	inc	bc
   6568 03            [ 6]  180 	inc	bc
   6569 03            [ 6]  181 	inc	bc
   656A DD 7E FF      [19]  182 	ld	a,-1 (ix)
   656D F5            [11]  183 	push	af
   656E 33            [ 6]  184 	inc	sp
   656F D5            [11]  185 	push	de
   6570 C5            [11]  186 	push	bc
   6571 DD 6E 04      [19]  187 	ld	l,4 (ix)
   6574 DD 66 05      [19]  188 	ld	h,5 (ix)
   6577 E5            [11]  189 	push	hl
   6578 CD D2 69      [17]  190 	call	_revivirEnemigo
   657B 21 07 00      [10]  191 	ld	hl,#7
   657E 39            [11]  192 	add	hl,sp
   657F F9            [ 6]  193 	ld	sp,hl
   6580 33            [ 6]  194 	inc	sp
   6581 DD E1         [14]  195 	pop	ix
   6583 C9            [10]  196 	ret
                            197 ;src/entities/wavemanager.c:35: void inicializarWaveManager(){
                            198 ;	---------------------------------
                            199 ; Function inicializarWaveManager
                            200 ; ---------------------------------
   6584                     201 _inicializarWaveManager::
                            202 ;src/entities/wavemanager.c:36: seed = 1;
   6584 21 9E 85      [10]  203 	ld	hl,#_seed + 0
   6587 36 01         [10]  204 	ld	(hl), #0x01
                            205 ;src/entities/wavemanager.c:37: s_samemap = 0;
   6589 21 00 00      [10]  206 	ld	hl,#0x0000
   658C 22 9A 85      [16]  207 	ld	(_s_samemap),hl
                            208 ;src/entities/wavemanager.c:38: d_samemap = 150;
   658F 2E 96         [ 7]  209 	ld	l, #0x96
   6591 22 9C 85      [16]  210 	ld	(_d_samemap),hl
                            211 ;src/entities/wavemanager.c:39: enemigos_actual = NUM_ENEMIGOS;
   6594 21 9F 85      [10]  212 	ld	hl,#_enemigos_actual + 0
   6597 36 03         [10]  213 	ld	(hl), #0x03
   6599 C9            [10]  214 	ret
                            215 ;src/entities/wavemanager.c:42: void updateTiempoEnMapa(){
                            216 ;	---------------------------------
                            217 ; Function updateTiempoEnMapa
                            218 ; ---------------------------------
   659A                     219 _updateTiempoEnMapa::
                            220 ;src/entities/wavemanager.c:43: if(++s_samemap >= d_samemap){
   659A 21 9A 85      [10]  221 	ld	hl, #_s_samemap+0
   659D 34            [11]  222 	inc	(hl)
   659E 20 04         [12]  223 	jr	NZ,00117$
   65A0 21 9B 85      [10]  224 	ld	hl, #_s_samemap+1
   65A3 34            [11]  225 	inc	(hl)
   65A4                     226 00117$:
   65A4 21 9C 85      [10]  227 	ld	hl,#_d_samemap
   65A7 3A 9A 85      [13]  228 	ld	a,(#_s_samemap + 0)
   65AA 96            [ 7]  229 	sub	a, (hl)
   65AB 3A 9B 85      [13]  230 	ld	a,(#_s_samemap + 1)
   65AE 23            [ 6]  231 	inc	hl
   65AF 9E            [ 7]  232 	sbc	a, (hl)
   65B0 38 10         [12]  233 	jr	C,00104$
                            234 ;src/entities/wavemanager.c:44: if(contarEnemigos() == 0)
   65B2 CD DA 8D      [17]  235 	call	_contarEnemigos
   65B5 7D            [ 4]  236 	ld	a,l
   65B6 B7            [ 4]  237 	or	a, a
   65B7 20 03         [12]  238 	jr	NZ,00102$
                            239 ;src/entities/wavemanager.c:45: respawnearEnemigoPorBorde();
   65B9 CD CE 65      [17]  240 	call	_respawnearEnemigoPorBorde
   65BC                     241 00102$:
                            242 ;src/entities/wavemanager.c:46: s_samemap = 0;
   65BC 21 00 00      [10]  243 	ld	hl,#0x0000
   65BF 22 9A 85      [16]  244 	ld	(_s_samemap),hl
   65C2                     245 00104$:
                            246 ;src/entities/wavemanager.c:48: seed++;
   65C2 21 9E 85      [10]  247 	ld	hl, #_seed+0
   65C5 34            [11]  248 	inc	(hl)
                            249 ;src/entities/wavemanager.c:50: seed = 1;
   65C6 C9            [10]  250 	ret
                            251 ;src/entities/wavemanager.c:52: void resetearTimepoEnMapa(){
                            252 ;	---------------------------------
                            253 ; Function resetearTimepoEnMapa
                            254 ; ---------------------------------
   65C7                     255 _resetearTimepoEnMapa::
                            256 ;src/entities/wavemanager.c:53: s_samemap = 0;
   65C7 21 00 00      [10]  257 	ld	hl,#0x0000
   65CA 22 9A 85      [16]  258 	ld	(_s_samemap),hl
   65CD C9            [10]  259 	ret
                            260 ;src/entities/wavemanager.c:57: void respawnearEnemigoPorBorde(){
                            261 ;	---------------------------------
                            262 ; Function respawnearEnemigoPorBorde
                            263 ; ---------------------------------
   65CE                     264 _respawnearEnemigoPorBorde::
                            265 ;src/entities/wavemanager.c:61: random_number = getRandomUniform(seed)%3;
   65CE 3A 9E 85      [13]  266 	ld	a,(_seed)
   65D1 F5            [11]  267 	push	af
   65D2 33            [ 6]  268 	inc	sp
   65D3 CD 47 6A      [17]  269 	call	_getRandomUniform
   65D6 33            [ 6]  270 	inc	sp
   65D7 45            [ 4]  271 	ld	b,l
   65D8 3E 03         [ 7]  272 	ld	a,#0x03
   65DA F5            [11]  273 	push	af
   65DB 33            [ 6]  274 	inc	sp
   65DC C5            [11]  275 	push	bc
   65DD 33            [ 6]  276 	inc	sp
   65DE CD A3 6E      [17]  277 	call	__moduchar
                            278 ;src/entities/wavemanager.c:62: enemies = getEnemies();
   65E1 E3            [19]  279 	ex	(sp),hl
   65E2 CD 5D 98      [17]  280 	call	_getEnemies
   65E5 4D            [ 4]  281 	ld	c,l
   65E6 44            [ 4]  282 	ld	b,h
   65E7 E1            [10]  283 	pop	hl
                            284 ;src/entities/wavemanager.c:67: posicionAleatoriaBorde(&enemies[random_number]);
   65E8 5D            [ 4]  285 	ld	e,l
   65E9 16 00         [ 7]  286 	ld	d,#0x00
   65EB 6B            [ 4]  287 	ld	l, e
   65EC 62            [ 4]  288 	ld	h, d
   65ED 29            [11]  289 	add	hl, hl
   65EE 29            [11]  290 	add	hl, hl
   65EF 29            [11]  291 	add	hl, hl
   65F0 19            [11]  292 	add	hl, de
   65F1 29            [11]  293 	add	hl, hl
   65F2 19            [11]  294 	add	hl, de
   65F3 29            [11]  295 	add	hl, hl
   65F4 19            [11]  296 	add	hl, de
   65F5 29            [11]  297 	add	hl, hl
   65F6 09            [11]  298 	add	hl,bc
   65F7 E5            [11]  299 	push	hl
   65F8 CD FD 65      [17]  300 	call	_posicionAleatoriaBorde
   65FB F1            [10]  301 	pop	af
   65FC C9            [10]  302 	ret
                            303 ;src/entities/wavemanager.c:74: void posicionAleatoriaBorde(TEnemy* enemy){
                            304 ;	---------------------------------
                            305 ; Function posicionAleatoriaBorde
                            306 ; ---------------------------------
   65FD                     307 _posicionAleatoriaBorde::
   65FD DD E5         [15]  308 	push	ix
   65FF DD 21 00 00   [14]  309 	ld	ix,#0
   6603 DD 39         [15]  310 	add	ix,sp
   6605 F5            [11]  311 	push	af
   6606 F5            [11]  312 	push	af
                            313 ;src/entities/wavemanager.c:78: switch(mapaActual){
   6607 3E 05         [ 7]  314 	ld	a,#0x05
   6609 FD 21 8F 85   [14]  315 	ld	iy,#_mapaActual
   660D FD 96 00      [19]  316 	sub	a, 0 (iy)
   6610 DA C9 69      [10]  317 	jp	C,00128$
                            318 ;src/entities/wavemanager.c:97: revivirEnemigo(enemy, ANCHO - enemy->ent.sw, getRandomUniform(seed)%141 + 50, d_left);	
   6613 DD 7E 04      [19]  319 	ld	a,4 (ix)
   6616 DD 77 FE      [19]  320 	ld	-2 (ix),a
   6619 DD 7E 05      [19]  321 	ld	a,5 (ix)
   661C DD 77 FF      [19]  322 	ld	-1 (ix),a
   661F DD 7E FE      [19]  323 	ld	a,-2 (ix)
   6622 C6 39         [ 7]  324 	add	a, #0x39
   6624 DD 77 FC      [19]  325 	ld	-4 (ix),a
   6627 DD 7E FF      [19]  326 	ld	a,-1 (ix)
   662A CE 00         [ 7]  327 	adc	a, #0x00
   662C DD 77 FD      [19]  328 	ld	-3 (ix),a
                            329 ;src/entities/wavemanager.c:99: revivirEnemigo(enemy, getRandomUniform(seed)%70 + 5, ALTO - enemy->ent.sh, d_up);
   662F DD 7E FE      [19]  330 	ld	a,-2 (ix)
   6632 C6 3A         [ 7]  331 	add	a, #0x3A
   6634 4F            [ 4]  332 	ld	c,a
   6635 DD 7E FF      [19]  333 	ld	a,-1 (ix)
   6638 CE 00         [ 7]  334 	adc	a, #0x00
   663A 47            [ 4]  335 	ld	b,a
                            336 ;src/entities/wavemanager.c:78: switch(mapaActual){
   663B FD 21 8F 85   [14]  337 	ld	iy,#_mapaActual
   663F FD 5E 00      [19]  338 	ld	e,0 (iy)
   6642 16 00         [ 7]  339 	ld	d,#0x00
   6644 21 4B 66      [10]  340 	ld	hl,#00163$
   6647 19            [11]  341 	add	hl,de
   6648 19            [11]  342 	add	hl,de
   6649 19            [11]  343 	add	hl,de
   664A E9            [ 4]  344 	jp	(hl)
   664B                     345 00163$:
   664B C3 C9 69      [10]  346 	jp	00128$
   664E C3 60 66      [10]  347 	jp	00102$
   6651 C3 E5 66      [10]  348 	jp	00106$
   6654 C3 C8 67      [10]  349 	jp	00113$
   6657 C3 A1 68      [10]  350 	jp	00120$
   665A C3 3C 69      [10]  351 	jp	00124$
                            352 ;src/entities/wavemanager.c:80: case 0:													//Reaparece por arriba
                            353 ;src/entities/wavemanager.c:83: break;
   665D C3 C9 69      [10]  354 	jp	00128$
                            355 ;src/entities/wavemanager.c:84: case 1:
   6660                     356 00102$:
                            357 ;src/entities/wavemanager.c:85: random_number = getRandomUniform(seed)%2;											//Aleatorio 0 o 1
   6660 3A 9E 85      [13]  358 	ld	a,(_seed)
   6663 F5            [11]  359 	push	af
   6664 33            [ 6]  360 	inc	sp
   6665 CD 47 6A      [17]  361 	call	_getRandomUniform
   6668 33            [ 6]  362 	inc	sp
   6669 7D            [ 4]  363 	ld	a,l
   666A E6 01         [ 7]  364 	and	a, #0x01
   666C 4F            [ 4]  365 	ld	c,a
   666D 06 00         [ 7]  366 	ld	b,#0x00
                            367 ;src/entities/wavemanager.c:86: if(random_number == 1){														//Reaparece por arriba
   666F 0D            [ 4]  368 	dec	c
   6670 20 3B         [12]  369 	jr	NZ,00104$
   6672 78            [ 4]  370 	ld	a,b
   6673 B7            [ 4]  371 	or	a, a
   6674 20 37         [12]  372 	jr	NZ,00104$
                            373 ;src/entities/wavemanager.c:87: revivirEnemigo(enemy, getRandomUniform(seed)%70 + 5, ORIGEN_MAPA_Y, d_down);
   6676 3A 9E 85      [13]  374 	ld	a,(_seed)
   6679 F5            [11]  375 	push	af
   667A 33            [ 6]  376 	inc	sp
   667B CD 47 6A      [17]  377 	call	_getRandomUniform
   667E 33            [ 6]  378 	inc	sp
   667F 45            [ 4]  379 	ld	b,l
   6680 3E 46         [ 7]  380 	ld	a,#0x46
   6682 F5            [11]  381 	push	af
   6683 33            [ 6]  382 	inc	sp
   6684 C5            [11]  383 	push	bc
   6685 33            [ 6]  384 	inc	sp
   6686 CD A3 6E      [17]  385 	call	__moduchar
   6689 F1            [10]  386 	pop	af
   668A 4D            [ 4]  387 	ld	c,l
   668B 06 00         [ 7]  388 	ld	b,#0x00
   668D 03            [ 6]  389 	inc	bc
   668E 03            [ 6]  390 	inc	bc
   668F 03            [ 6]  391 	inc	bc
   6690 03            [ 6]  392 	inc	bc
   6691 03            [ 6]  393 	inc	bc
   6692 3E 02         [ 7]  394 	ld	a,#0x02
   6694 F5            [11]  395 	push	af
   6695 33            [ 6]  396 	inc	sp
   6696 21 28 00      [10]  397 	ld	hl,#0x0028
   6699 E5            [11]  398 	push	hl
   669A C5            [11]  399 	push	bc
   669B DD 6E 04      [19]  400 	ld	l,4 (ix)
   669E DD 66 05      [19]  401 	ld	h,5 (ix)
   66A1 E5            [11]  402 	push	hl
   66A2 CD D2 69      [17]  403 	call	_revivirEnemigo
   66A5 21 07 00      [10]  404 	ld	hl,#7
   66A8 39            [11]  405 	add	hl,sp
   66A9 F9            [ 6]  406 	ld	sp,hl
   66AA C3 C9 69      [10]  407 	jp	00128$
   66AD                     408 00104$:
                            409 ;src/entities/wavemanager.c:89: revivirEnemigo(enemy, 0, getRandomUniform(seed)%141 + 50, d_right);	
   66AD 3A 9E 85      [13]  410 	ld	a,(_seed)
   66B0 F5            [11]  411 	push	af
   66B1 33            [ 6]  412 	inc	sp
   66B2 CD 47 6A      [17]  413 	call	_getRandomUniform
   66B5 33            [ 6]  414 	inc	sp
   66B6 45            [ 4]  415 	ld	b,l
   66B7 3E 8D         [ 7]  416 	ld	a,#0x8D
   66B9 F5            [11]  417 	push	af
   66BA 33            [ 6]  418 	inc	sp
   66BB C5            [11]  419 	push	bc
   66BC 33            [ 6]  420 	inc	sp
   66BD CD A3 6E      [17]  421 	call	__moduchar
   66C0 F1            [10]  422 	pop	af
   66C1 4D            [ 4]  423 	ld	c,l
   66C2 06 00         [ 7]  424 	ld	b,#0x00
   66C4 21 32 00      [10]  425 	ld	hl,#0x0032
   66C7 09            [11]  426 	add	hl,bc
   66C8 4D            [ 4]  427 	ld	c,l
   66C9 44            [ 4]  428 	ld	b,h
   66CA 3E 01         [ 7]  429 	ld	a,#0x01
   66CC F5            [11]  430 	push	af
   66CD 33            [ 6]  431 	inc	sp
   66CE C5            [11]  432 	push	bc
   66CF 21 00 00      [10]  433 	ld	hl,#0x0000
   66D2 E5            [11]  434 	push	hl
   66D3 DD 6E 04      [19]  435 	ld	l,4 (ix)
   66D6 DD 66 05      [19]  436 	ld	h,5 (ix)
   66D9 E5            [11]  437 	push	hl
   66DA CD D2 69      [17]  438 	call	_revivirEnemigo
   66DD 21 07 00      [10]  439 	ld	hl,#7
   66E0 39            [11]  440 	add	hl,sp
   66E1 F9            [ 6]  441 	ld	sp,hl
                            442 ;src/entities/wavemanager.c:91: break;
   66E2 C3 C9 69      [10]  443 	jp	00128$
                            444 ;src/entities/wavemanager.c:92: case 2:
   66E5                     445 00106$:
                            446 ;src/entities/wavemanager.c:93: random_number = getRandomUniform(seed)%3 + 1;											//Aleatorio 0 o 1
   66E5 C5            [11]  447 	push	bc
   66E6 3A 9E 85      [13]  448 	ld	a,(_seed)
   66E9 F5            [11]  449 	push	af
   66EA 33            [ 6]  450 	inc	sp
   66EB CD 47 6A      [17]  451 	call	_getRandomUniform
   66EE 33            [ 6]  452 	inc	sp
   66EF 55            [ 4]  453 	ld	d,l
   66F0 3E 03         [ 7]  454 	ld	a,#0x03
   66F2 F5            [11]  455 	push	af
   66F3 33            [ 6]  456 	inc	sp
   66F4 D5            [11]  457 	push	de
   66F5 33            [ 6]  458 	inc	sp
   66F6 CD A3 6E      [17]  459 	call	__moduchar
   66F9 F1            [10]  460 	pop	af
   66FA C1            [10]  461 	pop	bc
   66FB 26 00         [ 7]  462 	ld	h,#0x00
   66FD 23            [ 6]  463 	inc	hl
                            464 ;src/entities/wavemanager.c:94: if(random_number == 1){																				//Reaparece por arriba
   66FE 7D            [ 4]  465 	ld	a,l
   66FF 3D            [ 4]  466 	dec	a
   6700 20 3B         [12]  467 	jr	NZ,00111$
   6702 7C            [ 4]  468 	ld	a,h
   6703 B7            [ 4]  469 	or	a, a
   6704 20 37         [12]  470 	jr	NZ,00111$
                            471 ;src/entities/wavemanager.c:95: revivirEnemigo(enemy, getRandomUniform(seed)%70 + 5, ORIGEN_MAPA_Y, d_down);
   6706 3A 9E 85      [13]  472 	ld	a,(_seed)
   6709 F5            [11]  473 	push	af
   670A 33            [ 6]  474 	inc	sp
   670B CD 47 6A      [17]  475 	call	_getRandomUniform
   670E 33            [ 6]  476 	inc	sp
   670F 45            [ 4]  477 	ld	b,l
   6710 3E 46         [ 7]  478 	ld	a,#0x46
   6712 F5            [11]  479 	push	af
   6713 33            [ 6]  480 	inc	sp
   6714 C5            [11]  481 	push	bc
   6715 33            [ 6]  482 	inc	sp
   6716 CD A3 6E      [17]  483 	call	__moduchar
   6719 F1            [10]  484 	pop	af
   671A 4D            [ 4]  485 	ld	c,l
   671B 06 00         [ 7]  486 	ld	b,#0x00
   671D 03            [ 6]  487 	inc	bc
   671E 03            [ 6]  488 	inc	bc
   671F 03            [ 6]  489 	inc	bc
   6720 03            [ 6]  490 	inc	bc
   6721 03            [ 6]  491 	inc	bc
   6722 3E 02         [ 7]  492 	ld	a,#0x02
   6724 F5            [11]  493 	push	af
   6725 33            [ 6]  494 	inc	sp
   6726 21 28 00      [10]  495 	ld	hl,#0x0028
   6729 E5            [11]  496 	push	hl
   672A C5            [11]  497 	push	bc
   672B DD 6E 04      [19]  498 	ld	l,4 (ix)
   672E DD 66 05      [19]  499 	ld	h,5 (ix)
   6731 E5            [11]  500 	push	hl
   6732 CD D2 69      [17]  501 	call	_revivirEnemigo
   6735 21 07 00      [10]  502 	ld	hl,#7
   6738 39            [11]  503 	add	hl,sp
   6739 F9            [ 6]  504 	ld	sp,hl
   673A C3 C9 69      [10]  505 	jp	00128$
   673D                     506 00111$:
                            507 ;src/entities/wavemanager.c:96: }else if(random_number == 2){																		//Reaparece por derecha
   673D 7D            [ 4]  508 	ld	a,l
   673E D6 02         [ 7]  509 	sub	a,#0x02
   6740 20 45         [12]  510 	jr	NZ,00108$
   6742 B4            [ 4]  511 	or	a,h
   6743 20 42         [12]  512 	jr	NZ,00108$
                            513 ;src/entities/wavemanager.c:97: revivirEnemigo(enemy, ANCHO - enemy->ent.sw, getRandomUniform(seed)%141 + 50, d_left);	
   6745 3A 9E 85      [13]  514 	ld	a,(_seed)
   6748 F5            [11]  515 	push	af
   6749 33            [ 6]  516 	inc	sp
   674A CD 47 6A      [17]  517 	call	_getRandomUniform
   674D 33            [ 6]  518 	inc	sp
   674E 45            [ 4]  519 	ld	b,l
   674F 3E 8D         [ 7]  520 	ld	a,#0x8D
   6751 F5            [11]  521 	push	af
   6752 33            [ 6]  522 	inc	sp
   6753 C5            [11]  523 	push	bc
   6754 33            [ 6]  524 	inc	sp
   6755 CD A3 6E      [17]  525 	call	__moduchar
   6758 F1            [10]  526 	pop	af
   6759 4D            [ 4]  527 	ld	c,l
   675A 06 00         [ 7]  528 	ld	b,#0x00
   675C 21 32 00      [10]  529 	ld	hl,#0x0032
   675F 09            [11]  530 	add	hl,bc
   6760 4D            [ 4]  531 	ld	c,l
   6761 44            [ 4]  532 	ld	b,h
   6762 E1            [10]  533 	pop	hl
   6763 E5            [11]  534 	push	hl
   6764 5E            [ 7]  535 	ld	e,(hl)
   6765 16 00         [ 7]  536 	ld	d,#0x00
   6767 3E 50         [ 7]  537 	ld	a,#0x50
   6769 93            [ 4]  538 	sub	a, e
   676A 5F            [ 4]  539 	ld	e,a
   676B 3E 00         [ 7]  540 	ld	a,#0x00
   676D 9A            [ 4]  541 	sbc	a, d
   676E 57            [ 4]  542 	ld	d,a
   676F 3E 03         [ 7]  543 	ld	a,#0x03
   6771 F5            [11]  544 	push	af
   6772 33            [ 6]  545 	inc	sp
   6773 C5            [11]  546 	push	bc
   6774 D5            [11]  547 	push	de
   6775 DD 6E FE      [19]  548 	ld	l,-2 (ix)
   6778 DD 66 FF      [19]  549 	ld	h,-1 (ix)
   677B E5            [11]  550 	push	hl
   677C CD D2 69      [17]  551 	call	_revivirEnemigo
   677F 21 07 00      [10]  552 	ld	hl,#7
   6782 39            [11]  553 	add	hl,sp
   6783 F9            [ 6]  554 	ld	sp,hl
   6784 C3 C9 69      [10]  555 	jp	00128$
   6787                     556 00108$:
                            557 ;src/entities/wavemanager.c:99: revivirEnemigo(enemy, getRandomUniform(seed)%70 + 5, ALTO - enemy->ent.sh, d_up);
   6787 0A            [ 7]  558 	ld	a,(bc)
   6788 4F            [ 4]  559 	ld	c,a
   6789 06 00         [ 7]  560 	ld	b,#0x00
   678B 3E C8         [ 7]  561 	ld	a,#0xC8
   678D 91            [ 4]  562 	sub	a, c
   678E 4F            [ 4]  563 	ld	c,a
   678F 3E 00         [ 7]  564 	ld	a,#0x00
   6791 98            [ 4]  565 	sbc	a, b
   6792 47            [ 4]  566 	ld	b,a
   6793 C5            [11]  567 	push	bc
   6794 3A 9E 85      [13]  568 	ld	a,(_seed)
   6797 F5            [11]  569 	push	af
   6798 33            [ 6]  570 	inc	sp
   6799 CD 47 6A      [17]  571 	call	_getRandomUniform
   679C 33            [ 6]  572 	inc	sp
   679D 55            [ 4]  573 	ld	d,l
   679E 3E 46         [ 7]  574 	ld	a,#0x46
   67A0 F5            [11]  575 	push	af
   67A1 33            [ 6]  576 	inc	sp
   67A2 D5            [11]  577 	push	de
   67A3 33            [ 6]  578 	inc	sp
   67A4 CD A3 6E      [17]  579 	call	__moduchar
   67A7 F1            [10]  580 	pop	af
   67A8 5D            [ 4]  581 	ld	e,l
   67A9 C1            [10]  582 	pop	bc
   67AA 16 00         [ 7]  583 	ld	d,#0x00
   67AC 13            [ 6]  584 	inc	de
   67AD 13            [ 6]  585 	inc	de
   67AE 13            [ 6]  586 	inc	de
   67AF 13            [ 6]  587 	inc	de
   67B0 13            [ 6]  588 	inc	de
   67B1 AF            [ 4]  589 	xor	a, a
   67B2 F5            [11]  590 	push	af
   67B3 33            [ 6]  591 	inc	sp
   67B4 C5            [11]  592 	push	bc
   67B5 D5            [11]  593 	push	de
   67B6 DD 6E FE      [19]  594 	ld	l,-2 (ix)
   67B9 DD 66 FF      [19]  595 	ld	h,-1 (ix)
   67BC E5            [11]  596 	push	hl
   67BD CD D2 69      [17]  597 	call	_revivirEnemigo
   67C0 21 07 00      [10]  598 	ld	hl,#7
   67C3 39            [11]  599 	add	hl,sp
   67C4 F9            [ 6]  600 	ld	sp,hl
                            601 ;src/entities/wavemanager.c:101: break;
   67C5 C3 C9 69      [10]  602 	jp	00128$
                            603 ;src/entities/wavemanager.c:102: case 3:
   67C8                     604 00113$:
                            605 ;src/entities/wavemanager.c:103: random_number = getRandomUniform(seed)%3 + 1;											//Aleatorio 0 o 1
   67C8 C5            [11]  606 	push	bc
   67C9 3A 9E 85      [13]  607 	ld	a,(_seed)
   67CC F5            [11]  608 	push	af
   67CD 33            [ 6]  609 	inc	sp
   67CE CD 47 6A      [17]  610 	call	_getRandomUniform
   67D1 33            [ 6]  611 	inc	sp
   67D2 55            [ 4]  612 	ld	d,l
   67D3 3E 03         [ 7]  613 	ld	a,#0x03
   67D5 F5            [11]  614 	push	af
   67D6 33            [ 6]  615 	inc	sp
   67D7 D5            [11]  616 	push	de
   67D8 33            [ 6]  617 	inc	sp
   67D9 CD A3 6E      [17]  618 	call	__moduchar
   67DC F1            [10]  619 	pop	af
   67DD C1            [10]  620 	pop	bc
   67DE 26 00         [ 7]  621 	ld	h,#0x00
   67E0 23            [ 6]  622 	inc	hl
                            623 ;src/entities/wavemanager.c:104: if(random_number == 1){																				//Reaparece por arriba
   67E1 7D            [ 4]  624 	ld	a,l
   67E2 3D            [ 4]  625 	dec	a
   67E3 20 3B         [12]  626 	jr	NZ,00118$
   67E5 7C            [ 4]  627 	ld	a,h
   67E6 B7            [ 4]  628 	or	a, a
   67E7 20 37         [12]  629 	jr	NZ,00118$
                            630 ;src/entities/wavemanager.c:105: revivirEnemigo(enemy, getRandomUniform(seed)%70 + 5, ORIGEN_MAPA_Y, d_down);
   67E9 3A 9E 85      [13]  631 	ld	a,(_seed)
   67EC F5            [11]  632 	push	af
   67ED 33            [ 6]  633 	inc	sp
   67EE CD 47 6A      [17]  634 	call	_getRandomUniform
   67F1 33            [ 6]  635 	inc	sp
   67F2 45            [ 4]  636 	ld	b,l
   67F3 3E 46         [ 7]  637 	ld	a,#0x46
   67F5 F5            [11]  638 	push	af
   67F6 33            [ 6]  639 	inc	sp
   67F7 C5            [11]  640 	push	bc
   67F8 33            [ 6]  641 	inc	sp
   67F9 CD A3 6E      [17]  642 	call	__moduchar
   67FC F1            [10]  643 	pop	af
   67FD 4D            [ 4]  644 	ld	c,l
   67FE 06 00         [ 7]  645 	ld	b,#0x00
   6800 03            [ 6]  646 	inc	bc
   6801 03            [ 6]  647 	inc	bc
   6802 03            [ 6]  648 	inc	bc
   6803 03            [ 6]  649 	inc	bc
   6804 03            [ 6]  650 	inc	bc
   6805 3E 02         [ 7]  651 	ld	a,#0x02
   6807 F5            [11]  652 	push	af
   6808 33            [ 6]  653 	inc	sp
   6809 21 28 00      [10]  654 	ld	hl,#0x0028
   680C E5            [11]  655 	push	hl
   680D C5            [11]  656 	push	bc
   680E DD 6E 04      [19]  657 	ld	l,4 (ix)
   6811 DD 66 05      [19]  658 	ld	h,5 (ix)
   6814 E5            [11]  659 	push	hl
   6815 CD D2 69      [17]  660 	call	_revivirEnemigo
   6818 21 07 00      [10]  661 	ld	hl,#7
   681B 39            [11]  662 	add	hl,sp
   681C F9            [ 6]  663 	ld	sp,hl
   681D C3 C9 69      [10]  664 	jp	00128$
   6820                     665 00118$:
                            666 ;src/entities/wavemanager.c:106: }else if(random_number == 2){																		//Reaparece por izquierda
   6820 7D            [ 4]  667 	ld	a,l
   6821 D6 02         [ 7]  668 	sub	a,#0x02
   6823 20 3B         [12]  669 	jr	NZ,00115$
   6825 B4            [ 4]  670 	or	a,h
   6826 20 38         [12]  671 	jr	NZ,00115$
                            672 ;src/entities/wavemanager.c:107: revivirEnemigo(enemy, 0, getRandomUniform(seed)%141 + 50, d_right);		
   6828 3A 9E 85      [13]  673 	ld	a,(_seed)
   682B F5            [11]  674 	push	af
   682C 33            [ 6]  675 	inc	sp
   682D CD 47 6A      [17]  676 	call	_getRandomUniform
   6830 33            [ 6]  677 	inc	sp
   6831 45            [ 4]  678 	ld	b,l
   6832 3E 8D         [ 7]  679 	ld	a,#0x8D
   6834 F5            [11]  680 	push	af
   6835 33            [ 6]  681 	inc	sp
   6836 C5            [11]  682 	push	bc
   6837 33            [ 6]  683 	inc	sp
   6838 CD A3 6E      [17]  684 	call	__moduchar
   683B F1            [10]  685 	pop	af
   683C 4D            [ 4]  686 	ld	c,l
   683D 06 00         [ 7]  687 	ld	b,#0x00
   683F 21 32 00      [10]  688 	ld	hl,#0x0032
   6842 09            [11]  689 	add	hl,bc
   6843 4D            [ 4]  690 	ld	c,l
   6844 44            [ 4]  691 	ld	b,h
   6845 3E 01         [ 7]  692 	ld	a,#0x01
   6847 F5            [11]  693 	push	af
   6848 33            [ 6]  694 	inc	sp
   6849 C5            [11]  695 	push	bc
   684A 21 00 00      [10]  696 	ld	hl,#0x0000
   684D E5            [11]  697 	push	hl
   684E DD 6E 04      [19]  698 	ld	l,4 (ix)
   6851 DD 66 05      [19]  699 	ld	h,5 (ix)
   6854 E5            [11]  700 	push	hl
   6855 CD D2 69      [17]  701 	call	_revivirEnemigo
   6858 21 07 00      [10]  702 	ld	hl,#7
   685B 39            [11]  703 	add	hl,sp
   685C F9            [ 6]  704 	ld	sp,hl
   685D C3 C9 69      [10]  705 	jp	00128$
   6860                     706 00115$:
                            707 ;src/entities/wavemanager.c:109: revivirEnemigo(enemy, getRandomUniform(seed)%70 + 5, ALTO - enemy->ent.sh, d_up);
   6860 0A            [ 7]  708 	ld	a,(bc)
   6861 4F            [ 4]  709 	ld	c,a
   6862 06 00         [ 7]  710 	ld	b,#0x00
   6864 3E C8         [ 7]  711 	ld	a,#0xC8
   6866 91            [ 4]  712 	sub	a, c
   6867 4F            [ 4]  713 	ld	c,a
   6868 3E 00         [ 7]  714 	ld	a,#0x00
   686A 98            [ 4]  715 	sbc	a, b
   686B 47            [ 4]  716 	ld	b,a
   686C C5            [11]  717 	push	bc
   686D 3A 9E 85      [13]  718 	ld	a,(_seed)
   6870 F5            [11]  719 	push	af
   6871 33            [ 6]  720 	inc	sp
   6872 CD 47 6A      [17]  721 	call	_getRandomUniform
   6875 33            [ 6]  722 	inc	sp
   6876 55            [ 4]  723 	ld	d,l
   6877 3E 46         [ 7]  724 	ld	a,#0x46
   6879 F5            [11]  725 	push	af
   687A 33            [ 6]  726 	inc	sp
   687B D5            [11]  727 	push	de
   687C 33            [ 6]  728 	inc	sp
   687D CD A3 6E      [17]  729 	call	__moduchar
   6880 F1            [10]  730 	pop	af
   6881 5D            [ 4]  731 	ld	e,l
   6882 C1            [10]  732 	pop	bc
   6883 16 00         [ 7]  733 	ld	d,#0x00
   6885 13            [ 6]  734 	inc	de
   6886 13            [ 6]  735 	inc	de
   6887 13            [ 6]  736 	inc	de
   6888 13            [ 6]  737 	inc	de
   6889 13            [ 6]  738 	inc	de
   688A AF            [ 4]  739 	xor	a, a
   688B F5            [11]  740 	push	af
   688C 33            [ 6]  741 	inc	sp
   688D C5            [11]  742 	push	bc
   688E D5            [11]  743 	push	de
   688F DD 6E FE      [19]  744 	ld	l,-2 (ix)
   6892 DD 66 FF      [19]  745 	ld	h,-1 (ix)
   6895 E5            [11]  746 	push	hl
   6896 CD D2 69      [17]  747 	call	_revivirEnemigo
   6899 21 07 00      [10]  748 	ld	hl,#7
   689C 39            [11]  749 	add	hl,sp
   689D F9            [ 6]  750 	ld	sp,hl
                            751 ;src/entities/wavemanager.c:111: break;
   689E C3 C9 69      [10]  752 	jp	00128$
                            753 ;src/entities/wavemanager.c:112: case 4:
   68A1                     754 00120$:
                            755 ;src/entities/wavemanager.c:113: random_number = getRandomUniform(seed)%2;											//Aleatorio 0 o 1
   68A1 C5            [11]  756 	push	bc
   68A2 3A 9E 85      [13]  757 	ld	a,(_seed)
   68A5 F5            [11]  758 	push	af
   68A6 33            [ 6]  759 	inc	sp
   68A7 CD 47 6A      [17]  760 	call	_getRandomUniform
   68AA 33            [ 6]  761 	inc	sp
   68AB C1            [10]  762 	pop	bc
   68AC 7D            [ 4]  763 	ld	a,l
   68AD E6 01         [ 7]  764 	and	a, #0x01
   68AF 5F            [ 4]  765 	ld	e,a
   68B0 16 00         [ 7]  766 	ld	d,#0x00
                            767 ;src/entities/wavemanager.c:114: if(random_number == 1){														//Reaparece por abajo
   68B2 1D            [ 4]  768 	dec	e
   68B3 20 45         [12]  769 	jr	NZ,00122$
   68B5 7A            [ 4]  770 	ld	a,d
   68B6 B7            [ 4]  771 	or	a, a
   68B7 20 41         [12]  772 	jr	NZ,00122$
                            773 ;src/entities/wavemanager.c:115: revivirEnemigo(enemy, getRandomUniform(seed)%70 + 5, ALTO - enemy->ent.sh, d_up);
   68B9 0A            [ 7]  774 	ld	a,(bc)
   68BA 4F            [ 4]  775 	ld	c,a
   68BB 06 00         [ 7]  776 	ld	b,#0x00
   68BD 3E C8         [ 7]  777 	ld	a,#0xC8
   68BF 91            [ 4]  778 	sub	a, c
   68C0 4F            [ 4]  779 	ld	c,a
   68C1 3E 00         [ 7]  780 	ld	a,#0x00
   68C3 98            [ 4]  781 	sbc	a, b
   68C4 47            [ 4]  782 	ld	b,a
   68C5 C5            [11]  783 	push	bc
   68C6 3A 9E 85      [13]  784 	ld	a,(_seed)
   68C9 F5            [11]  785 	push	af
   68CA 33            [ 6]  786 	inc	sp
   68CB CD 47 6A      [17]  787 	call	_getRandomUniform
   68CE 33            [ 6]  788 	inc	sp
   68CF 55            [ 4]  789 	ld	d,l
   68D0 3E 46         [ 7]  790 	ld	a,#0x46
   68D2 F5            [11]  791 	push	af
   68D3 33            [ 6]  792 	inc	sp
   68D4 D5            [11]  793 	push	de
   68D5 33            [ 6]  794 	inc	sp
   68D6 CD A3 6E      [17]  795 	call	__moduchar
   68D9 F1            [10]  796 	pop	af
   68DA 5D            [ 4]  797 	ld	e,l
   68DB C1            [10]  798 	pop	bc
   68DC 16 00         [ 7]  799 	ld	d,#0x00
   68DE 13            [ 6]  800 	inc	de
   68DF 13            [ 6]  801 	inc	de
   68E0 13            [ 6]  802 	inc	de
   68E1 13            [ 6]  803 	inc	de
   68E2 13            [ 6]  804 	inc	de
   68E3 AF            [ 4]  805 	xor	a, a
   68E4 F5            [11]  806 	push	af
   68E5 33            [ 6]  807 	inc	sp
   68E6 C5            [11]  808 	push	bc
   68E7 D5            [11]  809 	push	de
   68E8 DD 6E FE      [19]  810 	ld	l,-2 (ix)
   68EB DD 66 FF      [19]  811 	ld	h,-1 (ix)
   68EE E5            [11]  812 	push	hl
   68EF CD D2 69      [17]  813 	call	_revivirEnemigo
   68F2 21 07 00      [10]  814 	ld	hl,#7
   68F5 39            [11]  815 	add	hl,sp
   68F6 F9            [ 6]  816 	ld	sp,hl
   68F7 C3 C9 69      [10]  817 	jp	00128$
   68FA                     818 00122$:
                            819 ;src/entities/wavemanager.c:117: revivirEnemigo(enemy, ANCHO - enemy->ent.sw, getRandomUniform(seed)%141 + 50, d_left);	
   68FA 3A 9E 85      [13]  820 	ld	a,(_seed)
   68FD F5            [11]  821 	push	af
   68FE 33            [ 6]  822 	inc	sp
   68FF CD 47 6A      [17]  823 	call	_getRandomUniform
   6902 33            [ 6]  824 	inc	sp
   6903 45            [ 4]  825 	ld	b,l
   6904 3E 8D         [ 7]  826 	ld	a,#0x8D
   6906 F5            [11]  827 	push	af
   6907 33            [ 6]  828 	inc	sp
   6908 C5            [11]  829 	push	bc
   6909 33            [ 6]  830 	inc	sp
   690A CD A3 6E      [17]  831 	call	__moduchar
   690D F1            [10]  832 	pop	af
   690E 4D            [ 4]  833 	ld	c,l
   690F 06 00         [ 7]  834 	ld	b,#0x00
   6911 21 32 00      [10]  835 	ld	hl,#0x0032
   6914 09            [11]  836 	add	hl,bc
   6915 4D            [ 4]  837 	ld	c,l
   6916 44            [ 4]  838 	ld	b,h
   6917 E1            [10]  839 	pop	hl
   6918 E5            [11]  840 	push	hl
   6919 5E            [ 7]  841 	ld	e,(hl)
   691A 16 00         [ 7]  842 	ld	d,#0x00
   691C 3E 50         [ 7]  843 	ld	a,#0x50
   691E 93            [ 4]  844 	sub	a, e
   691F 5F            [ 4]  845 	ld	e,a
   6920 3E 00         [ 7]  846 	ld	a,#0x00
   6922 9A            [ 4]  847 	sbc	a, d
   6923 57            [ 4]  848 	ld	d,a
   6924 3E 03         [ 7]  849 	ld	a,#0x03
   6926 F5            [11]  850 	push	af
   6927 33            [ 6]  851 	inc	sp
   6928 C5            [11]  852 	push	bc
   6929 D5            [11]  853 	push	de
   692A DD 6E FE      [19]  854 	ld	l,-2 (ix)
   692D DD 66 FF      [19]  855 	ld	h,-1 (ix)
   6930 E5            [11]  856 	push	hl
   6931 CD D2 69      [17]  857 	call	_revivirEnemigo
   6934 21 07 00      [10]  858 	ld	hl,#7
   6937 39            [11]  859 	add	hl,sp
   6938 F9            [ 6]  860 	ld	sp,hl
                            861 ;src/entities/wavemanager.c:119: break;
   6939 C3 C9 69      [10]  862 	jp	00128$
                            863 ;src/entities/wavemanager.c:120: case 5:
   693C                     864 00124$:
                            865 ;src/entities/wavemanager.c:121: random_number = getRandomUniform(seed)%2;											//Aleatorio 0 o 1
   693C C5            [11]  866 	push	bc
   693D 3A 9E 85      [13]  867 	ld	a,(_seed)
   6940 F5            [11]  868 	push	af
   6941 33            [ 6]  869 	inc	sp
   6942 CD 47 6A      [17]  870 	call	_getRandomUniform
   6945 33            [ 6]  871 	inc	sp
   6946 C1            [10]  872 	pop	bc
   6947 7D            [ 4]  873 	ld	a,l
   6948 E6 01         [ 7]  874 	and	a, #0x01
   694A 5F            [ 4]  875 	ld	e,a
   694B 16 00         [ 7]  876 	ld	d,#0x00
                            877 ;src/entities/wavemanager.c:122: if(random_number == 1){														//Reaparece por izquierda
   694D 1D            [ 4]  878 	dec	e
   694E 20 3B         [12]  879 	jr	NZ,00126$
   6950 7A            [ 4]  880 	ld	a,d
   6951 B7            [ 4]  881 	or	a, a
   6952 20 37         [12]  882 	jr	NZ,00126$
                            883 ;src/entities/wavemanager.c:123: revivirEnemigo(enemy, 0, getRandomUniform(seed)%141 + 50, d_right);	
   6954 3A 9E 85      [13]  884 	ld	a,(_seed)
   6957 F5            [11]  885 	push	af
   6958 33            [ 6]  886 	inc	sp
   6959 CD 47 6A      [17]  887 	call	_getRandomUniform
   695C 33            [ 6]  888 	inc	sp
   695D 45            [ 4]  889 	ld	b,l
   695E 3E 8D         [ 7]  890 	ld	a,#0x8D
   6960 F5            [11]  891 	push	af
   6961 33            [ 6]  892 	inc	sp
   6962 C5            [11]  893 	push	bc
   6963 33            [ 6]  894 	inc	sp
   6964 CD A3 6E      [17]  895 	call	__moduchar
   6967 F1            [10]  896 	pop	af
   6968 4D            [ 4]  897 	ld	c,l
   6969 06 00         [ 7]  898 	ld	b,#0x00
   696B 21 32 00      [10]  899 	ld	hl,#0x0032
   696E 09            [11]  900 	add	hl,bc
   696F 4D            [ 4]  901 	ld	c,l
   6970 44            [ 4]  902 	ld	b,h
   6971 3E 01         [ 7]  903 	ld	a,#0x01
   6973 F5            [11]  904 	push	af
   6974 33            [ 6]  905 	inc	sp
   6975 C5            [11]  906 	push	bc
   6976 21 00 00      [10]  907 	ld	hl,#0x0000
   6979 E5            [11]  908 	push	hl
   697A DD 6E 04      [19]  909 	ld	l,4 (ix)
   697D DD 66 05      [19]  910 	ld	h,5 (ix)
   6980 E5            [11]  911 	push	hl
   6981 CD D2 69      [17]  912 	call	_revivirEnemigo
   6984 21 07 00      [10]  913 	ld	hl,#7
   6987 39            [11]  914 	add	hl,sp
   6988 F9            [ 6]  915 	ld	sp,hl
   6989 18 3E         [12]  916 	jr	00128$
   698B                     917 00126$:
                            918 ;src/entities/wavemanager.c:125: revivirEnemigo(enemy, getRandomUniform(seed)%70 + 5, ALTO - enemy->ent.sh, d_up);	
   698B 0A            [ 7]  919 	ld	a,(bc)
   698C 4F            [ 4]  920 	ld	c,a
   698D 06 00         [ 7]  921 	ld	b,#0x00
   698F 3E C8         [ 7]  922 	ld	a,#0xC8
   6991 91            [ 4]  923 	sub	a, c
   6992 4F            [ 4]  924 	ld	c,a
   6993 3E 00         [ 7]  925 	ld	a,#0x00
   6995 98            [ 4]  926 	sbc	a, b
   6996 47            [ 4]  927 	ld	b,a
   6997 C5            [11]  928 	push	bc
   6998 3A 9E 85      [13]  929 	ld	a,(_seed)
   699B F5            [11]  930 	push	af
   699C 33            [ 6]  931 	inc	sp
   699D CD 47 6A      [17]  932 	call	_getRandomUniform
   69A0 33            [ 6]  933 	inc	sp
   69A1 55            [ 4]  934 	ld	d,l
   69A2 3E 46         [ 7]  935 	ld	a,#0x46
   69A4 F5            [11]  936 	push	af
   69A5 33            [ 6]  937 	inc	sp
   69A6 D5            [11]  938 	push	de
   69A7 33            [ 6]  939 	inc	sp
   69A8 CD A3 6E      [17]  940 	call	__moduchar
   69AB F1            [10]  941 	pop	af
   69AC 5D            [ 4]  942 	ld	e,l
   69AD C1            [10]  943 	pop	bc
   69AE 16 00         [ 7]  944 	ld	d,#0x00
   69B0 13            [ 6]  945 	inc	de
   69B1 13            [ 6]  946 	inc	de
   69B2 13            [ 6]  947 	inc	de
   69B3 13            [ 6]  948 	inc	de
   69B4 13            [ 6]  949 	inc	de
   69B5 AF            [ 4]  950 	xor	a, a
   69B6 F5            [11]  951 	push	af
   69B7 33            [ 6]  952 	inc	sp
   69B8 C5            [11]  953 	push	bc
   69B9 D5            [11]  954 	push	de
   69BA DD 6E FE      [19]  955 	ld	l,-2 (ix)
   69BD DD 66 FF      [19]  956 	ld	h,-1 (ix)
   69C0 E5            [11]  957 	push	hl
   69C1 CD D2 69      [17]  958 	call	_revivirEnemigo
   69C4 21 07 00      [10]  959 	ld	hl,#7
   69C7 39            [11]  960 	add	hl,sp
   69C8 F9            [ 6]  961 	ld	sp,hl
                            962 ;src/entities/wavemanager.c:128: }
   69C9                     963 00128$:
                            964 ;src/entities/wavemanager.c:130: enemigos_actual++;
   69C9 21 9F 85      [10]  965 	ld	hl, #_enemigos_actual+0
   69CC 34            [11]  966 	inc	(hl)
   69CD DD F9         [10]  967 	ld	sp, ix
   69CF DD E1         [14]  968 	pop	ix
   69D1 C9            [10]  969 	ret
                            970 ;src/entities/wavemanager.c:133: void revivirEnemigo(TEnemy* enemy, i16 x, i16 y, TPlayerDirection dir){
                            971 ;	---------------------------------
                            972 ; Function revivirEnemigo
                            973 ; ---------------------------------
   69D2                     974 _revivirEnemigo::
   69D2 DD E5         [15]  975 	push	ix
   69D4 DD 21 00 00   [14]  976 	ld	ix,#0
   69D8 DD 39         [15]  977 	add	ix,sp
                            978 ;src/entities/wavemanager.c:134: enemy->ent.vivo = SI;
   69DA DD 4E 04      [19]  979 	ld	c,4 (ix)
   69DD DD 46 05      [19]  980 	ld	b,5 (ix)
   69E0 21 26 00      [10]  981 	ld	hl,#0x0026
   69E3 09            [11]  982 	add	hl,bc
   69E4 EB            [ 4]  983 	ex	de,hl
   69E5 21 41 00      [10]  984 	ld	hl,#0x0041
   69E8 09            [11]  985 	add	hl,bc
   69E9 36 01         [10]  986 	ld	(hl),#0x01
                            987 ;src/entities/wavemanager.c:135: enemy->ent.draw = SI;
   69EB 21 30 00      [10]  988 	ld	hl,#0x0030
   69EE 09            [11]  989 	add	hl,bc
   69EF 36 01         [10]  990 	ld	(hl),#0x01
                            991 ;src/entities/wavemanager.c:136: enemy->ent.x = x;
   69F1 DD 7E 06      [19]  992 	ld	a,6 (ix)
   69F4 12            [ 7]  993 	ld	(de),a
   69F5 13            [ 6]  994 	inc	de
   69F6 DD 7E 07      [19]  995 	ld	a,7 (ix)
   69F9 12            [ 7]  996 	ld	(de),a
                            997 ;src/entities/wavemanager.c:137: enemy->ent.y = y;
   69FA 21 28 00      [10]  998 	ld	hl,#0x0028
   69FD 09            [11]  999 	add	hl,bc
   69FE DD 7E 08      [19] 1000 	ld	a,8 (ix)
   6A01 77            [ 7] 1001 	ld	(hl),a
   6A02 23            [ 6] 1002 	inc	hl
   6A03 DD 7E 09      [19] 1003 	ld	a,9 (ix)
   6A06 77            [ 7] 1004 	ld	(hl),a
                           1005 ;src/entities/wavemanager.c:138: enemy->ent.px = x;
   6A07 21 2A 00      [10] 1006 	ld	hl,#0x002A
   6A0A 09            [11] 1007 	add	hl,bc
   6A0B DD 7E 06      [19] 1008 	ld	a,6 (ix)
   6A0E 77            [ 7] 1009 	ld	(hl),a
   6A0F 23            [ 6] 1010 	inc	hl
   6A10 DD 7E 07      [19] 1011 	ld	a,7 (ix)
   6A13 77            [ 7] 1012 	ld	(hl),a
                           1013 ;src/entities/wavemanager.c:139: enemy->ent.py = y;
   6A14 21 2C 00      [10] 1014 	ld	hl,#0x002C
   6A17 09            [11] 1015 	add	hl,bc
   6A18 DD 7E 08      [19] 1016 	ld	a,8 (ix)
   6A1B 77            [ 7] 1017 	ld	(hl),a
   6A1C 23            [ 6] 1018 	inc	hl
   6A1D DD 7E 09      [19] 1019 	ld	a,9 (ix)
   6A20 77            [ 7] 1020 	ld	(hl),a
                           1021 ;src/entities/wavemanager.c:140: enemy->ent.cuadrante = mapaActual;
   6A21 21 42 00      [10] 1022 	ld	hl,#0x0042
   6A24 09            [11] 1023 	add	hl,bc
   6A25 3A 8F 85      [13] 1024 	ld	a,(#_mapaActual + 0)
   6A28 77            [ 7] 1025 	ld	(hl),a
                           1026 ;src/entities/wavemanager.c:141: enemy->statusIA = s_mover;
   6A29 21 49 00      [10] 1027 	ld	hl,#0x0049
   6A2C 09            [11] 1028 	add	hl,bc
   6A2D 36 00         [10] 1029 	ld	(hl),#0x00
                           1030 ;src/entities/wavemanager.c:142: enemy->ent.curr_dir = dir;
   6A2F 21 3B 00      [10] 1031 	ld	hl,#0x003B
   6A32 09            [11] 1032 	add	hl,bc
   6A33 DD 7E 0A      [19] 1033 	ld	a,10 (ix)
   6A36 77            [ 7] 1034 	ld	(hl),a
                           1035 ;src/entities/wavemanager.c:143: enemy->bullet.ent.cuadrante = mapaActual;
   6A37 21 1F 00      [10] 1036 	ld	hl,#0x001F
   6A3A 09            [11] 1037 	add	hl,bc
   6A3B 3A 8F 85      [13] 1038 	ld	a,(#_mapaActual + 0)
   6A3E 77            [ 7] 1039 	ld	(hl),a
   6A3F DD E1         [14] 1040 	pop	ix
   6A41 C9            [10] 1041 	ret
                           1042 ;src/entities/wavemanager.c:148: void restarEnemigo(){
                           1043 ;	---------------------------------
                           1044 ; Function restarEnemigo
                           1045 ; ---------------------------------
   6A42                    1046 _restarEnemigo::
                           1047 ;src/entities/wavemanager.c:149: enemigos_actual--;
   6A42 21 9F 85      [10] 1048 	ld	hl, #_enemigos_actual+0
   6A45 35            [11] 1049 	dec	(hl)
   6A46 C9            [10] 1050 	ret
                           1051 	.area _CODE
                           1052 	.area _INITIALIZER
   85AD                    1053 __xinit__s_samemap:
   85AD 00 00              1054 	.dw #0x0000
   85AF                    1055 __xinit__d_samemap:
   85AF 96 00              1056 	.dw #0x0096
   85B1                    1057 __xinit__seed:
   85B1 01                 1058 	.db #0x01	; 1
   85B2                    1059 __xinit__enemigos_actual:
   85B2 03                 1060 	.db #0x03	; 3
                           1061 	.area _CABS (ABS)
