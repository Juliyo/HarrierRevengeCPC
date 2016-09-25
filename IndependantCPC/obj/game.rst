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
   4DE0                      39 _mapa::
   4DE0                      40 	.ds 2
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
                             61 ;src/game.c:22: void inicializarPantalla(){
                             62 ;	---------------------------------
                             63 ; Function inicializarPantalla
                             64 ; ---------------------------------
   4AD0                      65 _inicializarPantalla::
                             66 ;src/game.c:24: cpct_clearScreen(0);
   4AD0 21 00 40      [10]   67 	ld	hl,#0x4000
   4AD3 E5            [11]   68 	push	hl
   4AD4 AF            [ 4]   69 	xor	a, a
   4AD5 F5            [11]   70 	push	af
   4AD6 33            [ 6]   71 	inc	sp
   4AD7 26 C0         [ 7]   72 	ld	h, #0xC0
   4AD9 E5            [11]   73 	push	hl
   4ADA CD 45 4D      [17]   74 	call	_cpct_memset
                             75 ;src/game.c:26: mapa = g_map1;
   4ADD 21 00 40      [10]   76 	ld	hl,#_g_map1+0
   4AE0 22 E0 4D      [16]   77 	ld	(_mapa),hl
                             78 ;src/game.c:27: cpct_etm_setTileset2x4(g_tileset);
   4AE3 21 D0 47      [10]   79 	ld	hl,#_g_tileset
   4AE6 CD 8B 4C      [17]   80 	call	_cpct_etm_setTileset2x4
                             81 ;src/game.c:28: dibujarMapa();
   4AE9 CD F4 4A      [17]   82 	call	_dibujarMapa
   4AEC C9            [10]   83 	ret
   4AED                      84 _player:
   4AED 14                   85 	.db #0x14	; 20
   4AEE 9D                   86 	.db #0x9D	; 157
   4AEF ED                   87 	.byte (_player + 0)
   4AF0 EE                   88 	.byte (_player + 1)
   4AF1 01                   89 	.db #0x01	; 1
   4AF2 D0 48                90 	.dw _g_naves_0
                             91 ;src/game.c:32: void dibujarMapa(){
                             92 ;	---------------------------------
                             93 ; Function dibujarMapa
                             94 ; ---------------------------------
   4AF4                      95 _dibujarMapa::
                             96 ;src/game.c:33: cpct_etm_drawTilemap2x4(g_map1_W, g_map1_H, ORIGEN_MAPA, mapa);
   4AF4 2A E0 4D      [16]   97 	ld	hl,(_mapa)
   4AF7 E5            [11]   98 	push	hl
   4AF8 21 00 C0      [10]   99 	ld	hl,#0xC000
   4AFB E5            [11]  100 	push	hl
   4AFC 21 32 28      [10]  101 	ld	hl,#0x2832
   4AFF E5            [11]  102 	push	hl
   4B00 2E 00         [ 7]  103 	ld	l, #0x00
   4B02 E5            [11]  104 	push	hl
   4B03 AF            [ 4]  105 	xor	a, a
   4B04 F5            [11]  106 	push	af
   4B05 33            [ 6]  107 	inc	sp
   4B06 CD FC 4B      [17]  108 	call	_cpct_etm_drawTileBox2x4
   4B09 C9            [10]  109 	ret
                            110 ;src/game.c:36: void updateUser(){
                            111 ;	---------------------------------
                            112 ; Function updateUser
                            113 ; ---------------------------------
   4B0A                     114 _updateUser::
                            115 ;src/game.c:38: cpct_scanKeyboard_if();
   4B0A CD C7 4C      [17]  116 	call	_cpct_scanKeyboard_if
                            117 ;src/game.c:39: if(cpct_isAnyKeyPressed()){
   4B0D CD BA 4C      [17]  118 	call	_cpct_isAnyKeyPressed
   4B10 7D            [ 4]  119 	ld	a,l
   4B11 B7            [ 4]  120 	or	a, a
   4B12 C8            [11]  121 	ret	Z
                            122 ;src/game.c:40: if(cpct_isKeyPressed(Key_CursorUp)){
   4B13 21 00 01      [10]  123 	ld	hl,#0x0100
   4B16 CD E4 4B      [17]  124 	call	_cpct_isKeyPressed
   4B19 7D            [ 4]  125 	ld	a,l
   4B1A B7            [ 4]  126 	or	a, a
   4B1B 28 0E         [12]  127 	jr	Z,00110$
                            128 ;src/game.c:41: accion(&player, es_mover, d_up);
   4B1D 21 01 00      [10]  129 	ld	hl,#0x0001
   4B20 E5            [11]  130 	push	hl
   4B21 21 ED 4A      [10]  131 	ld	hl,#_player
   4B24 E5            [11]  132 	push	hl
   4B25 CD E5 4D      [17]  133 	call	_accion
   4B28 F1            [10]  134 	pop	af
   4B29 F1            [10]  135 	pop	af
   4B2A C9            [10]  136 	ret
   4B2B                     137 00110$:
                            138 ;src/game.c:42: }else if(cpct_isKeyPressed(Key_CursorDown)){
   4B2B 21 00 04      [10]  139 	ld	hl,#0x0400
   4B2E CD E4 4B      [17]  140 	call	_cpct_isKeyPressed
   4B31 7D            [ 4]  141 	ld	a,l
   4B32 B7            [ 4]  142 	or	a, a
   4B33 28 0E         [12]  143 	jr	Z,00107$
                            144 ;src/game.c:43: accion(&player, es_mover, d_down);
   4B35 21 01 01      [10]  145 	ld	hl,#0x0101
   4B38 E5            [11]  146 	push	hl
   4B39 21 ED 4A      [10]  147 	ld	hl,#_player
   4B3C E5            [11]  148 	push	hl
   4B3D CD E5 4D      [17]  149 	call	_accion
   4B40 F1            [10]  150 	pop	af
   4B41 F1            [10]  151 	pop	af
   4B42 C9            [10]  152 	ret
   4B43                     153 00107$:
                            154 ;src/game.c:44: }else if(cpct_isKeyPressed(Key_CursorRight)){
   4B43 21 00 02      [10]  155 	ld	hl,#0x0200
   4B46 CD E4 4B      [17]  156 	call	_cpct_isKeyPressed
   4B49 7D            [ 4]  157 	ld	a,l
   4B4A B7            [ 4]  158 	or	a, a
   4B4B 28 0E         [12]  159 	jr	Z,00104$
                            160 ;src/game.c:45: accion(&player,es_mover,d_right);
   4B4D 21 01 02      [10]  161 	ld	hl,#0x0201
   4B50 E5            [11]  162 	push	hl
   4B51 21 ED 4A      [10]  163 	ld	hl,#_player
   4B54 E5            [11]  164 	push	hl
   4B55 CD E5 4D      [17]  165 	call	_accion
   4B58 F1            [10]  166 	pop	af
   4B59 F1            [10]  167 	pop	af
   4B5A C9            [10]  168 	ret
   4B5B                     169 00104$:
                            170 ;src/game.c:46: }else if(cpct_isKeyPressed(Key_CursorLeft)){
   4B5B 21 01 01      [10]  171 	ld	hl,#0x0101
   4B5E CD E4 4B      [17]  172 	call	_cpct_isKeyPressed
   4B61 7D            [ 4]  173 	ld	a,l
   4B62 B7            [ 4]  174 	or	a, a
   4B63 C8            [11]  175 	ret	Z
                            176 ;src/game.c:47: accion(&player,es_mover,d_left);
   4B64 21 01 03      [10]  177 	ld	hl,#0x0301
   4B67 E5            [11]  178 	push	hl
   4B68 21 ED 4A      [10]  179 	ld	hl,#_player
   4B6B E5            [11]  180 	push	hl
   4B6C CD E5 4D      [17]  181 	call	_accion
   4B6F F1            [10]  182 	pop	af
   4B70 F1            [10]  183 	pop	af
   4B71 C9            [10]  184 	ret
                            185 ;src/game.c:55: void play(){
                            186 ;	---------------------------------
                            187 ; Function play
                            188 ; ---------------------------------
   4B72                     189 _play::
   4B72 DD E5         [15]  190 	push	ix
   4B74 DD 21 00 00   [14]  191 	ld	ix,#0
   4B78 DD 39         [15]  192 	add	ix,sp
   4B7A 3B            [ 6]  193 	dec	sp
                            194 ;src/game.c:57: u8 alive = 1;
   4B7B DD 36 FF 01   [19]  195 	ld	-1 (ix),#0x01
                            196 ;src/game.c:59: inicializarPantalla();
   4B7F CD D0 4A      [17]  197 	call	_inicializarPantalla
                            198 ;src/game.c:60: incializarEntities();
   4B82 CD E4 4D      [17]  199 	call	_incializarEntities
                            200 ;src/game.c:63: while(alive){
   4B85                     201 00101$:
   4B85 DD 7E FF      [19]  202 	ld	a,-1 (ix)
   4B88 B7            [ 4]  203 	or	a, a
   4B89 28 1B         [12]  204 	jr	Z,00104$
                            205 ;src/game.c:64: updateUser();	
   4B8B CD 0A 4B      [17]  206 	call	_updateUser
                            207 ;src/game.c:65: alive = updatePlayer(&player);
   4B8E 21 ED 4A      [10]  208 	ld	hl,#_player
   4B91 E5            [11]  209 	push	hl
   4B92 CD AE 4E      [17]  210 	call	_updatePlayer
   4B95 F1            [10]  211 	pop	af
   4B96 DD 75 FF      [19]  212 	ld	-1 (ix),l
                            213 ;src/game.c:67: cpct_waitVSYNC();
   4B99 CD 3D 4D      [17]  214 	call	_cpct_waitVSYNC
                            215 ;src/game.c:68: drawAll(&player);
   4B9C 21 ED 4A      [10]  216 	ld	hl,#_player
   4B9F E5            [11]  217 	push	hl
   4BA0 CD 68 4F      [17]  218 	call	_drawAll
   4BA3 F1            [10]  219 	pop	af
   4BA4 18 DF         [12]  220 	jr	00101$
   4BA6                     221 00104$:
   4BA6 33            [ 6]  222 	inc	sp
   4BA7 DD E1         [14]  223 	pop	ix
   4BA9 C9            [10]  224 	ret
                            225 	.area _CODE
                            226 	.area _INITIALIZER
   4DE2                     227 __xinit__mapa:
   4DE2 00 00               228 	.dw #0x0000
                            229 	.area _CABS (ABS)
