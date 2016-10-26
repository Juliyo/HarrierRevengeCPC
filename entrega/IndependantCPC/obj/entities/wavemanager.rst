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
   85FF                      35 _mapaPrev::
   85FF                      36 	.ds 1
                             37 ;--------------------------------------------------------
                             38 ; ram data
                             39 ;--------------------------------------------------------
                             40 	.area _INITIALIZED
   860E                      41 _s_samemap::
   860E                      42 	.ds 2
   8610                      43 _d_samemap::
   8610                      44 	.ds 2
   8612                      45 _seed::
   8612                      46 	.ds 1
   8613                      47 _enemigos_actual::
   8613                      48 	.ds 1
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
   6523                      73 _aparecerEnemigo::
                             74 ;src/entities/wavemanager.c:23: if(contarEnemigos() == 0 && basesCapturadas >= 3){
   6523 CD 4E 8E      [17]   75 	call	_contarEnemigos
   6526 7D            [ 4]   76 	ld	a,l
   6527 B7            [ 4]   77 	or	a, a
   6528 C0            [11]   78 	ret	NZ
   6529 3A 06 86      [13]   79 	ld	a,(#_basesCapturadas + 0)
   652C D6 03         [ 7]   80 	sub	a, #0x03
   652E D8            [11]   81 	ret	C
                             82 ;src/entities/wavemanager.c:24: enemies = getEnemies();
   652F CD D1 98      [17]   83 	call	_getEnemies
                             84 ;src/entities/wavemanager.c:26: random_number = getRandomUniform(seed)%3;
   6532 E5            [11]   85 	push	hl
   6533 3A 12 86      [13]   86 	ld	a,(_seed)
   6536 F5            [11]   87 	push	af
   6537 33            [ 6]   88 	inc	sp
   6538 CD 93 6A      [17]   89 	call	_getRandomUniform
   653B 33            [ 6]   90 	inc	sp
   653C 55            [ 4]   91 	ld	d,l
   653D 3E 03         [ 7]   92 	ld	a,#0x03
   653F F5            [11]   93 	push	af
   6540 33            [ 6]   94 	inc	sp
   6541 D5            [11]   95 	push	de
   6542 33            [ 6]   96 	inc	sp
   6543 CD EF 6E      [17]   97 	call	__moduchar
   6546 F1            [10]   98 	pop	af
   6547 C1            [10]   99 	pop	bc
                            100 ;src/entities/wavemanager.c:27: respawnearEnemigo(&enemies[random_number]);
   6548 5D            [ 4]  101 	ld	e,l
   6549 16 00         [ 7]  102 	ld	d,#0x00
   654B 6B            [ 4]  103 	ld	l, e
   654C 62            [ 4]  104 	ld	h, d
   654D 29            [11]  105 	add	hl, hl
   654E 29            [11]  106 	add	hl, hl
   654F 29            [11]  107 	add	hl, hl
   6550 19            [11]  108 	add	hl, de
   6551 29            [11]  109 	add	hl, hl
   6552 19            [11]  110 	add	hl, de
   6553 29            [11]  111 	add	hl, hl
   6554 19            [11]  112 	add	hl, de
   6555 29            [11]  113 	add	hl, hl
   6556 09            [11]  114 	add	hl,bc
   6557 E5            [11]  115 	push	hl
   6558 CD 5D 65      [17]  116 	call	_respawnearEnemigo
   655B F1            [10]  117 	pop	af
   655C C9            [10]  118 	ret
                            119 ;src/entities/wavemanager.c:31: void respawnearEnemigo(TEnemy* enemy){
                            120 ;	---------------------------------
                            121 ; Function respawnearEnemigo
                            122 ; ---------------------------------
   655D                     123 _respawnearEnemigo::
   655D DD E5         [15]  124 	push	ix
   655F DD 21 00 00   [14]  125 	ld	ix,#0
   6563 DD 39         [15]  126 	add	ix,sp
   6565 3B            [ 6]  127 	dec	sp
                            128 ;src/entities/wavemanager.c:32: revivirEnemigo(enemy, getRandomUniform(seed)%70 + 5, getRandomUniform(seed)%141 + 50, getRandomUniform(seed)%3);
   6566 3A 12 86      [13]  129 	ld	a,(_seed)
   6569 F5            [11]  130 	push	af
   656A 33            [ 6]  131 	inc	sp
   656B CD 93 6A      [17]  132 	call	_getRandomUniform
   656E 33            [ 6]  133 	inc	sp
   656F 45            [ 4]  134 	ld	b,l
   6570 3E 03         [ 7]  135 	ld	a,#0x03
   6572 F5            [11]  136 	push	af
   6573 33            [ 6]  137 	inc	sp
   6574 C5            [11]  138 	push	bc
   6575 33            [ 6]  139 	inc	sp
   6576 CD EF 6E      [17]  140 	call	__moduchar
   6579 F1            [10]  141 	pop	af
   657A DD 75 FF      [19]  142 	ld	-1 (ix),l
   657D 3A 12 86      [13]  143 	ld	a,(_seed)
   6580 F5            [11]  144 	push	af
   6581 33            [ 6]  145 	inc	sp
   6582 CD 93 6A      [17]  146 	call	_getRandomUniform
   6585 33            [ 6]  147 	inc	sp
   6586 45            [ 4]  148 	ld	b,l
   6587 3E 8D         [ 7]  149 	ld	a,#0x8D
   6589 F5            [11]  150 	push	af
   658A 33            [ 6]  151 	inc	sp
   658B C5            [11]  152 	push	bc
   658C 33            [ 6]  153 	inc	sp
   658D CD EF 6E      [17]  154 	call	__moduchar
   6590 F1            [10]  155 	pop	af
   6591 4D            [ 4]  156 	ld	c,l
   6592 06 00         [ 7]  157 	ld	b,#0x00
   6594 21 32 00      [10]  158 	ld	hl,#0x0032
   6597 09            [11]  159 	add	hl,bc
   6598 E5            [11]  160 	push	hl
   6599 3A 12 86      [13]  161 	ld	a,(_seed)
   659C F5            [11]  162 	push	af
   659D 33            [ 6]  163 	inc	sp
   659E CD 93 6A      [17]  164 	call	_getRandomUniform
   65A1 33            [ 6]  165 	inc	sp
   65A2 45            [ 4]  166 	ld	b,l
   65A3 3E 46         [ 7]  167 	ld	a,#0x46
   65A5 F5            [11]  168 	push	af
   65A6 33            [ 6]  169 	inc	sp
   65A7 C5            [11]  170 	push	bc
   65A8 33            [ 6]  171 	inc	sp
   65A9 CD EF 6E      [17]  172 	call	__moduchar
   65AC F1            [10]  173 	pop	af
   65AD 4D            [ 4]  174 	ld	c,l
   65AE D1            [10]  175 	pop	de
   65AF 06 00         [ 7]  176 	ld	b,#0x00
   65B1 03            [ 6]  177 	inc	bc
   65B2 03            [ 6]  178 	inc	bc
   65B3 03            [ 6]  179 	inc	bc
   65B4 03            [ 6]  180 	inc	bc
   65B5 03            [ 6]  181 	inc	bc
   65B6 DD 7E FF      [19]  182 	ld	a,-1 (ix)
   65B9 F5            [11]  183 	push	af
   65BA 33            [ 6]  184 	inc	sp
   65BB D5            [11]  185 	push	de
   65BC C5            [11]  186 	push	bc
   65BD DD 6E 04      [19]  187 	ld	l,4 (ix)
   65C0 DD 66 05      [19]  188 	ld	h,5 (ix)
   65C3 E5            [11]  189 	push	hl
   65C4 CD 1E 6A      [17]  190 	call	_revivirEnemigo
   65C7 21 07 00      [10]  191 	ld	hl,#7
   65CA 39            [11]  192 	add	hl,sp
   65CB F9            [ 6]  193 	ld	sp,hl
   65CC 33            [ 6]  194 	inc	sp
   65CD DD E1         [14]  195 	pop	ix
   65CF C9            [10]  196 	ret
                            197 ;src/entities/wavemanager.c:35: void inicializarWaveManager(){
                            198 ;	---------------------------------
                            199 ; Function inicializarWaveManager
                            200 ; ---------------------------------
   65D0                     201 _inicializarWaveManager::
                            202 ;src/entities/wavemanager.c:36: seed = 1;
   65D0 21 12 86      [10]  203 	ld	hl,#_seed + 0
   65D3 36 01         [10]  204 	ld	(hl), #0x01
                            205 ;src/entities/wavemanager.c:37: s_samemap = 0;
   65D5 21 00 00      [10]  206 	ld	hl,#0x0000
   65D8 22 0E 86      [16]  207 	ld	(_s_samemap),hl
                            208 ;src/entities/wavemanager.c:38: d_samemap = 150;
   65DB 2E 96         [ 7]  209 	ld	l, #0x96
   65DD 22 10 86      [16]  210 	ld	(_d_samemap),hl
                            211 ;src/entities/wavemanager.c:39: enemigos_actual = NUM_ENEMIGOS;
   65E0 21 13 86      [10]  212 	ld	hl,#_enemigos_actual + 0
   65E3 36 03         [10]  213 	ld	(hl), #0x03
   65E5 C9            [10]  214 	ret
                            215 ;src/entities/wavemanager.c:42: void updateTiempoEnMapa(){
                            216 ;	---------------------------------
                            217 ; Function updateTiempoEnMapa
                            218 ; ---------------------------------
   65E6                     219 _updateTiempoEnMapa::
                            220 ;src/entities/wavemanager.c:43: if(++s_samemap >= d_samemap){
   65E6 21 0E 86      [10]  221 	ld	hl, #_s_samemap+0
   65E9 34            [11]  222 	inc	(hl)
   65EA 20 04         [12]  223 	jr	NZ,00117$
   65EC 21 0F 86      [10]  224 	ld	hl, #_s_samemap+1
   65EF 34            [11]  225 	inc	(hl)
   65F0                     226 00117$:
   65F0 21 10 86      [10]  227 	ld	hl,#_d_samemap
   65F3 3A 0E 86      [13]  228 	ld	a,(#_s_samemap + 0)
   65F6 96            [ 7]  229 	sub	a, (hl)
   65F7 3A 0F 86      [13]  230 	ld	a,(#_s_samemap + 1)
   65FA 23            [ 6]  231 	inc	hl
   65FB 9E            [ 7]  232 	sbc	a, (hl)
   65FC 38 10         [12]  233 	jr	C,00104$
                            234 ;src/entities/wavemanager.c:44: if(contarEnemigos() == 0)
   65FE CD 4E 8E      [17]  235 	call	_contarEnemigos
   6601 7D            [ 4]  236 	ld	a,l
   6602 B7            [ 4]  237 	or	a, a
   6603 20 03         [12]  238 	jr	NZ,00102$
                            239 ;src/entities/wavemanager.c:45: respawnearEnemigoPorBorde();
   6605 CD 1A 66      [17]  240 	call	_respawnearEnemigoPorBorde
   6608                     241 00102$:
                            242 ;src/entities/wavemanager.c:46: s_samemap = 0;
   6608 21 00 00      [10]  243 	ld	hl,#0x0000
   660B 22 0E 86      [16]  244 	ld	(_s_samemap),hl
   660E                     245 00104$:
                            246 ;src/entities/wavemanager.c:48: seed++;
   660E 21 12 86      [10]  247 	ld	hl, #_seed+0
   6611 34            [11]  248 	inc	(hl)
                            249 ;src/entities/wavemanager.c:50: seed = 1;
   6612 C9            [10]  250 	ret
                            251 ;src/entities/wavemanager.c:52: void resetearTimepoEnMapa(){
                            252 ;	---------------------------------
                            253 ; Function resetearTimepoEnMapa
                            254 ; ---------------------------------
   6613                     255 _resetearTimepoEnMapa::
                            256 ;src/entities/wavemanager.c:53: s_samemap = 0;
   6613 21 00 00      [10]  257 	ld	hl,#0x0000
   6616 22 0E 86      [16]  258 	ld	(_s_samemap),hl
   6619 C9            [10]  259 	ret
                            260 ;src/entities/wavemanager.c:57: void respawnearEnemigoPorBorde(){
                            261 ;	---------------------------------
                            262 ; Function respawnearEnemigoPorBorde
                            263 ; ---------------------------------
   661A                     264 _respawnearEnemigoPorBorde::
                            265 ;src/entities/wavemanager.c:61: random_number = getRandomUniform(seed)%3;
   661A 3A 12 86      [13]  266 	ld	a,(_seed)
   661D F5            [11]  267 	push	af
   661E 33            [ 6]  268 	inc	sp
   661F CD 93 6A      [17]  269 	call	_getRandomUniform
   6622 33            [ 6]  270 	inc	sp
   6623 45            [ 4]  271 	ld	b,l
   6624 3E 03         [ 7]  272 	ld	a,#0x03
   6626 F5            [11]  273 	push	af
   6627 33            [ 6]  274 	inc	sp
   6628 C5            [11]  275 	push	bc
   6629 33            [ 6]  276 	inc	sp
   662A CD EF 6E      [17]  277 	call	__moduchar
                            278 ;src/entities/wavemanager.c:62: enemies = getEnemies();
   662D E3            [19]  279 	ex	(sp),hl
   662E CD D1 98      [17]  280 	call	_getEnemies
   6631 4D            [ 4]  281 	ld	c,l
   6632 44            [ 4]  282 	ld	b,h
   6633 E1            [10]  283 	pop	hl
                            284 ;src/entities/wavemanager.c:67: posicionAleatoriaBorde(&enemies[random_number]);
   6634 5D            [ 4]  285 	ld	e,l
   6635 16 00         [ 7]  286 	ld	d,#0x00
   6637 6B            [ 4]  287 	ld	l, e
   6638 62            [ 4]  288 	ld	h, d
   6639 29            [11]  289 	add	hl, hl
   663A 29            [11]  290 	add	hl, hl
   663B 29            [11]  291 	add	hl, hl
   663C 19            [11]  292 	add	hl, de
   663D 29            [11]  293 	add	hl, hl
   663E 19            [11]  294 	add	hl, de
   663F 29            [11]  295 	add	hl, hl
   6640 19            [11]  296 	add	hl, de
   6641 29            [11]  297 	add	hl, hl
   6642 09            [11]  298 	add	hl,bc
   6643 E5            [11]  299 	push	hl
   6644 CD 49 66      [17]  300 	call	_posicionAleatoriaBorde
   6647 F1            [10]  301 	pop	af
   6648 C9            [10]  302 	ret
                            303 ;src/entities/wavemanager.c:74: void posicionAleatoriaBorde(TEnemy* enemy){
                            304 ;	---------------------------------
                            305 ; Function posicionAleatoriaBorde
                            306 ; ---------------------------------
   6649                     307 _posicionAleatoriaBorde::
   6649 DD E5         [15]  308 	push	ix
   664B DD 21 00 00   [14]  309 	ld	ix,#0
   664F DD 39         [15]  310 	add	ix,sp
   6651 F5            [11]  311 	push	af
   6652 F5            [11]  312 	push	af
                            313 ;src/entities/wavemanager.c:78: switch(mapaActual){
   6653 3E 05         [ 7]  314 	ld	a,#0x05
   6655 FD 21 03 86   [14]  315 	ld	iy,#_mapaActual
   6659 FD 96 00      [19]  316 	sub	a, 0 (iy)
   665C DA 15 6A      [10]  317 	jp	C,00128$
                            318 ;src/entities/wavemanager.c:97: revivirEnemigo(enemy, ANCHO - enemy->ent.sw, getRandomUniform(seed)%141 + 50, d_left);	
   665F DD 7E 04      [19]  319 	ld	a,4 (ix)
   6662 DD 77 FE      [19]  320 	ld	-2 (ix),a
   6665 DD 7E 05      [19]  321 	ld	a,5 (ix)
   6668 DD 77 FF      [19]  322 	ld	-1 (ix),a
   666B DD 7E FE      [19]  323 	ld	a,-2 (ix)
   666E C6 39         [ 7]  324 	add	a, #0x39
   6670 DD 77 FC      [19]  325 	ld	-4 (ix),a
   6673 DD 7E FF      [19]  326 	ld	a,-1 (ix)
   6676 CE 00         [ 7]  327 	adc	a, #0x00
   6678 DD 77 FD      [19]  328 	ld	-3 (ix),a
                            329 ;src/entities/wavemanager.c:99: revivirEnemigo(enemy, getRandomUniform(seed)%70 + 5, ALTO - enemy->ent.sh, d_up);
   667B DD 7E FE      [19]  330 	ld	a,-2 (ix)
   667E C6 3A         [ 7]  331 	add	a, #0x3A
   6680 4F            [ 4]  332 	ld	c,a
   6681 DD 7E FF      [19]  333 	ld	a,-1 (ix)
   6684 CE 00         [ 7]  334 	adc	a, #0x00
   6686 47            [ 4]  335 	ld	b,a
                            336 ;src/entities/wavemanager.c:78: switch(mapaActual){
   6687 FD 21 03 86   [14]  337 	ld	iy,#_mapaActual
   668B FD 5E 00      [19]  338 	ld	e,0 (iy)
   668E 16 00         [ 7]  339 	ld	d,#0x00
   6690 21 97 66      [10]  340 	ld	hl,#00163$
   6693 19            [11]  341 	add	hl,de
   6694 19            [11]  342 	add	hl,de
   6695 19            [11]  343 	add	hl,de
   6696 E9            [ 4]  344 	jp	(hl)
   6697                     345 00163$:
   6697 C3 15 6A      [10]  346 	jp	00128$
   669A C3 AC 66      [10]  347 	jp	00102$
   669D C3 31 67      [10]  348 	jp	00106$
   66A0 C3 14 68      [10]  349 	jp	00113$
   66A3 C3 ED 68      [10]  350 	jp	00120$
   66A6 C3 88 69      [10]  351 	jp	00124$
                            352 ;src/entities/wavemanager.c:80: case 0:													//Reaparece por arriba
                            353 ;src/entities/wavemanager.c:83: break;
   66A9 C3 15 6A      [10]  354 	jp	00128$
                            355 ;src/entities/wavemanager.c:84: case 1:
   66AC                     356 00102$:
                            357 ;src/entities/wavemanager.c:85: random_number = getRandomUniform(seed)%2;											//Aleatorio 0 o 1
   66AC 3A 12 86      [13]  358 	ld	a,(_seed)
   66AF F5            [11]  359 	push	af
   66B0 33            [ 6]  360 	inc	sp
   66B1 CD 93 6A      [17]  361 	call	_getRandomUniform
   66B4 33            [ 6]  362 	inc	sp
   66B5 7D            [ 4]  363 	ld	a,l
   66B6 E6 01         [ 7]  364 	and	a, #0x01
   66B8 4F            [ 4]  365 	ld	c,a
   66B9 06 00         [ 7]  366 	ld	b,#0x00
                            367 ;src/entities/wavemanager.c:86: if(random_number == 1){														//Reaparece por arriba
   66BB 0D            [ 4]  368 	dec	c
   66BC 20 3B         [12]  369 	jr	NZ,00104$
   66BE 78            [ 4]  370 	ld	a,b
   66BF B7            [ 4]  371 	or	a, a
   66C0 20 37         [12]  372 	jr	NZ,00104$
                            373 ;src/entities/wavemanager.c:87: revivirEnemigo(enemy, getRandomUniform(seed)%70 + 5, ORIGEN_MAPA_Y, d_down);
   66C2 3A 12 86      [13]  374 	ld	a,(_seed)
   66C5 F5            [11]  375 	push	af
   66C6 33            [ 6]  376 	inc	sp
   66C7 CD 93 6A      [17]  377 	call	_getRandomUniform
   66CA 33            [ 6]  378 	inc	sp
   66CB 45            [ 4]  379 	ld	b,l
   66CC 3E 46         [ 7]  380 	ld	a,#0x46
   66CE F5            [11]  381 	push	af
   66CF 33            [ 6]  382 	inc	sp
   66D0 C5            [11]  383 	push	bc
   66D1 33            [ 6]  384 	inc	sp
   66D2 CD EF 6E      [17]  385 	call	__moduchar
   66D5 F1            [10]  386 	pop	af
   66D6 4D            [ 4]  387 	ld	c,l
   66D7 06 00         [ 7]  388 	ld	b,#0x00
   66D9 03            [ 6]  389 	inc	bc
   66DA 03            [ 6]  390 	inc	bc
   66DB 03            [ 6]  391 	inc	bc
   66DC 03            [ 6]  392 	inc	bc
   66DD 03            [ 6]  393 	inc	bc
   66DE 3E 02         [ 7]  394 	ld	a,#0x02
   66E0 F5            [11]  395 	push	af
   66E1 33            [ 6]  396 	inc	sp
   66E2 21 28 00      [10]  397 	ld	hl,#0x0028
   66E5 E5            [11]  398 	push	hl
   66E6 C5            [11]  399 	push	bc
   66E7 DD 6E 04      [19]  400 	ld	l,4 (ix)
   66EA DD 66 05      [19]  401 	ld	h,5 (ix)
   66ED E5            [11]  402 	push	hl
   66EE CD 1E 6A      [17]  403 	call	_revivirEnemigo
   66F1 21 07 00      [10]  404 	ld	hl,#7
   66F4 39            [11]  405 	add	hl,sp
   66F5 F9            [ 6]  406 	ld	sp,hl
   66F6 C3 15 6A      [10]  407 	jp	00128$
   66F9                     408 00104$:
                            409 ;src/entities/wavemanager.c:89: revivirEnemigo(enemy, 0, getRandomUniform(seed)%141 + 50, d_right);	
   66F9 3A 12 86      [13]  410 	ld	a,(_seed)
   66FC F5            [11]  411 	push	af
   66FD 33            [ 6]  412 	inc	sp
   66FE CD 93 6A      [17]  413 	call	_getRandomUniform
   6701 33            [ 6]  414 	inc	sp
   6702 45            [ 4]  415 	ld	b,l
   6703 3E 8D         [ 7]  416 	ld	a,#0x8D
   6705 F5            [11]  417 	push	af
   6706 33            [ 6]  418 	inc	sp
   6707 C5            [11]  419 	push	bc
   6708 33            [ 6]  420 	inc	sp
   6709 CD EF 6E      [17]  421 	call	__moduchar
   670C F1            [10]  422 	pop	af
   670D 4D            [ 4]  423 	ld	c,l
   670E 06 00         [ 7]  424 	ld	b,#0x00
   6710 21 32 00      [10]  425 	ld	hl,#0x0032
   6713 09            [11]  426 	add	hl,bc
   6714 4D            [ 4]  427 	ld	c,l
   6715 44            [ 4]  428 	ld	b,h
   6716 3E 01         [ 7]  429 	ld	a,#0x01
   6718 F5            [11]  430 	push	af
   6719 33            [ 6]  431 	inc	sp
   671A C5            [11]  432 	push	bc
   671B 21 00 00      [10]  433 	ld	hl,#0x0000
   671E E5            [11]  434 	push	hl
   671F DD 6E 04      [19]  435 	ld	l,4 (ix)
   6722 DD 66 05      [19]  436 	ld	h,5 (ix)
   6725 E5            [11]  437 	push	hl
   6726 CD 1E 6A      [17]  438 	call	_revivirEnemigo
   6729 21 07 00      [10]  439 	ld	hl,#7
   672C 39            [11]  440 	add	hl,sp
   672D F9            [ 6]  441 	ld	sp,hl
                            442 ;src/entities/wavemanager.c:91: break;
   672E C3 15 6A      [10]  443 	jp	00128$
                            444 ;src/entities/wavemanager.c:92: case 2:
   6731                     445 00106$:
                            446 ;src/entities/wavemanager.c:93: random_number = getRandomUniform(seed)%3 + 1;											//Aleatorio 0 o 1
   6731 C5            [11]  447 	push	bc
   6732 3A 12 86      [13]  448 	ld	a,(_seed)
   6735 F5            [11]  449 	push	af
   6736 33            [ 6]  450 	inc	sp
   6737 CD 93 6A      [17]  451 	call	_getRandomUniform
   673A 33            [ 6]  452 	inc	sp
   673B 55            [ 4]  453 	ld	d,l
   673C 3E 03         [ 7]  454 	ld	a,#0x03
   673E F5            [11]  455 	push	af
   673F 33            [ 6]  456 	inc	sp
   6740 D5            [11]  457 	push	de
   6741 33            [ 6]  458 	inc	sp
   6742 CD EF 6E      [17]  459 	call	__moduchar
   6745 F1            [10]  460 	pop	af
   6746 C1            [10]  461 	pop	bc
   6747 26 00         [ 7]  462 	ld	h,#0x00
   6749 23            [ 6]  463 	inc	hl
                            464 ;src/entities/wavemanager.c:94: if(random_number == 1){																				//Reaparece por arriba
   674A 7D            [ 4]  465 	ld	a,l
   674B 3D            [ 4]  466 	dec	a
   674C 20 3B         [12]  467 	jr	NZ,00111$
   674E 7C            [ 4]  468 	ld	a,h
   674F B7            [ 4]  469 	or	a, a
   6750 20 37         [12]  470 	jr	NZ,00111$
                            471 ;src/entities/wavemanager.c:95: revivirEnemigo(enemy, getRandomUniform(seed)%70 + 5, ORIGEN_MAPA_Y, d_down);
   6752 3A 12 86      [13]  472 	ld	a,(_seed)
   6755 F5            [11]  473 	push	af
   6756 33            [ 6]  474 	inc	sp
   6757 CD 93 6A      [17]  475 	call	_getRandomUniform
   675A 33            [ 6]  476 	inc	sp
   675B 45            [ 4]  477 	ld	b,l
   675C 3E 46         [ 7]  478 	ld	a,#0x46
   675E F5            [11]  479 	push	af
   675F 33            [ 6]  480 	inc	sp
   6760 C5            [11]  481 	push	bc
   6761 33            [ 6]  482 	inc	sp
   6762 CD EF 6E      [17]  483 	call	__moduchar
   6765 F1            [10]  484 	pop	af
   6766 4D            [ 4]  485 	ld	c,l
   6767 06 00         [ 7]  486 	ld	b,#0x00
   6769 03            [ 6]  487 	inc	bc
   676A 03            [ 6]  488 	inc	bc
   676B 03            [ 6]  489 	inc	bc
   676C 03            [ 6]  490 	inc	bc
   676D 03            [ 6]  491 	inc	bc
   676E 3E 02         [ 7]  492 	ld	a,#0x02
   6770 F5            [11]  493 	push	af
   6771 33            [ 6]  494 	inc	sp
   6772 21 28 00      [10]  495 	ld	hl,#0x0028
   6775 E5            [11]  496 	push	hl
   6776 C5            [11]  497 	push	bc
   6777 DD 6E 04      [19]  498 	ld	l,4 (ix)
   677A DD 66 05      [19]  499 	ld	h,5 (ix)
   677D E5            [11]  500 	push	hl
   677E CD 1E 6A      [17]  501 	call	_revivirEnemigo
   6781 21 07 00      [10]  502 	ld	hl,#7
   6784 39            [11]  503 	add	hl,sp
   6785 F9            [ 6]  504 	ld	sp,hl
   6786 C3 15 6A      [10]  505 	jp	00128$
   6789                     506 00111$:
                            507 ;src/entities/wavemanager.c:96: }else if(random_number == 2){																		//Reaparece por derecha
   6789 7D            [ 4]  508 	ld	a,l
   678A D6 02         [ 7]  509 	sub	a,#0x02
   678C 20 45         [12]  510 	jr	NZ,00108$
   678E B4            [ 4]  511 	or	a,h
   678F 20 42         [12]  512 	jr	NZ,00108$
                            513 ;src/entities/wavemanager.c:97: revivirEnemigo(enemy, ANCHO - enemy->ent.sw, getRandomUniform(seed)%141 + 50, d_left);	
   6791 3A 12 86      [13]  514 	ld	a,(_seed)
   6794 F5            [11]  515 	push	af
   6795 33            [ 6]  516 	inc	sp
   6796 CD 93 6A      [17]  517 	call	_getRandomUniform
   6799 33            [ 6]  518 	inc	sp
   679A 45            [ 4]  519 	ld	b,l
   679B 3E 8D         [ 7]  520 	ld	a,#0x8D
   679D F5            [11]  521 	push	af
   679E 33            [ 6]  522 	inc	sp
   679F C5            [11]  523 	push	bc
   67A0 33            [ 6]  524 	inc	sp
   67A1 CD EF 6E      [17]  525 	call	__moduchar
   67A4 F1            [10]  526 	pop	af
   67A5 4D            [ 4]  527 	ld	c,l
   67A6 06 00         [ 7]  528 	ld	b,#0x00
   67A8 21 32 00      [10]  529 	ld	hl,#0x0032
   67AB 09            [11]  530 	add	hl,bc
   67AC 4D            [ 4]  531 	ld	c,l
   67AD 44            [ 4]  532 	ld	b,h
   67AE E1            [10]  533 	pop	hl
   67AF E5            [11]  534 	push	hl
   67B0 5E            [ 7]  535 	ld	e,(hl)
   67B1 16 00         [ 7]  536 	ld	d,#0x00
   67B3 3E 50         [ 7]  537 	ld	a,#0x50
   67B5 93            [ 4]  538 	sub	a, e
   67B6 5F            [ 4]  539 	ld	e,a
   67B7 3E 00         [ 7]  540 	ld	a,#0x00
   67B9 9A            [ 4]  541 	sbc	a, d
   67BA 57            [ 4]  542 	ld	d,a
   67BB 3E 03         [ 7]  543 	ld	a,#0x03
   67BD F5            [11]  544 	push	af
   67BE 33            [ 6]  545 	inc	sp
   67BF C5            [11]  546 	push	bc
   67C0 D5            [11]  547 	push	de
   67C1 DD 6E FE      [19]  548 	ld	l,-2 (ix)
   67C4 DD 66 FF      [19]  549 	ld	h,-1 (ix)
   67C7 E5            [11]  550 	push	hl
   67C8 CD 1E 6A      [17]  551 	call	_revivirEnemigo
   67CB 21 07 00      [10]  552 	ld	hl,#7
   67CE 39            [11]  553 	add	hl,sp
   67CF F9            [ 6]  554 	ld	sp,hl
   67D0 C3 15 6A      [10]  555 	jp	00128$
   67D3                     556 00108$:
                            557 ;src/entities/wavemanager.c:99: revivirEnemigo(enemy, getRandomUniform(seed)%70 + 5, ALTO - enemy->ent.sh, d_up);
   67D3 0A            [ 7]  558 	ld	a,(bc)
   67D4 4F            [ 4]  559 	ld	c,a
   67D5 06 00         [ 7]  560 	ld	b,#0x00
   67D7 3E C8         [ 7]  561 	ld	a,#0xC8
   67D9 91            [ 4]  562 	sub	a, c
   67DA 4F            [ 4]  563 	ld	c,a
   67DB 3E 00         [ 7]  564 	ld	a,#0x00
   67DD 98            [ 4]  565 	sbc	a, b
   67DE 47            [ 4]  566 	ld	b,a
   67DF C5            [11]  567 	push	bc
   67E0 3A 12 86      [13]  568 	ld	a,(_seed)
   67E3 F5            [11]  569 	push	af
   67E4 33            [ 6]  570 	inc	sp
   67E5 CD 93 6A      [17]  571 	call	_getRandomUniform
   67E8 33            [ 6]  572 	inc	sp
   67E9 55            [ 4]  573 	ld	d,l
   67EA 3E 46         [ 7]  574 	ld	a,#0x46
   67EC F5            [11]  575 	push	af
   67ED 33            [ 6]  576 	inc	sp
   67EE D5            [11]  577 	push	de
   67EF 33            [ 6]  578 	inc	sp
   67F0 CD EF 6E      [17]  579 	call	__moduchar
   67F3 F1            [10]  580 	pop	af
   67F4 5D            [ 4]  581 	ld	e,l
   67F5 C1            [10]  582 	pop	bc
   67F6 16 00         [ 7]  583 	ld	d,#0x00
   67F8 13            [ 6]  584 	inc	de
   67F9 13            [ 6]  585 	inc	de
   67FA 13            [ 6]  586 	inc	de
   67FB 13            [ 6]  587 	inc	de
   67FC 13            [ 6]  588 	inc	de
   67FD AF            [ 4]  589 	xor	a, a
   67FE F5            [11]  590 	push	af
   67FF 33            [ 6]  591 	inc	sp
   6800 C5            [11]  592 	push	bc
   6801 D5            [11]  593 	push	de
   6802 DD 6E FE      [19]  594 	ld	l,-2 (ix)
   6805 DD 66 FF      [19]  595 	ld	h,-1 (ix)
   6808 E5            [11]  596 	push	hl
   6809 CD 1E 6A      [17]  597 	call	_revivirEnemigo
   680C 21 07 00      [10]  598 	ld	hl,#7
   680F 39            [11]  599 	add	hl,sp
   6810 F9            [ 6]  600 	ld	sp,hl
                            601 ;src/entities/wavemanager.c:101: break;
   6811 C3 15 6A      [10]  602 	jp	00128$
                            603 ;src/entities/wavemanager.c:102: case 3:
   6814                     604 00113$:
                            605 ;src/entities/wavemanager.c:103: random_number = getRandomUniform(seed)%3 + 1;											//Aleatorio 0 o 1
   6814 C5            [11]  606 	push	bc
   6815 3A 12 86      [13]  607 	ld	a,(_seed)
   6818 F5            [11]  608 	push	af
   6819 33            [ 6]  609 	inc	sp
   681A CD 93 6A      [17]  610 	call	_getRandomUniform
   681D 33            [ 6]  611 	inc	sp
   681E 55            [ 4]  612 	ld	d,l
   681F 3E 03         [ 7]  613 	ld	a,#0x03
   6821 F5            [11]  614 	push	af
   6822 33            [ 6]  615 	inc	sp
   6823 D5            [11]  616 	push	de
   6824 33            [ 6]  617 	inc	sp
   6825 CD EF 6E      [17]  618 	call	__moduchar
   6828 F1            [10]  619 	pop	af
   6829 C1            [10]  620 	pop	bc
   682A 26 00         [ 7]  621 	ld	h,#0x00
   682C 23            [ 6]  622 	inc	hl
                            623 ;src/entities/wavemanager.c:104: if(random_number == 1){																				//Reaparece por arriba
   682D 7D            [ 4]  624 	ld	a,l
   682E 3D            [ 4]  625 	dec	a
   682F 20 3B         [12]  626 	jr	NZ,00118$
   6831 7C            [ 4]  627 	ld	a,h
   6832 B7            [ 4]  628 	or	a, a
   6833 20 37         [12]  629 	jr	NZ,00118$
                            630 ;src/entities/wavemanager.c:105: revivirEnemigo(enemy, getRandomUniform(seed)%70 + 5, ORIGEN_MAPA_Y, d_down);
   6835 3A 12 86      [13]  631 	ld	a,(_seed)
   6838 F5            [11]  632 	push	af
   6839 33            [ 6]  633 	inc	sp
   683A CD 93 6A      [17]  634 	call	_getRandomUniform
   683D 33            [ 6]  635 	inc	sp
   683E 45            [ 4]  636 	ld	b,l
   683F 3E 46         [ 7]  637 	ld	a,#0x46
   6841 F5            [11]  638 	push	af
   6842 33            [ 6]  639 	inc	sp
   6843 C5            [11]  640 	push	bc
   6844 33            [ 6]  641 	inc	sp
   6845 CD EF 6E      [17]  642 	call	__moduchar
   6848 F1            [10]  643 	pop	af
   6849 4D            [ 4]  644 	ld	c,l
   684A 06 00         [ 7]  645 	ld	b,#0x00
   684C 03            [ 6]  646 	inc	bc
   684D 03            [ 6]  647 	inc	bc
   684E 03            [ 6]  648 	inc	bc
   684F 03            [ 6]  649 	inc	bc
   6850 03            [ 6]  650 	inc	bc
   6851 3E 02         [ 7]  651 	ld	a,#0x02
   6853 F5            [11]  652 	push	af
   6854 33            [ 6]  653 	inc	sp
   6855 21 28 00      [10]  654 	ld	hl,#0x0028
   6858 E5            [11]  655 	push	hl
   6859 C5            [11]  656 	push	bc
   685A DD 6E 04      [19]  657 	ld	l,4 (ix)
   685D DD 66 05      [19]  658 	ld	h,5 (ix)
   6860 E5            [11]  659 	push	hl
   6861 CD 1E 6A      [17]  660 	call	_revivirEnemigo
   6864 21 07 00      [10]  661 	ld	hl,#7
   6867 39            [11]  662 	add	hl,sp
   6868 F9            [ 6]  663 	ld	sp,hl
   6869 C3 15 6A      [10]  664 	jp	00128$
   686C                     665 00118$:
                            666 ;src/entities/wavemanager.c:106: }else if(random_number == 2){																		//Reaparece por izquierda
   686C 7D            [ 4]  667 	ld	a,l
   686D D6 02         [ 7]  668 	sub	a,#0x02
   686F 20 3B         [12]  669 	jr	NZ,00115$
   6871 B4            [ 4]  670 	or	a,h
   6872 20 38         [12]  671 	jr	NZ,00115$
                            672 ;src/entities/wavemanager.c:107: revivirEnemigo(enemy, 0, getRandomUniform(seed)%141 + 50, d_right);		
   6874 3A 12 86      [13]  673 	ld	a,(_seed)
   6877 F5            [11]  674 	push	af
   6878 33            [ 6]  675 	inc	sp
   6879 CD 93 6A      [17]  676 	call	_getRandomUniform
   687C 33            [ 6]  677 	inc	sp
   687D 45            [ 4]  678 	ld	b,l
   687E 3E 8D         [ 7]  679 	ld	a,#0x8D
   6880 F5            [11]  680 	push	af
   6881 33            [ 6]  681 	inc	sp
   6882 C5            [11]  682 	push	bc
   6883 33            [ 6]  683 	inc	sp
   6884 CD EF 6E      [17]  684 	call	__moduchar
   6887 F1            [10]  685 	pop	af
   6888 4D            [ 4]  686 	ld	c,l
   6889 06 00         [ 7]  687 	ld	b,#0x00
   688B 21 32 00      [10]  688 	ld	hl,#0x0032
   688E 09            [11]  689 	add	hl,bc
   688F 4D            [ 4]  690 	ld	c,l
   6890 44            [ 4]  691 	ld	b,h
   6891 3E 01         [ 7]  692 	ld	a,#0x01
   6893 F5            [11]  693 	push	af
   6894 33            [ 6]  694 	inc	sp
   6895 C5            [11]  695 	push	bc
   6896 21 00 00      [10]  696 	ld	hl,#0x0000
   6899 E5            [11]  697 	push	hl
   689A DD 6E 04      [19]  698 	ld	l,4 (ix)
   689D DD 66 05      [19]  699 	ld	h,5 (ix)
   68A0 E5            [11]  700 	push	hl
   68A1 CD 1E 6A      [17]  701 	call	_revivirEnemigo
   68A4 21 07 00      [10]  702 	ld	hl,#7
   68A7 39            [11]  703 	add	hl,sp
   68A8 F9            [ 6]  704 	ld	sp,hl
   68A9 C3 15 6A      [10]  705 	jp	00128$
   68AC                     706 00115$:
                            707 ;src/entities/wavemanager.c:109: revivirEnemigo(enemy, getRandomUniform(seed)%70 + 5, ALTO - enemy->ent.sh, d_up);
   68AC 0A            [ 7]  708 	ld	a,(bc)
   68AD 4F            [ 4]  709 	ld	c,a
   68AE 06 00         [ 7]  710 	ld	b,#0x00
   68B0 3E C8         [ 7]  711 	ld	a,#0xC8
   68B2 91            [ 4]  712 	sub	a, c
   68B3 4F            [ 4]  713 	ld	c,a
   68B4 3E 00         [ 7]  714 	ld	a,#0x00
   68B6 98            [ 4]  715 	sbc	a, b
   68B7 47            [ 4]  716 	ld	b,a
   68B8 C5            [11]  717 	push	bc
   68B9 3A 12 86      [13]  718 	ld	a,(_seed)
   68BC F5            [11]  719 	push	af
   68BD 33            [ 6]  720 	inc	sp
   68BE CD 93 6A      [17]  721 	call	_getRandomUniform
   68C1 33            [ 6]  722 	inc	sp
   68C2 55            [ 4]  723 	ld	d,l
   68C3 3E 46         [ 7]  724 	ld	a,#0x46
   68C5 F5            [11]  725 	push	af
   68C6 33            [ 6]  726 	inc	sp
   68C7 D5            [11]  727 	push	de
   68C8 33            [ 6]  728 	inc	sp
   68C9 CD EF 6E      [17]  729 	call	__moduchar
   68CC F1            [10]  730 	pop	af
   68CD 5D            [ 4]  731 	ld	e,l
   68CE C1            [10]  732 	pop	bc
   68CF 16 00         [ 7]  733 	ld	d,#0x00
   68D1 13            [ 6]  734 	inc	de
   68D2 13            [ 6]  735 	inc	de
   68D3 13            [ 6]  736 	inc	de
   68D4 13            [ 6]  737 	inc	de
   68D5 13            [ 6]  738 	inc	de
   68D6 AF            [ 4]  739 	xor	a, a
   68D7 F5            [11]  740 	push	af
   68D8 33            [ 6]  741 	inc	sp
   68D9 C5            [11]  742 	push	bc
   68DA D5            [11]  743 	push	de
   68DB DD 6E FE      [19]  744 	ld	l,-2 (ix)
   68DE DD 66 FF      [19]  745 	ld	h,-1 (ix)
   68E1 E5            [11]  746 	push	hl
   68E2 CD 1E 6A      [17]  747 	call	_revivirEnemigo
   68E5 21 07 00      [10]  748 	ld	hl,#7
   68E8 39            [11]  749 	add	hl,sp
   68E9 F9            [ 6]  750 	ld	sp,hl
                            751 ;src/entities/wavemanager.c:111: break;
   68EA C3 15 6A      [10]  752 	jp	00128$
                            753 ;src/entities/wavemanager.c:112: case 4:
   68ED                     754 00120$:
                            755 ;src/entities/wavemanager.c:113: random_number = getRandomUniform(seed)%2;											//Aleatorio 0 o 1
   68ED C5            [11]  756 	push	bc
   68EE 3A 12 86      [13]  757 	ld	a,(_seed)
   68F1 F5            [11]  758 	push	af
   68F2 33            [ 6]  759 	inc	sp
   68F3 CD 93 6A      [17]  760 	call	_getRandomUniform
   68F6 33            [ 6]  761 	inc	sp
   68F7 C1            [10]  762 	pop	bc
   68F8 7D            [ 4]  763 	ld	a,l
   68F9 E6 01         [ 7]  764 	and	a, #0x01
   68FB 5F            [ 4]  765 	ld	e,a
   68FC 16 00         [ 7]  766 	ld	d,#0x00
                            767 ;src/entities/wavemanager.c:114: if(random_number == 1){														//Reaparece por abajo
   68FE 1D            [ 4]  768 	dec	e
   68FF 20 45         [12]  769 	jr	NZ,00122$
   6901 7A            [ 4]  770 	ld	a,d
   6902 B7            [ 4]  771 	or	a, a
   6903 20 41         [12]  772 	jr	NZ,00122$
                            773 ;src/entities/wavemanager.c:115: revivirEnemigo(enemy, getRandomUniform(seed)%70 + 5, ALTO - enemy->ent.sh, d_up);
   6905 0A            [ 7]  774 	ld	a,(bc)
   6906 4F            [ 4]  775 	ld	c,a
   6907 06 00         [ 7]  776 	ld	b,#0x00
   6909 3E C8         [ 7]  777 	ld	a,#0xC8
   690B 91            [ 4]  778 	sub	a, c
   690C 4F            [ 4]  779 	ld	c,a
   690D 3E 00         [ 7]  780 	ld	a,#0x00
   690F 98            [ 4]  781 	sbc	a, b
   6910 47            [ 4]  782 	ld	b,a
   6911 C5            [11]  783 	push	bc
   6912 3A 12 86      [13]  784 	ld	a,(_seed)
   6915 F5            [11]  785 	push	af
   6916 33            [ 6]  786 	inc	sp
   6917 CD 93 6A      [17]  787 	call	_getRandomUniform
   691A 33            [ 6]  788 	inc	sp
   691B 55            [ 4]  789 	ld	d,l
   691C 3E 46         [ 7]  790 	ld	a,#0x46
   691E F5            [11]  791 	push	af
   691F 33            [ 6]  792 	inc	sp
   6920 D5            [11]  793 	push	de
   6921 33            [ 6]  794 	inc	sp
   6922 CD EF 6E      [17]  795 	call	__moduchar
   6925 F1            [10]  796 	pop	af
   6926 5D            [ 4]  797 	ld	e,l
   6927 C1            [10]  798 	pop	bc
   6928 16 00         [ 7]  799 	ld	d,#0x00
   692A 13            [ 6]  800 	inc	de
   692B 13            [ 6]  801 	inc	de
   692C 13            [ 6]  802 	inc	de
   692D 13            [ 6]  803 	inc	de
   692E 13            [ 6]  804 	inc	de
   692F AF            [ 4]  805 	xor	a, a
   6930 F5            [11]  806 	push	af
   6931 33            [ 6]  807 	inc	sp
   6932 C5            [11]  808 	push	bc
   6933 D5            [11]  809 	push	de
   6934 DD 6E FE      [19]  810 	ld	l,-2 (ix)
   6937 DD 66 FF      [19]  811 	ld	h,-1 (ix)
   693A E5            [11]  812 	push	hl
   693B CD 1E 6A      [17]  813 	call	_revivirEnemigo
   693E 21 07 00      [10]  814 	ld	hl,#7
   6941 39            [11]  815 	add	hl,sp
   6942 F9            [ 6]  816 	ld	sp,hl
   6943 C3 15 6A      [10]  817 	jp	00128$
   6946                     818 00122$:
                            819 ;src/entities/wavemanager.c:117: revivirEnemigo(enemy, ANCHO - enemy->ent.sw, getRandomUniform(seed)%141 + 50, d_left);	
   6946 3A 12 86      [13]  820 	ld	a,(_seed)
   6949 F5            [11]  821 	push	af
   694A 33            [ 6]  822 	inc	sp
   694B CD 93 6A      [17]  823 	call	_getRandomUniform
   694E 33            [ 6]  824 	inc	sp
   694F 45            [ 4]  825 	ld	b,l
   6950 3E 8D         [ 7]  826 	ld	a,#0x8D
   6952 F5            [11]  827 	push	af
   6953 33            [ 6]  828 	inc	sp
   6954 C5            [11]  829 	push	bc
   6955 33            [ 6]  830 	inc	sp
   6956 CD EF 6E      [17]  831 	call	__moduchar
   6959 F1            [10]  832 	pop	af
   695A 4D            [ 4]  833 	ld	c,l
   695B 06 00         [ 7]  834 	ld	b,#0x00
   695D 21 32 00      [10]  835 	ld	hl,#0x0032
   6960 09            [11]  836 	add	hl,bc
   6961 4D            [ 4]  837 	ld	c,l
   6962 44            [ 4]  838 	ld	b,h
   6963 E1            [10]  839 	pop	hl
   6964 E5            [11]  840 	push	hl
   6965 5E            [ 7]  841 	ld	e,(hl)
   6966 16 00         [ 7]  842 	ld	d,#0x00
   6968 3E 50         [ 7]  843 	ld	a,#0x50
   696A 93            [ 4]  844 	sub	a, e
   696B 5F            [ 4]  845 	ld	e,a
   696C 3E 00         [ 7]  846 	ld	a,#0x00
   696E 9A            [ 4]  847 	sbc	a, d
   696F 57            [ 4]  848 	ld	d,a
   6970 3E 03         [ 7]  849 	ld	a,#0x03
   6972 F5            [11]  850 	push	af
   6973 33            [ 6]  851 	inc	sp
   6974 C5            [11]  852 	push	bc
   6975 D5            [11]  853 	push	de
   6976 DD 6E FE      [19]  854 	ld	l,-2 (ix)
   6979 DD 66 FF      [19]  855 	ld	h,-1 (ix)
   697C E5            [11]  856 	push	hl
   697D CD 1E 6A      [17]  857 	call	_revivirEnemigo
   6980 21 07 00      [10]  858 	ld	hl,#7
   6983 39            [11]  859 	add	hl,sp
   6984 F9            [ 6]  860 	ld	sp,hl
                            861 ;src/entities/wavemanager.c:119: break;
   6985 C3 15 6A      [10]  862 	jp	00128$
                            863 ;src/entities/wavemanager.c:120: case 5:
   6988                     864 00124$:
                            865 ;src/entities/wavemanager.c:121: random_number = getRandomUniform(seed)%2;											//Aleatorio 0 o 1
   6988 C5            [11]  866 	push	bc
   6989 3A 12 86      [13]  867 	ld	a,(_seed)
   698C F5            [11]  868 	push	af
   698D 33            [ 6]  869 	inc	sp
   698E CD 93 6A      [17]  870 	call	_getRandomUniform
   6991 33            [ 6]  871 	inc	sp
   6992 C1            [10]  872 	pop	bc
   6993 7D            [ 4]  873 	ld	a,l
   6994 E6 01         [ 7]  874 	and	a, #0x01
   6996 5F            [ 4]  875 	ld	e,a
   6997 16 00         [ 7]  876 	ld	d,#0x00
                            877 ;src/entities/wavemanager.c:122: if(random_number == 1){														//Reaparece por izquierda
   6999 1D            [ 4]  878 	dec	e
   699A 20 3B         [12]  879 	jr	NZ,00126$
   699C 7A            [ 4]  880 	ld	a,d
   699D B7            [ 4]  881 	or	a, a
   699E 20 37         [12]  882 	jr	NZ,00126$
                            883 ;src/entities/wavemanager.c:123: revivirEnemigo(enemy, 0, getRandomUniform(seed)%141 + 50, d_right);	
   69A0 3A 12 86      [13]  884 	ld	a,(_seed)
   69A3 F5            [11]  885 	push	af
   69A4 33            [ 6]  886 	inc	sp
   69A5 CD 93 6A      [17]  887 	call	_getRandomUniform
   69A8 33            [ 6]  888 	inc	sp
   69A9 45            [ 4]  889 	ld	b,l
   69AA 3E 8D         [ 7]  890 	ld	a,#0x8D
   69AC F5            [11]  891 	push	af
   69AD 33            [ 6]  892 	inc	sp
   69AE C5            [11]  893 	push	bc
   69AF 33            [ 6]  894 	inc	sp
   69B0 CD EF 6E      [17]  895 	call	__moduchar
   69B3 F1            [10]  896 	pop	af
   69B4 4D            [ 4]  897 	ld	c,l
   69B5 06 00         [ 7]  898 	ld	b,#0x00
   69B7 21 32 00      [10]  899 	ld	hl,#0x0032
   69BA 09            [11]  900 	add	hl,bc
   69BB 4D            [ 4]  901 	ld	c,l
   69BC 44            [ 4]  902 	ld	b,h
   69BD 3E 01         [ 7]  903 	ld	a,#0x01
   69BF F5            [11]  904 	push	af
   69C0 33            [ 6]  905 	inc	sp
   69C1 C5            [11]  906 	push	bc
   69C2 21 00 00      [10]  907 	ld	hl,#0x0000
   69C5 E5            [11]  908 	push	hl
   69C6 DD 6E 04      [19]  909 	ld	l,4 (ix)
   69C9 DD 66 05      [19]  910 	ld	h,5 (ix)
   69CC E5            [11]  911 	push	hl
   69CD CD 1E 6A      [17]  912 	call	_revivirEnemigo
   69D0 21 07 00      [10]  913 	ld	hl,#7
   69D3 39            [11]  914 	add	hl,sp
   69D4 F9            [ 6]  915 	ld	sp,hl
   69D5 18 3E         [12]  916 	jr	00128$
   69D7                     917 00126$:
                            918 ;src/entities/wavemanager.c:125: revivirEnemigo(enemy, getRandomUniform(seed)%70 + 5, ALTO - enemy->ent.sh, d_up);	
   69D7 0A            [ 7]  919 	ld	a,(bc)
   69D8 4F            [ 4]  920 	ld	c,a
   69D9 06 00         [ 7]  921 	ld	b,#0x00
   69DB 3E C8         [ 7]  922 	ld	a,#0xC8
   69DD 91            [ 4]  923 	sub	a, c
   69DE 4F            [ 4]  924 	ld	c,a
   69DF 3E 00         [ 7]  925 	ld	a,#0x00
   69E1 98            [ 4]  926 	sbc	a, b
   69E2 47            [ 4]  927 	ld	b,a
   69E3 C5            [11]  928 	push	bc
   69E4 3A 12 86      [13]  929 	ld	a,(_seed)
   69E7 F5            [11]  930 	push	af
   69E8 33            [ 6]  931 	inc	sp
   69E9 CD 93 6A      [17]  932 	call	_getRandomUniform
   69EC 33            [ 6]  933 	inc	sp
   69ED 55            [ 4]  934 	ld	d,l
   69EE 3E 46         [ 7]  935 	ld	a,#0x46
   69F0 F5            [11]  936 	push	af
   69F1 33            [ 6]  937 	inc	sp
   69F2 D5            [11]  938 	push	de
   69F3 33            [ 6]  939 	inc	sp
   69F4 CD EF 6E      [17]  940 	call	__moduchar
   69F7 F1            [10]  941 	pop	af
   69F8 5D            [ 4]  942 	ld	e,l
   69F9 C1            [10]  943 	pop	bc
   69FA 16 00         [ 7]  944 	ld	d,#0x00
   69FC 13            [ 6]  945 	inc	de
   69FD 13            [ 6]  946 	inc	de
   69FE 13            [ 6]  947 	inc	de
   69FF 13            [ 6]  948 	inc	de
   6A00 13            [ 6]  949 	inc	de
   6A01 AF            [ 4]  950 	xor	a, a
   6A02 F5            [11]  951 	push	af
   6A03 33            [ 6]  952 	inc	sp
   6A04 C5            [11]  953 	push	bc
   6A05 D5            [11]  954 	push	de
   6A06 DD 6E FE      [19]  955 	ld	l,-2 (ix)
   6A09 DD 66 FF      [19]  956 	ld	h,-1 (ix)
   6A0C E5            [11]  957 	push	hl
   6A0D CD 1E 6A      [17]  958 	call	_revivirEnemigo
   6A10 21 07 00      [10]  959 	ld	hl,#7
   6A13 39            [11]  960 	add	hl,sp
   6A14 F9            [ 6]  961 	ld	sp,hl
                            962 ;src/entities/wavemanager.c:128: }
   6A15                     963 00128$:
                            964 ;src/entities/wavemanager.c:130: enemigos_actual++;
   6A15 21 13 86      [10]  965 	ld	hl, #_enemigos_actual+0
   6A18 34            [11]  966 	inc	(hl)
   6A19 DD F9         [10]  967 	ld	sp, ix
   6A1B DD E1         [14]  968 	pop	ix
   6A1D C9            [10]  969 	ret
                            970 ;src/entities/wavemanager.c:133: void revivirEnemigo(TEnemy* enemy, i16 x, i16 y, TPlayerDirection dir){
                            971 ;	---------------------------------
                            972 ; Function revivirEnemigo
                            973 ; ---------------------------------
   6A1E                     974 _revivirEnemigo::
   6A1E DD E5         [15]  975 	push	ix
   6A20 DD 21 00 00   [14]  976 	ld	ix,#0
   6A24 DD 39         [15]  977 	add	ix,sp
                            978 ;src/entities/wavemanager.c:134: enemy->ent.vivo = SI;
   6A26 DD 4E 04      [19]  979 	ld	c,4 (ix)
   6A29 DD 46 05      [19]  980 	ld	b,5 (ix)
   6A2C 21 26 00      [10]  981 	ld	hl,#0x0026
   6A2F 09            [11]  982 	add	hl,bc
   6A30 EB            [ 4]  983 	ex	de,hl
   6A31 21 41 00      [10]  984 	ld	hl,#0x0041
   6A34 09            [11]  985 	add	hl,bc
   6A35 36 01         [10]  986 	ld	(hl),#0x01
                            987 ;src/entities/wavemanager.c:135: enemy->ent.draw = SI;
   6A37 21 30 00      [10]  988 	ld	hl,#0x0030
   6A3A 09            [11]  989 	add	hl,bc
   6A3B 36 01         [10]  990 	ld	(hl),#0x01
                            991 ;src/entities/wavemanager.c:136: enemy->ent.x = x;
   6A3D DD 7E 06      [19]  992 	ld	a,6 (ix)
   6A40 12            [ 7]  993 	ld	(de),a
   6A41 13            [ 6]  994 	inc	de
   6A42 DD 7E 07      [19]  995 	ld	a,7 (ix)
   6A45 12            [ 7]  996 	ld	(de),a
                            997 ;src/entities/wavemanager.c:137: enemy->ent.y = y;
   6A46 21 28 00      [10]  998 	ld	hl,#0x0028
   6A49 09            [11]  999 	add	hl,bc
   6A4A DD 7E 08      [19] 1000 	ld	a,8 (ix)
   6A4D 77            [ 7] 1001 	ld	(hl),a
   6A4E 23            [ 6] 1002 	inc	hl
   6A4F DD 7E 09      [19] 1003 	ld	a,9 (ix)
   6A52 77            [ 7] 1004 	ld	(hl),a
                           1005 ;src/entities/wavemanager.c:138: enemy->ent.px = x;
   6A53 21 2A 00      [10] 1006 	ld	hl,#0x002A
   6A56 09            [11] 1007 	add	hl,bc
   6A57 DD 7E 06      [19] 1008 	ld	a,6 (ix)
   6A5A 77            [ 7] 1009 	ld	(hl),a
   6A5B 23            [ 6] 1010 	inc	hl
   6A5C DD 7E 07      [19] 1011 	ld	a,7 (ix)
   6A5F 77            [ 7] 1012 	ld	(hl),a
                           1013 ;src/entities/wavemanager.c:139: enemy->ent.py = y;
   6A60 21 2C 00      [10] 1014 	ld	hl,#0x002C
   6A63 09            [11] 1015 	add	hl,bc
   6A64 DD 7E 08      [19] 1016 	ld	a,8 (ix)
   6A67 77            [ 7] 1017 	ld	(hl),a
   6A68 23            [ 6] 1018 	inc	hl
   6A69 DD 7E 09      [19] 1019 	ld	a,9 (ix)
   6A6C 77            [ 7] 1020 	ld	(hl),a
                           1021 ;src/entities/wavemanager.c:140: enemy->ent.cuadrante = mapaActual;
   6A6D 21 42 00      [10] 1022 	ld	hl,#0x0042
   6A70 09            [11] 1023 	add	hl,bc
   6A71 3A 03 86      [13] 1024 	ld	a,(#_mapaActual + 0)
   6A74 77            [ 7] 1025 	ld	(hl),a
                           1026 ;src/entities/wavemanager.c:141: enemy->statusIA = s_mover;
   6A75 21 49 00      [10] 1027 	ld	hl,#0x0049
   6A78 09            [11] 1028 	add	hl,bc
   6A79 36 00         [10] 1029 	ld	(hl),#0x00
                           1030 ;src/entities/wavemanager.c:142: enemy->ent.curr_dir = dir;
   6A7B 21 3B 00      [10] 1031 	ld	hl,#0x003B
   6A7E 09            [11] 1032 	add	hl,bc
   6A7F DD 7E 0A      [19] 1033 	ld	a,10 (ix)
   6A82 77            [ 7] 1034 	ld	(hl),a
                           1035 ;src/entities/wavemanager.c:143: enemy->bullet.ent.cuadrante = mapaActual;
   6A83 21 1F 00      [10] 1036 	ld	hl,#0x001F
   6A86 09            [11] 1037 	add	hl,bc
   6A87 3A 03 86      [13] 1038 	ld	a,(#_mapaActual + 0)
   6A8A 77            [ 7] 1039 	ld	(hl),a
   6A8B DD E1         [14] 1040 	pop	ix
   6A8D C9            [10] 1041 	ret
                           1042 ;src/entities/wavemanager.c:148: void restarEnemigo(){
                           1043 ;	---------------------------------
                           1044 ; Function restarEnemigo
                           1045 ; ---------------------------------
   6A8E                    1046 _restarEnemigo::
                           1047 ;src/entities/wavemanager.c:149: enemigos_actual--;
   6A8E 21 13 86      [10] 1048 	ld	hl, #_enemigos_actual+0
   6A91 35            [11] 1049 	dec	(hl)
   6A92 C9            [10] 1050 	ret
                           1051 	.area _CODE
                           1052 	.area _INITIALIZER
   8621                    1053 __xinit__s_samemap:
   8621 00 00              1054 	.dw #0x0000
   8623                    1055 __xinit__d_samemap:
   8623 96 00              1056 	.dw #0x0096
   8625                    1057 __xinit__seed:
   8625 01                 1058 	.db #0x01	; 1
   8626                    1059 __xinit__enemigos_actual:
   8626 03                 1060 	.db #0x03	; 3
                           1061 	.area _CABS (ABS)
