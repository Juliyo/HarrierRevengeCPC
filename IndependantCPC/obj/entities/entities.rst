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
                             59 ;src/entities/entities.c:14: cpctm_createTransparentMaskTable(g_tablatrans,0x0100,M0,0);
                             60 ;	---------------------------------
                             61 ; Function dummy_cpct_transparentMaskTable0M0_container
                             62 ; ---------------------------------
   4BF6                      63 _dummy_cpct_transparentMaskTable0M0_container::
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
                            100 ;src/entities/entities.c:33: void incializarEntities(){
                            101 ;	---------------------------------
                            102 ; Function incializarEntities
                            103 ; ---------------------------------
   4E0D                     104 _incializarEntities::
                            105 ;src/entities/entities.c:35: }
   4E0D C9            [10]  106 	ret
   4E0E                     107 _enemigos:
   4E0E 32                  108 	.db #0x32	; 50	'2'
   4E0F 9D                  109 	.db #0x9D	; 157
   4E10 14                  110 	.db #0x14	; 20
   4E11 9D                  111 	.db #0x9D	; 157
   4E12 01                  112 	.db #0x01	; 1
   4E13 F8 48               113 	.dw _g_naves_0
   4E15 00                  114 	.db #0x00	; 0
   4E16 14                  115 	.db #0x14	; 20
   4E17 32                  116 	.db #0x32	; 50	'2'
   4E18 14                  117 	.db #0x14	; 20
   4E19 32                  118 	.db #0x32	; 50	'2'
   4E1A 01                  119 	.db #0x01	; 1
   4E1B F8 48               120 	.dw _g_naves_0
   4E1D 00                  121 	.db #0x00	; 0
                            122 ;src/entities/entities.c:39: void accion(TEntity* ent, TPlayerStatus action, TPlayerDirection dir){
                            123 ;	---------------------------------
                            124 ; Function accion
                            125 ; ---------------------------------
   4E1E                     126 _accion::
   4E1E DD E5         [15]  127 	push	ix
   4E20 DD 21 00 00   [14]  128 	ld	ix,#0
   4E24 DD 39         [15]  129 	add	ix,sp
                            130 ;src/entities/entities.c:40: switch(action){
   4E26 DD 7E 06      [19]  131 	ld	a,6 (ix)
   4E29 3D            [ 4]  132 	dec	a
   4E2A C2 BE 4E      [10]  133 	jp	NZ,00108$
                            134 ;src/entities/entities.c:42: switch(dir){
   4E2D 3E 03         [ 7]  135 	ld	a,#0x03
   4E2F DD 96 07      [19]  136 	sub	a, 7 (ix)
   4E32 DA BE 4E      [10]  137 	jp	C,00108$
   4E35 DD 5E 07      [19]  138 	ld	e,7 (ix)
   4E38 16 00         [ 7]  139 	ld	d,#0x00
   4E3A 21 40 4E      [10]  140 	ld	hl,#00120$
   4E3D 19            [11]  141 	add	hl,de
   4E3E 19            [11]  142 	add	hl,de
                            143 ;src/entities/entities.c:43: case d_up:
   4E3F E9            [ 4]  144 	jp	(hl)
   4E40                     145 00120$:
   4E40 18 06         [12]  146 	jr	00102$
   4E42 18 22         [12]  147 	jr	00103$
   4E44 18 5C         [12]  148 	jr	00105$
   4E46 18 3C         [12]  149 	jr	00104$
   4E48                     150 00102$:
                            151 ;src/entities/entities.c:44: moverArriba(ent);
   4E48 DD 6E 04      [19]  152 	ld	l,4 (ix)
   4E4B DD 66 05      [19]  153 	ld	h,5 (ix)
   4E4E E5            [11]  154 	push	hl
   4E4F CD 2C 4F      [17]  155 	call	_moverArriba
   4E52 F1            [10]  156 	pop	af
                            157 ;src/entities/entities.c:45: flipSprite(ent,dir);
   4E53 DD 7E 07      [19]  158 	ld	a,7 (ix)
   4E56 F5            [11]  159 	push	af
   4E57 33            [ 6]  160 	inc	sp
   4E58 DD 6E 04      [19]  161 	ld	l,4 (ix)
   4E5B DD 66 05      [19]  162 	ld	h,5 (ix)
   4E5E E5            [11]  163 	push	hl
   4E5F CD C1 4E      [17]  164 	call	_flipSprite
   4E62 F1            [10]  165 	pop	af
   4E63 33            [ 6]  166 	inc	sp
                            167 ;src/entities/entities.c:46: break;
   4E64 18 58         [12]  168 	jr	00108$
                            169 ;src/entities/entities.c:47: case d_down:
   4E66                     170 00103$:
                            171 ;src/entities/entities.c:48: moverAbajo(ent);
   4E66 DD 6E 04      [19]  172 	ld	l,4 (ix)
   4E69 DD 66 05      [19]  173 	ld	h,5 (ix)
   4E6C E5            [11]  174 	push	hl
   4E6D CD 56 4F      [17]  175 	call	_moverAbajo
   4E70 F1            [10]  176 	pop	af
                            177 ;src/entities/entities.c:49: flipSprite(ent,dir);
   4E71 DD 7E 07      [19]  178 	ld	a,7 (ix)
   4E74 F5            [11]  179 	push	af
   4E75 33            [ 6]  180 	inc	sp
   4E76 DD 6E 04      [19]  181 	ld	l,4 (ix)
   4E79 DD 66 05      [19]  182 	ld	h,5 (ix)
   4E7C E5            [11]  183 	push	hl
   4E7D CD C1 4E      [17]  184 	call	_flipSprite
   4E80 F1            [10]  185 	pop	af
   4E81 33            [ 6]  186 	inc	sp
                            187 ;src/entities/entities.c:50: break;
   4E82 18 3A         [12]  188 	jr	00108$
                            189 ;src/entities/entities.c:51: case d_left:
   4E84                     190 00104$:
                            191 ;src/entities/entities.c:52: moverIzquierda(ent);
   4E84 DD 6E 04      [19]  192 	ld	l,4 (ix)
   4E87 DD 66 05      [19]  193 	ld	h,5 (ix)
   4E8A E5            [11]  194 	push	hl
   4E8B CD 9D 4F      [17]  195 	call	_moverIzquierda
   4E8E F1            [10]  196 	pop	af
                            197 ;src/entities/entities.c:53: flipSprite(ent,dir);
   4E8F DD 7E 07      [19]  198 	ld	a,7 (ix)
   4E92 F5            [11]  199 	push	af
   4E93 33            [ 6]  200 	inc	sp
   4E94 DD 6E 04      [19]  201 	ld	l,4 (ix)
   4E97 DD 66 05      [19]  202 	ld	h,5 (ix)
   4E9A E5            [11]  203 	push	hl
   4E9B CD C1 4E      [17]  204 	call	_flipSprite
   4E9E F1            [10]  205 	pop	af
   4E9F 33            [ 6]  206 	inc	sp
                            207 ;src/entities/entities.c:54: break;
   4EA0 18 1C         [12]  208 	jr	00108$
                            209 ;src/entities/entities.c:55: case d_right:
   4EA2                     210 00105$:
                            211 ;src/entities/entities.c:56: moverDerecha(ent);
   4EA2 DD 6E 04      [19]  212 	ld	l,4 (ix)
   4EA5 DD 66 05      [19]  213 	ld	h,5 (ix)
   4EA8 E5            [11]  214 	push	hl
   4EA9 CD AE 4F      [17]  215 	call	_moverDerecha
   4EAC F1            [10]  216 	pop	af
                            217 ;src/entities/entities.c:57: flipSprite(ent,dir);
   4EAD DD 7E 07      [19]  218 	ld	a,7 (ix)
   4EB0 F5            [11]  219 	push	af
   4EB1 33            [ 6]  220 	inc	sp
   4EB2 DD 6E 04      [19]  221 	ld	l,4 (ix)
   4EB5 DD 66 05      [19]  222 	ld	h,5 (ix)
   4EB8 E5            [11]  223 	push	hl
   4EB9 CD C1 4E      [17]  224 	call	_flipSprite
   4EBC F1            [10]  225 	pop	af
   4EBD 33            [ 6]  226 	inc	sp
                            227 ;src/entities/entities.c:62: }
   4EBE                     228 00108$:
   4EBE DD E1         [14]  229 	pop	ix
   4EC0 C9            [10]  230 	ret
                            231 ;src/entities/entities.c:66: void flipSprite(TEntity* ent, TPlayerDirection dir){
                            232 ;	---------------------------------
                            233 ; Function flipSprite
                            234 ; ---------------------------------
   4EC1                     235 _flipSprite::
   4EC1 DD E5         [15]  236 	push	ix
   4EC3 DD 21 00 00   [14]  237 	ld	ix,#0
   4EC7 DD 39         [15]  238 	add	ix,sp
   4EC9 3B            [ 6]  239 	dec	sp
                            240 ;src/entities/entities.c:67: if(ent->curr_dir != dir){
   4ECA DD 4E 04      [19]  241 	ld	c,4 (ix)
   4ECD DD 46 05      [19]  242 	ld	b,5 (ix)
   4ED0 21 07 00      [10]  243 	ld	hl,#0x0007
   4ED3 09            [11]  244 	add	hl,bc
   4ED4 EB            [ 4]  245 	ex	de,hl
   4ED5 1A            [ 7]  246 	ld	a,(de)
   4ED6 DD 77 FF      [19]  247 	ld	-1 (ix),a
   4ED9 DD 7E 06      [19]  248 	ld	a,6 (ix)
   4EDC DD 96 FF      [19]  249 	sub	a, -1 (ix)
   4EDF 28 47         [12]  250 	jr	Z,00108$
                            251 ;src/entities/entities.c:68: switch(dir){
   4EE1 3E 03         [ 7]  252 	ld	a,#0x03
   4EE3 DD 96 06      [19]  253 	sub	a, 6 (ix)
   4EE6 38 3C         [12]  254 	jr	C,00105$
                            255 ;src/entities/entities.c:70: ent->sprite = g_naves_0;
   4EE8 03            [ 6]  256 	inc	bc
   4EE9 03            [ 6]  257 	inc	bc
   4EEA 03            [ 6]  258 	inc	bc
   4EEB 03            [ 6]  259 	inc	bc
   4EEC 03            [ 6]  260 	inc	bc
                            261 ;src/entities/entities.c:68: switch(dir){
   4EED D5            [11]  262 	push	de
   4EEE DD 5E 06      [19]  263 	ld	e,6 (ix)
   4EF1 16 00         [ 7]  264 	ld	d,#0x00
   4EF3 21 FA 4E      [10]  265 	ld	hl,#00119$
   4EF6 19            [11]  266 	add	hl,de
   4EF7 19            [11]  267 	add	hl,de
                            268 ;src/entities/entities.c:69: case d_up:
   4EF8 D1            [10]  269 	pop	de
   4EF9 E9            [ 4]  270 	jp	(hl)
   4EFA                     271 00119$:
   4EFA 18 06         [12]  272 	jr	00101$
   4EFC 18 0D         [12]  273 	jr	00102$
   4EFE 18 1D         [12]  274 	jr	00104$
   4F00 18 12         [12]  275 	jr	00103$
   4F02                     276 00101$:
                            277 ;src/entities/entities.c:70: ent->sprite = g_naves_0;
   4F02 3E F8         [ 7]  278 	ld	a,#<(_g_naves_0)
   4F04 02            [ 7]  279 	ld	(bc),a
   4F05 03            [ 6]  280 	inc	bc
   4F06 3E 48         [ 7]  281 	ld	a,#>(_g_naves_0)
   4F08 02            [ 7]  282 	ld	(bc),a
                            283 ;src/entities/entities.c:72: break;
   4F09 18 19         [12]  284 	jr	00105$
                            285 ;src/entities/entities.c:73: case d_down:
   4F0B                     286 00102$:
                            287 ;src/entities/entities.c:74: ent->sprite = g_naves_2;
   4F0B 3E F8         [ 7]  288 	ld	a,#<(_g_naves_2)
   4F0D 02            [ 7]  289 	ld	(bc),a
   4F0E 03            [ 6]  290 	inc	bc
   4F0F 3E 49         [ 7]  291 	ld	a,#>(_g_naves_2)
   4F11 02            [ 7]  292 	ld	(bc),a
                            293 ;src/entities/entities.c:76: break;
   4F12 18 10         [12]  294 	jr	00105$
                            295 ;src/entities/entities.c:77: case d_left:
   4F14                     296 00103$:
                            297 ;src/entities/entities.c:78: ent->sprite = g_naves_3;
   4F14 3E 78         [ 7]  298 	ld	a,#<(_g_naves_3)
   4F16 02            [ 7]  299 	ld	(bc),a
   4F17 03            [ 6]  300 	inc	bc
   4F18 3E 4A         [ 7]  301 	ld	a,#>(_g_naves_3)
   4F1A 02            [ 7]  302 	ld	(bc),a
                            303 ;src/entities/entities.c:79: break;
   4F1B 18 07         [12]  304 	jr	00105$
                            305 ;src/entities/entities.c:80: case d_right:
   4F1D                     306 00104$:
                            307 ;src/entities/entities.c:81: ent->sprite = g_naves_1;
   4F1D 3E 78         [ 7]  308 	ld	a,#<(_g_naves_1)
   4F1F 02            [ 7]  309 	ld	(bc),a
   4F20 03            [ 6]  310 	inc	bc
   4F21 3E 49         [ 7]  311 	ld	a,#>(_g_naves_1)
   4F23 02            [ 7]  312 	ld	(bc),a
                            313 ;src/entities/entities.c:83: }
   4F24                     314 00105$:
                            315 ;src/entities/entities.c:84: ent->curr_dir = dir; 
   4F24 DD 7E 06      [19]  316 	ld	a,6 (ix)
   4F27 12            [ 7]  317 	ld	(de),a
   4F28                     318 00108$:
   4F28 33            [ 6]  319 	inc	sp
   4F29 DD E1         [14]  320 	pop	ix
   4F2B C9            [10]  321 	ret
                            322 ;src/entities/entities.c:104: void moverArriba(TEntity* ent){
                            323 ;	---------------------------------
                            324 ; Function moverArriba
                            325 ; ---------------------------------
   4F2C                     326 _moverArriba::
   4F2C DD E5         [15]  327 	push	ix
   4F2E DD 21 00 00   [14]  328 	ld	ix,#0
   4F32 DD 39         [15]  329 	add	ix,sp
                            330 ;src/entities/entities.c:105: if (ent->y > 0) {
   4F34 DD 4E 04      [19]  331 	ld	c,4 (ix)
   4F37 DD 46 05      [19]  332 	ld	b,5 (ix)
   4F3A 59            [ 4]  333 	ld	e, c
   4F3B 50            [ 4]  334 	ld	d, b
   4F3C 13            [ 6]  335 	inc	de
   4F3D 1A            [ 7]  336 	ld	a,(de)
   4F3E B7            [ 4]  337 	or	a, a
   4F3F 28 12         [12]  338 	jr	Z,00106$
                            339 ;src/entities/entities.c:106: if(ent->y%2 == 0)
   4F41 CB 47         [ 8]  340 	bit	0, a
   4F43 20 05         [12]  341 	jr	NZ,00102$
                            342 ;src/entities/entities.c:107: ent->y-=2;
   4F45 C6 FE         [ 7]  343 	add	a,#0xFE
   4F47 12            [ 7]  344 	ld	(de),a
   4F48 18 03         [12]  345 	jr	00103$
   4F4A                     346 00102$:
                            347 ;src/entities/entities.c:109: ent->y--;
   4F4A C6 FF         [ 7]  348 	add	a,#0xFF
   4F4C 12            [ 7]  349 	ld	(de),a
   4F4D                     350 00103$:
                            351 ;src/entities/entities.c:111: ent->draw  = SI;
   4F4D 21 04 00      [10]  352 	ld	hl,#0x0004
   4F50 09            [11]  353 	add	hl,bc
   4F51 36 01         [10]  354 	ld	(hl),#0x01
   4F53                     355 00106$:
   4F53 DD E1         [14]  356 	pop	ix
   4F55 C9            [10]  357 	ret
                            358 ;src/entities/entities.c:118: void moverAbajo(TEntity* ent){
                            359 ;	---------------------------------
                            360 ; Function moverAbajo
                            361 ; ---------------------------------
   4F56                     362 _moverAbajo::
   4F56 DD E5         [15]  363 	push	ix
   4F58 DD 21 00 00   [14]  364 	ld	ix,#0
   4F5C DD 39         [15]  365 	add	ix,sp
   4F5E 3B            [ 6]  366 	dec	sp
                            367 ;src/entities/entities.c:119: if (ent->y + G_NAVES_0_H < ALTO) {
   4F5F DD 4E 04      [19]  368 	ld	c,4 (ix)
   4F62 DD 46 05      [19]  369 	ld	b,5 (ix)
   4F65 59            [ 4]  370 	ld	e, c
   4F66 50            [ 4]  371 	ld	d, b
   4F67 13            [ 6]  372 	inc	de
   4F68 1A            [ 7]  373 	ld	a,(de)
   4F69 DD 77 FF      [19]  374 	ld	-1 (ix), a
   4F6C 6F            [ 4]  375 	ld	l, a
   4F6D 26 00         [ 7]  376 	ld	h,#0x00
   4F6F D5            [11]  377 	push	de
   4F70 11 10 00      [10]  378 	ld	de,#0x0010
   4F73 19            [11]  379 	add	hl, de
   4F74 D1            [10]  380 	pop	de
   4F75 7D            [ 4]  381 	ld	a,l
   4F76 D6 C8         [ 7]  382 	sub	a, #0xC8
   4F78 7C            [ 4]  383 	ld	a,h
   4F79 17            [ 4]  384 	rla
   4F7A 3F            [ 4]  385 	ccf
   4F7B 1F            [ 4]  386 	rra
   4F7C DE 80         [ 7]  387 	sbc	a, #0x80
   4F7E 30 19         [12]  388 	jr	NC,00106$
                            389 ;src/entities/entities.c:120: if(ent->y%2 == 0)
   4F80 DD CB FF 46   [20]  390 	bit	0, -1 (ix)
   4F84 20 08         [12]  391 	jr	NZ,00102$
                            392 ;src/entities/entities.c:121: ent->y+=2;
   4F86 DD 7E FF      [19]  393 	ld	a,-1 (ix)
   4F89 C6 02         [ 7]  394 	add	a, #0x02
   4F8B 12            [ 7]  395 	ld	(de),a
   4F8C 18 05         [12]  396 	jr	00103$
   4F8E                     397 00102$:
                            398 ;src/entities/entities.c:123: ent->y++;
   4F8E DD 7E FF      [19]  399 	ld	a,-1 (ix)
   4F91 3C            [ 4]  400 	inc	a
   4F92 12            [ 7]  401 	ld	(de),a
   4F93                     402 00103$:
                            403 ;src/entities/entities.c:125: ent->draw  = SI;
   4F93 21 04 00      [10]  404 	ld	hl,#0x0004
   4F96 09            [11]  405 	add	hl,bc
   4F97 36 01         [10]  406 	ld	(hl),#0x01
   4F99                     407 00106$:
   4F99 33            [ 6]  408 	inc	sp
   4F9A DD E1         [14]  409 	pop	ix
   4F9C C9            [10]  410 	ret
                            411 ;src/entities/entities.c:132: void moverIzquierda(TEntity* ent){
                            412 ;	---------------------------------
                            413 ; Function moverIzquierda
                            414 ; ---------------------------------
   4F9D                     415 _moverIzquierda::
                            416 ;src/entities/entities.c:133: if (ent->x > 0) {
   4F9D D1            [10]  417 	pop	de
   4F9E C1            [10]  418 	pop	bc
   4F9F C5            [11]  419 	push	bc
   4FA0 D5            [11]  420 	push	de
   4FA1 0A            [ 7]  421 	ld	a,(bc)
   4FA2 B7            [ 4]  422 	or	a, a
   4FA3 C8            [11]  423 	ret	Z
                            424 ;src/entities/entities.c:134: ent->x--;
   4FA4 C6 FF         [ 7]  425 	add	a,#0xFF
   4FA6 02            [ 7]  426 	ld	(bc),a
                            427 ;src/entities/entities.c:135: ent->draw  = SI;
   4FA7 21 04 00      [10]  428 	ld	hl,#0x0004
   4FAA 09            [11]  429 	add	hl,bc
   4FAB 36 01         [10]  430 	ld	(hl),#0x01
   4FAD C9            [10]  431 	ret
                            432 ;src/entities/entities.c:141: void moverDerecha(TEntity* ent){
                            433 ;	---------------------------------
                            434 ; Function moverDerecha
                            435 ; ---------------------------------
   4FAE                     436 _moverDerecha::
   4FAE DD E5         [15]  437 	push	ix
   4FB0 DD 21 00 00   [14]  438 	ld	ix,#0
   4FB4 DD 39         [15]  439 	add	ix,sp
                            440 ;src/entities/entities.c:142: if (ent->x + G_NAVES_0_W < ANCHO) {
   4FB6 DD 4E 04      [19]  441 	ld	c,4 (ix)
   4FB9 DD 46 05      [19]  442 	ld	b,5 (ix)
   4FBC 0A            [ 7]  443 	ld	a,(bc)
   4FBD 5F            [ 4]  444 	ld	e,a
   4FBE 6B            [ 4]  445 	ld	l,e
   4FBF 26 00         [ 7]  446 	ld	h,#0x00
   4FC1 D5            [11]  447 	push	de
   4FC2 11 08 00      [10]  448 	ld	de,#0x0008
   4FC5 19            [11]  449 	add	hl, de
   4FC6 D1            [10]  450 	pop	de
   4FC7 7D            [ 4]  451 	ld	a,l
   4FC8 D6 50         [ 7]  452 	sub	a, #0x50
   4FCA 7C            [ 4]  453 	ld	a,h
   4FCB 17            [ 4]  454 	rla
   4FCC 3F            [ 4]  455 	ccf
   4FCD 1F            [ 4]  456 	rra
   4FCE DE 80         [ 7]  457 	sbc	a, #0x80
   4FD0 30 09         [12]  458 	jr	NC,00103$
                            459 ;src/entities/entities.c:143: ent->x++;
   4FD2 1C            [ 4]  460 	inc	e
   4FD3 7B            [ 4]  461 	ld	a,e
   4FD4 02            [ 7]  462 	ld	(bc),a
                            463 ;src/entities/entities.c:144: ent->draw  = SI;
   4FD5 21 04 00      [10]  464 	ld	hl,#0x0004
   4FD8 09            [11]  465 	add	hl,bc
   4FD9 36 01         [10]  466 	ld	(hl),#0x01
   4FDB                     467 00103$:
   4FDB DD E1         [14]  468 	pop	ix
   4FDD C9            [10]  469 	ret
                            470 ;src/entities/entities.c:152: u8 updatePlayer(TEntity* player){
                            471 ;	---------------------------------
                            472 ; Function updatePlayer
                            473 ; ---------------------------------
   4FDE                     474 _updatePlayer::
                            475 ;src/entities/entities.c:154: return 1;
   4FDE 2E 01         [ 7]  476 	ld	l,#0x01
   4FE0 C9            [10]  477 	ret
                            478 ;src/entities/entities.c:157: void updateEntities(){
                            479 ;	---------------------------------
                            480 ; Function updateEntities
                            481 ; ---------------------------------
   4FE1                     482 _updateEntities::
   4FE1 C9            [10]  483 	ret
                            484 ;src/entities/entities.c:169: void redibujarEntity(TEntity* ent, u8 w, u8 h){
                            485 ;	---------------------------------
                            486 ; Function redibujarEntity
                            487 ; ---------------------------------
   4FE2                     488 _redibujarEntity::
   4FE2 DD E5         [15]  489 	push	ix
   4FE4 DD 21 00 00   [14]  490 	ld	ix,#0
   4FE8 DD 39         [15]  491 	add	ix,sp
                            492 ;src/entities/entities.c:170: if (ent->draw) {
   4FEA DD 4E 04      [19]  493 	ld	c,4 (ix)
   4FED DD 46 05      [19]  494 	ld	b,5 (ix)
   4FF0 21 04 00      [10]  495 	ld	hl,#0x0004
   4FF3 09            [11]  496 	add	hl,bc
   4FF4 EB            [ 4]  497 	ex	de,hl
   4FF5 1A            [ 7]  498 	ld	a,(de)
   4FF6 B7            [ 4]  499 	or	a, a
   4FF7 28 35         [12]  500 	jr	Z,00103$
                            501 ;src/entities/entities.c:171: borrarEntity(ent);
   4FF9 C5            [11]  502 	push	bc
   4FFA D5            [11]  503 	push	de
   4FFB C5            [11]  504 	push	bc
   4FFC CD 31 50      [17]  505 	call	_borrarEntity
   4FFF F1            [10]  506 	pop	af
   5000 D1            [10]  507 	pop	de
   5001 C1            [10]  508 	pop	bc
                            509 ;src/entities/entities.c:172: ent->px = ent->x;
   5002 C5            [11]  510 	push	bc
   5003 FD E1         [14]  511 	pop	iy
   5005 FD 23         [10]  512 	inc	iy
   5007 FD 23         [10]  513 	inc	iy
   5009 0A            [ 7]  514 	ld	a,(bc)
   500A FD 77 00      [19]  515 	ld	0 (iy), a
                            516 ;src/entities/entities.c:173: ent->py = ent->y;
   500D C5            [11]  517 	push	bc
   500E FD E1         [14]  518 	pop	iy
   5010 FD 23         [10]  519 	inc	iy
   5012 FD 23         [10]  520 	inc	iy
   5014 FD 23         [10]  521 	inc	iy
   5016 69            [ 4]  522 	ld	l, c
   5017 60            [ 4]  523 	ld	h, b
   5018 23            [ 6]  524 	inc	hl
   5019 6E            [ 7]  525 	ld	l,(hl)
   501A FD 75 00      [19]  526 	ld	0 (iy), l
                            527 ;src/entities/entities.c:174: dibujarEntity(ent, w, h);
   501D D5            [11]  528 	push	de
   501E DD 66 07      [19]  529 	ld	h,7 (ix)
   5021 DD 6E 06      [19]  530 	ld	l,6 (ix)
   5024 E5            [11]  531 	push	hl
   5025 C5            [11]  532 	push	bc
   5026 CD 82 50      [17]  533 	call	_dibujarEntity
   5029 F1            [10]  534 	pop	af
   502A F1            [10]  535 	pop	af
   502B D1            [10]  536 	pop	de
                            537 ;src/entities/entities.c:175: ent->draw = NO;
   502C AF            [ 4]  538 	xor	a, a
   502D 12            [ 7]  539 	ld	(de),a
   502E                     540 00103$:
   502E DD E1         [14]  541 	pop	ix
   5030 C9            [10]  542 	ret
                            543 ;src/entities/entities.c:179: void borrarEntity(TEntity* ent){
                            544 ;	---------------------------------
                            545 ; Function borrarEntity
                            546 ; ---------------------------------
   5031                     547 _borrarEntity::
   5031 DD E5         [15]  548 	push	ix
   5033 DD 21 00 00   [14]  549 	ld	ix,#0
   5037 DD 39         [15]  550 	add	ix,sp
                            551 ;src/entities/entities.c:180: u8 w = 4 + (ent->px & 1);
   5039 DD 5E 04      [19]  552 	ld	e,4 (ix)
   503C DD 56 05      [19]  553 	ld	d,5 (ix)
   503F 6B            [ 4]  554 	ld	l, e
   5040 62            [ 4]  555 	ld	h, d
   5041 23            [ 6]  556 	inc	hl
   5042 23            [ 6]  557 	inc	hl
   5043 4E            [ 7]  558 	ld	c,(hl)
   5044 79            [ 4]  559 	ld	a,c
   5045 E6 01         [ 7]  560 	and	a, #0x01
   5047 47            [ 4]  561 	ld	b,a
   5048 04            [ 4]  562 	inc	b
   5049 04            [ 4]  563 	inc	b
   504A 04            [ 4]  564 	inc	b
   504B 04            [ 4]  565 	inc	b
                            566 ;src/entities/entities.c:181: u8 h = 4 + (ent->py & 3 ? 1 : 0);
   504C EB            [ 4]  567 	ex	de,hl
   504D 23            [ 6]  568 	inc	hl
   504E 23            [ 6]  569 	inc	hl
   504F 23            [ 6]  570 	inc	hl
   5050 5E            [ 7]  571 	ld	e,(hl)
   5051 7B            [ 4]  572 	ld	a,e
   5052 E6 03         [ 7]  573 	and	a, #0x03
   5054 28 04         [12]  574 	jr	Z,00103$
   5056 16 01         [ 7]  575 	ld	d,#0x01
   5058 18 02         [12]  576 	jr	00104$
   505A                     577 00103$:
   505A 16 00         [ 7]  578 	ld	d,#0x00
   505C                     579 00104$:
   505C 14            [ 4]  580 	inc	d
   505D 14            [ 4]  581 	inc	d
   505E 14            [ 4]  582 	inc	d
   505F 14            [ 4]  583 	inc	d
                            584 ;src/entities/entities.c:182: cpct_etm_drawTileBox2x4(ent->px / 2, ent->py /4, w, h, g_map1_W, ORIGEN_MAPA, mapa);
   5060 2A 09 4E      [16]  585 	ld	hl,(_mapa)
   5063 CB 3B         [ 8]  586 	srl	e
   5065 CB 3B         [ 8]  587 	srl	e
   5067 CB 39         [ 8]  588 	srl	c
   5069 E5            [11]  589 	push	hl
   506A 21 00 C0      [10]  590 	ld	hl,#0xC000
   506D E5            [11]  591 	push	hl
   506E 3E 28         [ 7]  592 	ld	a,#0x28
   5070 F5            [11]  593 	push	af
   5071 33            [ 6]  594 	inc	sp
   5072 D5            [11]  595 	push	de
   5073 33            [ 6]  596 	inc	sp
   5074 C5            [11]  597 	push	bc
   5075 33            [ 6]  598 	inc	sp
   5076 7B            [ 4]  599 	ld	a,e
   5077 F5            [11]  600 	push	af
   5078 33            [ 6]  601 	inc	sp
   5079 79            [ 4]  602 	ld	a,c
   507A F5            [11]  603 	push	af
   507B 33            [ 6]  604 	inc	sp
   507C CD 25 4C      [17]  605 	call	_cpct_etm_drawTileBox2x4
   507F DD E1         [14]  606 	pop	ix
   5081 C9            [10]  607 	ret
                            608 ;src/entities/entities.c:185: void dibujarEntity(TEntity* ent, u8 w, u8 h){
                            609 ;	---------------------------------
                            610 ; Function dibujarEntity
                            611 ; ---------------------------------
   5082                     612 _dibujarEntity::
   5082 DD E5         [15]  613 	push	ix
   5084 DD 21 00 00   [14]  614 	ld	ix,#0
   5088 DD 39         [15]  615 	add	ix,sp
                            616 ;src/entities/entities.c:186: u8* vmem = cpct_getScreenPtr(CPCT_VMEM_START,ent->x, ent->y);
   508A DD 4E 04      [19]  617 	ld	c,4 (ix)
   508D DD 46 05      [19]  618 	ld	b,5 (ix)
   5090 69            [ 4]  619 	ld	l, c
   5091 60            [ 4]  620 	ld	h, b
   5092 23            [ 6]  621 	inc	hl
   5093 56            [ 7]  622 	ld	d,(hl)
   5094 0A            [ 7]  623 	ld	a,(bc)
   5095 C5            [11]  624 	push	bc
   5096 D5            [11]  625 	push	de
   5097 33            [ 6]  626 	inc	sp
   5098 F5            [11]  627 	push	af
   5099 33            [ 6]  628 	inc	sp
   509A 21 00 C0      [10]  629 	ld	hl,#0xC000
   509D E5            [11]  630 	push	hl
   509E CD AE 4D      [17]  631 	call	_cpct_getScreenPtr
   50A1 EB            [ 4]  632 	ex	de,hl
                            633 ;src/entities/entities.c:187: cpct_drawSpriteMaskedAlignedTable(ent->sprite,vmem,w,h, g_tablatrans);
   50A2 E1            [10]  634 	pop	hl
   50A3 01 05 00      [10]  635 	ld	bc, #0x0005
   50A6 09            [11]  636 	add	hl, bc
   50A7 4E            [ 7]  637 	ld	c,(hl)
   50A8 23            [ 6]  638 	inc	hl
   50A9 46            [ 7]  639 	ld	b,(hl)
   50AA 21 00 01      [10]  640 	ld	hl,#_g_tablatrans
   50AD E5            [11]  641 	push	hl
   50AE DD 66 07      [19]  642 	ld	h,7 (ix)
   50B1 DD 6E 06      [19]  643 	ld	l,6 (ix)
   50B4 E5            [11]  644 	push	hl
   50B5 D5            [11]  645 	push	de
   50B6 C5            [11]  646 	push	bc
   50B7 CD CE 4D      [17]  647 	call	_cpct_drawSpriteMaskedAlignedTable
   50BA DD E1         [14]  648 	pop	ix
   50BC C9            [10]  649 	ret
                            650 ;src/entities/entities.c:190: void drawAll(TEntity* player){
                            651 ;	---------------------------------
                            652 ; Function drawAll
                            653 ; ---------------------------------
   50BD                     654 _drawAll::
   50BD DD E5         [15]  655 	push	ix
   50BF DD 21 00 00   [14]  656 	ld	ix,#0
   50C3 DD 39         [15]  657 	add	ix,sp
                            658 ;src/entities/entities.c:193: redibujarEntity(player, G_NAVES_0_W, G_NAVES_0_H);
   50C5 21 08 10      [10]  659 	ld	hl,#0x1008
   50C8 E5            [11]  660 	push	hl
   50C9 DD 6E 04      [19]  661 	ld	l,4 (ix)
   50CC DD 66 05      [19]  662 	ld	h,5 (ix)
   50CF E5            [11]  663 	push	hl
   50D0 CD E2 4F      [17]  664 	call	_redibujarEntity
   50D3 F1            [10]  665 	pop	af
   50D4 F1            [10]  666 	pop	af
                            667 ;src/entities/entities.c:196: for(i = 0; i < NUM_ENEMIGOS; i++){
   50D5 0E 00         [ 7]  668 	ld	c,#0x00
   50D7                     669 00102$:
                            670 ;src/entities/entities.c:197: redibujarEntity(&enemigos[i], G_NAVES_0_W, G_NAVES_0_H);
   50D7 69            [ 4]  671 	ld	l,c
   50D8 26 00         [ 7]  672 	ld	h,#0x00
   50DA 29            [11]  673 	add	hl, hl
   50DB 29            [11]  674 	add	hl, hl
   50DC 29            [11]  675 	add	hl, hl
   50DD 11 0E 4E      [10]  676 	ld	de,#_enemigos
   50E0 19            [11]  677 	add	hl,de
   50E1 EB            [ 4]  678 	ex	de,hl
   50E2 C5            [11]  679 	push	bc
   50E3 21 08 10      [10]  680 	ld	hl,#0x1008
   50E6 E5            [11]  681 	push	hl
   50E7 D5            [11]  682 	push	de
   50E8 CD E2 4F      [17]  683 	call	_redibujarEntity
   50EB F1            [10]  684 	pop	af
   50EC F1            [10]  685 	pop	af
   50ED C1            [10]  686 	pop	bc
                            687 ;src/entities/entities.c:196: for(i = 0; i < NUM_ENEMIGOS; i++){
   50EE 0C            [ 4]  688 	inc	c
   50EF 79            [ 4]  689 	ld	a,c
   50F0 D6 02         [ 7]  690 	sub	a, #0x02
   50F2 38 E3         [12]  691 	jr	C,00102$
   50F4 DD E1         [14]  692 	pop	ix
   50F6 C9            [10]  693 	ret
                            694 	.area _CODE
                            695 	.area _INITIALIZER
                            696 	.area _CABS (ABS)
