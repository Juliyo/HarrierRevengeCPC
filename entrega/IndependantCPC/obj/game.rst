                              1 ;--------------------------------------------------------
                              2 ; File Created by SDCC : free open source ANSI-C Compiler
                              3 ; Version 3.5.5 #9498 (Linux)
                              4 ;--------------------------------------------------------
                              5 	.module game
                              6 	.optsdcc -mz80
                              7 	
                              8 ;--------------------------------------------------------
                              9 ; Public variables in this module
                             10 ;--------------------------------------------------------
                             11 	.globl _dibujarPuntos
                             12 	.globl _explosionBala
                             13 	.globl _getBases
                             14 	.globl _getEnemies
                             15 	.globl _calculaAllEntities
                             16 	.globl _calculaEntity
                             17 	.globl _drawAll
                             18 	.globl _dibujarEntity
                             19 	.globl _borrarEntity
                             20 	.globl _updateY
                             21 	.globl _updateX
                             22 	.globl _updatePlayer
                             23 	.globl _disparar
                             24 	.globl _playerHerido
                             25 	.globl _accion
                             26 	.globl _incializarEntities
                             27 	.globl _restarEnemigo
                             28 	.globl _aparecerEnemigo
                             29 	.globl _resetearTimepoEnMapa
                             30 	.globl _cpct_etm_setTileset2x4
                             31 	.globl _cpct_etm_drawTileBox2x4
                             32 	.globl _cpct_getScreenPtr
                             33 	.globl _cpct_waitVSYNC
                             34 	.globl _cpct_drawStringM0
                             35 	.globl _cpct_drawSolidBox
                             36 	.globl _cpct_isAnyKeyPressed
                             37 	.globl _cpct_isKeyPressed
                             38 	.globl _cpct_scanKeyboard_if
                             39 	.globl _cpct_memset
                             40 	.globl _sprintf
                             41 	.globl _count
                             42 	.globl _wshot_cycles
                             43 	.globl _prev_basesCapturadas
                             44 	.globl _basesCapturadas
                             45 	.globl _salirMenu
                             46 	.globl _previousMap
                             47 	.globl _mapaActual
                             48 	.globl _mapa
                             49 	.globl _mapas
                             50 	.globl _hearth
                             51 	.globl _player
                             52 	.globl _inicializarPantalla
                             53 	.globl _dibujarMapa
                             54 	.globl _resetearDrawEnemigos
                             55 	.globl _cambiarMapa
                             56 	.globl _resetearBala
                             57 	.globl _cambiarDerecha
                             58 	.globl _cambiarIzquierda
                             59 	.globl _cambiarArriba
                             60 	.globl _cambiarAbajo
                             61 	.globl _updateUser
                             62 	.globl _checkCollision
                             63 	.globl _calculaColisiones
                             64 	.globl _drawHUD
                             65 	.globl _dibujarBase
                             66 	.globl _play
                             67 ;--------------------------------------------------------
                             68 ; special function registers
                             69 ;--------------------------------------------------------
                             70 ;--------------------------------------------------------
                             71 ; ram data
                             72 ;--------------------------------------------------------
                             73 	.area _DATA
                             74 ;--------------------------------------------------------
                             75 ; ram data
                             76 ;--------------------------------------------------------
                             77 	.area _INITIALIZED
   858D                      78 _mapa::
   858D                      79 	.ds 2
   858F                      80 _mapaActual::
   858F                      81 	.ds 1
   8590                      82 _previousMap::
   8590                      83 	.ds 1
   8591                      84 _salirMenu::
   8591                      85 	.ds 1
   8592                      86 _basesCapturadas::
   8592                      87 	.ds 1
   8593                      88 _prev_basesCapturadas::
   8593                      89 	.ds 1
   8594                      90 _wshot_cycles::
   8594                      91 	.ds 1
   8595                      92 _count::
   8595                      93 	.ds 1
                             94 ;--------------------------------------------------------
                             95 ; absolute external ram data
                             96 ;--------------------------------------------------------
                             97 	.area _DABS (ABS)
                             98 ;--------------------------------------------------------
                             99 ; global & static initialisations
                            100 ;--------------------------------------------------------
                            101 	.area _HOME
                            102 	.area _GSINIT
                            103 	.area _GSFINAL
                            104 	.area _GSINIT
                            105 ;--------------------------------------------------------
                            106 ; Home
                            107 ;--------------------------------------------------------
                            108 	.area _HOME
                            109 	.area _HOME
                            110 ;--------------------------------------------------------
                            111 ; code
                            112 ;--------------------------------------------------------
                            113 	.area _CODE
                            114 ;src/game.c:116: void inicializarPantalla(){
                            115 ;	---------------------------------
                            116 ; Function inicializarPantalla
                            117 ; ---------------------------------
   5818                     118 _inicializarPantalla::
                            119 ;src/game.c:119: TEntity* ent = &hearth;
                            120 ;src/game.c:121: cpct_clearScreen(0);
   5818 21 00 40      [10]  121 	ld	hl,#0x4000
   581B E5            [11]  122 	push	hl
   581C AF            [ 4]  123 	xor	a, a
   581D F5            [11]  124 	push	af
   581E 33            [ 6]  125 	inc	sp
   581F 26 C0         [ 7]  126 	ld	h, #0xC0
   5821 E5            [11]  127 	push	hl
   5822 CD DC 70      [17]  128 	call	_cpct_memset
                            129 ;src/game.c:122: mapaActual = 0;
   5825 21 8F 85      [10]  130 	ld	hl,#_mapaActual + 0
   5828 36 00         [10]  131 	ld	(hl), #0x00
                            132 ;src/game.c:123: previousMap = 0;
   582A 21 90 85      [10]  133 	ld	hl,#_previousMap + 0
   582D 36 00         [10]  134 	ld	(hl), #0x00
                            135 ;src/game.c:124: mapa = g_map11;
   582F 21 40 2F      [10]  136 	ld	hl,#_g_map11+0
   5832 22 8D 85      [16]  137 	ld	(_mapa),hl
                            138 ;src/game.c:125: cpct_etm_setTileset2x4(g_tileset);
   5835 21 80 35      [10]  139 	ld	hl,#_g_tileset
   5838 CD BA 6E      [17]  140 	call	_cpct_etm_setTileset2x4
                            141 ;src/game.c:126: dibujarMapa();
   583B CD 6C 59      [17]  142 	call	_dibujarMapa
                            143 ;src/game.c:127: cpct_drawStringM0("Score: 000",cpct_getScreenPtr(CPCT_VMEM_START,36,23),2,0);
   583E 21 24 17      [10]  144 	ld	hl,#0x1724
   5841 E5            [11]  145 	push	hl
   5842 21 00 C0      [10]  146 	ld	hl,#0xC000
   5845 E5            [11]  147 	push	hl
   5846 CD 38 7A      [17]  148 	call	_cpct_getScreenPtr
   5849 4D            [ 4]  149 	ld	c,l
   584A 44            [ 4]  150 	ld	b,h
   584B 21 02 00      [10]  151 	ld	hl,#0x0002
   584E E5            [11]  152 	push	hl
   584F C5            [11]  153 	push	bc
   5850 21 56 59      [10]  154 	ld	hl,#___str_0
   5853 E5            [11]  155 	push	hl
   5854 CD 4B 6D      [17]  156 	call	_cpct_drawStringM0
   5857 21 06 00      [10]  157 	ld	hl,#6
   585A 39            [11]  158 	add	hl,sp
   585B F9            [ 6]  159 	ld	sp,hl
                            160 ;src/game.c:128: cpct_drawStringM0("Bases:   0",cpct_getScreenPtr(CPCT_VMEM_START,36,5),2,0);
   585C 21 24 05      [10]  161 	ld	hl,#0x0524
   585F E5            [11]  162 	push	hl
   5860 21 00 C0      [10]  163 	ld	hl,#0xC000
   5863 E5            [11]  164 	push	hl
   5864 CD 38 7A      [17]  165 	call	_cpct_getScreenPtr
   5867 4D            [ 4]  166 	ld	c,l
   5868 44            [ 4]  167 	ld	b,h
   5869 21 02 00      [10]  168 	ld	hl,#0x0002
   586C E5            [11]  169 	push	hl
   586D C5            [11]  170 	push	bc
   586E 21 61 59      [10]  171 	ld	hl,#___str_1
   5871 E5            [11]  172 	push	hl
   5872 CD 4B 6D      [17]  173 	call	_cpct_drawStringM0
   5875 21 06 00      [10]  174 	ld	hl,#6
   5878 39            [11]  175 	add	hl,sp
   5879 F9            [ 6]  176 	ld	sp,hl
                            177 ;src/game.c:129: for(i = 0; i < player.vida; ++i){
   587A 0E 00         [ 7]  178 	ld	c,#0x00
   587C                     179 00103$:
   587C 21 21 59      [10]  180 	ld	hl, #(_player + 0x0049) + 0
   587F 46            [ 7]  181 	ld	b,(hl)
   5880 79            [ 4]  182 	ld	a,c
   5881 90            [ 4]  183 	sub	a, b
   5882 30 48         [12]  184 	jr	NC,00101$
                            185 ;src/game.c:130: ent->vmem = cpct_getScreenPtr(CPCT_VMEM_START,ent->x, ent->y);
   5884 21 27 59      [10]  186 	ld	hl,#_hearth
   5887 23            [ 6]  187 	inc	hl
   5888 23            [ 6]  188 	inc	hl
   5889 5E            [ 7]  189 	ld	e,(hl)
   588A 23            [ 6]  190 	inc	hl
   588B 56            [ 7]  191 	ld	d,(hl)
   588C 43            [ 4]  192 	ld	b,e
   588D 2A 27 59      [16]  193 	ld	hl, (#_hearth + 0)
   5890 55            [ 4]  194 	ld	d,l
   5891 C5            [11]  195 	push	bc
   5892 4A            [ 4]  196 	ld	c, d
   5893 C5            [11]  197 	push	bc
   5894 21 00 C0      [10]  198 	ld	hl,#0xC000
   5897 E5            [11]  199 	push	hl
   5898 CD 38 7A      [17]  200 	call	_cpct_getScreenPtr
   589B 5D            [ 4]  201 	ld	e,l
   589C 54            [ 4]  202 	ld	d,h
   589D C1            [10]  203 	pop	bc
   589E ED 53 48 59   [20]  204 	ld	((_hearth + 0x0021)), de
                            205 ;src/game.c:131: dibujarEntity(ent,ent->sw,ent->sh);
   58A2 21 3B 59      [10]  206 	ld	hl,#_hearth + 20
   58A5 46            [ 7]  207 	ld	b, (hl)
   58A6 21 27 59      [10]  208 	ld	hl,#_hearth
   58A9 11 13 00      [10]  209 	ld	de, #0x0013
   58AC 19            [11]  210 	add	hl, de
   58AD 56            [ 7]  211 	ld	d,(hl)
   58AE C5            [11]  212 	push	bc
   58AF 4A            [ 4]  213 	ld	c, d
   58B0 C5            [11]  214 	push	bc
   58B1 21 27 59      [10]  215 	ld	hl,#_hearth
   58B4 E5            [11]  216 	push	hl
   58B5 CD AC 94      [17]  217 	call	_dibujarEntity
   58B8 F1            [10]  218 	pop	af
   58B9 F1            [10]  219 	pop	af
   58BA C1            [10]  220 	pop	bc
                            221 ;src/game.c:132: ent->x+=10;
   58BB ED 5B 27 59   [20]  222 	ld	de, (#_hearth + 0)
   58BF 21 0A 00      [10]  223 	ld	hl,#0x000A
   58C2 19            [11]  224 	add	hl,de
   58C3 5D            [ 4]  225 	ld	e,l
   58C4 54            [ 4]  226 	ld	d,h
   58C5 ED 53 27 59   [20]  227 	ld	(_hearth), de
                            228 ;src/game.c:129: for(i = 0; i < player.vida; ++i){
   58C9 0C            [ 4]  229 	inc	c
   58CA 18 B0         [12]  230 	jr	00103$
   58CC                     231 00101$:
                            232 ;src/game.c:135: count = 0;
   58CC 21 95 85      [10]  233 	ld	hl,#_count + 0
   58CF 36 00         [10]  234 	ld	(hl), #0x00
                            235 ;src/game.c:136: ent->x = 2;
   58D1 21 02 00      [10]  236 	ld	hl,#0x0002
   58D4 22 27 59      [16]  237 	ld	(_hearth), hl
   58D7 C9            [10]  238 	ret
   58D8                     239 _player:
   58D8 00                  240 	.db #0x00	; 0
   58D9 01                  241 	.db #0x01	; 1
   58DA 00                  242 	.db #0x00	; 0
   58DB 00 00               243 	.dw #0x0000
   58DD 00 00               244 	.dw #0x0000
   58DF 00 00               245 	.dw #0x0000
   58E1 00 00               246 	.dw #0x0000
   58E3 03                  247 	.db #0x03	; 3
   58E4 06                  248 	.db #0x06	; 6
   58E5 00                  249 	.db #0x00	; 0
   58E6 48 55               250 	.dw _g_bala_0
   58E8 50 55               251 	.dw _g_bala_1
   58EA 58 55               252 	.dw _g_bala_2
   58EC 60 55               253 	.dw _g_bala_3
   58EE 02                  254 	.db #0x02	; 2
   58EF 04                  255 	.db #0x04	; 4
   58F0 00                  256 	.db #0x00	; 0
   58F1 02                  257 	.db #0x02	; 2
   58F2 00                  258 	.db #0x00	; 0
   58F3 00                  259 	.db #0x00	; 0
   58F4 02                  260 	.db #0x02	; 2
   58F5 04                  261 	.db #0x04	; 4
   58F6 00                  262 	.db #0x00	; 0
   58F7 00                  263 	.db #0x00	; 0
   58F8 00                  264 	.db #0x00	; 0
   58F9 00                  265 	.db #0x00	; 0
   58FA 00                  266 	.db #0x00	; 0
   58FB 00                  267 	.db #0x00	; 0
   58FC 00 00               268 	.dw #0x0000
   58FE 0A 00               269 	.dw #0x000A
   5900 AA 00               270 	.dw #0x00AA
   5902 0A 00               271 	.dw #0x000A
   5904 AA 00               272 	.dw #0x00AA
   5906 01                  273 	.db #0x01	; 1
   5907 02                  274 	.db #0x02	; 2
   5908 01                  275 	.db #0x01	; 1
   5909 F8 56               276 	.dw _g_naves_0
   590B 40 57               277 	.dw _g_naves_1
   590D 88 57               278 	.dw _g_naves_2
   590F D0 57               279 	.dw _g_naves_3
   5911 06                  280 	.db #0x06	; 6
   5912 0C                  281 	.db #0x0C	; 12
   5913 00                  282 	.db #0x00	; 0
   5914 01                  283 	.db #0x01	; 1
   5915 0A                  284 	.db #0x0A	; 10
   5916 AA                  285 	.db #0xAA	; 170
   5917 06                  286 	.db #0x06	; 6
   5918 0C                  287 	.db #0x0C	; 12
   5919 00                  288 	.db #0x00	; 0
   591A 00                  289 	.db #0x00	; 0
   591B 00                  290 	.db #0x00	; 0
   591C 00                  291 	.db #0x00	; 0
   591D 00                  292 	.db #0x00	; 0
   591E 00                  293 	.db #0x00	; 0
   591F 00 00               294 	.dw #0x0000
   5921 03                  295 	.db #0x03	; 3
   5922 03                  296 	.db #0x03	; 3
   5923 00 00               297 	.dw #0x0000
   5925 00 00               298 	.dw #0x0000
   5927                     299 _hearth:
   5927 02 00               300 	.dw #0x0002
   5929 0A 00               301 	.dw #0x000A
   592B 02 00               302 	.dw #0x0002
   592D 0A 00               303 	.dw #0x000A
   592F 01                  304 	.db #0x01	; 1
   5930 01                  305 	.db #0x01	; 1
   5931 01                  306 	.db #0x01	; 1
   5932 30 53               307 	.dw _g_hearth
   5934 00 00               308 	.dw #0x0000
   5936 00 00               309 	.dw #0x0000
   5938 00 00               310 	.dw #0x0000
   593A 09                  311 	.db #0x09	; 9
   593B 10                  312 	.db #0x10	; 16
   593C 00                  313 	.db #0x00	; 0
   593D 00                  314 	.db #0x00	; 0
   593E 00                  315 	.byte #0x00
   593F 00                  316 	.byte #0x00
   5940 00                  317 	.byte #0x00
   5941 00                  318 	.byte #0x00
   5942 00                  319 	.db #0x00	; 0
   5943 00                  320 	.db #0x00	; 0
   5944 00                  321 	.db #0x00	; 0
   5945 00                  322 	.db #0x00	; 0
   5946 00                  323 	.db #0x00	; 0
   5947 00                  324 	.db #0x00	; 0
   5948 00 00               325 	.dw #0x0000
   594A                     326 _mapas:
   594A 40 2F               327 	.dw _g_map11
   594C 00 29               328 	.dw _g_map12
   594E C0 22               329 	.dw _g_map21
   5950 80 1C               330 	.dw _g_map22
   5952 40 16               331 	.dw _g_map31
   5954 00 10               332 	.dw _g_map32
   5956                     333 ___str_0:
   5956 53 63 6F 72 65 3A   334 	.ascii "Score: 000"
        20 30 30 30
   5960 00                  335 	.db 0x00
   5961                     336 ___str_1:
   5961 42 61 73 65 73 3A   337 	.ascii "Bases:   0"
        20 20 20 30
   596B 00                  338 	.db 0x00
                            339 ;src/game.c:142: void dibujarMapa(){
                            340 ;	---------------------------------
                            341 ; Function dibujarMapa
                            342 ; ---------------------------------
   596C                     343 _dibujarMapa::
                            344 ;src/game.c:143: cpct_etm_drawTilemap2x4(g_map11_W, g_map11_H, ORIGEN_MAPA, mapa);
   596C 2A 8D 85      [16]  345 	ld	hl,(_mapa)
   596F E5            [11]  346 	push	hl
   5970 21 90 C1      [10]  347 	ld	hl,#0xC190
   5973 E5            [11]  348 	push	hl
   5974 21 28 28      [10]  349 	ld	hl,#0x2828
   5977 E5            [11]  350 	push	hl
   5978 2E 00         [ 7]  351 	ld	l, #0x00
   597A E5            [11]  352 	push	hl
   597B AF            [ 4]  353 	xor	a, a
   597C F5            [11]  354 	push	af
   597D 33            [ 6]  355 	inc	sp
   597E CD 14 6E      [17]  356 	call	_cpct_etm_drawTileBox2x4
   5981 C9            [10]  357 	ret
                            358 ;src/game.c:145: void resetearDrawEnemigos(){
                            359 ;	---------------------------------
                            360 ; Function resetearDrawEnemigos
                            361 ; ---------------------------------
   5982                     362 _resetearDrawEnemigos::
   5982 DD E5         [15]  363 	push	ix
   5984 DD 21 00 00   [14]  364 	ld	ix,#0
   5988 DD 39         [15]  365 	add	ix,sp
   598A F5            [11]  366 	push	af
   598B 3B            [ 6]  367 	dec	sp
                            368 ;src/game.c:148: enemigos = getEnemies();
   598C CD 5D 98      [17]  369 	call	_getEnemies
   598F 33            [ 6]  370 	inc	sp
   5990 33            [ 6]  371 	inc	sp
   5991 E5            [11]  372 	push	hl
                            373 ;src/game.c:149: for(i=0;i<NUM_ENEMIGOS;++i){
   5992 DD 36 FF 00   [19]  374 	ld	-1 (ix),#0x00
   5996 11 00 00      [10]  375 	ld	de,#0x0000
   5999                     376 00104$:
                            377 ;src/game.c:150: if(enemigos[i].ent.vivo == 1)
   5999 DD 7E FD      [19]  378 	ld	a,-3 (ix)
   599C 83            [ 4]  379 	add	a, e
   599D 4F            [ 4]  380 	ld	c,a
   599E DD 7E FE      [19]  381 	ld	a,-2 (ix)
   59A1 8A            [ 4]  382 	adc	a, d
   59A2 47            [ 4]  383 	ld	b,a
   59A3 69            [ 4]  384 	ld	l, c
   59A4 60            [ 4]  385 	ld	h, b
   59A5 C5            [11]  386 	push	bc
   59A6 01 41 00      [10]  387 	ld	bc, #0x0041
   59A9 09            [11]  388 	add	hl, bc
   59AA C1            [10]  389 	pop	bc
   59AB 6E            [ 7]  390 	ld	l,(hl)
   59AC 2D            [ 4]  391 	dec	l
   59AD 20 06         [12]  392 	jr	NZ,00105$
                            393 ;src/game.c:151: enemigos[i].ent.draw = SI;
   59AF 21 30 00      [10]  394 	ld	hl,#0x0030
   59B2 09            [11]  395 	add	hl,bc
   59B3 36 01         [10]  396 	ld	(hl),#0x01
   59B5                     397 00105$:
                            398 ;src/game.c:149: for(i=0;i<NUM_ENEMIGOS;++i){
   59B5 21 4E 00      [10]  399 	ld	hl,#0x004E
   59B8 19            [11]  400 	add	hl,de
   59B9 EB            [ 4]  401 	ex	de,hl
   59BA DD 34 FF      [23]  402 	inc	-1 (ix)
   59BD DD 7E FF      [19]  403 	ld	a,-1 (ix)
   59C0 D6 03         [ 7]  404 	sub	a, #0x03
   59C2 38 D5         [12]  405 	jr	C,00104$
   59C4 DD F9         [10]  406 	ld	sp, ix
   59C6 DD E1         [14]  407 	pop	ix
   59C8 C9            [10]  408 	ret
                            409 ;src/game.c:154: u8 cambiarMapa(u8 suma, u8 cantidad){
                            410 ;	---------------------------------
                            411 ; Function cambiarMapa
                            412 ; ---------------------------------
   59C9                     413 _cambiarMapa::
   59C9 DD E5         [15]  414 	push	ix
   59CB DD 21 00 00   [14]  415 	ld	ix,#0
   59CF DD 39         [15]  416 	add	ix,sp
                            417 ;src/game.c:156: if(suma % 2 != 0){ //tengo que sumar
   59D1 DD CB 04 46   [20]  418 	bit	0, 4 (ix)
   59D5 28 28         [12]  419 	jr	Z,00102$
                            420 ;src/game.c:157: mapaActual = mapaActual + cantidad;
   59D7 21 8F 85      [10]  421 	ld	hl,#_mapaActual
   59DA 7E            [ 7]  422 	ld	a,(hl)
   59DB DD 86 05      [19]  423 	add	a, 5 (ix)
   59DE 77            [ 7]  424 	ld	(hl),a
                            425 ;src/game.c:158: mapa = mapas[mapaActual];
   59DF 01 4A 59      [10]  426 	ld	bc,#_mapas+0
   59E2 FD 21 8F 85   [14]  427 	ld	iy,#_mapaActual
   59E6 FD 6E 00      [19]  428 	ld	l,0 (iy)
   59E9 26 00         [ 7]  429 	ld	h,#0x00
   59EB 29            [11]  430 	add	hl, hl
   59EC 09            [11]  431 	add	hl,bc
   59ED 7E            [ 7]  432 	ld	a,(hl)
   59EE FD 21 8D 85   [14]  433 	ld	iy,#_mapa
   59F2 FD 77 00      [19]  434 	ld	0 (iy),a
   59F5 23            [ 6]  435 	inc	hl
   59F6 7E            [ 7]  436 	ld	a,(hl)
   59F7 32 8E 85      [13]  437 	ld	(#_mapa + 1),a
                            438 ;src/game.c:159: dibujarMapa();
   59FA CD 6C 59      [17]  439 	call	_dibujarMapa
   59FD 18 26         [12]  440 	jr	00103$
   59FF                     441 00102$:
                            442 ;src/game.c:161: mapaActual = mapaActual - cantidad;
   59FF 21 8F 85      [10]  443 	ld	hl,#_mapaActual
   5A02 7E            [ 7]  444 	ld	a,(hl)
   5A03 DD 96 05      [19]  445 	sub	a, 5 (ix)
   5A06 77            [ 7]  446 	ld	(hl),a
                            447 ;src/game.c:162: mapa = mapas[mapaActual];
   5A07 01 4A 59      [10]  448 	ld	bc,#_mapas+0
   5A0A FD 21 8F 85   [14]  449 	ld	iy,#_mapaActual
   5A0E FD 6E 00      [19]  450 	ld	l,0 (iy)
   5A11 26 00         [ 7]  451 	ld	h,#0x00
   5A13 29            [11]  452 	add	hl, hl
   5A14 09            [11]  453 	add	hl,bc
   5A15 7E            [ 7]  454 	ld	a,(hl)
   5A16 FD 21 8D 85   [14]  455 	ld	iy,#_mapa
   5A1A FD 77 00      [19]  456 	ld	0 (iy),a
   5A1D 23            [ 6]  457 	inc	hl
   5A1E 7E            [ 7]  458 	ld	a,(hl)
   5A1F 32 8E 85      [13]  459 	ld	(#_mapa + 1),a
                            460 ;src/game.c:163: dibujarMapa();
   5A22 CD 6C 59      [17]  461 	call	_dibujarMapa
   5A25                     462 00103$:
                            463 ;src/game.c:165: resetearDrawEnemigos();
   5A25 CD 82 59      [17]  464 	call	_resetearDrawEnemigos
                            465 ;src/game.c:166: resetearBala(&player.bullet);
   5A28 21 D8 58      [10]  466 	ld	hl,#_player
   5A2B E5            [11]  467 	push	hl
   5A2C CD 54 5A      [17]  468 	call	_resetearBala
   5A2F F1            [10]  469 	pop	af
                            470 ;src/game.c:167: base = &bases[mapaActual];
   5A30 01 79 87      [10]  471 	ld	bc,#_bases+0
   5A33 ED 5B 8F 85   [20]  472 	ld	de,(_mapaActual)
   5A37 16 00         [ 7]  473 	ld	d,#0x00
   5A39 6B            [ 4]  474 	ld	l, e
   5A3A 62            [ 4]  475 	ld	h, d
   5A3B 29            [11]  476 	add	hl, hl
   5A3C 29            [11]  477 	add	hl, hl
   5A3D 29            [11]  478 	add	hl, hl
   5A3E 19            [11]  479 	add	hl, de
   5A3F 29            [11]  480 	add	hl, hl
   5A40 19            [11]  481 	add	hl, de
   5A41 29            [11]  482 	add	hl, hl
   5A42 19            [11]  483 	add	hl, de
   5A43 09            [11]  484 	add	hl,bc
                            485 ;src/game.c:168: base->ent.draw = SI;
   5A44 01 0E 00      [10]  486 	ld	bc,#0x000E
   5A47 09            [11]  487 	add	hl,bc
   5A48 36 01         [10]  488 	ld	(hl),#0x01
                            489 ;src/game.c:170: return mapaActual;
   5A4A FD 21 8F 85   [14]  490 	ld	iy,#_mapaActual
   5A4E FD 6E 00      [19]  491 	ld	l,0 (iy)
   5A51 DD E1         [14]  492 	pop	ix
   5A53 C9            [10]  493 	ret
                            494 ;src/game.c:172: void resetearBala(TBullet* bullet){
                            495 ;	---------------------------------
                            496 ; Function resetearBala
                            497 ; ---------------------------------
   5A54                     498 _resetearBala::
                            499 ;src/game.c:176: bullet->ent.draw = NO;
   5A54 D1            [10]  500 	pop	de
   5A55 C1            [10]  501 	pop	bc
   5A56 C5            [11]  502 	push	bc
   5A57 D5            [11]  503 	push	de
   5A58 21 0D 00      [10]  504 	ld	hl,#0x000D
   5A5B 09            [11]  505 	add	hl,bc
   5A5C 36 00         [10]  506 	ld	(hl),#0x00
                            507 ;src/game.c:177: bullet->ent.vivo = NO;
   5A5E 21 1E 00      [10]  508 	ld	hl,#0x001E
   5A61 09            [11]  509 	add	hl,bc
   5A62 36 00         [10]  510 	ld	(hl),#0x00
                            511 ;src/game.c:178: bullet->state = es_static;
   5A64 03            [ 6]  512 	inc	bc
   5A65 03            [ 6]  513 	inc	bc
   5A66 AF            [ 4]  514 	xor	a, a
   5A67 02            [ 7]  515 	ld	(bc),a
   5A68 C9            [10]  516 	ret
                            517 ;src/game.c:181: void cambiarDerecha(TEntity* ent){
                            518 ;	---------------------------------
                            519 ; Function cambiarDerecha
                            520 ; ---------------------------------
   5A69                     521 _cambiarDerecha::
                            522 ;src/game.c:182: if(mapaActual >= 0 && mapaActual < 6 && mapaActual % 2 == 0){ //pongo a mano el numero de mapas que hay en total y se mueve si son pares
   5A69 3A 8F 85      [13]  523 	ld	a,(#_mapaActual + 0)
   5A6C D6 06         [ 7]  524 	sub	a, #0x06
   5A6E D0            [11]  525 	ret	NC
   5A6F 21 8F 85      [10]  526 	ld	hl,#_mapaActual+0
   5A72 CB 46         [12]  527 	bit	0, (hl)
   5A74 C0            [11]  528 	ret	NZ
                            529 ;src/game.c:183: mapaActual = cambiarMapa(1,1);
   5A75 21 01 01      [10]  530 	ld	hl,#0x0101
   5A78 E5            [11]  531 	push	hl
   5A79 CD C9 59      [17]  532 	call	_cambiarMapa
   5A7C F1            [10]  533 	pop	af
   5A7D FD 21 8F 85   [14]  534 	ld	iy,#_mapaActual
   5A81 FD 75 00      [19]  535 	ld	0 (iy),l
                            536 ;src/game.c:184: ent->cuadrante = mapaActual;
   5A84 D1            [10]  537 	pop	de
   5A85 C1            [10]  538 	pop	bc
   5A86 C5            [11]  539 	push	bc
   5A87 D5            [11]  540 	push	de
   5A88 21 1C 00      [10]  541 	ld	hl,#0x001C
   5A8B 09            [11]  542 	add	hl,bc
   5A8C 3A 8F 85      [13]  543 	ld	a,(#_mapaActual + 0)
   5A8F 77            [ 7]  544 	ld	(hl),a
                            545 ;src/game.c:185: updateX(ent,0); //esto es para cambiar la posision del player cuando cambia de mapa.
   5A90 21 00 00      [10]  546 	ld	hl,#0x0000
   5A93 E5            [11]  547 	push	hl
   5A94 C5            [11]  548 	push	bc
   5A95 CD 16 8C      [17]  549 	call	_updateX
   5A98 F1            [10]  550 	pop	af
   5A99 F1            [10]  551 	pop	af
                            552 ;src/game.c:186: aparecerEnemigo();
   5A9A C3 D7 64      [10]  553 	jp  _aparecerEnemigo
                            554 ;src/game.c:190: void cambiarIzquierda(TEntity* ent){
                            555 ;	---------------------------------
                            556 ; Function cambiarIzquierda
                            557 ; ---------------------------------
   5A9D                     558 _cambiarIzquierda::
                            559 ;src/game.c:191: if(mapaActual >= 0 && mapaActual < 6 && mapaActual % 2 != 0){ //pongo a mano el numero de mapas que hay en total y se mueve si son impares
   5A9D 3A 8F 85      [13]  560 	ld	a,(#_mapaActual + 0)
   5AA0 D6 06         [ 7]  561 	sub	a, #0x06
   5AA2 D0            [11]  562 	ret	NC
   5AA3 21 8F 85      [10]  563 	ld	hl,#_mapaActual+0
   5AA6 CB 46         [12]  564 	bit	0, (hl)
   5AA8 C8            [11]  565 	ret	Z
                            566 ;src/game.c:192: mapaActual = cambiarMapa(0,1);
   5AA9 21 00 01      [10]  567 	ld	hl,#0x0100
   5AAC E5            [11]  568 	push	hl
   5AAD CD C9 59      [17]  569 	call	_cambiarMapa
   5AB0 F1            [10]  570 	pop	af
   5AB1 FD 21 8F 85   [14]  571 	ld	iy,#_mapaActual
   5AB5 FD 75 00      [19]  572 	ld	0 (iy),l
                            573 ;src/game.c:193: ent->cuadrante = mapaActual;
   5AB8 D1            [10]  574 	pop	de
   5AB9 C1            [10]  575 	pop	bc
   5ABA C5            [11]  576 	push	bc
   5ABB D5            [11]  577 	push	de
   5ABC 21 1C 00      [10]  578 	ld	hl,#0x001C
   5ABF 09            [11]  579 	add	hl,bc
   5AC0 3A 8F 85      [13]  580 	ld	a,(#_mapaActual + 0)
   5AC3 77            [ 7]  581 	ld	(hl),a
                            582 ;src/game.c:194: updateX(ent,74);//80-6 == ancho del mapa - ancho sprite(en bytes), poner en variables
   5AC4 21 4A 00      [10]  583 	ld	hl,#0x004A
   5AC7 E5            [11]  584 	push	hl
   5AC8 C5            [11]  585 	push	bc
   5AC9 CD 16 8C      [17]  586 	call	_updateX
   5ACC F1            [10]  587 	pop	af
   5ACD F1            [10]  588 	pop	af
                            589 ;src/game.c:195: aparecerEnemigo();
   5ACE C3 D7 64      [10]  590 	jp  _aparecerEnemigo
                            591 ;src/game.c:199: void cambiarArriba(TEntity* ent){
                            592 ;	---------------------------------
                            593 ; Function cambiarArriba
                            594 ; ---------------------------------
   5AD1                     595 _cambiarArriba::
                            596 ;src/game.c:200: if(mapaActual >= 0 && mapaActual < 4){//desde los 4 primeros mapas puedo subir
   5AD1 3A 8F 85      [13]  597 	ld	a,(#_mapaActual + 0)
   5AD4 D6 04         [ 7]  598 	sub	a, #0x04
   5AD6 D0            [11]  599 	ret	NC
                            600 ;src/game.c:201: mapaActual = cambiarMapa(1,2);
   5AD7 21 01 02      [10]  601 	ld	hl,#0x0201
   5ADA E5            [11]  602 	push	hl
   5ADB CD C9 59      [17]  603 	call	_cambiarMapa
   5ADE F1            [10]  604 	pop	af
   5ADF FD 21 8F 85   [14]  605 	ld	iy,#_mapaActual
   5AE3 FD 75 00      [19]  606 	ld	0 (iy),l
                            607 ;src/game.c:202: ent->cuadrante = mapaActual;
   5AE6 D1            [10]  608 	pop	de
   5AE7 C1            [10]  609 	pop	bc
   5AE8 C5            [11]  610 	push	bc
   5AE9 D5            [11]  611 	push	de
   5AEA 21 1C 00      [10]  612 	ld	hl,#0x001C
   5AED 09            [11]  613 	add	hl,bc
   5AEE 3A 8F 85      [13]  614 	ld	a,(#_mapaActual + 0)
   5AF1 77            [ 7]  615 	ld	(hl),a
                            616 ;src/game.c:203: updateY(ent, 188);ent->y = 188;//200-12 == alto del mapa - alto sprite, poner en variables
   5AF2 C5            [11]  617 	push	bc
   5AF3 21 BC 00      [10]  618 	ld	hl,#0x00BC
   5AF6 E5            [11]  619 	push	hl
   5AF7 C5            [11]  620 	push	bc
   5AF8 CD 32 8C      [17]  621 	call	_updateY
   5AFB F1            [10]  622 	pop	af
   5AFC F1            [10]  623 	pop	af
   5AFD C1            [10]  624 	pop	bc
   5AFE 03            [ 6]  625 	inc	bc
   5AFF 03            [ 6]  626 	inc	bc
   5B00 60            [ 4]  627 	ld	h,b
   5B01 69            [ 4]  628 	ld	l, c
   5B02 36 BC         [10]  629 	ld	(hl),#0xBC
   5B04 23            [ 6]  630 	inc	hl
   5B05 36 00         [10]  631 	ld	(hl),#0x00
                            632 ;src/game.c:204: aparecerEnemigo();
   5B07 C3 D7 64      [10]  633 	jp  _aparecerEnemigo
                            634 ;src/game.c:209: void cambiarAbajo(TEntity* ent){
                            635 ;	---------------------------------
                            636 ; Function cambiarAbajo
                            637 ; ---------------------------------
   5B0A                     638 _cambiarAbajo::
                            639 ;src/game.c:210: if(mapaActual > 1 && mapaActual < 6){ //desde los 4 ultimos mapas puedo bajar
   5B0A 3E 01         [ 7]  640 	ld	a,#0x01
   5B0C FD 21 8F 85   [14]  641 	ld	iy,#_mapaActual
   5B10 FD 96 00      [19]  642 	sub	a, 0 (iy)
   5B13 D0            [11]  643 	ret	NC
   5B14 3A 8F 85      [13]  644 	ld	a,(#_mapaActual + 0)
   5B17 D6 06         [ 7]  645 	sub	a, #0x06
   5B19 D0            [11]  646 	ret	NC
                            647 ;src/game.c:211: mapaActual = cambiarMapa(0,2);
   5B1A 21 00 02      [10]  648 	ld	hl,#0x0200
   5B1D E5            [11]  649 	push	hl
   5B1E CD C9 59      [17]  650 	call	_cambiarMapa
   5B21 F1            [10]  651 	pop	af
   5B22 FD 21 8F 85   [14]  652 	ld	iy,#_mapaActual
   5B26 FD 75 00      [19]  653 	ld	0 (iy),l
                            654 ;src/game.c:212: ent->cuadrante = mapaActual;
   5B29 D1            [10]  655 	pop	de
   5B2A C1            [10]  656 	pop	bc
   5B2B C5            [11]  657 	push	bc
   5B2C D5            [11]  658 	push	de
   5B2D 21 1C 00      [10]  659 	ld	hl,#0x001C
   5B30 09            [11]  660 	add	hl,bc
   5B31 3A 8F 85      [13]  661 	ld	a,(#_mapaActual + 0)
   5B34 77            [ 7]  662 	ld	(hl),a
                            663 ;src/game.c:213: updateY(ent, 40); //en 40 comienza el mapa a pintarse
   5B35 21 28 00      [10]  664 	ld	hl,#0x0028
   5B38 E5            [11]  665 	push	hl
   5B39 C5            [11]  666 	push	bc
   5B3A CD 32 8C      [17]  667 	call	_updateY
   5B3D F1            [10]  668 	pop	af
   5B3E F1            [10]  669 	pop	af
                            670 ;src/game.c:214: aparecerEnemigo();
   5B3F C3 D7 64      [10]  671 	jp  _aparecerEnemigo
                            672 ;src/game.c:218: void updateUser(){
                            673 ;	---------------------------------
                            674 ; Function updateUser
                            675 ; ---------------------------------
   5B42                     676 _updateUser::
                            677 ;src/game.c:219: TPlayer* p = &player;
                            678 ;src/game.c:221: cpct_scanKeyboard_if();
   5B42 CD 4E 70      [17]  679 	call	_cpct_scanKeyboard_if
                            680 ;src/game.c:222: if(cpct_isAnyKeyPressed()){
   5B45 CD 41 70      [17]  681 	call	_cpct_isAnyKeyPressed
   5B48 7D            [ 4]  682 	ld	a, l
   5B49 B7            [ 4]  683 	or	a, a
   5B4A C8            [11]  684 	ret	Z
                            685 ;src/game.c:223: if(cpct_isKeyPressed(Key_Space)){
   5B4B 21 05 80      [10]  686 	ld	hl,#0x8005
   5B4E CD 33 6D      [17]  687 	call	_cpct_isKeyPressed
                            688 ;src/game.c:224: disparar(&player.bullet, player.ent.x, player.ent.y, player.ent.curr_dir);
                            689 ;src/game.c:223: if(cpct_isKeyPressed(Key_Space)){
   5B51 7D            [ 4]  690 	ld	a,l
   5B52 B7            [ 4]  691 	or	a, a
   5B53 28 1A         [12]  692 	jr	Z,00102$
                            693 ;src/game.c:224: disparar(&player.bullet, player.ent.x, player.ent.y, player.ent.curr_dir);
   5B55 21 13 59      [10]  694 	ld	hl, #_player + 59
   5B58 4E            [ 7]  695 	ld	c,(hl)
   5B59 ED 5B 00 59   [20]  696 	ld	de, (#_player + 40)
   5B5D 2A FE 58      [16]  697 	ld	hl, (#(_player + 0x0026) + 0)
   5B60 45            [ 4]  698 	ld	b,l
   5B61 51            [ 4]  699 	ld	d, c
   5B62 D5            [11]  700 	push	de
   5B63 C5            [11]  701 	push	bc
   5B64 33            [ 6]  702 	inc	sp
   5B65 21 D8 58      [10]  703 	ld	hl,#_player
   5B68 E5            [11]  704 	push	hl
   5B69 CD 52 8C      [17]  705 	call	_disparar
   5B6C F1            [10]  706 	pop	af
   5B6D F1            [10]  707 	pop	af
   5B6E 33            [ 6]  708 	inc	sp
   5B6F                     709 00102$:
                            710 ;src/game.c:226: if(cpct_isKeyPressed(Key_CursorUp)){
   5B6F 21 00 01      [10]  711 	ld	hl,#0x0100
   5B72 CD 33 6D      [17]  712 	call	_cpct_isKeyPressed
                            713 ;src/game.c:229: p->bullet.ent.cuadrante = mapaActual;
                            714 ;src/game.c:227: if(accion(&player.ent, es_mover, d_up) == d_up){
   5B75 01 FE 58      [10]  715 	ld	bc,#(_player + 0x0026)
                            716 ;src/game.c:229: p->bullet.ent.cuadrante = mapaActual;
                            717 ;src/game.c:226: if(cpct_isKeyPressed(Key_CursorUp)){
   5B78 7D            [ 4]  718 	ld	a,l
   5B79 B7            [ 4]  719 	or	a, a
   5B7A 28 1D         [12]  720 	jr	Z,00123$
                            721 ;src/game.c:227: if(accion(&player.ent, es_mover, d_up) == d_up){
   5B7C 21 01 00      [10]  722 	ld	hl,#0x0001
   5B7F E5            [11]  723 	push	hl
   5B80 C5            [11]  724 	push	bc
   5B81 CD 6B 88      [17]  725 	call	_accion
   5B84 F1            [10]  726 	pop	af
   5B85 F1            [10]  727 	pop	af
   5B86 7D            [ 4]  728 	ld	a,l
   5B87 B7            [ 4]  729 	or	a, a
   5B88 C0            [11]  730 	ret	NZ
                            731 ;src/game.c:228: cambiarArriba(&player.ent);
   5B89 21 FE 58      [10]  732 	ld	hl,#(_player + 0x0026)
   5B8C E5            [11]  733 	push	hl
   5B8D CD D1 5A      [17]  734 	call	_cambiarArriba
   5B90 F1            [10]  735 	pop	af
                            736 ;src/game.c:229: p->bullet.ent.cuadrante = mapaActual;
   5B91 21 F7 58      [10]  737 	ld	hl,#(_player + 0x001f)
   5B94 3A 8F 85      [13]  738 	ld	a,(#_mapaActual + 0)
   5B97 77            [ 7]  739 	ld	(hl),a
   5B98 C9            [10]  740 	ret
   5B99                     741 00123$:
                            742 ;src/game.c:231: }else if(cpct_isKeyPressed(Key_CursorDown)){
   5B99 C5            [11]  743 	push	bc
   5B9A 21 00 04      [10]  744 	ld	hl,#0x0400
   5B9D CD 33 6D      [17]  745 	call	_cpct_isKeyPressed
   5BA0 C1            [10]  746 	pop	bc
   5BA1 7D            [ 4]  747 	ld	a,l
   5BA2 B7            [ 4]  748 	or	a, a
   5BA3 28 1E         [12]  749 	jr	Z,00120$
                            750 ;src/game.c:232: if(accion(&player.ent, es_mover, d_down) == d_down){
   5BA5 21 01 02      [10]  751 	ld	hl,#0x0201
   5BA8 E5            [11]  752 	push	hl
   5BA9 C5            [11]  753 	push	bc
   5BAA CD 6B 88      [17]  754 	call	_accion
   5BAD F1            [10]  755 	pop	af
   5BAE F1            [10]  756 	pop	af
   5BAF 7D            [ 4]  757 	ld	a,l
   5BB0 D6 02         [ 7]  758 	sub	a, #0x02
   5BB2 C0            [11]  759 	ret	NZ
                            760 ;src/game.c:233: cambiarAbajo(&player.ent);
   5BB3 21 FE 58      [10]  761 	ld	hl,#(_player + 0x0026)
   5BB6 E5            [11]  762 	push	hl
   5BB7 CD 0A 5B      [17]  763 	call	_cambiarAbajo
   5BBA F1            [10]  764 	pop	af
                            765 ;src/game.c:234: p->bullet.ent.cuadrante = mapaActual;
   5BBB 21 F7 58      [10]  766 	ld	hl,#(_player + 0x001f)
   5BBE 3A 8F 85      [13]  767 	ld	a,(#_mapaActual + 0)
   5BC1 77            [ 7]  768 	ld	(hl),a
   5BC2 C9            [10]  769 	ret
   5BC3                     770 00120$:
                            771 ;src/game.c:236: }else if(cpct_isKeyPressed(Key_CursorRight)){
   5BC3 C5            [11]  772 	push	bc
   5BC4 21 00 02      [10]  773 	ld	hl,#0x0200
   5BC7 CD 33 6D      [17]  774 	call	_cpct_isKeyPressed
   5BCA C1            [10]  775 	pop	bc
   5BCB 7D            [ 4]  776 	ld	a,l
   5BCC B7            [ 4]  777 	or	a, a
   5BCD 28 1C         [12]  778 	jr	Z,00117$
                            779 ;src/game.c:237: if(accion(&player.ent,es_mover,d_right) == d_right){
   5BCF 21 01 01      [10]  780 	ld	hl,#0x0101
   5BD2 E5            [11]  781 	push	hl
   5BD3 C5            [11]  782 	push	bc
   5BD4 CD 6B 88      [17]  783 	call	_accion
   5BD7 F1            [10]  784 	pop	af
   5BD8 F1            [10]  785 	pop	af
   5BD9 2D            [ 4]  786 	dec	l
   5BDA C0            [11]  787 	ret	NZ
                            788 ;src/game.c:238: cambiarDerecha(&player.ent);
   5BDB 21 FE 58      [10]  789 	ld	hl,#(_player + 0x0026)
   5BDE E5            [11]  790 	push	hl
   5BDF CD 69 5A      [17]  791 	call	_cambiarDerecha
   5BE2 F1            [10]  792 	pop	af
                            793 ;src/game.c:239: p->bullet.ent.cuadrante = mapaActual;
   5BE3 21 F7 58      [10]  794 	ld	hl,#(_player + 0x001f)
   5BE6 3A 8F 85      [13]  795 	ld	a,(#_mapaActual + 0)
   5BE9 77            [ 7]  796 	ld	(hl),a
   5BEA C9            [10]  797 	ret
   5BEB                     798 00117$:
                            799 ;src/game.c:241: }else if(cpct_isKeyPressed(Key_CursorLeft)){
   5BEB C5            [11]  800 	push	bc
   5BEC 21 01 01      [10]  801 	ld	hl,#0x0101
   5BEF CD 33 6D      [17]  802 	call	_cpct_isKeyPressed
   5BF2 C1            [10]  803 	pop	bc
   5BF3 7D            [ 4]  804 	ld	a,l
   5BF4 B7            [ 4]  805 	or	a, a
   5BF5 28 1E         [12]  806 	jr	Z,00114$
                            807 ;src/game.c:242: if(accion(&player.ent,es_mover,d_left) == d_left){
   5BF7 21 01 03      [10]  808 	ld	hl,#0x0301
   5BFA E5            [11]  809 	push	hl
   5BFB C5            [11]  810 	push	bc
   5BFC CD 6B 88      [17]  811 	call	_accion
   5BFF F1            [10]  812 	pop	af
   5C00 F1            [10]  813 	pop	af
   5C01 7D            [ 4]  814 	ld	a,l
   5C02 D6 03         [ 7]  815 	sub	a, #0x03
   5C04 C0            [11]  816 	ret	NZ
                            817 ;src/game.c:243: cambiarIzquierda(&player.ent);
   5C05 21 FE 58      [10]  818 	ld	hl,#(_player + 0x0026)
   5C08 E5            [11]  819 	push	hl
   5C09 CD 9D 5A      [17]  820 	call	_cambiarIzquierda
   5C0C F1            [10]  821 	pop	af
                            822 ;src/game.c:244: p->bullet.ent.cuadrante = mapaActual;
   5C0D 21 F7 58      [10]  823 	ld	hl,#(_player + 0x001f)
   5C10 3A 8F 85      [13]  824 	ld	a,(#_mapaActual + 0)
   5C13 77            [ 7]  825 	ld	(hl),a
   5C14 C9            [10]  826 	ret
   5C15                     827 00114$:
                            828 ;src/game.c:246: }else if(cpct_isKeyPressed(Key_Esc)){
   5C15 21 08 04      [10]  829 	ld	hl,#0x0408
   5C18 CD 33 6D      [17]  830 	call	_cpct_isKeyPressed
   5C1B 7D            [ 4]  831 	ld	a,l
   5C1C B7            [ 4]  832 	or	a, a
   5C1D C8            [11]  833 	ret	Z
                            834 ;src/game.c:247: salirMenu = 1;
   5C1E 21 91 85      [10]  835 	ld	hl,#_salirMenu + 0
   5C21 36 01         [10]  836 	ld	(hl), #0x01
   5C23 C9            [10]  837 	ret
                            838 ;src/game.c:253: u8 checkCollision(TCollision *col1, TCollision *col2){
                            839 ;	---------------------------------
                            840 ; Function checkCollision
                            841 ; ---------------------------------
   5C24                     842 _checkCollision::
   5C24 DD E5         [15]  843 	push	ix
   5C26 DD 21 00 00   [14]  844 	ld	ix,#0
   5C2A DD 39         [15]  845 	add	ix,sp
   5C2C 21 F7 FF      [10]  846 	ld	hl,#-9
   5C2F 39            [11]  847 	add	hl,sp
   5C30 F9            [ 6]  848 	ld	sp,hl
                            849 ;src/game.c:255: if (col1->x < col2->x + col2->w &&
   5C31 DD 7E 04      [19]  850 	ld	a,4 (ix)
   5C34 DD 77 F8      [19]  851 	ld	-8 (ix),a
   5C37 DD 7E 05      [19]  852 	ld	a,5 (ix)
   5C3A DD 77 F9      [19]  853 	ld	-7 (ix),a
   5C3D DD 6E F8      [19]  854 	ld	l,-8 (ix)
   5C40 DD 66 F9      [19]  855 	ld	h,-7 (ix)
   5C43 4E            [ 7]  856 	ld	c,(hl)
   5C44 DD 7E 06      [19]  857 	ld	a,6 (ix)
   5C47 DD 77 FE      [19]  858 	ld	-2 (ix),a
   5C4A DD 7E 07      [19]  859 	ld	a,7 (ix)
   5C4D DD 77 FF      [19]  860 	ld	-1 (ix),a
   5C50 DD 6E FE      [19]  861 	ld	l,-2 (ix)
   5C53 DD 66 FF      [19]  862 	ld	h,-1 (ix)
   5C56 46            [ 7]  863 	ld	b,(hl)
   5C57 DD 70 FC      [19]  864 	ld	-4 (ix),b
   5C5A DD 36 FD 00   [19]  865 	ld	-3 (ix),#0x00
   5C5E DD 6E FE      [19]  866 	ld	l,-2 (ix)
   5C61 DD 66 FF      [19]  867 	ld	h,-1 (ix)
   5C64 23            [ 6]  868 	inc	hl
   5C65 23            [ 6]  869 	inc	hl
   5C66 5E            [ 7]  870 	ld	e,(hl)
   5C67 16 00         [ 7]  871 	ld	d,#0x00
   5C69 DD 6E FC      [19]  872 	ld	l,-4 (ix)
   5C6C DD 66 FD      [19]  873 	ld	h,-3 (ix)
   5C6F 19            [11]  874 	add	hl,de
   5C70 DD 71 FA      [19]  875 	ld	-6 (ix),c
   5C73 DD 36 FB 00   [19]  876 	ld	-5 (ix),#0x00
   5C77 DD 7E FA      [19]  877 	ld	a,-6 (ix)
   5C7A 95            [ 4]  878 	sub	a, l
   5C7B DD 7E FB      [19]  879 	ld	a,-5 (ix)
   5C7E 9C            [ 4]  880 	sbc	a, h
   5C7F E2 84 5C      [10]  881 	jp	PO, 00125$
   5C82 EE 80         [ 7]  882 	xor	a, #0x80
   5C84                     883 00125$:
   5C84 F2 6E 5D      [10]  884 	jp	P,00102$
                            885 ;src/game.c:256: col1->x + col1->w > col2->x &&
   5C87 DD 6E F8      [19]  886 	ld	l,-8 (ix)
   5C8A DD 66 F9      [19]  887 	ld	h,-7 (ix)
   5C8D 23            [ 6]  888 	inc	hl
   5C8E 23            [ 6]  889 	inc	hl
   5C8F 4E            [ 7]  890 	ld	c,(hl)
   5C90 06 00         [ 7]  891 	ld	b,#0x00
   5C92 DD 6E FA      [19]  892 	ld	l,-6 (ix)
   5C95 DD 66 FB      [19]  893 	ld	h,-5 (ix)
   5C98 09            [11]  894 	add	hl,bc
   5C99 DD 7E FC      [19]  895 	ld	a,-4 (ix)
   5C9C 95            [ 4]  896 	sub	a, l
   5C9D DD 7E FD      [19]  897 	ld	a,-3 (ix)
   5CA0 9C            [ 4]  898 	sbc	a, h
   5CA1 E2 A6 5C      [10]  899 	jp	PO, 00126$
   5CA4 EE 80         [ 7]  900 	xor	a, #0x80
   5CA6                     901 00126$:
   5CA6 F2 6E 5D      [10]  902 	jp	P,00102$
                            903 ;src/game.c:257: col1->y < col2->y + col2->h &&
   5CA9 DD 7E F8      [19]  904 	ld	a,-8 (ix)
   5CAC DD 77 FA      [19]  905 	ld	-6 (ix),a
   5CAF DD 7E F9      [19]  906 	ld	a,-7 (ix)
   5CB2 DD 77 FB      [19]  907 	ld	-5 (ix),a
   5CB5 DD 6E FA      [19]  908 	ld	l,-6 (ix)
   5CB8 DD 66 FB      [19]  909 	ld	h,-5 (ix)
   5CBB 23            [ 6]  910 	inc	hl
   5CBC 7E            [ 7]  911 	ld	a,(hl)
   5CBD DD 77 FA      [19]  912 	ld	-6 (ix),a
   5CC0 DD 7E FE      [19]  913 	ld	a,-2 (ix)
   5CC3 DD 77 FC      [19]  914 	ld	-4 (ix),a
   5CC6 DD 7E FF      [19]  915 	ld	a,-1 (ix)
   5CC9 DD 77 FD      [19]  916 	ld	-3 (ix),a
   5CCC DD 6E FC      [19]  917 	ld	l,-4 (ix)
   5CCF DD 66 FD      [19]  918 	ld	h,-3 (ix)
   5CD2 23            [ 6]  919 	inc	hl
   5CD3 7E            [ 7]  920 	ld	a,(hl)
   5CD4 DD 77 FC      [19]  921 	ld	-4 (ix), a
   5CD7 DD 77 FC      [19]  922 	ld	-4 (ix),a
   5CDA DD 36 FD 00   [19]  923 	ld	-3 (ix),#0x00
   5CDE DD 6E FE      [19]  924 	ld	l,-2 (ix)
   5CE1 DD 66 FF      [19]  925 	ld	h,-1 (ix)
   5CE4 23            [ 6]  926 	inc	hl
   5CE5 23            [ 6]  927 	inc	hl
   5CE6 23            [ 6]  928 	inc	hl
   5CE7 7E            [ 7]  929 	ld	a,(hl)
   5CE8 DD 77 FE      [19]  930 	ld	-2 (ix), a
   5CEB DD 77 FE      [19]  931 	ld	-2 (ix),a
   5CEE DD 36 FF 00   [19]  932 	ld	-1 (ix),#0x00
   5CF2 DD 7E FC      [19]  933 	ld	a,-4 (ix)
   5CF5 DD 86 FE      [19]  934 	add	a, -2 (ix)
   5CF8 DD 77 FE      [19]  935 	ld	-2 (ix),a
   5CFB DD 7E FD      [19]  936 	ld	a,-3 (ix)
   5CFE DD 8E FF      [19]  937 	adc	a, -1 (ix)
   5D01 DD 77 FF      [19]  938 	ld	-1 (ix),a
   5D04 DD 7E FA      [19]  939 	ld	a,-6 (ix)
   5D07 DD 77 FA      [19]  940 	ld	-6 (ix),a
   5D0A DD 36 FB 00   [19]  941 	ld	-5 (ix),#0x00
   5D0E DD 7E FA      [19]  942 	ld	a,-6 (ix)
   5D11 DD 96 FE      [19]  943 	sub	a, -2 (ix)
   5D14 DD 7E FB      [19]  944 	ld	a,-5 (ix)
   5D17 DD 9E FF      [19]  945 	sbc	a, -1 (ix)
   5D1A E2 1F 5D      [10]  946 	jp	PO, 00127$
   5D1D EE 80         [ 7]  947 	xor	a, #0x80
   5D1F                     948 00127$:
   5D1F F2 6E 5D      [10]  949 	jp	P,00102$
                            950 ;src/game.c:258: col1->h + col1->y > col2->y) {
   5D22 DD 7E F8      [19]  951 	ld	a,-8 (ix)
   5D25 DD 77 FE      [19]  952 	ld	-2 (ix),a
   5D28 DD 7E F9      [19]  953 	ld	a,-7 (ix)
   5D2B DD 77 FF      [19]  954 	ld	-1 (ix),a
   5D2E DD 6E FE      [19]  955 	ld	l,-2 (ix)
   5D31 DD 66 FF      [19]  956 	ld	h,-1 (ix)
   5D34 23            [ 6]  957 	inc	hl
   5D35 23            [ 6]  958 	inc	hl
   5D36 23            [ 6]  959 	inc	hl
   5D37 7E            [ 7]  960 	ld	a,(hl)
   5D38 DD 77 FE      [19]  961 	ld	-2 (ix), a
   5D3B DD 77 FE      [19]  962 	ld	-2 (ix),a
   5D3E DD 36 FF 00   [19]  963 	ld	-1 (ix),#0x00
   5D42 DD 7E FE      [19]  964 	ld	a,-2 (ix)
   5D45 DD 86 FA      [19]  965 	add	a, -6 (ix)
   5D48 DD 77 FA      [19]  966 	ld	-6 (ix),a
   5D4B DD 7E FF      [19]  967 	ld	a,-1 (ix)
   5D4E DD 8E FB      [19]  968 	adc	a, -5 (ix)
   5D51 DD 77 FB      [19]  969 	ld	-5 (ix),a
   5D54 DD 7E FC      [19]  970 	ld	a,-4 (ix)
   5D57 DD 96 FA      [19]  971 	sub	a, -6 (ix)
   5D5A DD 7E FD      [19]  972 	ld	a,-3 (ix)
   5D5D DD 9E FB      [19]  973 	sbc	a, -5 (ix)
   5D60 E2 65 5D      [10]  974 	jp	PO, 00128$
   5D63 EE 80         [ 7]  975 	xor	a, #0x80
   5D65                     976 00128$:
   5D65 F2 6E 5D      [10]  977 	jp	P,00102$
                            978 ;src/game.c:260: collide = 1;
   5D68 DD 36 F7 01   [19]  979 	ld	-9 (ix),#0x01
   5D6C 18 04         [12]  980 	jr	00103$
   5D6E                     981 00102$:
                            982 ;src/game.c:262: collide = 0;
   5D6E DD 36 F7 00   [19]  983 	ld	-9 (ix),#0x00
   5D72                     984 00103$:
                            985 ;src/game.c:266: return collide;
   5D72 DD 6E F7      [19]  986 	ld	l,-9 (ix)
   5D75 DD F9         [10]  987 	ld	sp, ix
   5D77 DD E1         [14]  988 	pop	ix
   5D79 C9            [10]  989 	ret
                            990 ;src/game.c:269: void calculaColisiones(){
                            991 ;	---------------------------------
                            992 ; Function calculaColisiones
                            993 ; ---------------------------------
   5D7A                     994 _calculaColisiones::
   5D7A DD E5         [15]  995 	push	ix
   5D7C DD 21 00 00   [14]  996 	ld	ix,#0
   5D80 DD 39         [15]  997 	add	ix,sp
   5D82 21 F5 FF      [10]  998 	ld	hl,#-11
   5D85 39            [11]  999 	add	hl,sp
   5D86 F9            [ 6] 1000 	ld	sp,hl
                           1001 ;src/game.c:275: p = &player;
                           1002 ;src/game.c:276: enemigos = getEnemies();
   5D87 CD 5D 98      [17] 1003 	call	_getEnemies
   5D8A 33            [ 6] 1004 	inc	sp
   5D8B 33            [ 6] 1005 	inc	sp
   5D8C E5            [11] 1006 	push	hl
                           1007 ;src/game.c:277: bases = getBases();
   5D8D CD 61 98      [17] 1008 	call	_getBases
   5D90 DD 75 F7      [19] 1009 	ld	-9 (ix),l
   5D93 DD 74 F8      [19] 1010 	ld	-8 (ix),h
                           1011 ;src/game.c:279: for(i=0;i<NUM_ENEMIGOS;++i){
   5D96 DD 36 F9 00   [19] 1012 	ld	-7 (ix),#0x00
   5D9A DD 36 FE 00   [19] 1013 	ld	-2 (ix),#0x00
   5D9E DD 36 FF 00   [19] 1014 	ld	-1 (ix),#0x00
   5DA2 DD 36 FC 00   [19] 1015 	ld	-4 (ix),#0x00
   5DA6 DD 36 FD 00   [19] 1016 	ld	-3 (ix),#0x00
   5DAA                    1017 00131$:
                           1018 ;src/game.c:280: if(mapaActual == enemigos[i].ent.cuadrante && enemigos[i].ent.vivo == 1){
   5DAA DD 7E F5      [19] 1019 	ld	a,-11 (ix)
   5DAD DD 86 FC      [19] 1020 	add	a, -4 (ix)
   5DB0 DD 77 FA      [19] 1021 	ld	-6 (ix),a
   5DB3 DD 7E F6      [19] 1022 	ld	a,-10 (ix)
   5DB6 DD 8E FD      [19] 1023 	adc	a, -3 (ix)
   5DB9 DD 77 FB      [19] 1024 	ld	-5 (ix),a
   5DBC DD 6E FA      [19] 1025 	ld	l,-6 (ix)
   5DBF DD 66 FB      [19] 1026 	ld	h,-5 (ix)
   5DC2 11 42 00      [10] 1027 	ld	de, #0x0042
   5DC5 19            [11] 1028 	add	hl, de
   5DC6 4E            [ 7] 1029 	ld	c,(hl)
   5DC7 3A 8F 85      [13] 1030 	ld	a,(#_mapaActual + 0)
   5DCA 91            [ 4] 1031 	sub	a, c
   5DCB 20 32         [12] 1032 	jr	NZ,00104$
   5DCD DD 6E FA      [19] 1033 	ld	l,-6 (ix)
   5DD0 DD 66 FB      [19] 1034 	ld	h,-5 (ix)
   5DD3 11 41 00      [10] 1035 	ld	de, #0x0041
   5DD6 19            [11] 1036 	add	hl, de
   5DD7 4E            [ 7] 1037 	ld	c,(hl)
   5DD8 0D            [ 4] 1038 	dec	c
   5DD9 20 24         [12] 1039 	jr	NZ,00104$
                           1040 ;src/game.c:281: collide = checkCollision(&player.ent.coll, &enemigos[i].ent.coll);
   5DDB DD 7E FA      [19] 1041 	ld	a,-6 (ix)
   5DDE C6 3D         [ 7] 1042 	add	a, #0x3D
   5DE0 4F            [ 4] 1043 	ld	c,a
   5DE1 DD 7E FB      [19] 1044 	ld	a,-5 (ix)
   5DE4 CE 00         [ 7] 1045 	adc	a, #0x00
   5DE6 47            [ 4] 1046 	ld	b,a
   5DE7 C5            [11] 1047 	push	bc
   5DE8 21 15 59      [10] 1048 	ld	hl,#(_player + 0x003d)
   5DEB E5            [11] 1049 	push	hl
   5DEC CD 24 5C      [17] 1050 	call	_checkCollision
   5DEF F1            [10] 1051 	pop	af
   5DF0 F1            [10] 1052 	pop	af
                           1053 ;src/game.c:282: if(collide){
   5DF1 7D            [ 4] 1054 	ld	a,l
   5DF2 B7            [ 4] 1055 	or	a, a
   5DF3 28 0A         [12] 1056 	jr	Z,00104$
                           1057 ;src/game.c:283: playerHerido(&player);
   5DF5 21 D8 58      [10] 1058 	ld	hl,#_player
   5DF8 E5            [11] 1059 	push	hl
   5DF9 CD 61 8D      [17] 1060 	call	_playerHerido
   5DFC F1            [10] 1061 	pop	af
                           1062 ;src/game.c:284: break;
   5DFD 18 73         [12] 1063 	jr	00112$
   5DFF                    1064 00104$:
                           1065 ;src/game.c:287: if(enemigos[i].ent.vivo == 1 && enemigos[i].bullet.ent.cuadrante == mapaActual && enemigos[i].bullet.ent.vivo){
   5DFF DD 7E F5      [19] 1066 	ld	a,-11 (ix)
   5E02 DD 86 FE      [19] 1067 	add	a, -2 (ix)
   5E05 4F            [ 4] 1068 	ld	c,a
   5E06 DD 7E F6      [19] 1069 	ld	a,-10 (ix)
   5E09 DD 8E FF      [19] 1070 	adc	a, -1 (ix)
   5E0C 47            [ 4] 1071 	ld	b,a
   5E0D C5            [11] 1072 	push	bc
   5E0E FD E1         [14] 1073 	pop	iy
   5E10 FD 5E 41      [19] 1074 	ld	e,65 (iy)
   5E13 1D            [ 4] 1075 	dec	e
   5E14 20 31         [12] 1076 	jr	NZ,00132$
   5E16 C5            [11] 1077 	push	bc
   5E17 FD E1         [14] 1078 	pop	iy
   5E19 FD 5E 1F      [19] 1079 	ld	e,31 (iy)
   5E1C 3A 8F 85      [13] 1080 	ld	a,(#_mapaActual + 0)
   5E1F 93            [ 4] 1081 	sub	a, e
   5E20 20 25         [12] 1082 	jr	NZ,00132$
   5E22 C5            [11] 1083 	push	bc
   5E23 FD E1         [14] 1084 	pop	iy
   5E25 FD 7E 1E      [19] 1085 	ld	a,30 (iy)
   5E28 B7            [ 4] 1086 	or	a, a
   5E29 28 1C         [12] 1087 	jr	Z,00132$
                           1088 ;src/game.c:289: collide = checkCollision(&enemigos[i].bullet.ent.coll, &player.ent.coll);
   5E2B 21 1A 00      [10] 1089 	ld	hl,#0x001A
   5E2E 09            [11] 1090 	add	hl,bc
   5E2F 01 15 59      [10] 1091 	ld	bc,#(_player + 0x003d)
   5E32 C5            [11] 1092 	push	bc
   5E33 E5            [11] 1093 	push	hl
   5E34 CD 24 5C      [17] 1094 	call	_checkCollision
   5E37 F1            [10] 1095 	pop	af
   5E38 F1            [10] 1096 	pop	af
                           1097 ;src/game.c:290: if(collide){
   5E39 7D            [ 4] 1098 	ld	a,l
   5E3A B7            [ 4] 1099 	or	a, a
   5E3B 28 0A         [12] 1100 	jr	Z,00132$
                           1101 ;src/game.c:291: playerHerido(&player);
   5E3D 21 D8 58      [10] 1102 	ld	hl,#_player
   5E40 E5            [11] 1103 	push	hl
   5E41 CD 61 8D      [17] 1104 	call	_playerHerido
   5E44 F1            [10] 1105 	pop	af
                           1106 ;src/game.c:292: break;
   5E45 18 2B         [12] 1107 	jr	00112$
   5E47                    1108 00132$:
                           1109 ;src/game.c:279: for(i=0;i<NUM_ENEMIGOS;++i){
   5E47 DD 7E FE      [19] 1110 	ld	a,-2 (ix)
   5E4A C6 4E         [ 7] 1111 	add	a, #0x4E
   5E4C DD 77 FE      [19] 1112 	ld	-2 (ix),a
   5E4F DD 7E FF      [19] 1113 	ld	a,-1 (ix)
   5E52 CE 00         [ 7] 1114 	adc	a, #0x00
   5E54 DD 77 FF      [19] 1115 	ld	-1 (ix),a
   5E57 DD 7E FC      [19] 1116 	ld	a,-4 (ix)
   5E5A C6 4E         [ 7] 1117 	add	a, #0x4E
   5E5C DD 77 FC      [19] 1118 	ld	-4 (ix),a
   5E5F DD 7E FD      [19] 1119 	ld	a,-3 (ix)
   5E62 CE 00         [ 7] 1120 	adc	a, #0x00
   5E64 DD 77 FD      [19] 1121 	ld	-3 (ix),a
   5E67 DD 34 F9      [23] 1122 	inc	-7 (ix)
   5E6A DD 7E F9      [19] 1123 	ld	a,-7 (ix)
   5E6D D6 03         [ 7] 1124 	sub	a, #0x03
   5E6F DA AA 5D      [10] 1125 	jp	C,00131$
   5E72                    1126 00112$:
                           1127 ;src/game.c:298: if(player.bullet.ent.vivo == SI){
   5E72 21 F6 58      [10] 1128 	ld	hl, #_player + 30
   5E75 4E            [ 7] 1129 	ld	c,(hl)
                           1130 ;src/game.c:310: p->puntuacion = p->puntuacion + 100;
                           1131 ;src/game.c:298: if(player.bullet.ent.vivo == SI){
   5E76 0D            [ 4] 1132 	dec	c
   5E77 C2 53 5F      [10] 1133 	jp	NZ,00120$
                           1134 ;src/game.c:300: for(i=0;i<NUM_ENEMIGOS;++i){
   5E7A DD 36 F9 00   [19] 1135 	ld	-7 (ix),#0x00
   5E7E DD 36 FA 00   [19] 1136 	ld	-6 (ix),#0x00
   5E82 DD 36 FB 00   [19] 1137 	ld	-5 (ix),#0x00
   5E86                    1138 00133$:
                           1139 ;src/game.c:301: if(mapaActual == enemigos[i].ent.cuadrante && enemigos[i].ent.vivo == 1){
   5E86 DD 7E F5      [19] 1140 	ld	a,-11 (ix)
   5E89 DD 86 FA      [19] 1141 	add	a, -6 (ix)
   5E8C 4F            [ 4] 1142 	ld	c,a
   5E8D DD 7E F6      [19] 1143 	ld	a,-10 (ix)
   5E90 DD 8E FB      [19] 1144 	adc	a, -5 (ix)
   5E93 47            [ 4] 1145 	ld	b,a
   5E94 21 26 00      [10] 1146 	ld	hl,#0x0026
   5E97 09            [11] 1147 	add	hl,bc
   5E98 EB            [ 4] 1148 	ex	de,hl
   5E99 C5            [11] 1149 	push	bc
   5E9A FD E1         [14] 1150 	pop	iy
   5E9C FD 7E 42      [19] 1151 	ld	a,66 (iy)
   5E9F DD 77 FC      [19] 1152 	ld	-4 (ix),a
   5EA2 3A 8F 85      [13] 1153 	ld	a,(#_mapaActual + 0)
   5EA5 DD 96 FC      [19] 1154 	sub	a, -4 (ix)
   5EA8 C2 38 5F      [10] 1155 	jp	NZ,00134$
   5EAB 21 41 00      [10] 1156 	ld	hl,#0x0041
   5EAE 09            [11] 1157 	add	hl,bc
   5EAF DD 75 FC      [19] 1158 	ld	-4 (ix),l
   5EB2 DD 74 FD      [19] 1159 	ld	-3 (ix),h
   5EB5 DD 6E FC      [19] 1160 	ld	l,-4 (ix)
   5EB8 DD 66 FD      [19] 1161 	ld	h,-3 (ix)
   5EBB 6E            [ 7] 1162 	ld	l,(hl)
   5EBC 2D            [ 4] 1163 	dec	l
   5EBD 20 79         [12] 1164 	jr	NZ,00134$
                           1165 ;src/game.c:302: collide = checkCollision(&player.bullet.ent.coll, &enemigos[i].ent.coll);
   5EBF 21 3D 00      [10] 1166 	ld	hl,#0x003D
   5EC2 09            [11] 1167 	add	hl,bc
   5EC3 C5            [11] 1168 	push	bc
   5EC4 D5            [11] 1169 	push	de
   5EC5 E5            [11] 1170 	push	hl
   5EC6 21 F2 58      [10] 1171 	ld	hl,#(_player + 0x001a)
   5EC9 E5            [11] 1172 	push	hl
   5ECA CD 24 5C      [17] 1173 	call	_checkCollision
   5ECD F1            [10] 1174 	pop	af
   5ECE F1            [10] 1175 	pop	af
   5ECF D1            [10] 1176 	pop	de
   5ED0 C1            [10] 1177 	pop	bc
                           1178 ;src/game.c:303: if(collide){
   5ED1 7D            [ 4] 1179 	ld	a,l
   5ED2 B7            [ 4] 1180 	or	a, a
   5ED3 28 63         [12] 1181 	jr	Z,00134$
                           1182 ;src/game.c:305: explosionBala(&player.bullet);
   5ED5 C5            [11] 1183 	push	bc
   5ED6 D5            [11] 1184 	push	de
   5ED7 21 D8 58      [10] 1185 	ld	hl,#_player
   5EDA E5            [11] 1186 	push	hl
   5EDB CD B5 63      [17] 1187 	call	_explosionBala
   5EDE F1            [10] 1188 	pop	af
   5EDF CD 42 6A      [17] 1189 	call	_restarEnemigo
   5EE2 D1            [10] 1190 	pop	de
   5EE3 D5            [11] 1191 	push	de
   5EE4 3E 01         [ 7] 1192 	ld	a,#0x01
   5EE6 F5            [11] 1193 	push	af
   5EE7 33            [ 6] 1194 	inc	sp
   5EE8 D5            [11] 1195 	push	de
   5EE9 CD F8 94      [17] 1196 	call	_calculaEntity
   5EEC F1            [10] 1197 	pop	af
   5EED 33            [ 6] 1198 	inc	sp
   5EEE D1            [10] 1199 	pop	de
   5EEF C1            [10] 1200 	pop	bc
                           1201 ;src/game.c:308: enemigos[i].ent.draw = SI;
   5EF0 21 30 00      [10] 1202 	ld	hl,#0x0030
   5EF3 09            [11] 1203 	add	hl,bc
   5EF4 DD 75 FE      [19] 1204 	ld	-2 (ix),l
   5EF7 DD 74 FF      [19] 1205 	ld	-1 (ix),h
   5EFA DD 6E FE      [19] 1206 	ld	l,-2 (ix)
   5EFD DD 66 FF      [19] 1207 	ld	h,-1 (ix)
   5F00 36 01         [10] 1208 	ld	(hl),#0x01
                           1209 ;src/game.c:309: borrarEntity(&enemigos[i].ent);
   5F02 C5            [11] 1210 	push	bc
   5F03 D5            [11] 1211 	push	de
   5F04 CD 46 94      [17] 1212 	call	_borrarEntity
   5F07 F1            [10] 1213 	pop	af
   5F08 C1            [10] 1214 	pop	bc
                           1215 ;src/game.c:310: p->puntuacion = p->puntuacion + 100;
   5F09 ED 5B 23 59   [20] 1216 	ld	de, (#(_player + 0x004b) + 0)
   5F0D 21 64 00      [10] 1217 	ld	hl,#0x0064
   5F10 19            [11] 1218 	add	hl,de
   5F11 5D            [ 4] 1219 	ld	e,l
   5F12 54            [ 4] 1220 	ld	d,h
   5F13 ED 53 23 59   [20] 1221 	ld	((_player + 0x004b)), de
                           1222 ;src/game.c:311: enemigos[i].ent.vivo = 0;
   5F17 DD 6E FC      [19] 1223 	ld	l,-4 (ix)
   5F1A DD 66 FD      [19] 1224 	ld	h,-3 (ix)
   5F1D 36 00         [10] 1225 	ld	(hl),#0x00
                           1226 ;src/game.c:312: enemigos[i].ent.draw = NO;
   5F1F DD 6E FE      [19] 1227 	ld	l,-2 (ix)
   5F22 DD 66 FF      [19] 1228 	ld	h,-1 (ix)
   5F25 36 00         [10] 1229 	ld	(hl),#0x00
                           1230 ;src/game.c:313: enemigos[i].bullet.ent.vivo = NO;
   5F27 21 1E 00      [10] 1231 	ld	hl,#0x001E
   5F2A 09            [11] 1232 	add	hl,bc
   5F2B 36 00         [10] 1233 	ld	(hl),#0x00
                           1234 ;src/game.c:314: enemigos[i].bullet.ent.draw = NO;
   5F2D 21 0D 00      [10] 1235 	ld	hl,#0x000D
   5F30 09            [11] 1236 	add	hl,bc
   5F31 36 00         [10] 1237 	ld	(hl),#0x00
                           1238 ;src/game.c:316: resetearTimepoEnMapa();
   5F33 CD C7 65      [17] 1239 	call	_resetearTimepoEnMapa
                           1240 ;src/game.c:317: break;
   5F36 18 1B         [12] 1241 	jr	00120$
   5F38                    1242 00134$:
                           1243 ;src/game.c:300: for(i=0;i<NUM_ENEMIGOS;++i){
   5F38 DD 7E FA      [19] 1244 	ld	a,-6 (ix)
   5F3B C6 4E         [ 7] 1245 	add	a, #0x4E
   5F3D DD 77 FA      [19] 1246 	ld	-6 (ix),a
   5F40 DD 7E FB      [19] 1247 	ld	a,-5 (ix)
   5F43 CE 00         [ 7] 1248 	adc	a, #0x00
   5F45 DD 77 FB      [19] 1249 	ld	-5 (ix),a
   5F48 DD 34 F9      [23] 1250 	inc	-7 (ix)
   5F4B DD 7E F9      [19] 1251 	ld	a,-7 (ix)
   5F4E D6 03         [ 7] 1252 	sub	a, #0x03
   5F50 DA 86 5E      [10] 1253 	jp	C,00133$
   5F53                    1254 00120$:
                           1255 ;src/game.c:326: collide = checkCollision(&player.ent.coll, &bases[mapaActual].ent.coll);
   5F53 ED 4B 8F 85   [20] 1256 	ld	bc,(_mapaActual)
   5F57 06 00         [ 7] 1257 	ld	b,#0x00
   5F59 69            [ 4] 1258 	ld	l, c
   5F5A 60            [ 4] 1259 	ld	h, b
   5F5B 29            [11] 1260 	add	hl, hl
   5F5C 29            [11] 1261 	add	hl, hl
   5F5D 29            [11] 1262 	add	hl, hl
   5F5E 09            [11] 1263 	add	hl, bc
   5F5F 29            [11] 1264 	add	hl, hl
   5F60 09            [11] 1265 	add	hl, bc
   5F61 29            [11] 1266 	add	hl, hl
   5F62 09            [11] 1267 	add	hl, bc
   5F63 DD 5E F7      [19] 1268 	ld	e,-9 (ix)
   5F66 DD 56 F8      [19] 1269 	ld	d,-8 (ix)
   5F69 19            [11] 1270 	add	hl,de
   5F6A 01 1B 00      [10] 1271 	ld	bc,#0x001B
   5F6D 09            [11] 1272 	add	hl,bc
   5F6E E5            [11] 1273 	push	hl
   5F6F 21 15 59      [10] 1274 	ld	hl,#(_player + 0x003d)
   5F72 E5            [11] 1275 	push	hl
   5F73 CD 24 5C      [17] 1276 	call	_checkCollision
   5F76 F1            [10] 1277 	pop	af
   5F77 F1            [10] 1278 	pop	af
                           1279 ;src/game.c:328: if(collide){
   5F78 7D            [ 4] 1280 	ld	a, l
   5F79 B7            [ 4] 1281 	or	a, a
   5F7A CA 7D 60      [10] 1282 	jp	Z,00135$
                           1283 ;src/game.c:329: bases[mapaActual].ent.draw = SI;
   5F7D ED 4B 8F 85   [20] 1284 	ld	bc,(_mapaActual)
   5F81 06 00         [ 7] 1285 	ld	b,#0x00
   5F83 69            [ 4] 1286 	ld	l, c
   5F84 60            [ 4] 1287 	ld	h, b
   5F85 29            [11] 1288 	add	hl, hl
   5F86 29            [11] 1289 	add	hl, hl
   5F87 29            [11] 1290 	add	hl, hl
   5F88 09            [11] 1291 	add	hl, bc
   5F89 29            [11] 1292 	add	hl, hl
   5F8A 09            [11] 1293 	add	hl, bc
   5F8B 29            [11] 1294 	add	hl, hl
   5F8C 09            [11] 1295 	add	hl, bc
   5F8D DD 5E F7      [19] 1296 	ld	e,-9 (ix)
   5F90 DD 56 F8      [19] 1297 	ld	d,-8 (ix)
   5F93 19            [11] 1298 	add	hl,de
   5F94 01 0E 00      [10] 1299 	ld	bc,#0x000E
   5F97 09            [11] 1300 	add	hl,bc
   5F98 36 01         [10] 1301 	ld	(hl),#0x01
                           1302 ;src/game.c:330: p->ent.draw = SI;
   5F9A 21 08 59      [10] 1303 	ld	hl,#(_player + 0x0030)
   5F9D 36 01         [10] 1304 	ld	(hl),#0x01
                           1305 ;src/game.c:333: if(bases[mapaActual].whom == 1){
   5F9F ED 4B 8F 85   [20] 1306 	ld	bc,(_mapaActual)
   5FA3 06 00         [ 7] 1307 	ld	b,#0x00
   5FA5 69            [ 4] 1308 	ld	l, c
   5FA6 60            [ 4] 1309 	ld	h, b
   5FA7 29            [11] 1310 	add	hl, hl
   5FA8 29            [11] 1311 	add	hl, hl
   5FA9 29            [11] 1312 	add	hl, hl
   5FAA 09            [11] 1313 	add	hl, bc
   5FAB 29            [11] 1314 	add	hl, hl
   5FAC 09            [11] 1315 	add	hl, bc
   5FAD 29            [11] 1316 	add	hl, hl
   5FAE 09            [11] 1317 	add	hl, bc
   5FAF DD 5E F7      [19] 1318 	ld	e,-9 (ix)
   5FB2 DD 56 F8      [19] 1319 	ld	d,-8 (ix)
   5FB5 19            [11] 1320 	add	hl,de
   5FB6 4E            [ 7] 1321 	ld	c,(hl)
   5FB7 0D            [ 4] 1322 	dec	c
   5FB8 C2 7D 60      [10] 1323 	jp	NZ,00135$
                           1324 ;src/game.c:335: bases[mapaActual].cycles++;
   5FBB 23            [ 6] 1325 	inc	hl
   5FBC 23            [ 6] 1326 	inc	hl
   5FBD 23            [ 6] 1327 	inc	hl
   5FBE 4E            [ 7] 1328 	ld	c,(hl)
   5FBF 0C            [ 4] 1329 	inc	c
   5FC0 71            [ 7] 1330 	ld	(hl),c
                           1331 ;src/game.c:336: if(bases[mapaActual].cycles >= bases[mapaActual].waitCycles){
   5FC1 ED 4B 8F 85   [20] 1332 	ld	bc,(_mapaActual)
   5FC5 06 00         [ 7] 1333 	ld	b,#0x00
   5FC7 69            [ 4] 1334 	ld	l, c
   5FC8 60            [ 4] 1335 	ld	h, b
   5FC9 29            [11] 1336 	add	hl, hl
   5FCA 29            [11] 1337 	add	hl, hl
   5FCB 29            [11] 1338 	add	hl, hl
   5FCC 09            [11] 1339 	add	hl, bc
   5FCD 29            [11] 1340 	add	hl, hl
   5FCE 09            [11] 1341 	add	hl, bc
   5FCF 29            [11] 1342 	add	hl, hl
   5FD0 09            [11] 1343 	add	hl, bc
   5FD1 7D            [ 4] 1344 	ld	a,l
   5FD2 DD 86 F7      [19] 1345 	add	a, -9 (ix)
   5FD5 4F            [ 4] 1346 	ld	c,a
   5FD6 7C            [ 4] 1347 	ld	a,h
   5FD7 DD 8E F8      [19] 1348 	adc	a, -8 (ix)
   5FDA 47            [ 4] 1349 	ld	b,a
   5FDB 69            [ 4] 1350 	ld	l, c
   5FDC 60            [ 4] 1351 	ld	h, b
   5FDD 23            [ 6] 1352 	inc	hl
   5FDE 23            [ 6] 1353 	inc	hl
   5FDF 23            [ 6] 1354 	inc	hl
   5FE0 5E            [ 7] 1355 	ld	e,(hl)
   5FE1 69            [ 4] 1356 	ld	l, c
   5FE2 60            [ 4] 1357 	ld	h, b
   5FE3 23            [ 6] 1358 	inc	hl
   5FE4 23            [ 6] 1359 	inc	hl
   5FE5 4E            [ 7] 1360 	ld	c,(hl)
   5FE6 7B            [ 4] 1361 	ld	a,e
   5FE7 91            [ 4] 1362 	sub	a, c
   5FE8 DA 7D 60      [10] 1363 	jp	C,00135$
                           1364 ;src/game.c:338: basesCapturadas++; //Aumentamos la cuenta de bases capturadas
   5FEB FD 21 92 85   [14] 1365 	ld	iy,#_basesCapturadas
   5FEF FD 34 00      [23] 1366 	inc	0 (iy)
                           1367 ;src/game.c:340: if(wshot_cycles >= 5)
   5FF2 3A 94 85      [13] 1368 	ld	a,(#_wshot_cycles + 0)
   5FF5 D6 05         [ 7] 1369 	sub	a, #0x05
   5FF7 38 07         [12] 1370 	jr	C,00122$
                           1371 ;src/game.c:341: wshot_cycles -= 7;
   5FF9 21 94 85      [10] 1372 	ld	hl,#_wshot_cycles
   5FFC 7E            [ 7] 1373 	ld	a,(hl)
   5FFD C6 F9         [ 7] 1374 	add	a,#0xF9
   5FFF 77            [ 7] 1375 	ld	(hl),a
   6000                    1376 00122$:
                           1377 ;src/game.c:342: p->puntuacion = p->puntuacion + 500;
   6000 ED 4B 23 59   [20] 1378 	ld	bc, (#(_player + 0x004b) + 0)
   6004 21 F4 01      [10] 1379 	ld	hl,#0x01F4
   6007 09            [11] 1380 	add	hl,bc
   6008 4D            [ 4] 1381 	ld	c,l
   6009 44            [ 4] 1382 	ld	b,h
   600A ED 43 23 59   [20] 1383 	ld	((_player + 0x004b)), bc
                           1384 ;src/game.c:343: bases[mapaActual].whom = 0;
   600E ED 4B 8F 85   [20] 1385 	ld	bc,(_mapaActual)
   6012 06 00         [ 7] 1386 	ld	b,#0x00
   6014 69            [ 4] 1387 	ld	l, c
   6015 60            [ 4] 1388 	ld	h, b
   6016 29            [11] 1389 	add	hl, hl
   6017 29            [11] 1390 	add	hl, hl
   6018 29            [11] 1391 	add	hl, hl
   6019 09            [11] 1392 	add	hl, bc
   601A 29            [11] 1393 	add	hl, hl
   601B 09            [11] 1394 	add	hl, bc
   601C 29            [11] 1395 	add	hl, hl
   601D 09            [11] 1396 	add	hl, bc
   601E DD 5E F7      [19] 1397 	ld	e,-9 (ix)
   6021 DD 56 F8      [19] 1398 	ld	d,-8 (ix)
   6024 19            [11] 1399 	add	hl,de
   6025 36 00         [10] 1400 	ld	(hl),#0x00
                           1401 ;src/game.c:344: bases[mapaActual].ent.sprites[0] = g_capturada;
   6027 ED 4B 8F 85   [20] 1402 	ld	bc,(_mapaActual)
   602B 06 00         [ 7] 1403 	ld	b,#0x00
   602D 69            [ 4] 1404 	ld	l, c
   602E 60            [ 4] 1405 	ld	h, b
   602F 29            [11] 1406 	add	hl, hl
   6030 29            [11] 1407 	add	hl, hl
   6031 29            [11] 1408 	add	hl, hl
   6032 09            [11] 1409 	add	hl, bc
   6033 29            [11] 1410 	add	hl, hl
   6034 09            [11] 1411 	add	hl, bc
   6035 29            [11] 1412 	add	hl, hl
   6036 09            [11] 1413 	add	hl, bc
   6037 DD 5E F7      [19] 1414 	ld	e,-9 (ix)
   603A DD 56 F8      [19] 1415 	ld	d,-8 (ix)
   603D 19            [11] 1416 	add	hl,de
   603E 01 0F 00      [10] 1417 	ld	bc,#0x000F
   6041 09            [11] 1418 	add	hl,bc
   6042 01 62 6B      [10] 1419 	ld	bc,#_g_capturada+0
   6045 71            [ 7] 1420 	ld	(hl),c
   6046 23            [ 6] 1421 	inc	hl
   6047 70            [ 7] 1422 	ld	(hl),b
                           1423 ;src/game.c:345: bases[mapaActual].ent.draw = SI;
   6048 ED 4B 8F 85   [20] 1424 	ld	bc,(_mapaActual)
   604C 06 00         [ 7] 1425 	ld	b,#0x00
   604E 69            [ 4] 1426 	ld	l, c
   604F 60            [ 4] 1427 	ld	h, b
   6050 29            [11] 1428 	add	hl, hl
   6051 29            [11] 1429 	add	hl, hl
   6052 29            [11] 1430 	add	hl, hl
   6053 09            [11] 1431 	add	hl, bc
   6054 29            [11] 1432 	add	hl, hl
   6055 09            [11] 1433 	add	hl, bc
   6056 29            [11] 1434 	add	hl, hl
   6057 09            [11] 1435 	add	hl, bc
   6058 DD 5E F7      [19] 1436 	ld	e,-9 (ix)
   605B DD 56 F8      [19] 1437 	ld	d,-8 (ix)
   605E 19            [11] 1438 	add	hl,de
   605F 01 0E 00      [10] 1439 	ld	bc,#0x000E
   6062 09            [11] 1440 	add	hl,bc
   6063 36 01         [10] 1441 	ld	(hl),#0x01
                           1442 ;src/game.c:346: if(p->vida + 1 <= 3){
   6065 21 21 59      [10] 1443 	ld	hl,#_player + 73
   6068 4E            [ 7] 1444 	ld	c,(hl)
   6069 59            [ 4] 1445 	ld	e,c
   606A 16 00         [ 7] 1446 	ld	d,#0x00
   606C 13            [ 6] 1447 	inc	de
   606D 3E 03         [ 7] 1448 	ld	a,#0x03
   606F BB            [ 4] 1449 	cp	a, e
   6070 3E 00         [ 7] 1450 	ld	a,#0x00
   6072 9A            [ 4] 1451 	sbc	a, d
   6073 E2 78 60      [10] 1452 	jp	PO, 00225$
   6076 EE 80         [ 7] 1453 	xor	a, #0x80
   6078                    1454 00225$:
   6078 FA 7D 60      [10] 1455 	jp	M,00135$
                           1456 ;src/game.c:347: p->vida++;
   607B 0C            [ 4] 1457 	inc	c
   607C 71            [ 7] 1458 	ld	(hl),c
   607D                    1459 00135$:
   607D DD F9         [10] 1460 	ld	sp, ix
   607F DD E1         [14] 1461 	pop	ix
   6081 C9            [10] 1462 	ret
                           1463 ;src/game.c:362: void drawHUD(){
                           1464 ;	---------------------------------
                           1465 ; Function drawHUD
                           1466 ; ---------------------------------
   6082                    1467 _drawHUD::
                           1468 ;src/game.c:364: TPlayer* p = &player;
                           1469 ;src/game.c:365: TEntity* ent = &hearth;
                           1470 ;src/game.c:367: if(player.vida != player.pvida){
   6082 21 21 59      [10] 1471 	ld	hl, #(_player + 0x0049) + 0
   6085 4E            [ 7] 1472 	ld	c,(hl)
   6086 21 22 59      [10] 1473 	ld	hl, #_player + 74
   6089 46            [ 7] 1474 	ld	b,(hl)
   608A 79            [ 4] 1475 	ld	a,c
   608B 90            [ 4] 1476 	sub	a, b
   608C CA 17 61      [10] 1477 	jp	Z,00106$
                           1478 ;src/game.c:370: ent->vmem = cpct_getScreenPtr(CPCT_VMEM_START,ent->x, ent->y);
                           1479 ;src/game.c:371: dibujarEntity(ent,ent->sw,ent->sh);
                           1480 ;src/game.c:368: if(player.vida > player.pvida){
   608F 78            [ 4] 1481 	ld	a,b
   6090 91            [ 4] 1482 	sub	a, c
   6091 30 4B         [12] 1483 	jr	NC,00103$
                           1484 ;src/game.c:369: for(i = 0; i < player.vida; ++i){
   6093 0E 00         [ 7] 1485 	ld	c,#0x00
   6095                    1486 00108$:
   6095 21 21 59      [10] 1487 	ld	hl, #(_player + 0x0049) + 0
   6098 46            [ 7] 1488 	ld	b,(hl)
   6099 79            [ 4] 1489 	ld	a,c
   609A 90            [ 4] 1490 	sub	a, b
   609B 30 6C         [12] 1491 	jr	NC,00104$
                           1492 ;src/game.c:370: ent->vmem = cpct_getScreenPtr(CPCT_VMEM_START,ent->x, ent->y);
   609D 2A 29 59      [16] 1493 	ld	hl, (#(_hearth + 0x0002) + 0)
   60A0 45            [ 4] 1494 	ld	b,l
   60A1 2A 27 59      [16] 1495 	ld	hl, (#_hearth + 0)
   60A4 7D            [ 4] 1496 	ld	a,l
   60A5 C5            [11] 1497 	push	bc
   60A6 C5            [11] 1498 	push	bc
   60A7 33            [ 6] 1499 	inc	sp
   60A8 F5            [11] 1500 	push	af
   60A9 33            [ 6] 1501 	inc	sp
   60AA 21 00 C0      [10] 1502 	ld	hl,#0xC000
   60AD E5            [11] 1503 	push	hl
   60AE CD 38 7A      [17] 1504 	call	_cpct_getScreenPtr
   60B1 5D            [ 4] 1505 	ld	e,l
   60B2 54            [ 4] 1506 	ld	d,h
   60B3 C1            [10] 1507 	pop	bc
   60B4 ED 53 48 59   [20] 1508 	ld	((_hearth + 0x0021)), de
                           1509 ;src/game.c:371: dibujarEntity(ent,ent->sw,ent->sh);
   60B8 21 3B 59      [10] 1510 	ld	hl, #(_hearth + 0x0014) + 0
   60BB 46            [ 7] 1511 	ld	b,(hl)
   60BC 21 3A 59      [10] 1512 	ld	hl, #(_hearth + 0x0013) + 0
   60BF 56            [ 7] 1513 	ld	d,(hl)
   60C0 C5            [11] 1514 	push	bc
   60C1 4A            [ 4] 1515 	ld	c, d
   60C2 C5            [11] 1516 	push	bc
   60C3 21 27 59      [10] 1517 	ld	hl,#_hearth
   60C6 E5            [11] 1518 	push	hl
   60C7 CD AC 94      [17] 1519 	call	_dibujarEntity
   60CA F1            [10] 1520 	pop	af
   60CB F1            [10] 1521 	pop	af
   60CC C1            [10] 1522 	pop	bc
                           1523 ;src/game.c:372: ent->x+=10;
   60CD ED 5B 27 59   [20] 1524 	ld	de, (#_hearth + 0)
   60D1 21 0A 00      [10] 1525 	ld	hl,#0x000A
   60D4 19            [11] 1526 	add	hl,de
   60D5 5D            [ 4] 1527 	ld	e,l
   60D6 54            [ 4] 1528 	ld	d,h
   60D7 ED 53 27 59   [20] 1529 	ld	(_hearth), de
                           1530 ;src/game.c:369: for(i = 0; i < player.vida; ++i){
   60DB 0C            [ 4] 1531 	inc	c
   60DC 18 B7         [12] 1532 	jr	00108$
   60DE                    1533 00103$:
                           1534 ;src/game.c:380: ,ent->sh
   60DE 21 3B 59      [10] 1535 	ld	hl, #(_hearth + 0x0014) + 0
   60E1 56            [ 7] 1536 	ld	d,(hl)
                           1537 ;src/game.c:379: ,ent->sw
   60E2 21 3A 59      [10] 1538 	ld	hl, #(_hearth + 0x0013) + 0
   60E5 5E            [ 7] 1539 	ld	e,(hl)
                           1540 ;src/game.c:377: cpct_getScreenPtr(CPCT_VMEM_START,2 + 10*(player.vida),ent->y)
   60E6 2A 29 59      [16] 1541 	ld	hl, (#(_hearth + 0x0002) + 0)
   60E9 45            [ 4] 1542 	ld	b,l
   60EA 79            [ 4] 1543 	ld	a,c
   60EB 87            [ 4] 1544 	add	a, a
   60EC 87            [ 4] 1545 	add	a, a
   60ED 81            [ 4] 1546 	add	a, c
   60EE 87            [ 4] 1547 	add	a, a
   60EF C6 02         [ 7] 1548 	add	a, #0x02
   60F1 D5            [11] 1549 	push	de
   60F2 C5            [11] 1550 	push	bc
   60F3 33            [ 6] 1551 	inc	sp
   60F4 F5            [11] 1552 	push	af
   60F5 33            [ 6] 1553 	inc	sp
   60F6 21 00 C0      [10] 1554 	ld	hl,#0xC000
   60F9 E5            [11] 1555 	push	hl
   60FA CD 38 7A      [17] 1556 	call	_cpct_getScreenPtr
   60FD 4D            [ 4] 1557 	ld	c,l
   60FE 44            [ 4] 1558 	ld	b,h
   60FF AF            [ 4] 1559 	xor	a, a
   6100 F5            [11] 1560 	push	af
   6101 33            [ 6] 1561 	inc	sp
   6102 C5            [11] 1562 	push	bc
   6103 CD 23 79      [17] 1563 	call	_cpct_drawSolidBox
   6106 F1            [10] 1564 	pop	af
   6107 F1            [10] 1565 	pop	af
   6108 33            [ 6] 1566 	inc	sp
   6109                    1567 00104$:
                           1568 ;src/game.c:383: ent->x = 2;
   6109 21 02 00      [10] 1569 	ld	hl,#0x0002
   610C 22 27 59      [16] 1570 	ld	(_hearth), hl
                           1571 ;src/game.c:384: p->pvida = p->vida;
   610F 21 21 59      [10] 1572 	ld	hl,#_player + 73
   6112 4E            [ 7] 1573 	ld	c, (hl)
   6113 21 22 59      [10] 1574 	ld	hl,#(_player + 0x004a)
   6116 71            [ 7] 1575 	ld	(hl),c
   6117                    1576 00106$:
                           1577 ;src/game.c:387: dibujarPuntos();
   6117 CD 91 61      [17] 1578 	call	_dibujarPuntos
                           1579 ;src/game.c:388: dibujarBase();
   611A CD 1E 61      [17] 1580 	call	_dibujarBase
   611D C9            [10] 1581 	ret
                           1582 ;src/game.c:390: void dibujarBase(){
                           1583 ;	---------------------------------
                           1584 ; Function dibujarBase
                           1585 ; ---------------------------------
   611E                    1586 _dibujarBase::
   611E DD E5         [15] 1587 	push	ix
   6120 DD 21 00 00   [14] 1588 	ld	ix,#0
   6124 DD 39         [15] 1589 	add	ix,sp
   6126 F5            [11] 1590 	push	af
   6127 F5            [11] 1591 	push	af
                           1592 ;src/game.c:392: if(basesCapturadas != prev_basesCapturadas){
   6128 3A 92 85      [13] 1593 	ld	a,(#_basesCapturadas + 0)
   612B FD 21 93 85   [14] 1594 	ld	iy,#_prev_basesCapturadas
   612F FD 96 00      [19] 1595 	sub	a, 0 (iy)
   6132 28 55         [12] 1596 	jr	Z,00103$
                           1597 ;src/game.c:395: cpct_getScreenPtr(CPCT_VMEM_START,71,5)
   6134 21 47 05      [10] 1598 	ld	hl,#0x0547
   6137 E5            [11] 1599 	push	hl
   6138 21 00 C0      [10] 1600 	ld	hl,#0xC000
   613B E5            [11] 1601 	push	hl
   613C CD 38 7A      [17] 1602 	call	_cpct_getScreenPtr
   613F 4D            [ 4] 1603 	ld	c,l
   6140 44            [ 4] 1604 	ld	b,h
   6141 21 06 08      [10] 1605 	ld	hl,#0x0806
   6144 E5            [11] 1606 	push	hl
   6145 AF            [ 4] 1607 	xor	a, a
   6146 F5            [11] 1608 	push	af
   6147 33            [ 6] 1609 	inc	sp
   6148 C5            [11] 1610 	push	bc
   6149 CD 23 79      [17] 1611 	call	_cpct_drawSolidBox
   614C F1            [10] 1612 	pop	af
   614D F1            [10] 1613 	pop	af
   614E 33            [ 6] 1614 	inc	sp
                           1615 ;src/game.c:400: sprintf(strPts,"%d",basesCapturadas);
   614F 21 92 85      [10] 1616 	ld	hl,#_basesCapturadas + 0
   6152 5E            [ 7] 1617 	ld	e, (hl)
   6153 16 00         [ 7] 1618 	ld	d,#0x00
   6155 21 00 00      [10] 1619 	ld	hl,#0x0000
   6158 39            [11] 1620 	add	hl,sp
   6159 E5            [11] 1621 	push	hl
   615A D5            [11] 1622 	push	de
   615B 11 8E 61      [10] 1623 	ld	de,#___str_2
   615E D5            [11] 1624 	push	de
   615F E5            [11] 1625 	push	hl
   6160 CD 0C 70      [17] 1626 	call	_sprintf
   6163 21 06 00      [10] 1627 	ld	hl,#6
   6166 39            [11] 1628 	add	hl,sp
   6167 F9            [ 6] 1629 	ld	sp,hl
   6168 21 47 05      [10] 1630 	ld	hl,#0x0547
   616B E5            [11] 1631 	push	hl
   616C 21 00 C0      [10] 1632 	ld	hl,#0xC000
   616F E5            [11] 1633 	push	hl
   6170 CD 38 7A      [17] 1634 	call	_cpct_getScreenPtr
   6173 EB            [ 4] 1635 	ex	de,hl
   6174 C1            [10] 1636 	pop	bc
   6175 21 02 00      [10] 1637 	ld	hl,#0x0002
   6178 E5            [11] 1638 	push	hl
   6179 D5            [11] 1639 	push	de
   617A C5            [11] 1640 	push	bc
   617B CD 4B 6D      [17] 1641 	call	_cpct_drawStringM0
   617E 21 06 00      [10] 1642 	ld	hl,#6
   6181 39            [11] 1643 	add	hl,sp
   6182 F9            [ 6] 1644 	ld	sp,hl
                           1645 ;src/game.c:402: prev_basesCapturadas = basesCapturadas;
   6183 3A 92 85      [13] 1646 	ld	a,(#_basesCapturadas + 0)
   6186 32 93 85      [13] 1647 	ld	(#_prev_basesCapturadas + 0),a
   6189                    1648 00103$:
   6189 DD F9         [10] 1649 	ld	sp, ix
   618B DD E1         [14] 1650 	pop	ix
   618D C9            [10] 1651 	ret
   618E                    1652 ___str_2:
   618E 25 64              1653 	.ascii "%d"
   6190 00                 1654 	.db 0x00
                           1655 ;src/game.c:405: void dibujarPuntos(){
                           1656 ;	---------------------------------
                           1657 ; Function dibujarPuntos
                           1658 ; ---------------------------------
   6191                    1659 _dibujarPuntos::
   6191 DD E5         [15] 1660 	push	ix
   6193 DD 21 00 00   [14] 1661 	ld	ix,#0
   6197 DD 39         [15] 1662 	add	ix,sp
   6199 F5            [11] 1663 	push	af
   619A F5            [11] 1664 	push	af
                           1665 ;src/game.c:406: TPlayer* p = &player;
                           1666 ;src/game.c:408: if(p->puntuacion != p->puntuacionPrev){
   619B ED 4B 23 59   [20] 1667 	ld	bc, (#(_player + 0x004b) + 0)
   619F ED 5B 25 59   [20] 1668 	ld	de, (#(_player + 0x004d) + 0)
   61A3 79            [ 4] 1669 	ld	a,c
   61A4 93            [ 4] 1670 	sub	a, e
   61A5 20 04         [12] 1671 	jr	NZ,00109$
   61A7 78            [ 4] 1672 	ld	a,b
   61A8 92            [ 4] 1673 	sub	a, d
   61A9 28 55         [12] 1674 	jr	Z,00103$
   61AB                    1675 00109$:
                           1676 ;src/game.c:412: cpct_getScreenPtr(CPCT_VMEM_START,63,23)
   61AB 21 3F 17      [10] 1677 	ld	hl,#0x173F
   61AE E5            [11] 1678 	push	hl
   61AF 21 00 C0      [10] 1679 	ld	hl,#0xC000
   61B2 E5            [11] 1680 	push	hl
   61B3 CD 38 7A      [17] 1681 	call	_cpct_getScreenPtr
   61B6 4D            [ 4] 1682 	ld	c,l
   61B7 44            [ 4] 1683 	ld	b,h
   61B8 21 14 08      [10] 1684 	ld	hl,#0x0814
   61BB E5            [11] 1685 	push	hl
   61BC AF            [ 4] 1686 	xor	a, a
   61BD F5            [11] 1687 	push	af
   61BE 33            [ 6] 1688 	inc	sp
   61BF C5            [11] 1689 	push	bc
   61C0 CD 23 79      [17] 1690 	call	_cpct_drawSolidBox
   61C3 F1            [10] 1691 	pop	af
   61C4 F1            [10] 1692 	pop	af
   61C5 33            [ 6] 1693 	inc	sp
                           1694 ;src/game.c:417: sprintf(strPts,"%d",p->puntuacion);
   61C6 ED 5B 23 59   [20] 1695 	ld	de, (#(_player + 0x004b) + 0)
   61CA 21 00 00      [10] 1696 	ld	hl,#0x0000
   61CD 39            [11] 1697 	add	hl,sp
   61CE E5            [11] 1698 	push	hl
   61CF D5            [11] 1699 	push	de
   61D0 11 05 62      [10] 1700 	ld	de,#___str_3
   61D3 D5            [11] 1701 	push	de
   61D4 E5            [11] 1702 	push	hl
   61D5 CD 0C 70      [17] 1703 	call	_sprintf
   61D8 21 06 00      [10] 1704 	ld	hl,#6
   61DB 39            [11] 1705 	add	hl,sp
   61DC F9            [ 6] 1706 	ld	sp,hl
   61DD 21 3F 17      [10] 1707 	ld	hl,#0x173F
   61E0 E5            [11] 1708 	push	hl
   61E1 21 00 C0      [10] 1709 	ld	hl,#0xC000
   61E4 E5            [11] 1710 	push	hl
   61E5 CD 38 7A      [17] 1711 	call	_cpct_getScreenPtr
   61E8 EB            [ 4] 1712 	ex	de,hl
   61E9 C1            [10] 1713 	pop	bc
   61EA 21 02 00      [10] 1714 	ld	hl,#0x0002
   61ED E5            [11] 1715 	push	hl
   61EE D5            [11] 1716 	push	de
   61EF C5            [11] 1717 	push	bc
   61F0 CD 4B 6D      [17] 1718 	call	_cpct_drawStringM0
   61F3 21 06 00      [10] 1719 	ld	hl,#6
   61F6 39            [11] 1720 	add	hl,sp
   61F7 F9            [ 6] 1721 	ld	sp,hl
                           1722 ;src/game.c:419: p->puntuacionPrev = p->puntuacion;
   61F8 ED 4B 23 59   [20] 1723 	ld	bc, (#(_player + 0x004b) + 0)
   61FC ED 43 25 59   [20] 1724 	ld	((_player + 0x004d)), bc
   6200                    1725 00103$:
   6200 DD F9         [10] 1726 	ld	sp, ix
   6202 DD E1         [14] 1727 	pop	ix
   6204 C9            [10] 1728 	ret
   6205                    1729 ___str_3:
   6205 25 64              1730 	.ascii "%d"
   6207 00                 1731 	.db 0x00
                           1732 ;src/game.c:423: void play(){
                           1733 ;	---------------------------------
                           1734 ; Function play
                           1735 ; ---------------------------------
   6208                    1736 _play::
                           1737 ;src/game.c:425: salirMenu = 0;
   6208 21 91 85      [10] 1738 	ld	hl,#_salirMenu + 0
   620B 36 00         [10] 1739 	ld	(hl), #0x00
                           1740 ;src/game.c:426: incializarEntities(&player);
   620D 21 D8 58      [10] 1741 	ld	hl,#_player
   6210 E5            [11] 1742 	push	hl
   6211 CD B3 85      [17] 1743 	call	_incializarEntities
   6214 F1            [10] 1744 	pop	af
                           1745 ;src/game.c:427: inicializarPantalla();
   6215 CD 18 58      [17] 1746 	call	_inicializarPantalla
                           1747 ;src/game.c:430: while(player.vida>0){
   6218                    1748 00103$:
   6218 3A 21 59      [13] 1749 	ld	a, (#_player + 73)
   621B B7            [ 4] 1750 	or	a, a
   621C C8            [11] 1751 	ret	Z
                           1752 ;src/game.c:431: updateUser();
   621D CD 42 5B      [17] 1753 	call	_updateUser
                           1754 ;src/game.c:432: updatePlayer(&player);
   6220 21 D8 58      [10] 1755 	ld	hl,#_player
   6223 E5            [11] 1756 	push	hl
   6224 CD 0F 8B      [17] 1757 	call	_updatePlayer
   6227 F1            [10] 1758 	pop	af
                           1759 ;src/game.c:433: updateEntities();
   6228 CD BA 8D      [17] 1760 	call	_updateEntities
                           1761 ;src/game.c:435: calculaColisiones();
   622B CD 7A 5D      [17] 1762 	call	_calculaColisiones
                           1763 ;src/game.c:436: calculaAllEntities(&player);
   622E 21 D8 58      [10] 1764 	ld	hl,#_player
   6231 E5            [11] 1765 	push	hl
   6232 CD 52 96      [17] 1766 	call	_calculaAllEntities
   6235 F1            [10] 1767 	pop	af
                           1768 ;src/game.c:438: cpct_waitVSYNC();
   6236 CD C4 70      [17] 1769 	call	_cpct_waitVSYNC
                           1770 ;src/game.c:440: drawAll(&player);
   6239 21 D8 58      [10] 1771 	ld	hl,#_player
   623C E5            [11] 1772 	push	hl
   623D CD 1B 97      [17] 1773 	call	_drawAll
   6240 F1            [10] 1774 	pop	af
                           1775 ;src/game.c:441: drawHUD();
   6241 CD 82 60      [17] 1776 	call	_drawHUD
                           1777 ;src/game.c:443: if(salirMenu % 2 == 1){
   6244 3A 91 85      [13] 1778 	ld	a,(#_salirMenu + 0)
   6247 E6 01         [ 7] 1779 	and	a, #0x01
   6249 3D            [ 4] 1780 	dec	a
   624A 20 CC         [12] 1781 	jr	NZ,00103$
                           1782 ;src/game.c:445: return;
   624C C9            [10] 1783 	ret
                           1784 	.area _CODE
                           1785 	.area _INITIALIZER
   85A0                    1786 __xinit__mapa:
   85A0 00 00              1787 	.dw #0x0000
   85A2                    1788 __xinit__mapaActual:
   85A2 00                 1789 	.db #0x00	; 0
   85A3                    1790 __xinit__previousMap:
   85A3 00                 1791 	.db #0x00	; 0
   85A4                    1792 __xinit__salirMenu:
   85A4 00                 1793 	.db #0x00	; 0
   85A5                    1794 __xinit__basesCapturadas:
   85A5 00                 1795 	.db #0x00	; 0
   85A6                    1796 __xinit__prev_basesCapturadas:
   85A6 00                 1797 	.db #0x00	; 0
   85A7                    1798 __xinit__wshot_cycles:
   85A7 1E                 1799 	.db #0x1E	; 30
   85A8                    1800 __xinit__count:
   85A8 00                 1801 	.db #0x00	; 0
                           1802 	.area _CABS (ABS)
