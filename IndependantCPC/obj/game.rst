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
                             11 	.globl _drawAll
                             12 	.globl _updatePlayer
                             13 	.globl _accion
                             14 	.globl _incializarEntities
                             15 	.globl _cpct_etm_setTileset2x4
                             16 	.globl _cpct_etm_drawTileBox2x4
                             17 	.globl _cpct_waitVSYNC
                             18 	.globl _cpct_isAnyKeyPressed
                             19 	.globl _cpct_isKeyPressed
                             20 	.globl _cpct_scanKeyboard_if
                             21 	.globl _cpct_memset
                             22 	.globl _mapa
                             23 	.globl _player
                             24 	.globl _inicializarPantalla
                             25 	.globl _dibujarMapa
                             26 	.globl _updateUser
                             27 	.globl _play
                             28 ;--------------------------------------------------------
                             29 ; special function registers
                             30 ;--------------------------------------------------------
                             31 ;--------------------------------------------------------
                             32 ; ram data
                             33 ;--------------------------------------------------------
                             34 	.area _DATA
                             35 ;--------------------------------------------------------
                             36 ; ram data
                             37 ;--------------------------------------------------------
                             38 	.area _INITIALIZED
   4E09                      39 _mapa::
   4E09                      40 	.ds 2
                             41 ;--------------------------------------------------------
                             42 ; absolute external ram data
                             43 ;--------------------------------------------------------
                             44 	.area _DABS (ABS)
                             45 ;--------------------------------------------------------
                             46 ; global & static initialisations
                             47 ;--------------------------------------------------------
                             48 	.area _HOME
                             49 	.area _GSINIT
                             50 	.area _GSFINAL
                             51 	.area _GSINIT
                             52 ;--------------------------------------------------------
                             53 ; Home
                             54 ;--------------------------------------------------------
                             55 	.area _HOME
                             56 	.area _HOME
                             57 ;--------------------------------------------------------
                             58 ; code
                             59 ;--------------------------------------------------------
                             60 	.area _CODE
                             61 ;src/game.c:23: void inicializarPantalla(){
                             62 ;	---------------------------------
                             63 ; Function inicializarPantalla
                             64 ; ---------------------------------
   4AF8                      65 _inicializarPantalla::
                             66 ;src/game.c:25: cpct_clearScreen(0);
   4AF8 21 00 40      [10]   67 	ld	hl,#0x4000
   4AFB E5            [11]   68 	push	hl
   4AFC AF            [ 4]   69 	xor	a, a
   4AFD F5            [11]   70 	push	af
   4AFE 33            [ 6]   71 	inc	sp
   4AFF 26 C0         [ 7]   72 	ld	h, #0xC0
   4B01 E5            [11]   73 	push	hl
   4B02 CD 6E 4D      [17]   74 	call	_cpct_memset
                             75 ;src/game.c:27: mapa = g_map1;
   4B05 21 00 40      [10]   76 	ld	hl,#_g_map1+0
   4B08 22 09 4E      [16]   77 	ld	(_mapa),hl
                             78 ;src/game.c:28: cpct_etm_setTileset2x4(g_tileset);
   4B0B 21 D0 47      [10]   79 	ld	hl,#_g_tileset
   4B0E CD B4 4C      [17]   80 	call	_cpct_etm_setTileset2x4
                             81 ;src/game.c:29: dibujarMapa();
   4B11 CD 1D 4B      [17]   82 	call	_dibujarMapa
   4B14 C9            [10]   83 	ret
   4B15                      84 _player:
   4B15 14                   85 	.db #0x14	; 20
   4B16 9D                   86 	.db #0x9D	; 157
   4B17 15                   87 	.byte (_player + 0)
   4B18 16                   88 	.byte (_player + 1)
   4B19 01                   89 	.db #0x01	; 1
   4B1A F8 48                90 	.dw _g_naves_0
   4B1C 00                   91 	.db #0x00	; 0
                             92 ;src/game.c:33: void dibujarMapa(){
                             93 ;	---------------------------------
                             94 ; Function dibujarMapa
                             95 ; ---------------------------------
   4B1D                      96 _dibujarMapa::
                             97 ;src/game.c:34: cpct_etm_drawTilemap2x4(g_map1_W, g_map1_H, ORIGEN_MAPA, mapa);
   4B1D 2A 09 4E      [16]   98 	ld	hl,(_mapa)
   4B20 E5            [11]   99 	push	hl
   4B21 21 00 C0      [10]  100 	ld	hl,#0xC000
   4B24 E5            [11]  101 	push	hl
   4B25 21 32 28      [10]  102 	ld	hl,#0x2832
   4B28 E5            [11]  103 	push	hl
   4B29 2E 00         [ 7]  104 	ld	l, #0x00
   4B2B E5            [11]  105 	push	hl
   4B2C AF            [ 4]  106 	xor	a, a
   4B2D F5            [11]  107 	push	af
   4B2E 33            [ 6]  108 	inc	sp
   4B2F CD 25 4C      [17]  109 	call	_cpct_etm_drawTileBox2x4
   4B32 C9            [10]  110 	ret
                            111 ;src/game.c:37: void updateUser(){
                            112 ;	---------------------------------
                            113 ; Function updateUser
                            114 ; ---------------------------------
   4B33                     115 _updateUser::
                            116 ;src/game.c:39: cpct_scanKeyboard_if();
   4B33 CD F0 4C      [17]  117 	call	_cpct_scanKeyboard_if
                            118 ;src/game.c:40: if(cpct_isAnyKeyPressed()){
   4B36 CD E3 4C      [17]  119 	call	_cpct_isAnyKeyPressed
   4B39 7D            [ 4]  120 	ld	a,l
   4B3A B7            [ 4]  121 	or	a, a
   4B3B C8            [11]  122 	ret	Z
                            123 ;src/game.c:41: if(cpct_isKeyPressed(Key_CursorUp)){
   4B3C 21 00 01      [10]  124 	ld	hl,#0x0100
   4B3F CD 0D 4C      [17]  125 	call	_cpct_isKeyPressed
   4B42 7D            [ 4]  126 	ld	a,l
   4B43 B7            [ 4]  127 	or	a, a
   4B44 28 0E         [12]  128 	jr	Z,00110$
                            129 ;src/game.c:42: accion(&player, es_mover, d_up);
   4B46 21 01 00      [10]  130 	ld	hl,#0x0001
   4B49 E5            [11]  131 	push	hl
   4B4A 21 15 4B      [10]  132 	ld	hl,#_player
   4B4D E5            [11]  133 	push	hl
   4B4E CD 1E 4E      [17]  134 	call	_accion
   4B51 F1            [10]  135 	pop	af
   4B52 F1            [10]  136 	pop	af
   4B53 C9            [10]  137 	ret
   4B54                     138 00110$:
                            139 ;src/game.c:43: }else if(cpct_isKeyPressed(Key_CursorDown)){
   4B54 21 00 04      [10]  140 	ld	hl,#0x0400
   4B57 CD 0D 4C      [17]  141 	call	_cpct_isKeyPressed
   4B5A 7D            [ 4]  142 	ld	a,l
   4B5B B7            [ 4]  143 	or	a, a
   4B5C 28 0E         [12]  144 	jr	Z,00107$
                            145 ;src/game.c:44: accion(&player, es_mover, d_down);
   4B5E 21 01 01      [10]  146 	ld	hl,#0x0101
   4B61 E5            [11]  147 	push	hl
   4B62 21 15 4B      [10]  148 	ld	hl,#_player
   4B65 E5            [11]  149 	push	hl
   4B66 CD 1E 4E      [17]  150 	call	_accion
   4B69 F1            [10]  151 	pop	af
   4B6A F1            [10]  152 	pop	af
   4B6B C9            [10]  153 	ret
   4B6C                     154 00107$:
                            155 ;src/game.c:45: }else if(cpct_isKeyPressed(Key_CursorRight)){
   4B6C 21 00 02      [10]  156 	ld	hl,#0x0200
   4B6F CD 0D 4C      [17]  157 	call	_cpct_isKeyPressed
   4B72 7D            [ 4]  158 	ld	a,l
   4B73 B7            [ 4]  159 	or	a, a
   4B74 28 0E         [12]  160 	jr	Z,00104$
                            161 ;src/game.c:46: accion(&player,es_mover,d_right);
   4B76 21 01 02      [10]  162 	ld	hl,#0x0201
   4B79 E5            [11]  163 	push	hl
   4B7A 21 15 4B      [10]  164 	ld	hl,#_player
   4B7D E5            [11]  165 	push	hl
   4B7E CD 1E 4E      [17]  166 	call	_accion
   4B81 F1            [10]  167 	pop	af
   4B82 F1            [10]  168 	pop	af
   4B83 C9            [10]  169 	ret
   4B84                     170 00104$:
                            171 ;src/game.c:47: }else if(cpct_isKeyPressed(Key_CursorLeft)){
   4B84 21 01 01      [10]  172 	ld	hl,#0x0101
   4B87 CD 0D 4C      [17]  173 	call	_cpct_isKeyPressed
   4B8A 7D            [ 4]  174 	ld	a,l
   4B8B B7            [ 4]  175 	or	a, a
   4B8C C8            [11]  176 	ret	Z
                            177 ;src/game.c:48: accion(&player,es_mover,d_left);
   4B8D 21 01 03      [10]  178 	ld	hl,#0x0301
   4B90 E5            [11]  179 	push	hl
   4B91 21 15 4B      [10]  180 	ld	hl,#_player
   4B94 E5            [11]  181 	push	hl
   4B95 CD 1E 4E      [17]  182 	call	_accion
   4B98 F1            [10]  183 	pop	af
   4B99 F1            [10]  184 	pop	af
   4B9A C9            [10]  185 	ret
                            186 ;src/game.c:56: void play(){
                            187 ;	---------------------------------
                            188 ; Function play
                            189 ; ---------------------------------
   4B9B                     190 _play::
   4B9B DD E5         [15]  191 	push	ix
   4B9D DD 21 00 00   [14]  192 	ld	ix,#0
   4BA1 DD 39         [15]  193 	add	ix,sp
   4BA3 3B            [ 6]  194 	dec	sp
                            195 ;src/game.c:58: u8 alive = 1;
   4BA4 DD 36 FF 01   [19]  196 	ld	-1 (ix),#0x01
                            197 ;src/game.c:60: inicializarPantalla();
   4BA8 CD F8 4A      [17]  198 	call	_inicializarPantalla
                            199 ;src/game.c:61: incializarEntities();
   4BAB CD 0D 4E      [17]  200 	call	_incializarEntities
                            201 ;src/game.c:64: while(alive){
   4BAE                     202 00101$:
   4BAE DD 7E FF      [19]  203 	ld	a,-1 (ix)
   4BB1 B7            [ 4]  204 	or	a, a
   4BB2 28 1B         [12]  205 	jr	Z,00104$
                            206 ;src/game.c:65: updateUser();	
   4BB4 CD 33 4B      [17]  207 	call	_updateUser
                            208 ;src/game.c:66: alive = updatePlayer(&player);
   4BB7 21 15 4B      [10]  209 	ld	hl,#_player
   4BBA E5            [11]  210 	push	hl
   4BBB CD DE 4F      [17]  211 	call	_updatePlayer
   4BBE F1            [10]  212 	pop	af
   4BBF DD 75 FF      [19]  213 	ld	-1 (ix),l
                            214 ;src/game.c:68: cpct_waitVSYNC();
   4BC2 CD 66 4D      [17]  215 	call	_cpct_waitVSYNC
                            216 ;src/game.c:69: drawAll(&player);
   4BC5 21 15 4B      [10]  217 	ld	hl,#_player
   4BC8 E5            [11]  218 	push	hl
   4BC9 CD BD 50      [17]  219 	call	_drawAll
   4BCC F1            [10]  220 	pop	af
   4BCD 18 DF         [12]  221 	jr	00101$
   4BCF                     222 00104$:
   4BCF 33            [ 6]  223 	inc	sp
   4BD0 DD E1         [14]  224 	pop	ix
   4BD2 C9            [10]  225 	ret
                            226 	.area _CODE
                            227 	.area _INITIALIZER
   4E0B                     228 __xinit__mapa:
   4E0B 00 00               229 	.dw #0x0000
                            230 	.area _CABS (ABS)
