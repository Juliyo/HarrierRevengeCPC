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
                             12 	.globl _updateEntities
                             13 	.globl _updatePlayer
                             14 	.globl _accion
                             15 	.globl _incializarEntities
                             16 	.globl _cpct_etm_setTileset2x4
                             17 	.globl _cpct_etm_drawTileBox2x4
                             18 	.globl _cpct_waitVSYNC
                             19 	.globl _cpct_isAnyKeyPressed
                             20 	.globl _cpct_isKeyPressed
                             21 	.globl _cpct_scanKeyboard_if
                             22 	.globl _cpct_memset
                             23 	.globl _mapa
                             24 	.globl _player
                             25 	.globl _inicializarPantalla
                             26 	.globl _dibujarMapa
                             27 	.globl _updateUser
                             28 	.globl _play
                             29 ;--------------------------------------------------------
                             30 ; special function registers
                             31 ;--------------------------------------------------------
                             32 ;--------------------------------------------------------
                             33 ; ram data
                             34 ;--------------------------------------------------------
                             35 	.area _DATA
                             36 ;--------------------------------------------------------
                             37 ; ram data
                             38 ;--------------------------------------------------------
                             39 	.area _INITIALIZED
   4E0C                      40 _mapa::
   4E0C                      41 	.ds 2
                             42 ;--------------------------------------------------------
                             43 ; absolute external ram data
                             44 ;--------------------------------------------------------
                             45 	.area _DABS (ABS)
                             46 ;--------------------------------------------------------
                             47 ; global & static initialisations
                             48 ;--------------------------------------------------------
                             49 	.area _HOME
                             50 	.area _GSINIT
                             51 	.area _GSFINAL
                             52 	.area _GSINIT
                             53 ;--------------------------------------------------------
                             54 ; Home
                             55 ;--------------------------------------------------------
                             56 	.area _HOME
                             57 	.area _HOME
                             58 ;--------------------------------------------------------
                             59 ; code
                             60 ;--------------------------------------------------------
                             61 	.area _CODE
                             62 ;src/game.c:23: void inicializarPantalla(){
                             63 ;	---------------------------------
                             64 ; Function inicializarPantalla
                             65 ; ---------------------------------
   4AF8                      66 _inicializarPantalla::
                             67 ;src/game.c:25: cpct_clearScreen(0);
   4AF8 21 00 40      [10]   68 	ld	hl,#0x4000
   4AFB E5            [11]   69 	push	hl
   4AFC AF            [ 4]   70 	xor	a, a
   4AFD F5            [11]   71 	push	af
   4AFE 33            [ 6]   72 	inc	sp
   4AFF 26 C0         [ 7]   73 	ld	h, #0xC0
   4B01 E5            [11]   74 	push	hl
   4B02 CD 71 4D      [17]   75 	call	_cpct_memset
                             76 ;src/game.c:27: mapa = g_map1;
   4B05 21 00 40      [10]   77 	ld	hl,#_g_map1+0
   4B08 22 0C 4E      [16]   78 	ld	(_mapa),hl
                             79 ;src/game.c:28: cpct_etm_setTileset2x4(g_tileset);
   4B0B 21 D0 47      [10]   80 	ld	hl,#_g_tileset
   4B0E CD B7 4C      [17]   81 	call	_cpct_etm_setTileset2x4
                             82 ;src/game.c:29: dibujarMapa();
   4B11 CD 1D 4B      [17]   83 	call	_dibujarMapa
   4B14 C9            [10]   84 	ret
   4B15                      85 _player:
   4B15 14                   86 	.db #0x14	; 20
   4B16 9D                   87 	.db #0x9D	; 157
   4B17 15                   88 	.byte (_player + 0)
   4B18 16                   89 	.byte (_player + 1)
   4B19 01                   90 	.db #0x01	; 1
   4B1A F8 48                91 	.dw _g_naves_0
   4B1C 00                   92 	.db #0x00	; 0
                             93 ;src/game.c:33: void dibujarMapa(){
                             94 ;	---------------------------------
                             95 ; Function dibujarMapa
                             96 ; ---------------------------------
   4B1D                      97 _dibujarMapa::
                             98 ;src/game.c:34: cpct_etm_drawTilemap2x4(g_map1_W, g_map1_H, ORIGEN_MAPA, mapa);
   4B1D 2A 0C 4E      [16]   99 	ld	hl,(_mapa)
   4B20 E5            [11]  100 	push	hl
   4B21 21 00 C0      [10]  101 	ld	hl,#0xC000
   4B24 E5            [11]  102 	push	hl
   4B25 21 32 28      [10]  103 	ld	hl,#0x2832
   4B28 E5            [11]  104 	push	hl
   4B29 2E 00         [ 7]  105 	ld	l, #0x00
   4B2B E5            [11]  106 	push	hl
   4B2C AF            [ 4]  107 	xor	a, a
   4B2D F5            [11]  108 	push	af
   4B2E 33            [ 6]  109 	inc	sp
   4B2F CD 28 4C      [17]  110 	call	_cpct_etm_drawTileBox2x4
   4B32 C9            [10]  111 	ret
                            112 ;src/game.c:37: void updateUser(){
                            113 ;	---------------------------------
                            114 ; Function updateUser
                            115 ; ---------------------------------
   4B33                     116 _updateUser::
                            117 ;src/game.c:39: cpct_scanKeyboard_if();
   4B33 CD F3 4C      [17]  118 	call	_cpct_scanKeyboard_if
                            119 ;src/game.c:40: if(cpct_isAnyKeyPressed()){
   4B36 CD E6 4C      [17]  120 	call	_cpct_isAnyKeyPressed
   4B39 7D            [ 4]  121 	ld	a,l
   4B3A B7            [ 4]  122 	or	a, a
   4B3B C8            [11]  123 	ret	Z
                            124 ;src/game.c:41: if(cpct_isKeyPressed(Key_CursorUp)){
   4B3C 21 00 01      [10]  125 	ld	hl,#0x0100
   4B3F CD 10 4C      [17]  126 	call	_cpct_isKeyPressed
   4B42 7D            [ 4]  127 	ld	a,l
   4B43 B7            [ 4]  128 	or	a, a
   4B44 28 0E         [12]  129 	jr	Z,00110$
                            130 ;src/game.c:42: accion(&player, es_mover, d_up);
   4B46 21 01 00      [10]  131 	ld	hl,#0x0001
   4B49 E5            [11]  132 	push	hl
   4B4A 21 15 4B      [10]  133 	ld	hl,#_player
   4B4D E5            [11]  134 	push	hl
   4B4E CD 21 4E      [17]  135 	call	_accion
   4B51 F1            [10]  136 	pop	af
   4B52 F1            [10]  137 	pop	af
   4B53 C9            [10]  138 	ret
   4B54                     139 00110$:
                            140 ;src/game.c:43: }else if(cpct_isKeyPressed(Key_CursorDown)){
   4B54 21 00 04      [10]  141 	ld	hl,#0x0400
   4B57 CD 10 4C      [17]  142 	call	_cpct_isKeyPressed
   4B5A 7D            [ 4]  143 	ld	a,l
   4B5B B7            [ 4]  144 	or	a, a
   4B5C 28 0E         [12]  145 	jr	Z,00107$
                            146 ;src/game.c:44: accion(&player, es_mover, d_down);
   4B5E 21 01 01      [10]  147 	ld	hl,#0x0101
   4B61 E5            [11]  148 	push	hl
   4B62 21 15 4B      [10]  149 	ld	hl,#_player
   4B65 E5            [11]  150 	push	hl
   4B66 CD 21 4E      [17]  151 	call	_accion
   4B69 F1            [10]  152 	pop	af
   4B6A F1            [10]  153 	pop	af
   4B6B C9            [10]  154 	ret
   4B6C                     155 00107$:
                            156 ;src/game.c:45: }else if(cpct_isKeyPressed(Key_CursorRight)){
   4B6C 21 00 02      [10]  157 	ld	hl,#0x0200
   4B6F CD 10 4C      [17]  158 	call	_cpct_isKeyPressed
   4B72 7D            [ 4]  159 	ld	a,l
   4B73 B7            [ 4]  160 	or	a, a
   4B74 28 0E         [12]  161 	jr	Z,00104$
                            162 ;src/game.c:46: accion(&player,es_mover,d_right);
   4B76 21 01 02      [10]  163 	ld	hl,#0x0201
   4B79 E5            [11]  164 	push	hl
   4B7A 21 15 4B      [10]  165 	ld	hl,#_player
   4B7D E5            [11]  166 	push	hl
   4B7E CD 21 4E      [17]  167 	call	_accion
   4B81 F1            [10]  168 	pop	af
   4B82 F1            [10]  169 	pop	af
   4B83 C9            [10]  170 	ret
   4B84                     171 00104$:
                            172 ;src/game.c:47: }else if(cpct_isKeyPressed(Key_CursorLeft)){
   4B84 21 01 01      [10]  173 	ld	hl,#0x0101
   4B87 CD 10 4C      [17]  174 	call	_cpct_isKeyPressed
   4B8A 7D            [ 4]  175 	ld	a,l
   4B8B B7            [ 4]  176 	or	a, a
   4B8C C8            [11]  177 	ret	Z
                            178 ;src/game.c:48: accion(&player,es_mover,d_left);
   4B8D 21 01 03      [10]  179 	ld	hl,#0x0301
   4B90 E5            [11]  180 	push	hl
   4B91 21 15 4B      [10]  181 	ld	hl,#_player
   4B94 E5            [11]  182 	push	hl
   4B95 CD 21 4E      [17]  183 	call	_accion
   4B98 F1            [10]  184 	pop	af
   4B99 F1            [10]  185 	pop	af
   4B9A C9            [10]  186 	ret
                            187 ;src/game.c:56: void play(){
                            188 ;	---------------------------------
                            189 ; Function play
                            190 ; ---------------------------------
   4B9B                     191 _play::
   4B9B DD E5         [15]  192 	push	ix
   4B9D DD 21 00 00   [14]  193 	ld	ix,#0
   4BA1 DD 39         [15]  194 	add	ix,sp
   4BA3 3B            [ 6]  195 	dec	sp
                            196 ;src/game.c:58: u8 alive = 1;
   4BA4 DD 36 FF 01   [19]  197 	ld	-1 (ix),#0x01
                            198 ;src/game.c:60: inicializarPantalla();
   4BA8 CD F8 4A      [17]  199 	call	_inicializarPantalla
                            200 ;src/game.c:61: incializarEntities();
   4BAB CD 10 4E      [17]  201 	call	_incializarEntities
                            202 ;src/game.c:64: while(alive){
   4BAE                     203 00101$:
   4BAE DD 7E FF      [19]  204 	ld	a,-1 (ix)
   4BB1 B7            [ 4]  205 	or	a, a
   4BB2 28 1E         [12]  206 	jr	Z,00104$
                            207 ;src/game.c:65: updateUser();	
   4BB4 CD 33 4B      [17]  208 	call	_updateUser
                            209 ;src/game.c:66: alive = updatePlayer(&player);
   4BB7 21 15 4B      [10]  210 	ld	hl,#_player
   4BBA E5            [11]  211 	push	hl
   4BBB CD E1 4F      [17]  212 	call	_updatePlayer
   4BBE F1            [10]  213 	pop	af
   4BBF DD 75 FF      [19]  214 	ld	-1 (ix),l
                            215 ;src/game.c:67: updateEntities();
   4BC2 CD E4 4F      [17]  216 	call	_updateEntities
                            217 ;src/game.c:68: cpct_waitVSYNC();
   4BC5 CD 69 4D      [17]  218 	call	_cpct_waitVSYNC
                            219 ;src/game.c:69: drawAll(&player);
   4BC8 21 15 4B      [10]  220 	ld	hl,#_player
   4BCB E5            [11]  221 	push	hl
   4BCC CD C0 50      [17]  222 	call	_drawAll
   4BCF F1            [10]  223 	pop	af
   4BD0 18 DC         [12]  224 	jr	00101$
   4BD2                     225 00104$:
   4BD2 33            [ 6]  226 	inc	sp
   4BD3 DD E1         [14]  227 	pop	ix
   4BD5 C9            [10]  228 	ret
                            229 	.area _CODE
                            230 	.area _INITIALIZER
   4E0E                     231 __xinit__mapa:
   4E0E 00 00               232 	.dw #0x0000
                            233 	.area _CABS (ABS)
