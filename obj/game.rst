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
   7D7B                      78 _mapa::
   7D7B                      79 	.ds 2
   7D7D                      80 _mapaActual::
   7D7D                      81 	.ds 1
   7D7E                      82 _previousMap::
   7D7E                      83 	.ds 1
   7D7F                      84 _salirMenu::
   7D7F                      85 	.ds 1
   7D80                      86 _basesCapturadas::
   7D80                      87 	.ds 1
   7D81                      88 _prev_basesCapturadas::
   7D81                      89 	.ds 1
   7D82                      90 _wshot_cycles::
   7D82                      91 	.ds 1
   7D83                      92 _count::
   7D83                      93 	.ds 1
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
   5822 CD F4 70      [17]  128 	call	_cpct_memset
                            129 ;src/game.c:122: mapaActual = 0;
   5825 21 7D 7D      [10]  130 	ld	hl,#_mapaActual + 0
   5828 36 00         [10]  131 	ld	(hl), #0x00
                            132 ;src/game.c:123: previousMap = 0;
   582A 21 7E 7D      [10]  133 	ld	hl,#_previousMap + 0
   582D 36 00         [10]  134 	ld	(hl), #0x00
                            135 ;src/game.c:124: mapa = g_map11;
   582F 21 40 2F      [10]  136 	ld	hl,#_g_map11+0
   5832 22 7B 7D      [16]  137 	ld	(_mapa),hl
                            138 ;src/game.c:125: cpct_etm_setTileset2x4(g_tileset);
   5835 21 80 35      [10]  139 	ld	hl,#_g_tileset
   5838 CD D2 6E      [17]  140 	call	_cpct_etm_setTileset2x4
                            141 ;src/game.c:126: dibujarMapa();
   583B CD 6C 59      [17]  142 	call	_dibujarMapa
                            143 ;src/game.c:127: cpct_drawStringM0("Score: 000",cpct_getScreenPtr(CPCT_VMEM_START,36,23),2,0);
   583E 21 24 17      [10]  144 	ld	hl,#0x1724
   5841 E5            [11]  145 	push	hl
   5842 21 00 C0      [10]  146 	ld	hl,#0xC000
   5845 E5            [11]  147 	push	hl
   5846 CD 27 72      [17]  148 	call	_cpct_getScreenPtr
   5849 4D            [ 4]  149 	ld	c,l
   584A 44            [ 4]  150 	ld	b,h
   584B 21 02 00      [10]  151 	ld	hl,#0x0002
   584E E5            [11]  152 	push	hl
   584F C5            [11]  153 	push	bc
   5850 21 56 59      [10]  154 	ld	hl,#___str_0
   5853 E5            [11]  155 	push	hl
   5854 CD 63 6D      [17]  156 	call	_cpct_drawStringM0
   5857 21 06 00      [10]  157 	ld	hl,#6
   585A 39            [11]  158 	add	hl,sp
   585B F9            [ 6]  159 	ld	sp,hl
                            160 ;src/game.c:128: cpct_drawStringM0("Bases:   0",cpct_getScreenPtr(CPCT_VMEM_START,36,5),2,0);
   585C 21 24 05      [10]  161 	ld	hl,#0x0524
   585F E5            [11]  162 	push	hl
   5860 21 00 C0      [10]  163 	ld	hl,#0xC000
   5863 E5            [11]  164 	push	hl
   5864 CD 27 72      [17]  165 	call	_cpct_getScreenPtr
   5867 4D            [ 4]  166 	ld	c,l
   5868 44            [ 4]  167 	ld	b,h
   5869 21 02 00      [10]  168 	ld	hl,#0x0002
   586C E5            [11]  169 	push	hl
   586D C5            [11]  170 	push	bc
   586E 21 61 59      [10]  171 	ld	hl,#___str_1
   5871 E5            [11]  172 	push	hl
   5872 CD 63 6D      [17]  173 	call	_cpct_drawStringM0
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
   5898 CD 27 72      [17]  200 	call	_cpct_getScreenPtr
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
   58B5 CD 9A 8C      [17]  217 	call	_dibujarEntity
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
   58CC 21 83 7D      [10]  233 	ld	hl,#_count + 0
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
   596C 2A 7B 7D      [16]  345 	ld	hl,(_mapa)
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
   597E CD 2C 6E      [17]  356 	call	_cpct_etm_drawTileBox2x4
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
   598C CD 4B 90      [17]  369 	call	_getEnemies
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
   59D7 21 7D 7D      [10]  421 	ld	hl,#_mapaActual
   59DA 7E            [ 7]  422 	ld	a,(hl)
   59DB DD 86 05      [19]  423 	add	a, 5 (ix)
   59DE 77            [ 7]  424 	ld	(hl),a
                            425 ;src/game.c:158: mapa = mapas[mapaActual];
   59DF 01 4A 59      [10]  426 	ld	bc,#_mapas+0
   59E2 FD 21 7D 7D   [14]  427 	ld	iy,#_mapaActual
   59E6 FD 6E 00      [19]  428 	ld	l,0 (iy)
   59E9 26 00         [ 7]  429 	ld	h,#0x00
   59EB 29            [11]  430 	add	hl, hl
   59EC 09            [11]  431 	add	hl,bc
   59ED 7E            [ 7]  432 	ld	a,(hl)
   59EE FD 21 7B 7D   [14]  433 	ld	iy,#_mapa
   59F2 FD 77 00      [19]  434 	ld	0 (iy),a
   59F5 23            [ 6]  435 	inc	hl
   59F6 7E            [ 7]  436 	ld	a,(hl)
   59F7 32 7C 7D      [13]  437 	ld	(#_mapa + 1),a
                            438 ;src/game.c:159: dibujarMapa();
   59FA CD 6C 59      [17]  439 	call	_dibujarMapa
   59FD 18 26         [12]  440 	jr	00103$
   59FF                     441 00102$:
                            442 ;src/game.c:161: mapaActual = mapaActual - cantidad;
   59FF 21 7D 7D      [10]  443 	ld	hl,#_mapaActual
   5A02 7E            [ 7]  444 	ld	a,(hl)
   5A03 DD 96 05      [19]  445 	sub	a, 5 (ix)
   5A06 77            [ 7]  446 	ld	(hl),a
                            447 ;src/game.c:162: mapa = mapas[mapaActual];
   5A07 01 4A 59      [10]  448 	ld	bc,#_mapas+0
   5A0A FD 21 7D 7D   [14]  449 	ld	iy,#_mapaActual
   5A0E FD 6E 00      [19]  450 	ld	l,0 (iy)
   5A11 26 00         [ 7]  451 	ld	h,#0x00
   5A13 29            [11]  452 	add	hl, hl
   5A14 09            [11]  453 	add	hl,bc
   5A15 7E            [ 7]  454 	ld	a,(hl)
   5A16 FD 21 7B 7D   [14]  455 	ld	iy,#_mapa
   5A1A FD 77 00      [19]  456 	ld	0 (iy),a
   5A1D 23            [ 6]  457 	inc	hl
   5A1E 7E            [ 7]  458 	ld	a,(hl)
   5A1F 32 7C 7D      [13]  459 	ld	(#_mapa + 1),a
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
   5A30 01 67 7F      [10]  471 	ld	bc,#_bases+0
   5A33 ED 5B 7D 7D   [20]  472 	ld	de,(_mapaActual)
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
   5A4A FD 21 7D 7D   [14]  490 	ld	iy,#_mapaActual
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
   5A69 3A 7D 7D      [13]  523 	ld	a,(#_mapaActual + 0)
   5A6C D6 06         [ 7]  524 	sub	a, #0x06
   5A6E D0            [11]  525 	ret	NC
   5A6F 21 7D 7D      [10]  526 	ld	hl,#_mapaActual+0
   5A72 CB 46         [12]  527 	bit	0, (hl)
   5A74 C0            [11]  528 	ret	NZ
                            529 ;src/game.c:183: mapaActual = cambiarMapa(1,1);
   5A75 21 01 01      [10]  530 	ld	hl,#0x0101
   5A78 E5            [11]  531 	push	hl
   5A79 CD C9 59      [17]  532 	call	_cambiarMapa
   5A7C F1            [10]  533 	pop	af
   5A7D FD 21 7D 7D   [14]  534 	ld	iy,#_mapaActual
   5A81 FD 75 00      [19]  535 	ld	0 (iy),l
                            536 ;src/game.c:184: ent->cuadrante = mapaActual;
   5A84 D1            [10]  537 	pop	de
   5A85 C1            [10]  538 	pop	bc
   5A86 C5            [11]  539 	push	bc
   5A87 D5            [11]  540 	push	de
   5A88 21 1C 00      [10]  541 	ld	hl,#0x001C
   5A8B 09            [11]  542 	add	hl,bc
   5A8C 3A 7D 7D      [13]  543 	ld	a,(#_mapaActual + 0)
   5A8F 77            [ 7]  544 	ld	(hl),a
                            545 ;src/game.c:185: updateX(ent,0); //esto es para cambiar la posision del player cuando cambia de mapa.
   5A90 21 00 00      [10]  546 	ld	hl,#0x0000
   5A93 E5            [11]  547 	push	hl
   5A94 C5            [11]  548 	push	bc
   5A95 CD 04 84      [17]  549 	call	_updateX
   5A98 F1            [10]  550 	pop	af
   5A99 F1            [10]  551 	pop	af
                            552 ;src/game.c:186: aparecerEnemigo();
   5A9A C3 EF 64      [10]  553 	jp  _aparecerEnemigo
                            554 ;src/game.c:190: void cambiarIzquierda(TEntity* ent){
                            555 ;	---------------------------------
                            556 ; Function cambiarIzquierda
                            557 ; ---------------------------------
   5A9D                     558 _cambiarIzquierda::
                            559 ;src/game.c:191: if(mapaActual >= 0 && mapaActual < 6 && mapaActual % 2 != 0){ //pongo a mano el numero de mapas que hay en total y se mueve si son impares
   5A9D 3A 7D 7D      [13]  560 	ld	a,(#_mapaActual + 0)
   5AA0 D6 06         [ 7]  561 	sub	a, #0x06
   5AA2 D0            [11]  562 	ret	NC
   5AA3 21 7D 7D      [10]  563 	ld	hl,#_mapaActual+0
   5AA6 CB 46         [12]  564 	bit	0, (hl)
   5AA8 C8            [11]  565 	ret	Z
                            566 ;src/game.c:192: mapaActual = cambiarMapa(0,1);
   5AA9 21 00 01      [10]  567 	ld	hl,#0x0100
   5AAC E5            [11]  568 	push	hl
   5AAD CD C9 59      [17]  569 	call	_cambiarMapa
   5AB0 F1            [10]  570 	pop	af
   5AB1 FD 21 7D 7D   [14]  571 	ld	iy,#_mapaActual
   5AB5 FD 75 00      [19]  572 	ld	0 (iy),l
                            573 ;src/game.c:193: ent->cuadrante = mapaActual;
   5AB8 D1            [10]  574 	pop	de
   5AB9 C1            [10]  575 	pop	bc
   5ABA C5            [11]  576 	push	bc
   5ABB D5            [11]  577 	push	de
   5ABC 21 1C 00      [10]  578 	ld	hl,#0x001C
   5ABF 09            [11]  579 	add	hl,bc
   5AC0 3A 7D 7D      [13]  580 	ld	a,(#_mapaActual + 0)
   5AC3 77            [ 7]  581 	ld	(hl),a
                            582 ;src/game.c:194: updateX(ent,74);//80-6 == ancho del mapa - ancho sprite(en bytes), poner en variables
   5AC4 21 4A 00      [10]  583 	ld	hl,#0x004A
   5AC7 E5            [11]  584 	push	hl
   5AC8 C5            [11]  585 	push	bc
   5AC9 CD 04 84      [17]  586 	call	_updateX
   5ACC F1            [10]  587 	pop	af
   5ACD F1            [10]  588 	pop	af
                            589 ;src/game.c:195: aparecerEnemigo();
   5ACE C3 EF 64      [10]  590 	jp  _aparecerEnemigo
                            591 ;src/game.c:199: void cambiarArriba(TEntity* ent){
                            592 ;	---------------------------------
                            593 ; Function cambiarArriba
                            594 ; ---------------------------------
   5AD1                     595 _cambiarArriba::
                            596 ;src/game.c:200: if(mapaActual >= 0 && mapaActual < 4){//desde los 4 primeros mapas puedo subir
   5AD1 3A 7D 7D      [13]  597 	ld	a,(#_mapaActual + 0)
   5AD4 D6 04         [ 7]  598 	sub	a, #0x04
   5AD6 D0            [11]  599 	ret	NC
                            600 ;src/game.c:201: mapaActual = cambiarMapa(1,2);
   5AD7 21 01 02      [10]  601 	ld	hl,#0x0201
   5ADA E5            [11]  602 	push	hl
   5ADB CD C9 59      [17]  603 	call	_cambiarMapa
   5ADE F1            [10]  604 	pop	af
   5ADF FD 21 7D 7D   [14]  605 	ld	iy,#_mapaActual
   5AE3 FD 75 00      [19]  606 	ld	0 (iy),l
                            607 ;src/game.c:202: ent->cuadrante = mapaActual;
   5AE6 D1            [10]  608 	pop	de
   5AE7 C1            [10]  609 	pop	bc
   5AE8 C5            [11]  610 	push	bc
   5AE9 D5            [11]  611 	push	de
   5AEA 21 1C 00      [10]  612 	ld	hl,#0x001C
   5AED 09            [11]  613 	add	hl,bc
   5AEE 3A 7D 7D      [13]  614 	ld	a,(#_mapaActual + 0)
   5AF1 77            [ 7]  615 	ld	(hl),a
                            616 ;src/game.c:203: updateY(ent, 188);ent->y = 188;//200-12 == alto del mapa - alto sprite, poner en variables
   5AF2 C5            [11]  617 	push	bc
   5AF3 21 BC 00      [10]  618 	ld	hl,#0x00BC
   5AF6 E5            [11]  619 	push	hl
   5AF7 C5            [11]  620 	push	bc
   5AF8 CD 20 84      [17]  621 	call	_updateY
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
   5B07 C3 EF 64      [10]  633 	jp  _aparecerEnemigo
                            634 ;src/game.c:209: void cambiarAbajo(TEntity* ent){
                            635 ;	---------------------------------
                            636 ; Function cambiarAbajo
                            637 ; ---------------------------------
   5B0A                     638 _cambiarAbajo::
                            639 ;src/game.c:210: if(mapaActual > 1 && mapaActual < 6){ //desde los 4 ultimos mapas puedo bajar
   5B0A 3E 01         [ 7]  640 	ld	a,#0x01
   5B0C FD 21 7D 7D   [14]  641 	ld	iy,#_mapaActual
   5B10 FD 96 00      [19]  642 	sub	a, 0 (iy)
   5B13 D0            [11]  643 	ret	NC
   5B14 3A 7D 7D      [13]  644 	ld	a,(#_mapaActual + 0)
   5B17 D6 06         [ 7]  645 	sub	a, #0x06
   5B19 D0            [11]  646 	ret	NC
                            647 ;src/game.c:211: mapaActual = cambiarMapa(0,2);
   5B1A 21 00 02      [10]  648 	ld	hl,#0x0200
   5B1D E5            [11]  649 	push	hl
   5B1E CD C9 59      [17]  650 	call	_cambiarMapa
   5B21 F1            [10]  651 	pop	af
   5B22 FD 21 7D 7D   [14]  652 	ld	iy,#_mapaActual
   5B26 FD 75 00      [19]  653 	ld	0 (iy),l
                            654 ;src/game.c:212: ent->cuadrante = mapaActual;
   5B29 D1            [10]  655 	pop	de
   5B2A C1            [10]  656 	pop	bc
   5B2B C5            [11]  657 	push	bc
   5B2C D5            [11]  658 	push	de
   5B2D 21 1C 00      [10]  659 	ld	hl,#0x001C
   5B30 09            [11]  660 	add	hl,bc
   5B31 3A 7D 7D      [13]  661 	ld	a,(#_mapaActual + 0)
   5B34 77            [ 7]  662 	ld	(hl),a
                            663 ;src/game.c:213: updateY(ent, 40); //en 40 comienza el mapa a pintarse
   5B35 21 28 00      [10]  664 	ld	hl,#0x0028
   5B38 E5            [11]  665 	push	hl
   5B39 C5            [11]  666 	push	bc
   5B3A CD 20 84      [17]  667 	call	_updateY
   5B3D F1            [10]  668 	pop	af
   5B3E F1            [10]  669 	pop	af
                            670 ;src/game.c:214: aparecerEnemigo();
   5B3F C3 EF 64      [10]  671 	jp  _aparecerEnemigo
                            672 ;src/game.c:218: void updateUser(){
                            673 ;	---------------------------------
                            674 ; Function updateUser
                            675 ; ---------------------------------
   5B42                     676 _updateUser::
                            677 ;src/game.c:219: TPlayer* p = &player;
                            678 ;src/game.c:221: cpct_scanKeyboard_if();
   5B42 CD 66 70      [17]  679 	call	_cpct_scanKeyboard_if
                            680 ;src/game.c:222: if(cpct_isAnyKeyPressed()){
   5B45 CD 59 70      [17]  681 	call	_cpct_isAnyKeyPressed
   5B48 7D            [ 4]  682 	ld	a, l
   5B49 B7            [ 4]  683 	or	a, a
   5B4A C8            [11]  684 	ret	Z
                            685 ;src/game.c:223: if(cpct_isKeyPressed(Key_Space)){
   5B4B 21 05 80      [10]  686 	ld	hl,#0x8005
   5B4E CD 4B 6D      [17]  687 	call	_cpct_isKeyPressed
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
   5B69 CD 40 84      [17]  705 	call	_disparar
   5B6C F1            [10]  706 	pop	af
   5B6D F1            [10]  707 	pop	af
   5B6E 33            [ 6]  708 	inc	sp
   5B6F                     709 00102$:
                            710 ;src/game.c:226: if(cpct_isKeyPressed(Key_CursorUp)){
   5B6F 21 00 01      [10]  711 	ld	hl,#0x0100
   5B72 CD 4B 6D      [17]  712 	call	_cpct_isKeyPressed
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
   5B81 CD 59 80      [17]  725 	call	_accion
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
   5B94 3A 7D 7D      [13]  738 	ld	a,(#_mapaActual + 0)
   5B97 77            [ 7]  739 	ld	(hl),a
   5B98 C9            [10]  740 	ret
   5B99                     741 00123$:
                            742 ;src/game.c:231: }else if(cpct_isKeyPressed(Key_CursorDown)){
   5B99 C5            [11]  743 	push	bc
   5B9A 21 00 04      [10]  744 	ld	hl,#0x0400
   5B9D CD 4B 6D      [17]  745 	call	_cpct_isKeyPressed
   5BA0 C1            [10]  746 	pop	bc
   5BA1 7D            [ 4]  747 	ld	a,l
   5BA2 B7            [ 4]  748 	or	a, a
   5BA3 28 1E         [12]  749 	jr	Z,00120$
                            750 ;src/game.c:232: if(accion(&player.ent, es_mover, d_down) == d_down){
   5BA5 21 01 02      [10]  751 	ld	hl,#0x0201
   5BA8 E5            [11]  752 	push	hl
   5BA9 C5            [11]  753 	push	bc
   5BAA CD 59 80      [17]  754 	call	_accion
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
   5BBE 3A 7D 7D      [13]  767 	ld	a,(#_mapaActual + 0)
   5BC1 77            [ 7]  768 	ld	(hl),a
   5BC2 C9            [10]  769 	ret
   5BC3                     770 00120$:
                            771 ;src/game.c:236: }else if(cpct_isKeyPressed(Key_CursorRight)){
   5BC3 C5            [11]  772 	push	bc
   5BC4 21 00 02      [10]  773 	ld	hl,#0x0200
   5BC7 CD 4B 6D      [17]  774 	call	_cpct_isKeyPressed
   5BCA C1            [10]  775 	pop	bc
   5BCB 7D            [ 4]  776 	ld	a,l
   5BCC B7            [ 4]  777 	or	a, a
   5BCD 28 1C         [12]  778 	jr	Z,00117$
                            779 ;src/game.c:237: if(accion(&player.ent,es_mover,d_right) == d_right){
   5BCF 21 01 01      [10]  780 	ld	hl,#0x0101
   5BD2 E5            [11]  781 	push	hl
   5BD3 C5            [11]  782 	push	bc
   5BD4 CD 59 80      [17]  783 	call	_accion
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
   5BE6 3A 7D 7D      [13]  795 	ld	a,(#_mapaActual + 0)
   5BE9 77            [ 7]  796 	ld	(hl),a
   5BEA C9            [10]  797 	ret
   5BEB                     798 00117$:
                            799 ;src/game.c:241: }else if(cpct_isKeyPressed(Key_CursorLeft)){
   5BEB C5            [11]  800 	push	bc
   5BEC 21 01 01      [10]  801 	ld	hl,#0x0101
   5BEF CD 4B 6D      [17]  802 	call	_cpct_isKeyPressed
   5BF2 C1            [10]  803 	pop	bc
   5BF3 7D            [ 4]  804 	ld	a,l
   5BF4 B7            [ 4]  805 	or	a, a
   5BF5 28 1E         [12]  806 	jr	Z,00114$
                            807 ;src/game.c:242: if(accion(&player.ent,es_mover,d_left) == d_left){
   5BF7 21 01 03      [10]  808 	ld	hl,#0x0301
   5BFA E5            [11]  809 	push	hl
   5BFB C5            [11]  810 	push	bc
   5BFC CD 59 80      [17]  811 	call	_accion
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
   5C10 3A 7D 7D      [13]  824 	ld	a,(#_mapaActual + 0)
   5C13 77            [ 7]  825 	ld	(hl),a
   5C14 C9            [10]  826 	ret
   5C15                     827 00114$:
                            828 ;src/game.c:246: }else if(cpct_isKeyPressed(Key_Esc)){
   5C15 21 08 04      [10]  829 	ld	hl,#0x0408
   5C18 CD 4B 6D      [17]  830 	call	_cpct_isKeyPressed
   5C1B 7D            [ 4]  831 	ld	a,l
   5C1C B7            [ 4]  832 	or	a, a
   5C1D C8            [11]  833 	ret	Z
                            834 ;src/game.c:247: salirMenu = 1;
   5C1E 21 7F 7D      [10]  835 	ld	hl,#_salirMenu + 0
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
   5C34 DD 77 FC      [19]  851 	ld	-4 (ix),a
   5C37 DD 7E 05      [19]  852 	ld	a,5 (ix)
   5C3A DD 77 FD      [19]  853 	ld	-3 (ix),a
   5C3D DD 6E FC      [19]  854 	ld	l,-4 (ix)
   5C40 DD 66 FD      [19]  855 	ld	h,-3 (ix)
   5C43 4E            [ 7]  856 	ld	c,(hl)
   5C44 DD 7E 06      [19]  857 	ld	a,6 (ix)
   5C47 DD 77 FA      [19]  858 	ld	-6 (ix),a
   5C4A DD 7E 07      [19]  859 	ld	a,7 (ix)
   5C4D DD 77 FB      [19]  860 	ld	-5 (ix),a
   5C50 DD 6E FA      [19]  861 	ld	l,-6 (ix)
   5C53 DD 66 FB      [19]  862 	ld	h,-5 (ix)
   5C56 46            [ 7]  863 	ld	b,(hl)
   5C57 DD 70 F8      [19]  864 	ld	-8 (ix),b
   5C5A DD 36 F9 00   [19]  865 	ld	-7 (ix),#0x00
   5C5E DD 6E FA      [19]  866 	ld	l,-6 (ix)
   5C61 DD 66 FB      [19]  867 	ld	h,-5 (ix)
   5C64 23            [ 6]  868 	inc	hl
   5C65 23            [ 6]  869 	inc	hl
   5C66 5E            [ 7]  870 	ld	e,(hl)
   5C67 16 00         [ 7]  871 	ld	d,#0x00
   5C69 DD 6E F8      [19]  872 	ld	l,-8 (ix)
   5C6C DD 66 F9      [19]  873 	ld	h,-7 (ix)
   5C6F 19            [11]  874 	add	hl,de
   5C70 DD 71 FE      [19]  875 	ld	-2 (ix),c
   5C73 DD 36 FF 00   [19]  876 	ld	-1 (ix),#0x00
   5C77 DD 7E FE      [19]  877 	ld	a,-2 (ix)
   5C7A 95            [ 4]  878 	sub	a, l
   5C7B DD 7E FF      [19]  879 	ld	a,-1 (ix)
   5C7E 9C            [ 4]  880 	sbc	a, h
   5C7F E2 84 5C      [10]  881 	jp	PO, 00125$
   5C82 EE 80         [ 7]  882 	xor	a, #0x80
   5C84                     883 00125$:
   5C84 F2 6E 5D      [10]  884 	jp	P,00102$
                            885 ;src/game.c:256: col1->x + col1->w > col2->x &&
   5C87 DD 6E FC      [19]  886 	ld	l,-4 (ix)
   5C8A DD 66 FD      [19]  887 	ld	h,-3 (ix)
   5C8D 23            [ 6]  888 	inc	hl
   5C8E 23            [ 6]  889 	inc	hl
   5C8F 4E            [ 7]  890 	ld	c,(hl)
   5C90 06 00         [ 7]  891 	ld	b,#0x00
   5C92 DD 6E FE      [19]  892 	ld	l,-2 (ix)
   5C95 DD 66 FF      [19]  893 	ld	h,-1 (ix)
   5C98 09            [11]  894 	add	hl,bc
   5C99 DD 7E F8      [19]  895 	ld	a,-8 (ix)
   5C9C 95            [ 4]  896 	sub	a, l
   5C9D DD 7E F9      [19]  897 	ld	a,-7 (ix)
   5CA0 9C            [ 4]  898 	sbc	a, h
   5CA1 E2 A6 5C      [10]  899 	jp	PO, 00126$
   5CA4 EE 80         [ 7]  900 	xor	a, #0x80
   5CA6                     901 00126$:
   5CA6 F2 6E 5D      [10]  902 	jp	P,00102$
                            903 ;src/game.c:257: col1->y < col2->y + col2->h &&
   5CA9 DD 7E FC      [19]  904 	ld	a,-4 (ix)
   5CAC DD 77 FE      [19]  905 	ld	-2 (ix),a
   5CAF DD 7E FD      [19]  906 	ld	a,-3 (ix)
   5CB2 DD 77 FF      [19]  907 	ld	-1 (ix),a
   5CB5 DD 6E FE      [19]  908 	ld	l,-2 (ix)
   5CB8 DD 66 FF      [19]  909 	ld	h,-1 (ix)
   5CBB 23            [ 6]  910 	inc	hl
   5CBC 7E            [ 7]  911 	ld	a,(hl)
   5CBD DD 77 FE      [19]  912 	ld	-2 (ix),a
   5CC0 DD 7E FA      [19]  913 	ld	a,-6 (ix)
   5CC3 DD 77 F8      [19]  914 	ld	-8 (ix),a
   5CC6 DD 7E FB      [19]  915 	ld	a,-5 (ix)
   5CC9 DD 77 F9      [19]  916 	ld	-7 (ix),a
   5CCC DD 6E F8      [19]  917 	ld	l,-8 (ix)
   5CCF DD 66 F9      [19]  918 	ld	h,-7 (ix)
   5CD2 23            [ 6]  919 	inc	hl
   5CD3 7E            [ 7]  920 	ld	a,(hl)
   5CD4 DD 77 F8      [19]  921 	ld	-8 (ix), a
   5CD7 DD 77 F8      [19]  922 	ld	-8 (ix),a
   5CDA DD 36 F9 00   [19]  923 	ld	-7 (ix),#0x00
   5CDE DD 6E FA      [19]  924 	ld	l,-6 (ix)
   5CE1 DD 66 FB      [19]  925 	ld	h,-5 (ix)
   5CE4 23            [ 6]  926 	inc	hl
   5CE5 23            [ 6]  927 	inc	hl
   5CE6 23            [ 6]  928 	inc	hl
   5CE7 7E            [ 7]  929 	ld	a,(hl)
   5CE8 DD 77 FA      [19]  930 	ld	-6 (ix), a
   5CEB DD 77 FA      [19]  931 	ld	-6 (ix),a
   5CEE DD 36 FB 00   [19]  932 	ld	-5 (ix),#0x00
   5CF2 DD 7E F8      [19]  933 	ld	a,-8 (ix)
   5CF5 DD 86 FA      [19]  934 	add	a, -6 (ix)
   5CF8 DD 77 FA      [19]  935 	ld	-6 (ix),a
   5CFB DD 7E F9      [19]  936 	ld	a,-7 (ix)
   5CFE DD 8E FB      [19]  937 	adc	a, -5 (ix)
   5D01 DD 77 FB      [19]  938 	ld	-5 (ix),a
   5D04 DD 7E FE      [19]  939 	ld	a,-2 (ix)
   5D07 DD 77 FE      [19]  940 	ld	-2 (ix),a
   5D0A DD 36 FF 00   [19]  941 	ld	-1 (ix),#0x00
   5D0E DD 7E FE      [19]  942 	ld	a,-2 (ix)
   5D11 DD 96 FA      [19]  943 	sub	a, -6 (ix)
   5D14 DD 7E FF      [19]  944 	ld	a,-1 (ix)
   5D17 DD 9E FB      [19]  945 	sbc	a, -5 (ix)
   5D1A E2 1F 5D      [10]  946 	jp	PO, 00127$
   5D1D EE 80         [ 7]  947 	xor	a, #0x80
   5D1F                     948 00127$:
   5D1F F2 6E 5D      [10]  949 	jp	P,00102$
                            950 ;src/game.c:258: col1->h + col1->y > col2->y) {
   5D22 DD 7E FC      [19]  951 	ld	a,-4 (ix)
   5D25 DD 77 FA      [19]  952 	ld	-6 (ix),a
   5D28 DD 7E FD      [19]  953 	ld	a,-3 (ix)
   5D2B DD 77 FB      [19]  954 	ld	-5 (ix),a
   5D2E DD 6E FA      [19]  955 	ld	l,-6 (ix)
   5D31 DD 66 FB      [19]  956 	ld	h,-5 (ix)
   5D34 23            [ 6]  957 	inc	hl
   5D35 23            [ 6]  958 	inc	hl
   5D36 23            [ 6]  959 	inc	hl
   5D37 7E            [ 7]  960 	ld	a,(hl)
   5D38 DD 77 FA      [19]  961 	ld	-6 (ix), a
   5D3B DD 77 FA      [19]  962 	ld	-6 (ix),a
   5D3E DD 36 FB 00   [19]  963 	ld	-5 (ix),#0x00
   5D42 DD 7E FA      [19]  964 	ld	a,-6 (ix)
   5D45 DD 86 FE      [19]  965 	add	a, -2 (ix)
   5D48 DD 77 FE      [19]  966 	ld	-2 (ix),a
   5D4B DD 7E FB      [19]  967 	ld	a,-5 (ix)
   5D4E DD 8E FF      [19]  968 	adc	a, -1 (ix)
   5D51 DD 77 FF      [19]  969 	ld	-1 (ix),a
   5D54 DD 7E F8      [19]  970 	ld	a,-8 (ix)
   5D57 DD 96 FE      [19]  971 	sub	a, -2 (ix)
   5D5A DD 7E F9      [19]  972 	ld	a,-7 (ix)
   5D5D DD 9E FF      [19]  973 	sbc	a, -1 (ix)
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
   5D87 CD 4B 90      [17] 1003 	call	_getEnemies
   5D8A DD 75 F6      [19] 1004 	ld	-10 (ix),l
   5D8D DD 74 F7      [19] 1005 	ld	-9 (ix),h
                           1006 ;src/game.c:277: bases = getBases();
   5D90 CD 4F 90      [17] 1007 	call	_getBases
   5D93 DD 75 F8      [19] 1008 	ld	-8 (ix),l
   5D96 DD 74 F9      [19] 1009 	ld	-7 (ix),h
                           1010 ;src/game.c:279: for(i=0;i<NUM_ENEMIGOS;++i){
   5D99 DD 36 F5 00   [19] 1011 	ld	-11 (ix),#0x00
   5D9D DD 36 FE 00   [19] 1012 	ld	-2 (ix),#0x00
   5DA1 DD 36 FF 00   [19] 1013 	ld	-1 (ix),#0x00
   5DA5 DD 36 FC 00   [19] 1014 	ld	-4 (ix),#0x00
   5DA9 DD 36 FD 00   [19] 1015 	ld	-3 (ix),#0x00
   5DAD                    1016 00131$:
                           1017 ;src/game.c:280: if(mapaActual == enemigos[i].ent.cuadrante && enemigos[i].ent.vivo == 1){
   5DAD DD 7E F6      [19] 1018 	ld	a,-10 (ix)
   5DB0 DD 86 FC      [19] 1019 	add	a, -4 (ix)
   5DB3 DD 77 FA      [19] 1020 	ld	-6 (ix),a
   5DB6 DD 7E F7      [19] 1021 	ld	a,-9 (ix)
   5DB9 DD 8E FD      [19] 1022 	adc	a, -3 (ix)
   5DBC DD 77 FB      [19] 1023 	ld	-5 (ix),a
   5DBF DD 6E FA      [19] 1024 	ld	l,-6 (ix)
   5DC2 DD 66 FB      [19] 1025 	ld	h,-5 (ix)
   5DC5 11 42 00      [10] 1026 	ld	de, #0x0042
   5DC8 19            [11] 1027 	add	hl, de
   5DC9 4E            [ 7] 1028 	ld	c,(hl)
   5DCA 3A 7D 7D      [13] 1029 	ld	a,(#_mapaActual + 0)
   5DCD 91            [ 4] 1030 	sub	a, c
   5DCE 20 32         [12] 1031 	jr	NZ,00104$
   5DD0 DD 6E FA      [19] 1032 	ld	l,-6 (ix)
   5DD3 DD 66 FB      [19] 1033 	ld	h,-5 (ix)
   5DD6 11 41 00      [10] 1034 	ld	de, #0x0041
   5DD9 19            [11] 1035 	add	hl, de
   5DDA 4E            [ 7] 1036 	ld	c,(hl)
   5DDB 0D            [ 4] 1037 	dec	c
   5DDC 20 24         [12] 1038 	jr	NZ,00104$
                           1039 ;src/game.c:281: collide = checkCollision(&player.ent.coll, &enemigos[i].ent.coll);
   5DDE DD 7E FA      [19] 1040 	ld	a,-6 (ix)
   5DE1 C6 3D         [ 7] 1041 	add	a, #0x3D
   5DE3 4F            [ 4] 1042 	ld	c,a
   5DE4 DD 7E FB      [19] 1043 	ld	a,-5 (ix)
   5DE7 CE 00         [ 7] 1044 	adc	a, #0x00
   5DE9 47            [ 4] 1045 	ld	b,a
   5DEA C5            [11] 1046 	push	bc
   5DEB 21 15 59      [10] 1047 	ld	hl,#(_player + 0x003d)
   5DEE E5            [11] 1048 	push	hl
   5DEF CD 24 5C      [17] 1049 	call	_checkCollision
   5DF2 F1            [10] 1050 	pop	af
   5DF3 F1            [10] 1051 	pop	af
                           1052 ;src/game.c:282: if(collide){
   5DF4 7D            [ 4] 1053 	ld	a,l
   5DF5 B7            [ 4] 1054 	or	a, a
   5DF6 28 0A         [12] 1055 	jr	Z,00104$
                           1056 ;src/game.c:283: playerHerido(&player);
   5DF8 21 D8 58      [10] 1057 	ld	hl,#_player
   5DFB E5            [11] 1058 	push	hl
   5DFC CD 4F 85      [17] 1059 	call	_playerHerido
   5DFF F1            [10] 1060 	pop	af
                           1061 ;src/game.c:284: break;
   5E00 18 73         [12] 1062 	jr	00112$
   5E02                    1063 00104$:
                           1064 ;src/game.c:287: if(enemigos[i].ent.vivo == 1 && enemigos[i].bullet.ent.cuadrante == mapaActual && enemigos[i].bullet.ent.vivo){
   5E02 DD 7E F6      [19] 1065 	ld	a,-10 (ix)
   5E05 DD 86 FE      [19] 1066 	add	a, -2 (ix)
   5E08 4F            [ 4] 1067 	ld	c,a
   5E09 DD 7E F7      [19] 1068 	ld	a,-9 (ix)
   5E0C DD 8E FF      [19] 1069 	adc	a, -1 (ix)
   5E0F 47            [ 4] 1070 	ld	b,a
   5E10 C5            [11] 1071 	push	bc
   5E11 FD E1         [14] 1072 	pop	iy
   5E13 FD 5E 41      [19] 1073 	ld	e,65 (iy)
   5E16 1D            [ 4] 1074 	dec	e
   5E17 20 31         [12] 1075 	jr	NZ,00132$
   5E19 C5            [11] 1076 	push	bc
   5E1A FD E1         [14] 1077 	pop	iy
   5E1C FD 5E 1F      [19] 1078 	ld	e,31 (iy)
   5E1F 3A 7D 7D      [13] 1079 	ld	a,(#_mapaActual + 0)
   5E22 93            [ 4] 1080 	sub	a, e
   5E23 20 25         [12] 1081 	jr	NZ,00132$
   5E25 C5            [11] 1082 	push	bc
   5E26 FD E1         [14] 1083 	pop	iy
   5E28 FD 7E 1E      [19] 1084 	ld	a,30 (iy)
   5E2B B7            [ 4] 1085 	or	a, a
   5E2C 28 1C         [12] 1086 	jr	Z,00132$
                           1087 ;src/game.c:289: collide = checkCollision(&enemigos[i].bullet.ent.coll, &player.ent.coll);
   5E2E 21 1A 00      [10] 1088 	ld	hl,#0x001A
   5E31 09            [11] 1089 	add	hl,bc
   5E32 01 15 59      [10] 1090 	ld	bc,#(_player + 0x003d)
   5E35 C5            [11] 1091 	push	bc
   5E36 E5            [11] 1092 	push	hl
   5E37 CD 24 5C      [17] 1093 	call	_checkCollision
   5E3A F1            [10] 1094 	pop	af
   5E3B F1            [10] 1095 	pop	af
                           1096 ;src/game.c:290: if(collide){
   5E3C 7D            [ 4] 1097 	ld	a,l
   5E3D B7            [ 4] 1098 	or	a, a
   5E3E 28 0A         [12] 1099 	jr	Z,00132$
                           1100 ;src/game.c:291: playerHerido(&player);
   5E40 21 D8 58      [10] 1101 	ld	hl,#_player
   5E43 E5            [11] 1102 	push	hl
   5E44 CD 4F 85      [17] 1103 	call	_playerHerido
   5E47 F1            [10] 1104 	pop	af
                           1105 ;src/game.c:292: break;
   5E48 18 2B         [12] 1106 	jr	00112$
   5E4A                    1107 00132$:
                           1108 ;src/game.c:279: for(i=0;i<NUM_ENEMIGOS;++i){
   5E4A DD 7E FE      [19] 1109 	ld	a,-2 (ix)
   5E4D C6 4E         [ 7] 1110 	add	a, #0x4E
   5E4F DD 77 FE      [19] 1111 	ld	-2 (ix),a
   5E52 DD 7E FF      [19] 1112 	ld	a,-1 (ix)
   5E55 CE 00         [ 7] 1113 	adc	a, #0x00
   5E57 DD 77 FF      [19] 1114 	ld	-1 (ix),a
   5E5A DD 7E FC      [19] 1115 	ld	a,-4 (ix)
   5E5D C6 4E         [ 7] 1116 	add	a, #0x4E
   5E5F DD 77 FC      [19] 1117 	ld	-4 (ix),a
   5E62 DD 7E FD      [19] 1118 	ld	a,-3 (ix)
   5E65 CE 00         [ 7] 1119 	adc	a, #0x00
   5E67 DD 77 FD      [19] 1120 	ld	-3 (ix),a
   5E6A DD 34 F5      [23] 1121 	inc	-11 (ix)
   5E6D DD 7E F5      [19] 1122 	ld	a,-11 (ix)
   5E70 D6 03         [ 7] 1123 	sub	a, #0x03
   5E72 DA AD 5D      [10] 1124 	jp	C,00131$
   5E75                    1125 00112$:
                           1126 ;src/game.c:298: if(player.bullet.ent.vivo == SI){
   5E75 21 F6 58      [10] 1127 	ld	hl, #_player + 30
   5E78 4E            [ 7] 1128 	ld	c,(hl)
                           1129 ;src/game.c:310: p->puntuacion = p->puntuacion + 100;
                           1130 ;src/game.c:298: if(player.bullet.ent.vivo == SI){
   5E79 0D            [ 4] 1131 	dec	c
   5E7A C2 56 5F      [10] 1132 	jp	NZ,00120$
                           1133 ;src/game.c:300: for(i=0;i<NUM_ENEMIGOS;++i){
   5E7D DD 36 F5 00   [19] 1134 	ld	-11 (ix),#0x00
   5E81 DD 36 FA 00   [19] 1135 	ld	-6 (ix),#0x00
   5E85 DD 36 FB 00   [19] 1136 	ld	-5 (ix),#0x00
   5E89                    1137 00133$:
                           1138 ;src/game.c:301: if(mapaActual == enemigos[i].ent.cuadrante && enemigos[i].ent.vivo == 1){
   5E89 DD 7E F6      [19] 1139 	ld	a,-10 (ix)
   5E8C DD 86 FA      [19] 1140 	add	a, -6 (ix)
   5E8F 4F            [ 4] 1141 	ld	c,a
   5E90 DD 7E F7      [19] 1142 	ld	a,-9 (ix)
   5E93 DD 8E FB      [19] 1143 	adc	a, -5 (ix)
   5E96 47            [ 4] 1144 	ld	b,a
   5E97 21 26 00      [10] 1145 	ld	hl,#0x0026
   5E9A 09            [11] 1146 	add	hl,bc
   5E9B EB            [ 4] 1147 	ex	de,hl
   5E9C C5            [11] 1148 	push	bc
   5E9D FD E1         [14] 1149 	pop	iy
   5E9F FD 7E 42      [19] 1150 	ld	a,66 (iy)
   5EA2 DD 77 FC      [19] 1151 	ld	-4 (ix),a
   5EA5 3A 7D 7D      [13] 1152 	ld	a,(#_mapaActual + 0)
   5EA8 DD 96 FC      [19] 1153 	sub	a, -4 (ix)
   5EAB C2 3B 5F      [10] 1154 	jp	NZ,00134$
   5EAE 21 41 00      [10] 1155 	ld	hl,#0x0041
   5EB1 09            [11] 1156 	add	hl,bc
   5EB2 DD 75 FC      [19] 1157 	ld	-4 (ix),l
   5EB5 DD 74 FD      [19] 1158 	ld	-3 (ix),h
   5EB8 DD 6E FC      [19] 1159 	ld	l,-4 (ix)
   5EBB DD 66 FD      [19] 1160 	ld	h,-3 (ix)
   5EBE 6E            [ 7] 1161 	ld	l,(hl)
   5EBF 2D            [ 4] 1162 	dec	l
   5EC0 20 79         [12] 1163 	jr	NZ,00134$
                           1164 ;src/game.c:302: collide = checkCollision(&player.bullet.ent.coll, &enemigos[i].ent.coll);
   5EC2 21 3D 00      [10] 1165 	ld	hl,#0x003D
   5EC5 09            [11] 1166 	add	hl,bc
   5EC6 C5            [11] 1167 	push	bc
   5EC7 D5            [11] 1168 	push	de
   5EC8 E5            [11] 1169 	push	hl
   5EC9 21 F2 58      [10] 1170 	ld	hl,#(_player + 0x001a)
   5ECC E5            [11] 1171 	push	hl
   5ECD CD 24 5C      [17] 1172 	call	_checkCollision
   5ED0 F1            [10] 1173 	pop	af
   5ED1 F1            [10] 1174 	pop	af
   5ED2 D1            [10] 1175 	pop	de
   5ED3 C1            [10] 1176 	pop	bc
                           1177 ;src/game.c:303: if(collide){
   5ED4 7D            [ 4] 1178 	ld	a,l
   5ED5 B7            [ 4] 1179 	or	a, a
   5ED6 28 63         [12] 1180 	jr	Z,00134$
                           1181 ;src/game.c:305: explosionBala(&player.bullet);
   5ED8 C5            [11] 1182 	push	bc
   5ED9 D5            [11] 1183 	push	de
   5EDA 21 D8 58      [10] 1184 	ld	hl,#_player
   5EDD E5            [11] 1185 	push	hl
   5EDE CD CD 63      [17] 1186 	call	_explosionBala
   5EE1 F1            [10] 1187 	pop	af
   5EE2 CD 5A 6A      [17] 1188 	call	_restarEnemigo
   5EE5 D1            [10] 1189 	pop	de
   5EE6 D5            [11] 1190 	push	de
   5EE7 3E 01         [ 7] 1191 	ld	a,#0x01
   5EE9 F5            [11] 1192 	push	af
   5EEA 33            [ 6] 1193 	inc	sp
   5EEB D5            [11] 1194 	push	de
   5EEC CD E6 8C      [17] 1195 	call	_calculaEntity
   5EEF F1            [10] 1196 	pop	af
   5EF0 33            [ 6] 1197 	inc	sp
   5EF1 D1            [10] 1198 	pop	de
   5EF2 C1            [10] 1199 	pop	bc
                           1200 ;src/game.c:308: enemigos[i].ent.draw = SI;
   5EF3 21 30 00      [10] 1201 	ld	hl,#0x0030
   5EF6 09            [11] 1202 	add	hl,bc
   5EF7 DD 75 FE      [19] 1203 	ld	-2 (ix),l
   5EFA DD 74 FF      [19] 1204 	ld	-1 (ix),h
   5EFD DD 6E FE      [19] 1205 	ld	l,-2 (ix)
   5F00 DD 66 FF      [19] 1206 	ld	h,-1 (ix)
   5F03 36 01         [10] 1207 	ld	(hl),#0x01
                           1208 ;src/game.c:309: borrarEntity(&enemigos[i].ent);
   5F05 C5            [11] 1209 	push	bc
   5F06 D5            [11] 1210 	push	de
   5F07 CD 34 8C      [17] 1211 	call	_borrarEntity
   5F0A F1            [10] 1212 	pop	af
   5F0B C1            [10] 1213 	pop	bc
                           1214 ;src/game.c:310: p->puntuacion = p->puntuacion + 100;
   5F0C ED 5B 23 59   [20] 1215 	ld	de, (#(_player + 0x004b) + 0)
   5F10 21 64 00      [10] 1216 	ld	hl,#0x0064
   5F13 19            [11] 1217 	add	hl,de
   5F14 5D            [ 4] 1218 	ld	e,l
   5F15 54            [ 4] 1219 	ld	d,h
   5F16 ED 53 23 59   [20] 1220 	ld	((_player + 0x004b)), de
                           1221 ;src/game.c:311: enemigos[i].ent.vivo = 0;
   5F1A DD 6E FC      [19] 1222 	ld	l,-4 (ix)
   5F1D DD 66 FD      [19] 1223 	ld	h,-3 (ix)
   5F20 36 00         [10] 1224 	ld	(hl),#0x00
                           1225 ;src/game.c:312: enemigos[i].ent.draw = NO;
   5F22 DD 6E FE      [19] 1226 	ld	l,-2 (ix)
   5F25 DD 66 FF      [19] 1227 	ld	h,-1 (ix)
   5F28 36 00         [10] 1228 	ld	(hl),#0x00
                           1229 ;src/game.c:313: enemigos[i].bullet.ent.vivo = NO;
   5F2A 21 1E 00      [10] 1230 	ld	hl,#0x001E
   5F2D 09            [11] 1231 	add	hl,bc
   5F2E 36 00         [10] 1232 	ld	(hl),#0x00
                           1233 ;src/game.c:314: enemigos[i].bullet.ent.draw = NO;
   5F30 21 0D 00      [10] 1234 	ld	hl,#0x000D
   5F33 09            [11] 1235 	add	hl,bc
   5F34 36 00         [10] 1236 	ld	(hl),#0x00
                           1237 ;src/game.c:316: resetearTimepoEnMapa();
   5F36 CD DF 65      [17] 1238 	call	_resetearTimepoEnMapa
                           1239 ;src/game.c:317: break;
   5F39 18 1B         [12] 1240 	jr	00120$
   5F3B                    1241 00134$:
                           1242 ;src/game.c:300: for(i=0;i<NUM_ENEMIGOS;++i){
   5F3B DD 7E FA      [19] 1243 	ld	a,-6 (ix)
   5F3E C6 4E         [ 7] 1244 	add	a, #0x4E
   5F40 DD 77 FA      [19] 1245 	ld	-6 (ix),a
   5F43 DD 7E FB      [19] 1246 	ld	a,-5 (ix)
   5F46 CE 00         [ 7] 1247 	adc	a, #0x00
   5F48 DD 77 FB      [19] 1248 	ld	-5 (ix),a
   5F4B DD 34 F5      [23] 1249 	inc	-11 (ix)
   5F4E DD 7E F5      [19] 1250 	ld	a,-11 (ix)
   5F51 D6 03         [ 7] 1251 	sub	a, #0x03
   5F53 DA 89 5E      [10] 1252 	jp	C,00133$
   5F56                    1253 00120$:
                           1254 ;src/game.c:326: collide = checkCollision(&player.ent.coll, &bases[mapaActual].ent.coll);
   5F56 ED 4B 7D 7D   [20] 1255 	ld	bc,(_mapaActual)
   5F5A 06 00         [ 7] 1256 	ld	b,#0x00
   5F5C 69            [ 4] 1257 	ld	l, c
   5F5D 60            [ 4] 1258 	ld	h, b
   5F5E 29            [11] 1259 	add	hl, hl
   5F5F 29            [11] 1260 	add	hl, hl
   5F60 29            [11] 1261 	add	hl, hl
   5F61 09            [11] 1262 	add	hl, bc
   5F62 29            [11] 1263 	add	hl, hl
   5F63 09            [11] 1264 	add	hl, bc
   5F64 29            [11] 1265 	add	hl, hl
   5F65 09            [11] 1266 	add	hl, bc
   5F66 DD 5E F8      [19] 1267 	ld	e,-8 (ix)
   5F69 DD 56 F9      [19] 1268 	ld	d,-7 (ix)
   5F6C 19            [11] 1269 	add	hl,de
   5F6D 01 1B 00      [10] 1270 	ld	bc,#0x001B
   5F70 09            [11] 1271 	add	hl,bc
   5F71 E5            [11] 1272 	push	hl
   5F72 21 15 59      [10] 1273 	ld	hl,#(_player + 0x003d)
   5F75 E5            [11] 1274 	push	hl
   5F76 CD 24 5C      [17] 1275 	call	_checkCollision
   5F79 F1            [10] 1276 	pop	af
   5F7A F1            [10] 1277 	pop	af
                           1278 ;src/game.c:328: if(collide){
   5F7B 7D            [ 4] 1279 	ld	a, l
   5F7C B7            [ 4] 1280 	or	a, a
   5F7D CA 80 60      [10] 1281 	jp	Z,00135$
                           1282 ;src/game.c:329: bases[mapaActual].ent.draw = SI;
   5F80 ED 4B 7D 7D   [20] 1283 	ld	bc,(_mapaActual)
   5F84 06 00         [ 7] 1284 	ld	b,#0x00
   5F86 69            [ 4] 1285 	ld	l, c
   5F87 60            [ 4] 1286 	ld	h, b
   5F88 29            [11] 1287 	add	hl, hl
   5F89 29            [11] 1288 	add	hl, hl
   5F8A 29            [11] 1289 	add	hl, hl
   5F8B 09            [11] 1290 	add	hl, bc
   5F8C 29            [11] 1291 	add	hl, hl
   5F8D 09            [11] 1292 	add	hl, bc
   5F8E 29            [11] 1293 	add	hl, hl
   5F8F 09            [11] 1294 	add	hl, bc
   5F90 DD 5E F8      [19] 1295 	ld	e,-8 (ix)
   5F93 DD 56 F9      [19] 1296 	ld	d,-7 (ix)
   5F96 19            [11] 1297 	add	hl,de
   5F97 01 0E 00      [10] 1298 	ld	bc,#0x000E
   5F9A 09            [11] 1299 	add	hl,bc
   5F9B 36 01         [10] 1300 	ld	(hl),#0x01
                           1301 ;src/game.c:330: p->ent.draw = SI;
   5F9D 21 08 59      [10] 1302 	ld	hl,#(_player + 0x0030)
   5FA0 36 01         [10] 1303 	ld	(hl),#0x01
                           1304 ;src/game.c:333: if(bases[mapaActual].whom == 1){
   5FA2 ED 4B 7D 7D   [20] 1305 	ld	bc,(_mapaActual)
   5FA6 06 00         [ 7] 1306 	ld	b,#0x00
   5FA8 69            [ 4] 1307 	ld	l, c
   5FA9 60            [ 4] 1308 	ld	h, b
   5FAA 29            [11] 1309 	add	hl, hl
   5FAB 29            [11] 1310 	add	hl, hl
   5FAC 29            [11] 1311 	add	hl, hl
   5FAD 09            [11] 1312 	add	hl, bc
   5FAE 29            [11] 1313 	add	hl, hl
   5FAF 09            [11] 1314 	add	hl, bc
   5FB0 29            [11] 1315 	add	hl, hl
   5FB1 09            [11] 1316 	add	hl, bc
   5FB2 DD 5E F8      [19] 1317 	ld	e,-8 (ix)
   5FB5 DD 56 F9      [19] 1318 	ld	d,-7 (ix)
   5FB8 19            [11] 1319 	add	hl,de
   5FB9 4E            [ 7] 1320 	ld	c,(hl)
   5FBA 0D            [ 4] 1321 	dec	c
   5FBB C2 80 60      [10] 1322 	jp	NZ,00135$
                           1323 ;src/game.c:335: bases[mapaActual].cycles++;
   5FBE 23            [ 6] 1324 	inc	hl
   5FBF 23            [ 6] 1325 	inc	hl
   5FC0 23            [ 6] 1326 	inc	hl
   5FC1 4E            [ 7] 1327 	ld	c,(hl)
   5FC2 0C            [ 4] 1328 	inc	c
   5FC3 71            [ 7] 1329 	ld	(hl),c
                           1330 ;src/game.c:336: if(bases[mapaActual].cycles >= bases[mapaActual].waitCycles){
   5FC4 ED 4B 7D 7D   [20] 1331 	ld	bc,(_mapaActual)
   5FC8 06 00         [ 7] 1332 	ld	b,#0x00
   5FCA 69            [ 4] 1333 	ld	l, c
   5FCB 60            [ 4] 1334 	ld	h, b
   5FCC 29            [11] 1335 	add	hl, hl
   5FCD 29            [11] 1336 	add	hl, hl
   5FCE 29            [11] 1337 	add	hl, hl
   5FCF 09            [11] 1338 	add	hl, bc
   5FD0 29            [11] 1339 	add	hl, hl
   5FD1 09            [11] 1340 	add	hl, bc
   5FD2 29            [11] 1341 	add	hl, hl
   5FD3 09            [11] 1342 	add	hl, bc
   5FD4 7D            [ 4] 1343 	ld	a,l
   5FD5 DD 86 F8      [19] 1344 	add	a, -8 (ix)
   5FD8 4F            [ 4] 1345 	ld	c,a
   5FD9 7C            [ 4] 1346 	ld	a,h
   5FDA DD 8E F9      [19] 1347 	adc	a, -7 (ix)
   5FDD 47            [ 4] 1348 	ld	b,a
   5FDE 69            [ 4] 1349 	ld	l, c
   5FDF 60            [ 4] 1350 	ld	h, b
   5FE0 23            [ 6] 1351 	inc	hl
   5FE1 23            [ 6] 1352 	inc	hl
   5FE2 23            [ 6] 1353 	inc	hl
   5FE3 5E            [ 7] 1354 	ld	e,(hl)
   5FE4 69            [ 4] 1355 	ld	l, c
   5FE5 60            [ 4] 1356 	ld	h, b
   5FE6 23            [ 6] 1357 	inc	hl
   5FE7 23            [ 6] 1358 	inc	hl
   5FE8 4E            [ 7] 1359 	ld	c,(hl)
   5FE9 7B            [ 4] 1360 	ld	a,e
   5FEA 91            [ 4] 1361 	sub	a, c
   5FEB DA 80 60      [10] 1362 	jp	C,00135$
                           1363 ;src/game.c:338: basesCapturadas++; //Aumentamos la cuenta de bases capturadas
   5FEE FD 21 80 7D   [14] 1364 	ld	iy,#_basesCapturadas
   5FF2 FD 34 00      [23] 1365 	inc	0 (iy)
                           1366 ;src/game.c:340: if(wshot_cycles >= 5)
   5FF5 3A 82 7D      [13] 1367 	ld	a,(#_wshot_cycles + 0)
   5FF8 D6 05         [ 7] 1368 	sub	a, #0x05
   5FFA 38 07         [12] 1369 	jr	C,00122$
                           1370 ;src/game.c:341: wshot_cycles -= 7;
   5FFC 21 82 7D      [10] 1371 	ld	hl,#_wshot_cycles
   5FFF 7E            [ 7] 1372 	ld	a,(hl)
   6000 C6 F9         [ 7] 1373 	add	a,#0xF9
   6002 77            [ 7] 1374 	ld	(hl),a
   6003                    1375 00122$:
                           1376 ;src/game.c:342: p->puntuacion = p->puntuacion + 500;
   6003 ED 4B 23 59   [20] 1377 	ld	bc, (#(_player + 0x004b) + 0)
   6007 21 F4 01      [10] 1378 	ld	hl,#0x01F4
   600A 09            [11] 1379 	add	hl,bc
   600B 4D            [ 4] 1380 	ld	c,l
   600C 44            [ 4] 1381 	ld	b,h
   600D ED 43 23 59   [20] 1382 	ld	((_player + 0x004b)), bc
                           1383 ;src/game.c:343: bases[mapaActual].whom = 0;
   6011 ED 4B 7D 7D   [20] 1384 	ld	bc,(_mapaActual)
   6015 06 00         [ 7] 1385 	ld	b,#0x00
   6017 69            [ 4] 1386 	ld	l, c
   6018 60            [ 4] 1387 	ld	h, b
   6019 29            [11] 1388 	add	hl, hl
   601A 29            [11] 1389 	add	hl, hl
   601B 29            [11] 1390 	add	hl, hl
   601C 09            [11] 1391 	add	hl, bc
   601D 29            [11] 1392 	add	hl, hl
   601E 09            [11] 1393 	add	hl, bc
   601F 29            [11] 1394 	add	hl, hl
   6020 09            [11] 1395 	add	hl, bc
   6021 DD 5E F8      [19] 1396 	ld	e,-8 (ix)
   6024 DD 56 F9      [19] 1397 	ld	d,-7 (ix)
   6027 19            [11] 1398 	add	hl,de
   6028 36 00         [10] 1399 	ld	(hl),#0x00
                           1400 ;src/game.c:344: bases[mapaActual].ent.sprites[0] = g_capturada;
   602A ED 4B 7D 7D   [20] 1401 	ld	bc,(_mapaActual)
   602E 06 00         [ 7] 1402 	ld	b,#0x00
   6030 69            [ 4] 1403 	ld	l, c
   6031 60            [ 4] 1404 	ld	h, b
   6032 29            [11] 1405 	add	hl, hl
   6033 29            [11] 1406 	add	hl, hl
   6034 29            [11] 1407 	add	hl, hl
   6035 09            [11] 1408 	add	hl, bc
   6036 29            [11] 1409 	add	hl, hl
   6037 09            [11] 1410 	add	hl, bc
   6038 29            [11] 1411 	add	hl, hl
   6039 09            [11] 1412 	add	hl, bc
   603A DD 5E F8      [19] 1413 	ld	e,-8 (ix)
   603D DD 56 F9      [19] 1414 	ld	d,-7 (ix)
   6040 19            [11] 1415 	add	hl,de
   6041 01 0F 00      [10] 1416 	ld	bc,#0x000F
   6044 09            [11] 1417 	add	hl,bc
   6045 01 7A 6B      [10] 1418 	ld	bc,#_g_capturada+0
   6048 71            [ 7] 1419 	ld	(hl),c
   6049 23            [ 6] 1420 	inc	hl
   604A 70            [ 7] 1421 	ld	(hl),b
                           1422 ;src/game.c:345: bases[mapaActual].ent.draw = SI;
   604B ED 4B 7D 7D   [20] 1423 	ld	bc,(_mapaActual)
   604F 06 00         [ 7] 1424 	ld	b,#0x00
   6051 69            [ 4] 1425 	ld	l, c
   6052 60            [ 4] 1426 	ld	h, b
   6053 29            [11] 1427 	add	hl, hl
   6054 29            [11] 1428 	add	hl, hl
   6055 29            [11] 1429 	add	hl, hl
   6056 09            [11] 1430 	add	hl, bc
   6057 29            [11] 1431 	add	hl, hl
   6058 09            [11] 1432 	add	hl, bc
   6059 29            [11] 1433 	add	hl, hl
   605A 09            [11] 1434 	add	hl, bc
   605B DD 5E F8      [19] 1435 	ld	e,-8 (ix)
   605E DD 56 F9      [19] 1436 	ld	d,-7 (ix)
   6061 19            [11] 1437 	add	hl,de
   6062 01 0E 00      [10] 1438 	ld	bc,#0x000E
   6065 09            [11] 1439 	add	hl,bc
   6066 36 01         [10] 1440 	ld	(hl),#0x01
                           1441 ;src/game.c:346: if(p->vida + 1 <= 3){
   6068 21 21 59      [10] 1442 	ld	hl,#_player + 73
   606B 4E            [ 7] 1443 	ld	c,(hl)
   606C 59            [ 4] 1444 	ld	e,c
   606D 16 00         [ 7] 1445 	ld	d,#0x00
   606F 13            [ 6] 1446 	inc	de
   6070 3E 03         [ 7] 1447 	ld	a,#0x03
   6072 BB            [ 4] 1448 	cp	a, e
   6073 3E 00         [ 7] 1449 	ld	a,#0x00
   6075 9A            [ 4] 1450 	sbc	a, d
   6076 E2 7B 60      [10] 1451 	jp	PO, 00225$
   6079 EE 80         [ 7] 1452 	xor	a, #0x80
   607B                    1453 00225$:
   607B FA 80 60      [10] 1454 	jp	M,00135$
                           1455 ;src/game.c:347: p->vida++;
   607E 0C            [ 4] 1456 	inc	c
   607F 71            [ 7] 1457 	ld	(hl),c
   6080                    1458 00135$:
   6080 DD F9         [10] 1459 	ld	sp, ix
   6082 DD E1         [14] 1460 	pop	ix
   6084 C9            [10] 1461 	ret
                           1462 ;src/game.c:362: void drawHUD(){
                           1463 ;	---------------------------------
                           1464 ; Function drawHUD
                           1465 ; ---------------------------------
   6085                    1466 _drawHUD::
                           1467 ;src/game.c:364: TPlayer* p = &player;
                           1468 ;src/game.c:365: TEntity* ent = &hearth;
                           1469 ;src/game.c:367: if(player.vida != player.pvida){
   6085 21 21 59      [10] 1470 	ld	hl, #(_player + 0x0049) + 0
   6088 4E            [ 7] 1471 	ld	c,(hl)
   6089 21 22 59      [10] 1472 	ld	hl, #_player + 74
   608C 46            [ 7] 1473 	ld	b,(hl)
   608D 79            [ 4] 1474 	ld	a,c
   608E 90            [ 4] 1475 	sub	a, b
   608F CA 1A 61      [10] 1476 	jp	Z,00106$
                           1477 ;src/game.c:370: ent->vmem = cpct_getScreenPtr(CPCT_VMEM_START,ent->x, ent->y);
                           1478 ;src/game.c:371: dibujarEntity(ent,ent->sw,ent->sh);
                           1479 ;src/game.c:368: if(player.vida > player.pvida){
   6092 78            [ 4] 1480 	ld	a,b
   6093 91            [ 4] 1481 	sub	a, c
   6094 30 4B         [12] 1482 	jr	NC,00103$
                           1483 ;src/game.c:369: for(i = 0; i < player.vida; ++i){
   6096 0E 00         [ 7] 1484 	ld	c,#0x00
   6098                    1485 00108$:
   6098 21 21 59      [10] 1486 	ld	hl, #(_player + 0x0049) + 0
   609B 46            [ 7] 1487 	ld	b,(hl)
   609C 79            [ 4] 1488 	ld	a,c
   609D 90            [ 4] 1489 	sub	a, b
   609E 30 6C         [12] 1490 	jr	NC,00104$
                           1491 ;src/game.c:370: ent->vmem = cpct_getScreenPtr(CPCT_VMEM_START,ent->x, ent->y);
   60A0 2A 29 59      [16] 1492 	ld	hl, (#(_hearth + 0x0002) + 0)
   60A3 45            [ 4] 1493 	ld	b,l
   60A4 2A 27 59      [16] 1494 	ld	hl, (#_hearth + 0)
   60A7 7D            [ 4] 1495 	ld	a,l
   60A8 C5            [11] 1496 	push	bc
   60A9 C5            [11] 1497 	push	bc
   60AA 33            [ 6] 1498 	inc	sp
   60AB F5            [11] 1499 	push	af
   60AC 33            [ 6] 1500 	inc	sp
   60AD 21 00 C0      [10] 1501 	ld	hl,#0xC000
   60B0 E5            [11] 1502 	push	hl
   60B1 CD 27 72      [17] 1503 	call	_cpct_getScreenPtr
   60B4 5D            [ 4] 1504 	ld	e,l
   60B5 54            [ 4] 1505 	ld	d,h
   60B6 C1            [10] 1506 	pop	bc
   60B7 ED 53 48 59   [20] 1507 	ld	((_hearth + 0x0021)), de
                           1508 ;src/game.c:371: dibujarEntity(ent,ent->sw,ent->sh);
   60BB 21 3B 59      [10] 1509 	ld	hl, #(_hearth + 0x0014) + 0
   60BE 46            [ 7] 1510 	ld	b,(hl)
   60BF 21 3A 59      [10] 1511 	ld	hl, #(_hearth + 0x0013) + 0
   60C2 56            [ 7] 1512 	ld	d,(hl)
   60C3 C5            [11] 1513 	push	bc
   60C4 4A            [ 4] 1514 	ld	c, d
   60C5 C5            [11] 1515 	push	bc
   60C6 21 27 59      [10] 1516 	ld	hl,#_hearth
   60C9 E5            [11] 1517 	push	hl
   60CA CD 9A 8C      [17] 1518 	call	_dibujarEntity
   60CD F1            [10] 1519 	pop	af
   60CE F1            [10] 1520 	pop	af
   60CF C1            [10] 1521 	pop	bc
                           1522 ;src/game.c:372: ent->x+=10;
   60D0 ED 5B 27 59   [20] 1523 	ld	de, (#_hearth + 0)
   60D4 21 0A 00      [10] 1524 	ld	hl,#0x000A
   60D7 19            [11] 1525 	add	hl,de
   60D8 5D            [ 4] 1526 	ld	e,l
   60D9 54            [ 4] 1527 	ld	d,h
   60DA ED 53 27 59   [20] 1528 	ld	(_hearth), de
                           1529 ;src/game.c:369: for(i = 0; i < player.vida; ++i){
   60DE 0C            [ 4] 1530 	inc	c
   60DF 18 B7         [12] 1531 	jr	00108$
   60E1                    1532 00103$:
                           1533 ;src/game.c:380: ,ent->sh
   60E1 21 3B 59      [10] 1534 	ld	hl, #(_hearth + 0x0014) + 0
   60E4 56            [ 7] 1535 	ld	d,(hl)
                           1536 ;src/game.c:379: ,ent->sw
   60E5 21 3A 59      [10] 1537 	ld	hl, #(_hearth + 0x0013) + 0
   60E8 5E            [ 7] 1538 	ld	e,(hl)
                           1539 ;src/game.c:377: cpct_getScreenPtr(CPCT_VMEM_START,2 + 10*(player.vida),ent->y)
   60E9 2A 29 59      [16] 1540 	ld	hl, (#(_hearth + 0x0002) + 0)
   60EC 45            [ 4] 1541 	ld	b,l
   60ED 79            [ 4] 1542 	ld	a,c
   60EE 87            [ 4] 1543 	add	a, a
   60EF 87            [ 4] 1544 	add	a, a
   60F0 81            [ 4] 1545 	add	a, c
   60F1 87            [ 4] 1546 	add	a, a
   60F2 C6 02         [ 7] 1547 	add	a, #0x02
   60F4 D5            [11] 1548 	push	de
   60F5 C5            [11] 1549 	push	bc
   60F6 33            [ 6] 1550 	inc	sp
   60F7 F5            [11] 1551 	push	af
   60F8 33            [ 6] 1552 	inc	sp
   60F9 21 00 C0      [10] 1553 	ld	hl,#0xC000
   60FC E5            [11] 1554 	push	hl
   60FD CD 27 72      [17] 1555 	call	_cpct_getScreenPtr
   6100 4D            [ 4] 1556 	ld	c,l
   6101 44            [ 4] 1557 	ld	b,h
   6102 AF            [ 4] 1558 	xor	a, a
   6103 F5            [11] 1559 	push	af
   6104 33            [ 6] 1560 	inc	sp
   6105 C5            [11] 1561 	push	bc
   6106 CD 12 71      [17] 1562 	call	_cpct_drawSolidBox
   6109 F1            [10] 1563 	pop	af
   610A F1            [10] 1564 	pop	af
   610B 33            [ 6] 1565 	inc	sp
   610C                    1566 00104$:
                           1567 ;src/game.c:383: ent->x = 2;
   610C 21 02 00      [10] 1568 	ld	hl,#0x0002
   610F 22 27 59      [16] 1569 	ld	(_hearth), hl
                           1570 ;src/game.c:384: p->pvida = p->vida;
   6112 21 21 59      [10] 1571 	ld	hl,#_player + 73
   6115 4E            [ 7] 1572 	ld	c, (hl)
   6116 21 22 59      [10] 1573 	ld	hl,#(_player + 0x004a)
   6119 71            [ 7] 1574 	ld	(hl),c
   611A                    1575 00106$:
                           1576 ;src/game.c:387: dibujarPuntos();
   611A CD 94 61      [17] 1577 	call	_dibujarPuntos
                           1578 ;src/game.c:388: dibujarBase();
   611D CD 21 61      [17] 1579 	call	_dibujarBase
   6120 C9            [10] 1580 	ret
                           1581 ;src/game.c:390: void dibujarBase(){
                           1582 ;	---------------------------------
                           1583 ; Function dibujarBase
                           1584 ; ---------------------------------
   6121                    1585 _dibujarBase::
   6121 DD E5         [15] 1586 	push	ix
   6123 DD 21 00 00   [14] 1587 	ld	ix,#0
   6127 DD 39         [15] 1588 	add	ix,sp
   6129 F5            [11] 1589 	push	af
   612A F5            [11] 1590 	push	af
                           1591 ;src/game.c:392: if(basesCapturadas != prev_basesCapturadas){
   612B 3A 80 7D      [13] 1592 	ld	a,(#_basesCapturadas + 0)
   612E FD 21 81 7D   [14] 1593 	ld	iy,#_prev_basesCapturadas
   6132 FD 96 00      [19] 1594 	sub	a, 0 (iy)
   6135 28 55         [12] 1595 	jr	Z,00103$
                           1596 ;src/game.c:395: cpct_getScreenPtr(CPCT_VMEM_START,71,5)
   6137 21 47 05      [10] 1597 	ld	hl,#0x0547
   613A E5            [11] 1598 	push	hl
   613B 21 00 C0      [10] 1599 	ld	hl,#0xC000
   613E E5            [11] 1600 	push	hl
   613F CD 27 72      [17] 1601 	call	_cpct_getScreenPtr
   6142 4D            [ 4] 1602 	ld	c,l
   6143 44            [ 4] 1603 	ld	b,h
   6144 21 06 08      [10] 1604 	ld	hl,#0x0806
   6147 E5            [11] 1605 	push	hl
   6148 AF            [ 4] 1606 	xor	a, a
   6149 F5            [11] 1607 	push	af
   614A 33            [ 6] 1608 	inc	sp
   614B C5            [11] 1609 	push	bc
   614C CD 12 71      [17] 1610 	call	_cpct_drawSolidBox
   614F F1            [10] 1611 	pop	af
   6150 F1            [10] 1612 	pop	af
   6151 33            [ 6] 1613 	inc	sp
                           1614 ;src/game.c:400: sprintf(strPts,"%d",basesCapturadas);
   6152 21 80 7D      [10] 1615 	ld	hl,#_basesCapturadas + 0
   6155 5E            [ 7] 1616 	ld	e, (hl)
   6156 16 00         [ 7] 1617 	ld	d,#0x00
   6158 21 00 00      [10] 1618 	ld	hl,#0x0000
   615B 39            [11] 1619 	add	hl,sp
   615C E5            [11] 1620 	push	hl
   615D D5            [11] 1621 	push	de
   615E 11 91 61      [10] 1622 	ld	de,#___str_2
   6161 D5            [11] 1623 	push	de
   6162 E5            [11] 1624 	push	hl
   6163 CD 24 70      [17] 1625 	call	_sprintf
   6166 21 06 00      [10] 1626 	ld	hl,#6
   6169 39            [11] 1627 	add	hl,sp
   616A F9            [ 6] 1628 	ld	sp,hl
   616B 21 47 05      [10] 1629 	ld	hl,#0x0547
   616E E5            [11] 1630 	push	hl
   616F 21 00 C0      [10] 1631 	ld	hl,#0xC000
   6172 E5            [11] 1632 	push	hl
   6173 CD 27 72      [17] 1633 	call	_cpct_getScreenPtr
   6176 EB            [ 4] 1634 	ex	de,hl
   6177 C1            [10] 1635 	pop	bc
   6178 21 02 00      [10] 1636 	ld	hl,#0x0002
   617B E5            [11] 1637 	push	hl
   617C D5            [11] 1638 	push	de
   617D C5            [11] 1639 	push	bc
   617E CD 63 6D      [17] 1640 	call	_cpct_drawStringM0
   6181 21 06 00      [10] 1641 	ld	hl,#6
   6184 39            [11] 1642 	add	hl,sp
   6185 F9            [ 6] 1643 	ld	sp,hl
                           1644 ;src/game.c:402: prev_basesCapturadas = basesCapturadas;
   6186 3A 80 7D      [13] 1645 	ld	a,(#_basesCapturadas + 0)
   6189 32 81 7D      [13] 1646 	ld	(#_prev_basesCapturadas + 0),a
   618C                    1647 00103$:
   618C DD F9         [10] 1648 	ld	sp, ix
   618E DD E1         [14] 1649 	pop	ix
   6190 C9            [10] 1650 	ret
   6191                    1651 ___str_2:
   6191 25 64              1652 	.ascii "%d"
   6193 00                 1653 	.db 0x00
                           1654 ;src/game.c:405: void dibujarPuntos(){
                           1655 ;	---------------------------------
                           1656 ; Function dibujarPuntos
                           1657 ; ---------------------------------
   6194                    1658 _dibujarPuntos::
   6194 DD E5         [15] 1659 	push	ix
   6196 DD 21 00 00   [14] 1660 	ld	ix,#0
   619A DD 39         [15] 1661 	add	ix,sp
   619C F5            [11] 1662 	push	af
   619D F5            [11] 1663 	push	af
                           1664 ;src/game.c:406: TPlayer* p = &player;
                           1665 ;src/game.c:408: if(p->puntuacion != p->puntuacionPrev){
   619E ED 4B 23 59   [20] 1666 	ld	bc, (#(_player + 0x004b) + 0)
   61A2 ED 5B 25 59   [20] 1667 	ld	de, (#(_player + 0x004d) + 0)
   61A6 79            [ 4] 1668 	ld	a,c
   61A7 93            [ 4] 1669 	sub	a, e
   61A8 20 04         [12] 1670 	jr	NZ,00109$
   61AA 78            [ 4] 1671 	ld	a,b
   61AB 92            [ 4] 1672 	sub	a, d
   61AC 28 55         [12] 1673 	jr	Z,00103$
   61AE                    1674 00109$:
                           1675 ;src/game.c:412: cpct_getScreenPtr(CPCT_VMEM_START,63,23)
   61AE 21 3F 17      [10] 1676 	ld	hl,#0x173F
   61B1 E5            [11] 1677 	push	hl
   61B2 21 00 C0      [10] 1678 	ld	hl,#0xC000
   61B5 E5            [11] 1679 	push	hl
   61B6 CD 27 72      [17] 1680 	call	_cpct_getScreenPtr
   61B9 4D            [ 4] 1681 	ld	c,l
   61BA 44            [ 4] 1682 	ld	b,h
   61BB 21 14 08      [10] 1683 	ld	hl,#0x0814
   61BE E5            [11] 1684 	push	hl
   61BF AF            [ 4] 1685 	xor	a, a
   61C0 F5            [11] 1686 	push	af
   61C1 33            [ 6] 1687 	inc	sp
   61C2 C5            [11] 1688 	push	bc
   61C3 CD 12 71      [17] 1689 	call	_cpct_drawSolidBox
   61C6 F1            [10] 1690 	pop	af
   61C7 F1            [10] 1691 	pop	af
   61C8 33            [ 6] 1692 	inc	sp
                           1693 ;src/game.c:417: sprintf(strPts,"%d",p->puntuacion);
   61C9 ED 5B 23 59   [20] 1694 	ld	de, (#(_player + 0x004b) + 0)
   61CD 21 00 00      [10] 1695 	ld	hl,#0x0000
   61D0 39            [11] 1696 	add	hl,sp
   61D1 E5            [11] 1697 	push	hl
   61D2 D5            [11] 1698 	push	de
   61D3 11 08 62      [10] 1699 	ld	de,#___str_3
   61D6 D5            [11] 1700 	push	de
   61D7 E5            [11] 1701 	push	hl
   61D8 CD 24 70      [17] 1702 	call	_sprintf
   61DB 21 06 00      [10] 1703 	ld	hl,#6
   61DE 39            [11] 1704 	add	hl,sp
   61DF F9            [ 6] 1705 	ld	sp,hl
   61E0 21 3F 17      [10] 1706 	ld	hl,#0x173F
   61E3 E5            [11] 1707 	push	hl
   61E4 21 00 C0      [10] 1708 	ld	hl,#0xC000
   61E7 E5            [11] 1709 	push	hl
   61E8 CD 27 72      [17] 1710 	call	_cpct_getScreenPtr
   61EB EB            [ 4] 1711 	ex	de,hl
   61EC C1            [10] 1712 	pop	bc
   61ED 21 02 00      [10] 1713 	ld	hl,#0x0002
   61F0 E5            [11] 1714 	push	hl
   61F1 D5            [11] 1715 	push	de
   61F2 C5            [11] 1716 	push	bc
   61F3 CD 63 6D      [17] 1717 	call	_cpct_drawStringM0
   61F6 21 06 00      [10] 1718 	ld	hl,#6
   61F9 39            [11] 1719 	add	hl,sp
   61FA F9            [ 6] 1720 	ld	sp,hl
                           1721 ;src/game.c:419: p->puntuacionPrev = p->puntuacion;
   61FB ED 4B 23 59   [20] 1722 	ld	bc, (#(_player + 0x004b) + 0)
   61FF ED 43 25 59   [20] 1723 	ld	((_player + 0x004d)), bc
   6203                    1724 00103$:
   6203 DD F9         [10] 1725 	ld	sp, ix
   6205 DD E1         [14] 1726 	pop	ix
   6207 C9            [10] 1727 	ret
   6208                    1728 ___str_3:
   6208 25 64              1729 	.ascii "%d"
   620A 00                 1730 	.db 0x00
                           1731 ;src/game.c:423: void play(){
                           1732 ;	---------------------------------
                           1733 ; Function play
                           1734 ; ---------------------------------
   620B                    1735 _play::
                           1736 ;src/game.c:425: salirMenu = 0;
   620B 21 7F 7D      [10] 1737 	ld	hl,#_salirMenu + 0
   620E 36 00         [10] 1738 	ld	(hl), #0x00
                           1739 ;src/game.c:426: incializarEntities(&player);
   6210 21 D8 58      [10] 1740 	ld	hl,#_player
   6213 E5            [11] 1741 	push	hl
   6214 CD A1 7D      [17] 1742 	call	_incializarEntities
   6217 F1            [10] 1743 	pop	af
                           1744 ;src/game.c:427: inicializarPantalla();
   6218 CD 18 58      [17] 1745 	call	_inicializarPantalla
                           1746 ;src/game.c:430: while(player.vida>0){
   621B                    1747 00105$:
   621B 3A 21 59      [13] 1748 	ld	a, (#_player + 73)
   621E B7            [ 4] 1749 	or	a, a
   621F C8            [11] 1750 	ret	Z
                           1751 ;src/game.c:431: updateUser();
   6220 CD 42 5B      [17] 1752 	call	_updateUser
                           1753 ;src/game.c:432: updatePlayer(&player);
   6223 21 D8 58      [10] 1754 	ld	hl,#_player
   6226 E5            [11] 1755 	push	hl
   6227 CD FD 82      [17] 1756 	call	_updatePlayer
   622A F1            [10] 1757 	pop	af
                           1758 ;src/game.c:433: updateEntities();
   622B CD A8 85      [17] 1759 	call	_updateEntities
                           1760 ;src/game.c:435: calculaColisiones();
   622E CD 7A 5D      [17] 1761 	call	_calculaColisiones
                           1762 ;src/game.c:436: calculaAllEntities(&player);
   6231 21 D8 58      [10] 1763 	ld	hl,#_player
   6234 E5            [11] 1764 	push	hl
   6235 CD 40 8E      [17] 1765 	call	_calculaAllEntities
   6238 F1            [10] 1766 	pop	af
                           1767 ;src/game.c:438: cpct_waitVSYNC();
   6239 CD DC 70      [17] 1768 	call	_cpct_waitVSYNC
                           1769 ;src/game.c:440: drawAll(&player);
   623C 21 D8 58      [10] 1770 	ld	hl,#_player
   623F E5            [11] 1771 	push	hl
   6240 CD 09 8F      [17] 1772 	call	_drawAll
   6243 F1            [10] 1773 	pop	af
                           1774 ;src/game.c:441: drawHUD();
   6244 CD 85 60      [17] 1775 	call	_drawHUD
                           1776 ;src/game.c:443: if(salirMenu % 2 == 1){
   6247 3A 7F 7D      [13] 1777 	ld	a,(#_salirMenu + 0)
   624A E6 01         [ 7] 1778 	and	a, #0x01
   624C 3D            [ 4] 1779 	dec	a
   624D C8            [11] 1780 	ret	Z
                           1781 ;src/game.c:445: return;
   624E 18 00         [12] 1782 	jr	00102$
   6250                    1783 00102$:
                           1784 ;src/game.c:447: if(basesCapturadas == 6){
   6250 3A 80 7D      [13] 1785 	ld	a,(#_basesCapturadas + 0)
   6253 D6 06         [ 7] 1786 	sub	a, #0x06
   6255 20 C4         [12] 1787 	jr	NZ,00105$
                           1788 ;src/game.c:448: salirMenu = 1;
   6257 21 7F 7D      [10] 1789 	ld	hl,#_salirMenu + 0
   625A 36 01         [10] 1790 	ld	(hl), #0x01
                           1791 ;src/game.c:449: return;
   625C C9            [10] 1792 	ret
                           1793 	.area _CODE
                           1794 	.area _INITIALIZER
   7D8E                    1795 __xinit__mapa:
   7D8E 00 00              1796 	.dw #0x0000
   7D90                    1797 __xinit__mapaActual:
   7D90 00                 1798 	.db #0x00	; 0
   7D91                    1799 __xinit__previousMap:
   7D91 00                 1800 	.db #0x00	; 0
   7D92                    1801 __xinit__salirMenu:
   7D92 00                 1802 	.db #0x00	; 0
   7D93                    1803 __xinit__basesCapturadas:
   7D93 00                 1804 	.db #0x00	; 0
   7D94                    1805 __xinit__prev_basesCapturadas:
   7D94 00                 1806 	.db #0x00	; 0
   7D95                    1807 __xinit__wshot_cycles:
   7D95 1E                 1808 	.db #0x1E	; 30
   7D96                    1809 __xinit__count:
   7D96 00                 1810 	.db #0x00	; 0
                           1811 	.area _CABS (ABS)
