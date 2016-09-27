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
                             11 	.globl _flipByMolto
                             12 	.globl _cpct_etm_drawTileBox2x4
                             13 	.globl _cpct_getScreenPtr
                             14 	.globl _cpct_drawSpriteMaskedAlignedTable
                             15 	.globl _incializarEntities
                             16 	.globl _accion
                             17 	.globl _flipSprite
                             18 	.globl _moverArriba
                             19 	.globl _moverAbajo
                             20 	.globl _moverIzquierda
                             21 	.globl _moverDerecha
                             22 	.globl _updatePlayer
                             23 	.globl _redibujarPlayer
                             24 	.globl _borrarPlayer
                             25 	.globl _dibujarPlayer
                             26 	.globl _drawAll
                             27 ;--------------------------------------------------------
                             28 ; special function registers
                             29 ;--------------------------------------------------------
                             30 ;--------------------------------------------------------
                             31 ; ram data
                             32 ;--------------------------------------------------------
                             33 	.area _DATA
                             34 ;--------------------------------------------------------
                             35 ; ram data
                             36 ;--------------------------------------------------------
                             37 	.area _INITIALIZED
                             38 ;--------------------------------------------------------
                             39 ; absolute external ram data
                             40 ;--------------------------------------------------------
                             41 	.area _DABS (ABS)
                             42 ;--------------------------------------------------------
                             43 ; global & static initialisations
                             44 ;--------------------------------------------------------
                             45 	.area _HOME
                             46 	.area _GSINIT
                             47 	.area _GSFINAL
                             48 	.area _GSINIT
                             49 ;--------------------------------------------------------
                             50 ; Home
                             51 ;--------------------------------------------------------
                             52 	.area _HOME
                             53 	.area _HOME
                             54 ;--------------------------------------------------------
                             55 ; code
                             56 ;--------------------------------------------------------
                             57 	.area _CODE
                             58 ;src/entities/entities.c:12: cpctm_createTransparentMaskTable(g_tablatrans,0x0100,M0,0);
                             59 ;	---------------------------------
                             60 ; Function dummy_cpct_transparentMaskTable0M0_container
                             61 ; ---------------------------------
   4BF6                      62 _dummy_cpct_transparentMaskTable0M0_container::
                             63 	.area _g_tablatrans_ (ABS) 
   0100                      64 	.org 0x0100 
   0100                      65 	 _g_tablatrans::
   0100 FF AA 55 00 AA AA    66 	.db 0xFF, 0xAA, 0x55, 0x00, 0xAA, 0xAA, 0x00, 0x00 
        00 00
   0108 55 00 55 00 00 00    67 	.db 0x55, 0x00, 0x55, 0x00, 0x00, 0x00, 0x00, 0x00 
        00 00
   0110 AA AA 00 00 AA AA    68 	.db 0xAA, 0xAA, 0x00, 0x00, 0xAA, 0xAA, 0x00, 0x00 
        00 00
   0118 00 00 00 00 00 00    69 	.db 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00 
        00 00
   0120 55 00 55 00 00 00    70 	.db 0x55, 0x00, 0x55, 0x00, 0x00, 0x00, 0x00, 0x00 
        00 00
   0128 55 00 55 00 00 00    71 	.db 0x55, 0x00, 0x55, 0x00, 0x00, 0x00, 0x00, 0x00 
        00 00
   0130 00 00 00 00 00 00    72 	.db 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00 
        00 00
   0138 00 00 00 00 00 00    73 	.db 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00 
        00 00
   0140 AA AA 00 00 AA AA    74 	.db 0xAA, 0xAA, 0x00, 0x00, 0xAA, 0xAA, 0x00, 0x00 
        00 00
   0148 00 00 00 00 00 00    75 	.db 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00 
        00 00
   0150 AA AA 00 00 AA AA    76 	.db 0xAA, 0xAA, 0x00, 0x00, 0xAA, 0xAA, 0x00, 0x00 
        00 00
   0158 00 00 00 00 00 00    77 	.db 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00 
        00 00
   0160 00 00 00 00 00 00    78 	.db 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00 
        00 00
   0168 00 00 00 00 00 00    79 	.db 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00 
        00 00
   0170 00 00 00 00 00 00    80 	.db 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00 
        00 00
   0178 00 00 00 00 00 00    81 	.db 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00 
        00 00
   0180 55 00 55 00 00 00    82 	.db 0x55, 0x00, 0x55, 0x00, 0x00, 0x00, 0x00, 0x00 
        00 00
   0188 55 00 55 00 00 00    83 	.db 0x55, 0x00, 0x55, 0x00, 0x00, 0x00, 0x00, 0x00 
        00 00
   0190 00 00 00 00 00 00    84 	.db 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00 
        00 00
   0198 00 00 00 00 00 00    85 	.db 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00 
        00 00
   01A0 55 00 55 00 00 00    86 	.db 0x55, 0x00, 0x55, 0x00, 0x00, 0x00, 0x00, 0x00 
        00 00
   01A8 55 00 55 00 00 00    87 	.db 0x55, 0x00, 0x55, 0x00, 0x00, 0x00, 0x00, 0x00 
        00 00
   01B0 00 00 00 00 00 00    88 	.db 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00 
        00 00
   01B8 00 00 00 00 00 00    89 	.db 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00 
        00 00
   01C0 00 00 00 00 00 00    90 	.db 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00 
        00 00
   01C8 00 00 00 00 00 00    91 	.db 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00 
        00 00
   01D0 00 00 00 00 00 00    92 	.db 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00 
        00 00
   01D8 00 00 00 00 00 00    93 	.db 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00 
        00 00
   01E0 00 00 00 00 00 00    94 	.db 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00 
        00 00
   01E8 00 00 00 00 00 00    95 	.db 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00 
        00 00
   01F0 00 00 00 00 00 00    96 	.db 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00 
        00 00
   01F8 00 00 00 00 00 00    97 	.db 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00 
        00 00
                             98 	.area _CSEG (REL, CON) 
                             99 ;src/entities/entities.c:14: void incializarEntities(){
                            100 ;	---------------------------------
                            101 ; Function incializarEntities
                            102 ; ---------------------------------
   4E0D                     103 _incializarEntities::
                            104 ;src/entities/entities.c:16: }
   4E0D C9            [10]  105 	ret
                            106 ;src/entities/entities.c:20: void accion(TPlayer* player, TPlayerStatus action, TPlayerDirection dir){
                            107 ;	---------------------------------
                            108 ; Function accion
                            109 ; ---------------------------------
   4E0E                     110 _accion::
   4E0E DD E5         [15]  111 	push	ix
   4E10 DD 21 00 00   [14]  112 	ld	ix,#0
   4E14 DD 39         [15]  113 	add	ix,sp
                            114 ;src/entities/entities.c:21: switch(action){
   4E16 DD 7E 06      [19]  115 	ld	a,6 (ix)
   4E19 3D            [ 4]  116 	dec	a
   4E1A C2 AE 4E      [10]  117 	jp	NZ,00108$
                            118 ;src/entities/entities.c:23: switch(dir){
   4E1D 3E 03         [ 7]  119 	ld	a,#0x03
   4E1F DD 96 07      [19]  120 	sub	a, 7 (ix)
   4E22 DA AE 4E      [10]  121 	jp	C,00108$
   4E25 DD 5E 07      [19]  122 	ld	e,7 (ix)
   4E28 16 00         [ 7]  123 	ld	d,#0x00
   4E2A 21 30 4E      [10]  124 	ld	hl,#00120$
   4E2D 19            [11]  125 	add	hl,de
   4E2E 19            [11]  126 	add	hl,de
                            127 ;src/entities/entities.c:24: case d_up:
   4E2F E9            [ 4]  128 	jp	(hl)
   4E30                     129 00120$:
   4E30 18 06         [12]  130 	jr	00102$
   4E32 18 22         [12]  131 	jr	00103$
   4E34 18 5C         [12]  132 	jr	00105$
   4E36 18 3C         [12]  133 	jr	00104$
   4E38                     134 00102$:
                            135 ;src/entities/entities.c:25: moverArriba(player);
   4E38 DD 6E 04      [19]  136 	ld	l,4 (ix)
   4E3B DD 66 05      [19]  137 	ld	h,5 (ix)
   4E3E E5            [11]  138 	push	hl
   4E3F CD 90 4F      [17]  139 	call	_moverArriba
   4E42 F1            [10]  140 	pop	af
                            141 ;src/entities/entities.c:26: flipSprite(player,dir);
   4E43 DD 7E 07      [19]  142 	ld	a,7 (ix)
   4E46 F5            [11]  143 	push	af
   4E47 33            [ 6]  144 	inc	sp
   4E48 DD 6E 04      [19]  145 	ld	l,4 (ix)
   4E4B DD 66 05      [19]  146 	ld	h,5 (ix)
   4E4E E5            [11]  147 	push	hl
   4E4F CD B1 4E      [17]  148 	call	_flipSprite
   4E52 F1            [10]  149 	pop	af
   4E53 33            [ 6]  150 	inc	sp
                            151 ;src/entities/entities.c:27: break;
   4E54 18 58         [12]  152 	jr	00108$
                            153 ;src/entities/entities.c:28: case d_down:
   4E56                     154 00103$:
                            155 ;src/entities/entities.c:29: moverAbajo(player);
   4E56 DD 6E 04      [19]  156 	ld	l,4 (ix)
   4E59 DD 66 05      [19]  157 	ld	h,5 (ix)
   4E5C E5            [11]  158 	push	hl
   4E5D CD BA 4F      [17]  159 	call	_moverAbajo
   4E60 F1            [10]  160 	pop	af
                            161 ;src/entities/entities.c:30: flipSprite(player,dir);
   4E61 DD 7E 07      [19]  162 	ld	a,7 (ix)
   4E64 F5            [11]  163 	push	af
   4E65 33            [ 6]  164 	inc	sp
   4E66 DD 6E 04      [19]  165 	ld	l,4 (ix)
   4E69 DD 66 05      [19]  166 	ld	h,5 (ix)
   4E6C E5            [11]  167 	push	hl
   4E6D CD B1 4E      [17]  168 	call	_flipSprite
   4E70 F1            [10]  169 	pop	af
   4E71 33            [ 6]  170 	inc	sp
                            171 ;src/entities/entities.c:31: break;
   4E72 18 3A         [12]  172 	jr	00108$
                            173 ;src/entities/entities.c:32: case d_left:
   4E74                     174 00104$:
                            175 ;src/entities/entities.c:33: moverIzquierda(player);
   4E74 DD 6E 04      [19]  176 	ld	l,4 (ix)
   4E77 DD 66 05      [19]  177 	ld	h,5 (ix)
   4E7A E5            [11]  178 	push	hl
   4E7B CD 01 50      [17]  179 	call	_moverIzquierda
   4E7E F1            [10]  180 	pop	af
                            181 ;src/entities/entities.c:34: flipSprite(player,dir);
   4E7F DD 7E 07      [19]  182 	ld	a,7 (ix)
   4E82 F5            [11]  183 	push	af
   4E83 33            [ 6]  184 	inc	sp
   4E84 DD 6E 04      [19]  185 	ld	l,4 (ix)
   4E87 DD 66 05      [19]  186 	ld	h,5 (ix)
   4E8A E5            [11]  187 	push	hl
   4E8B CD B1 4E      [17]  188 	call	_flipSprite
   4E8E F1            [10]  189 	pop	af
   4E8F 33            [ 6]  190 	inc	sp
                            191 ;src/entities/entities.c:35: break;
   4E90 18 1C         [12]  192 	jr	00108$
                            193 ;src/entities/entities.c:36: case d_right:
   4E92                     194 00105$:
                            195 ;src/entities/entities.c:37: moverDerecha(player);
   4E92 DD 6E 04      [19]  196 	ld	l,4 (ix)
   4E95 DD 66 05      [19]  197 	ld	h,5 (ix)
   4E98 E5            [11]  198 	push	hl
   4E99 CD 12 50      [17]  199 	call	_moverDerecha
   4E9C F1            [10]  200 	pop	af
                            201 ;src/entities/entities.c:38: flipSprite(player,dir);
   4E9D DD 7E 07      [19]  202 	ld	a,7 (ix)
   4EA0 F5            [11]  203 	push	af
   4EA1 33            [ 6]  204 	inc	sp
   4EA2 DD 6E 04      [19]  205 	ld	l,4 (ix)
   4EA5 DD 66 05      [19]  206 	ld	h,5 (ix)
   4EA8 E5            [11]  207 	push	hl
   4EA9 CD B1 4E      [17]  208 	call	_flipSprite
   4EAC F1            [10]  209 	pop	af
   4EAD 33            [ 6]  210 	inc	sp
                            211 ;src/entities/entities.c:43: }
   4EAE                     212 00108$:
   4EAE DD E1         [14]  213 	pop	ix
   4EB0 C9            [10]  214 	ret
                            215 ;src/entities/entities.c:47: void flipSprite(TPlayer* player, TPlayerDirection dir){
                            216 ;	---------------------------------
                            217 ; Function flipSprite
                            218 ; ---------------------------------
   4EB1                     219 _flipSprite::
   4EB1 DD E5         [15]  220 	push	ix
   4EB3 DD 21 00 00   [14]  221 	ld	ix,#0
   4EB7 DD 39         [15]  222 	add	ix,sp
   4EB9 3B            [ 6]  223 	dec	sp
                            224 ;src/entities/entities.c:48: if(player->curr_dir != dir){
   4EBA DD 4E 04      [19]  225 	ld	c,4 (ix)
   4EBD DD 46 05      [19]  226 	ld	b,5 (ix)
   4EC0 21 07 00      [10]  227 	ld	hl,#0x0007
   4EC3 09            [11]  228 	add	hl,bc
   4EC4 EB            [ 4]  229 	ex	de,hl
   4EC5 1A            [ 7]  230 	ld	a,(de)
   4EC6 DD 77 FF      [19]  231 	ld	-1 (ix),a
   4EC9 DD 7E 06      [19]  232 	ld	a,6 (ix)
   4ECC DD 96 FF      [19]  233 	sub	a, -1 (ix)
   4ECF 28 43         [12]  234 	jr	Z,00108$
                            235 ;src/entities/entities.c:49: switch(dir){
   4ED1 3E 03         [ 7]  236 	ld	a,#0x03
   4ED3 DD 96 06      [19]  237 	sub	a, 6 (ix)
   4ED6 38 38         [12]  238 	jr	C,00105$
                            239 ;src/entities/entities.c:59: player->sprite = g_naves_3;
   4ED8 03            [ 6]  240 	inc	bc
   4ED9 03            [ 6]  241 	inc	bc
   4EDA 03            [ 6]  242 	inc	bc
   4EDB 03            [ 6]  243 	inc	bc
   4EDC 03            [ 6]  244 	inc	bc
                            245 ;src/entities/entities.c:49: switch(dir){
   4EDD D5            [11]  246 	push	de
   4EDE DD 5E 06      [19]  247 	ld	e,6 (ix)
   4EE1 16 00         [ 7]  248 	ld	d,#0x00
   4EE3 21 EA 4E      [10]  249 	ld	hl,#00119$
   4EE6 19            [11]  250 	add	hl,de
   4EE7 19            [11]  251 	add	hl,de
                            252 ;src/entities/entities.c:50: case d_up:
   4EE8 D1            [10]  253 	pop	de
   4EE9 E9            [ 4]  254 	jp	(hl)
   4EEA                     255 00119$:
   4EEA 18 06         [12]  256 	jr	00101$
   4EEC 18 0B         [12]  257 	jr	00102$
   4EEE 18 19         [12]  258 	jr	00104$
   4EF0 18 0E         [12]  259 	jr	00103$
   4EF2                     260 00101$:
                            261 ;src/entities/entities.c:52: flipByMolto();
   4EF2 D5            [11]  262 	push	de
   4EF3 CD 18 4F      [17]  263 	call	_flipByMolto
   4EF6 D1            [10]  264 	pop	de
                            265 ;src/entities/entities.c:53: break;
   4EF7 18 17         [12]  266 	jr	00105$
                            267 ;src/entities/entities.c:54: case d_down:
   4EF9                     268 00102$:
                            269 ;src/entities/entities.c:56: flipByMolto();
   4EF9 D5            [11]  270 	push	de
   4EFA CD 18 4F      [17]  271 	call	_flipByMolto
   4EFD D1            [10]  272 	pop	de
                            273 ;src/entities/entities.c:57: break;
   4EFE 18 10         [12]  274 	jr	00105$
                            275 ;src/entities/entities.c:58: case d_left:
   4F00                     276 00103$:
                            277 ;src/entities/entities.c:59: player->sprite = g_naves_3;
   4F00 3E 78         [ 7]  278 	ld	a,#<(_g_naves_3)
   4F02 02            [ 7]  279 	ld	(bc),a
   4F03 03            [ 6]  280 	inc	bc
   4F04 3E 4A         [ 7]  281 	ld	a,#>(_g_naves_3)
   4F06 02            [ 7]  282 	ld	(bc),a
                            283 ;src/entities/entities.c:60: break;
   4F07 18 07         [12]  284 	jr	00105$
                            285 ;src/entities/entities.c:61: case d_right:
   4F09                     286 00104$:
                            287 ;src/entities/entities.c:62: player->sprite = g_naves_1;
   4F09 3E 78         [ 7]  288 	ld	a,#<(_g_naves_1)
   4F0B 02            [ 7]  289 	ld	(bc),a
   4F0C 03            [ 6]  290 	inc	bc
   4F0D 3E 49         [ 7]  291 	ld	a,#>(_g_naves_1)
   4F0F 02            [ 7]  292 	ld	(bc),a
                            293 ;src/entities/entities.c:64: }
   4F10                     294 00105$:
                            295 ;src/entities/entities.c:65: player->curr_dir = dir; 
   4F10 DD 7E 06      [19]  296 	ld	a,6 (ix)
   4F13 12            [ 7]  297 	ld	(de),a
   4F14                     298 00108$:
   4F14 33            [ 6]  299 	inc	sp
   4F15 DD E1         [14]  300 	pop	ix
   4F17 C9            [10]  301 	ret
                            302 ;src/entities/entities.c:70: void flipByMolto(){
                            303 ;	---------------------------------
                            304 ; Function flipByMolto
                            305 ; ---------------------------------
   4F18                     306 _flipByMolto::
   4F18 DD E5         [15]  307 	push	ix
   4F1A DD 21 00 00   [14]  308 	ld	ix,#0
   4F1E DD 39         [15]  309 	add	ix,sp
   4F20 21 EA FF      [10]  310 	ld	hl,#-22
   4F23 39            [11]  311 	add	hl,sp
   4F24 F9            [ 6]  312 	ld	sp,hl
                            313 ;src/entities/entities.c:77: for(i=0;i<FILA/2;i++){
   4F25 21 00 00      [10]  314 	ld	hl,#0x0000
   4F28 39            [11]  315 	add	hl,sp
   4F29 DD 75 FE      [19]  316 	ld	-2 (ix),l
   4F2C DD 74 FF      [19]  317 	ld	-1 (ix),h
   4F2F 1E 00         [ 7]  318 	ld	e,#0x00
                            319 ;src/entities/entities.c:78: for(j=0;j<COLUMNA;j++){
   4F31                     320 00109$:
   4F31 7B            [ 4]  321 	ld	a,e
   4F32 07            [ 4]  322 	rlca
   4F33 07            [ 4]  323 	rlca
   4F34 07            [ 4]  324 	rlca
   4F35 07            [ 4]  325 	rlca
   4F36 E6 F0         [ 7]  326 	and	a,#0xF0
   4F38 DD 77 FB      [19]  327 	ld	-5 (ix),a
   4F3B 3E 0F         [ 7]  328 	ld	a,#0x0F
   4F3D 93            [ 4]  329 	sub	a, e
   4F3E 07            [ 4]  330 	rlca
   4F3F 07            [ 4]  331 	rlca
   4F40 07            [ 4]  332 	rlca
   4F41 E6 F8         [ 7]  333 	and	a,#0xF8
   4F43 DD 77 FA      [19]  334 	ld	-6 (ix),a
   4F46 16 00         [ 7]  335 	ld	d,#0x00
   4F48                     336 00103$:
                            337 ;src/entities/entities.c:79: aux[j]=g_naves_0[i*FILA+j];
   4F48 7A            [ 4]  338 	ld	a,d
   4F49 DD 86 FE      [19]  339 	add	a, -2 (ix)
   4F4C DD 77 FC      [19]  340 	ld	-4 (ix),a
   4F4F 3E 00         [ 7]  341 	ld	a,#0x00
   4F51 DD 8E FF      [19]  342 	adc	a, -1 (ix)
   4F54 DD 77 FD      [19]  343 	ld	-3 (ix),a
   4F57 DD 7E FB      [19]  344 	ld	a,-5 (ix)
   4F5A 82            [ 4]  345 	add	a, d
   4F5B 4F            [ 4]  346 	ld	c,a
   4F5C FD 21 F8 48   [14]  347 	ld	iy,#_g_naves_0
   4F60 06 00         [ 7]  348 	ld	b,#0x00
   4F62 FD 09         [15]  349 	add	iy, bc
   4F64 FD 4E 00      [19]  350 	ld	c, 0 (iy)
   4F67 DD 6E FC      [19]  351 	ld	l,-4 (ix)
   4F6A DD 66 FD      [19]  352 	ld	h,-3 (ix)
   4F6D 71            [ 7]  353 	ld	(hl),c
                            354 ;src/entities/entities.c:80: g_naves_0[i*FILA+j] = g_naves_0[(FILA-i-1)*(COLUMNA)+j];
   4F6E DD 7E FA      [19]  355 	ld	a,-6 (ix)
   4F71 82            [ 4]  356 	add	a, d
   4F72 C6 F8         [ 7]  357 	add	a,#<(_g_naves_0)
   4F74 6F            [ 4]  358 	ld	l,a
   4F75 3E 48         [ 7]  359 	ld	a,#>(_g_naves_0)
   4F77 CE 00         [ 7]  360 	adc	a, #0x00
   4F79 67            [ 4]  361 	ld	h,a
   4F7A 46            [ 7]  362 	ld	b,(hl)
   4F7B FD 70 00      [19]  363 	ld	0 (iy), b
                            364 ;src/entities/entities.c:81: g_naves_0[(FILA-i-1)*(COLUMNA)+j] = aux[j];
   4F7E 71            [ 7]  365 	ld	(hl),c
                            366 ;src/entities/entities.c:78: for(j=0;j<COLUMNA;j++){
   4F7F 14            [ 4]  367 	inc	d
   4F80 7A            [ 4]  368 	ld	a,d
   4F81 D6 08         [ 7]  369 	sub	a, #0x08
   4F83 38 C3         [12]  370 	jr	C,00103$
                            371 ;src/entities/entities.c:77: for(i=0;i<FILA/2;i++){
   4F85 1C            [ 4]  372 	inc	e
   4F86 7B            [ 4]  373 	ld	a,e
   4F87 D6 08         [ 7]  374 	sub	a, #0x08
   4F89 38 A6         [12]  375 	jr	C,00109$
   4F8B DD F9         [10]  376 	ld	sp, ix
   4F8D DD E1         [14]  377 	pop	ix
   4F8F C9            [10]  378 	ret
                            379 ;src/entities/entities.c:85: void moverArriba(TPlayer* player){
                            380 ;	---------------------------------
                            381 ; Function moverArriba
                            382 ; ---------------------------------
   4F90                     383 _moverArriba::
   4F90 DD E5         [15]  384 	push	ix
   4F92 DD 21 00 00   [14]  385 	ld	ix,#0
   4F96 DD 39         [15]  386 	add	ix,sp
                            387 ;src/entities/entities.c:86: if (player->y > 0) {
   4F98 DD 4E 04      [19]  388 	ld	c,4 (ix)
   4F9B DD 46 05      [19]  389 	ld	b,5 (ix)
   4F9E 59            [ 4]  390 	ld	e, c
   4F9F 50            [ 4]  391 	ld	d, b
   4FA0 13            [ 6]  392 	inc	de
   4FA1 1A            [ 7]  393 	ld	a,(de)
   4FA2 B7            [ 4]  394 	or	a, a
   4FA3 28 12         [12]  395 	jr	Z,00106$
                            396 ;src/entities/entities.c:87: if(player->y%2 == 0)
   4FA5 CB 47         [ 8]  397 	bit	0, a
   4FA7 20 05         [12]  398 	jr	NZ,00102$
                            399 ;src/entities/entities.c:88: player->y-=2;
   4FA9 C6 FE         [ 7]  400 	add	a,#0xFE
   4FAB 12            [ 7]  401 	ld	(de),a
   4FAC 18 03         [12]  402 	jr	00103$
   4FAE                     403 00102$:
                            404 ;src/entities/entities.c:90: player->y--;
   4FAE C6 FF         [ 7]  405 	add	a,#0xFF
   4FB0 12            [ 7]  406 	ld	(de),a
   4FB1                     407 00103$:
                            408 ;src/entities/entities.c:92: player->draw  = SI;
   4FB1 21 04 00      [10]  409 	ld	hl,#0x0004
   4FB4 09            [11]  410 	add	hl,bc
   4FB5 36 01         [10]  411 	ld	(hl),#0x01
   4FB7                     412 00106$:
   4FB7 DD E1         [14]  413 	pop	ix
   4FB9 C9            [10]  414 	ret
                            415 ;src/entities/entities.c:99: void moverAbajo(TPlayer* player){
                            416 ;	---------------------------------
                            417 ; Function moverAbajo
                            418 ; ---------------------------------
   4FBA                     419 _moverAbajo::
   4FBA DD E5         [15]  420 	push	ix
   4FBC DD 21 00 00   [14]  421 	ld	ix,#0
   4FC0 DD 39         [15]  422 	add	ix,sp
   4FC2 3B            [ 6]  423 	dec	sp
                            424 ;src/entities/entities.c:100: if (player->y + G_NAVES_0_H < ALTO) {
   4FC3 DD 4E 04      [19]  425 	ld	c,4 (ix)
   4FC6 DD 46 05      [19]  426 	ld	b,5 (ix)
   4FC9 59            [ 4]  427 	ld	e, c
   4FCA 50            [ 4]  428 	ld	d, b
   4FCB 13            [ 6]  429 	inc	de
   4FCC 1A            [ 7]  430 	ld	a,(de)
   4FCD DD 77 FF      [19]  431 	ld	-1 (ix), a
   4FD0 6F            [ 4]  432 	ld	l, a
   4FD1 26 00         [ 7]  433 	ld	h,#0x00
   4FD3 D5            [11]  434 	push	de
   4FD4 11 10 00      [10]  435 	ld	de,#0x0010
   4FD7 19            [11]  436 	add	hl, de
   4FD8 D1            [10]  437 	pop	de
   4FD9 7D            [ 4]  438 	ld	a,l
   4FDA D6 C8         [ 7]  439 	sub	a, #0xC8
   4FDC 7C            [ 4]  440 	ld	a,h
   4FDD 17            [ 4]  441 	rla
   4FDE 3F            [ 4]  442 	ccf
   4FDF 1F            [ 4]  443 	rra
   4FE0 DE 80         [ 7]  444 	sbc	a, #0x80
   4FE2 30 19         [12]  445 	jr	NC,00106$
                            446 ;src/entities/entities.c:101: if(player->y%2 == 0)
   4FE4 DD CB FF 46   [20]  447 	bit	0, -1 (ix)
   4FE8 20 08         [12]  448 	jr	NZ,00102$
                            449 ;src/entities/entities.c:102: player->y+=2;
   4FEA DD 7E FF      [19]  450 	ld	a,-1 (ix)
   4FED C6 02         [ 7]  451 	add	a, #0x02
   4FEF 12            [ 7]  452 	ld	(de),a
   4FF0 18 05         [12]  453 	jr	00103$
   4FF2                     454 00102$:
                            455 ;src/entities/entities.c:104: player->y++;
   4FF2 DD 7E FF      [19]  456 	ld	a,-1 (ix)
   4FF5 3C            [ 4]  457 	inc	a
   4FF6 12            [ 7]  458 	ld	(de),a
   4FF7                     459 00103$:
                            460 ;src/entities/entities.c:106: player->draw  = SI;
   4FF7 21 04 00      [10]  461 	ld	hl,#0x0004
   4FFA 09            [11]  462 	add	hl,bc
   4FFB 36 01         [10]  463 	ld	(hl),#0x01
   4FFD                     464 00106$:
   4FFD 33            [ 6]  465 	inc	sp
   4FFE DD E1         [14]  466 	pop	ix
   5000 C9            [10]  467 	ret
                            468 ;src/entities/entities.c:113: void moverIzquierda(TPlayer* player){
                            469 ;	---------------------------------
                            470 ; Function moverIzquierda
                            471 ; ---------------------------------
   5001                     472 _moverIzquierda::
                            473 ;src/entities/entities.c:114: if (player->x > 0) {
   5001 D1            [10]  474 	pop	de
   5002 C1            [10]  475 	pop	bc
   5003 C5            [11]  476 	push	bc
   5004 D5            [11]  477 	push	de
   5005 0A            [ 7]  478 	ld	a,(bc)
   5006 B7            [ 4]  479 	or	a, a
   5007 C8            [11]  480 	ret	Z
                            481 ;src/entities/entities.c:115: player->x--;
   5008 C6 FF         [ 7]  482 	add	a,#0xFF
   500A 02            [ 7]  483 	ld	(bc),a
                            484 ;src/entities/entities.c:116: player->draw  = SI;
   500B 21 04 00      [10]  485 	ld	hl,#0x0004
   500E 09            [11]  486 	add	hl,bc
   500F 36 01         [10]  487 	ld	(hl),#0x01
   5011 C9            [10]  488 	ret
                            489 ;src/entities/entities.c:122: void moverDerecha(TPlayer* player){
                            490 ;	---------------------------------
                            491 ; Function moverDerecha
                            492 ; ---------------------------------
   5012                     493 _moverDerecha::
   5012 DD E5         [15]  494 	push	ix
   5014 DD 21 00 00   [14]  495 	ld	ix,#0
   5018 DD 39         [15]  496 	add	ix,sp
                            497 ;src/entities/entities.c:123: if (player->x + G_NAVES_0_W < ANCHO) {
   501A DD 4E 04      [19]  498 	ld	c,4 (ix)
   501D DD 46 05      [19]  499 	ld	b,5 (ix)
   5020 0A            [ 7]  500 	ld	a,(bc)
   5021 5F            [ 4]  501 	ld	e,a
   5022 6B            [ 4]  502 	ld	l,e
   5023 26 00         [ 7]  503 	ld	h,#0x00
   5025 D5            [11]  504 	push	de
   5026 11 08 00      [10]  505 	ld	de,#0x0008
   5029 19            [11]  506 	add	hl, de
   502A D1            [10]  507 	pop	de
   502B 7D            [ 4]  508 	ld	a,l
   502C D6 50         [ 7]  509 	sub	a, #0x50
   502E 7C            [ 4]  510 	ld	a,h
   502F 17            [ 4]  511 	rla
   5030 3F            [ 4]  512 	ccf
   5031 1F            [ 4]  513 	rra
   5032 DE 80         [ 7]  514 	sbc	a, #0x80
   5034 30 09         [12]  515 	jr	NC,00103$
                            516 ;src/entities/entities.c:124: player->x++;
   5036 1C            [ 4]  517 	inc	e
   5037 7B            [ 4]  518 	ld	a,e
   5038 02            [ 7]  519 	ld	(bc),a
                            520 ;src/entities/entities.c:125: player->draw  = SI;
   5039 21 04 00      [10]  521 	ld	hl,#0x0004
   503C 09            [11]  522 	add	hl,bc
   503D 36 01         [10]  523 	ld	(hl),#0x01
   503F                     524 00103$:
   503F DD E1         [14]  525 	pop	ix
   5041 C9            [10]  526 	ret
                            527 ;src/entities/entities.c:133: u8 updatePlayer(TPlayer* player){
                            528 ;	---------------------------------
                            529 ; Function updatePlayer
                            530 ; ---------------------------------
   5042                     531 _updatePlayer::
                            532 ;src/entities/entities.c:135: return 1;
   5042 2E 01         [ 7]  533 	ld	l,#0x01
   5044 C9            [10]  534 	ret
                            535 ;src/entities/entities.c:138: void redibujarPlayer(TPlayer* player){
                            536 ;	---------------------------------
                            537 ; Function redibujarPlayer
                            538 ; ---------------------------------
   5045                     539 _redibujarPlayer::
   5045 DD E5         [15]  540 	push	ix
   5047 DD 21 00 00   [14]  541 	ld	ix,#0
   504B DD 39         [15]  542 	add	ix,sp
                            543 ;src/entities/entities.c:139: if (player->draw) {
   504D DD 4E 04      [19]  544 	ld	c,4 (ix)
   5050 DD 46 05      [19]  545 	ld	b,5 (ix)
   5053 21 04 00      [10]  546 	ld	hl,#0x0004
   5056 09            [11]  547 	add	hl,bc
   5057 EB            [ 4]  548 	ex	de,hl
   5058 1A            [ 7]  549 	ld	a,(de)
   5059 B7            [ 4]  550 	or	a, a
   505A 28 2D         [12]  551 	jr	Z,00103$
                            552 ;src/entities/entities.c:140: borrarPlayer(player);
   505C C5            [11]  553 	push	bc
   505D D5            [11]  554 	push	de
   505E C5            [11]  555 	push	bc
   505F CD 8C 50      [17]  556 	call	_borrarPlayer
   5062 F1            [10]  557 	pop	af
   5063 D1            [10]  558 	pop	de
   5064 C1            [10]  559 	pop	bc
                            560 ;src/entities/entities.c:141: player->px = player->x;
   5065 C5            [11]  561 	push	bc
   5066 FD E1         [14]  562 	pop	iy
   5068 FD 23         [10]  563 	inc	iy
   506A FD 23         [10]  564 	inc	iy
   506C 0A            [ 7]  565 	ld	a,(bc)
   506D FD 77 00      [19]  566 	ld	0 (iy), a
                            567 ;src/entities/entities.c:142: player->py = player->y;
   5070 C5            [11]  568 	push	bc
   5071 FD E1         [14]  569 	pop	iy
   5073 FD 23         [10]  570 	inc	iy
   5075 FD 23         [10]  571 	inc	iy
   5077 FD 23         [10]  572 	inc	iy
   5079 69            [ 4]  573 	ld	l, c
   507A 60            [ 4]  574 	ld	h, b
   507B 23            [ 6]  575 	inc	hl
   507C 6E            [ 7]  576 	ld	l,(hl)
   507D FD 75 00      [19]  577 	ld	0 (iy), l
                            578 ;src/entities/entities.c:143: dibujarPlayer(player);
   5080 D5            [11]  579 	push	de
   5081 C5            [11]  580 	push	bc
   5082 CD DD 50      [17]  581 	call	_dibujarPlayer
   5085 F1            [10]  582 	pop	af
   5086 D1            [10]  583 	pop	de
                            584 ;src/entities/entities.c:144: player->draw = NO;
   5087 AF            [ 4]  585 	xor	a, a
   5088 12            [ 7]  586 	ld	(de),a
   5089                     587 00103$:
   5089 DD E1         [14]  588 	pop	ix
   508B C9            [10]  589 	ret
                            590 ;src/entities/entities.c:148: void borrarPlayer(TPlayer* player){
                            591 ;	---------------------------------
                            592 ; Function borrarPlayer
                            593 ; ---------------------------------
   508C                     594 _borrarPlayer::
   508C DD E5         [15]  595 	push	ix
   508E DD 21 00 00   [14]  596 	ld	ix,#0
   5092 DD 39         [15]  597 	add	ix,sp
                            598 ;src/entities/entities.c:149: u8 w = 4 + (player->px & 1);
   5094 DD 5E 04      [19]  599 	ld	e,4 (ix)
   5097 DD 56 05      [19]  600 	ld	d,5 (ix)
   509A 6B            [ 4]  601 	ld	l, e
   509B 62            [ 4]  602 	ld	h, d
   509C 23            [ 6]  603 	inc	hl
   509D 23            [ 6]  604 	inc	hl
   509E 4E            [ 7]  605 	ld	c,(hl)
   509F 79            [ 4]  606 	ld	a,c
   50A0 E6 01         [ 7]  607 	and	a, #0x01
   50A2 47            [ 4]  608 	ld	b,a
   50A3 04            [ 4]  609 	inc	b
   50A4 04            [ 4]  610 	inc	b
   50A5 04            [ 4]  611 	inc	b
   50A6 04            [ 4]  612 	inc	b
                            613 ;src/entities/entities.c:150: u8 h = 4 + (player->py & 3 ? 1 : 0);
   50A7 EB            [ 4]  614 	ex	de,hl
   50A8 23            [ 6]  615 	inc	hl
   50A9 23            [ 6]  616 	inc	hl
   50AA 23            [ 6]  617 	inc	hl
   50AB 5E            [ 7]  618 	ld	e,(hl)
   50AC 7B            [ 4]  619 	ld	a,e
   50AD E6 03         [ 7]  620 	and	a, #0x03
   50AF 28 04         [12]  621 	jr	Z,00103$
   50B1 16 01         [ 7]  622 	ld	d,#0x01
   50B3 18 02         [12]  623 	jr	00104$
   50B5                     624 00103$:
   50B5 16 00         [ 7]  625 	ld	d,#0x00
   50B7                     626 00104$:
   50B7 14            [ 4]  627 	inc	d
   50B8 14            [ 4]  628 	inc	d
   50B9 14            [ 4]  629 	inc	d
   50BA 14            [ 4]  630 	inc	d
                            631 ;src/entities/entities.c:151: cpct_etm_drawTileBox2x4(player->px / 2, player->py /4, w, h, g_map1_W, ORIGEN_MAPA, mapa);
   50BB 2A 09 4E      [16]  632 	ld	hl,(_mapa)
   50BE CB 3B         [ 8]  633 	srl	e
   50C0 CB 3B         [ 8]  634 	srl	e
   50C2 CB 39         [ 8]  635 	srl	c
   50C4 E5            [11]  636 	push	hl
   50C5 21 00 C0      [10]  637 	ld	hl,#0xC000
   50C8 E5            [11]  638 	push	hl
   50C9 3E 28         [ 7]  639 	ld	a,#0x28
   50CB F5            [11]  640 	push	af
   50CC 33            [ 6]  641 	inc	sp
   50CD D5            [11]  642 	push	de
   50CE 33            [ 6]  643 	inc	sp
   50CF C5            [11]  644 	push	bc
   50D0 33            [ 6]  645 	inc	sp
   50D1 7B            [ 4]  646 	ld	a,e
   50D2 F5            [11]  647 	push	af
   50D3 33            [ 6]  648 	inc	sp
   50D4 79            [ 4]  649 	ld	a,c
   50D5 F5            [11]  650 	push	af
   50D6 33            [ 6]  651 	inc	sp
   50D7 CD 25 4C      [17]  652 	call	_cpct_etm_drawTileBox2x4
   50DA DD E1         [14]  653 	pop	ix
   50DC C9            [10]  654 	ret
                            655 ;src/entities/entities.c:154: void dibujarPlayer(TPlayer* player){
                            656 ;	---------------------------------
                            657 ; Function dibujarPlayer
                            658 ; ---------------------------------
   50DD                     659 _dibujarPlayer::
   50DD DD E5         [15]  660 	push	ix
   50DF DD 21 00 00   [14]  661 	ld	ix,#0
   50E3 DD 39         [15]  662 	add	ix,sp
                            663 ;src/entities/entities.c:155: u8* vmem = cpct_getScreenPtr(CPCT_VMEM_START,player->x, player->y);
   50E5 DD 4E 04      [19]  664 	ld	c,4 (ix)
   50E8 DD 46 05      [19]  665 	ld	b,5 (ix)
   50EB 69            [ 4]  666 	ld	l, c
   50EC 60            [ 4]  667 	ld	h, b
   50ED 23            [ 6]  668 	inc	hl
   50EE 56            [ 7]  669 	ld	d,(hl)
   50EF 0A            [ 7]  670 	ld	a,(bc)
   50F0 C5            [11]  671 	push	bc
   50F1 D5            [11]  672 	push	de
   50F2 33            [ 6]  673 	inc	sp
   50F3 F5            [11]  674 	push	af
   50F4 33            [ 6]  675 	inc	sp
   50F5 21 00 C0      [10]  676 	ld	hl,#0xC000
   50F8 E5            [11]  677 	push	hl
   50F9 CD AE 4D      [17]  678 	call	_cpct_getScreenPtr
   50FC EB            [ 4]  679 	ex	de,hl
                            680 ;src/entities/entities.c:156: cpct_drawSpriteMaskedAlignedTable(player->sprite,vmem,G_NAVES_0_W,G_NAVES_0_H, g_tablatrans);
   50FD E1            [10]  681 	pop	hl
   50FE 01 05 00      [10]  682 	ld	bc, #0x0005
   5101 09            [11]  683 	add	hl, bc
   5102 4E            [ 7]  684 	ld	c,(hl)
   5103 23            [ 6]  685 	inc	hl
   5104 46            [ 7]  686 	ld	b,(hl)
   5105 21 00 01      [10]  687 	ld	hl,#_g_tablatrans
   5108 E5            [11]  688 	push	hl
   5109 21 08 10      [10]  689 	ld	hl,#0x1008
   510C E5            [11]  690 	push	hl
   510D D5            [11]  691 	push	de
   510E C5            [11]  692 	push	bc
   510F CD CE 4D      [17]  693 	call	_cpct_drawSpriteMaskedAlignedTable
   5112 DD E1         [14]  694 	pop	ix
   5114 C9            [10]  695 	ret
                            696 ;src/entities/entities.c:159: void drawAll(TPlayer* player){
                            697 ;	---------------------------------
                            698 ; Function drawAll
                            699 ; ---------------------------------
   5115                     700 _drawAll::
                            701 ;src/entities/entities.c:161: redibujarPlayer(player);
   5115 C1            [10]  702 	pop	bc
   5116 E1            [10]  703 	pop	hl
   5117 E5            [11]  704 	push	hl
   5118 C5            [11]  705 	push	bc
   5119 E5            [11]  706 	push	hl
   511A CD 45 50      [17]  707 	call	_redibujarPlayer
   511D F1            [10]  708 	pop	af
   511E C9            [10]  709 	ret
                            710 	.area _CODE
                            711 	.area _INITIALIZER
                            712 	.area _CABS (ABS)
