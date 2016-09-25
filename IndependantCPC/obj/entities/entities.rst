                              1 ;--------------------------------------------------------
                              2 ; File Created by SDCC : free open source ANSI-C Compiler
                              3 ; Version 3.5.5 #9498 (Linux)
                              4 ;--------------------------------------------------------
                              5 	.module entities
                              6 	.optsdcc -mz80
                              7 	
                              8 ;--------------------------------------------------------
                              9 ; Public variables in this module
                             10 ;--------------------------------------------------------
                             11 	.globl _cpct_etm_drawTileBox2x4
                             12 	.globl _cpct_getScreenPtr
                             13 	.globl _cpct_drawSpriteMaskedAlignedTable
                             14 	.globl _incializarEntities
                             15 	.globl _accion
                             16 	.globl _moverArriba
                             17 	.globl _moverAbajo
                             18 	.globl _moverIzquierda
                             19 	.globl _moverDerecha
                             20 	.globl _updatePlayer
                             21 	.globl _redibujarPlayer
                             22 	.globl _borrarPlayer
                             23 	.globl _dibujarPlayer
                             24 	.globl _drawAll
                             25 ;--------------------------------------------------------
                             26 ; special function registers
                             27 ;--------------------------------------------------------
                             28 ;--------------------------------------------------------
                             29 ; ram data
                             30 ;--------------------------------------------------------
                             31 	.area _DATA
                             32 ;--------------------------------------------------------
                             33 ; ram data
                             34 ;--------------------------------------------------------
                             35 	.area _INITIALIZED
                             36 ;--------------------------------------------------------
                             37 ; absolute external ram data
                             38 ;--------------------------------------------------------
                             39 	.area _DABS (ABS)
                             40 ;--------------------------------------------------------
                             41 ; global & static initialisations
                             42 ;--------------------------------------------------------
                             43 	.area _HOME
                             44 	.area _GSINIT
                             45 	.area _GSFINAL
                             46 	.area _GSINIT
                             47 ;--------------------------------------------------------
                             48 ; Home
                             49 ;--------------------------------------------------------
                             50 	.area _HOME
                             51 	.area _HOME
                             52 ;--------------------------------------------------------
                             53 ; code
                             54 ;--------------------------------------------------------
                             55 	.area _CODE
                             56 ;src/entities/entities.c:9: cpctm_createTransparentMaskTable(g_tablatrans,0x0100,M0,0);
                             57 ;	---------------------------------
                             58 ; Function dummy_cpct_transparentMaskTable0M0_container
                             59 ; ---------------------------------
   4BCD                      60 _dummy_cpct_transparentMaskTable0M0_container::
                             61 	.area _g_tablatrans_ (ABS) 
   0100                      62 	.org 0x0100 
   0100                      63 	 _g_tablatrans::
   0100 FF AA 55 00 AA AA    64 	.db 0xFF, 0xAA, 0x55, 0x00, 0xAA, 0xAA, 0x00, 0x00 
        00 00
   0108 55 00 55 00 00 00    65 	.db 0x55, 0x00, 0x55, 0x00, 0x00, 0x00, 0x00, 0x00 
        00 00
   0110 AA AA 00 00 AA AA    66 	.db 0xAA, 0xAA, 0x00, 0x00, 0xAA, 0xAA, 0x00, 0x00 
        00 00
   0118 00 00 00 00 00 00    67 	.db 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00 
        00 00
   0120 55 00 55 00 00 00    68 	.db 0x55, 0x00, 0x55, 0x00, 0x00, 0x00, 0x00, 0x00 
        00 00
   0128 55 00 55 00 00 00    69 	.db 0x55, 0x00, 0x55, 0x00, 0x00, 0x00, 0x00, 0x00 
        00 00
   0130 00 00 00 00 00 00    70 	.db 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00 
        00 00
   0138 00 00 00 00 00 00    71 	.db 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00 
        00 00
   0140 AA AA 00 00 AA AA    72 	.db 0xAA, 0xAA, 0x00, 0x00, 0xAA, 0xAA, 0x00, 0x00 
        00 00
   0148 00 00 00 00 00 00    73 	.db 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00 
        00 00
   0150 AA AA 00 00 AA AA    74 	.db 0xAA, 0xAA, 0x00, 0x00, 0xAA, 0xAA, 0x00, 0x00 
        00 00
   0158 00 00 00 00 00 00    75 	.db 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00 
        00 00
   0160 00 00 00 00 00 00    76 	.db 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00 
        00 00
   0168 00 00 00 00 00 00    77 	.db 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00 
        00 00
   0170 00 00 00 00 00 00    78 	.db 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00 
        00 00
   0178 00 00 00 00 00 00    79 	.db 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00 
        00 00
   0180 55 00 55 00 00 00    80 	.db 0x55, 0x00, 0x55, 0x00, 0x00, 0x00, 0x00, 0x00 
        00 00
   0188 55 00 55 00 00 00    81 	.db 0x55, 0x00, 0x55, 0x00, 0x00, 0x00, 0x00, 0x00 
        00 00
   0190 00 00 00 00 00 00    82 	.db 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00 
        00 00
   0198 00 00 00 00 00 00    83 	.db 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00 
        00 00
   01A0 55 00 55 00 00 00    84 	.db 0x55, 0x00, 0x55, 0x00, 0x00, 0x00, 0x00, 0x00 
        00 00
   01A8 55 00 55 00 00 00    85 	.db 0x55, 0x00, 0x55, 0x00, 0x00, 0x00, 0x00, 0x00 
        00 00
   01B0 00 00 00 00 00 00    86 	.db 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00 
        00 00
   01B8 00 00 00 00 00 00    87 	.db 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00 
        00 00
   01C0 00 00 00 00 00 00    88 	.db 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00 
        00 00
   01C8 00 00 00 00 00 00    89 	.db 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00 
        00 00
   01D0 00 00 00 00 00 00    90 	.db 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00 
        00 00
   01D8 00 00 00 00 00 00    91 	.db 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00 
        00 00
   01E0 00 00 00 00 00 00    92 	.db 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00 
        00 00
   01E8 00 00 00 00 00 00    93 	.db 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00 
        00 00
   01F0 00 00 00 00 00 00    94 	.db 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00 
        00 00
   01F8 00 00 00 00 00 00    95 	.db 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00 
        00 00
                             96 	.area _CSEG (REL, CON) 
                             97 ;src/entities/entities.c:11: void incializarEntities(){
                             98 ;	---------------------------------
                             99 ; Function incializarEntities
                            100 ; ---------------------------------
   4DE4                     101 _incializarEntities::
                            102 ;src/entities/entities.c:13: }
   4DE4 C9            [10]  103 	ret
                            104 ;src/entities/entities.c:17: void accion(TPlayer* player, TPlayerStatus action, TPlayerDirection dir){
                            105 ;	---------------------------------
                            106 ; Function accion
                            107 ; ---------------------------------
   4DE5                     108 _accion::
   4DE5 DD E5         [15]  109 	push	ix
   4DE7 DD 21 00 00   [14]  110 	ld	ix,#0
   4DEB DD 39         [15]  111 	add	ix,sp
                            112 ;src/entities/entities.c:18: switch(action){
   4DED DD 7E 06      [19]  113 	ld	a,6 (ix)
   4DF0 3D            [ 4]  114 	dec	a
   4DF1 20 4C         [12]  115 	jr	NZ,00108$
                            116 ;src/entities/entities.c:20: switch(dir){
   4DF3 3E 03         [ 7]  117 	ld	a,#0x03
   4DF5 DD 96 07      [19]  118 	sub	a, 7 (ix)
   4DF8 38 45         [12]  119 	jr	C,00108$
   4DFA DD 5E 07      [19]  120 	ld	e,7 (ix)
   4DFD 16 00         [ 7]  121 	ld	d,#0x00
   4DFF 21 05 4E      [10]  122 	ld	hl,#00120$
   4E02 19            [11]  123 	add	hl,de
   4E03 19            [11]  124 	add	hl,de
                            125 ;src/entities/entities.c:21: case d_up:
   4E04 E9            [ 4]  126 	jp	(hl)
   4E05                     127 00120$:
   4E05 18 06         [12]  128 	jr	00102$
   4E07 18 11         [12]  129 	jr	00103$
   4E09 18 29         [12]  130 	jr	00105$
   4E0B 18 1A         [12]  131 	jr	00104$
   4E0D                     132 00102$:
                            133 ;src/entities/entities.c:22: moverArriba(player);
   4E0D DD 6E 04      [19]  134 	ld	l,4 (ix)
   4E10 DD 66 05      [19]  135 	ld	h,5 (ix)
   4E13 E5            [11]  136 	push	hl
   4E14 CD 42 4E      [17]  137 	call	_moverArriba
   4E17 F1            [10]  138 	pop	af
                            139 ;src/entities/entities.c:23: break;
   4E18 18 25         [12]  140 	jr	00108$
                            141 ;src/entities/entities.c:24: case d_down:
   4E1A                     142 00103$:
                            143 ;src/entities/entities.c:25: moverAbajo(player);
   4E1A DD 6E 04      [19]  144 	ld	l,4 (ix)
   4E1D DD 66 05      [19]  145 	ld	h,5 (ix)
   4E20 E5            [11]  146 	push	hl
   4E21 CD 4E 4E      [17]  147 	call	_moverAbajo
   4E24 F1            [10]  148 	pop	af
                            149 ;src/entities/entities.c:26: break;
   4E25 18 18         [12]  150 	jr	00108$
                            151 ;src/entities/entities.c:27: case d_left:
   4E27                     152 00104$:
                            153 ;src/entities/entities.c:28: moverIzquierda(player);
   4E27 DD 6E 04      [19]  154 	ld	l,4 (ix)
   4E2A DD 66 05      [19]  155 	ld	h,5 (ix)
   4E2D E5            [11]  156 	push	hl
   4E2E CD 79 4E      [17]  157 	call	_moverIzquierda
   4E31 F1            [10]  158 	pop	af
                            159 ;src/entities/entities.c:29: break;
   4E32 18 0B         [12]  160 	jr	00108$
                            161 ;src/entities/entities.c:30: case d_right:
   4E34                     162 00105$:
                            163 ;src/entities/entities.c:31: moverDerecha(player);
   4E34 DD 6E 04      [19]  164 	ld	l,4 (ix)
   4E37 DD 66 05      [19]  165 	ld	h,5 (ix)
   4E3A E5            [11]  166 	push	hl
   4E3B CD 84 4E      [17]  167 	call	_moverDerecha
   4E3E F1            [10]  168 	pop	af
                            169 ;src/entities/entities.c:36: }
   4E3F                     170 00108$:
   4E3F DD E1         [14]  171 	pop	ix
   4E41 C9            [10]  172 	ret
                            173 ;src/entities/entities.c:39: void moverArriba(TPlayer* player){
                            174 ;	---------------------------------
                            175 ; Function moverArriba
                            176 ; ---------------------------------
   4E42                     177 _moverArriba::
                            178 ;src/entities/entities.c:40: if (player->y > 0) {
   4E42 D1            [10]  179 	pop	de
   4E43 C1            [10]  180 	pop	bc
   4E44 C5            [11]  181 	push	bc
   4E45 D5            [11]  182 	push	de
   4E46 03            [ 6]  183 	inc	bc
   4E47 0A            [ 7]  184 	ld	a,(bc)
   4E48 B7            [ 4]  185 	or	a, a
   4E49 C8            [11]  186 	ret	Z
                            187 ;src/entities/entities.c:41: player->y--;
   4E4A C6 FF         [ 7]  188 	add	a,#0xFF
   4E4C 02            [ 7]  189 	ld	(bc),a
   4E4D C9            [10]  190 	ret
                            191 ;src/entities/entities.c:48: void moverAbajo(TPlayer* player){
                            192 ;	---------------------------------
                            193 ; Function moverAbajo
                            194 ; ---------------------------------
   4E4E                     195 _moverAbajo::
   4E4E DD E5         [15]  196 	push	ix
   4E50 DD 21 00 00   [14]  197 	ld	ix,#0
   4E54 DD 39         [15]  198 	add	ix,sp
                            199 ;src/entities/entities.c:49: if (player->y + G_NAVES_0_H < ALTO) {
   4E56 DD 4E 04      [19]  200 	ld	c,4 (ix)
   4E59 DD 46 05      [19]  201 	ld	b,5 (ix)
   4E5C 03            [ 6]  202 	inc	bc
   4E5D 0A            [ 7]  203 	ld	a,(bc)
   4E5E 5F            [ 4]  204 	ld	e,a
   4E5F 6B            [ 4]  205 	ld	l,e
   4E60 26 00         [ 7]  206 	ld	h,#0x00
   4E62 D5            [11]  207 	push	de
   4E63 11 10 00      [10]  208 	ld	de,#0x0010
   4E66 19            [11]  209 	add	hl, de
   4E67 D1            [10]  210 	pop	de
   4E68 7D            [ 4]  211 	ld	a,l
   4E69 D6 C8         [ 7]  212 	sub	a, #0xC8
   4E6B 7C            [ 4]  213 	ld	a,h
   4E6C 17            [ 4]  214 	rla
   4E6D 3F            [ 4]  215 	ccf
   4E6E 1F            [ 4]  216 	rra
   4E6F DE 80         [ 7]  217 	sbc	a, #0x80
   4E71 30 03         [12]  218 	jr	NC,00103$
                            219 ;src/entities/entities.c:50: player->y++;
   4E73 1C            [ 4]  220 	inc	e
   4E74 7B            [ 4]  221 	ld	a,e
   4E75 02            [ 7]  222 	ld	(bc),a
   4E76                     223 00103$:
   4E76 DD E1         [14]  224 	pop	ix
   4E78 C9            [10]  225 	ret
                            226 ;src/entities/entities.c:57: void moverIzquierda(TPlayer* player){
                            227 ;	---------------------------------
                            228 ; Function moverIzquierda
                            229 ; ---------------------------------
   4E79                     230 _moverIzquierda::
                            231 ;src/entities/entities.c:58: if (player->x > 0) {
   4E79 D1            [10]  232 	pop	de
   4E7A C1            [10]  233 	pop	bc
   4E7B C5            [11]  234 	push	bc
   4E7C D5            [11]  235 	push	de
   4E7D 0A            [ 7]  236 	ld	a,(bc)
   4E7E B7            [ 4]  237 	or	a, a
   4E7F C8            [11]  238 	ret	Z
                            239 ;src/entities/entities.c:59: player->x--;
   4E80 C6 FF         [ 7]  240 	add	a,#0xFF
   4E82 02            [ 7]  241 	ld	(bc),a
   4E83 C9            [10]  242 	ret
                            243 ;src/entities/entities.c:65: void moverDerecha(TPlayer* player){
                            244 ;	---------------------------------
                            245 ; Function moverDerecha
                            246 ; ---------------------------------
   4E84                     247 _moverDerecha::
   4E84 DD E5         [15]  248 	push	ix
   4E86 DD 21 00 00   [14]  249 	ld	ix,#0
   4E8A DD 39         [15]  250 	add	ix,sp
                            251 ;src/entities/entities.c:66: if (player->x + G_NAVES_0_W < ANCHO) {
   4E8C DD 4E 04      [19]  252 	ld	c,4 (ix)
   4E8F DD 46 05      [19]  253 	ld	b,5 (ix)
   4E92 0A            [ 7]  254 	ld	a,(bc)
   4E93 5F            [ 4]  255 	ld	e,a
   4E94 6B            [ 4]  256 	ld	l,e
   4E95 26 00         [ 7]  257 	ld	h,#0x00
   4E97 D5            [11]  258 	push	de
   4E98 11 08 00      [10]  259 	ld	de,#0x0008
   4E9B 19            [11]  260 	add	hl, de
   4E9C D1            [10]  261 	pop	de
   4E9D 7D            [ 4]  262 	ld	a,l
   4E9E D6 50         [ 7]  263 	sub	a, #0x50
   4EA0 7C            [ 4]  264 	ld	a,h
   4EA1 17            [ 4]  265 	rla
   4EA2 3F            [ 4]  266 	ccf
   4EA3 1F            [ 4]  267 	rra
   4EA4 DE 80         [ 7]  268 	sbc	a, #0x80
   4EA6 30 03         [12]  269 	jr	NC,00103$
                            270 ;src/entities/entities.c:67: player->x++;
   4EA8 1C            [ 4]  271 	inc	e
   4EA9 7B            [ 4]  272 	ld	a,e
   4EAA 02            [ 7]  273 	ld	(bc),a
   4EAB                     274 00103$:
   4EAB DD E1         [14]  275 	pop	ix
   4EAD C9            [10]  276 	ret
                            277 ;src/entities/entities.c:75: u8 updatePlayer(TPlayer* player){
                            278 ;	---------------------------------
                            279 ; Function updatePlayer
                            280 ; ---------------------------------
   4EAE                     281 _updatePlayer::
                            282 ;src/entities/entities.c:85: return 1;
   4EAE 2E 01         [ 7]  283 	ld	l,#0x01
   4EB0 C9            [10]  284 	ret
                            285 ;src/entities/entities.c:88: void redibujarPlayer(TPlayer* player){
                            286 ;	---------------------------------
                            287 ; Function redibujarPlayer
                            288 ; ---------------------------------
   4EB1                     289 _redibujarPlayer::
   4EB1 DD E5         [15]  290 	push	ix
   4EB3 DD 21 00 00   [14]  291 	ld	ix,#0
   4EB7 DD 39         [15]  292 	add	ix,sp
                            293 ;src/entities/entities.c:89: borrarPlayer(player);
   4EB9 DD 6E 04      [19]  294 	ld	l,4 (ix)
   4EBC DD 66 05      [19]  295 	ld	h,5 (ix)
   4EBF E5            [11]  296 	push	hl
   4EC0 CD E2 4E      [17]  297 	call	_borrarPlayer
   4EC3 F1            [10]  298 	pop	af
                            299 ;src/entities/entities.c:90: player->px = player->x;
   4EC4 DD 4E 04      [19]  300 	ld	c,4 (ix)
   4EC7 DD 46 05      [19]  301 	ld	b,5 (ix)
   4ECA 59            [ 4]  302 	ld	e, c
   4ECB 50            [ 4]  303 	ld	d, b
   4ECC 13            [ 6]  304 	inc	de
   4ECD 13            [ 6]  305 	inc	de
   4ECE 0A            [ 7]  306 	ld	a,(bc)
   4ECF 12            [ 7]  307 	ld	(de),a
                            308 ;src/entities/entities.c:91: player->py = player->y;
   4ED0 59            [ 4]  309 	ld	e, c
   4ED1 50            [ 4]  310 	ld	d, b
   4ED2 13            [ 6]  311 	inc	de
   4ED3 13            [ 6]  312 	inc	de
   4ED4 13            [ 6]  313 	inc	de
   4ED5 69            [ 4]  314 	ld	l, c
   4ED6 60            [ 4]  315 	ld	h, b
   4ED7 23            [ 6]  316 	inc	hl
   4ED8 7E            [ 7]  317 	ld	a,(hl)
   4ED9 12            [ 7]  318 	ld	(de),a
                            319 ;src/entities/entities.c:92: dibujarPlayer(player);
   4EDA C5            [11]  320 	push	bc
   4EDB CD 30 4F      [17]  321 	call	_dibujarPlayer
   4EDE F1            [10]  322 	pop	af
   4EDF DD E1         [14]  323 	pop	ix
   4EE1 C9            [10]  324 	ret
                            325 ;src/entities/entities.c:95: void borrarPlayer(TPlayer* player){
                            326 ;	---------------------------------
                            327 ; Function borrarPlayer
                            328 ; ---------------------------------
   4EE2                     329 _borrarPlayer::
   4EE2 DD E5         [15]  330 	push	ix
   4EE4 DD 21 00 00   [14]  331 	ld	ix,#0
   4EE8 DD 39         [15]  332 	add	ix,sp
                            333 ;src/entities/entities.c:96: u8 w = 2 + (player->px & 1);
   4EEA DD 5E 04      [19]  334 	ld	e,4 (ix)
   4EED DD 56 05      [19]  335 	ld	d,5 (ix)
   4EF0 6B            [ 4]  336 	ld	l, e
   4EF1 62            [ 4]  337 	ld	h, d
   4EF2 23            [ 6]  338 	inc	hl
   4EF3 23            [ 6]  339 	inc	hl
   4EF4 4E            [ 7]  340 	ld	c,(hl)
   4EF5 79            [ 4]  341 	ld	a,c
   4EF6 E6 01         [ 7]  342 	and	a, #0x01
   4EF8 47            [ 4]  343 	ld	b,a
   4EF9 04            [ 4]  344 	inc	b
   4EFA 04            [ 4]  345 	inc	b
                            346 ;src/entities/entities.c:97: u8 h = 7 + (player->py & 3 ? 1 : 0);
   4EFB EB            [ 4]  347 	ex	de,hl
   4EFC 23            [ 6]  348 	inc	hl
   4EFD 23            [ 6]  349 	inc	hl
   4EFE 23            [ 6]  350 	inc	hl
   4EFF 5E            [ 7]  351 	ld	e,(hl)
   4F00 7B            [ 4]  352 	ld	a,e
   4F01 E6 03         [ 7]  353 	and	a, #0x03
   4F03 28 04         [12]  354 	jr	Z,00103$
   4F05 3E 01         [ 7]  355 	ld	a,#0x01
   4F07 18 02         [12]  356 	jr	00104$
   4F09                     357 00103$:
   4F09 3E 00         [ 7]  358 	ld	a,#0x00
   4F0B                     359 00104$:
   4F0B C6 07         [ 7]  360 	add	a, #0x07
   4F0D 57            [ 4]  361 	ld	d,a
                            362 ;src/entities/entities.c:98: cpct_etm_drawTileBox2x4(player->px / 2, player->py /4, w, h, g_map1_W, 0, mapa);
   4F0E 2A E0 4D      [16]  363 	ld	hl,(_mapa)
   4F11 CB 3B         [ 8]  364 	srl	e
   4F13 CB 3B         [ 8]  365 	srl	e
   4F15 CB 39         [ 8]  366 	srl	c
   4F17 E5            [11]  367 	push	hl
   4F18 21 00 00      [10]  368 	ld	hl,#0x0000
   4F1B E5            [11]  369 	push	hl
   4F1C 3E 28         [ 7]  370 	ld	a,#0x28
   4F1E F5            [11]  371 	push	af
   4F1F 33            [ 6]  372 	inc	sp
   4F20 D5            [11]  373 	push	de
   4F21 33            [ 6]  374 	inc	sp
   4F22 C5            [11]  375 	push	bc
   4F23 33            [ 6]  376 	inc	sp
   4F24 7B            [ 4]  377 	ld	a,e
   4F25 F5            [11]  378 	push	af
   4F26 33            [ 6]  379 	inc	sp
   4F27 79            [ 4]  380 	ld	a,c
   4F28 F5            [11]  381 	push	af
   4F29 33            [ 6]  382 	inc	sp
   4F2A CD FC 4B      [17]  383 	call	_cpct_etm_drawTileBox2x4
   4F2D DD E1         [14]  384 	pop	ix
   4F2F C9            [10]  385 	ret
                            386 ;src/entities/entities.c:101: void dibujarPlayer(TPlayer* player){
                            387 ;	---------------------------------
                            388 ; Function dibujarPlayer
                            389 ; ---------------------------------
   4F30                     390 _dibujarPlayer::
   4F30 DD E5         [15]  391 	push	ix
   4F32 DD 21 00 00   [14]  392 	ld	ix,#0
   4F36 DD 39         [15]  393 	add	ix,sp
                            394 ;src/entities/entities.c:103: u8* vmem = cpct_getScreenPtr(CPCT_VMEM_START,player->x, player->y);
   4F38 DD 4E 04      [19]  395 	ld	c,4 (ix)
   4F3B DD 46 05      [19]  396 	ld	b,5 (ix)
   4F3E 69            [ 4]  397 	ld	l, c
   4F3F 60            [ 4]  398 	ld	h, b
   4F40 23            [ 6]  399 	inc	hl
   4F41 56            [ 7]  400 	ld	d,(hl)
   4F42 0A            [ 7]  401 	ld	a,(bc)
   4F43 C5            [11]  402 	push	bc
   4F44 D5            [11]  403 	push	de
   4F45 33            [ 6]  404 	inc	sp
   4F46 F5            [11]  405 	push	af
   4F47 33            [ 6]  406 	inc	sp
   4F48 21 00 C0      [10]  407 	ld	hl,#0xC000
   4F4B E5            [11]  408 	push	hl
   4F4C CD 85 4D      [17]  409 	call	_cpct_getScreenPtr
   4F4F EB            [ 4]  410 	ex	de,hl
                            411 ;src/entities/entities.c:105: cpct_drawSpriteMaskedAlignedTable(player->sprite,vmem,G_NAVES_0_W,G_NAVES_0_H, g_tablatrans);
   4F50 E1            [10]  412 	pop	hl
   4F51 01 05 00      [10]  413 	ld	bc, #0x0005
   4F54 09            [11]  414 	add	hl, bc
   4F55 4E            [ 7]  415 	ld	c,(hl)
   4F56 23            [ 6]  416 	inc	hl
   4F57 46            [ 7]  417 	ld	b,(hl)
   4F58 21 00 01      [10]  418 	ld	hl,#_g_tablatrans
   4F5B E5            [11]  419 	push	hl
   4F5C 21 08 10      [10]  420 	ld	hl,#0x1008
   4F5F E5            [11]  421 	push	hl
   4F60 D5            [11]  422 	push	de
   4F61 C5            [11]  423 	push	bc
   4F62 CD A5 4D      [17]  424 	call	_cpct_drawSpriteMaskedAlignedTable
   4F65 DD E1         [14]  425 	pop	ix
   4F67 C9            [10]  426 	ret
                            427 ;src/entities/entities.c:109: void drawAll(TPlayer* player){
                            428 ;	---------------------------------
                            429 ; Function drawAll
                            430 ; ---------------------------------
   4F68                     431 _drawAll::
                            432 ;src/entities/entities.c:111: redibujarPlayer(player);
   4F68 C1            [10]  433 	pop	bc
   4F69 E1            [10]  434 	pop	hl
   4F6A E5            [11]  435 	push	hl
   4F6B C5            [11]  436 	push	bc
   4F6C E5            [11]  437 	push	hl
   4F6D CD B1 4E      [17]  438 	call	_redibujarPlayer
   4F70 F1            [10]  439 	pop	af
   4F71 C9            [10]  440 	ret
                            441 	.area _CODE
                            442 	.area _INITIALIZER
                            443 	.area _CABS (ABS)
