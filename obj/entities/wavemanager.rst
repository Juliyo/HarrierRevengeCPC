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
   7D79                      35 _mapaPrev::
   7D79                      36 	.ds 1
                             37 ;--------------------------------------------------------
                             38 ; ram data
                             39 ;--------------------------------------------------------
                             40 	.area _INITIALIZED
   7D88                      41 _s_samemap::
   7D88                      42 	.ds 2
   7D8A                      43 _d_samemap::
   7D8A                      44 	.ds 2
   7D8C                      45 _seed::
   7D8C                      46 	.ds 1
   7D8D                      47 _enemigos_actual::
   7D8D                      48 	.ds 1
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
   64EF                      73 _aparecerEnemigo::
                             74 ;src/entities/wavemanager.c:23: if(contarEnemigos() == 0 && basesCapturadas >= 3){
   64EF CD C8 85      [17]   75 	call	_contarEnemigos
   64F2 7D            [ 4]   76 	ld	a,l
   64F3 B7            [ 4]   77 	or	a, a
   64F4 C0            [11]   78 	ret	NZ
   64F5 3A 80 7D      [13]   79 	ld	a,(#_basesCapturadas + 0)
   64F8 D6 03         [ 7]   80 	sub	a, #0x03
   64FA D8            [11]   81 	ret	C
                             82 ;src/entities/wavemanager.c:24: enemies = getEnemies();
   64FB CD 4B 90      [17]   83 	call	_getEnemies
                             84 ;src/entities/wavemanager.c:26: random_number = getRandomUniform(seed)%3;
   64FE E5            [11]   85 	push	hl
   64FF 3A 8C 7D      [13]   86 	ld	a,(_seed)
   6502 F5            [11]   87 	push	af
   6503 33            [ 6]   88 	inc	sp
   6504 CD 5F 6A      [17]   89 	call	_getRandomUniform
   6507 33            [ 6]   90 	inc	sp
   6508 55            [ 4]   91 	ld	d,l
   6509 3E 03         [ 7]   92 	ld	a,#0x03
   650B F5            [11]   93 	push	af
   650C 33            [ 6]   94 	inc	sp
   650D D5            [11]   95 	push	de
   650E 33            [ 6]   96 	inc	sp
   650F CD BB 6E      [17]   97 	call	__moduchar
   6512 F1            [10]   98 	pop	af
   6513 C1            [10]   99 	pop	bc
                            100 ;src/entities/wavemanager.c:27: respawnearEnemigo(&enemies[random_number]);
   6514 5D            [ 4]  101 	ld	e,l
   6515 16 00         [ 7]  102 	ld	d,#0x00
   6517 6B            [ 4]  103 	ld	l, e
   6518 62            [ 4]  104 	ld	h, d
   6519 29            [11]  105 	add	hl, hl
   651A 29            [11]  106 	add	hl, hl
   651B 29            [11]  107 	add	hl, hl
   651C 19            [11]  108 	add	hl, de
   651D 29            [11]  109 	add	hl, hl
   651E 19            [11]  110 	add	hl, de
   651F 29            [11]  111 	add	hl, hl
   6520 19            [11]  112 	add	hl, de
   6521 29            [11]  113 	add	hl, hl
   6522 09            [11]  114 	add	hl,bc
   6523 E5            [11]  115 	push	hl
   6524 CD 29 65      [17]  116 	call	_respawnearEnemigo
   6527 F1            [10]  117 	pop	af
   6528 C9            [10]  118 	ret
                            119 ;src/entities/wavemanager.c:31: void respawnearEnemigo(TEnemy* enemy){
                            120 ;	---------------------------------
                            121 ; Function respawnearEnemigo
                            122 ; ---------------------------------
   6529                     123 _respawnearEnemigo::
   6529 DD E5         [15]  124 	push	ix
   652B DD 21 00 00   [14]  125 	ld	ix,#0
   652F DD 39         [15]  126 	add	ix,sp
   6531 3B            [ 6]  127 	dec	sp
                            128 ;src/entities/wavemanager.c:32: revivirEnemigo(enemy, getRandomUniform(seed)%70 + 5, getRandomUniform(seed)%141 + 50, getRandomUniform(seed)%3);
   6532 3A 8C 7D      [13]  129 	ld	a,(_seed)
   6535 F5            [11]  130 	push	af
   6536 33            [ 6]  131 	inc	sp
   6537 CD 5F 6A      [17]  132 	call	_getRandomUniform
   653A 33            [ 6]  133 	inc	sp
   653B 45            [ 4]  134 	ld	b,l
   653C 3E 03         [ 7]  135 	ld	a,#0x03
   653E F5            [11]  136 	push	af
   653F 33            [ 6]  137 	inc	sp
   6540 C5            [11]  138 	push	bc
   6541 33            [ 6]  139 	inc	sp
   6542 CD BB 6E      [17]  140 	call	__moduchar
   6545 F1            [10]  141 	pop	af
   6546 DD 75 FF      [19]  142 	ld	-1 (ix),l
   6549 3A 8C 7D      [13]  143 	ld	a,(_seed)
   654C F5            [11]  144 	push	af
   654D 33            [ 6]  145 	inc	sp
   654E CD 5F 6A      [17]  146 	call	_getRandomUniform
   6551 33            [ 6]  147 	inc	sp
   6552 45            [ 4]  148 	ld	b,l
   6553 3E 8D         [ 7]  149 	ld	a,#0x8D
   6555 F5            [11]  150 	push	af
   6556 33            [ 6]  151 	inc	sp
   6557 C5            [11]  152 	push	bc
   6558 33            [ 6]  153 	inc	sp
   6559 CD BB 6E      [17]  154 	call	__moduchar
   655C F1            [10]  155 	pop	af
   655D 4D            [ 4]  156 	ld	c,l
   655E 06 00         [ 7]  157 	ld	b,#0x00
   6560 21 32 00      [10]  158 	ld	hl,#0x0032
   6563 09            [11]  159 	add	hl,bc
   6564 E5            [11]  160 	push	hl
   6565 3A 8C 7D      [13]  161 	ld	a,(_seed)
   6568 F5            [11]  162 	push	af
   6569 33            [ 6]  163 	inc	sp
   656A CD 5F 6A      [17]  164 	call	_getRandomUniform
   656D 33            [ 6]  165 	inc	sp
   656E 45            [ 4]  166 	ld	b,l
   656F 3E 46         [ 7]  167 	ld	a,#0x46
   6571 F5            [11]  168 	push	af
   6572 33            [ 6]  169 	inc	sp
   6573 C5            [11]  170 	push	bc
   6574 33            [ 6]  171 	inc	sp
   6575 CD BB 6E      [17]  172 	call	__moduchar
   6578 F1            [10]  173 	pop	af
   6579 4D            [ 4]  174 	ld	c,l
   657A D1            [10]  175 	pop	de
   657B 06 00         [ 7]  176 	ld	b,#0x00
   657D 03            [ 6]  177 	inc	bc
   657E 03            [ 6]  178 	inc	bc
   657F 03            [ 6]  179 	inc	bc
   6580 03            [ 6]  180 	inc	bc
   6581 03            [ 6]  181 	inc	bc
   6582 DD 7E FF      [19]  182 	ld	a,-1 (ix)
   6585 F5            [11]  183 	push	af
   6586 33            [ 6]  184 	inc	sp
   6587 D5            [11]  185 	push	de
   6588 C5            [11]  186 	push	bc
   6589 DD 6E 04      [19]  187 	ld	l,4 (ix)
   658C DD 66 05      [19]  188 	ld	h,5 (ix)
   658F E5            [11]  189 	push	hl
   6590 CD EA 69      [17]  190 	call	_revivirEnemigo
   6593 21 07 00      [10]  191 	ld	hl,#7
   6596 39            [11]  192 	add	hl,sp
   6597 F9            [ 6]  193 	ld	sp,hl
   6598 33            [ 6]  194 	inc	sp
   6599 DD E1         [14]  195 	pop	ix
   659B C9            [10]  196 	ret
                            197 ;src/entities/wavemanager.c:35: void inicializarWaveManager(){
                            198 ;	---------------------------------
                            199 ; Function inicializarWaveManager
                            200 ; ---------------------------------
   659C                     201 _inicializarWaveManager::
                            202 ;src/entities/wavemanager.c:36: seed = 1;
   659C 21 8C 7D      [10]  203 	ld	hl,#_seed + 0
   659F 36 01         [10]  204 	ld	(hl), #0x01
                            205 ;src/entities/wavemanager.c:37: s_samemap = 0;
   65A1 21 00 00      [10]  206 	ld	hl,#0x0000
   65A4 22 88 7D      [16]  207 	ld	(_s_samemap),hl
                            208 ;src/entities/wavemanager.c:38: d_samemap = 150;
   65A7 2E 96         [ 7]  209 	ld	l, #0x96
   65A9 22 8A 7D      [16]  210 	ld	(_d_samemap),hl
                            211 ;src/entities/wavemanager.c:39: enemigos_actual = NUM_ENEMIGOS;
   65AC 21 8D 7D      [10]  212 	ld	hl,#_enemigos_actual + 0
   65AF 36 03         [10]  213 	ld	(hl), #0x03
   65B1 C9            [10]  214 	ret
                            215 ;src/entities/wavemanager.c:42: void updateTiempoEnMapa(){
                            216 ;	---------------------------------
                            217 ; Function updateTiempoEnMapa
                            218 ; ---------------------------------
   65B2                     219 _updateTiempoEnMapa::
                            220 ;src/entities/wavemanager.c:43: if(++s_samemap >= d_samemap){
   65B2 21 88 7D      [10]  221 	ld	hl, #_s_samemap+0
   65B5 34            [11]  222 	inc	(hl)
   65B6 20 04         [12]  223 	jr	NZ,00117$
   65B8 21 89 7D      [10]  224 	ld	hl, #_s_samemap+1
   65BB 34            [11]  225 	inc	(hl)
   65BC                     226 00117$:
   65BC 21 8A 7D      [10]  227 	ld	hl,#_d_samemap
   65BF 3A 88 7D      [13]  228 	ld	a,(#_s_samemap + 0)
   65C2 96            [ 7]  229 	sub	a, (hl)
   65C3 3A 89 7D      [13]  230 	ld	a,(#_s_samemap + 1)
   65C6 23            [ 6]  231 	inc	hl
   65C7 9E            [ 7]  232 	sbc	a, (hl)
   65C8 38 10         [12]  233 	jr	C,00104$
                            234 ;src/entities/wavemanager.c:44: if(contarEnemigos() == 0)
   65CA CD C8 85      [17]  235 	call	_contarEnemigos
   65CD 7D            [ 4]  236 	ld	a,l
   65CE B7            [ 4]  237 	or	a, a
   65CF 20 03         [12]  238 	jr	NZ,00102$
                            239 ;src/entities/wavemanager.c:45: respawnearEnemigoPorBorde();
   65D1 CD E6 65      [17]  240 	call	_respawnearEnemigoPorBorde
   65D4                     241 00102$:
                            242 ;src/entities/wavemanager.c:46: s_samemap = 0;
   65D4 21 00 00      [10]  243 	ld	hl,#0x0000
   65D7 22 88 7D      [16]  244 	ld	(_s_samemap),hl
   65DA                     245 00104$:
                            246 ;src/entities/wavemanager.c:48: seed++;
   65DA 21 8C 7D      [10]  247 	ld	hl, #_seed+0
   65DD 34            [11]  248 	inc	(hl)
                            249 ;src/entities/wavemanager.c:50: seed = 1;
   65DE C9            [10]  250 	ret
                            251 ;src/entities/wavemanager.c:52: void resetearTimepoEnMapa(){
                            252 ;	---------------------------------
                            253 ; Function resetearTimepoEnMapa
                            254 ; ---------------------------------
   65DF                     255 _resetearTimepoEnMapa::
                            256 ;src/entities/wavemanager.c:53: s_samemap = 0;
   65DF 21 00 00      [10]  257 	ld	hl,#0x0000
   65E2 22 88 7D      [16]  258 	ld	(_s_samemap),hl
   65E5 C9            [10]  259 	ret
                            260 ;src/entities/wavemanager.c:57: void respawnearEnemigoPorBorde(){
                            261 ;	---------------------------------
                            262 ; Function respawnearEnemigoPorBorde
                            263 ; ---------------------------------
   65E6                     264 _respawnearEnemigoPorBorde::
                            265 ;src/entities/wavemanager.c:61: random_number = getRandomUniform(seed)%3;
   65E6 3A 8C 7D      [13]  266 	ld	a,(_seed)
   65E9 F5            [11]  267 	push	af
   65EA 33            [ 6]  268 	inc	sp
   65EB CD 5F 6A      [17]  269 	call	_getRandomUniform
   65EE 33            [ 6]  270 	inc	sp
   65EF 45            [ 4]  271 	ld	b,l
   65F0 3E 03         [ 7]  272 	ld	a,#0x03
   65F2 F5            [11]  273 	push	af
   65F3 33            [ 6]  274 	inc	sp
   65F4 C5            [11]  275 	push	bc
   65F5 33            [ 6]  276 	inc	sp
   65F6 CD BB 6E      [17]  277 	call	__moduchar
                            278 ;src/entities/wavemanager.c:62: enemies = getEnemies();
   65F9 E3            [19]  279 	ex	(sp),hl
   65FA CD 4B 90      [17]  280 	call	_getEnemies
   65FD 4D            [ 4]  281 	ld	c,l
   65FE 44            [ 4]  282 	ld	b,h
   65FF E1            [10]  283 	pop	hl
                            284 ;src/entities/wavemanager.c:67: posicionAleatoriaBorde(&enemies[random_number]);
   6600 5D            [ 4]  285 	ld	e,l
   6601 16 00         [ 7]  286 	ld	d,#0x00
   6603 6B            [ 4]  287 	ld	l, e
   6604 62            [ 4]  288 	ld	h, d
   6605 29            [11]  289 	add	hl, hl
   6606 29            [11]  290 	add	hl, hl
   6607 29            [11]  291 	add	hl, hl
   6608 19            [11]  292 	add	hl, de
   6609 29            [11]  293 	add	hl, hl
   660A 19            [11]  294 	add	hl, de
   660B 29            [11]  295 	add	hl, hl
   660C 19            [11]  296 	add	hl, de
   660D 29            [11]  297 	add	hl, hl
   660E 09            [11]  298 	add	hl,bc
   660F E5            [11]  299 	push	hl
   6610 CD 15 66      [17]  300 	call	_posicionAleatoriaBorde
   6613 F1            [10]  301 	pop	af
   6614 C9            [10]  302 	ret
                            303 ;src/entities/wavemanager.c:74: void posicionAleatoriaBorde(TEnemy* enemy){
                            304 ;	---------------------------------
                            305 ; Function posicionAleatoriaBorde
                            306 ; ---------------------------------
   6615                     307 _posicionAleatoriaBorde::
   6615 DD E5         [15]  308 	push	ix
   6617 DD 21 00 00   [14]  309 	ld	ix,#0
   661B DD 39         [15]  310 	add	ix,sp
   661D F5            [11]  311 	push	af
   661E F5            [11]  312 	push	af
                            313 ;src/entities/wavemanager.c:78: switch(mapaActual){
   661F 3E 05         [ 7]  314 	ld	a,#0x05
   6621 FD 21 7D 7D   [14]  315 	ld	iy,#_mapaActual
   6625 FD 96 00      [19]  316 	sub	a, 0 (iy)
   6628 DA E1 69      [10]  317 	jp	C,00128$
                            318 ;src/entities/wavemanager.c:97: revivirEnemigo(enemy, ANCHO - enemy->ent.sw, getRandomUniform(seed)%141 + 50, d_left);	
   662B DD 7E 04      [19]  319 	ld	a,4 (ix)
   662E DD 77 FE      [19]  320 	ld	-2 (ix),a
   6631 DD 7E 05      [19]  321 	ld	a,5 (ix)
   6634 DD 77 FF      [19]  322 	ld	-1 (ix),a
   6637 DD 7E FE      [19]  323 	ld	a,-2 (ix)
   663A C6 39         [ 7]  324 	add	a, #0x39
   663C DD 77 FC      [19]  325 	ld	-4 (ix),a
   663F DD 7E FF      [19]  326 	ld	a,-1 (ix)
   6642 CE 00         [ 7]  327 	adc	a, #0x00
   6644 DD 77 FD      [19]  328 	ld	-3 (ix),a
                            329 ;src/entities/wavemanager.c:99: revivirEnemigo(enemy, getRandomUniform(seed)%70 + 5, ALTO - enemy->ent.sh, d_up);
   6647 DD 7E FE      [19]  330 	ld	a,-2 (ix)
   664A C6 3A         [ 7]  331 	add	a, #0x3A
   664C 4F            [ 4]  332 	ld	c,a
   664D DD 7E FF      [19]  333 	ld	a,-1 (ix)
   6650 CE 00         [ 7]  334 	adc	a, #0x00
   6652 47            [ 4]  335 	ld	b,a
                            336 ;src/entities/wavemanager.c:78: switch(mapaActual){
   6653 FD 21 7D 7D   [14]  337 	ld	iy,#_mapaActual
   6657 FD 5E 00      [19]  338 	ld	e,0 (iy)
   665A 16 00         [ 7]  339 	ld	d,#0x00
   665C 21 63 66      [10]  340 	ld	hl,#00163$
   665F 19            [11]  341 	add	hl,de
   6660 19            [11]  342 	add	hl,de
   6661 19            [11]  343 	add	hl,de
   6662 E9            [ 4]  344 	jp	(hl)
   6663                     345 00163$:
   6663 C3 E1 69      [10]  346 	jp	00128$
   6666 C3 78 66      [10]  347 	jp	00102$
   6669 C3 FD 66      [10]  348 	jp	00106$
   666C C3 E0 67      [10]  349 	jp	00113$
   666F C3 B9 68      [10]  350 	jp	00120$
   6672 C3 54 69      [10]  351 	jp	00124$
                            352 ;src/entities/wavemanager.c:80: case 0:													//Reaparece por arriba
                            353 ;src/entities/wavemanager.c:83: break;
   6675 C3 E1 69      [10]  354 	jp	00128$
                            355 ;src/entities/wavemanager.c:84: case 1:
   6678                     356 00102$:
                            357 ;src/entities/wavemanager.c:85: random_number = getRandomUniform(seed)%2;											//Aleatorio 0 o 1
   6678 3A 8C 7D      [13]  358 	ld	a,(_seed)
   667B F5            [11]  359 	push	af
   667C 33            [ 6]  360 	inc	sp
   667D CD 5F 6A      [17]  361 	call	_getRandomUniform
   6680 33            [ 6]  362 	inc	sp
   6681 7D            [ 4]  363 	ld	a,l
   6682 E6 01         [ 7]  364 	and	a, #0x01
   6684 4F            [ 4]  365 	ld	c,a
   6685 06 00         [ 7]  366 	ld	b,#0x00
                            367 ;src/entities/wavemanager.c:86: if(random_number == 1){														//Reaparece por arriba
   6687 0D            [ 4]  368 	dec	c
   6688 20 3B         [12]  369 	jr	NZ,00104$
   668A 78            [ 4]  370 	ld	a,b
   668B B7            [ 4]  371 	or	a, a
   668C 20 37         [12]  372 	jr	NZ,00104$
                            373 ;src/entities/wavemanager.c:87: revivirEnemigo(enemy, getRandomUniform(seed)%70 + 5, ORIGEN_MAPA_Y, d_down);
   668E 3A 8C 7D      [13]  374 	ld	a,(_seed)
   6691 F5            [11]  375 	push	af
   6692 33            [ 6]  376 	inc	sp
   6693 CD 5F 6A      [17]  377 	call	_getRandomUniform
   6696 33            [ 6]  378 	inc	sp
   6697 45            [ 4]  379 	ld	b,l
   6698 3E 46         [ 7]  380 	ld	a,#0x46
   669A F5            [11]  381 	push	af
   669B 33            [ 6]  382 	inc	sp
   669C C5            [11]  383 	push	bc
   669D 33            [ 6]  384 	inc	sp
   669E CD BB 6E      [17]  385 	call	__moduchar
   66A1 F1            [10]  386 	pop	af
   66A2 4D            [ 4]  387 	ld	c,l
   66A3 06 00         [ 7]  388 	ld	b,#0x00
   66A5 03            [ 6]  389 	inc	bc
   66A6 03            [ 6]  390 	inc	bc
   66A7 03            [ 6]  391 	inc	bc
   66A8 03            [ 6]  392 	inc	bc
   66A9 03            [ 6]  393 	inc	bc
   66AA 3E 02         [ 7]  394 	ld	a,#0x02
   66AC F5            [11]  395 	push	af
   66AD 33            [ 6]  396 	inc	sp
   66AE 21 28 00      [10]  397 	ld	hl,#0x0028
   66B1 E5            [11]  398 	push	hl
   66B2 C5            [11]  399 	push	bc
   66B3 DD 6E 04      [19]  400 	ld	l,4 (ix)
   66B6 DD 66 05      [19]  401 	ld	h,5 (ix)
   66B9 E5            [11]  402 	push	hl
   66BA CD EA 69      [17]  403 	call	_revivirEnemigo
   66BD 21 07 00      [10]  404 	ld	hl,#7
   66C0 39            [11]  405 	add	hl,sp
   66C1 F9            [ 6]  406 	ld	sp,hl
   66C2 C3 E1 69      [10]  407 	jp	00128$
   66C5                     408 00104$:
                            409 ;src/entities/wavemanager.c:89: revivirEnemigo(enemy, 0, getRandomUniform(seed)%141 + 50, d_right);	
   66C5 3A 8C 7D      [13]  410 	ld	a,(_seed)
   66C8 F5            [11]  411 	push	af
   66C9 33            [ 6]  412 	inc	sp
   66CA CD 5F 6A      [17]  413 	call	_getRandomUniform
   66CD 33            [ 6]  414 	inc	sp
   66CE 45            [ 4]  415 	ld	b,l
   66CF 3E 8D         [ 7]  416 	ld	a,#0x8D
   66D1 F5            [11]  417 	push	af
   66D2 33            [ 6]  418 	inc	sp
   66D3 C5            [11]  419 	push	bc
   66D4 33            [ 6]  420 	inc	sp
   66D5 CD BB 6E      [17]  421 	call	__moduchar
   66D8 F1            [10]  422 	pop	af
   66D9 4D            [ 4]  423 	ld	c,l
   66DA 06 00         [ 7]  424 	ld	b,#0x00
   66DC 21 32 00      [10]  425 	ld	hl,#0x0032
   66DF 09            [11]  426 	add	hl,bc
   66E0 4D            [ 4]  427 	ld	c,l
   66E1 44            [ 4]  428 	ld	b,h
   66E2 3E 01         [ 7]  429 	ld	a,#0x01
   66E4 F5            [11]  430 	push	af
   66E5 33            [ 6]  431 	inc	sp
   66E6 C5            [11]  432 	push	bc
   66E7 21 00 00      [10]  433 	ld	hl,#0x0000
   66EA E5            [11]  434 	push	hl
   66EB DD 6E 04      [19]  435 	ld	l,4 (ix)
   66EE DD 66 05      [19]  436 	ld	h,5 (ix)
   66F1 E5            [11]  437 	push	hl
   66F2 CD EA 69      [17]  438 	call	_revivirEnemigo
   66F5 21 07 00      [10]  439 	ld	hl,#7
   66F8 39            [11]  440 	add	hl,sp
   66F9 F9            [ 6]  441 	ld	sp,hl
                            442 ;src/entities/wavemanager.c:91: break;
   66FA C3 E1 69      [10]  443 	jp	00128$
                            444 ;src/entities/wavemanager.c:92: case 2:
   66FD                     445 00106$:
                            446 ;src/entities/wavemanager.c:93: random_number = getRandomUniform(seed)%3 + 1;											//Aleatorio 0 o 1
   66FD C5            [11]  447 	push	bc
   66FE 3A 8C 7D      [13]  448 	ld	a,(_seed)
   6701 F5            [11]  449 	push	af
   6702 33            [ 6]  450 	inc	sp
   6703 CD 5F 6A      [17]  451 	call	_getRandomUniform
   6706 33            [ 6]  452 	inc	sp
   6707 55            [ 4]  453 	ld	d,l
   6708 3E 03         [ 7]  454 	ld	a,#0x03
   670A F5            [11]  455 	push	af
   670B 33            [ 6]  456 	inc	sp
   670C D5            [11]  457 	push	de
   670D 33            [ 6]  458 	inc	sp
   670E CD BB 6E      [17]  459 	call	__moduchar
   6711 F1            [10]  460 	pop	af
   6712 C1            [10]  461 	pop	bc
   6713 26 00         [ 7]  462 	ld	h,#0x00
   6715 23            [ 6]  463 	inc	hl
                            464 ;src/entities/wavemanager.c:94: if(random_number == 1){																				//Reaparece por arriba
   6716 7D            [ 4]  465 	ld	a,l
   6717 3D            [ 4]  466 	dec	a
   6718 20 3B         [12]  467 	jr	NZ,00111$
   671A 7C            [ 4]  468 	ld	a,h
   671B B7            [ 4]  469 	or	a, a
   671C 20 37         [12]  470 	jr	NZ,00111$
                            471 ;src/entities/wavemanager.c:95: revivirEnemigo(enemy, getRandomUniform(seed)%70 + 5, ORIGEN_MAPA_Y, d_down);
   671E 3A 8C 7D      [13]  472 	ld	a,(_seed)
   6721 F5            [11]  473 	push	af
   6722 33            [ 6]  474 	inc	sp
   6723 CD 5F 6A      [17]  475 	call	_getRandomUniform
   6726 33            [ 6]  476 	inc	sp
   6727 45            [ 4]  477 	ld	b,l
   6728 3E 46         [ 7]  478 	ld	a,#0x46
   672A F5            [11]  479 	push	af
   672B 33            [ 6]  480 	inc	sp
   672C C5            [11]  481 	push	bc
   672D 33            [ 6]  482 	inc	sp
   672E CD BB 6E      [17]  483 	call	__moduchar
   6731 F1            [10]  484 	pop	af
   6732 4D            [ 4]  485 	ld	c,l
   6733 06 00         [ 7]  486 	ld	b,#0x00
   6735 03            [ 6]  487 	inc	bc
   6736 03            [ 6]  488 	inc	bc
   6737 03            [ 6]  489 	inc	bc
   6738 03            [ 6]  490 	inc	bc
   6739 03            [ 6]  491 	inc	bc
   673A 3E 02         [ 7]  492 	ld	a,#0x02
   673C F5            [11]  493 	push	af
   673D 33            [ 6]  494 	inc	sp
   673E 21 28 00      [10]  495 	ld	hl,#0x0028
   6741 E5            [11]  496 	push	hl
   6742 C5            [11]  497 	push	bc
   6743 DD 6E 04      [19]  498 	ld	l,4 (ix)
   6746 DD 66 05      [19]  499 	ld	h,5 (ix)
   6749 E5            [11]  500 	push	hl
   674A CD EA 69      [17]  501 	call	_revivirEnemigo
   674D 21 07 00      [10]  502 	ld	hl,#7
   6750 39            [11]  503 	add	hl,sp
   6751 F9            [ 6]  504 	ld	sp,hl
   6752 C3 E1 69      [10]  505 	jp	00128$
   6755                     506 00111$:
                            507 ;src/entities/wavemanager.c:96: }else if(random_number == 2){																		//Reaparece por derecha
   6755 7D            [ 4]  508 	ld	a,l
   6756 D6 02         [ 7]  509 	sub	a,#0x02
   6758 20 45         [12]  510 	jr	NZ,00108$
   675A B4            [ 4]  511 	or	a,h
   675B 20 42         [12]  512 	jr	NZ,00108$
                            513 ;src/entities/wavemanager.c:97: revivirEnemigo(enemy, ANCHO - enemy->ent.sw, getRandomUniform(seed)%141 + 50, d_left);	
   675D 3A 8C 7D      [13]  514 	ld	a,(_seed)
   6760 F5            [11]  515 	push	af
   6761 33            [ 6]  516 	inc	sp
   6762 CD 5F 6A      [17]  517 	call	_getRandomUniform
   6765 33            [ 6]  518 	inc	sp
   6766 45            [ 4]  519 	ld	b,l
   6767 3E 8D         [ 7]  520 	ld	a,#0x8D
   6769 F5            [11]  521 	push	af
   676A 33            [ 6]  522 	inc	sp
   676B C5            [11]  523 	push	bc
   676C 33            [ 6]  524 	inc	sp
   676D CD BB 6E      [17]  525 	call	__moduchar
   6770 F1            [10]  526 	pop	af
   6771 4D            [ 4]  527 	ld	c,l
   6772 06 00         [ 7]  528 	ld	b,#0x00
   6774 21 32 00      [10]  529 	ld	hl,#0x0032
   6777 09            [11]  530 	add	hl,bc
   6778 4D            [ 4]  531 	ld	c,l
   6779 44            [ 4]  532 	ld	b,h
   677A E1            [10]  533 	pop	hl
   677B E5            [11]  534 	push	hl
   677C 5E            [ 7]  535 	ld	e,(hl)
   677D 16 00         [ 7]  536 	ld	d,#0x00
   677F 3E 50         [ 7]  537 	ld	a,#0x50
   6781 93            [ 4]  538 	sub	a, e
   6782 5F            [ 4]  539 	ld	e,a
   6783 3E 00         [ 7]  540 	ld	a,#0x00
   6785 9A            [ 4]  541 	sbc	a, d
   6786 57            [ 4]  542 	ld	d,a
   6787 3E 03         [ 7]  543 	ld	a,#0x03
   6789 F5            [11]  544 	push	af
   678A 33            [ 6]  545 	inc	sp
   678B C5            [11]  546 	push	bc
   678C D5            [11]  547 	push	de
   678D DD 6E FE      [19]  548 	ld	l,-2 (ix)
   6790 DD 66 FF      [19]  549 	ld	h,-1 (ix)
   6793 E5            [11]  550 	push	hl
   6794 CD EA 69      [17]  551 	call	_revivirEnemigo
   6797 21 07 00      [10]  552 	ld	hl,#7
   679A 39            [11]  553 	add	hl,sp
   679B F9            [ 6]  554 	ld	sp,hl
   679C C3 E1 69      [10]  555 	jp	00128$
   679F                     556 00108$:
                            557 ;src/entities/wavemanager.c:99: revivirEnemigo(enemy, getRandomUniform(seed)%70 + 5, ALTO - enemy->ent.sh, d_up);
   679F 0A            [ 7]  558 	ld	a,(bc)
   67A0 4F            [ 4]  559 	ld	c,a
   67A1 06 00         [ 7]  560 	ld	b,#0x00
   67A3 3E C8         [ 7]  561 	ld	a,#0xC8
   67A5 91            [ 4]  562 	sub	a, c
   67A6 4F            [ 4]  563 	ld	c,a
   67A7 3E 00         [ 7]  564 	ld	a,#0x00
   67A9 98            [ 4]  565 	sbc	a, b
   67AA 47            [ 4]  566 	ld	b,a
   67AB C5            [11]  567 	push	bc
   67AC 3A 8C 7D      [13]  568 	ld	a,(_seed)
   67AF F5            [11]  569 	push	af
   67B0 33            [ 6]  570 	inc	sp
   67B1 CD 5F 6A      [17]  571 	call	_getRandomUniform
   67B4 33            [ 6]  572 	inc	sp
   67B5 55            [ 4]  573 	ld	d,l
   67B6 3E 46         [ 7]  574 	ld	a,#0x46
   67B8 F5            [11]  575 	push	af
   67B9 33            [ 6]  576 	inc	sp
   67BA D5            [11]  577 	push	de
   67BB 33            [ 6]  578 	inc	sp
   67BC CD BB 6E      [17]  579 	call	__moduchar
   67BF F1            [10]  580 	pop	af
   67C0 5D            [ 4]  581 	ld	e,l
   67C1 C1            [10]  582 	pop	bc
   67C2 16 00         [ 7]  583 	ld	d,#0x00
   67C4 13            [ 6]  584 	inc	de
   67C5 13            [ 6]  585 	inc	de
   67C6 13            [ 6]  586 	inc	de
   67C7 13            [ 6]  587 	inc	de
   67C8 13            [ 6]  588 	inc	de
   67C9 AF            [ 4]  589 	xor	a, a
   67CA F5            [11]  590 	push	af
   67CB 33            [ 6]  591 	inc	sp
   67CC C5            [11]  592 	push	bc
   67CD D5            [11]  593 	push	de
   67CE DD 6E FE      [19]  594 	ld	l,-2 (ix)
   67D1 DD 66 FF      [19]  595 	ld	h,-1 (ix)
   67D4 E5            [11]  596 	push	hl
   67D5 CD EA 69      [17]  597 	call	_revivirEnemigo
   67D8 21 07 00      [10]  598 	ld	hl,#7
   67DB 39            [11]  599 	add	hl,sp
   67DC F9            [ 6]  600 	ld	sp,hl
                            601 ;src/entities/wavemanager.c:101: break;
   67DD C3 E1 69      [10]  602 	jp	00128$
                            603 ;src/entities/wavemanager.c:102: case 3:
   67E0                     604 00113$:
                            605 ;src/entities/wavemanager.c:103: random_number = getRandomUniform(seed)%3 + 1;											//Aleatorio 0 o 1
   67E0 C5            [11]  606 	push	bc
   67E1 3A 8C 7D      [13]  607 	ld	a,(_seed)
   67E4 F5            [11]  608 	push	af
   67E5 33            [ 6]  609 	inc	sp
   67E6 CD 5F 6A      [17]  610 	call	_getRandomUniform
   67E9 33            [ 6]  611 	inc	sp
   67EA 55            [ 4]  612 	ld	d,l
   67EB 3E 03         [ 7]  613 	ld	a,#0x03
   67ED F5            [11]  614 	push	af
   67EE 33            [ 6]  615 	inc	sp
   67EF D5            [11]  616 	push	de
   67F0 33            [ 6]  617 	inc	sp
   67F1 CD BB 6E      [17]  618 	call	__moduchar
   67F4 F1            [10]  619 	pop	af
   67F5 C1            [10]  620 	pop	bc
   67F6 26 00         [ 7]  621 	ld	h,#0x00
   67F8 23            [ 6]  622 	inc	hl
                            623 ;src/entities/wavemanager.c:104: if(random_number == 1){																				//Reaparece por arriba
   67F9 7D            [ 4]  624 	ld	a,l
   67FA 3D            [ 4]  625 	dec	a
   67FB 20 3B         [12]  626 	jr	NZ,00118$
   67FD 7C            [ 4]  627 	ld	a,h
   67FE B7            [ 4]  628 	or	a, a
   67FF 20 37         [12]  629 	jr	NZ,00118$
                            630 ;src/entities/wavemanager.c:105: revivirEnemigo(enemy, getRandomUniform(seed)%70 + 5, ORIGEN_MAPA_Y, d_down);
   6801 3A 8C 7D      [13]  631 	ld	a,(_seed)
   6804 F5            [11]  632 	push	af
   6805 33            [ 6]  633 	inc	sp
   6806 CD 5F 6A      [17]  634 	call	_getRandomUniform
   6809 33            [ 6]  635 	inc	sp
   680A 45            [ 4]  636 	ld	b,l
   680B 3E 46         [ 7]  637 	ld	a,#0x46
   680D F5            [11]  638 	push	af
   680E 33            [ 6]  639 	inc	sp
   680F C5            [11]  640 	push	bc
   6810 33            [ 6]  641 	inc	sp
   6811 CD BB 6E      [17]  642 	call	__moduchar
   6814 F1            [10]  643 	pop	af
   6815 4D            [ 4]  644 	ld	c,l
   6816 06 00         [ 7]  645 	ld	b,#0x00
   6818 03            [ 6]  646 	inc	bc
   6819 03            [ 6]  647 	inc	bc
   681A 03            [ 6]  648 	inc	bc
   681B 03            [ 6]  649 	inc	bc
   681C 03            [ 6]  650 	inc	bc
   681D 3E 02         [ 7]  651 	ld	a,#0x02
   681F F5            [11]  652 	push	af
   6820 33            [ 6]  653 	inc	sp
   6821 21 28 00      [10]  654 	ld	hl,#0x0028
   6824 E5            [11]  655 	push	hl
   6825 C5            [11]  656 	push	bc
   6826 DD 6E 04      [19]  657 	ld	l,4 (ix)
   6829 DD 66 05      [19]  658 	ld	h,5 (ix)
   682C E5            [11]  659 	push	hl
   682D CD EA 69      [17]  660 	call	_revivirEnemigo
   6830 21 07 00      [10]  661 	ld	hl,#7
   6833 39            [11]  662 	add	hl,sp
   6834 F9            [ 6]  663 	ld	sp,hl
   6835 C3 E1 69      [10]  664 	jp	00128$
   6838                     665 00118$:
                            666 ;src/entities/wavemanager.c:106: }else if(random_number == 2){																		//Reaparece por izquierda
   6838 7D            [ 4]  667 	ld	a,l
   6839 D6 02         [ 7]  668 	sub	a,#0x02
   683B 20 3B         [12]  669 	jr	NZ,00115$
   683D B4            [ 4]  670 	or	a,h
   683E 20 38         [12]  671 	jr	NZ,00115$
                            672 ;src/entities/wavemanager.c:107: revivirEnemigo(enemy, 0, getRandomUniform(seed)%141 + 50, d_right);		
   6840 3A 8C 7D      [13]  673 	ld	a,(_seed)
   6843 F5            [11]  674 	push	af
   6844 33            [ 6]  675 	inc	sp
   6845 CD 5F 6A      [17]  676 	call	_getRandomUniform
   6848 33            [ 6]  677 	inc	sp
   6849 45            [ 4]  678 	ld	b,l
   684A 3E 8D         [ 7]  679 	ld	a,#0x8D
   684C F5            [11]  680 	push	af
   684D 33            [ 6]  681 	inc	sp
   684E C5            [11]  682 	push	bc
   684F 33            [ 6]  683 	inc	sp
   6850 CD BB 6E      [17]  684 	call	__moduchar
   6853 F1            [10]  685 	pop	af
   6854 4D            [ 4]  686 	ld	c,l
   6855 06 00         [ 7]  687 	ld	b,#0x00
   6857 21 32 00      [10]  688 	ld	hl,#0x0032
   685A 09            [11]  689 	add	hl,bc
   685B 4D            [ 4]  690 	ld	c,l
   685C 44            [ 4]  691 	ld	b,h
   685D 3E 01         [ 7]  692 	ld	a,#0x01
   685F F5            [11]  693 	push	af
   6860 33            [ 6]  694 	inc	sp
   6861 C5            [11]  695 	push	bc
   6862 21 00 00      [10]  696 	ld	hl,#0x0000
   6865 E5            [11]  697 	push	hl
   6866 DD 6E 04      [19]  698 	ld	l,4 (ix)
   6869 DD 66 05      [19]  699 	ld	h,5 (ix)
   686C E5            [11]  700 	push	hl
   686D CD EA 69      [17]  701 	call	_revivirEnemigo
   6870 21 07 00      [10]  702 	ld	hl,#7
   6873 39            [11]  703 	add	hl,sp
   6874 F9            [ 6]  704 	ld	sp,hl
   6875 C3 E1 69      [10]  705 	jp	00128$
   6878                     706 00115$:
                            707 ;src/entities/wavemanager.c:109: revivirEnemigo(enemy, getRandomUniform(seed)%70 + 5, ALTO - enemy->ent.sh, d_up);
   6878 0A            [ 7]  708 	ld	a,(bc)
   6879 4F            [ 4]  709 	ld	c,a
   687A 06 00         [ 7]  710 	ld	b,#0x00
   687C 3E C8         [ 7]  711 	ld	a,#0xC8
   687E 91            [ 4]  712 	sub	a, c
   687F 4F            [ 4]  713 	ld	c,a
   6880 3E 00         [ 7]  714 	ld	a,#0x00
   6882 98            [ 4]  715 	sbc	a, b
   6883 47            [ 4]  716 	ld	b,a
   6884 C5            [11]  717 	push	bc
   6885 3A 8C 7D      [13]  718 	ld	a,(_seed)
   6888 F5            [11]  719 	push	af
   6889 33            [ 6]  720 	inc	sp
   688A CD 5F 6A      [17]  721 	call	_getRandomUniform
   688D 33            [ 6]  722 	inc	sp
   688E 55            [ 4]  723 	ld	d,l
   688F 3E 46         [ 7]  724 	ld	a,#0x46
   6891 F5            [11]  725 	push	af
   6892 33            [ 6]  726 	inc	sp
   6893 D5            [11]  727 	push	de
   6894 33            [ 6]  728 	inc	sp
   6895 CD BB 6E      [17]  729 	call	__moduchar
   6898 F1            [10]  730 	pop	af
   6899 5D            [ 4]  731 	ld	e,l
   689A C1            [10]  732 	pop	bc
   689B 16 00         [ 7]  733 	ld	d,#0x00
   689D 13            [ 6]  734 	inc	de
   689E 13            [ 6]  735 	inc	de
   689F 13            [ 6]  736 	inc	de
   68A0 13            [ 6]  737 	inc	de
   68A1 13            [ 6]  738 	inc	de
   68A2 AF            [ 4]  739 	xor	a, a
   68A3 F5            [11]  740 	push	af
   68A4 33            [ 6]  741 	inc	sp
   68A5 C5            [11]  742 	push	bc
   68A6 D5            [11]  743 	push	de
   68A7 DD 6E FE      [19]  744 	ld	l,-2 (ix)
   68AA DD 66 FF      [19]  745 	ld	h,-1 (ix)
   68AD E5            [11]  746 	push	hl
   68AE CD EA 69      [17]  747 	call	_revivirEnemigo
   68B1 21 07 00      [10]  748 	ld	hl,#7
   68B4 39            [11]  749 	add	hl,sp
   68B5 F9            [ 6]  750 	ld	sp,hl
                            751 ;src/entities/wavemanager.c:111: break;
   68B6 C3 E1 69      [10]  752 	jp	00128$
                            753 ;src/entities/wavemanager.c:112: case 4:
   68B9                     754 00120$:
                            755 ;src/entities/wavemanager.c:113: random_number = getRandomUniform(seed)%2;											//Aleatorio 0 o 1
   68B9 C5            [11]  756 	push	bc
   68BA 3A 8C 7D      [13]  757 	ld	a,(_seed)
   68BD F5            [11]  758 	push	af
   68BE 33            [ 6]  759 	inc	sp
   68BF CD 5F 6A      [17]  760 	call	_getRandomUniform
   68C2 33            [ 6]  761 	inc	sp
   68C3 C1            [10]  762 	pop	bc
   68C4 7D            [ 4]  763 	ld	a,l
   68C5 E6 01         [ 7]  764 	and	a, #0x01
   68C7 5F            [ 4]  765 	ld	e,a
   68C8 16 00         [ 7]  766 	ld	d,#0x00
                            767 ;src/entities/wavemanager.c:114: if(random_number == 1){														//Reaparece por abajo
   68CA 1D            [ 4]  768 	dec	e
   68CB 20 45         [12]  769 	jr	NZ,00122$
   68CD 7A            [ 4]  770 	ld	a,d
   68CE B7            [ 4]  771 	or	a, a
   68CF 20 41         [12]  772 	jr	NZ,00122$
                            773 ;src/entities/wavemanager.c:115: revivirEnemigo(enemy, getRandomUniform(seed)%70 + 5, ALTO - enemy->ent.sh, d_up);
   68D1 0A            [ 7]  774 	ld	a,(bc)
   68D2 4F            [ 4]  775 	ld	c,a
   68D3 06 00         [ 7]  776 	ld	b,#0x00
   68D5 3E C8         [ 7]  777 	ld	a,#0xC8
   68D7 91            [ 4]  778 	sub	a, c
   68D8 4F            [ 4]  779 	ld	c,a
   68D9 3E 00         [ 7]  780 	ld	a,#0x00
   68DB 98            [ 4]  781 	sbc	a, b
   68DC 47            [ 4]  782 	ld	b,a
   68DD C5            [11]  783 	push	bc
   68DE 3A 8C 7D      [13]  784 	ld	a,(_seed)
   68E1 F5            [11]  785 	push	af
   68E2 33            [ 6]  786 	inc	sp
   68E3 CD 5F 6A      [17]  787 	call	_getRandomUniform
   68E6 33            [ 6]  788 	inc	sp
   68E7 55            [ 4]  789 	ld	d,l
   68E8 3E 46         [ 7]  790 	ld	a,#0x46
   68EA F5            [11]  791 	push	af
   68EB 33            [ 6]  792 	inc	sp
   68EC D5            [11]  793 	push	de
   68ED 33            [ 6]  794 	inc	sp
   68EE CD BB 6E      [17]  795 	call	__moduchar
   68F1 F1            [10]  796 	pop	af
   68F2 5D            [ 4]  797 	ld	e,l
   68F3 C1            [10]  798 	pop	bc
   68F4 16 00         [ 7]  799 	ld	d,#0x00
   68F6 13            [ 6]  800 	inc	de
   68F7 13            [ 6]  801 	inc	de
   68F8 13            [ 6]  802 	inc	de
   68F9 13            [ 6]  803 	inc	de
   68FA 13            [ 6]  804 	inc	de
   68FB AF            [ 4]  805 	xor	a, a
   68FC F5            [11]  806 	push	af
   68FD 33            [ 6]  807 	inc	sp
   68FE C5            [11]  808 	push	bc
   68FF D5            [11]  809 	push	de
   6900 DD 6E FE      [19]  810 	ld	l,-2 (ix)
   6903 DD 66 FF      [19]  811 	ld	h,-1 (ix)
   6906 E5            [11]  812 	push	hl
   6907 CD EA 69      [17]  813 	call	_revivirEnemigo
   690A 21 07 00      [10]  814 	ld	hl,#7
   690D 39            [11]  815 	add	hl,sp
   690E F9            [ 6]  816 	ld	sp,hl
   690F C3 E1 69      [10]  817 	jp	00128$
   6912                     818 00122$:
                            819 ;src/entities/wavemanager.c:117: revivirEnemigo(enemy, ANCHO - enemy->ent.sw, getRandomUniform(seed)%141 + 50, d_left);	
   6912 3A 8C 7D      [13]  820 	ld	a,(_seed)
   6915 F5            [11]  821 	push	af
   6916 33            [ 6]  822 	inc	sp
   6917 CD 5F 6A      [17]  823 	call	_getRandomUniform
   691A 33            [ 6]  824 	inc	sp
   691B 45            [ 4]  825 	ld	b,l
   691C 3E 8D         [ 7]  826 	ld	a,#0x8D
   691E F5            [11]  827 	push	af
   691F 33            [ 6]  828 	inc	sp
   6920 C5            [11]  829 	push	bc
   6921 33            [ 6]  830 	inc	sp
   6922 CD BB 6E      [17]  831 	call	__moduchar
   6925 F1            [10]  832 	pop	af
   6926 4D            [ 4]  833 	ld	c,l
   6927 06 00         [ 7]  834 	ld	b,#0x00
   6929 21 32 00      [10]  835 	ld	hl,#0x0032
   692C 09            [11]  836 	add	hl,bc
   692D 4D            [ 4]  837 	ld	c,l
   692E 44            [ 4]  838 	ld	b,h
   692F E1            [10]  839 	pop	hl
   6930 E5            [11]  840 	push	hl
   6931 5E            [ 7]  841 	ld	e,(hl)
   6932 16 00         [ 7]  842 	ld	d,#0x00
   6934 3E 50         [ 7]  843 	ld	a,#0x50
   6936 93            [ 4]  844 	sub	a, e
   6937 5F            [ 4]  845 	ld	e,a
   6938 3E 00         [ 7]  846 	ld	a,#0x00
   693A 9A            [ 4]  847 	sbc	a, d
   693B 57            [ 4]  848 	ld	d,a
   693C 3E 03         [ 7]  849 	ld	a,#0x03
   693E F5            [11]  850 	push	af
   693F 33            [ 6]  851 	inc	sp
   6940 C5            [11]  852 	push	bc
   6941 D5            [11]  853 	push	de
   6942 DD 6E FE      [19]  854 	ld	l,-2 (ix)
   6945 DD 66 FF      [19]  855 	ld	h,-1 (ix)
   6948 E5            [11]  856 	push	hl
   6949 CD EA 69      [17]  857 	call	_revivirEnemigo
   694C 21 07 00      [10]  858 	ld	hl,#7
   694F 39            [11]  859 	add	hl,sp
   6950 F9            [ 6]  860 	ld	sp,hl
                            861 ;src/entities/wavemanager.c:119: break;
   6951 C3 E1 69      [10]  862 	jp	00128$
                            863 ;src/entities/wavemanager.c:120: case 5:
   6954                     864 00124$:
                            865 ;src/entities/wavemanager.c:121: random_number = getRandomUniform(seed)%2;											//Aleatorio 0 o 1
   6954 C5            [11]  866 	push	bc
   6955 3A 8C 7D      [13]  867 	ld	a,(_seed)
   6958 F5            [11]  868 	push	af
   6959 33            [ 6]  869 	inc	sp
   695A CD 5F 6A      [17]  870 	call	_getRandomUniform
   695D 33            [ 6]  871 	inc	sp
   695E C1            [10]  872 	pop	bc
   695F 7D            [ 4]  873 	ld	a,l
   6960 E6 01         [ 7]  874 	and	a, #0x01
   6962 5F            [ 4]  875 	ld	e,a
   6963 16 00         [ 7]  876 	ld	d,#0x00
                            877 ;src/entities/wavemanager.c:122: if(random_number == 1){														//Reaparece por izquierda
   6965 1D            [ 4]  878 	dec	e
   6966 20 3B         [12]  879 	jr	NZ,00126$
   6968 7A            [ 4]  880 	ld	a,d
   6969 B7            [ 4]  881 	or	a, a
   696A 20 37         [12]  882 	jr	NZ,00126$
                            883 ;src/entities/wavemanager.c:123: revivirEnemigo(enemy, 0, getRandomUniform(seed)%141 + 50, d_right);	
   696C 3A 8C 7D      [13]  884 	ld	a,(_seed)
   696F F5            [11]  885 	push	af
   6970 33            [ 6]  886 	inc	sp
   6971 CD 5F 6A      [17]  887 	call	_getRandomUniform
   6974 33            [ 6]  888 	inc	sp
   6975 45            [ 4]  889 	ld	b,l
   6976 3E 8D         [ 7]  890 	ld	a,#0x8D
   6978 F5            [11]  891 	push	af
   6979 33            [ 6]  892 	inc	sp
   697A C5            [11]  893 	push	bc
   697B 33            [ 6]  894 	inc	sp
   697C CD BB 6E      [17]  895 	call	__moduchar
   697F F1            [10]  896 	pop	af
   6980 4D            [ 4]  897 	ld	c,l
   6981 06 00         [ 7]  898 	ld	b,#0x00
   6983 21 32 00      [10]  899 	ld	hl,#0x0032
   6986 09            [11]  900 	add	hl,bc
   6987 4D            [ 4]  901 	ld	c,l
   6988 44            [ 4]  902 	ld	b,h
   6989 3E 01         [ 7]  903 	ld	a,#0x01
   698B F5            [11]  904 	push	af
   698C 33            [ 6]  905 	inc	sp
   698D C5            [11]  906 	push	bc
   698E 21 00 00      [10]  907 	ld	hl,#0x0000
   6991 E5            [11]  908 	push	hl
   6992 DD 6E 04      [19]  909 	ld	l,4 (ix)
   6995 DD 66 05      [19]  910 	ld	h,5 (ix)
   6998 E5            [11]  911 	push	hl
   6999 CD EA 69      [17]  912 	call	_revivirEnemigo
   699C 21 07 00      [10]  913 	ld	hl,#7
   699F 39            [11]  914 	add	hl,sp
   69A0 F9            [ 6]  915 	ld	sp,hl
   69A1 18 3E         [12]  916 	jr	00128$
   69A3                     917 00126$:
                            918 ;src/entities/wavemanager.c:125: revivirEnemigo(enemy, getRandomUniform(seed)%70 + 5, ALTO - enemy->ent.sh, d_up);	
   69A3 0A            [ 7]  919 	ld	a,(bc)
   69A4 4F            [ 4]  920 	ld	c,a
   69A5 06 00         [ 7]  921 	ld	b,#0x00
   69A7 3E C8         [ 7]  922 	ld	a,#0xC8
   69A9 91            [ 4]  923 	sub	a, c
   69AA 4F            [ 4]  924 	ld	c,a
   69AB 3E 00         [ 7]  925 	ld	a,#0x00
   69AD 98            [ 4]  926 	sbc	a, b
   69AE 47            [ 4]  927 	ld	b,a
   69AF C5            [11]  928 	push	bc
   69B0 3A 8C 7D      [13]  929 	ld	a,(_seed)
   69B3 F5            [11]  930 	push	af
   69B4 33            [ 6]  931 	inc	sp
   69B5 CD 5F 6A      [17]  932 	call	_getRandomUniform
   69B8 33            [ 6]  933 	inc	sp
   69B9 55            [ 4]  934 	ld	d,l
   69BA 3E 46         [ 7]  935 	ld	a,#0x46
   69BC F5            [11]  936 	push	af
   69BD 33            [ 6]  937 	inc	sp
   69BE D5            [11]  938 	push	de
   69BF 33            [ 6]  939 	inc	sp
   69C0 CD BB 6E      [17]  940 	call	__moduchar
   69C3 F1            [10]  941 	pop	af
   69C4 5D            [ 4]  942 	ld	e,l
   69C5 C1            [10]  943 	pop	bc
   69C6 16 00         [ 7]  944 	ld	d,#0x00
   69C8 13            [ 6]  945 	inc	de
   69C9 13            [ 6]  946 	inc	de
   69CA 13            [ 6]  947 	inc	de
   69CB 13            [ 6]  948 	inc	de
   69CC 13            [ 6]  949 	inc	de
   69CD AF            [ 4]  950 	xor	a, a
   69CE F5            [11]  951 	push	af
   69CF 33            [ 6]  952 	inc	sp
   69D0 C5            [11]  953 	push	bc
   69D1 D5            [11]  954 	push	de
   69D2 DD 6E FE      [19]  955 	ld	l,-2 (ix)
   69D5 DD 66 FF      [19]  956 	ld	h,-1 (ix)
   69D8 E5            [11]  957 	push	hl
   69D9 CD EA 69      [17]  958 	call	_revivirEnemigo
   69DC 21 07 00      [10]  959 	ld	hl,#7
   69DF 39            [11]  960 	add	hl,sp
   69E0 F9            [ 6]  961 	ld	sp,hl
                            962 ;src/entities/wavemanager.c:128: }
   69E1                     963 00128$:
                            964 ;src/entities/wavemanager.c:130: enemigos_actual++;
   69E1 21 8D 7D      [10]  965 	ld	hl, #_enemigos_actual+0
   69E4 34            [11]  966 	inc	(hl)
   69E5 DD F9         [10]  967 	ld	sp, ix
   69E7 DD E1         [14]  968 	pop	ix
   69E9 C9            [10]  969 	ret
                            970 ;src/entities/wavemanager.c:133: void revivirEnemigo(TEnemy* enemy, i16 x, i16 y, TPlayerDirection dir){
                            971 ;	---------------------------------
                            972 ; Function revivirEnemigo
                            973 ; ---------------------------------
   69EA                     974 _revivirEnemigo::
   69EA DD E5         [15]  975 	push	ix
   69EC DD 21 00 00   [14]  976 	ld	ix,#0
   69F0 DD 39         [15]  977 	add	ix,sp
                            978 ;src/entities/wavemanager.c:134: enemy->ent.vivo = SI;
   69F2 DD 4E 04      [19]  979 	ld	c,4 (ix)
   69F5 DD 46 05      [19]  980 	ld	b,5 (ix)
   69F8 21 26 00      [10]  981 	ld	hl,#0x0026
   69FB 09            [11]  982 	add	hl,bc
   69FC EB            [ 4]  983 	ex	de,hl
   69FD 21 41 00      [10]  984 	ld	hl,#0x0041
   6A00 09            [11]  985 	add	hl,bc
   6A01 36 01         [10]  986 	ld	(hl),#0x01
                            987 ;src/entities/wavemanager.c:135: enemy->ent.draw = SI;
   6A03 21 30 00      [10]  988 	ld	hl,#0x0030
   6A06 09            [11]  989 	add	hl,bc
   6A07 36 01         [10]  990 	ld	(hl),#0x01
                            991 ;src/entities/wavemanager.c:136: enemy->ent.x = x;
   6A09 DD 7E 06      [19]  992 	ld	a,6 (ix)
   6A0C 12            [ 7]  993 	ld	(de),a
   6A0D 13            [ 6]  994 	inc	de
   6A0E DD 7E 07      [19]  995 	ld	a,7 (ix)
   6A11 12            [ 7]  996 	ld	(de),a
                            997 ;src/entities/wavemanager.c:137: enemy->ent.y = y;
   6A12 21 28 00      [10]  998 	ld	hl,#0x0028
   6A15 09            [11]  999 	add	hl,bc
   6A16 DD 7E 08      [19] 1000 	ld	a,8 (ix)
   6A19 77            [ 7] 1001 	ld	(hl),a
   6A1A 23            [ 6] 1002 	inc	hl
   6A1B DD 7E 09      [19] 1003 	ld	a,9 (ix)
   6A1E 77            [ 7] 1004 	ld	(hl),a
                           1005 ;src/entities/wavemanager.c:138: enemy->ent.px = x;
   6A1F 21 2A 00      [10] 1006 	ld	hl,#0x002A
   6A22 09            [11] 1007 	add	hl,bc
   6A23 DD 7E 06      [19] 1008 	ld	a,6 (ix)
   6A26 77            [ 7] 1009 	ld	(hl),a
   6A27 23            [ 6] 1010 	inc	hl
   6A28 DD 7E 07      [19] 1011 	ld	a,7 (ix)
   6A2B 77            [ 7] 1012 	ld	(hl),a
                           1013 ;src/entities/wavemanager.c:139: enemy->ent.py = y;
   6A2C 21 2C 00      [10] 1014 	ld	hl,#0x002C
   6A2F 09            [11] 1015 	add	hl,bc
   6A30 DD 7E 08      [19] 1016 	ld	a,8 (ix)
   6A33 77            [ 7] 1017 	ld	(hl),a
   6A34 23            [ 6] 1018 	inc	hl
   6A35 DD 7E 09      [19] 1019 	ld	a,9 (ix)
   6A38 77            [ 7] 1020 	ld	(hl),a
                           1021 ;src/entities/wavemanager.c:140: enemy->ent.cuadrante = mapaActual;
   6A39 21 42 00      [10] 1022 	ld	hl,#0x0042
   6A3C 09            [11] 1023 	add	hl,bc
   6A3D 3A 7D 7D      [13] 1024 	ld	a,(#_mapaActual + 0)
   6A40 77            [ 7] 1025 	ld	(hl),a
                           1026 ;src/entities/wavemanager.c:141: enemy->statusIA = s_mover;
   6A41 21 49 00      [10] 1027 	ld	hl,#0x0049
   6A44 09            [11] 1028 	add	hl,bc
   6A45 36 00         [10] 1029 	ld	(hl),#0x00
                           1030 ;src/entities/wavemanager.c:142: enemy->ent.curr_dir = dir;
   6A47 21 3B 00      [10] 1031 	ld	hl,#0x003B
   6A4A 09            [11] 1032 	add	hl,bc
   6A4B DD 7E 0A      [19] 1033 	ld	a,10 (ix)
   6A4E 77            [ 7] 1034 	ld	(hl),a
                           1035 ;src/entities/wavemanager.c:143: enemy->bullet.ent.cuadrante = mapaActual;
   6A4F 21 1F 00      [10] 1036 	ld	hl,#0x001F
   6A52 09            [11] 1037 	add	hl,bc
   6A53 3A 7D 7D      [13] 1038 	ld	a,(#_mapaActual + 0)
   6A56 77            [ 7] 1039 	ld	(hl),a
   6A57 DD E1         [14] 1040 	pop	ix
   6A59 C9            [10] 1041 	ret
                           1042 ;src/entities/wavemanager.c:148: void restarEnemigo(){
                           1043 ;	---------------------------------
                           1044 ; Function restarEnemigo
                           1045 ; ---------------------------------
   6A5A                    1046 _restarEnemigo::
                           1047 ;src/entities/wavemanager.c:149: enemigos_actual--;
   6A5A 21 8D 7D      [10] 1048 	ld	hl, #_enemigos_actual+0
   6A5D 35            [11] 1049 	dec	(hl)
   6A5E C9            [10] 1050 	ret
                           1051 	.area _CODE
                           1052 	.area _INITIALIZER
   7D9B                    1053 __xinit__s_samemap:
   7D9B 00 00              1054 	.dw #0x0000
   7D9D                    1055 __xinit__d_samemap:
   7D9D 96 00              1056 	.dw #0x0096
   7D9F                    1057 __xinit__seed:
   7D9F 01                 1058 	.db #0x01	; 1
   7DA0                    1059 __xinit__enemigos_actual:
   7DA0 03                 1060 	.db #0x03	; 3
                           1061 	.area _CABS (ABS)
