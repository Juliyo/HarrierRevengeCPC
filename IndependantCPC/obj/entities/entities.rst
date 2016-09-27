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
                             14 	.globl _enemigos
                             15 	.globl _incializarEntities
                             16 	.globl _accion
                             17 	.globl _flipSprite
                             18 	.globl _moverArriba
                             19 	.globl _moverAbajo
                             20 	.globl _moverIzquierda
                             21 	.globl _moverDerecha
                             22 	.globl _updatePlayer
                             23 	.globl _updateEntities
                             24 	.globl _redibujarEntity
                             25 	.globl _borrarEntity
                             26 	.globl _dibujarEntity
                             27 	.globl _drawAll
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
                             39 ;--------------------------------------------------------
                             40 ; absolute external ram data
                             41 ;--------------------------------------------------------
                             42 	.area _DABS (ABS)
                             43 ;--------------------------------------------------------
                             44 ; global & static initialisations
                             45 ;--------------------------------------------------------
                             46 	.area _HOME
                             47 	.area _GSINIT
                             48 	.area _GSFINAL
                             49 	.area _GSINIT
                             50 ;--------------------------------------------------------
                             51 ; Home
                             52 ;--------------------------------------------------------
                             53 	.area _HOME
                             54 	.area _HOME
                             55 ;--------------------------------------------------------
                             56 ; code
                             57 ;--------------------------------------------------------
                             58 	.area _CODE
                             59 ;src/entities/entities.c:12: cpctm_createTransparentMaskTable(g_tablatrans,0x0100,M0,0);
                             60 ;	---------------------------------
                             61 ; Function dummy_cpct_transparentMaskTable0M0_container
                             62 ; ---------------------------------
   4BF9                      63 _dummy_cpct_transparentMaskTable0M0_container::
                             64 	.area _g_tablatrans_ (ABS) 
   0100                      65 	.org 0x0100 
   0100                      66 	 _g_tablatrans::
   0100 FF AA 55 00 AA AA    67 	.db 0xFF, 0xAA, 0x55, 0x00, 0xAA, 0xAA, 0x00, 0x00 
        00 00
   0108 55 00 55 00 00 00    68 	.db 0x55, 0x00, 0x55, 0x00, 0x00, 0x00, 0x00, 0x00 
        00 00
   0110 AA AA 00 00 AA AA    69 	.db 0xAA, 0xAA, 0x00, 0x00, 0xAA, 0xAA, 0x00, 0x00 
        00 00
   0118 00 00 00 00 00 00    70 	.db 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00 
        00 00
   0120 55 00 55 00 00 00    71 	.db 0x55, 0x00, 0x55, 0x00, 0x00, 0x00, 0x00, 0x00 
        00 00
   0128 55 00 55 00 00 00    72 	.db 0x55, 0x00, 0x55, 0x00, 0x00, 0x00, 0x00, 0x00 
        00 00
   0130 00 00 00 00 00 00    73 	.db 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00 
        00 00
   0138 00 00 00 00 00 00    74 	.db 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00 
        00 00
   0140 AA AA 00 00 AA AA    75 	.db 0xAA, 0xAA, 0x00, 0x00, 0xAA, 0xAA, 0x00, 0x00 
        00 00
   0148 00 00 00 00 00 00    76 	.db 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00 
        00 00
   0150 AA AA 00 00 AA AA    77 	.db 0xAA, 0xAA, 0x00, 0x00, 0xAA, 0xAA, 0x00, 0x00 
        00 00
   0158 00 00 00 00 00 00    78 	.db 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00 
        00 00
   0160 00 00 00 00 00 00    79 	.db 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00 
        00 00
   0168 00 00 00 00 00 00    80 	.db 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00 
        00 00
   0170 00 00 00 00 00 00    81 	.db 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00 
        00 00
   0178 00 00 00 00 00 00    82 	.db 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00 
        00 00
   0180 55 00 55 00 00 00    83 	.db 0x55, 0x00, 0x55, 0x00, 0x00, 0x00, 0x00, 0x00 
        00 00
   0188 55 00 55 00 00 00    84 	.db 0x55, 0x00, 0x55, 0x00, 0x00, 0x00, 0x00, 0x00 
        00 00
   0190 00 00 00 00 00 00    85 	.db 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00 
        00 00
   0198 00 00 00 00 00 00    86 	.db 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00 
        00 00
   01A0 55 00 55 00 00 00    87 	.db 0x55, 0x00, 0x55, 0x00, 0x00, 0x00, 0x00, 0x00 
        00 00
   01A8 55 00 55 00 00 00    88 	.db 0x55, 0x00, 0x55, 0x00, 0x00, 0x00, 0x00, 0x00 
        00 00
   01B0 00 00 00 00 00 00    89 	.db 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00 
        00 00
   01B8 00 00 00 00 00 00    90 	.db 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00 
        00 00
   01C0 00 00 00 00 00 00    91 	.db 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00 
        00 00
   01C8 00 00 00 00 00 00    92 	.db 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00 
        00 00
   01D0 00 00 00 00 00 00    93 	.db 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00 
        00 00
   01D8 00 00 00 00 00 00    94 	.db 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00 
        00 00
   01E0 00 00 00 00 00 00    95 	.db 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00 
        00 00
   01E8 00 00 00 00 00 00    96 	.db 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00 
        00 00
   01F0 00 00 00 00 00 00    97 	.db 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00 
        00 00
   01F8 00 00 00 00 00 00    98 	.db 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00 
        00 00
                             99 	.area _CSEG (REL, CON) 
                            100 ;src/entities/entities.c:31: void incializarEntities(){
                            101 ;	---------------------------------
                            102 ; Function incializarEntities
                            103 ; ---------------------------------
   4E10                     104 _incializarEntities::
                            105 ;src/entities/entities.c:33: }
   4E10 C9            [10]  106 	ret
   4E11                     107 _enemigos:
   4E11 32                  108 	.db #0x32	; 50	'2'
   4E12 9D                  109 	.db #0x9D	; 157
   4E13 14                  110 	.db #0x14	; 20
   4E14 9D                  111 	.db #0x9D	; 157
   4E15 01                  112 	.db #0x01	; 1
   4E16 F8 48               113 	.dw _g_naves_0
   4E18 00                  114 	.db #0x00	; 0
   4E19 14                  115 	.db #0x14	; 20
   4E1A 32                  116 	.db #0x32	; 50	'2'
   4E1B 14                  117 	.db #0x14	; 20
   4E1C 32                  118 	.db #0x32	; 50	'2'
   4E1D 01                  119 	.db #0x01	; 1
   4E1E F8 48               120 	.dw _g_naves_0
   4E20 00                  121 	.db #0x00	; 0
                            122 ;src/entities/entities.c:37: void accion(TEntity* ent, TPlayerStatus action, TPlayerDirection dir){
                            123 ;	---------------------------------
                            124 ; Function accion
                            125 ; ---------------------------------
   4E21                     126 _accion::
   4E21 DD E5         [15]  127 	push	ix
   4E23 DD 21 00 00   [14]  128 	ld	ix,#0
   4E27 DD 39         [15]  129 	add	ix,sp
                            130 ;src/entities/entities.c:38: switch(action){
   4E29 DD 7E 06      [19]  131 	ld	a,6 (ix)
   4E2C 3D            [ 4]  132 	dec	a
   4E2D C2 C1 4E      [10]  133 	jp	NZ,00108$
                            134 ;src/entities/entities.c:40: switch(dir){
   4E30 3E 03         [ 7]  135 	ld	a,#0x03
   4E32 DD 96 07      [19]  136 	sub	a, 7 (ix)
   4E35 DA C1 4E      [10]  137 	jp	C,00108$
   4E38 DD 5E 07      [19]  138 	ld	e,7 (ix)
   4E3B 16 00         [ 7]  139 	ld	d,#0x00
   4E3D 21 43 4E      [10]  140 	ld	hl,#00120$
   4E40 19            [11]  141 	add	hl,de
   4E41 19            [11]  142 	add	hl,de
                            143 ;src/entities/entities.c:41: case d_up:
   4E42 E9            [ 4]  144 	jp	(hl)
   4E43                     145 00120$:
   4E43 18 06         [12]  146 	jr	00102$
   4E45 18 22         [12]  147 	jr	00103$
   4E47 18 5C         [12]  148 	jr	00105$
   4E49 18 3C         [12]  149 	jr	00104$
   4E4B                     150 00102$:
                            151 ;src/entities/entities.c:42: moverArriba(ent);
   4E4B DD 6E 04      [19]  152 	ld	l,4 (ix)
   4E4E DD 66 05      [19]  153 	ld	h,5 (ix)
   4E51 E5            [11]  154 	push	hl
   4E52 CD 2F 4F      [17]  155 	call	_moverArriba
   4E55 F1            [10]  156 	pop	af
                            157 ;src/entities/entities.c:43: flipSprite(ent,dir);
   4E56 DD 7E 07      [19]  158 	ld	a,7 (ix)
   4E59 F5            [11]  159 	push	af
   4E5A 33            [ 6]  160 	inc	sp
   4E5B DD 6E 04      [19]  161 	ld	l,4 (ix)
   4E5E DD 66 05      [19]  162 	ld	h,5 (ix)
   4E61 E5            [11]  163 	push	hl
   4E62 CD C4 4E      [17]  164 	call	_flipSprite
   4E65 F1            [10]  165 	pop	af
   4E66 33            [ 6]  166 	inc	sp
                            167 ;src/entities/entities.c:44: break;
   4E67 18 58         [12]  168 	jr	00108$
                            169 ;src/entities/entities.c:45: case d_down:
   4E69                     170 00103$:
                            171 ;src/entities/entities.c:46: moverAbajo(ent);
   4E69 DD 6E 04      [19]  172 	ld	l,4 (ix)
   4E6C DD 66 05      [19]  173 	ld	h,5 (ix)
   4E6F E5            [11]  174 	push	hl
   4E70 CD 59 4F      [17]  175 	call	_moverAbajo
   4E73 F1            [10]  176 	pop	af
                            177 ;src/entities/entities.c:47: flipSprite(ent,dir);
   4E74 DD 7E 07      [19]  178 	ld	a,7 (ix)
   4E77 F5            [11]  179 	push	af
   4E78 33            [ 6]  180 	inc	sp
   4E79 DD 6E 04      [19]  181 	ld	l,4 (ix)
   4E7C DD 66 05      [19]  182 	ld	h,5 (ix)
   4E7F E5            [11]  183 	push	hl
   4E80 CD C4 4E      [17]  184 	call	_flipSprite
   4E83 F1            [10]  185 	pop	af
   4E84 33            [ 6]  186 	inc	sp
                            187 ;src/entities/entities.c:48: break;
   4E85 18 3A         [12]  188 	jr	00108$
                            189 ;src/entities/entities.c:49: case d_left:
   4E87                     190 00104$:
                            191 ;src/entities/entities.c:50: moverIzquierda(ent);
   4E87 DD 6E 04      [19]  192 	ld	l,4 (ix)
   4E8A DD 66 05      [19]  193 	ld	h,5 (ix)
   4E8D E5            [11]  194 	push	hl
   4E8E CD A0 4F      [17]  195 	call	_moverIzquierda
   4E91 F1            [10]  196 	pop	af
                            197 ;src/entities/entities.c:51: flipSprite(ent,dir);
   4E92 DD 7E 07      [19]  198 	ld	a,7 (ix)
   4E95 F5            [11]  199 	push	af
   4E96 33            [ 6]  200 	inc	sp
   4E97 DD 6E 04      [19]  201 	ld	l,4 (ix)
   4E9A DD 66 05      [19]  202 	ld	h,5 (ix)
   4E9D E5            [11]  203 	push	hl
   4E9E CD C4 4E      [17]  204 	call	_flipSprite
   4EA1 F1            [10]  205 	pop	af
   4EA2 33            [ 6]  206 	inc	sp
                            207 ;src/entities/entities.c:52: break;
   4EA3 18 1C         [12]  208 	jr	00108$
                            209 ;src/entities/entities.c:53: case d_right:
   4EA5                     210 00105$:
                            211 ;src/entities/entities.c:54: moverDerecha(ent);
   4EA5 DD 6E 04      [19]  212 	ld	l,4 (ix)
   4EA8 DD 66 05      [19]  213 	ld	h,5 (ix)
   4EAB E5            [11]  214 	push	hl
   4EAC CD B1 4F      [17]  215 	call	_moverDerecha
   4EAF F1            [10]  216 	pop	af
                            217 ;src/entities/entities.c:55: flipSprite(ent,dir);
   4EB0 DD 7E 07      [19]  218 	ld	a,7 (ix)
   4EB3 F5            [11]  219 	push	af
   4EB4 33            [ 6]  220 	inc	sp
   4EB5 DD 6E 04      [19]  221 	ld	l,4 (ix)
   4EB8 DD 66 05      [19]  222 	ld	h,5 (ix)
   4EBB E5            [11]  223 	push	hl
   4EBC CD C4 4E      [17]  224 	call	_flipSprite
   4EBF F1            [10]  225 	pop	af
   4EC0 33            [ 6]  226 	inc	sp
                            227 ;src/entities/entities.c:60: }
   4EC1                     228 00108$:
   4EC1 DD E1         [14]  229 	pop	ix
   4EC3 C9            [10]  230 	ret
                            231 ;src/entities/entities.c:64: void flipSprite(TEntity* ent, TPlayerDirection dir){
                            232 ;	---------------------------------
                            233 ; Function flipSprite
                            234 ; ---------------------------------
   4EC4                     235 _flipSprite::
   4EC4 DD E5         [15]  236 	push	ix
   4EC6 DD 21 00 00   [14]  237 	ld	ix,#0
   4ECA DD 39         [15]  238 	add	ix,sp
   4ECC 3B            [ 6]  239 	dec	sp
                            240 ;src/entities/entities.c:65: if(ent->curr_dir != dir){
   4ECD DD 4E 04      [19]  241 	ld	c,4 (ix)
   4ED0 DD 46 05      [19]  242 	ld	b,5 (ix)
   4ED3 21 07 00      [10]  243 	ld	hl,#0x0007
   4ED6 09            [11]  244 	add	hl,bc
   4ED7 EB            [ 4]  245 	ex	de,hl
   4ED8 1A            [ 7]  246 	ld	a,(de)
   4ED9 DD 77 FF      [19]  247 	ld	-1 (ix),a
   4EDC DD 7E 06      [19]  248 	ld	a,6 (ix)
   4EDF DD 96 FF      [19]  249 	sub	a, -1 (ix)
   4EE2 28 47         [12]  250 	jr	Z,00108$
                            251 ;src/entities/entities.c:66: switch(dir){
   4EE4 3E 03         [ 7]  252 	ld	a,#0x03
   4EE6 DD 96 06      [19]  253 	sub	a, 6 (ix)
   4EE9 38 3C         [12]  254 	jr	C,00105$
                            255 ;src/entities/entities.c:68: ent->sprite = g_naves_0;
   4EEB 03            [ 6]  256 	inc	bc
   4EEC 03            [ 6]  257 	inc	bc
   4EED 03            [ 6]  258 	inc	bc
   4EEE 03            [ 6]  259 	inc	bc
   4EEF 03            [ 6]  260 	inc	bc
                            261 ;src/entities/entities.c:66: switch(dir){
   4EF0 D5            [11]  262 	push	de
   4EF1 DD 5E 06      [19]  263 	ld	e,6 (ix)
   4EF4 16 00         [ 7]  264 	ld	d,#0x00
   4EF6 21 FD 4E      [10]  265 	ld	hl,#00119$
   4EF9 19            [11]  266 	add	hl,de
   4EFA 19            [11]  267 	add	hl,de
                            268 ;src/entities/entities.c:67: case d_up:
   4EFB D1            [10]  269 	pop	de
   4EFC E9            [ 4]  270 	jp	(hl)
   4EFD                     271 00119$:
   4EFD 18 06         [12]  272 	jr	00101$
   4EFF 18 0D         [12]  273 	jr	00102$
   4F01 18 1D         [12]  274 	jr	00104$
   4F03 18 12         [12]  275 	jr	00103$
   4F05                     276 00101$:
                            277 ;src/entities/entities.c:68: ent->sprite = g_naves_0;
   4F05 3E F8         [ 7]  278 	ld	a,#<(_g_naves_0)
   4F07 02            [ 7]  279 	ld	(bc),a
   4F08 03            [ 6]  280 	inc	bc
   4F09 3E 48         [ 7]  281 	ld	a,#>(_g_naves_0)
   4F0B 02            [ 7]  282 	ld	(bc),a
                            283 ;src/entities/entities.c:70: break;
   4F0C 18 19         [12]  284 	jr	00105$
                            285 ;src/entities/entities.c:71: case d_down:
   4F0E                     286 00102$:
                            287 ;src/entities/entities.c:72: ent->sprite = g_naves_2;
   4F0E 3E F8         [ 7]  288 	ld	a,#<(_g_naves_2)
   4F10 02            [ 7]  289 	ld	(bc),a
   4F11 03            [ 6]  290 	inc	bc
   4F12 3E 49         [ 7]  291 	ld	a,#>(_g_naves_2)
   4F14 02            [ 7]  292 	ld	(bc),a
                            293 ;src/entities/entities.c:74: break;
   4F15 18 10         [12]  294 	jr	00105$
                            295 ;src/entities/entities.c:75: case d_left:
   4F17                     296 00103$:
                            297 ;src/entities/entities.c:76: ent->sprite = g_naves_3;
   4F17 3E 78         [ 7]  298 	ld	a,#<(_g_naves_3)
   4F19 02            [ 7]  299 	ld	(bc),a
   4F1A 03            [ 6]  300 	inc	bc
   4F1B 3E 4A         [ 7]  301 	ld	a,#>(_g_naves_3)
   4F1D 02            [ 7]  302 	ld	(bc),a
                            303 ;src/entities/entities.c:77: break;
   4F1E 18 07         [12]  304 	jr	00105$
                            305 ;src/entities/entities.c:78: case d_right:
   4F20                     306 00104$:
                            307 ;src/entities/entities.c:79: ent->sprite = g_naves_1;
   4F20 3E 78         [ 7]  308 	ld	a,#<(_g_naves_1)
   4F22 02            [ 7]  309 	ld	(bc),a
   4F23 03            [ 6]  310 	inc	bc
   4F24 3E 49         [ 7]  311 	ld	a,#>(_g_naves_1)
   4F26 02            [ 7]  312 	ld	(bc),a
                            313 ;src/entities/entities.c:81: }
   4F27                     314 00105$:
                            315 ;src/entities/entities.c:82: ent->curr_dir = dir; 
   4F27 DD 7E 06      [19]  316 	ld	a,6 (ix)
   4F2A 12            [ 7]  317 	ld	(de),a
   4F2B                     318 00108$:
   4F2B 33            [ 6]  319 	inc	sp
   4F2C DD E1         [14]  320 	pop	ix
   4F2E C9            [10]  321 	ret
                            322 ;src/entities/entities.c:102: void moverArriba(TEntity* ent){
                            323 ;	---------------------------------
                            324 ; Function moverArriba
                            325 ; ---------------------------------
   4F2F                     326 _moverArriba::
   4F2F DD E5         [15]  327 	push	ix
   4F31 DD 21 00 00   [14]  328 	ld	ix,#0
   4F35 DD 39         [15]  329 	add	ix,sp
                            330 ;src/entities/entities.c:103: if (ent->y > 0) {
   4F37 DD 4E 04      [19]  331 	ld	c,4 (ix)
   4F3A DD 46 05      [19]  332 	ld	b,5 (ix)
   4F3D 59            [ 4]  333 	ld	e, c
   4F3E 50            [ 4]  334 	ld	d, b
   4F3F 13            [ 6]  335 	inc	de
   4F40 1A            [ 7]  336 	ld	a,(de)
   4F41 B7            [ 4]  337 	or	a, a
   4F42 28 12         [12]  338 	jr	Z,00106$
                            339 ;src/entities/entities.c:104: if(ent->y%2 == 0)
   4F44 CB 47         [ 8]  340 	bit	0, a
   4F46 20 05         [12]  341 	jr	NZ,00102$
                            342 ;src/entities/entities.c:105: ent->y-=2;
   4F48 C6 FE         [ 7]  343 	add	a,#0xFE
   4F4A 12            [ 7]  344 	ld	(de),a
   4F4B 18 03         [12]  345 	jr	00103$
   4F4D                     346 00102$:
                            347 ;src/entities/entities.c:107: ent->y--;
   4F4D C6 FF         [ 7]  348 	add	a,#0xFF
   4F4F 12            [ 7]  349 	ld	(de),a
   4F50                     350 00103$:
                            351 ;src/entities/entities.c:109: ent->draw  = SI;
   4F50 21 04 00      [10]  352 	ld	hl,#0x0004
   4F53 09            [11]  353 	add	hl,bc
   4F54 36 01         [10]  354 	ld	(hl),#0x01
   4F56                     355 00106$:
   4F56 DD E1         [14]  356 	pop	ix
   4F58 C9            [10]  357 	ret
                            358 ;src/entities/entities.c:116: void moverAbajo(TEntity* ent){
                            359 ;	---------------------------------
                            360 ; Function moverAbajo
                            361 ; ---------------------------------
   4F59                     362 _moverAbajo::
   4F59 DD E5         [15]  363 	push	ix
   4F5B DD 21 00 00   [14]  364 	ld	ix,#0
   4F5F DD 39         [15]  365 	add	ix,sp
   4F61 3B            [ 6]  366 	dec	sp
                            367 ;src/entities/entities.c:117: if (ent->y + G_NAVES_0_H < ALTO) {
   4F62 DD 4E 04      [19]  368 	ld	c,4 (ix)
   4F65 DD 46 05      [19]  369 	ld	b,5 (ix)
   4F68 59            [ 4]  370 	ld	e, c
   4F69 50            [ 4]  371 	ld	d, b
   4F6A 13            [ 6]  372 	inc	de
   4F6B 1A            [ 7]  373 	ld	a,(de)
   4F6C DD 77 FF      [19]  374 	ld	-1 (ix), a
   4F6F 6F            [ 4]  375 	ld	l, a
   4F70 26 00         [ 7]  376 	ld	h,#0x00
   4F72 D5            [11]  377 	push	de
   4F73 11 10 00      [10]  378 	ld	de,#0x0010
   4F76 19            [11]  379 	add	hl, de
   4F77 D1            [10]  380 	pop	de
   4F78 7D            [ 4]  381 	ld	a,l
   4F79 D6 C8         [ 7]  382 	sub	a, #0xC8
   4F7B 7C            [ 4]  383 	ld	a,h
   4F7C 17            [ 4]  384 	rla
   4F7D 3F            [ 4]  385 	ccf
   4F7E 1F            [ 4]  386 	rra
   4F7F DE 80         [ 7]  387 	sbc	a, #0x80
   4F81 30 19         [12]  388 	jr	NC,00106$
                            389 ;src/entities/entities.c:118: if(ent->y%2 == 0)
   4F83 DD CB FF 46   [20]  390 	bit	0, -1 (ix)
   4F87 20 08         [12]  391 	jr	NZ,00102$
                            392 ;src/entities/entities.c:119: ent->y+=2;
   4F89 DD 7E FF      [19]  393 	ld	a,-1 (ix)
   4F8C C6 02         [ 7]  394 	add	a, #0x02
   4F8E 12            [ 7]  395 	ld	(de),a
   4F8F 18 05         [12]  396 	jr	00103$
   4F91                     397 00102$:
                            398 ;src/entities/entities.c:121: ent->y++;
   4F91 DD 7E FF      [19]  399 	ld	a,-1 (ix)
   4F94 3C            [ 4]  400 	inc	a
   4F95 12            [ 7]  401 	ld	(de),a
   4F96                     402 00103$:
                            403 ;src/entities/entities.c:123: ent->draw  = SI;
   4F96 21 04 00      [10]  404 	ld	hl,#0x0004
   4F99 09            [11]  405 	add	hl,bc
   4F9A 36 01         [10]  406 	ld	(hl),#0x01
   4F9C                     407 00106$:
   4F9C 33            [ 6]  408 	inc	sp
   4F9D DD E1         [14]  409 	pop	ix
   4F9F C9            [10]  410 	ret
                            411 ;src/entities/entities.c:130: void moverIzquierda(TEntity* ent){
                            412 ;	---------------------------------
                            413 ; Function moverIzquierda
                            414 ; ---------------------------------
   4FA0                     415 _moverIzquierda::
                            416 ;src/entities/entities.c:131: if (ent->x > 0) {
   4FA0 D1            [10]  417 	pop	de
   4FA1 C1            [10]  418 	pop	bc
   4FA2 C5            [11]  419 	push	bc
   4FA3 D5            [11]  420 	push	de
   4FA4 0A            [ 7]  421 	ld	a,(bc)
   4FA5 B7            [ 4]  422 	or	a, a
   4FA6 C8            [11]  423 	ret	Z
                            424 ;src/entities/entities.c:132: ent->x--;
   4FA7 C6 FF         [ 7]  425 	add	a,#0xFF
   4FA9 02            [ 7]  426 	ld	(bc),a
                            427 ;src/entities/entities.c:133: ent->draw  = SI;
   4FAA 21 04 00      [10]  428 	ld	hl,#0x0004
   4FAD 09            [11]  429 	add	hl,bc
   4FAE 36 01         [10]  430 	ld	(hl),#0x01
   4FB0 C9            [10]  431 	ret
                            432 ;src/entities/entities.c:139: void moverDerecha(TEntity* ent){
                            433 ;	---------------------------------
                            434 ; Function moverDerecha
                            435 ; ---------------------------------
   4FB1                     436 _moverDerecha::
   4FB1 DD E5         [15]  437 	push	ix
   4FB3 DD 21 00 00   [14]  438 	ld	ix,#0
   4FB7 DD 39         [15]  439 	add	ix,sp
                            440 ;src/entities/entities.c:140: if (ent->x + G_NAVES_0_W < ANCHO) {
   4FB9 DD 4E 04      [19]  441 	ld	c,4 (ix)
   4FBC DD 46 05      [19]  442 	ld	b,5 (ix)
   4FBF 0A            [ 7]  443 	ld	a,(bc)
   4FC0 5F            [ 4]  444 	ld	e,a
   4FC1 6B            [ 4]  445 	ld	l,e
   4FC2 26 00         [ 7]  446 	ld	h,#0x00
   4FC4 D5            [11]  447 	push	de
   4FC5 11 08 00      [10]  448 	ld	de,#0x0008
   4FC8 19            [11]  449 	add	hl, de
   4FC9 D1            [10]  450 	pop	de
   4FCA 7D            [ 4]  451 	ld	a,l
   4FCB D6 50         [ 7]  452 	sub	a, #0x50
   4FCD 7C            [ 4]  453 	ld	a,h
   4FCE 17            [ 4]  454 	rla
   4FCF 3F            [ 4]  455 	ccf
   4FD0 1F            [ 4]  456 	rra
   4FD1 DE 80         [ 7]  457 	sbc	a, #0x80
   4FD3 30 09         [12]  458 	jr	NC,00103$
                            459 ;src/entities/entities.c:141: ent->x++;
   4FD5 1C            [ 4]  460 	inc	e
   4FD6 7B            [ 4]  461 	ld	a,e
   4FD7 02            [ 7]  462 	ld	(bc),a
                            463 ;src/entities/entities.c:142: ent->draw  = SI;
   4FD8 21 04 00      [10]  464 	ld	hl,#0x0004
   4FDB 09            [11]  465 	add	hl,bc
   4FDC 36 01         [10]  466 	ld	(hl),#0x01
   4FDE                     467 00103$:
   4FDE DD E1         [14]  468 	pop	ix
   4FE0 C9            [10]  469 	ret
                            470 ;src/entities/entities.c:150: u8 updatePlayer(TEntity* player){
                            471 ;	---------------------------------
                            472 ; Function updatePlayer
                            473 ; ---------------------------------
   4FE1                     474 _updatePlayer::
                            475 ;src/entities/entities.c:152: return 1;
   4FE1 2E 01         [ 7]  476 	ld	l,#0x01
   4FE3 C9            [10]  477 	ret
                            478 ;src/entities/entities.c:155: void updateEntities(){
                            479 ;	---------------------------------
                            480 ; Function updateEntities
                            481 ; ---------------------------------
   4FE4                     482 _updateEntities::
                            483 ;src/entities/entities.c:157: }
   4FE4 C9            [10]  484 	ret
                            485 ;src/entities/entities.c:159: void redibujarEntity(TEntity* ent, u8 w, u8 h){
                            486 ;	---------------------------------
                            487 ; Function redibujarEntity
                            488 ; ---------------------------------
   4FE5                     489 _redibujarEntity::
   4FE5 DD E5         [15]  490 	push	ix
   4FE7 DD 21 00 00   [14]  491 	ld	ix,#0
   4FEB DD 39         [15]  492 	add	ix,sp
                            493 ;src/entities/entities.c:160: if (ent->draw) {
   4FED DD 4E 04      [19]  494 	ld	c,4 (ix)
   4FF0 DD 46 05      [19]  495 	ld	b,5 (ix)
   4FF3 21 04 00      [10]  496 	ld	hl,#0x0004
   4FF6 09            [11]  497 	add	hl,bc
   4FF7 EB            [ 4]  498 	ex	de,hl
   4FF8 1A            [ 7]  499 	ld	a,(de)
   4FF9 B7            [ 4]  500 	or	a, a
   4FFA 28 35         [12]  501 	jr	Z,00103$
                            502 ;src/entities/entities.c:161: borrarEntity(ent);
   4FFC C5            [11]  503 	push	bc
   4FFD D5            [11]  504 	push	de
   4FFE C5            [11]  505 	push	bc
   4FFF CD 34 50      [17]  506 	call	_borrarEntity
   5002 F1            [10]  507 	pop	af
   5003 D1            [10]  508 	pop	de
   5004 C1            [10]  509 	pop	bc
                            510 ;src/entities/entities.c:162: ent->px = ent->x;
   5005 C5            [11]  511 	push	bc
   5006 FD E1         [14]  512 	pop	iy
   5008 FD 23         [10]  513 	inc	iy
   500A FD 23         [10]  514 	inc	iy
   500C 0A            [ 7]  515 	ld	a,(bc)
   500D FD 77 00      [19]  516 	ld	0 (iy), a
                            517 ;src/entities/entities.c:163: ent->py = ent->y;
   5010 C5            [11]  518 	push	bc
   5011 FD E1         [14]  519 	pop	iy
   5013 FD 23         [10]  520 	inc	iy
   5015 FD 23         [10]  521 	inc	iy
   5017 FD 23         [10]  522 	inc	iy
   5019 69            [ 4]  523 	ld	l, c
   501A 60            [ 4]  524 	ld	h, b
   501B 23            [ 6]  525 	inc	hl
   501C 6E            [ 7]  526 	ld	l,(hl)
   501D FD 75 00      [19]  527 	ld	0 (iy), l
                            528 ;src/entities/entities.c:164: dibujarEntity(ent, w, h);
   5020 D5            [11]  529 	push	de
   5021 DD 66 07      [19]  530 	ld	h,7 (ix)
   5024 DD 6E 06      [19]  531 	ld	l,6 (ix)
   5027 E5            [11]  532 	push	hl
   5028 C5            [11]  533 	push	bc
   5029 CD 85 50      [17]  534 	call	_dibujarEntity
   502C F1            [10]  535 	pop	af
   502D F1            [10]  536 	pop	af
   502E D1            [10]  537 	pop	de
                            538 ;src/entities/entities.c:165: ent->draw = NO;
   502F AF            [ 4]  539 	xor	a, a
   5030 12            [ 7]  540 	ld	(de),a
   5031                     541 00103$:
   5031 DD E1         [14]  542 	pop	ix
   5033 C9            [10]  543 	ret
                            544 ;src/entities/entities.c:169: void borrarEntity(TEntity* ent){
                            545 ;	---------------------------------
                            546 ; Function borrarEntity
                            547 ; ---------------------------------
   5034                     548 _borrarEntity::
   5034 DD E5         [15]  549 	push	ix
   5036 DD 21 00 00   [14]  550 	ld	ix,#0
   503A DD 39         [15]  551 	add	ix,sp
                            552 ;src/entities/entities.c:170: u8 w = 4 + (ent->px & 1);
   503C DD 5E 04      [19]  553 	ld	e,4 (ix)
   503F DD 56 05      [19]  554 	ld	d,5 (ix)
   5042 6B            [ 4]  555 	ld	l, e
   5043 62            [ 4]  556 	ld	h, d
   5044 23            [ 6]  557 	inc	hl
   5045 23            [ 6]  558 	inc	hl
   5046 4E            [ 7]  559 	ld	c,(hl)
   5047 79            [ 4]  560 	ld	a,c
   5048 E6 01         [ 7]  561 	and	a, #0x01
   504A 47            [ 4]  562 	ld	b,a
   504B 04            [ 4]  563 	inc	b
   504C 04            [ 4]  564 	inc	b
   504D 04            [ 4]  565 	inc	b
   504E 04            [ 4]  566 	inc	b
                            567 ;src/entities/entities.c:171: u8 h = 4 + (ent->py & 3 ? 1 : 0);
   504F EB            [ 4]  568 	ex	de,hl
   5050 23            [ 6]  569 	inc	hl
   5051 23            [ 6]  570 	inc	hl
   5052 23            [ 6]  571 	inc	hl
   5053 5E            [ 7]  572 	ld	e,(hl)
   5054 7B            [ 4]  573 	ld	a,e
   5055 E6 03         [ 7]  574 	and	a, #0x03
   5057 28 04         [12]  575 	jr	Z,00103$
   5059 16 01         [ 7]  576 	ld	d,#0x01
   505B 18 02         [12]  577 	jr	00104$
   505D                     578 00103$:
   505D 16 00         [ 7]  579 	ld	d,#0x00
   505F                     580 00104$:
   505F 14            [ 4]  581 	inc	d
   5060 14            [ 4]  582 	inc	d
   5061 14            [ 4]  583 	inc	d
   5062 14            [ 4]  584 	inc	d
                            585 ;src/entities/entities.c:172: cpct_etm_drawTileBox2x4(ent->px / 2, ent->py /4, w, h, g_map1_W, ORIGEN_MAPA, mapa);
   5063 2A 0C 4E      [16]  586 	ld	hl,(_mapa)
   5066 CB 3B         [ 8]  587 	srl	e
   5068 CB 3B         [ 8]  588 	srl	e
   506A CB 39         [ 8]  589 	srl	c
   506C E5            [11]  590 	push	hl
   506D 21 00 C0      [10]  591 	ld	hl,#0xC000
   5070 E5            [11]  592 	push	hl
   5071 3E 28         [ 7]  593 	ld	a,#0x28
   5073 F5            [11]  594 	push	af
   5074 33            [ 6]  595 	inc	sp
   5075 D5            [11]  596 	push	de
   5076 33            [ 6]  597 	inc	sp
   5077 C5            [11]  598 	push	bc
   5078 33            [ 6]  599 	inc	sp
   5079 7B            [ 4]  600 	ld	a,e
   507A F5            [11]  601 	push	af
   507B 33            [ 6]  602 	inc	sp
   507C 79            [ 4]  603 	ld	a,c
   507D F5            [11]  604 	push	af
   507E 33            [ 6]  605 	inc	sp
   507F CD 28 4C      [17]  606 	call	_cpct_etm_drawTileBox2x4
   5082 DD E1         [14]  607 	pop	ix
   5084 C9            [10]  608 	ret
                            609 ;src/entities/entities.c:175: void dibujarEntity(TEntity* ent, u8 w, u8 h){
                            610 ;	---------------------------------
                            611 ; Function dibujarEntity
                            612 ; ---------------------------------
   5085                     613 _dibujarEntity::
   5085 DD E5         [15]  614 	push	ix
   5087 DD 21 00 00   [14]  615 	ld	ix,#0
   508B DD 39         [15]  616 	add	ix,sp
                            617 ;src/entities/entities.c:176: u8* vmem = cpct_getScreenPtr(CPCT_VMEM_START,ent->x, ent->y);
   508D DD 4E 04      [19]  618 	ld	c,4 (ix)
   5090 DD 46 05      [19]  619 	ld	b,5 (ix)
   5093 69            [ 4]  620 	ld	l, c
   5094 60            [ 4]  621 	ld	h, b
   5095 23            [ 6]  622 	inc	hl
   5096 56            [ 7]  623 	ld	d,(hl)
   5097 0A            [ 7]  624 	ld	a,(bc)
   5098 C5            [11]  625 	push	bc
   5099 D5            [11]  626 	push	de
   509A 33            [ 6]  627 	inc	sp
   509B F5            [11]  628 	push	af
   509C 33            [ 6]  629 	inc	sp
   509D 21 00 C0      [10]  630 	ld	hl,#0xC000
   50A0 E5            [11]  631 	push	hl
   50A1 CD B1 4D      [17]  632 	call	_cpct_getScreenPtr
   50A4 EB            [ 4]  633 	ex	de,hl
                            634 ;src/entities/entities.c:177: cpct_drawSpriteMaskedAlignedTable(ent->sprite,vmem,w,h, g_tablatrans);
   50A5 E1            [10]  635 	pop	hl
   50A6 01 05 00      [10]  636 	ld	bc, #0x0005
   50A9 09            [11]  637 	add	hl, bc
   50AA 4E            [ 7]  638 	ld	c,(hl)
   50AB 23            [ 6]  639 	inc	hl
   50AC 46            [ 7]  640 	ld	b,(hl)
   50AD 21 00 01      [10]  641 	ld	hl,#_g_tablatrans
   50B0 E5            [11]  642 	push	hl
   50B1 DD 66 07      [19]  643 	ld	h,7 (ix)
   50B4 DD 6E 06      [19]  644 	ld	l,6 (ix)
   50B7 E5            [11]  645 	push	hl
   50B8 D5            [11]  646 	push	de
   50B9 C5            [11]  647 	push	bc
   50BA CD D1 4D      [17]  648 	call	_cpct_drawSpriteMaskedAlignedTable
   50BD DD E1         [14]  649 	pop	ix
   50BF C9            [10]  650 	ret
                            651 ;src/entities/entities.c:180: void drawAll(TEntity* player){
                            652 ;	---------------------------------
                            653 ; Function drawAll
                            654 ; ---------------------------------
   50C0                     655 _drawAll::
   50C0 DD E5         [15]  656 	push	ix
   50C2 DD 21 00 00   [14]  657 	ld	ix,#0
   50C6 DD 39         [15]  658 	add	ix,sp
                            659 ;src/entities/entities.c:183: redibujarEntity(player, G_NAVES_0_W, G_NAVES_0_H);
   50C8 21 08 10      [10]  660 	ld	hl,#0x1008
   50CB E5            [11]  661 	push	hl
   50CC DD 6E 04      [19]  662 	ld	l,4 (ix)
   50CF DD 66 05      [19]  663 	ld	h,5 (ix)
   50D2 E5            [11]  664 	push	hl
   50D3 CD E5 4F      [17]  665 	call	_redibujarEntity
   50D6 F1            [10]  666 	pop	af
   50D7 F1            [10]  667 	pop	af
                            668 ;src/entities/entities.c:186: for(i = 0; i < NUM_ENEMIGOS; i++){
   50D8 0E 00         [ 7]  669 	ld	c,#0x00
   50DA                     670 00102$:
                            671 ;src/entities/entities.c:187: redibujarEntity(&enemigos[i], G_NAVES_0_W, G_NAVES_0_H);
   50DA 69            [ 4]  672 	ld	l,c
   50DB 26 00         [ 7]  673 	ld	h,#0x00
   50DD 29            [11]  674 	add	hl, hl
   50DE 29            [11]  675 	add	hl, hl
   50DF 29            [11]  676 	add	hl, hl
   50E0 11 11 4E      [10]  677 	ld	de,#_enemigos
   50E3 19            [11]  678 	add	hl,de
   50E4 EB            [ 4]  679 	ex	de,hl
   50E5 C5            [11]  680 	push	bc
   50E6 21 08 10      [10]  681 	ld	hl,#0x1008
   50E9 E5            [11]  682 	push	hl
   50EA D5            [11]  683 	push	de
   50EB CD E5 4F      [17]  684 	call	_redibujarEntity
   50EE F1            [10]  685 	pop	af
   50EF F1            [10]  686 	pop	af
   50F0 C1            [10]  687 	pop	bc
                            688 ;src/entities/entities.c:186: for(i = 0; i < NUM_ENEMIGOS; i++){
   50F1 0C            [ 4]  689 	inc	c
   50F2 79            [ 4]  690 	ld	a,c
   50F3 D6 02         [ 7]  691 	sub	a, #0x02
   50F5 38 E3         [12]  692 	jr	C,00102$
   50F7 DD E1         [14]  693 	pop	ix
   50F9 C9            [10]  694 	ret
                            695 	.area _CODE
                            696 	.area _INITIALIZER
                            697 	.area _CABS (ABS)
