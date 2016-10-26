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
                             11 	.globl _calculaDireccion
                             12 	.globl _updateEntities
                             13 	.globl _getExplosion
                             14 	.globl _updateExplosion
                             15 	.globl _inicializarWaveManager
                             16 	.globl _resetearTimepoEnMapa
                             17 	.globl _updateTiempoEnMapa
                             18 	.globl _dibujarMapa
                             19 	.globl _cpct_etm_drawTileBox2x4
                             20 	.globl _cpct_getScreenPtr
                             21 	.globl _cpct_drawSpriteMaskedAlignedTable
                             22 	.globl _bulletsTurno
                             23 	.globl _turno
                             24 	.globl _count1
                             25 	.globl _puntos
                             26 	.globl _bases
                             27 	.globl _enemigos
                             28 	.globl _incializarEntities
                             29 	.globl _accion
                             30 	.globl _flipSprite
                             31 	.globl _moverArriba
                             32 	.globl _moverAbajo
                             33 	.globl _moverIzquierda
                             34 	.globl _moverDerecha
                             35 	.globl _updatePlayer
                             36 	.globl _corregirPosicion
                             37 	.globl _updateX
                             38 	.globl _updateY
                             39 	.globl _disparar
                             40 	.globl _updateBullet
                             41 	.globl _playerHerido
                             42 	.globl _contarEnemigos
                             43 	.globl _updateIA
                             44 	.globl _comprobarEjeX
                             45 	.globl _comprobarEjeY
                             46 	.globl _moverHaciaPuntoDeControl
                             47 	.globl _abs
                             48 	.globl _updateIAState
                             49 	.globl _comprobarSiDisparo
                             50 	.globl _redibujarEntity
                             51 	.globl _borrarEntity
                             52 	.globl _dibujarEntity
                             53 	.globl _calculaEntity
                             54 	.globl _calculaAllEntities
                             55 	.globl _drawAll
                             56 	.globl _getEnemies
                             57 	.globl _getBases
                             58 ;--------------------------------------------------------
                             59 ; special function registers
                             60 ;--------------------------------------------------------
                             61 ;--------------------------------------------------------
                             62 ; ram data
                             63 ;--------------------------------------------------------
                             64 	.area _DATA
                             65 ;--------------------------------------------------------
                             66 ; ram data
                             67 ;--------------------------------------------------------
                             68 	.area _INITIALIZED
   860B                      69 _count1::
   860B                      70 	.ds 1
   860C                      71 _turno::
   860C                      72 	.ds 1
   860D                      73 _bulletsTurno::
   860D                      74 	.ds 1
                             75 ;--------------------------------------------------------
                             76 ; absolute external ram data
                             77 ;--------------------------------------------------------
                             78 	.area _DABS (ABS)
                             79 ;--------------------------------------------------------
                             80 ; global & static initialisations
                             81 ;--------------------------------------------------------
                             82 	.area _HOME
                             83 	.area _GSINIT
                             84 	.area _GSFINAL
                             85 	.area _GSINIT
                             86 ;--------------------------------------------------------
                             87 ; Home
                             88 ;--------------------------------------------------------
                             89 	.area _HOME
                             90 	.area _HOME
                             91 ;--------------------------------------------------------
                             92 ; code
                             93 ;--------------------------------------------------------
                             94 	.area _CODE
                             95 ;src/entities/entities.c:30: cpctm_createTransparentMaskTable(g_tablatrans,0x0100,M0,0);
                             96 ;	---------------------------------
                             97 ; Function dummy_cpct_transparentMaskTable0M0_container
                             98 ; ---------------------------------
   6523                      99 _dummy_cpct_transparentMaskTable0M0_container::
                            100 	.area _g_tablatrans_ (ABS) 
   0100                     101 	.org 0x0100 
   0100                     102 	 _g_tablatrans::
   0100 FF AA 55 00 AA AA   103 	.db 0xFF, 0xAA, 0x55, 0x00, 0xAA, 0xAA, 0x00, 0x00 
        00 00
   0108 55 00 55 00 00 00   104 	.db 0x55, 0x00, 0x55, 0x00, 0x00, 0x00, 0x00, 0x00 
        00 00
   0110 AA AA 00 00 AA AA   105 	.db 0xAA, 0xAA, 0x00, 0x00, 0xAA, 0xAA, 0x00, 0x00 
        00 00
   0118 00 00 00 00 00 00   106 	.db 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00 
        00 00
   0120 55 00 55 00 00 00   107 	.db 0x55, 0x00, 0x55, 0x00, 0x00, 0x00, 0x00, 0x00 
        00 00
   0128 55 00 55 00 00 00   108 	.db 0x55, 0x00, 0x55, 0x00, 0x00, 0x00, 0x00, 0x00 
        00 00
   0130 00 00 00 00 00 00   109 	.db 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00 
        00 00
   0138 00 00 00 00 00 00   110 	.db 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00 
        00 00
   0140 AA AA 00 00 AA AA   111 	.db 0xAA, 0xAA, 0x00, 0x00, 0xAA, 0xAA, 0x00, 0x00 
        00 00
   0148 00 00 00 00 00 00   112 	.db 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00 
        00 00
   0150 AA AA 00 00 AA AA   113 	.db 0xAA, 0xAA, 0x00, 0x00, 0xAA, 0xAA, 0x00, 0x00 
        00 00
   0158 00 00 00 00 00 00   114 	.db 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00 
        00 00
   0160 00 00 00 00 00 00   115 	.db 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00 
        00 00
   0168 00 00 00 00 00 00   116 	.db 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00 
        00 00
   0170 00 00 00 00 00 00   117 	.db 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00 
        00 00
   0178 00 00 00 00 00 00   118 	.db 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00 
        00 00
   0180 55 00 55 00 00 00   119 	.db 0x55, 0x00, 0x55, 0x00, 0x00, 0x00, 0x00, 0x00 
        00 00
   0188 55 00 55 00 00 00   120 	.db 0x55, 0x00, 0x55, 0x00, 0x00, 0x00, 0x00, 0x00 
        00 00
   0190 00 00 00 00 00 00   121 	.db 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00 
        00 00
   0198 00 00 00 00 00 00   122 	.db 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00 
        00 00
   01A0 55 00 55 00 00 00   123 	.db 0x55, 0x00, 0x55, 0x00, 0x00, 0x00, 0x00, 0x00 
        00 00
   01A8 55 00 55 00 00 00   124 	.db 0x55, 0x00, 0x55, 0x00, 0x00, 0x00, 0x00, 0x00 
        00 00
   01B0 00 00 00 00 00 00   125 	.db 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00 
        00 00
   01B8 00 00 00 00 00 00   126 	.db 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00 
        00 00
   01C0 00 00 00 00 00 00   127 	.db 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00 
        00 00
   01C8 00 00 00 00 00 00   128 	.db 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00 
        00 00
   01D0 00 00 00 00 00 00   129 	.db 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00 
        00 00
   01D8 00 00 00 00 00 00   130 	.db 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00 
        00 00
   01E0 00 00 00 00 00 00   131 	.db 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00 
        00 00
   01E8 00 00 00 00 00 00   132 	.db 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00 
        00 00
   01F0 00 00 00 00 00 00   133 	.db 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00 
        00 00
   01F8 00 00 00 00 00 00   134 	.db 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00 
        00 00
                            135 	.area _CSEG (REL, CON) 
                            136 ;src/entities/entities.c:433: void incializarEntities(TPlayer* p){
                            137 ;	---------------------------------
                            138 ; Function incializarEntities
                            139 ; ---------------------------------
   8627                     140 _incializarEntities::
   8627 DD E5         [15]  141 	push	ix
   8629 DD 21 00 00   [14]  142 	ld	ix,#0
   862D DD 39         [15]  143 	add	ix,sp
   862F F5            [11]  144 	push	af
   8630 F5            [11]  145 	push	af
   8631 3B            [ 6]  146 	dec	sp
                            147 ;src/entities/entities.c:434: TBase* bases = getBases();
   8632 CD D5 98      [17]  148 	call	_getBases
   8635 DD 75 FE      [19]  149 	ld	-2 (ix),l
   8638 DD 74 FF      [19]  150 	ld	-1 (ix),h
                            151 ;src/entities/entities.c:435: TEnemy* enes = getEnemies();
   863B CD D1 98      [17]  152 	call	_getEnemies
   863E DD 75 FC      [19]  153 	ld	-4 (ix),l
   8641 DD 74 FD      [19]  154 	ld	-3 (ix),h
                            155 ;src/entities/entities.c:438: p->vida = 3;
   8644 DD 4E 04      [19]  156 	ld	c,4 (ix)
   8647 DD 46 05      [19]  157 	ld	b,5 (ix)
   864A 21 49 00      [10]  158 	ld	hl,#0x0049
   864D 09            [11]  159 	add	hl,bc
   864E 36 03         [10]  160 	ld	(hl),#0x03
                            161 ;src/entities/entities.c:439: p->pvida = 3;
   8650 21 4A 00      [10]  162 	ld	hl,#0x004A
   8653 09            [11]  163 	add	hl,bc
   8654 36 03         [10]  164 	ld	(hl),#0x03
                            165 ;src/entities/entities.c:440: p->ent.x = px_spawn;
   8656 21 26 00      [10]  166 	ld	hl,#0x0026
   8659 09            [11]  167 	add	hl,bc
   865A 36 0A         [10]  168 	ld	(hl),#0x0A
   865C 23            [ 6]  169 	inc	hl
   865D 36 00         [10]  170 	ld	(hl),#0x00
                            171 ;src/entities/entities.c:441: p->ent.y = py_spawn;
   865F 21 28 00      [10]  172 	ld	hl,#0x0028
   8662 09            [11]  173 	add	hl,bc
   8663 36 AA         [10]  174 	ld	(hl),#0xAA
   8665 23            [ 6]  175 	inc	hl
   8666 36 00         [10]  176 	ld	(hl),#0x00
                            177 ;src/entities/entities.c:442: p->ent.draw = SI;
   8668 21 30 00      [10]  178 	ld	hl,#0x0030
   866B 09            [11]  179 	add	hl,bc
   866C 36 01         [10]  180 	ld	(hl),#0x01
                            181 ;src/entities/entities.c:443: p->puntuacion = 0;
   866E 21 4B 00      [10]  182 	ld	hl,#0x004B
   8671 09            [11]  183 	add	hl,bc
   8672 AF            [ 4]  184 	xor	a, a
   8673 77            [ 7]  185 	ld	(hl), a
   8674 23            [ 6]  186 	inc	hl
   8675 77            [ 7]  187 	ld	(hl), a
                            188 ;src/entities/entities.c:444: p->puntuacionPrev = 0;
   8676 21 4D 00      [10]  189 	ld	hl,#0x004D
   8679 09            [11]  190 	add	hl,bc
   867A AF            [ 4]  191 	xor	a, a
   867B 77            [ 7]  192 	ld	(hl), a
   867C 23            [ 6]  193 	inc	hl
   867D 77            [ 7]  194 	ld	(hl), a
                            195 ;src/entities/entities.c:446: for(i = 0; i < NUM_BASES; ++i){
   867E 0E 00         [ 7]  196 	ld	c,#0x00
   8680 11 00 00      [10]  197 	ld	de,#0x0000
   8683                     198 00105$:
                            199 ;src/entities/entities.c:447: bases[i].whom = 1;
   8683 DD 6E FE      [19]  200 	ld	l,-2 (ix)
   8686 DD 66 FF      [19]  201 	ld	h,-1 (ix)
   8689 19            [11]  202 	add	hl,de
   868A 36 01         [10]  203 	ld	(hl),#0x01
                            204 ;src/entities/entities.c:448: bases[i].ent.sprites[0] = NULL;
   868C FD 21 0F 00   [14]  205 	ld	iy,#0x000F
   8690 C5            [11]  206 	push	bc
   8691 4D            [ 4]  207 	ld	c, l
   8692 44            [ 4]  208 	ld	b, h
   8693 FD 09         [15]  209 	add	iy, bc
   8695 C1            [10]  210 	pop	bc
   8696 FD 36 00 00   [19]  211 	ld	0 (iy),#0x00
   869A FD 36 01 00   [19]  212 	ld	1 (iy),#0x00
                            213 ;src/entities/entities.c:449: bases[i].cycles = 0;
   869E 23            [ 6]  214 	inc	hl
   869F 23            [ 6]  215 	inc	hl
   86A0 23            [ 6]  216 	inc	hl
   86A1 44            [ 4]  217 	ld	b,h
   86A2 60            [ 4]  218 	ld	h, b
   86A3 36 00         [10]  219 	ld	(hl),#0x00
                            220 ;src/entities/entities.c:446: for(i = 0; i < NUM_BASES; ++i){
   86A5 21 27 00      [10]  221 	ld	hl,#0x0027
   86A8 19            [11]  222 	add	hl,de
   86A9 EB            [ 4]  223 	ex	de,hl
   86AA 0C            [ 4]  224 	inc	c
   86AB 79            [ 4]  225 	ld	a,c
   86AC D6 06         [ 7]  226 	sub	a, #0x06
   86AE 38 D3         [12]  227 	jr	C,00105$
                            228 ;src/entities/entities.c:451: for(i = 0; i< NUM_ENEMIGOS; ++i){
   86B0 DD 36 FB 00   [19]  229 	ld	-5 (ix),#0x00
   86B4 01 00 00      [10]  230 	ld	bc,#0x0000
   86B7                     231 00107$:
                            232 ;src/entities/entities.c:452: if(enes[i].ent.cuadrante == 0){
   86B7 DD 7E FC      [19]  233 	ld	a,-4 (ix)
   86BA 81            [ 4]  234 	add	a, c
   86BB 5F            [ 4]  235 	ld	e,a
   86BC DD 7E FD      [19]  236 	ld	a,-3 (ix)
   86BF 88            [ 4]  237 	adc	a, b
   86C0 57            [ 4]  238 	ld	d,a
   86C1 D5            [11]  239 	push	de
   86C2 FD E1         [14]  240 	pop	iy
   86C4 FD 7E 42      [19]  241 	ld	a,66 (iy)
   86C7 B7            [ 4]  242 	or	a, a
   86C8 20 12         [12]  243 	jr	NZ,00108$
                            244 ;src/entities/entities.c:453: enes[i].ent.vivo = 0;
   86CA 21 41 00      [10]  245 	ld	hl,#0x0041
   86CD 19            [11]  246 	add	hl,de
   86CE 36 00         [10]  247 	ld	(hl),#0x00
                            248 ;src/entities/entities.c:454: enes[i].bullet.ent.vivo = 0;
   86D0 21 1E 00      [10]  249 	ld	hl,#0x001E
   86D3 19            [11]  250 	add	hl,de
   86D4 36 00         [10]  251 	ld	(hl),#0x00
                            252 ;src/entities/entities.c:455: enes[i].ent.draw = NO;
   86D6 21 30 00      [10]  253 	ld	hl,#0x0030
   86D9 19            [11]  254 	add	hl,de
   86DA 36 00         [10]  255 	ld	(hl),#0x00
   86DC                     256 00108$:
                            257 ;src/entities/entities.c:451: for(i = 0; i< NUM_ENEMIGOS; ++i){
   86DC 21 4E 00      [10]  258 	ld	hl,#0x004E
   86DF 09            [11]  259 	add	hl,bc
   86E0 4D            [ 4]  260 	ld	c,l
   86E1 44            [ 4]  261 	ld	b,h
   86E2 DD 34 FB      [23]  262 	inc	-5 (ix)
   86E5 DD 7E FB      [19]  263 	ld	a,-5 (ix)
   86E8 D6 03         [ 7]  264 	sub	a, #0x03
   86EA 38 CB         [12]  265 	jr	C,00107$
                            266 ;src/entities/entities.c:458: wshot_cycles = 30;
   86EC 21 08 86      [10]  267 	ld	hl,#_wshot_cycles + 0
   86EF 36 1E         [10]  268 	ld	(hl), #0x1E
                            269 ;src/entities/entities.c:459: basesCapturadas = 0;
   86F1 21 06 86      [10]  270 	ld	hl,#_basesCapturadas + 0
   86F4 36 00         [10]  271 	ld	(hl), #0x00
                            272 ;src/entities/entities.c:460: prev_basesCapturadas = 0;
   86F6 21 07 86      [10]  273 	ld	hl,#_prev_basesCapturadas + 0
   86F9 36 00         [10]  274 	ld	(hl), #0x00
                            275 ;src/entities/entities.c:462: inicializarWaveManager();
   86FB CD D0 65      [17]  276 	call	_inicializarWaveManager
   86FE DD F9         [10]  277 	ld	sp, ix
   8700 DD E1         [14]  278 	pop	ix
   8702 C9            [10]  279 	ret
   8703                     280 _enemigos:
   8703 00                  281 	.db #0x00	; 0
   8704 01                  282 	.db #0x01	; 1
   8705 00                  283 	.db #0x00	; 0
   8706 00 00               284 	.dw #0x0000
   8708 00 00               285 	.dw #0x0000
   870A 00 00               286 	.dw #0x0000
   870C 00 00               287 	.dw #0x0000
   870E 02                  288 	.db #0x02	; 2
   870F 04                  289 	.db #0x04	; 4
   8710 00                  290 	.db #0x00	; 0
   8711 40 55               291 	.dw _g_bala_enemiga
   8713 40 55               292 	.dw _g_bala_enemiga
   8715 40 55               293 	.dw _g_bala_enemiga
   8717 40 55               294 	.dw _g_bala_enemiga
   8719 02                  295 	.db #0x02	; 2
   871A 04                  296 	.db #0x04	; 4
   871B 00                  297 	.db #0x00	; 0
   871C 02                  298 	.db #0x02	; 2
   871D 00                  299 	.db #0x00	; 0
   871E 00                  300 	.db #0x00	; 0
   871F 02                  301 	.db #0x02	; 2
   8720 04                  302 	.db #0x04	; 4
   8721 00                  303 	.db #0x00	; 0
   8722 02                  304 	.db #0x02	; 2
   8723 00                  305 	.db #0x00	; 0
   8724 00                  306 	.db #0x00	; 0
   8725 00                  307 	.db #0x00	; 0
   8726 00                  308 	.db #0x00	; 0
   8727 00 00               309 	.dw #0x0000
   8729 32 00               310 	.dw #0x0032
   872B 9D 00               311 	.dw #0x009D
   872D 32 00               312 	.dw #0x0032
   872F 9D 00               313 	.dw #0x009D
   8731 01                  314 	.db #0x01	; 1
   8732 02                  315 	.db #0x02	; 2
   8733 01                  316 	.db #0x01	; 1
   8734 68 56               317 	.dw _g_naveEnemiga1_0
   8736 88 56               318 	.dw _g_naveEnemiga1_1
   8738 A8 56               319 	.dw _g_naveEnemiga1_2
   873A C8 56               320 	.dw _g_naveEnemiga1_3
   873C 04                  321 	.db #0x04	; 4
   873D 08                  322 	.db #0x08	; 8
   873E 00                  323 	.db #0x00	; 0
   873F 00                  324 	.db #0x00	; 0
   8740 32                  325 	.db #0x32	; 50	'2'
   8741 9D                  326 	.db #0x9D	; 157
   8742 04                  327 	.db #0x04	; 4
   8743 08                  328 	.db #0x08	; 8
   8744 01                  329 	.db #0x01	; 1
   8745 02                  330 	.db #0x02	; 2
   8746 00                  331 	.db #0x00	; 0
   8747 00                  332 	.db #0x00	; 0
   8748 00                  333 	.db #0x00	; 0
   8749 00                  334 	.db #0x00	; 0
   874A 00 00               335 	.dw #0x0000
   874C 00                  336 	.db #0x00	; 0
   874D 00                  337 	.db #0x00	; 0
   874E 01                  338 	.db #0x01	; 1
   874F 00                  339 	.db #0x00	; 0
   8750 00                  340 	.db #0x00	; 0
   8751 00                  341 	.db #0x00	; 0
   8752 01                  342 	.db #0x01	; 1
   8753 00                  343 	.db #0x00	; 0
   8754 00 00               344 	.dw #0x0000
   8756 00 00               345 	.dw #0x0000
   8758 00 00               346 	.dw #0x0000
   875A 00 00               347 	.dw #0x0000
   875C 02                  348 	.db #0x02	; 2
   875D 04                  349 	.db #0x04	; 4
   875E 00                  350 	.db #0x00	; 0
   875F 40 55               351 	.dw _g_bala_enemiga
   8761 40 55               352 	.dw _g_bala_enemiga
   8763 40 55               353 	.dw _g_bala_enemiga
   8765 40 55               354 	.dw _g_bala_enemiga
   8767 02                  355 	.db #0x02	; 2
   8768 04                  356 	.db #0x04	; 4
   8769 00                  357 	.db #0x00	; 0
   876A 02                  358 	.db #0x02	; 2
   876B 00                  359 	.db #0x00	; 0
   876C 00                  360 	.db #0x00	; 0
   876D 02                  361 	.db #0x02	; 2
   876E 04                  362 	.db #0x04	; 4
   876F 00                  363 	.db #0x00	; 0
   8770 04                  364 	.db #0x04	; 4
   8771 00                  365 	.db #0x00	; 0
   8772 00                  366 	.db #0x00	; 0
   8773 00                  367 	.db #0x00	; 0
   8774 00                  368 	.db #0x00	; 0
   8775 00 00               369 	.dw #0x0000
   8777 14 00               370 	.dw #0x0014
   8779 32 00               371 	.dw #0x0032
   877B 14 00               372 	.dw #0x0014
   877D 32 00               373 	.dw #0x0032
   877F 01                  374 	.db #0x01	; 1
   8780 02                  375 	.db #0x02	; 2
   8781 01                  376 	.db #0x01	; 1
   8782 E8 55               377 	.dw _g_naveEnemiga2_0
   8784 08 56               378 	.dw _g_naveEnemiga2_1
   8786 28 56               379 	.dw _g_naveEnemiga2_2
   8788 48 56               380 	.dw _g_naveEnemiga2_3
   878A 04                  381 	.db #0x04	; 4
   878B 08                  382 	.db #0x08	; 8
   878C 00                  383 	.db #0x00	; 0
   878D 00                  384 	.db #0x00	; 0
   878E 14                  385 	.db #0x14	; 20
   878F 32                  386 	.db #0x32	; 50	'2'
   8790 04                  387 	.db #0x04	; 4
   8791 08                  388 	.db #0x08	; 8
   8792 01                  389 	.db #0x01	; 1
   8793 04                  390 	.db #0x04	; 4
   8794 00                  391 	.db #0x00	; 0
   8795 00                  392 	.db #0x00	; 0
   8796 00                  393 	.db #0x00	; 0
   8797 00                  394 	.db #0x00	; 0
   8798 00 00               395 	.dw #0x0000
   879A 00                  396 	.db #0x00	; 0
   879B 00                  397 	.db #0x00	; 0
   879C 01                  398 	.db #0x01	; 1
   879D 00                  399 	.db #0x00	; 0
   879E 00                  400 	.db #0x00	; 0
   879F 00                  401 	.db #0x00	; 0
   87A0 01                  402 	.db #0x01	; 1
   87A1 00                  403 	.db #0x00	; 0
   87A2 00 00               404 	.dw #0x0000
   87A4 00 00               405 	.dw #0x0000
   87A6 00 00               406 	.dw #0x0000
   87A8 00 00               407 	.dw #0x0000
   87AA 02                  408 	.db #0x02	; 2
   87AB 04                  409 	.db #0x04	; 4
   87AC 00                  410 	.db #0x00	; 0
   87AD 40 55               411 	.dw _g_bala_enemiga
   87AF 40 55               412 	.dw _g_bala_enemiga
   87B1 40 55               413 	.dw _g_bala_enemiga
   87B3 40 55               414 	.dw _g_bala_enemiga
   87B5 02                  415 	.db #0x02	; 2
   87B6 04                  416 	.db #0x04	; 4
   87B7 00                  417 	.db #0x00	; 0
   87B8 02                  418 	.db #0x02	; 2
   87B9 00                  419 	.db #0x00	; 0
   87BA 00                  420 	.db #0x00	; 0
   87BB 02                  421 	.db #0x02	; 2
   87BC 04                  422 	.db #0x04	; 4
   87BD 00                  423 	.db #0x00	; 0
   87BE 00                  424 	.db #0x00	; 0
   87BF 00                  425 	.db #0x00	; 0
   87C0 00                  426 	.db #0x00	; 0
   87C1 00                  427 	.db #0x00	; 0
   87C2 00                  428 	.db #0x00	; 0
   87C3 00 00               429 	.dw #0x0000
   87C5 23 00               430 	.dw #0x0023
   87C7 78 00               431 	.dw #0x0078
   87C9 23 00               432 	.dw #0x0023
   87CB 78 00               433 	.dw #0x0078
   87CD 01                  434 	.db #0x01	; 1
   87CE 02                  435 	.db #0x02	; 2
   87CF 01                  436 	.db #0x01	; 1
   87D0 68 55               437 	.dw _g_naveEnemiga3_0
   87D2 88 55               438 	.dw _g_naveEnemiga3_1
   87D4 A8 55               439 	.dw _g_naveEnemiga3_2
   87D6 C8 55               440 	.dw _g_naveEnemiga3_3
   87D8 04                  441 	.db #0x04	; 4
   87D9 08                  442 	.db #0x08	; 8
   87DA 00                  443 	.db #0x00	; 0
   87DB 00                  444 	.db #0x00	; 0
   87DC 23                  445 	.db #0x23	; 35
   87DD 78                  446 	.db #0x78	; 120	'x'
   87DE 04                  447 	.db #0x04	; 4
   87DF 08                  448 	.db #0x08	; 8
   87E0 01                  449 	.db #0x01	; 1
   87E1 00                  450 	.db #0x00	; 0
   87E2 00                  451 	.db #0x00	; 0
   87E3 00                  452 	.db #0x00	; 0
   87E4 00                  453 	.db #0x00	; 0
   87E5 00                  454 	.db #0x00	; 0
   87E6 00 00               455 	.dw #0x0000
   87E8 00                  456 	.db #0x00	; 0
   87E9 00                  457 	.db #0x00	; 0
   87EA 01                  458 	.db #0x01	; 1
   87EB 00                  459 	.db #0x00	; 0
   87EC 00                  460 	.db #0x00	; 0
   87ED                     461 _bases:
   87ED 01                  462 	.db #0x01	; 1
   87EE 64                  463 	.db #0x64	; 100	'd'
   87EF C8                  464 	.db #0xC8	; 200
   87F0 00                  465 	.db #0x00	; 0
   87F1 30 00               466 	.dw #0x0030
   87F3 9C 00               467 	.dw #0x009C
   87F5 30 00               468 	.dw #0x0030
   87F7 9C 00               469 	.dw #0x009C
   87F9 00                  470 	.db #0x00	; 0
   87FA 00                  471 	.db #0x00	; 0
   87FB 01                  472 	.db #0x01	; 1
   87FC 00 00               473 	.dw #0x0000
   87FE 00 00               474 	.dw #0x0000
   8800 00 00               475 	.dw #0x0000
   8802 00 00               476 	.dw #0x0000
   8804 08                  477 	.db #0x08	; 8
   8805 14                  478 	.db #0x14	; 20
   8806 00                  479 	.db #0x00	; 0
   8807 03                  480 	.db #0x03	; 3
   8808 30                  481 	.db #0x30	; 48	'0'
   8809 9C                  482 	.db #0x9C	; 156
   880A 08                  483 	.db #0x08	; 8
   880B 14                  484 	.db #0x14	; 20
   880C 01                  485 	.db #0x01	; 1
   880D 00                  486 	.db #0x00	; 0
   880E 00                  487 	.db #0x00	; 0
   880F 00                  488 	.db #0x00	; 0
   8810 00                  489 	.db #0x00	; 0
   8811 00                  490 	.db #0x00	; 0
   8812 00 00               491 	.dw #0x0000
   8814 01                  492 	.db #0x01	; 1
   8815 64                  493 	.db #0x64	; 100	'd'
   8816 E8                  494 	.db #0xE8	; 232
   8817 00                  495 	.db #0x00	; 0
   8818 2E 00               496 	.dw #0x002E
   881A 64 00               497 	.dw #0x0064
   881C 2E 00               498 	.dw #0x002E
   881E 64 00               499 	.dw #0x0064
   8820 00                  500 	.db #0x00	; 0
   8821 00                  501 	.db #0x00	; 0
   8822 01                  502 	.db #0x01	; 1
   8823 00 00               503 	.dw #0x0000
   8825 00 00               504 	.dw #0x0000
   8827 00 00               505 	.dw #0x0000
   8829 00 00               506 	.dw #0x0000
   882B 08                  507 	.db #0x08	; 8
   882C 14                  508 	.db #0x14	; 20
   882D 00                  509 	.db #0x00	; 0
   882E 03                  510 	.db #0x03	; 3
   882F 2E                  511 	.db #0x2E	; 46
   8830 64                  512 	.db #0x64	; 100	'd'
   8831 08                  513 	.db #0x08	; 8
   8832 14                  514 	.db #0x14	; 20
   8833 01                  515 	.db #0x01	; 1
   8834 01                  516 	.db #0x01	; 1
   8835 00                  517 	.db #0x00	; 0
   8836 00                  518 	.db #0x00	; 0
   8837 00                  519 	.db #0x00	; 0
   8838 00                  520 	.db #0x00	; 0
   8839 00 00               521 	.dw #0x0000
   883B 01                  522 	.db #0x01	; 1
   883C 64                  523 	.db #0x64	; 100	'd'
   883D E8                  524 	.db #0xE8	; 232
   883E 00                  525 	.db #0x00	; 0
   883F 04 00               526 	.dw #0x0004
   8841 70 00               527 	.dw #0x0070
   8843 04 00               528 	.dw #0x0004
   8845 70 00               529 	.dw #0x0070
   8847 00                  530 	.db #0x00	; 0
   8848 00                  531 	.db #0x00	; 0
   8849 01                  532 	.db #0x01	; 1
   884A 00 00               533 	.dw #0x0000
   884C 00 00               534 	.dw #0x0000
   884E 00 00               535 	.dw #0x0000
   8850 00 00               536 	.dw #0x0000
   8852 08                  537 	.db #0x08	; 8
   8853 14                  538 	.db #0x14	; 20
   8854 00                  539 	.db #0x00	; 0
   8855 03                  540 	.db #0x03	; 3
   8856 04                  541 	.db #0x04	; 4
   8857 70                  542 	.db #0x70	; 112	'p'
   8858 08                  543 	.db #0x08	; 8
   8859 14                  544 	.db #0x14	; 20
   885A 01                  545 	.db #0x01	; 1
   885B 02                  546 	.db #0x02	; 2
   885C 00                  547 	.db #0x00	; 0
   885D 00                  548 	.db #0x00	; 0
   885E 00                  549 	.db #0x00	; 0
   885F 00                  550 	.db #0x00	; 0
   8860 00 00               551 	.dw #0x0000
   8862 01                  552 	.db #0x01	; 1
   8863 64                  553 	.db #0x64	; 100	'd'
   8864 E8                  554 	.db #0xE8	; 232
   8865 00                  555 	.db #0x00	; 0
   8866 44 00               556 	.dw #0x0044
   8868 88 00               557 	.dw #0x0088
   886A 88 00               558 	.dw #0x0088
   886C 88 00               559 	.dw #0x0088
   886E 00                  560 	.db #0x00	; 0
   886F 00                  561 	.db #0x00	; 0
   8870 01                  562 	.db #0x01	; 1
   8871 00 00               563 	.dw #0x0000
   8873 00 00               564 	.dw #0x0000
   8875 00 00               565 	.dw #0x0000
   8877 00 00               566 	.dw #0x0000
   8879 08                  567 	.db #0x08	; 8
   887A 14                  568 	.db #0x14	; 20
   887B 00                  569 	.db #0x00	; 0
   887C 03                  570 	.db #0x03	; 3
   887D 44                  571 	.db #0x44	; 68	'D'
   887E 88                  572 	.db #0x88	; 136
   887F 08                  573 	.db #0x08	; 8
   8880 14                  574 	.db #0x14	; 20
   8881 01                  575 	.db #0x01	; 1
   8882 03                  576 	.db #0x03	; 3
   8883 00                  577 	.db #0x00	; 0
   8884 00                  578 	.db #0x00	; 0
   8885 00                  579 	.db #0x00	; 0
   8886 00                  580 	.db #0x00	; 0
   8887 00 00               581 	.dw #0x0000
   8889 01                  582 	.db #0x01	; 1
   888A 64                  583 	.db #0x64	; 100	'd'
   888B E8                  584 	.db #0xE8	; 232
   888C 00                  585 	.db #0x00	; 0
   888D 04 00               586 	.dw #0x0004
   888F 44 00               587 	.dw #0x0044
   8891 04 00               588 	.dw #0x0004
   8893 44 00               589 	.dw #0x0044
   8895 00                  590 	.db #0x00	; 0
   8896 00                  591 	.db #0x00	; 0
   8897 01                  592 	.db #0x01	; 1
   8898 00 00               593 	.dw #0x0000
   889A 00 00               594 	.dw #0x0000
   889C 00 00               595 	.dw #0x0000
   889E 00 00               596 	.dw #0x0000
   88A0 08                  597 	.db #0x08	; 8
   88A1 14                  598 	.db #0x14	; 20
   88A2 00                  599 	.db #0x00	; 0
   88A3 03                  600 	.db #0x03	; 3
   88A4 04                  601 	.db #0x04	; 4
   88A5 44                  602 	.db #0x44	; 68	'D'
   88A6 08                  603 	.db #0x08	; 8
   88A7 14                  604 	.db #0x14	; 20
   88A8 01                  605 	.db #0x01	; 1
   88A9 04                  606 	.db #0x04	; 4
   88AA 00                  607 	.db #0x00	; 0
   88AB 00                  608 	.db #0x00	; 0
   88AC 00                  609 	.db #0x00	; 0
   88AD 00                  610 	.db #0x00	; 0
   88AE 00 00               611 	.dw #0x0000
   88B0 01                  612 	.db #0x01	; 1
   88B1 64                  613 	.db #0x64	; 100	'd'
   88B2 E8                  614 	.db #0xE8	; 232
   88B3 00                  615 	.db #0x00	; 0
   88B4 44 00               616 	.dw #0x0044
   88B6 68 00               617 	.dw #0x0068
   88B8 44 00               618 	.dw #0x0044
   88BA 68 00               619 	.dw #0x0068
   88BC 00                  620 	.db #0x00	; 0
   88BD 00                  621 	.db #0x00	; 0
   88BE 01                  622 	.db #0x01	; 1
   88BF 00 00               623 	.dw #0x0000
   88C1 00 00               624 	.dw #0x0000
   88C3 00 00               625 	.dw #0x0000
   88C5 00 00               626 	.dw #0x0000
   88C7 08                  627 	.db #0x08	; 8
   88C8 14                  628 	.db #0x14	; 20
   88C9 00                  629 	.db #0x00	; 0
   88CA 03                  630 	.db #0x03	; 3
   88CB 44                  631 	.db #0x44	; 68	'D'
   88CC 68                  632 	.db #0x68	; 104	'h'
   88CD 08                  633 	.db #0x08	; 8
   88CE 14                  634 	.db #0x14	; 20
   88CF 01                  635 	.db #0x01	; 1
   88D0 05                  636 	.db #0x05	; 5
   88D1 00                  637 	.db #0x00	; 0
   88D2 00                  638 	.db #0x00	; 0
   88D3 00                  639 	.db #0x00	; 0
   88D4 00                  640 	.db #0x00	; 0
   88D5 00 00               641 	.dw #0x0000
   88D7                     642 _puntos:
   88D7 28                  643 	.db #0x28	; 40
   88D8 3C                  644 	.db #0x3C	; 60
   88D9 28                  645 	.db #0x28	; 40
   88DA B9                  646 	.db #0xB9	; 185
   88DB 41                  647 	.db #0x41	; 65	'A'
   88DC 64                  648 	.db #0x64	; 100	'd'
   88DD 0A                  649 	.db #0x0A	; 10
   88DE 64                  650 	.db #0x64	; 100	'd'
                            651 ;src/entities/entities.c:466: TPlayerDirection accion(TEntity* ent, TPlayerStatus action, TPlayerDirection dir){
                            652 ;	---------------------------------
                            653 ; Function accion
                            654 ; ---------------------------------
   88DF                     655 _accion::
   88DF DD E5         [15]  656 	push	ix
   88E1 DD 21 00 00   [14]  657 	ld	ix,#0
   88E5 DD 39         [15]  658 	add	ix,sp
   88E7 3B            [ 6]  659 	dec	sp
                            660 ;src/entities/entities.c:468: switch(action){
   88E8 DD 7E 06      [19]  661 	ld	a,6 (ix)
   88EB 3D            [ 4]  662 	dec	a
   88EC C2 8C 89      [10]  663 	jp	NZ,00107$
                            664 ;src/entities/entities.c:470: switch(dir){
   88EF 3E 03         [ 7]  665 	ld	a,#0x03
   88F1 DD 96 07      [19]  666 	sub	a, 7 (ix)
   88F4 DA 8C 89      [10]  667 	jp	C,00107$
   88F7 DD 5E 07      [19]  668 	ld	e,7 (ix)
   88FA 16 00         [ 7]  669 	ld	d,#0x00
   88FC 21 02 89      [10]  670 	ld	hl,#00120$
   88FF 19            [11]  671 	add	hl,de
   8900 19            [11]  672 	add	hl,de
                            673 ;src/entities/entities.c:471: case d_up:
   8901 E9            [ 4]  674 	jp	(hl)
   8902                     675 00120$:
   8902 18 06         [12]  676 	jr	00102$
   8904 18 67         [12]  677 	jr	00105$
   8906 18 23         [12]  678 	jr	00103$
   8908 18 42         [12]  679 	jr	00104$
   890A                     680 00102$:
                            681 ;src/entities/entities.c:472: collision = moverArriba(ent);
   890A DD 6E 04      [19]  682 	ld	l,4 (ix)
   890D DD 66 05      [19]  683 	ld	h,5 (ix)
   8910 E5            [11]  684 	push	hl
   8911 CD AD 89      [17]  685 	call	_moverArriba
   8914 F1            [10]  686 	pop	af
   8915 4D            [ 4]  687 	ld	c,l
                            688 ;src/entities/entities.c:473: flipSprite(ent,dir);
   8916 C5            [11]  689 	push	bc
   8917 DD 7E 07      [19]  690 	ld	a,7 (ix)
   891A F5            [11]  691 	push	af
   891B 33            [ 6]  692 	inc	sp
   891C DD 6E 04      [19]  693 	ld	l,4 (ix)
   891F DD 66 05      [19]  694 	ld	h,5 (ix)
   8922 E5            [11]  695 	push	hl
   8923 CD 91 89      [17]  696 	call	_flipSprite
   8926 F1            [10]  697 	pop	af
   8927 33            [ 6]  698 	inc	sp
   8928 C1            [10]  699 	pop	bc
                            700 ;src/entities/entities.c:474: break;
   8929 18 61         [12]  701 	jr	00107$
                            702 ;src/entities/entities.c:475: case d_down:
   892B                     703 00103$:
                            704 ;src/entities/entities.c:476: collision = moverAbajo(ent);
   892B DD 6E 04      [19]  705 	ld	l,4 (ix)
   892E DD 66 05      [19]  706 	ld	h,5 (ix)
   8931 E5            [11]  707 	push	hl
   8932 CD 0E 8A      [17]  708 	call	_moverAbajo
   8935 F1            [10]  709 	pop	af
   8936 4D            [ 4]  710 	ld	c,l
                            711 ;src/entities/entities.c:477: flipSprite(ent,dir);
   8937 C5            [11]  712 	push	bc
   8938 DD 7E 07      [19]  713 	ld	a,7 (ix)
   893B F5            [11]  714 	push	af
   893C 33            [ 6]  715 	inc	sp
   893D DD 6E 04      [19]  716 	ld	l,4 (ix)
   8940 DD 66 05      [19]  717 	ld	h,5 (ix)
   8943 E5            [11]  718 	push	hl
   8944 CD 91 89      [17]  719 	call	_flipSprite
   8947 F1            [10]  720 	pop	af
   8948 33            [ 6]  721 	inc	sp
   8949 C1            [10]  722 	pop	bc
                            723 ;src/entities/entities.c:478: break;
   894A 18 40         [12]  724 	jr	00107$
                            725 ;src/entities/entities.c:479: case d_left:
   894C                     726 00104$:
                            727 ;src/entities/entities.c:480: collision = moverIzquierda(ent);
   894C DD 6E 04      [19]  728 	ld	l,4 (ix)
   894F DD 66 05      [19]  729 	ld	h,5 (ix)
   8952 E5            [11]  730 	push	hl
   8953 CD B1 8A      [17]  731 	call	_moverIzquierda
   8956 F1            [10]  732 	pop	af
   8957 4D            [ 4]  733 	ld	c,l
                            734 ;src/entities/entities.c:481: flipSprite(ent,dir);
   8958 C5            [11]  735 	push	bc
   8959 DD 7E 07      [19]  736 	ld	a,7 (ix)
   895C F5            [11]  737 	push	af
   895D 33            [ 6]  738 	inc	sp
   895E DD 6E 04      [19]  739 	ld	l,4 (ix)
   8961 DD 66 05      [19]  740 	ld	h,5 (ix)
   8964 E5            [11]  741 	push	hl
   8965 CD 91 89      [17]  742 	call	_flipSprite
   8968 F1            [10]  743 	pop	af
   8969 33            [ 6]  744 	inc	sp
   896A C1            [10]  745 	pop	bc
                            746 ;src/entities/entities.c:482: break;
   896B 18 1F         [12]  747 	jr	00107$
                            748 ;src/entities/entities.c:483: case d_right:
   896D                     749 00105$:
                            750 ;src/entities/entities.c:484: collision = moverDerecha(ent);
   896D DD 6E 04      [19]  751 	ld	l,4 (ix)
   8970 DD 66 05      [19]  752 	ld	h,5 (ix)
   8973 E5            [11]  753 	push	hl
   8974 CD FE 8A      [17]  754 	call	_moverDerecha
   8977 F1            [10]  755 	pop	af
   8978 4D            [ 4]  756 	ld	c,l
                            757 ;src/entities/entities.c:485: flipSprite(ent,dir);
   8979 C5            [11]  758 	push	bc
   897A DD 7E 07      [19]  759 	ld	a,7 (ix)
   897D F5            [11]  760 	push	af
   897E 33            [ 6]  761 	inc	sp
   897F DD 6E 04      [19]  762 	ld	l,4 (ix)
   8982 DD 66 05      [19]  763 	ld	h,5 (ix)
   8985 E5            [11]  764 	push	hl
   8986 CD 91 89      [17]  765 	call	_flipSprite
   8989 F1            [10]  766 	pop	af
   898A 33            [ 6]  767 	inc	sp
   898B C1            [10]  768 	pop	bc
                            769 ;src/entities/entities.c:490: }
   898C                     770 00107$:
                            771 ;src/entities/entities.c:491: return collision;
   898C 69            [ 4]  772 	ld	l,c
   898D 33            [ 6]  773 	inc	sp
   898E DD E1         [14]  774 	pop	ix
   8990 C9            [10]  775 	ret
                            776 ;src/entities/entities.c:495: void flipSprite(TEntity* ent, TPlayerDirection dir){
                            777 ;	---------------------------------
                            778 ; Function flipSprite
                            779 ; ---------------------------------
   8991                     780 _flipSprite::
                            781 ;src/entities/entities.c:496: if(ent->curr_dir != dir){
   8991 D1            [10]  782 	pop	de
   8992 C1            [10]  783 	pop	bc
   8993 C5            [11]  784 	push	bc
   8994 D5            [11]  785 	push	de
   8995 21 15 00      [10]  786 	ld	hl,#0x0015
   8998 09            [11]  787 	add	hl,bc
   8999 4D            [ 4]  788 	ld	c,l
   899A 44            [ 4]  789 	ld	b,h
   899B 0A            [ 7]  790 	ld	a,(bc)
   899C 5F            [ 4]  791 	ld	e,a
   899D FD 21 04 00   [14]  792 	ld	iy,#4
   89A1 FD 39         [15]  793 	add	iy,sp
   89A3 FD 7E 00      [19]  794 	ld	a,0 (iy)
   89A6 93            [ 4]  795 	sub	a, e
   89A7 C8            [11]  796 	ret	Z
                            797 ;src/entities/entities.c:497: ent->curr_dir = dir; 
   89A8 FD 7E 00      [19]  798 	ld	a,0 (iy)
   89AB 02            [ 7]  799 	ld	(bc),a
   89AC C9            [10]  800 	ret
                            801 ;src/entities/entities.c:501: TPlayerDirection moverArriba(TEntity* ent){
                            802 ;	---------------------------------
                            803 ; Function moverArriba
                            804 ; ---------------------------------
   89AD                     805 _moverArriba::
   89AD DD E5         [15]  806 	push	ix
   89AF DD 21 00 00   [14]  807 	ld	ix,#0
   89B3 DD 39         [15]  808 	add	ix,sp
   89B5 F5            [11]  809 	push	af
                            810 ;src/entities/entities.c:504: ent->y -= ent->vy;
   89B6 DD 4E 04      [19]  811 	ld	c,4 (ix)
   89B9 DD 46 05      [19]  812 	ld	b,5 (ix)
   89BC 21 02 00      [10]  813 	ld	hl,#0x0002
   89BF 09            [11]  814 	add	hl,bc
   89C0 E3            [19]  815 	ex	(sp), hl
   89C1 E1            [10]  816 	pop	hl
   89C2 E5            [11]  817 	push	hl
   89C3 5E            [ 7]  818 	ld	e,(hl)
   89C4 23            [ 6]  819 	inc	hl
   89C5 56            [ 7]  820 	ld	d,(hl)
   89C6 C5            [11]  821 	push	bc
   89C7 FD E1         [14]  822 	pop	iy
   89C9 FD 6E 09      [19]  823 	ld	l,9 (iy)
   89CC 26 00         [ 7]  824 	ld	h,#0x00
   89CE 7B            [ 4]  825 	ld	a,e
   89CF 95            [ 4]  826 	sub	a, l
   89D0 5F            [ 4]  827 	ld	e,a
   89D1 7A            [ 4]  828 	ld	a,d
   89D2 9C            [ 4]  829 	sbc	a, h
   89D3 57            [ 4]  830 	ld	d,a
   89D4 E1            [10]  831 	pop	hl
   89D5 E5            [11]  832 	push	hl
   89D6 73            [ 7]  833 	ld	(hl),e
   89D7 23            [ 6]  834 	inc	hl
   89D8 72            [ 7]  835 	ld	(hl),d
                            836 ;src/entities/entities.c:505: if(MAX(ORIGEN_MAPA_Y, ent->y) == ORIGEN_MAPA_Y){
   89D9 E1            [10]  837 	pop	hl
   89DA E5            [11]  838 	push	hl
   89DB 7E            [ 7]  839 	ld	a, (hl)
   89DC 23            [ 6]  840 	inc	hl
   89DD 66            [ 7]  841 	ld	h,(hl)
   89DE 6F            [ 4]  842 	ld	l,a
   89DF 7B            [ 4]  843 	ld	a,e
   89E0 D6 28         [ 7]  844 	sub	a, #0x28
   89E2 7A            [ 4]  845 	ld	a,d
   89E3 17            [ 4]  846 	rla
   89E4 3F            [ 4]  847 	ccf
   89E5 1F            [ 4]  848 	rra
   89E6 DE 80         [ 7]  849 	sbc	a, #0x80
   89E8 30 03         [12]  850 	jr	NC,00106$
   89EA 21 28 00      [10]  851 	ld	hl,#0x0028
   89ED                     852 00106$:
   89ED 7D            [ 4]  853 	ld	a,l
   89EE D6 28         [ 7]  854 	sub	a,#0x28
   89F0 20 0E         [12]  855 	jr	NZ,00102$
   89F2 B4            [ 4]  856 	or	a,h
   89F3 20 0B         [12]  857 	jr	NZ,00102$
                            858 ;src/entities/entities.c:506: ent->y = ORIGEN_MAPA_Y;
   89F5 E1            [10]  859 	pop	hl
   89F6 E5            [11]  860 	push	hl
   89F7 36 28         [10]  861 	ld	(hl),#0x28
   89F9 23            [ 6]  862 	inc	hl
   89FA 36 00         [10]  863 	ld	(hl),#0x00
                            864 ;src/entities/entities.c:508: collision = d_up;
   89FC 1E 00         [ 7]  865 	ld	e,#0x00
   89FE 18 02         [12]  866 	jr	00103$
   8A00                     867 00102$:
                            868 ;src/entities/entities.c:510: collision = d_nothing;
   8A00 1E 04         [ 7]  869 	ld	e,#0x04
   8A02                     870 00103$:
                            871 ;src/entities/entities.c:513: ent->draw  = SI;
   8A02 21 0A 00      [10]  872 	ld	hl,#0x000A
   8A05 09            [11]  873 	add	hl,bc
   8A06 36 01         [10]  874 	ld	(hl),#0x01
                            875 ;src/entities/entities.c:515: return collision;
   8A08 6B            [ 4]  876 	ld	l,e
   8A09 DD F9         [10]  877 	ld	sp, ix
   8A0B DD E1         [14]  878 	pop	ix
   8A0D C9            [10]  879 	ret
                            880 ;src/entities/entities.c:518: TPlayerDirection moverAbajo(TEntity* ent){
                            881 ;	---------------------------------
                            882 ; Function moverAbajo
                            883 ; ---------------------------------
   8A0E                     884 _moverAbajo::
   8A0E DD E5         [15]  885 	push	ix
   8A10 DD 21 00 00   [14]  886 	ld	ix,#0
   8A14 DD 39         [15]  887 	add	ix,sp
   8A16 21 FA FF      [10]  888 	ld	hl,#-6
   8A19 39            [11]  889 	add	hl,sp
   8A1A F9            [ 6]  890 	ld	sp,hl
                            891 ;src/entities/entities.c:521: ent->y += ent->vy;
   8A1B DD 4E 04      [19]  892 	ld	c,4 (ix)
   8A1E DD 46 05      [19]  893 	ld	b,5 (ix)
   8A21 21 02 00      [10]  894 	ld	hl,#0x0002
   8A24 09            [11]  895 	add	hl,bc
   8A25 DD 75 FC      [19]  896 	ld	-4 (ix),l
   8A28 DD 74 FD      [19]  897 	ld	-3 (ix),h
   8A2B DD 6E FC      [19]  898 	ld	l,-4 (ix)
   8A2E DD 66 FD      [19]  899 	ld	h,-3 (ix)
   8A31 5E            [ 7]  900 	ld	e,(hl)
   8A32 23            [ 6]  901 	inc	hl
   8A33 56            [ 7]  902 	ld	d,(hl)
   8A34 C5            [11]  903 	push	bc
   8A35 FD E1         [14]  904 	pop	iy
   8A37 FD 6E 09      [19]  905 	ld	l,9 (iy)
   8A3A 26 00         [ 7]  906 	ld	h,#0x00
   8A3C 19            [11]  907 	add	hl,de
   8A3D EB            [ 4]  908 	ex	de,hl
   8A3E DD 6E FC      [19]  909 	ld	l,-4 (ix)
   8A41 DD 66 FD      [19]  910 	ld	h,-3 (ix)
   8A44 73            [ 7]  911 	ld	(hl),e
   8A45 23            [ 6]  912 	inc	hl
   8A46 72            [ 7]  913 	ld	(hl),d
   8A47 DD 6E FC      [19]  914 	ld	l,-4 (ix)
   8A4A DD 66 FD      [19]  915 	ld	h,-3 (ix)
   8A4D 7E            [ 7]  916 	ld	a,(hl)
   8A4E DD 77 FA      [19]  917 	ld	-6 (ix),a
   8A51 23            [ 6]  918 	inc	hl
   8A52 7E            [ 7]  919 	ld	a,(hl)
   8A53 DD 77 FB      [19]  920 	ld	-5 (ix),a
                            921 ;src/entities/entities.c:522: if(MIN(ent->y, ALTO - ent->sh) != ent->y){
   8A56 C5            [11]  922 	push	bc
   8A57 FD E1         [14]  923 	pop	iy
   8A59 FD 6E 14      [19]  924 	ld	l,20 (iy)
   8A5C 26 00         [ 7]  925 	ld	h,#0x00
   8A5E 3E C8         [ 7]  926 	ld	a,#0xC8
   8A60 95            [ 4]  927 	sub	a, l
   8A61 DD 77 FE      [19]  928 	ld	-2 (ix),a
   8A64 3E 00         [ 7]  929 	ld	a,#0x00
   8A66 9C            [ 4]  930 	sbc	a, h
   8A67 DD 77 FF      [19]  931 	ld	-1 (ix),a
   8A6A 7B            [ 4]  932 	ld	a,e
   8A6B DD 96 FE      [19]  933 	sub	a, -2 (ix)
   8A6E 7A            [ 4]  934 	ld	a,d
   8A6F DD 9E FF      [19]  935 	sbc	a, -1 (ix)
   8A72 E2 77 8A      [10]  936 	jp	PO, 00116$
   8A75 EE 80         [ 7]  937 	xor	a, #0x80
   8A77                     938 00116$:
   8A77 F2 7E 8A      [10]  939 	jp	P,00106$
   8A7A D1            [10]  940 	pop	de
   8A7B D5            [11]  941 	push	de
   8A7C 18 06         [12]  942 	jr	00107$
   8A7E                     943 00106$:
   8A7E DD 5E FE      [19]  944 	ld	e,-2 (ix)
   8A81 DD 56 FF      [19]  945 	ld	d,-1 (ix)
   8A84                     946 00107$:
   8A84 DD 7E FA      [19]  947 	ld	a,-6 (ix)
   8A87 93            [ 4]  948 	sub	a, e
   8A88 20 06         [12]  949 	jr	NZ,00117$
   8A8A DD 7E FB      [19]  950 	ld	a,-5 (ix)
   8A8D 92            [ 4]  951 	sub	a, d
   8A8E 28 13         [12]  952 	jr	Z,00102$
   8A90                     953 00117$:
                            954 ;src/entities/entities.c:523: ent->y = ALTO - ent->sh;
   8A90 DD 6E FC      [19]  955 	ld	l,-4 (ix)
   8A93 DD 66 FD      [19]  956 	ld	h,-3 (ix)
   8A96 DD 7E FE      [19]  957 	ld	a,-2 (ix)
   8A99 77            [ 7]  958 	ld	(hl),a
   8A9A 23            [ 6]  959 	inc	hl
   8A9B DD 7E FF      [19]  960 	ld	a,-1 (ix)
   8A9E 77            [ 7]  961 	ld	(hl),a
                            962 ;src/entities/entities.c:524: collision =  d_down;
   8A9F 1E 02         [ 7]  963 	ld	e,#0x02
   8AA1 18 02         [12]  964 	jr	00103$
   8AA3                     965 00102$:
                            966 ;src/entities/entities.c:526: collision = d_nothing;
   8AA3 1E 04         [ 7]  967 	ld	e,#0x04
   8AA5                     968 00103$:
                            969 ;src/entities/entities.c:529: ent->draw  = SI;
   8AA5 21 0A 00      [10]  970 	ld	hl,#0x000A
   8AA8 09            [11]  971 	add	hl,bc
   8AA9 36 01         [10]  972 	ld	(hl),#0x01
                            973 ;src/entities/entities.c:531: return collision;
   8AAB 6B            [ 4]  974 	ld	l,e
   8AAC DD F9         [10]  975 	ld	sp, ix
   8AAE DD E1         [14]  976 	pop	ix
   8AB0 C9            [10]  977 	ret
                            978 ;src/entities/entities.c:534: TPlayerDirection moverIzquierda(TEntity* ent){
                            979 ;	---------------------------------
                            980 ; Function moverIzquierda
                            981 ; ---------------------------------
   8AB1                     982 _moverIzquierda::
   8AB1 DD E5         [15]  983 	push	ix
   8AB3 DD 21 00 00   [14]  984 	ld	ix,#0
   8AB7 DD 39         [15]  985 	add	ix,sp
                            986 ;src/entities/entities.c:537: ent->x -= ent->vx;
   8AB9 DD 4E 04      [19]  987 	ld	c,4 (ix)
   8ABC DD 46 05      [19]  988 	ld	b,5 (ix)
   8ABF 69            [ 4]  989 	ld	l, c
   8AC0 60            [ 4]  990 	ld	h, b
   8AC1 5E            [ 7]  991 	ld	e,(hl)
   8AC2 23            [ 6]  992 	inc	hl
   8AC3 56            [ 7]  993 	ld	d,(hl)
   8AC4 C5            [11]  994 	push	bc
   8AC5 FD E1         [14]  995 	pop	iy
   8AC7 FD 6E 08      [19]  996 	ld	l,8 (iy)
   8ACA 26 00         [ 7]  997 	ld	h,#0x00
   8ACC 7B            [ 4]  998 	ld	a,e
   8ACD 95            [ 4]  999 	sub	a, l
   8ACE 5F            [ 4] 1000 	ld	e,a
   8ACF 7A            [ 4] 1001 	ld	a,d
   8AD0 9C            [ 4] 1002 	sbc	a, h
   8AD1 57            [ 4] 1003 	ld	d,a
   8AD2 69            [ 4] 1004 	ld	l, c
   8AD3 60            [ 4] 1005 	ld	h, b
   8AD4 73            [ 7] 1006 	ld	(hl),e
   8AD5 23            [ 6] 1007 	inc	hl
   8AD6 72            [ 7] 1008 	ld	(hl),d
                           1009 ;src/entities/entities.c:538: if(MAX(0, ent->x) == 0){
   8AD7 69            [ 4] 1010 	ld	l, c
   8AD8 60            [ 4] 1011 	ld	h, b
   8AD9 7E            [ 7] 1012 	ld	a, (hl)
   8ADA 23            [ 6] 1013 	inc	hl
   8ADB 66            [ 7] 1014 	ld	h,(hl)
   8ADC 6F            [ 4] 1015 	ld	l,a
   8ADD CB 7A         [ 8] 1016 	bit	7, d
   8ADF 28 03         [12] 1017 	jr	Z,00106$
   8AE1 21 00 00      [10] 1018 	ld	hl,#0x0000
   8AE4                    1019 00106$:
   8AE4 7C            [ 4] 1020 	ld	a,h
   8AE5 B5            [ 4] 1021 	or	a,l
   8AE6 20 0A         [12] 1022 	jr	NZ,00102$
                           1023 ;src/entities/entities.c:539: ent->x = 0;
   8AE8 69            [ 4] 1024 	ld	l, c
   8AE9 60            [ 4] 1025 	ld	h, b
   8AEA AF            [ 4] 1026 	xor	a, a
   8AEB 77            [ 7] 1027 	ld	(hl), a
   8AEC 23            [ 6] 1028 	inc	hl
   8AED 77            [ 7] 1029 	ld	(hl), a
                           1030 ;src/entities/entities.c:541: collision = d_left;
   8AEE 1E 03         [ 7] 1031 	ld	e,#0x03
   8AF0 18 02         [12] 1032 	jr	00103$
   8AF2                    1033 00102$:
                           1034 ;src/entities/entities.c:543: collision = d_nothing;
   8AF2 1E 04         [ 7] 1035 	ld	e,#0x04
   8AF4                    1036 00103$:
                           1037 ;src/entities/entities.c:545: ent->draw  = SI;
   8AF4 21 0A 00      [10] 1038 	ld	hl,#0x000A
   8AF7 09            [11] 1039 	add	hl,bc
   8AF8 36 01         [10] 1040 	ld	(hl),#0x01
                           1041 ;src/entities/entities.c:547: return collision;
   8AFA 6B            [ 4] 1042 	ld	l,e
   8AFB DD E1         [14] 1043 	pop	ix
   8AFD C9            [10] 1044 	ret
                           1045 ;src/entities/entities.c:549: TPlayerDirection moverDerecha(TEntity* ent){
                           1046 ;	---------------------------------
                           1047 ; Function moverDerecha
                           1048 ; ---------------------------------
   8AFE                    1049 _moverDerecha::
   8AFE DD E5         [15] 1050 	push	ix
   8B00 DD 21 00 00   [14] 1051 	ld	ix,#0
   8B04 DD 39         [15] 1052 	add	ix,sp
   8B06 F5            [11] 1053 	push	af
   8B07 F5            [11] 1054 	push	af
                           1055 ;src/entities/entities.c:552: ent->x += ent->vx;
   8B08 DD 4E 04      [19] 1056 	ld	c,4 (ix)
   8B0B DD 46 05      [19] 1057 	ld	b,5 (ix)
   8B0E 69            [ 4] 1058 	ld	l, c
   8B0F 60            [ 4] 1059 	ld	h, b
   8B10 5E            [ 7] 1060 	ld	e,(hl)
   8B11 23            [ 6] 1061 	inc	hl
   8B12 56            [ 7] 1062 	ld	d,(hl)
   8B13 C5            [11] 1063 	push	bc
   8B14 FD E1         [14] 1064 	pop	iy
   8B16 FD 6E 08      [19] 1065 	ld	l,8 (iy)
   8B19 26 00         [ 7] 1066 	ld	h,#0x00
   8B1B 19            [11] 1067 	add	hl,de
   8B1C EB            [ 4] 1068 	ex	de,hl
   8B1D 69            [ 4] 1069 	ld	l, c
   8B1E 60            [ 4] 1070 	ld	h, b
   8B1F 73            [ 7] 1071 	ld	(hl),e
   8B20 23            [ 6] 1072 	inc	hl
   8B21 72            [ 7] 1073 	ld	(hl),d
                           1074 ;src/entities/entities.c:553: if(MIN(ent->x, ANCHO - ent->sw) != ent->x){
   8B22 0A            [ 7] 1075 	ld	a,(bc)
   8B23 DD 77 FE      [19] 1076 	ld	-2 (ix),a
   8B26 03            [ 6] 1077 	inc	bc
   8B27 0A            [ 7] 1078 	ld	a,(bc)
   8B28 DD 77 FF      [19] 1079 	ld	-1 (ix),a
   8B2B 0B            [ 6] 1080 	dec	bc
   8B2C C5            [11] 1081 	push	bc
   8B2D FD E1         [14] 1082 	pop	iy
   8B2F FD 6E 13      [19] 1083 	ld	l,19 (iy)
   8B32 26 00         [ 7] 1084 	ld	h,#0x00
   8B34 3E 50         [ 7] 1085 	ld	a,#0x50
   8B36 95            [ 4] 1086 	sub	a, l
   8B37 DD 77 FC      [19] 1087 	ld	-4 (ix),a
   8B3A 3E 00         [ 7] 1088 	ld	a,#0x00
   8B3C 9C            [ 4] 1089 	sbc	a, h
   8B3D DD 77 FD      [19] 1090 	ld	-3 (ix),a
   8B40 7B            [ 4] 1091 	ld	a,e
   8B41 DD 96 FC      [19] 1092 	sub	a, -4 (ix)
   8B44 7A            [ 4] 1093 	ld	a,d
   8B45 DD 9E FD      [19] 1094 	sbc	a, -3 (ix)
   8B48 E2 4D 8B      [10] 1095 	jp	PO, 00116$
   8B4B EE 80         [ 7] 1096 	xor	a, #0x80
   8B4D                    1097 00116$:
   8B4D F2 58 8B      [10] 1098 	jp	P,00106$
   8B50 DD 5E FE      [19] 1099 	ld	e,-2 (ix)
   8B53 DD 56 FF      [19] 1100 	ld	d,-1 (ix)
   8B56 18 02         [12] 1101 	jr	00107$
   8B58                    1102 00106$:
   8B58 D1            [10] 1103 	pop	de
   8B59 D5            [11] 1104 	push	de
   8B5A                    1105 00107$:
   8B5A DD 7E FE      [19] 1106 	ld	a,-2 (ix)
   8B5D 93            [ 4] 1107 	sub	a, e
   8B5E 20 06         [12] 1108 	jr	NZ,00117$
   8B60 DD 7E FF      [19] 1109 	ld	a,-1 (ix)
   8B63 92            [ 4] 1110 	sub	a, d
   8B64 28 0F         [12] 1111 	jr	Z,00102$
   8B66                    1112 00117$:
                           1113 ;src/entities/entities.c:555: ent->x = ANCHO - ent->sw;
   8B66 69            [ 4] 1114 	ld	l, c
   8B67 60            [ 4] 1115 	ld	h, b
   8B68 DD 7E FC      [19] 1116 	ld	a,-4 (ix)
   8B6B 77            [ 7] 1117 	ld	(hl),a
   8B6C 23            [ 6] 1118 	inc	hl
   8B6D DD 7E FD      [19] 1119 	ld	a,-3 (ix)
   8B70 77            [ 7] 1120 	ld	(hl),a
                           1121 ;src/entities/entities.c:556: collision = d_right;
   8B71 1E 01         [ 7] 1122 	ld	e,#0x01
   8B73 18 02         [12] 1123 	jr	00103$
   8B75                    1124 00102$:
                           1125 ;src/entities/entities.c:558: collision = d_nothing;
   8B75 1E 04         [ 7] 1126 	ld	e,#0x04
   8B77                    1127 00103$:
                           1128 ;src/entities/entities.c:561: ent->draw  = SI;
   8B77 21 0A 00      [10] 1129 	ld	hl,#0x000A
   8B7A 09            [11] 1130 	add	hl,bc
   8B7B 36 01         [10] 1131 	ld	(hl),#0x01
                           1132 ;src/entities/entities.c:563: return collision;
   8B7D 6B            [ 4] 1133 	ld	l,e
   8B7E DD F9         [10] 1134 	ld	sp, ix
   8B80 DD E1         [14] 1135 	pop	ix
   8B82 C9            [10] 1136 	ret
                           1137 ;src/entities/entities.c:567: void updatePlayer(TPlayer* player){
                           1138 ;	---------------------------------
                           1139 ; Function updatePlayer
                           1140 ; ---------------------------------
   8B83                    1141 _updatePlayer::
                           1142 ;src/entities/entities.c:568: if(previousMap == mapaActual){
   8B83 3A 04 86      [13] 1143 	ld	a,(#_previousMap + 0)
   8B86 FD 21 03 86   [14] 1144 	ld	iy,#_mapaActual
   8B8A FD 96 00      [19] 1145 	sub	a, 0 (iy)
   8B8D 20 05         [12] 1146 	jr	NZ,00102$
                           1147 ;src/entities/entities.c:570: updateTiempoEnMapa();
   8B8F CD E6 65      [17] 1148 	call	_updateTiempoEnMapa
   8B92 18 09         [12] 1149 	jr	00103$
   8B94                    1150 00102$:
                           1151 ;src/entities/entities.c:572: previousMap = mapaActual;
   8B94 3A 03 86      [13] 1152 	ld	a,(#_mapaActual + 0)
   8B97 32 04 86      [13] 1153 	ld	(#_previousMap + 0),a
                           1154 ;src/entities/entities.c:573: resetearTimepoEnMapa();
   8B9A CD 13 66      [17] 1155 	call	_resetearTimepoEnMapa
   8B9D                    1156 00103$:
                           1157 ;src/entities/entities.c:576: updateBullet(&player->bullet);
   8B9D D1            [10] 1158 	pop	de
   8B9E C1            [10] 1159 	pop	bc
   8B9F C5            [11] 1160 	push	bc
   8BA0 D5            [11] 1161 	push	de
   8BA1 C5            [11] 1162 	push	bc
   8BA2 CD 33 8D      [17] 1163 	call	_updateBullet
   8BA5 F1            [10] 1164 	pop	af
   8BA6 C9            [10] 1165 	ret
                           1166 ;src/entities/entities.c:580: void corregirPosicion(TBullet* bullet, u8 x, u8 y, TPlayerDirection dir){
                           1167 ;	---------------------------------
                           1168 ; Function corregirPosicion
                           1169 ; ---------------------------------
   8BA7                    1170 _corregirPosicion::
   8BA7 DD E5         [15] 1171 	push	ix
   8BA9 DD 21 00 00   [14] 1172 	ld	ix,#0
   8BAD DD 39         [15] 1173 	add	ix,sp
                           1174 ;src/entities/entities.c:591: x = ANCHO - bullet->ent.sw;
   8BAF DD 4E 04      [19] 1175 	ld	c,4 (ix)
   8BB2 DD 46 05      [19] 1176 	ld	b,5 (ix)
                           1177 ;src/entities/entities.c:581: switch(dir){
   8BB5 3E 03         [ 7] 1178 	ld	a,#0x03
   8BB7 DD 96 08      [19] 1179 	sub	a, 8 (ix)
   8BBA DA 6E 8C      [10] 1180 	jp	C,00115$
                           1181 ;src/entities/entities.c:583: x+=2;
   8BBD DD 5E 06      [19] 1182 	ld	e,6 (ix)
   8BC0 1C            [ 4] 1183 	inc	e
   8BC1 1C            [ 4] 1184 	inc	e
                           1185 ;src/entities/entities.c:581: switch(dir){
   8BC2 D5            [11] 1186 	push	de
   8BC3 DD 5E 08      [19] 1187 	ld	e,8 (ix)
   8BC6 16 00         [ 7] 1188 	ld	d,#0x00
   8BC8 21 CF 8B      [10] 1189 	ld	hl,#00138$
   8BCB 19            [11] 1190 	add	hl,de
   8BCC 19            [11] 1191 	add	hl,de
                           1192 ;src/entities/entities.c:582: case d_up:
   8BCD D1            [10] 1193 	pop	de
   8BCE E9            [ 4] 1194 	jp	(hl)
   8BCF                    1195 00138$:
   8BCF 18 06         [12] 1196 	jr	00101$
   8BD1 18 1A         [12] 1197 	jr	00104$
   8BD3 18 67         [12] 1198 	jr	00111$
   8BD5 18 4E         [12] 1199 	jr	00108$
   8BD7                    1200 00101$:
                           1201 ;src/entities/entities.c:583: x+=2;
   8BD7 DD 73 06      [19] 1202 	ld	6 (ix),e
                           1203 ;src/entities/entities.c:584: if(y >= ORIGEN_MAPA_Y + 7 )
   8BDA DD 7E 07      [19] 1204 	ld	a,7 (ix)
   8BDD D6 2F         [ 7] 1205 	sub	a, #0x2F
   8BDF DA 6E 8C      [10] 1206 	jp	C,00115$
                           1207 ;src/entities/entities.c:585: y-=7;
   8BE2 DD 7E 07      [19] 1208 	ld	a,7 (ix)
   8BE5 C6 F9         [ 7] 1209 	add	a,#0xF9
   8BE7 DD 77 07      [19] 1210 	ld	7 (ix),a
                           1211 ;src/entities/entities.c:586: break;
   8BEA C3 6E 8C      [10] 1212 	jp	00115$
                           1213 ;src/entities/entities.c:587: case d_right:
   8BED                    1214 00104$:
                           1215 ;src/entities/entities.c:588: if(x + 7 <= ANCHO)
   8BED DD 5E 06      [19] 1216 	ld	e,6 (ix)
   8BF0 16 00         [ 7] 1217 	ld	d,#0x00
   8BF2 21 07 00      [10] 1218 	ld	hl,#0x0007
   8BF5 19            [11] 1219 	add	hl,de
   8BF6 3E 50         [ 7] 1220 	ld	a,#0x50
   8BF8 BD            [ 4] 1221 	cp	a, l
   8BF9 3E 00         [ 7] 1222 	ld	a,#0x00
   8BFB 9C            [ 4] 1223 	sbc	a, h
   8BFC E2 01 8C      [10] 1224 	jp	PO, 00139$
   8BFF EE 80         [ 7] 1225 	xor	a, #0x80
   8C01                    1226 00139$:
   8C01 FA 0E 8C      [10] 1227 	jp	M,00106$
                           1228 ;src/entities/entities.c:589: x+=7;
   8C04 DD 7E 06      [19] 1229 	ld	a,6 (ix)
   8C07 C6 07         [ 7] 1230 	add	a, #0x07
   8C09 DD 77 06      [19] 1231 	ld	6 (ix),a
   8C0C 18 0C         [12] 1232 	jr	00107$
   8C0E                    1233 00106$:
                           1234 ;src/entities/entities.c:591: x = ANCHO - bullet->ent.sw;
   8C0E C5            [11] 1235 	push	bc
   8C0F FD E1         [14] 1236 	pop	iy
   8C11 FD 5E 16      [19] 1237 	ld	e,22 (iy)
   8C14 3E 50         [ 7] 1238 	ld	a,#0x50
   8C16 93            [ 4] 1239 	sub	a, e
   8C17 DD 77 06      [19] 1240 	ld	6 (ix),a
   8C1A                    1241 00107$:
                           1242 ;src/entities/entities.c:592: y+=3;
   8C1A DD 34 07      [23] 1243 	inc	7 (ix)
   8C1D DD 34 07      [23] 1244 	inc	7 (ix)
   8C20 DD 34 07      [23] 1245 	inc	7 (ix)
                           1246 ;src/entities/entities.c:594: break;
   8C23 18 49         [12] 1247 	jr	00115$
                           1248 ;src/entities/entities.c:595: case d_left:
   8C25                    1249 00108$:
                           1250 ;src/entities/entities.c:596: if(x > 6)
   8C25 3E 06         [ 7] 1251 	ld	a,#0x06
   8C27 DD 96 06      [19] 1252 	sub	a, 6 (ix)
   8C2A 30 08         [12] 1253 	jr	NC,00110$
                           1254 ;src/entities/entities.c:597: x-=5;
   8C2C DD 7E 06      [19] 1255 	ld	a,6 (ix)
   8C2F C6 FB         [ 7] 1256 	add	a,#0xFB
   8C31 DD 77 06      [19] 1257 	ld	6 (ix),a
   8C34                    1258 00110$:
                           1259 ;src/entities/entities.c:598: y+=2;
   8C34 DD 34 07      [23] 1260 	inc	7 (ix)
   8C37 DD 34 07      [23] 1261 	inc	7 (ix)
                           1262 ;src/entities/entities.c:600: break;
   8C3A 18 32         [12] 1263 	jr	00115$
                           1264 ;src/entities/entities.c:601: case d_down:
   8C3C                    1265 00111$:
                           1266 ;src/entities/entities.c:602: if(y + 15 <= ALTO)
   8C3C DD 6E 07      [19] 1267 	ld	l,7 (ix)
   8C3F 26 00         [ 7] 1268 	ld	h,#0x00
   8C41 D5            [11] 1269 	push	de
   8C42 11 0F 00      [10] 1270 	ld	de,#0x000F
   8C45 19            [11] 1271 	add	hl, de
   8C46 D1            [10] 1272 	pop	de
   8C47 3E C8         [ 7] 1273 	ld	a,#0xC8
   8C49 BD            [ 4] 1274 	cp	a, l
   8C4A 3E 00         [ 7] 1275 	ld	a,#0x00
   8C4C 9C            [ 4] 1276 	sbc	a, h
   8C4D E2 52 8C      [10] 1277 	jp	PO, 00140$
   8C50 EE 80         [ 7] 1278 	xor	a, #0x80
   8C52                    1279 00140$:
   8C52 FA 5F 8C      [10] 1280 	jp	M,00113$
                           1281 ;src/entities/entities.c:603: y +=15;
   8C55 DD 7E 07      [19] 1282 	ld	a,7 (ix)
   8C58 C6 0F         [ 7] 1283 	add	a, #0x0F
   8C5A DD 77 07      [19] 1284 	ld	7 (ix),a
   8C5D 18 0C         [12] 1285 	jr	00114$
   8C5F                    1286 00113$:
                           1287 ;src/entities/entities.c:605: y = ALTO - bullet->ent.sh;
   8C5F C5            [11] 1288 	push	bc
   8C60 FD E1         [14] 1289 	pop	iy
   8C62 FD 56 17      [19] 1290 	ld	d,23 (iy)
   8C65 3E C8         [ 7] 1291 	ld	a,#0xC8
   8C67 92            [ 4] 1292 	sub	a, d
   8C68 DD 77 07      [19] 1293 	ld	7 (ix),a
   8C6B                    1294 00114$:
                           1295 ;src/entities/entities.c:606: x +=2;
   8C6B DD 73 06      [19] 1296 	ld	6 (ix),e
                           1297 ;src/entities/entities.c:608: }
   8C6E                    1298 00115$:
                           1299 ;src/entities/entities.c:610: bullet->ent.x = x;
   8C6E 69            [ 4] 1300 	ld	l, c
   8C6F 60            [ 4] 1301 	ld	h, b
   8C70 23            [ 6] 1302 	inc	hl
   8C71 23            [ 6] 1303 	inc	hl
   8C72 23            [ 6] 1304 	inc	hl
   8C73 DD 5E 06      [19] 1305 	ld	e,6 (ix)
   8C76 16 00         [ 7] 1306 	ld	d,#0x00
   8C78 73            [ 7] 1307 	ld	(hl),e
   8C79 23            [ 6] 1308 	inc	hl
   8C7A 72            [ 7] 1309 	ld	(hl),d
                           1310 ;src/entities/entities.c:611: bullet->ent.y = y;
   8C7B 21 05 00      [10] 1311 	ld	hl,#0x0005
   8C7E 09            [11] 1312 	add	hl,bc
   8C7F DD 4E 07      [19] 1313 	ld	c,7 (ix)
   8C82 06 00         [ 7] 1314 	ld	b,#0x00
   8C84 71            [ 7] 1315 	ld	(hl),c
   8C85 23            [ 6] 1316 	inc	hl
   8C86 70            [ 7] 1317 	ld	(hl),b
   8C87 DD E1         [14] 1318 	pop	ix
   8C89 C9            [10] 1319 	ret
                           1320 ;src/entities/entities.c:613: void updateX(TEntity* ent, i16 x){
                           1321 ;	---------------------------------
                           1322 ; Function updateX
                           1323 ; ---------------------------------
   8C8A                    1324 _updateX::
                           1325 ;src/entities/entities.c:614: ent->x = x;
   8C8A C1            [10] 1326 	pop	bc
   8C8B E1            [10] 1327 	pop	hl
   8C8C E5            [11] 1328 	push	hl
   8C8D C5            [11] 1329 	push	bc
   8C8E FD 21 04 00   [14] 1330 	ld	iy,#4
   8C92 FD 39         [15] 1331 	add	iy,sp
   8C94 FD 7E 00      [19] 1332 	ld	a,0 (iy)
   8C97 77            [ 7] 1333 	ld	(hl),a
   8C98 23            [ 6] 1334 	inc	hl
   8C99 FD 7E 01      [19] 1335 	ld	a,1 (iy)
   8C9C 77            [ 7] 1336 	ld	(hl),a
                           1337 ;src/entities/entities.c:615: ent->coll.x = x;
   8C9D 01 16 00      [10] 1338 	ld	bc,#0x0017-1
   8CA0 09            [11] 1339 	add	hl,bc
   8CA1 FD 4E 00      [19] 1340 	ld	c,0 (iy)
   8CA4 71            [ 7] 1341 	ld	(hl),c
   8CA5 C9            [10] 1342 	ret
                           1343 ;src/entities/entities.c:617: void updateY(TEntity* ent, i16 y){
                           1344 ;	---------------------------------
                           1345 ; Function updateY
                           1346 ; ---------------------------------
   8CA6                    1347 _updateY::
                           1348 ;src/entities/entities.c:618: ent->y = y;
   8CA6 D1            [10] 1349 	pop	de
   8CA7 C1            [10] 1350 	pop	bc
   8CA8 C5            [11] 1351 	push	bc
   8CA9 D5            [11] 1352 	push	de
   8CAA 59            [ 4] 1353 	ld	e, c
   8CAB 50            [ 4] 1354 	ld	d, b
   8CAC 13            [ 6] 1355 	inc	de
   8CAD 13            [ 6] 1356 	inc	de
   8CAE FD 21 04 00   [14] 1357 	ld	iy,#4
   8CB2 FD 39         [15] 1358 	add	iy,sp
   8CB4 FD 7E 00      [19] 1359 	ld	a,0 (iy)
   8CB7 12            [ 7] 1360 	ld	(de),a
   8CB8 13            [ 6] 1361 	inc	de
   8CB9 FD 7E 01      [19] 1362 	ld	a,1 (iy)
   8CBC 12            [ 7] 1363 	ld	(de),a
                           1364 ;src/entities/entities.c:619: ent->coll.y = y;
   8CBD 21 18 00      [10] 1365 	ld	hl,#0x0018
   8CC0 09            [11] 1366 	add	hl,bc
   8CC1 FD 4E 00      [19] 1367 	ld	c,0 (iy)
   8CC4 71            [ 7] 1368 	ld	(hl),c
   8CC5 C9            [10] 1369 	ret
                           1370 ;src/entities/entities.c:621: void disparar(TBullet* bullet, u8 x, u8 y, TPlayerDirection dir){
                           1371 ;	---------------------------------
                           1372 ; Function disparar
                           1373 ; ---------------------------------
   8CC6                    1374 _disparar::
   8CC6 DD E5         [15] 1375 	push	ix
   8CC8 DD 21 00 00   [14] 1376 	ld	ix,#0
   8CCC DD 39         [15] 1377 	add	ix,sp
                           1378 ;src/entities/entities.c:622: if(bullet->state == es_static){
   8CCE DD 4E 04      [19] 1379 	ld	c,4 (ix)
   8CD1 DD 46 05      [19] 1380 	ld	b,5 (ix)
   8CD4 69            [ 4] 1381 	ld	l, c
   8CD5 60            [ 4] 1382 	ld	h, b
   8CD6 23            [ 6] 1383 	inc	hl
   8CD7 23            [ 6] 1384 	inc	hl
   8CD8 7E            [ 7] 1385 	ld	a,(hl)
   8CD9 B7            [ 4] 1386 	or	a, a
   8CDA 20 54         [12] 1387 	jr	NZ,00103$
                           1388 ;src/entities/entities.c:623: bullet->state = es_disparado;
   8CDC 36 02         [10] 1389 	ld	(hl),#0x02
                           1390 ;src/entities/entities.c:624: corregirPosicion(bullet,x,y,dir);
   8CDE C5            [11] 1391 	push	bc
   8CDF DD 66 08      [19] 1392 	ld	h,8 (ix)
   8CE2 DD 6E 07      [19] 1393 	ld	l,7 (ix)
   8CE5 E5            [11] 1394 	push	hl
   8CE6 DD 7E 06      [19] 1395 	ld	a,6 (ix)
   8CE9 F5            [11] 1396 	push	af
   8CEA 33            [ 6] 1397 	inc	sp
   8CEB C5            [11] 1398 	push	bc
   8CEC CD A7 8B      [17] 1399 	call	_corregirPosicion
   8CEF F1            [10] 1400 	pop	af
   8CF0 F1            [10] 1401 	pop	af
   8CF1 33            [ 6] 1402 	inc	sp
   8CF2 C1            [10] 1403 	pop	bc
                           1404 ;src/entities/entities.c:625: bullet->ent.px = bullet->ent.x;
   8CF3 69            [ 4] 1405 	ld	l, c
   8CF4 60            [ 4] 1406 	ld	h, b
   8CF5 FD 21 07 00   [14] 1407 	ld	iy,#0x0007
   8CF9 FD 09         [15] 1408 	add	iy, bc
   8CFB 23            [ 6] 1409 	inc	hl
   8CFC 23            [ 6] 1410 	inc	hl
   8CFD 23            [ 6] 1411 	inc	hl
   8CFE 5E            [ 7] 1412 	ld	e,(hl)
   8CFF 23            [ 6] 1413 	inc	hl
   8D00 56            [ 7] 1414 	ld	d,(hl)
   8D01 FD 73 00      [19] 1415 	ld	0 (iy),e
   8D04 FD 72 01      [19] 1416 	ld	1 (iy),d
                           1417 ;src/entities/entities.c:626: bullet->ent.py = bullet->ent.y;
   8D07 FD 21 09 00   [14] 1418 	ld	iy,#0x0009
   8D0B FD 09         [15] 1419 	add	iy, bc
   8D0D 69            [ 4] 1420 	ld	l, c
   8D0E 60            [ 4] 1421 	ld	h, b
   8D0F 11 05 00      [10] 1422 	ld	de, #0x0005
   8D12 19            [11] 1423 	add	hl, de
   8D13 5E            [ 7] 1424 	ld	e,(hl)
   8D14 23            [ 6] 1425 	inc	hl
   8D15 56            [ 7] 1426 	ld	d,(hl)
   8D16 FD 73 00      [19] 1427 	ld	0 (iy),e
   8D19 FD 72 01      [19] 1428 	ld	1 (iy),d
                           1429 ;src/entities/entities.c:627: bullet->ent.draw = SI;
   8D1C 21 0D 00      [10] 1430 	ld	hl,#0x000D
   8D1F 09            [11] 1431 	add	hl,bc
   8D20 36 01         [10] 1432 	ld	(hl),#0x01
                           1433 ;src/entities/entities.c:628: bullet->ent.vivo = SI;
   8D22 21 1E 00      [10] 1434 	ld	hl,#0x001E
   8D25 09            [11] 1435 	add	hl,bc
   8D26 36 01         [10] 1436 	ld	(hl),#0x01
                           1437 ;src/entities/entities.c:629: bullet->ent.curr_dir = dir;
   8D28 21 18 00      [10] 1438 	ld	hl,#0x0018
   8D2B 09            [11] 1439 	add	hl,bc
   8D2C DD 7E 08      [19] 1440 	ld	a,8 (ix)
   8D2F 77            [ 7] 1441 	ld	(hl),a
   8D30                    1442 00103$:
   8D30 DD E1         [14] 1443 	pop	ix
   8D32 C9            [10] 1444 	ret
                           1445 ;src/entities/entities.c:633: void updateBullet(TBullet* bullet){
                           1446 ;	---------------------------------
                           1447 ; Function updateBullet
                           1448 ; ---------------------------------
   8D33                    1449 _updateBullet::
   8D33 DD E5         [15] 1450 	push	ix
   8D35 DD 21 00 00   [14] 1451 	ld	ix,#0
   8D39 DD 39         [15] 1452 	add	ix,sp
   8D3B F5            [11] 1453 	push	af
   8D3C F5            [11] 1454 	push	af
   8D3D 3B            [ 6] 1455 	dec	sp
                           1456 ;src/entities/entities.c:635: switch(bullet->state){
   8D3E DD 4E 04      [19] 1457 	ld	c,4 (ix)
   8D41 DD 46 05      [19] 1458 	ld	b,5 (ix)
   8D44 59            [ 4] 1459 	ld	e, c
   8D45 50            [ 4] 1460 	ld	d, b
   8D46 13            [ 6] 1461 	inc	de
   8D47 13            [ 6] 1462 	inc	de
   8D48 1A            [ 7] 1463 	ld	a,(de)
   8D49 6F            [ 4] 1464 	ld	l,a
   8D4A D6 02         [ 7] 1465 	sub	a, #0x02
   8D4C 28 08         [12] 1466 	jr	Z,00101$
   8D4E 7D            [ 4] 1467 	ld	a,l
   8D4F D6 03         [ 7] 1468 	sub	a, #0x03
   8D51 28 78         [12] 1469 	jr	Z,00107$
   8D53 C3 D0 8D      [10] 1470 	jp	00109$
                           1471 ;src/entities/entities.c:636: case es_disparado:	//Solo updateamos la bala si ha sido disparada
   8D56                    1472 00101$:
                           1473 ;src/entities/entities.c:638: if(bullet->frameCount >= bullet->frameLimit){
   8D56 0A            [ 7] 1474 	ld	a,(bc)
   8D57 DD 77 FF      [19] 1475 	ld	-1 (ix),a
   8D5A 69            [ 4] 1476 	ld	l, c
   8D5B 60            [ 4] 1477 	ld	h, b
   8D5C 23            [ 6] 1478 	inc	hl
   8D5D DD 7E FF      [19] 1479 	ld	a,-1 (ix)
   8D60 96            [ 7] 1480 	sub	a,(hl)
   8D61 38 61         [12] 1481 	jr	C,00105$
                           1482 ;src/entities/entities.c:639: bullet->ent.draw = SI;
   8D63 21 03 00      [10] 1483 	ld	hl,#0x0003
   8D66 09            [11] 1484 	add	hl,bc
   8D67 DD 75 FD      [19] 1485 	ld	-3 (ix),l
   8D6A DD 74 FE      [19] 1486 	ld	-2 (ix),h
   8D6D 21 0D 00      [10] 1487 	ld	hl,#0x000D
   8D70 09            [11] 1488 	add	hl,bc
   8D71 E3            [19] 1489 	ex	(sp), hl
   8D72 E1            [10] 1490 	pop	hl
   8D73 E5            [11] 1491 	push	hl
   8D74 36 01         [10] 1492 	ld	(hl),#0x01
                           1493 ;src/entities/entities.c:642: if(accion(&bullet->ent, es_mover, bullet->ent.curr_dir) != d_nothing){
   8D76 C5            [11] 1494 	push	bc
   8D77 FD E1         [14] 1495 	pop	iy
   8D79 FD 66 18      [19] 1496 	ld	h,24 (iy)
   8D7C C5            [11] 1497 	push	bc
   8D7D D5            [11] 1498 	push	de
   8D7E E5            [11] 1499 	push	hl
   8D7F 33            [ 6] 1500 	inc	sp
   8D80 3E 01         [ 7] 1501 	ld	a,#0x01
   8D82 F5            [11] 1502 	push	af
   8D83 33            [ 6] 1503 	inc	sp
   8D84 DD 6E FD      [19] 1504 	ld	l,-3 (ix)
   8D87 DD 66 FE      [19] 1505 	ld	h,-2 (ix)
   8D8A E5            [11] 1506 	push	hl
   8D8B CD DF 88      [17] 1507 	call	_accion
   8D8E F1            [10] 1508 	pop	af
   8D8F F1            [10] 1509 	pop	af
   8D90 D1            [10] 1510 	pop	de
   8D91 C1            [10] 1511 	pop	bc
   8D92 7D            [ 4] 1512 	ld	a,l
   8D93 D6 04         [ 7] 1513 	sub	a, #0x04
   8D95 28 29         [12] 1514 	jr	Z,00103$
                           1515 ;src/entities/entities.c:643: bullet->state = es_static;
   8D97 AF            [ 4] 1516 	xor	a, a
   8D98 12            [ 7] 1517 	ld	(de),a
                           1518 ;src/entities/entities.c:644: calculaEntity(&bullet->ent, SI);
   8D99 C5            [11] 1519 	push	bc
   8D9A 3E 01         [ 7] 1520 	ld	a,#0x01
   8D9C F5            [11] 1521 	push	af
   8D9D 33            [ 6] 1522 	inc	sp
   8D9E DD 6E FD      [19] 1523 	ld	l,-3 (ix)
   8DA1 DD 66 FE      [19] 1524 	ld	h,-2 (ix)
   8DA4 E5            [11] 1525 	push	hl
   8DA5 CD 6C 95      [17] 1526 	call	_calculaEntity
   8DA8 F1            [10] 1527 	pop	af
   8DA9 33            [ 6] 1528 	inc	sp
   8DAA DD 6E FD      [19] 1529 	ld	l,-3 (ix)
   8DAD DD 66 FE      [19] 1530 	ld	h,-2 (ix)
   8DB0 E5            [11] 1531 	push	hl
   8DB1 CD BA 94      [17] 1532 	call	_borrarEntity
   8DB4 F1            [10] 1533 	pop	af
   8DB5 C1            [10] 1534 	pop	bc
                           1535 ;src/entities/entities.c:646: bullet->ent.draw = NO;
   8DB6 E1            [10] 1536 	pop	hl
   8DB7 E5            [11] 1537 	push	hl
   8DB8 36 00         [10] 1538 	ld	(hl),#0x00
                           1539 ;src/entities/entities.c:647: bullet->ent.vivo = NO;
   8DBA 21 1E 00      [10] 1540 	ld	hl,#0x001E
   8DBD 09            [11] 1541 	add	hl,bc
   8DBE 36 00         [10] 1542 	ld	(hl),#0x00
   8DC0                    1543 00103$:
                           1544 ;src/entities/entities.c:650: bullet->frameCount = 0;
   8DC0 AF            [ 4] 1545 	xor	a, a
   8DC1 02            [ 7] 1546 	ld	(bc),a
   8DC2 18 0C         [12] 1547 	jr	00109$
   8DC4                    1548 00105$:
                           1549 ;src/entities/entities.c:652: bullet->frameCount++;
   8DC4 DD 7E FF      [19] 1550 	ld	a,-1 (ix)
   8DC7 3C            [ 4] 1551 	inc	a
   8DC8 02            [ 7] 1552 	ld	(bc),a
                           1553 ;src/entities/entities.c:654: break;
   8DC9 18 05         [12] 1554 	jr	00109$
                           1555 ;src/entities/entities.c:656: case es_explotando:
   8DCB                    1556 00107$:
                           1557 ;src/entities/entities.c:657: updateExplosion(bullet);
   8DCB C5            [11] 1558 	push	bc
   8DCC CD C0 64      [17] 1559 	call	_updateExplosion
   8DCF F1            [10] 1560 	pop	af
                           1561 ;src/entities/entities.c:659: }
   8DD0                    1562 00109$:
   8DD0 DD F9         [10] 1563 	ld	sp, ix
   8DD2 DD E1         [14] 1564 	pop	ix
   8DD4 C9            [10] 1565 	ret
                           1566 ;src/entities/entities.c:663: void playerHerido(TPlayer* player){
                           1567 ;	---------------------------------
                           1568 ; Function playerHerido
                           1569 ; ---------------------------------
   8DD5                    1570 _playerHerido::
   8DD5 DD E5         [15] 1571 	push	ix
   8DD7 DD 21 00 00   [14] 1572 	ld	ix,#0
   8DDB DD 39         [15] 1573 	add	ix,sp
                           1574 ;src/entities/entities.c:664: TBase* bases = getBases();
   8DDD CD D5 98      [17] 1575 	call	_getBases
   8DE0 4D            [ 4] 1576 	ld	c,l
   8DE1 44            [ 4] 1577 	ld	b,h
                           1578 ;src/entities/entities.c:665: player->vida--;
   8DE2 DD 5E 04      [19] 1579 	ld	e,4 (ix)
   8DE5 DD 56 05      [19] 1580 	ld	d,5 (ix)
   8DE8 21 49 00      [10] 1581 	ld	hl,#0x0049
   8DEB 19            [11] 1582 	add	hl,de
   8DEC 7E            [ 7] 1583 	ld	a,(hl)
   8DED C6 FF         [ 7] 1584 	add	a,#0xFF
   8DEF 77            [ 7] 1585 	ld	(hl),a
                           1586 ;src/entities/entities.c:666: player->ent.x = px_spawn;
   8DF0 21 26 00      [10] 1587 	ld	hl,#0x0026
   8DF3 19            [11] 1588 	add	hl,de
   8DF4 36 0A         [10] 1589 	ld	(hl),#0x0A
   8DF6 23            [ 6] 1590 	inc	hl
   8DF7 36 00         [10] 1591 	ld	(hl),#0x00
                           1592 ;src/entities/entities.c:667: player->ent.y = py_spawn;
   8DF9 21 28 00      [10] 1593 	ld	hl,#0x0028
   8DFC 19            [11] 1594 	add	hl,de
   8DFD 36 AA         [10] 1595 	ld	(hl),#0xAA
   8DFF 23            [ 6] 1596 	inc	hl
   8E00 36 00         [10] 1597 	ld	(hl),#0x00
                           1598 ;src/entities/entities.c:668: player->ent.draw = SI;
   8E02 21 30 00      [10] 1599 	ld	hl,#0x0030
   8E05 19            [11] 1600 	add	hl,de
   8E06 36 01         [10] 1601 	ld	(hl),#0x01
                           1602 ;src/entities/entities.c:669: mapaActual = 0;
   8E08 21 03 86      [10] 1603 	ld	hl,#_mapaActual + 0
   8E0B 36 00         [10] 1604 	ld	(hl), #0x00
                           1605 ;src/entities/entities.c:670: player->ent.cuadrante = 0;
   8E0D 21 42 00      [10] 1606 	ld	hl,#0x0042
   8E10 19            [11] 1607 	add	hl,de
   8E11 36 00         [10] 1608 	ld	(hl),#0x00
                           1609 ;src/entities/entities.c:671: mapa = mapas[0];
   8E13 21 4A 59      [10] 1610 	ld	hl, #_mapas + 0
   8E16 7E            [ 7] 1611 	ld	a,(hl)
   8E17 FD 21 01 86   [14] 1612 	ld	iy,#_mapa
   8E1B FD 77 00      [19] 1613 	ld	0 (iy),a
   8E1E 23            [ 6] 1614 	inc	hl
   8E1F 7E            [ 7] 1615 	ld	a,(hl)
   8E20 32 02 86      [13] 1616 	ld	(#_mapa + 1),a
                           1617 ;src/entities/entities.c:672: bases[mapaActual].ent.draw = SI;
   8E23 21 0E 00      [10] 1618 	ld	hl,#0x000E
   8E26 09            [11] 1619 	add	hl,bc
   8E27 36 01         [10] 1620 	ld	(hl),#0x01
                           1621 ;src/entities/entities.c:673: dibujarMapa();
   8E29 DD E1         [14] 1622 	pop	ix
   8E2B C3 6C 59      [10] 1623 	jp	_dibujarMapa
                           1624 ;src/entities/entities.c:676: void updateEntities(){
                           1625 ;	---------------------------------
                           1626 ; Function updateEntities
                           1627 ; ---------------------------------
   8E2E                    1628 _updateEntities::
                           1629 ;src/entities/entities.c:683: for(i=0;i<NUM_ENEMIGOS;++i){
   8E2E 0E 00         [ 7] 1630 	ld	c,#0x00
   8E30 11 00 00      [10] 1631 	ld	de,#0x0000
   8E33                    1632 00102$:
                           1633 ;src/entities/entities.c:686: updateBullet(&enemigos[i].bullet);
   8E33 21 03 87      [10] 1634 	ld	hl,#_enemigos
   8E36 19            [11] 1635 	add	hl,de
   8E37 C5            [11] 1636 	push	bc
   8E38 D5            [11] 1637 	push	de
   8E39 E5            [11] 1638 	push	hl
   8E3A CD 33 8D      [17] 1639 	call	_updateBullet
   8E3D F1            [10] 1640 	pop	af
   8E3E D1            [10] 1641 	pop	de
   8E3F C1            [10] 1642 	pop	bc
                           1643 ;src/entities/entities.c:683: for(i=0;i<NUM_ENEMIGOS;++i){
   8E40 21 4E 00      [10] 1644 	ld	hl,#0x004E
   8E43 19            [11] 1645 	add	hl,de
   8E44 EB            [ 4] 1646 	ex	de,hl
   8E45 0C            [ 4] 1647 	inc	c
   8E46 79            [ 4] 1648 	ld	a,c
   8E47 D6 03         [ 7] 1649 	sub	a, #0x03
   8E49 38 E8         [12] 1650 	jr	C,00102$
                           1651 ;src/entities/entities.c:694: updateIA();
   8E4B C3 9F 8E      [10] 1652 	jp  _updateIA
                           1653 ;src/entities/entities.c:696: u8 contarEnemigos(){
                           1654 ;	---------------------------------
                           1655 ; Function contarEnemigos
                           1656 ; ---------------------------------
   8E4E                    1657 _contarEnemigos::
   8E4E DD E5         [15] 1658 	push	ix
   8E50 DD 21 00 00   [14] 1659 	ld	ix,#0
   8E54 DD 39         [15] 1660 	add	ix,sp
   8E56 F5            [11] 1661 	push	af
   8E57 3B            [ 6] 1662 	dec	sp
                           1663 ;src/entities/entities.c:699: for(i=0;i<NUM_ENEMIGOS;++i){
   8E58 DD 36 FE 00   [19] 1664 	ld	-2 (ix),#0x00
   8E5C DD 36 FD 00   [19] 1665 	ld	-3 (ix),#0x00
   8E60 01 00 00      [10] 1666 	ld	bc,#0x0000
   8E63                    1667 00105$:
                           1668 ;src/entities/entities.c:700: if(enemigos[i].ent.cuadrante == mapaActual && enemigos[i].ent.vivo == 1){
   8E63 21 03 87      [10] 1669 	ld	hl,#_enemigos
   8E66 09            [11] 1670 	add	hl,bc
   8E67 5D            [ 4] 1671 	ld	e,l
   8E68 54            [ 4] 1672 	ld	d,h
   8E69 C5            [11] 1673 	push	bc
   8E6A 01 42 00      [10] 1674 	ld	bc, #0x0042
   8E6D 09            [11] 1675 	add	hl, bc
   8E6E C1            [10] 1676 	pop	bc
   8E6F 7E            [ 7] 1677 	ld	a,(hl)
   8E70 DD 77 FF      [19] 1678 	ld	-1 (ix),a
   8E73 3A 03 86      [13] 1679 	ld	a,(#_mapaActual + 0)
   8E76 DD 96 FF      [19] 1680 	sub	a, -1 (ix)
   8E79 20 0C         [12] 1681 	jr	NZ,00106$
   8E7B D5            [11] 1682 	push	de
   8E7C FD E1         [14] 1683 	pop	iy
   8E7E FD 5E 41      [19] 1684 	ld	e,65 (iy)
   8E81 1D            [ 4] 1685 	dec	e
   8E82 20 03         [12] 1686 	jr	NZ,00106$
                           1687 ;src/entities/entities.c:701: cuenta++;
   8E84 DD 34 FE      [23] 1688 	inc	-2 (ix)
   8E87                    1689 00106$:
                           1690 ;src/entities/entities.c:699: for(i=0;i<NUM_ENEMIGOS;++i){
   8E87 21 4E 00      [10] 1691 	ld	hl,#0x004E
   8E8A 09            [11] 1692 	add	hl,bc
   8E8B 4D            [ 4] 1693 	ld	c,l
   8E8C 44            [ 4] 1694 	ld	b,h
   8E8D DD 34 FD      [23] 1695 	inc	-3 (ix)
   8E90 DD 7E FD      [19] 1696 	ld	a,-3 (ix)
   8E93 D6 03         [ 7] 1697 	sub	a, #0x03
   8E95 38 CC         [12] 1698 	jr	C,00105$
                           1699 ;src/entities/entities.c:704: return cuenta;
   8E97 DD 6E FE      [19] 1700 	ld	l,-2 (ix)
   8E9A DD F9         [10] 1701 	ld	sp, ix
   8E9C DD E1         [14] 1702 	pop	ix
   8E9E C9            [10] 1703 	ret
                           1704 ;src/entities/entities.c:707: void updateIA(){
                           1705 ;	---------------------------------
                           1706 ; Function updateIA
                           1707 ; ---------------------------------
   8E9F                    1708 _updateIA::
   8E9F DD E5         [15] 1709 	push	ix
   8EA1 DD 21 00 00   [14] 1710 	ld	ix,#0
   8EA5 DD 39         [15] 1711 	add	ix,sp
   8EA7 F5            [11] 1712 	push	af
                           1713 ;src/entities/entities.c:713: for(i=0;i<NUM_ENEMIGOS;++i){
   8EA8 DD 36 FE 00   [19] 1714 	ld	-2 (ix),#0x00
   8EAC 01 00 00      [10] 1715 	ld	bc,#0x0000
   8EAF                    1716 00105$:
                           1717 ;src/entities/entities.c:716: if(enemigos[i].ent.cuadrante == mapaActual && enemigos[i].ent.vivo){
   8EAF 21 03 87      [10] 1718 	ld	hl,#_enemigos
   8EB2 09            [11] 1719 	add	hl,bc
   8EB3 EB            [ 4] 1720 	ex	de,hl
   8EB4 D5            [11] 1721 	push	de
   8EB5 FD E1         [14] 1722 	pop	iy
   8EB7 FD 7E 42      [19] 1723 	ld	a,66 (iy)
   8EBA DD 77 FF      [19] 1724 	ld	-1 (ix),a
   8EBD 3A 03 86      [13] 1725 	ld	a,(#_mapaActual + 0)
   8EC0 DD 96 FF      [19] 1726 	sub	a, -1 (ix)
   8EC3 20 10         [12] 1727 	jr	NZ,00106$
   8EC5 D5            [11] 1728 	push	de
   8EC6 FD E1         [14] 1729 	pop	iy
   8EC8 FD 7E 41      [19] 1730 	ld	a,65 (iy)
   8ECB B7            [ 4] 1731 	or	a, a
   8ECC 28 07         [12] 1732 	jr	Z,00106$
                           1733 ;src/entities/entities.c:718: updateIAState(&enemigos[i]);
   8ECE C5            [11] 1734 	push	bc
   8ECF D5            [11] 1735 	push	de
   8ED0 CD D4 90      [17] 1736 	call	_updateIAState
   8ED3 F1            [10] 1737 	pop	af
   8ED4 C1            [10] 1738 	pop	bc
   8ED5                    1739 00106$:
                           1740 ;src/entities/entities.c:713: for(i=0;i<NUM_ENEMIGOS;++i){
   8ED5 21 4E 00      [10] 1741 	ld	hl,#0x004E
   8ED8 09            [11] 1742 	add	hl,bc
   8ED9 4D            [ 4] 1743 	ld	c,l
   8EDA 44            [ 4] 1744 	ld	b,h
   8EDB DD 34 FE      [23] 1745 	inc	-2 (ix)
   8EDE DD 7E FE      [19] 1746 	ld	a,-2 (ix)
   8EE1 D6 03         [ 7] 1747 	sub	a, #0x03
   8EE3 38 CA         [12] 1748 	jr	C,00105$
   8EE5 DD F9         [10] 1749 	ld	sp, ix
   8EE7 DD E1         [14] 1750 	pop	ix
   8EE9 C9            [10] 1751 	ret
                           1752 ;src/entities/entities.c:727: TPlayerDirection comprobarEjeX(TEnemy* ene){
                           1753 ;	---------------------------------
                           1754 ; Function comprobarEjeX
                           1755 ; ---------------------------------
   8EEA                    1756 _comprobarEjeX::
   8EEA DD E5         [15] 1757 	push	ix
   8EEC DD 21 00 00   [14] 1758 	ld	ix,#0
   8EF0 DD 39         [15] 1759 	add	ix,sp
                           1760 ;src/entities/entities.c:730: if(ene->ent.x > puntos[ene->puntoDeControl].x){	//Si se cumple movemos hacia la izquierda
   8EF2 DD 4E 04      [19] 1761 	ld	c,4 (ix)
   8EF5 DD 46 05      [19] 1762 	ld	b,5 (ix)
   8EF8 69            [ 4] 1763 	ld	l, c
   8EF9 60            [ 4] 1764 	ld	h, b
   8EFA 11 26 00      [10] 1765 	ld	de, #0x0026
   8EFD 19            [11] 1766 	add	hl, de
   8EFE 5E            [ 7] 1767 	ld	e,(hl)
   8EFF 23            [ 6] 1768 	inc	hl
   8F00 56            [ 7] 1769 	ld	d,(hl)
   8F01 69            [ 4] 1770 	ld	l, c
   8F02 60            [ 4] 1771 	ld	h, b
   8F03 01 4D 00      [10] 1772 	ld	bc, #0x004D
   8F06 09            [11] 1773 	add	hl, bc
   8F07 6E            [ 7] 1774 	ld	l,(hl)
   8F08 26 00         [ 7] 1775 	ld	h,#0x00
   8F0A 29            [11] 1776 	add	hl, hl
   8F0B 01 D7 88      [10] 1777 	ld	bc,#_puntos
   8F0E 09            [11] 1778 	add	hl,bc
   8F0F 4E            [ 7] 1779 	ld	c,(hl)
   8F10 06 00         [ 7] 1780 	ld	b,#0x00
   8F12 79            [ 4] 1781 	ld	a,c
   8F13 93            [ 4] 1782 	sub	a, e
   8F14 78            [ 4] 1783 	ld	a,b
   8F15 9A            [ 4] 1784 	sbc	a, d
   8F16 E2 1B 8F      [10] 1785 	jp	PO, 00110$
   8F19 EE 80         [ 7] 1786 	xor	a, #0x80
   8F1B                    1787 00110$:
   8F1B F2 22 8F      [10] 1788 	jp	P,00102$
                           1789 ;src/entities/entities.c:731: dir = d_left;
   8F1E 2E 03         [ 7] 1790 	ld	l,#0x03
   8F20 18 02         [12] 1791 	jr	00103$
   8F22                    1792 00102$:
                           1793 ;src/entities/entities.c:733: dir = d_right;
   8F22 2E 01         [ 7] 1794 	ld	l,#0x01
   8F24                    1795 00103$:
                           1796 ;src/entities/entities.c:736: return dir;
   8F24 DD E1         [14] 1797 	pop	ix
   8F26 C9            [10] 1798 	ret
                           1799 ;src/entities/entities.c:738: TPlayerDirection comprobarEjeY(TEnemy* ene){
                           1800 ;	---------------------------------
                           1801 ; Function comprobarEjeY
                           1802 ; ---------------------------------
   8F27                    1803 _comprobarEjeY::
   8F27 DD E5         [15] 1804 	push	ix
   8F29 DD 21 00 00   [14] 1805 	ld	ix,#0
   8F2D DD 39         [15] 1806 	add	ix,sp
                           1807 ;src/entities/entities.c:741: if(ene->ent.y > puntos[ene->puntoDeControl].y){	//Si se cumple movemos hacia la derecha
   8F2F DD 4E 04      [19] 1808 	ld	c,4 (ix)
   8F32 DD 46 05      [19] 1809 	ld	b,5 (ix)
   8F35 69            [ 4] 1810 	ld	l, c
   8F36 60            [ 4] 1811 	ld	h, b
   8F37 11 28 00      [10] 1812 	ld	de, #0x0028
   8F3A 19            [11] 1813 	add	hl, de
   8F3B 5E            [ 7] 1814 	ld	e,(hl)
   8F3C 23            [ 6] 1815 	inc	hl
   8F3D 56            [ 7] 1816 	ld	d,(hl)
   8F3E 69            [ 4] 1817 	ld	l, c
   8F3F 60            [ 4] 1818 	ld	h, b
   8F40 01 4D 00      [10] 1819 	ld	bc, #0x004D
   8F43 09            [11] 1820 	add	hl, bc
   8F44 6E            [ 7] 1821 	ld	l,(hl)
   8F45 26 00         [ 7] 1822 	ld	h,#0x00
   8F47 29            [11] 1823 	add	hl, hl
   8F48 01 D7 88      [10] 1824 	ld	bc,#_puntos
   8F4B 09            [11] 1825 	add	hl,bc
   8F4C 23            [ 6] 1826 	inc	hl
   8F4D 4E            [ 7] 1827 	ld	c,(hl)
   8F4E 06 00         [ 7] 1828 	ld	b,#0x00
   8F50 79            [ 4] 1829 	ld	a,c
   8F51 93            [ 4] 1830 	sub	a, e
   8F52 78            [ 4] 1831 	ld	a,b
   8F53 9A            [ 4] 1832 	sbc	a, d
   8F54 E2 59 8F      [10] 1833 	jp	PO, 00110$
   8F57 EE 80         [ 7] 1834 	xor	a, #0x80
   8F59                    1835 00110$:
   8F59 F2 60 8F      [10] 1836 	jp	P,00102$
                           1837 ;src/entities/entities.c:742: dir = d_up;
   8F5C 2E 00         [ 7] 1838 	ld	l,#0x00
   8F5E 18 02         [12] 1839 	jr	00103$
   8F60                    1840 00102$:
                           1841 ;src/entities/entities.c:744: dir = d_down;
   8F60 2E 02         [ 7] 1842 	ld	l,#0x02
   8F62                    1843 00103$:
                           1844 ;src/entities/entities.c:747: return dir;
   8F62 DD E1         [14] 1845 	pop	ix
   8F64 C9            [10] 1846 	ret
                           1847 ;src/entities/entities.c:749: u8 moverHaciaPuntoDeControl(TEnemy* ene){
                           1848 ;	---------------------------------
                           1849 ; Function moverHaciaPuntoDeControl
                           1850 ; ---------------------------------
   8F65                    1851 _moverHaciaPuntoDeControl::
   8F65 DD E5         [15] 1852 	push	ix
   8F67 DD 21 00 00   [14] 1853 	ld	ix,#0
   8F6B DD 39         [15] 1854 	add	ix,sp
   8F6D 21 F6 FF      [10] 1855 	ld	hl,#-10
   8F70 39            [11] 1856 	add	hl,sp
   8F71 F9            [ 6] 1857 	ld	sp,hl
                           1858 ;src/entities/entities.c:752: u8 llego = NO;
   8F72 DD 36 F6 00   [19] 1859 	ld	-10 (ix),#0x00
                           1860 ;src/entities/entities.c:753: if(++ene->cycles >= ene->wait_cycles){
   8F76 DD 4E 04      [19] 1861 	ld	c,4 (ix)
   8F79 DD 46 05      [19] 1862 	ld	b,5 (ix)
   8F7C 21 4A 00      [10] 1863 	ld	hl,#0x004A
   8F7F 09            [11] 1864 	add	hl,bc
   8F80 DD 75 FC      [19] 1865 	ld	-4 (ix),l
   8F83 DD 74 FD      [19] 1866 	ld	-3 (ix),h
   8F86 DD 6E FC      [19] 1867 	ld	l,-4 (ix)
   8F89 DD 66 FD      [19] 1868 	ld	h,-3 (ix)
   8F8C 5E            [ 7] 1869 	ld	e,(hl)
   8F8D 1C            [ 4] 1870 	inc	e
   8F8E DD 6E FC      [19] 1871 	ld	l,-4 (ix)
   8F91 DD 66 FD      [19] 1872 	ld	h,-3 (ix)
   8F94 73            [ 7] 1873 	ld	(hl),e
   8F95 69            [ 4] 1874 	ld	l, c
   8F96 60            [ 4] 1875 	ld	h, b
   8F97 C5            [11] 1876 	push	bc
   8F98 01 4B 00      [10] 1877 	ld	bc, #0x004B
   8F9B 09            [11] 1878 	add	hl, bc
   8F9C C1            [10] 1879 	pop	bc
   8F9D 56            [ 7] 1880 	ld	d,(hl)
                           1881 ;src/entities/entities.c:756: diff = abs(ene->ent.x - puntos[ene->puntoDeControl].x);	
   8F9E 21 26 00      [10] 1882 	ld	hl,#0x0026
   8FA1 09            [11] 1883 	add	hl,bc
   8FA2 DD 75 F9      [19] 1884 	ld	-7 (ix),l
   8FA5 DD 74 FA      [19] 1885 	ld	-6 (ix),h
                           1886 ;src/entities/entities.c:764: ene->ent.curr_dir = dir;
   8FA8 21 3B 00      [10] 1887 	ld	hl,#0x003B
   8FAB 09            [11] 1888 	add	hl,bc
   8FAC DD 75 F7      [19] 1889 	ld	-9 (ix),l
   8FAF DD 74 F8      [19] 1890 	ld	-8 (ix),h
                           1891 ;src/entities/entities.c:753: if(++ene->cycles >= ene->wait_cycles){
   8FB2 7B            [ 4] 1892 	ld	a,e
   8FB3 92            [ 4] 1893 	sub	a, d
   8FB4 DA 57 90      [10] 1894 	jp	C,00106$
                           1895 ;src/entities/entities.c:754: dir = comprobarEjeX(ene);
   8FB7 C5            [11] 1896 	push	bc
   8FB8 C5            [11] 1897 	push	bc
   8FB9 CD EA 8E      [17] 1898 	call	_comprobarEjeX
   8FBC F1            [10] 1899 	pop	af
   8FBD C1            [10] 1900 	pop	bc
   8FBE DD 75 FB      [19] 1901 	ld	-5 (ix),l
                           1902 ;src/entities/entities.c:756: diff = abs(ene->ent.x - puntos[ene->puntoDeControl].x);	
   8FC1 DD 6E F9      [19] 1903 	ld	l,-7 (ix)
   8FC4 DD 66 FA      [19] 1904 	ld	h,-6 (ix)
   8FC7 7E            [ 7] 1905 	ld	a,(hl)
   8FC8 DD 77 FE      [19] 1906 	ld	-2 (ix),a
   8FCB 23            [ 6] 1907 	inc	hl
   8FCC 7E            [ 7] 1908 	ld	a,(hl)
   8FCD DD 77 FF      [19] 1909 	ld	-1 (ix),a
   8FD0 21 4D 00      [10] 1910 	ld	hl,#0x004D
   8FD3 09            [11] 1911 	add	hl,bc
   8FD4 EB            [ 4] 1912 	ex	de,hl
   8FD5 1A            [ 7] 1913 	ld	a,(de)
   8FD6 6F            [ 4] 1914 	ld	l,a
   8FD7 26 00         [ 7] 1915 	ld	h,#0x00
   8FD9 29            [11] 1916 	add	hl, hl
   8FDA 3E D7         [ 7] 1917 	ld	a,#<(_puntos)
   8FDC 85            [ 4] 1918 	add	a, l
   8FDD 6F            [ 4] 1919 	ld	l,a
   8FDE 3E 88         [ 7] 1920 	ld	a,#>(_puntos)
   8FE0 8C            [ 4] 1921 	adc	a, h
   8FE1 67            [ 4] 1922 	ld	h,a
   8FE2 6E            [ 7] 1923 	ld	l,(hl)
   8FE3 26 00         [ 7] 1924 	ld	h,#0x00
   8FE5 DD 7E FE      [19] 1925 	ld	a,-2 (ix)
   8FE8 95            [ 4] 1926 	sub	a, l
   8FE9 6F            [ 4] 1927 	ld	l,a
   8FEA DD 7E FF      [19] 1928 	ld	a,-1 (ix)
   8FED 9C            [ 4] 1929 	sbc	a, h
   8FEE 67            [ 4] 1930 	ld	h,a
   8FEF C5            [11] 1931 	push	bc
   8FF0 D5            [11] 1932 	push	de
   8FF1 E5            [11] 1933 	push	hl
   8FF2 CD 78 90      [17] 1934 	call	_abs
   8FF5 F1            [10] 1935 	pop	af
   8FF6 D1            [10] 1936 	pop	de
   8FF7 C1            [10] 1937 	pop	bc
                           1938 ;src/entities/entities.c:757: if(diff <= 2){
   8FF8 3E 02         [ 7] 1939 	ld	a,#0x02
   8FFA BD            [ 4] 1940 	cp	a, l
   8FFB 3E 00         [ 7] 1941 	ld	a,#0x00
   8FFD 9C            [ 4] 1942 	sbc	a, h
   8FFE E2 03 90      [10] 1943 	jp	PO, 00121$
   9001 EE 80         [ 7] 1944 	xor	a, #0x80
   9003                    1945 00121$:
   9003 FA 45 90      [10] 1946 	jp	M,00104$
                           1947 ;src/entities/entities.c:758: dir = comprobarEjeY(ene);
   9006 C5            [11] 1948 	push	bc
   9007 D5            [11] 1949 	push	de
   9008 C5            [11] 1950 	push	bc
   9009 CD 27 8F      [17] 1951 	call	_comprobarEjeY
   900C F1            [10] 1952 	pop	af
   900D D1            [10] 1953 	pop	de
   900E C1            [10] 1954 	pop	bc
   900F DD 75 FB      [19] 1955 	ld	-5 (ix),l
                           1956 ;src/entities/entities.c:759: diff = abs(ene->ent.y - puntos[ene->puntoDeControl].y);	
   9012 69            [ 4] 1957 	ld	l, c
   9013 60            [ 4] 1958 	ld	h, b
   9014 01 28 00      [10] 1959 	ld	bc, #0x0028
   9017 09            [11] 1960 	add	hl, bc
   9018 4E            [ 7] 1961 	ld	c,(hl)
   9019 23            [ 6] 1962 	inc	hl
   901A 46            [ 7] 1963 	ld	b,(hl)
   901B 1A            [ 7] 1964 	ld	a,(de)
   901C 6F            [ 4] 1965 	ld	l,a
   901D 26 00         [ 7] 1966 	ld	h,#0x00
   901F 29            [11] 1967 	add	hl, hl
   9020 11 D7 88      [10] 1968 	ld	de,#_puntos
   9023 19            [11] 1969 	add	hl,de
   9024 23            [ 6] 1970 	inc	hl
   9025 5E            [ 7] 1971 	ld	e,(hl)
   9026 16 00         [ 7] 1972 	ld	d,#0x00
   9028 79            [ 4] 1973 	ld	a,c
   9029 93            [ 4] 1974 	sub	a, e
   902A 4F            [ 4] 1975 	ld	c,a
   902B 78            [ 4] 1976 	ld	a,b
   902C 9A            [ 4] 1977 	sbc	a, d
   902D 47            [ 4] 1978 	ld	b,a
   902E C5            [11] 1979 	push	bc
   902F CD 78 90      [17] 1980 	call	_abs
   9032 F1            [10] 1981 	pop	af
                           1982 ;src/entities/entities.c:760: if(diff <= 2){
   9033 3E 02         [ 7] 1983 	ld	a,#0x02
   9035 BD            [ 4] 1984 	cp	a, l
   9036 3E 00         [ 7] 1985 	ld	a,#0x00
   9038 9C            [ 4] 1986 	sbc	a, h
   9039 E2 3E 90      [10] 1987 	jp	PO, 00122$
   903C EE 80         [ 7] 1988 	xor	a, #0x80
   903E                    1989 00122$:
   903E FA 45 90      [10] 1990 	jp	M,00104$
                           1991 ;src/entities/entities.c:761: llego = SI;
   9041 DD 36 F6 01   [19] 1992 	ld	-10 (ix),#0x01
   9045                    1993 00104$:
                           1994 ;src/entities/entities.c:764: ene->ent.curr_dir = dir;
   9045 DD 6E F7      [19] 1995 	ld	l,-9 (ix)
   9048 DD 66 F8      [19] 1996 	ld	h,-8 (ix)
   904B DD 7E FB      [19] 1997 	ld	a,-5 (ix)
   904E 77            [ 7] 1998 	ld	(hl),a
                           1999 ;src/entities/entities.c:765: ene->cycles = 0; //Reseteamos el ciclo actual de espera
   904F DD 6E FC      [19] 2000 	ld	l,-4 (ix)
   9052 DD 66 FD      [19] 2001 	ld	h,-3 (ix)
   9055 36 00         [10] 2002 	ld	(hl),#0x00
   9057                    2003 00106$:
                           2004 ;src/entities/entities.c:768: accion(&ene->ent, es_mover, ene->ent.curr_dir);
   9057 DD 6E F7      [19] 2005 	ld	l,-9 (ix)
   905A DD 66 F8      [19] 2006 	ld	h,-8 (ix)
   905D 46            [ 7] 2007 	ld	b,(hl)
   905E C5            [11] 2008 	push	bc
   905F 33            [ 6] 2009 	inc	sp
   9060 3E 01         [ 7] 2010 	ld	a,#0x01
   9062 F5            [11] 2011 	push	af
   9063 33            [ 6] 2012 	inc	sp
   9064 DD 6E F9      [19] 2013 	ld	l,-7 (ix)
   9067 DD 66 FA      [19] 2014 	ld	h,-6 (ix)
   906A E5            [11] 2015 	push	hl
   906B CD DF 88      [17] 2016 	call	_accion
   906E F1            [10] 2017 	pop	af
   906F F1            [10] 2018 	pop	af
                           2019 ;src/entities/entities.c:770: return llego;
   9070 DD 6E F6      [19] 2020 	ld	l,-10 (ix)
   9073 DD F9         [10] 2021 	ld	sp, ix
   9075 DD E1         [14] 2022 	pop	ix
   9077 C9            [10] 2023 	ret
                           2024 ;src/entities/entities.c:772: i16 abs(i16 num){
                           2025 ;	---------------------------------
                           2026 ; Function abs
                           2027 ; ---------------------------------
   9078                    2028 _abs::
                           2029 ;src/entities/entities.c:775: if(num<0){
   9078 FD 21 02 00   [14] 2030 	ld	iy,#2
   907C FD 39         [15] 2031 	add	iy,sp
   907E FD CB 01 7E   [20] 2032 	bit	7,1 (iy)
   9082 28 0C         [12] 2033 	jr	Z,00102$
                           2034 ;src/entities/entities.c:776: numPositivo -= num;
   9084 AF            [ 4] 2035 	xor	a, a
   9085 FD 96 00      [19] 2036 	sub	a, 0 (iy)
   9088 6F            [ 4] 2037 	ld	l,a
   9089 3E 00         [ 7] 2038 	ld	a, #0x00
   908B FD 9E 01      [19] 2039 	sbc	a, 1 (iy)
   908E 67            [ 4] 2040 	ld	h,a
   908F C9            [10] 2041 	ret
   9090                    2042 00102$:
                           2043 ;src/entities/entities.c:778: numPositivo=num;
   9090 C1            [10] 2044 	pop	bc
   9091 E1            [10] 2045 	pop	hl
   9092 E5            [11] 2046 	push	hl
   9093 C5            [11] 2047 	push	bc
                           2048 ;src/entities/entities.c:781: return numPositivo;
   9094 C9            [10] 2049 	ret
                           2050 ;src/entities/entities.c:784: TPlayerDirection calculaDireccion(){
                           2051 ;	---------------------------------
                           2052 ; Function calculaDireccion
                           2053 ; ---------------------------------
   9095                    2054 _calculaDireccion::
   9095 3B            [ 6] 2055 	dec	sp
                           2056 ;src/entities/entities.c:786: switch(mapaActual){
   9096 3E 05         [ 7] 2057 	ld	a,#0x05
   9098 FD 21 03 86   [14] 2058 	ld	iy,#_mapaActual
   909C FD 96 00      [19] 2059 	sub	a, 0 (iy)
   909F 38 31         [12] 2060 	jr	C,00107$
   90A1 FD 21 03 86   [14] 2061 	ld	iy,#_mapaActual
   90A5 FD 5E 00      [19] 2062 	ld	e,0 (iy)
   90A8 16 00         [ 7] 2063 	ld	d,#0x00
   90AA 21 B0 90      [10] 2064 	ld	hl,#00114$
   90AD 19            [11] 2065 	add	hl,de
   90AE 19            [11] 2066 	add	hl,de
                           2067 ;src/entities/entities.c:787: case 0:
   90AF E9            [ 4] 2068 	jp	(hl)
   90B0                    2069 00114$:
   90B0 18 0A         [12] 2070 	jr	00101$
   90B2 18 0C         [12] 2071 	jr	00102$
   90B4 18 0E         [12] 2072 	jr	00103$
   90B6 18 10         [12] 2073 	jr	00104$
   90B8 18 12         [12] 2074 	jr	00105$
   90BA 18 14         [12] 2075 	jr	00106$
   90BC                    2076 00101$:
                           2077 ;src/entities/entities.c:788: dir = d_right;
   90BC 2E 01         [ 7] 2078 	ld	l,#0x01
                           2079 ;src/entities/entities.c:789: break;
   90BE 18 12         [12] 2080 	jr	00107$
                           2081 ;src/entities/entities.c:790: case 1:
   90C0                    2082 00102$:
                           2083 ;src/entities/entities.c:791: dir = d_up;
   90C0 2E 00         [ 7] 2084 	ld	l,#0x00
                           2085 ;src/entities/entities.c:792: break;
   90C2 18 0E         [12] 2086 	jr	00107$
                           2087 ;src/entities/entities.c:793: case 2:
   90C4                    2088 00103$:
                           2089 ;src/entities/entities.c:794: dir = d_right;
   90C4 2E 01         [ 7] 2090 	ld	l,#0x01
                           2091 ;src/entities/entities.c:795: break;
   90C6 18 0A         [12] 2092 	jr	00107$
                           2093 ;src/entities/entities.c:796: case 3:
   90C8                    2094 00104$:
                           2095 ;src/entities/entities.c:797: dir = d_up;
   90C8 2E 00         [ 7] 2096 	ld	l,#0x00
                           2097 ;src/entities/entities.c:798: break;
   90CA 18 06         [12] 2098 	jr	00107$
                           2099 ;src/entities/entities.c:799: case 4:
   90CC                    2100 00105$:
                           2101 ;src/entities/entities.c:800: dir = d_down;
   90CC 2E 02         [ 7] 2102 	ld	l,#0x02
                           2103 ;src/entities/entities.c:801: break;
   90CE 18 02         [12] 2104 	jr	00107$
                           2105 ;src/entities/entities.c:802: case 5:
   90D0                    2106 00106$:
                           2107 ;src/entities/entities.c:803: dir = d_down;
   90D0 2E 02         [ 7] 2108 	ld	l,#0x02
                           2109 ;src/entities/entities.c:805: }
   90D2                    2110 00107$:
                           2111 ;src/entities/entities.c:806: return dir;
   90D2 33            [ 6] 2112 	inc	sp
   90D3 C9            [10] 2113 	ret
                           2114 ;src/entities/entities.c:809: void updateIAState(TEnemy* ene){
                           2115 ;	---------------------------------
                           2116 ; Function updateIAState
                           2117 ; ---------------------------------
   90D4                    2118 _updateIAState::
   90D4 DD E5         [15] 2119 	push	ix
   90D6 DD 21 00 00   [14] 2120 	ld	ix,#0
   90DA DD 39         [15] 2121 	add	ix,sp
   90DC 21 F6 FF      [10] 2122 	ld	hl,#-10
   90DF 39            [11] 2123 	add	hl,sp
   90E0 F9            [ 6] 2124 	ld	sp,hl
                           2125 ;src/entities/entities.c:810: TPlayer* p = &player;
                           2126 ;src/entities/entities.c:811: TCoord* c = &puntos[0];
                           2127 ;src/entities/entities.c:812: TBase* bases = getBases();
   90E1 CD D5 98      [17] 2128 	call	_getBases
   90E4 DD 75 F7      [19] 2129 	ld	-9 (ix),l
   90E7 DD 74 F8      [19] 2130 	ld	-8 (ix),h
                           2131 ;src/entities/entities.c:814: switch(ene->statusIA){
   90EA DD 7E 04      [19] 2132 	ld	a,4 (ix)
   90ED DD 77 FB      [19] 2133 	ld	-5 (ix),a
   90F0 DD 7E 05      [19] 2134 	ld	a,5 (ix)
   90F3 DD 77 FC      [19] 2135 	ld	-4 (ix),a
   90F6 DD 7E FB      [19] 2136 	ld	a,-5 (ix)
   90F9 C6 49         [ 7] 2137 	add	a, #0x49
   90FB DD 77 F9      [19] 2138 	ld	-7 (ix),a
   90FE DD 7E FC      [19] 2139 	ld	a,-4 (ix)
   9101 CE 00         [ 7] 2140 	adc	a, #0x00
   9103 DD 77 FA      [19] 2141 	ld	-6 (ix),a
   9106 DD 6E F9      [19] 2142 	ld	l,-7 (ix)
   9109 DD 66 FA      [19] 2143 	ld	h,-6 (ix)
   910C 7E            [ 7] 2144 	ld	a,(hl)
   910D DD 77 FF      [19] 2145 	ld	-1 (ix), a
   9110 B7            [ 4] 2146 	or	a, a
   9111 28 0B         [12] 2147 	jr	Z,00101$
   9113 DD 7E FF      [19] 2148 	ld	a,-1 (ix)
   9116 D6 03         [ 7] 2149 	sub	a, #0x03
   9118 CA AE 91      [10] 2150 	jp	Z,00110$
   911B C3 9A 92      [10] 2151 	jp	00122$
                           2152 ;src/entities/entities.c:815: case s_mover:
   911E                    2153 00101$:
                           2154 ;src/entities/entities.c:818: if(basesCapturadas >= 5 && contarEnemigos() == 1 && count == 0){
   911E 3A 06 86      [13] 2155 	ld	a,(#_basesCapturadas + 0)
   9121 D6 05         [ 7] 2156 	sub	a, #0x05
   9123 38 1B         [12] 2157 	jr	C,00103$
   9125 CD 4E 8E      [17] 2158 	call	_contarEnemigos
   9128 2D            [ 4] 2159 	dec	l
   9129 20 15         [12] 2160 	jr	NZ,00103$
   912B 3A 09 86      [13] 2161 	ld	a,(#_count + 0)
   912E B7            [ 4] 2162 	or	a, a
   912F 20 0F         [12] 2163 	jr	NZ,00103$
                           2164 ;src/entities/entities.c:819: ene->statusIA = s_huir;
   9131 DD 6E F9      [19] 2165 	ld	l,-7 (ix)
   9134 DD 66 FA      [19] 2166 	ld	h,-6 (ix)
   9137 36 03         [10] 2167 	ld	(hl),#0x03
                           2168 ;src/entities/entities.c:820: count++;
   9139 21 09 86      [10] 2169 	ld	hl, #_count+0
   913C 34            [11] 2170 	inc	(hl)
                           2171 ;src/entities/entities.c:821: break;		//Salimos
   913D C3 9A 92      [10] 2172 	jp	00122$
   9140                    2173 00103$:
                           2174 ;src/entities/entities.c:824: if(moverHaciaPuntoDeControl(ene))	//si devuelve true es que ha llegado al siguiente
   9140 DD 6E FB      [19] 2175 	ld	l,-5 (ix)
   9143 DD 66 FC      [19] 2176 	ld	h,-4 (ix)
   9146 E5            [11] 2177 	push	hl
   9147 CD 65 8F      [17] 2178 	call	_moverHaciaPuntoDeControl
   914A F1            [10] 2179 	pop	af
   914B DD 75 FF      [19] 2180 	ld	-1 (ix),l
                           2181 ;src/entities/entities.c:825: ene->puntoDeControl++;			//punto de control por lo que ahora cambia de destino
   914E DD 7E FB      [19] 2182 	ld	a,-5 (ix)
   9151 C6 4D         [ 7] 2183 	add	a, #0x4D
   9153 DD 77 F9      [19] 2184 	ld	-7 (ix),a
   9156 DD 7E FC      [19] 2185 	ld	a,-4 (ix)
   9159 CE 00         [ 7] 2186 	adc	a, #0x00
   915B DD 77 FA      [19] 2187 	ld	-6 (ix),a
                           2188 ;src/entities/entities.c:824: if(moverHaciaPuntoDeControl(ene))	//si devuelve true es que ha llegado al siguiente
   915E DD 7E FF      [19] 2189 	ld	a,-1 (ix)
   9161 B7            [ 4] 2190 	or	a, a
   9162 28 13         [12] 2191 	jr	Z,00107$
                           2192 ;src/entities/entities.c:825: ene->puntoDeControl++;			//punto de control por lo que ahora cambia de destino
   9164 DD 6E F9      [19] 2193 	ld	l,-7 (ix)
   9167 DD 66 FA      [19] 2194 	ld	h,-6 (ix)
   916A 7E            [ 7] 2195 	ld	a,(hl)
   916B DD 77 FF      [19] 2196 	ld	-1 (ix), a
   916E 4F            [ 4] 2197 	ld	c, a
   916F 0C            [ 4] 2198 	inc	c
   9170 DD 6E F9      [19] 2199 	ld	l,-7 (ix)
   9173 DD 66 FA      [19] 2200 	ld	h,-6 (ix)
   9176 71            [ 7] 2201 	ld	(hl),c
   9177                    2202 00107$:
                           2203 ;src/entities/entities.c:826: if(ene->puntoDeControl > 3){
   9177 DD 6E F9      [19] 2204 	ld	l,-7 (ix)
   917A DD 66 FA      [19] 2205 	ld	h,-6 (ix)
   917D 4E            [ 7] 2206 	ld	c,(hl)
   917E 3E 03         [ 7] 2207 	ld	a,#0x03
   9180 91            [ 4] 2208 	sub	a, c
   9181 30 18         [12] 2209 	jr	NC,00109$
                           2210 ;src/entities/entities.c:828: c->x = p->ent.x;
   9183 ED 4B FE 58   [20] 2211 	ld	bc, (#(_player + 0x0026) + 0)
   9187 21 D7 88      [10] 2212 	ld	hl,#_puntos
   918A 71            [ 7] 2213 	ld	(hl),c
                           2214 ;src/entities/entities.c:829: c->y = p->ent.y;
   918B ED 4B 00 59   [20] 2215 	ld	bc, (#(_player + 0x0026) + 2)
   918F 21 D8 88      [10] 2216 	ld	hl,#(_puntos + 0x0001)
   9192 71            [ 7] 2217 	ld	(hl),c
                           2218 ;src/entities/entities.c:830: ene->puntoDeControl = 0;
   9193 DD 6E F9      [19] 2219 	ld	l,-7 (ix)
   9196 DD 66 FA      [19] 2220 	ld	h,-6 (ix)
   9199 36 00         [10] 2221 	ld	(hl),#0x00
   919B                    2222 00109$:
                           2223 ;src/entities/entities.c:832: comprobarSiDisparo(ene, p);
   919B 21 D8 58      [10] 2224 	ld	hl,#_player
   919E E5            [11] 2225 	push	hl
   919F DD 6E FB      [19] 2226 	ld	l,-5 (ix)
   91A2 DD 66 FC      [19] 2227 	ld	h,-4 (ix)
   91A5 E5            [11] 2228 	push	hl
   91A6 CD 9F 92      [17] 2229 	call	_comprobarSiDisparo
   91A9 F1            [10] 2230 	pop	af
   91AA F1            [10] 2231 	pop	af
                           2232 ;src/entities/entities.c:833: break;
   91AB C3 9A 92      [10] 2233 	jp	00122$
                           2234 ;src/entities/entities.c:834: case s_huir:
   91AE                    2235 00110$:
                           2236 ;src/entities/entities.c:835: ene->ent.curr_dir = calculaDireccion();
   91AE DD 7E FB      [19] 2237 	ld	a,-5 (ix)
   91B1 C6 26         [ 7] 2238 	add	a, #0x26
   91B3 4F            [ 4] 2239 	ld	c,a
   91B4 DD 7E FC      [19] 2240 	ld	a,-4 (ix)
   91B7 CE 00         [ 7] 2241 	adc	a, #0x00
   91B9 47            [ 4] 2242 	ld	b,a
   91BA DD 7E FB      [19] 2243 	ld	a,-5 (ix)
   91BD C6 3B         [ 7] 2244 	add	a, #0x3B
   91BF 6F            [ 4] 2245 	ld	l,a
   91C0 DD 7E FC      [19] 2246 	ld	a,-4 (ix)
   91C3 CE 00         [ 7] 2247 	adc	a, #0x00
   91C5 67            [ 4] 2248 	ld	h,a
   91C6 E5            [11] 2249 	push	hl
   91C7 C5            [11] 2250 	push	bc
   91C8 CD 95 90      [17] 2251 	call	_calculaDireccion
   91CB 55            [ 4] 2252 	ld	d,l
   91CC C1            [10] 2253 	pop	bc
   91CD E1            [10] 2254 	pop	hl
   91CE 72            [ 7] 2255 	ld	(hl),d
                           2256 ;src/entities/entities.c:836: if(accion(&ene->ent, es_mover, ene->ent.curr_dir) != d_nothing){
   91CF C5            [11] 2257 	push	bc
   91D0 1E 01         [ 7] 2258 	ld	e, #0x01
   91D2 D5            [11] 2259 	push	de
   91D3 C5            [11] 2260 	push	bc
   91D4 CD DF 88      [17] 2261 	call	_accion
   91D7 F1            [10] 2262 	pop	af
   91D8 F1            [10] 2263 	pop	af
   91D9 C1            [10] 2264 	pop	bc
   91DA 7D            [ 4] 2265 	ld	a,l
   91DB D6 04         [ 7] 2266 	sub	a, #0x04
   91DD CA 9A 92      [10] 2267 	jp	Z,00122$
                           2268 ;src/entities/entities.c:837: calculaEntity(&ene->ent, SI);
   91E0 C5            [11] 2269 	push	bc
   91E1 3E 01         [ 7] 2270 	ld	a,#0x01
   91E3 F5            [11] 2271 	push	af
   91E4 33            [ 6] 2272 	inc	sp
   91E5 C5            [11] 2273 	push	bc
   91E6 CD 6C 95      [17] 2274 	call	_calculaEntity
   91E9 F1            [10] 2275 	pop	af
   91EA 33            [ 6] 2276 	inc	sp
   91EB CD BA 94      [17] 2277 	call	_borrarEntity
   91EE F1            [10] 2278 	pop	af
                           2279 ;src/entities/entities.c:839: ene->ent.cuadrante++;
   91EF DD 7E FB      [19] 2280 	ld	a,-5 (ix)
   91F2 C6 42         [ 7] 2281 	add	a, #0x42
   91F4 6F            [ 4] 2282 	ld	l,a
   91F5 DD 7E FC      [19] 2283 	ld	a,-4 (ix)
   91F8 CE 00         [ 7] 2284 	adc	a, #0x00
   91FA 67            [ 4] 2285 	ld	h,a
   91FB 4E            [ 7] 2286 	ld	c,(hl)
   91FC 0C            [ 4] 2287 	inc	c
   91FD 71            [ 7] 2288 	ld	(hl),c
                           2289 ;src/entities/entities.c:840: if(ene->ent.cuadrante > 5)
   91FE 3E 05         [ 7] 2290 	ld	a,#0x05
   9200 91            [ 4] 2291 	sub	a, c
   9201 30 02         [12] 2292 	jr	NC,00135$
                           2293 ;src/entities/entities.c:841: ene->ent.cuadrante = 0;
   9203 36 00         [10] 2294 	ld	(hl),#0x00
                           2295 ;src/entities/entities.c:842: for(i = 0; i<NUM_BASES; i++){
   9205                    2296 00135$:
   9205 DD 36 F6 00   [19] 2297 	ld	-10 (ix),#0x00
   9209 DD 36 F9 00   [19] 2298 	ld	-7 (ix),#0x00
   920D DD 36 FA 00   [19] 2299 	ld	-6 (ix),#0x00
   9211                    2300 00120$:
                           2301 ;src/entities/entities.c:843: if(bases[i].whom == 0 && bases[i].ent.cuadrante != mapaActual){
   9211 DD 7E F7      [19] 2302 	ld	a,-9 (ix)
   9214 DD 86 F9      [19] 2303 	add	a, -7 (ix)
   9217 DD 77 FB      [19] 2304 	ld	-5 (ix),a
   921A DD 7E F8      [19] 2305 	ld	a,-8 (ix)
   921D DD 8E FA      [19] 2306 	adc	a, -6 (ix)
   9220 DD 77 FC      [19] 2307 	ld	-4 (ix),a
   9223 DD 6E FB      [19] 2308 	ld	l,-5 (ix)
   9226 DD 66 FC      [19] 2309 	ld	h,-4 (ix)
   9229 7E            [ 7] 2310 	ld	a,(hl)
   922A B7            [ 4] 2311 	or	a, a
   922B 20 52         [12] 2312 	jr	NZ,00121$
   922D DD 6E FB      [19] 2313 	ld	l,-5 (ix)
   9230 DD 66 FC      [19] 2314 	ld	h,-4 (ix)
   9233 11 20 00      [10] 2315 	ld	de, #0x0020
   9236 19            [11] 2316 	add	hl, de
   9237 4E            [ 7] 2317 	ld	c,(hl)
   9238 3A 03 86      [13] 2318 	ld	a,(#_mapaActual + 0)
   923B 91            [ 4] 2319 	sub	a, c
   923C 28 41         [12] 2320 	jr	Z,00121$
                           2321 ;src/entities/entities.c:844: bases[i].whom = 1;
   923E DD 6E FB      [19] 2322 	ld	l,-5 (ix)
   9241 DD 66 FC      [19] 2323 	ld	h,-4 (ix)
   9244 36 01         [10] 2324 	ld	(hl),#0x01
                           2325 ;src/entities/entities.c:845: bases[i].cycles = 0;
   9246 DD 7E FB      [19] 2326 	ld	a,-5 (ix)
   9249 C6 03         [ 7] 2327 	add	a, #0x03
   924B DD 77 FD      [19] 2328 	ld	-3 (ix),a
   924E DD 7E FC      [19] 2329 	ld	a,-4 (ix)
   9251 CE 00         [ 7] 2330 	adc	a, #0x00
   9253 DD 77 FE      [19] 2331 	ld	-2 (ix),a
   9256 DD 6E FD      [19] 2332 	ld	l,-3 (ix)
   9259 DD 66 FE      [19] 2333 	ld	h,-2 (ix)
   925C 36 00         [10] 2334 	ld	(hl),#0x00
                           2335 ;src/entities/entities.c:846: bases[i].ent.sprites[0] = NULL;
   925E DD 7E FB      [19] 2336 	ld	a,-5 (ix)
   9261 C6 0F         [ 7] 2337 	add	a, #0x0F
   9263 DD 77 FD      [19] 2338 	ld	-3 (ix),a
   9266 DD 7E FC      [19] 2339 	ld	a,-4 (ix)
   9269 CE 00         [ 7] 2340 	adc	a, #0x00
   926B DD 77 FE      [19] 2341 	ld	-2 (ix),a
   926E DD 6E FD      [19] 2342 	ld	l,-3 (ix)
   9271 DD 66 FE      [19] 2343 	ld	h,-2 (ix)
   9274 36 00         [10] 2344 	ld	(hl),#0x00
   9276 23            [ 6] 2345 	inc	hl
   9277 36 00         [10] 2346 	ld	(hl),#0x00
                           2347 ;src/entities/entities.c:847: basesCapturadas--;
   9279 21 06 86      [10] 2348 	ld	hl, #_basesCapturadas+0
   927C 35            [11] 2349 	dec	(hl)
                           2350 ;src/entities/entities.c:848: break;
   927D 18 1B         [12] 2351 	jr	00122$
   927F                    2352 00121$:
                           2353 ;src/entities/entities.c:842: for(i = 0; i<NUM_BASES; i++){
   927F DD 7E F9      [19] 2354 	ld	a,-7 (ix)
   9282 C6 27         [ 7] 2355 	add	a, #0x27
   9284 DD 77 F9      [19] 2356 	ld	-7 (ix),a
   9287 DD 7E FA      [19] 2357 	ld	a,-6 (ix)
   928A CE 00         [ 7] 2358 	adc	a, #0x00
   928C DD 77 FA      [19] 2359 	ld	-6 (ix),a
   928F DD 34 F6      [23] 2360 	inc	-10 (ix)
   9292 DD 7E F6      [19] 2361 	ld	a,-10 (ix)
   9295 D6 06         [ 7] 2362 	sub	a, #0x06
   9297 DA 11 92      [10] 2363 	jp	C,00120$
                           2364 ;src/entities/entities.c:857: }
   929A                    2365 00122$:
   929A DD F9         [10] 2366 	ld	sp, ix
   929C DD E1         [14] 2367 	pop	ix
   929E C9            [10] 2368 	ret
                           2369 ;src/entities/entities.c:859: void comprobarSiDisparo(TEnemy* ene, TPlayer* p){
                           2370 ;	---------------------------------
                           2371 ; Function comprobarSiDisparo
                           2372 ; ---------------------------------
   929F                    2373 _comprobarSiDisparo::
   929F DD E5         [15] 2374 	push	ix
   92A1 DD 21 00 00   [14] 2375 	ld	ix,#0
   92A5 DD 39         [15] 2376 	add	ix,sp
   92A7 21 F1 FF      [10] 2377 	ld	hl,#-15
   92AA 39            [11] 2378 	add	hl,sp
   92AB F9            [ 6] 2379 	ld	sp,hl
                           2380 ;src/entities/entities.c:862: if(++ene->shot_cycles >= wshot_cycles){
   92AC DD 4E 04      [19] 2381 	ld	c,4 (ix)
   92AF DD 46 05      [19] 2382 	ld	b,5 (ix)
   92B2 21 4C 00      [10] 2383 	ld	hl,#0x004C
   92B5 09            [11] 2384 	add	hl,bc
   92B6 EB            [ 4] 2385 	ex	de,hl
   92B7 1A            [ 7] 2386 	ld	a,(de)
   92B8 3C            [ 4] 2387 	inc	a
   92B9 DD 77 F5      [19] 2388 	ld	-11 (ix), a
   92BC 12            [ 7] 2389 	ld	(de),a
   92BD 21 08 86      [10] 2390 	ld	hl,#_wshot_cycles
   92C0 DD 7E F5      [19] 2391 	ld	a,-11 (ix)
   92C3 96            [ 7] 2392 	sub	a, (hl)
   92C4 DA 4A 94      [10] 2393 	jp	C,00114$
                           2394 ;src/entities/entities.c:863: diff = abs(ene->ent.x - p->ent.x);	
   92C7 21 26 00      [10] 2395 	ld	hl,#0x0026
   92CA 09            [11] 2396 	add	hl,bc
   92CB DD 75 FC      [19] 2397 	ld	-4 (ix),l
   92CE DD 74 FD      [19] 2398 	ld	-3 (ix),h
   92D1 DD 6E FC      [19] 2399 	ld	l,-4 (ix)
   92D4 DD 66 FD      [19] 2400 	ld	h,-3 (ix)
   92D7 7E            [ 7] 2401 	ld	a,(hl)
   92D8 DD 77 FA      [19] 2402 	ld	-6 (ix),a
   92DB 23            [ 6] 2403 	inc	hl
   92DC 7E            [ 7] 2404 	ld	a,(hl)
   92DD DD 77 FB      [19] 2405 	ld	-5 (ix),a
   92E0 DD 7E 06      [19] 2406 	ld	a,6 (ix)
   92E3 DD 77 F3      [19] 2407 	ld	-13 (ix),a
   92E6 DD 7E 07      [19] 2408 	ld	a,7 (ix)
   92E9 DD 77 F4      [19] 2409 	ld	-12 (ix),a
   92EC DD 7E F3      [19] 2410 	ld	a,-13 (ix)
   92EF C6 26         [ 7] 2411 	add	a, #0x26
   92F1 DD 77 F6      [19] 2412 	ld	-10 (ix),a
   92F4 DD 7E F4      [19] 2413 	ld	a,-12 (ix)
   92F7 CE 00         [ 7] 2414 	adc	a, #0x00
   92F9 DD 77 F7      [19] 2415 	ld	-9 (ix),a
   92FC DD 6E F6      [19] 2416 	ld	l,-10 (ix)
   92FF DD 66 F7      [19] 2417 	ld	h,-9 (ix)
   9302 7E            [ 7] 2418 	ld	a, (hl)
   9303 23            [ 6] 2419 	inc	hl
   9304 66            [ 7] 2420 	ld	h,(hl)
   9305 6F            [ 4] 2421 	ld	l,a
   9306 DD 7E FA      [19] 2422 	ld	a,-6 (ix)
   9309 95            [ 4] 2423 	sub	a, l
   930A 6F            [ 4] 2424 	ld	l,a
   930B DD 7E FB      [19] 2425 	ld	a,-5 (ix)
   930E 9C            [ 4] 2426 	sbc	a, h
   930F 67            [ 4] 2427 	ld	h,a
   9310 C5            [11] 2428 	push	bc
   9311 D5            [11] 2429 	push	de
   9312 E5            [11] 2430 	push	hl
   9313 CD 78 90      [17] 2431 	call	_abs
   9316 F1            [10] 2432 	pop	af
   9317 D1            [10] 2433 	pop	de
   9318 C1            [10] 2434 	pop	bc
   9319 DD 75 FA      [19] 2435 	ld	-6 (ix),l
   931C DD 74 FB      [19] 2436 	ld	-5 (ix),h
                           2437 ;src/entities/entities.c:865: if(ene->ent.y > p->ent.y){	//Si se cumple sabemos dir de disparo
   931F 21 28 00      [10] 2438 	ld	hl,#0x0028
   9322 09            [11] 2439 	add	hl,bc
   9323 DD 75 F8      [19] 2440 	ld	-8 (ix),l
   9326 DD 74 F9      [19] 2441 	ld	-7 (ix),h
   9329 DD 6E F8      [19] 2442 	ld	l,-8 (ix)
   932C DD 66 F9      [19] 2443 	ld	h,-7 (ix)
   932F 7E            [ 7] 2444 	ld	a,(hl)
   9330 DD 77 F1      [19] 2445 	ld	-15 (ix),a
   9333 23            [ 6] 2446 	inc	hl
   9334 7E            [ 7] 2447 	ld	a,(hl)
   9335 DD 77 F2      [19] 2448 	ld	-14 (ix),a
   9338 E5            [11] 2449 	push	hl
   9339 DD 6E F3      [19] 2450 	ld	l,-13 (ix)
   933C DD 66 F4      [19] 2451 	ld	h,-12 (ix)
   933F E5            [11] 2452 	push	hl
   9340 FD E1         [14] 2453 	pop	iy
   9342 E1            [10] 2454 	pop	hl
                           2455 ;src/entities/entities.c:870: ene->ent.curr_dir = dir;
   9343 21 3B 00      [10] 2456 	ld	hl,#0x003B
   9346 09            [11] 2457 	add	hl,bc
   9347 DD 75 F3      [19] 2458 	ld	-13 (ix),l
   934A DD 74 F4      [19] 2459 	ld	-12 (ix),h
                           2460 ;src/entities/entities.c:865: if(ene->ent.y > p->ent.y){	//Si se cumple sabemos dir de disparo
   934D FD 7E 28      [19] 2461 	ld	a,40 (iy)
   9350 DD 77 FE      [19] 2462 	ld	-2 (ix),a
   9353 FD 7E 29      [19] 2463 	ld	a,41 (iy)
   9356 DD 77 FF      [19] 2464 	ld	-1 (ix),a
                           2465 ;src/entities/entities.c:864: if(diff <= 2){//Disparo en direccion dir
   9359 3E 02         [ 7] 2466 	ld	a,#0x02
   935B DD BE FA      [19] 2467 	cp	a, -6 (ix)
   935E 3E 00         [ 7] 2468 	ld	a,#0x00
   9360 DD 9E FB      [19] 2469 	sbc	a, -5 (ix)
   9363 E2 68 93      [10] 2470 	jp	PO, 00136$
   9366 EE 80         [ 7] 2471 	xor	a, #0x80
   9368                    2472 00136$:
   9368 FA BF 93      [10] 2473 	jp	M,00110$
                           2474 ;src/entities/entities.c:865: if(ene->ent.y > p->ent.y){	//Si se cumple sabemos dir de disparo
   936B DD 7E FE      [19] 2475 	ld	a,-2 (ix)
   936E DD 96 F1      [19] 2476 	sub	a, -15 (ix)
   9371 DD 7E FF      [19] 2477 	ld	a,-1 (ix)
   9374 DD 9E F2      [19] 2478 	sbc	a, -14 (ix)
   9377 E2 7C 93      [10] 2479 	jp	PO, 00137$
   937A EE 80         [ 7] 2480 	xor	a, #0x80
   937C                    2481 00137$:
   937C F2 83 93      [10] 2482 	jp	P,00102$
                           2483 ;src/entities/entities.c:866: dir = d_up;
   937F 3E 00         [ 7] 2484 	ld	a,#0x00
   9381 18 02         [12] 2485 	jr	00103$
   9383                    2486 00102$:
                           2487 ;src/entities/entities.c:868: dir = d_down;
   9383 3E 02         [ 7] 2488 	ld	a,#0x02
   9385                    2489 00103$:
                           2490 ;src/entities/entities.c:870: ene->ent.curr_dir = dir;
   9385 DD 6E F3      [19] 2491 	ld	l,-13 (ix)
   9388 DD 66 F4      [19] 2492 	ld	h,-12 (ix)
   938B 77            [ 7] 2493 	ld	(hl),a
                           2494 ;src/entities/entities.c:871: disparar(&ene->bullet, ene->ent.x, ene->ent.y, dir);
   938C DD 6E F8      [19] 2495 	ld	l,-8 (ix)
   938F DD 66 F9      [19] 2496 	ld	h,-7 (ix)
   9392 F5            [11] 2497 	push	af
   9393 7E            [ 7] 2498 	ld	a, (hl)
   9394 23            [ 6] 2499 	inc	hl
   9395 66            [ 7] 2500 	ld	h,(hl)
   9396 6F            [ 4] 2501 	ld	l,a
   9397 F1            [10] 2502 	pop	af
   9398 DD 75 FA      [19] 2503 	ld	-6 (ix),l
   939B DD 6E FC      [19] 2504 	ld	l,-4 (ix)
   939E DD 66 FD      [19] 2505 	ld	h,-3 (ix)
   93A1 F5            [11] 2506 	push	af
   93A2 7E            [ 7] 2507 	ld	a, (hl)
   93A3 23            [ 6] 2508 	inc	hl
   93A4 66            [ 7] 2509 	ld	h,(hl)
   93A5 6F            [ 4] 2510 	ld	l,a
   93A6 F1            [10] 2511 	pop	af
   93A7 DD 75 F5      [19] 2512 	ld	-11 (ix),l
   93AA D5            [11] 2513 	push	de
   93AB F5            [11] 2514 	push	af
   93AC 33            [ 6] 2515 	inc	sp
   93AD DD 66 FA      [19] 2516 	ld	h,-6 (ix)
   93B0 DD 6E F5      [19] 2517 	ld	l,-11 (ix)
   93B3 E5            [11] 2518 	push	hl
   93B4 C5            [11] 2519 	push	bc
   93B5 CD C6 8C      [17] 2520 	call	_disparar
   93B8 F1            [10] 2521 	pop	af
   93B9 F1            [10] 2522 	pop	af
   93BA 33            [ 6] 2523 	inc	sp
   93BB D1            [10] 2524 	pop	de
   93BC C3 48 94      [10] 2525 	jp	00111$
   93BF                    2526 00110$:
                           2527 ;src/entities/entities.c:873: diff = abs(ene->ent.y - p->ent.y);	
   93BF DD 7E F1      [19] 2528 	ld	a,-15 (ix)
   93C2 DD 96 FE      [19] 2529 	sub	a, -2 (ix)
   93C5 6F            [ 4] 2530 	ld	l,a
   93C6 DD 7E F2      [19] 2531 	ld	a,-14 (ix)
   93C9 DD 9E FF      [19] 2532 	sbc	a, -1 (ix)
   93CC 67            [ 4] 2533 	ld	h,a
   93CD C5            [11] 2534 	push	bc
   93CE D5            [11] 2535 	push	de
   93CF E5            [11] 2536 	push	hl
   93D0 CD 78 90      [17] 2537 	call	_abs
   93D3 F1            [10] 2538 	pop	af
   93D4 D1            [10] 2539 	pop	de
   93D5 C1            [10] 2540 	pop	bc
                           2541 ;src/entities/entities.c:874: if(diff <= 2){
   93D6 3E 02         [ 7] 2542 	ld	a,#0x02
   93D8 BD            [ 4] 2543 	cp	a, l
   93D9 3E 00         [ 7] 2544 	ld	a,#0x00
   93DB 9C            [ 4] 2545 	sbc	a, h
   93DC E2 E1 93      [10] 2546 	jp	PO, 00138$
   93DF EE 80         [ 7] 2547 	xor	a, #0x80
   93E1                    2548 00138$:
   93E1 FA 48 94      [10] 2549 	jp	M,00111$
                           2550 ;src/entities/entities.c:875: if(ene->ent.x > p->ent.x){	//Si se cumple sabemos dir de disparo
   93E4 DD 6E FC      [19] 2551 	ld	l,-4 (ix)
   93E7 DD 66 FD      [19] 2552 	ld	h,-3 (ix)
   93EA 7E            [ 7] 2553 	ld	a,(hl)
   93EB DD 77 FE      [19] 2554 	ld	-2 (ix),a
   93EE 23            [ 6] 2555 	inc	hl
   93EF 7E            [ 7] 2556 	ld	a,(hl)
   93F0 DD 77 FF      [19] 2557 	ld	-1 (ix),a
   93F3 DD 6E F6      [19] 2558 	ld	l,-10 (ix)
   93F6 DD 66 F7      [19] 2559 	ld	h,-9 (ix)
   93F9 7E            [ 7] 2560 	ld	a, (hl)
   93FA 23            [ 6] 2561 	inc	hl
   93FB 66            [ 7] 2562 	ld	h,(hl)
   93FC DD 96 FE      [19] 2563 	sub	a, -2 (ix)
   93FF 7C            [ 4] 2564 	ld	a,h
   9400 DD 9E FF      [19] 2565 	sbc	a, -1 (ix)
   9403 E2 08 94      [10] 2566 	jp	PO, 00139$
   9406 EE 80         [ 7] 2567 	xor	a, #0x80
   9408                    2568 00139$:
   9408 F2 0F 94      [10] 2569 	jp	P,00105$
                           2570 ;src/entities/entities.c:876: dir = d_left;
   940B 3E 03         [ 7] 2571 	ld	a,#0x03
   940D 18 02         [12] 2572 	jr	00106$
   940F                    2573 00105$:
                           2574 ;src/entities/entities.c:878: dir = d_right;
   940F 3E 01         [ 7] 2575 	ld	a,#0x01
   9411                    2576 00106$:
                           2577 ;src/entities/entities.c:880: ene->ent.curr_dir = dir;
   9411 DD 6E F3      [19] 2578 	ld	l,-13 (ix)
   9414 DD 66 F4      [19] 2579 	ld	h,-12 (ix)
   9417 77            [ 7] 2580 	ld	(hl),a
                           2581 ;src/entities/entities.c:881: disparar(&ene->bullet, ene->ent.x, ene->ent.y, dir);
   9418 DD 6E F8      [19] 2582 	ld	l,-8 (ix)
   941B DD 66 F9      [19] 2583 	ld	h,-7 (ix)
   941E F5            [11] 2584 	push	af
   941F 7E            [ 7] 2585 	ld	a, (hl)
   9420 23            [ 6] 2586 	inc	hl
   9421 66            [ 7] 2587 	ld	h,(hl)
   9422 6F            [ 4] 2588 	ld	l,a
   9423 F1            [10] 2589 	pop	af
   9424 DD 75 FE      [19] 2590 	ld	-2 (ix),l
   9427 DD 6E FC      [19] 2591 	ld	l,-4 (ix)
   942A DD 66 FD      [19] 2592 	ld	h,-3 (ix)
   942D F5            [11] 2593 	push	af
   942E 7E            [ 7] 2594 	ld	a, (hl)
   942F 23            [ 6] 2595 	inc	hl
   9430 66            [ 7] 2596 	ld	h,(hl)
   9431 6F            [ 4] 2597 	ld	l,a
   9432 F1            [10] 2598 	pop	af
   9433 DD 75 F1      [19] 2599 	ld	-15 (ix),l
   9436 D5            [11] 2600 	push	de
   9437 F5            [11] 2601 	push	af
   9438 33            [ 6] 2602 	inc	sp
   9439 DD 66 FE      [19] 2603 	ld	h,-2 (ix)
   943C DD 6E F1      [19] 2604 	ld	l,-15 (ix)
   943F E5            [11] 2605 	push	hl
   9440 C5            [11] 2606 	push	bc
   9441 CD C6 8C      [17] 2607 	call	_disparar
   9444 F1            [10] 2608 	pop	af
   9445 F1            [10] 2609 	pop	af
   9446 33            [ 6] 2610 	inc	sp
   9447 D1            [10] 2611 	pop	de
   9448                    2612 00111$:
                           2613 ;src/entities/entities.c:885: ene->shot_cycles = 0;
   9448 AF            [ 4] 2614 	xor	a, a
   9449 12            [ 7] 2615 	ld	(de),a
   944A                    2616 00114$:
   944A DD F9         [10] 2617 	ld	sp, ix
   944C DD E1         [14] 2618 	pop	ix
   944E C9            [10] 2619 	ret
                           2620 ;src/entities/entities.c:891: void redibujarEntity(TEntity* ent, u8 w, u8 h){
                           2621 ;	---------------------------------
                           2622 ; Function redibujarEntity
                           2623 ; ---------------------------------
   944F                    2624 _redibujarEntity::
   944F DD E5         [15] 2625 	push	ix
   9451 DD 21 00 00   [14] 2626 	ld	ix,#0
   9455 DD 39         [15] 2627 	add	ix,sp
   9457 3B            [ 6] 2628 	dec	sp
                           2629 ;src/entities/entities.c:892: if (ent->draw && ent->cuadrante == mapaActual) {
   9458 DD 4E 04      [19] 2630 	ld	c,4 (ix)
   945B DD 46 05      [19] 2631 	ld	b,5 (ix)
   945E 21 0A 00      [10] 2632 	ld	hl,#0x000A
   9461 09            [11] 2633 	add	hl,bc
   9462 EB            [ 4] 2634 	ex	de,hl
   9463 1A            [ 7] 2635 	ld	a,(de)
   9464 B7            [ 4] 2636 	or	a, a
   9465 28 4F         [12] 2637 	jr	Z,00104$
   9467 C5            [11] 2638 	push	bc
   9468 FD E1         [14] 2639 	pop	iy
   946A FD 7E 1C      [19] 2640 	ld	a,28 (iy)
   946D DD 77 FF      [19] 2641 	ld	-1 (ix),a
   9470 3A 03 86      [13] 2642 	ld	a,(#_mapaActual + 0)
   9473 DD 96 FF      [19] 2643 	sub	a, -1 (ix)
   9476 20 3E         [12] 2644 	jr	NZ,00104$
                           2645 ;src/entities/entities.c:893: borrarEntity(ent);
   9478 C5            [11] 2646 	push	bc
   9479 D5            [11] 2647 	push	de
   947A C5            [11] 2648 	push	bc
   947B CD BA 94      [17] 2649 	call	_borrarEntity
   947E F1            [10] 2650 	pop	af
   947F D1            [10] 2651 	pop	de
   9480 C1            [10] 2652 	pop	bc
                           2653 ;src/entities/entities.c:894: ent->px = ent->x;
   9481 FD 21 04 00   [14] 2654 	ld	iy,#0x0004
   9485 FD 09         [15] 2655 	add	iy, bc
   9487 69            [ 4] 2656 	ld	l, c
   9488 60            [ 4] 2657 	ld	h, b
   9489 7E            [ 7] 2658 	ld	a, (hl)
   948A 23            [ 6] 2659 	inc	hl
   948B 66            [ 7] 2660 	ld	h,(hl)
   948C FD 77 00      [19] 2661 	ld	0 (iy), a
   948F FD 74 01      [19] 2662 	ld	1 (iy),h
                           2663 ;src/entities/entities.c:895: ent->py = ent->y;
   9492 FD 21 06 00   [14] 2664 	ld	iy,#0x0006
   9496 FD 09         [15] 2665 	add	iy, bc
   9498 69            [ 4] 2666 	ld	l, c
   9499 60            [ 4] 2667 	ld	h, b
   949A 23            [ 6] 2668 	inc	hl
   949B 23            [ 6] 2669 	inc	hl
   949C 7E            [ 7] 2670 	ld	a, (hl)
   949D 23            [ 6] 2671 	inc	hl
   949E 66            [ 7] 2672 	ld	h,(hl)
   949F FD 77 00      [19] 2673 	ld	0 (iy), a
   94A2 FD 74 01      [19] 2674 	ld	1 (iy),h
                           2675 ;src/entities/entities.c:896: dibujarEntity(ent, w, h);
   94A5 D5            [11] 2676 	push	de
   94A6 DD 66 07      [19] 2677 	ld	h,7 (ix)
   94A9 DD 6E 06      [19] 2678 	ld	l,6 (ix)
   94AC E5            [11] 2679 	push	hl
   94AD C5            [11] 2680 	push	bc
   94AE CD 20 95      [17] 2681 	call	_dibujarEntity
   94B1 F1            [10] 2682 	pop	af
   94B2 F1            [10] 2683 	pop	af
   94B3 D1            [10] 2684 	pop	de
                           2685 ;src/entities/entities.c:897: ent->draw = NO;
   94B4 AF            [ 4] 2686 	xor	a, a
   94B5 12            [ 7] 2687 	ld	(de),a
   94B6                    2688 00104$:
   94B6 33            [ 6] 2689 	inc	sp
   94B7 DD E1         [14] 2690 	pop	ix
   94B9 C9            [10] 2691 	ret
                           2692 ;src/entities/entities.c:901: void borrarEntity(TEntity* ent){
                           2693 ;	---------------------------------
                           2694 ; Function borrarEntity
                           2695 ; ---------------------------------
   94BA                    2696 _borrarEntity::
   94BA DD E5         [15] 2697 	push	ix
   94BC DD 21 00 00   [14] 2698 	ld	ix,#0
   94C0 DD 39         [15] 2699 	add	ix,sp
   94C2 F5            [11] 2700 	push	af
   94C3 F5            [11] 2701 	push	af
                           2702 ;src/entities/entities.c:902: if(ent->draw){
   94C4 DD 4E 04      [19] 2703 	ld	c,4 (ix)
   94C7 DD 46 05      [19] 2704 	ld	b,5 (ix)
   94CA C5            [11] 2705 	push	bc
   94CB FD E1         [14] 2706 	pop	iy
   94CD FD 7E 0A      [19] 2707 	ld	a,10 (iy)
   94D0 B7            [ 4] 2708 	or	a, a
   94D1 28 48         [12] 2709 	jr	Z,00103$
                           2710 ;src/entities/entities.c:903: cpct_etm_drawTileBox2x4(ent->tpx, ent->tpy, ent->tw, ent->th, g_map11_W, ORIGEN_MAPA, mapa);
   94D3 2A 01 86      [16] 2711 	ld	hl,(_mapa)
   94D6 DD 75 FD      [19] 2712 	ld	-3 (ix),l
   94D9 DD 74 FE      [19] 2713 	ld	-2 (ix),h
   94DC 69            [ 4] 2714 	ld	l, c
   94DD 60            [ 4] 2715 	ld	h, b
   94DE 11 1E 00      [10] 2716 	ld	de, #0x001E
   94E1 19            [11] 2717 	add	hl, de
   94E2 7E            [ 7] 2718 	ld	a,(hl)
   94E3 DD 77 FF      [19] 2719 	ld	-1 (ix),a
   94E6 69            [ 4] 2720 	ld	l, c
   94E7 60            [ 4] 2721 	ld	h, b
   94E8 11 1D 00      [10] 2722 	ld	de, #0x001D
   94EB 19            [11] 2723 	add	hl, de
   94EC 7E            [ 7] 2724 	ld	a,(hl)
   94ED DD 77 FC      [19] 2725 	ld	-4 (ix),a
   94F0 69            [ 4] 2726 	ld	l, c
   94F1 60            [ 4] 2727 	ld	h, b
   94F2 11 20 00      [10] 2728 	ld	de, #0x0020
   94F5 19            [11] 2729 	add	hl, de
   94F6 5E            [ 7] 2730 	ld	e,(hl)
   94F7 69            [ 4] 2731 	ld	l, c
   94F8 60            [ 4] 2732 	ld	h, b
   94F9 01 1F 00      [10] 2733 	ld	bc, #0x001F
   94FC 09            [11] 2734 	add	hl, bc
   94FD 46            [ 7] 2735 	ld	b,(hl)
   94FE DD 6E FD      [19] 2736 	ld	l,-3 (ix)
   9501 DD 66 FE      [19] 2737 	ld	h,-2 (ix)
   9504 E5            [11] 2738 	push	hl
   9505 21 90 C1      [10] 2739 	ld	hl,#0xC190
   9508 E5            [11] 2740 	push	hl
   9509 3E 28         [ 7] 2741 	ld	a,#0x28
   950B F5            [11] 2742 	push	af
   950C 33            [ 6] 2743 	inc	sp
   950D DD 7E FF      [19] 2744 	ld	a,-1 (ix)
   9510 F5            [11] 2745 	push	af
   9511 33            [ 6] 2746 	inc	sp
   9512 DD 56 FC      [19] 2747 	ld	d, -4 (ix)
   9515 D5            [11] 2748 	push	de
   9516 C5            [11] 2749 	push	bc
   9517 33            [ 6] 2750 	inc	sp
   9518 CD 60 6E      [17] 2751 	call	_cpct_etm_drawTileBox2x4
   951B                    2752 00103$:
   951B DD F9         [10] 2753 	ld	sp, ix
   951D DD E1         [14] 2754 	pop	ix
   951F C9            [10] 2755 	ret
                           2756 ;src/entities/entities.c:907: void dibujarEntity(TEntity* ent, u8 w, u8 h){
                           2757 ;	---------------------------------
                           2758 ; Function dibujarEntity
                           2759 ; ---------------------------------
   9520                    2760 _dibujarEntity::
   9520 DD E5         [15] 2761 	push	ix
   9522 DD 21 00 00   [14] 2762 	ld	ix,#0
   9526 DD 39         [15] 2763 	add	ix,sp
   9528 F5            [11] 2764 	push	af
                           2765 ;src/entities/entities.c:908: if (ent->draw) {
   9529 DD 4E 04      [19] 2766 	ld	c,4 (ix)
   952C DD 46 05      [19] 2767 	ld	b,5 (ix)
   952F C5            [11] 2768 	push	bc
   9530 FD E1         [14] 2769 	pop	iy
   9532 FD 7E 0A      [19] 2770 	ld	a,10 (iy)
   9535 B7            [ 4] 2771 	or	a, a
   9536 28 2F         [12] 2772 	jr	Z,00103$
                           2773 ;src/entities/entities.c:909: cpct_drawSpriteMaskedAlignedTable(ent->sprites[ent->curr_dir],ent->vmem, w, h, g_tablatrans);
   9538 69            [ 4] 2774 	ld	l, c
   9539 60            [ 4] 2775 	ld	h, b
   953A 11 21 00      [10] 2776 	ld	de, #0x0021
   953D 19            [11] 2777 	add	hl, de
   953E 5E            [ 7] 2778 	ld	e,(hl)
   953F 23            [ 6] 2779 	inc	hl
   9540 56            [ 7] 2780 	ld	d,(hl)
   9541 21 0B 00      [10] 2781 	ld	hl,#0x000B
   9544 09            [11] 2782 	add	hl,bc
   9545 E3            [19] 2783 	ex	(sp), hl
   9546 69            [ 4] 2784 	ld	l, c
   9547 60            [ 4] 2785 	ld	h, b
   9548 01 15 00      [10] 2786 	ld	bc, #0x0015
   954B 09            [11] 2787 	add	hl, bc
   954C 4E            [ 7] 2788 	ld	c,(hl)
   954D CB 21         [ 8] 2789 	sla	c
   954F E1            [10] 2790 	pop	hl
   9550 E5            [11] 2791 	push	hl
   9551 06 00         [ 7] 2792 	ld	b,#0x00
   9553 09            [11] 2793 	add	hl, bc
   9554 4E            [ 7] 2794 	ld	c,(hl)
   9555 23            [ 6] 2795 	inc	hl
   9556 46            [ 7] 2796 	ld	b,(hl)
   9557 21 00 01      [10] 2797 	ld	hl,#_g_tablatrans
   955A E5            [11] 2798 	push	hl
   955B DD 66 07      [19] 2799 	ld	h,7 (ix)
   955E DD 6E 06      [19] 2800 	ld	l,6 (ix)
   9561 E5            [11] 2801 	push	hl
   9562 D5            [11] 2802 	push	de
   9563 C5            [11] 2803 	push	bc
   9564 CD 49 7A      [17] 2804 	call	_cpct_drawSpriteMaskedAlignedTable
   9567                    2805 00103$:
   9567 DD F9         [10] 2806 	ld	sp, ix
   9569 DD E1         [14] 2807 	pop	ix
   956B C9            [10] 2808 	ret
                           2809 ;src/entities/entities.c:914: void calculaEntity(TEntity* ent, u8 origen){
                           2810 ;	---------------------------------
                           2811 ; Function calculaEntity
                           2812 ; ---------------------------------
   956C                    2813 _calculaEntity::
   956C DD E5         [15] 2814 	push	ix
   956E DD 21 00 00   [14] 2815 	ld	ix,#0
   9572 DD 39         [15] 2816 	add	ix,sp
   9574 21 FA FF      [10] 2817 	ld	hl,#-6
   9577 39            [11] 2818 	add	hl,sp
   9578 F9            [ 6] 2819 	ld	sp,hl
                           2820 ;src/entities/entities.c:918: ent->tw = ent->sw/2 + (ent->px & 1);
   9579 DD 7E 04      [19] 2821 	ld	a,4 (ix)
   957C DD 77 FA      [19] 2822 	ld	-6 (ix),a
   957F DD 7E 05      [19] 2823 	ld	a,5 (ix)
   9582 DD 77 FB      [19] 2824 	ld	-5 (ix),a
   9585 DD 7E FA      [19] 2825 	ld	a,-6 (ix)
   9588 C6 1D         [ 7] 2826 	add	a, #0x1D
   958A 4F            [ 4] 2827 	ld	c,a
   958B DD 7E FB      [19] 2828 	ld	a,-5 (ix)
   958E CE 00         [ 7] 2829 	adc	a, #0x00
   9590 47            [ 4] 2830 	ld	b,a
   9591 E1            [10] 2831 	pop	hl
   9592 E5            [11] 2832 	push	hl
   9593 11 13 00      [10] 2833 	ld	de, #0x0013
   9596 19            [11] 2834 	add	hl, de
   9597 5E            [ 7] 2835 	ld	e,(hl)
   9598 CB 3B         [ 8] 2836 	srl	e
   959A DD 7E FA      [19] 2837 	ld	a,-6 (ix)
   959D C6 04         [ 7] 2838 	add	a, #0x04
   959F DD 77 FE      [19] 2839 	ld	-2 (ix),a
   95A2 DD 7E FB      [19] 2840 	ld	a,-5 (ix)
   95A5 CE 00         [ 7] 2841 	adc	a, #0x00
   95A7 DD 77 FF      [19] 2842 	ld	-1 (ix),a
   95AA DD 6E FE      [19] 2843 	ld	l,-2 (ix)
   95AD DD 66 FF      [19] 2844 	ld	h,-1 (ix)
   95B0 56            [ 7] 2845 	ld	d,(hl)
   95B1 23            [ 6] 2846 	inc	hl
   95B2 66            [ 7] 2847 	ld	h,(hl)
   95B3 7A            [ 4] 2848 	ld	a,d
   95B4 E6 01         [ 7] 2849 	and	a, #0x01
   95B6 83            [ 4] 2850 	add	a,e
   95B7 02            [ 7] 2851 	ld	(bc),a
                           2852 ;src/entities/entities.c:922: ent->th = ent->sh/4 + (ent->py & 3 ? 1 : 0);
   95B8 DD 7E FA      [19] 2853 	ld	a,-6 (ix)
   95BB C6 1E         [ 7] 2854 	add	a, #0x1E
   95BD 4F            [ 4] 2855 	ld	c,a
   95BE DD 7E FB      [19] 2856 	ld	a,-5 (ix)
   95C1 CE 00         [ 7] 2857 	adc	a, #0x00
   95C3 47            [ 4] 2858 	ld	b,a
   95C4 E1            [10] 2859 	pop	hl
   95C5 E5            [11] 2860 	push	hl
   95C6 11 14 00      [10] 2861 	ld	de, #0x0014
   95C9 19            [11] 2862 	add	hl, de
   95CA 5E            [ 7] 2863 	ld	e,(hl)
   95CB CB 3B         [ 8] 2864 	srl	e
   95CD CB 3B         [ 8] 2865 	srl	e
   95CF DD 7E FA      [19] 2866 	ld	a,-6 (ix)
   95D2 C6 06         [ 7] 2867 	add	a, #0x06
   95D4 DD 77 FC      [19] 2868 	ld	-4 (ix),a
   95D7 DD 7E FB      [19] 2869 	ld	a,-5 (ix)
   95DA CE 00         [ 7] 2870 	adc	a, #0x00
   95DC DD 77 FD      [19] 2871 	ld	-3 (ix),a
   95DF DD 6E FC      [19] 2872 	ld	l,-4 (ix)
   95E2 DD 66 FD      [19] 2873 	ld	h,-3 (ix)
   95E5 56            [ 7] 2874 	ld	d,(hl)
   95E6 23            [ 6] 2875 	inc	hl
   95E7 6E            [ 7] 2876 	ld	l,(hl)
   95E8 7A            [ 4] 2877 	ld	a,d
   95E9 E6 03         [ 7] 2878 	and	a, #0x03
   95EB 28 04         [12] 2879 	jr	Z,00106$
   95ED 16 01         [ 7] 2880 	ld	d,#0x01
   95EF 18 02         [12] 2881 	jr	00107$
   95F1                    2882 00106$:
   95F1 16 00         [ 7] 2883 	ld	d,#0x00
   95F3                    2884 00107$:
   95F3 7B            [ 4] 2885 	ld	a,e
   95F4 82            [ 4] 2886 	add	a, d
   95F5 02            [ 7] 2887 	ld	(bc),a
                           2888 ;src/entities/entities.c:924: ent->tpx = ent->px / 2;
   95F6 DD 7E FA      [19] 2889 	ld	a,-6 (ix)
   95F9 C6 1F         [ 7] 2890 	add	a, #0x1F
   95FB 4F            [ 4] 2891 	ld	c,a
   95FC DD 7E FB      [19] 2892 	ld	a,-5 (ix)
   95FF CE 00         [ 7] 2893 	adc	a, #0x00
   9601 47            [ 4] 2894 	ld	b,a
   9602 DD 6E FE      [19] 2895 	ld	l,-2 (ix)
   9605 DD 66 FF      [19] 2896 	ld	h,-1 (ix)
   9608 5E            [ 7] 2897 	ld	e,(hl)
   9609 23            [ 6] 2898 	inc	hl
   960A 56            [ 7] 2899 	ld	d,(hl)
   960B 6B            [ 4] 2900 	ld	l, e
   960C 62            [ 4] 2901 	ld	h, d
   960D CB 7A         [ 8] 2902 	bit	7, d
   960F 28 02         [12] 2903 	jr	Z,00108$
   9611 EB            [ 4] 2904 	ex	de,hl
   9612 23            [ 6] 2905 	inc	hl
   9613                    2906 00108$:
   9613 CB 2C         [ 8] 2907 	sra	h
   9615 CB 1D         [ 8] 2908 	rr	l
   9617 7D            [ 4] 2909 	ld	a,l
   9618 02            [ 7] 2910 	ld	(bc),a
                           2911 ;src/entities/entities.c:922: ent->th = ent->sh/4 + (ent->py & 3 ? 1 : 0);
   9619 DD 6E FC      [19] 2912 	ld	l,-4 (ix)
   961C DD 66 FD      [19] 2913 	ld	h,-3 (ix)
   961F 4E            [ 7] 2914 	ld	c,(hl)
   9620 23            [ 6] 2915 	inc	hl
   9621 46            [ 7] 2916 	ld	b,(hl)
                           2917 ;src/entities/entities.c:926: ent->tpy = (ent->py - ORIGEN_MAPA_Y) / 4;
   9622 DD 7E FA      [19] 2918 	ld	a,-6 (ix)
   9625 C6 20         [ 7] 2919 	add	a, #0x20
   9627 5F            [ 4] 2920 	ld	e,a
   9628 DD 7E FB      [19] 2921 	ld	a,-5 (ix)
   962B CE 00         [ 7] 2922 	adc	a, #0x00
   962D 57            [ 4] 2923 	ld	d,a
                           2924 ;src/entities/entities.c:925: if(origen == SI)
   962E DD 7E 06      [19] 2925 	ld	a,6 (ix)
   9631 3D            [ 4] 2926 	dec	a
   9632 20 28         [12] 2927 	jr	NZ,00102$
                           2928 ;src/entities/entities.c:926: ent->tpy = (ent->py - ORIGEN_MAPA_Y) / 4;
   9634 79            [ 4] 2929 	ld	a,c
   9635 C6 D8         [ 7] 2930 	add	a,#0xD8
   9637 DD 77 FC      [19] 2931 	ld	-4 (ix),a
   963A 78            [ 4] 2932 	ld	a,b
   963B CE FF         [ 7] 2933 	adc	a,#0xFF
   963D DD 77 FD      [19] 2934 	ld	-3 (ix),a
   9640 DD 6E FC      [19] 2935 	ld	l,-4 (ix)
   9643 DD 66 FD      [19] 2936 	ld	h,-3 (ix)
   9646 DD CB FD 7E   [20] 2937 	bit	7, -3 (ix)
   964A 28 04         [12] 2938 	jr	Z,00109$
   964C 21 DB FF      [10] 2939 	ld	hl,#0xFFDB
   964F 09            [11] 2940 	add	hl,bc
   9650                    2941 00109$:
   9650 CB 2C         [ 8] 2942 	sra	h
   9652 CB 1D         [ 8] 2943 	rr	l
   9654 CB 2C         [ 8] 2944 	sra	h
   9656 CB 1D         [ 8] 2945 	rr	l
   9658 7D            [ 4] 2946 	ld	a,l
   9659 12            [ 7] 2947 	ld	(de),a
   965A 18 15         [12] 2948 	jr	00103$
   965C                    2949 00102$:
                           2950 ;src/entities/entities.c:928: ent->tpy = (ent->py) / 4;
   965C 69            [ 4] 2951 	ld	l, c
   965D 60            [ 4] 2952 	ld	h, b
   965E CB 78         [ 8] 2953 	bit	7, b
   9660 28 05         [12] 2954 	jr	Z,00110$
   9662 69            [ 4] 2955 	ld	l, c
   9663 60            [ 4] 2956 	ld	h, b
   9664 23            [ 6] 2957 	inc	hl
   9665 23            [ 6] 2958 	inc	hl
   9666 23            [ 6] 2959 	inc	hl
   9667                    2960 00110$:
   9667 CB 2C         [ 8] 2961 	sra	h
   9669 CB 1D         [ 8] 2962 	rr	l
   966B CB 2C         [ 8] 2963 	sra	h
   966D CB 1D         [ 8] 2964 	rr	l
   966F 7D            [ 4] 2965 	ld	a,l
   9670 12            [ 7] 2966 	ld	(de),a
   9671                    2967 00103$:
                           2968 ;src/entities/entities.c:929: ent->coll.x = ent->x;
   9671 DD 7E FA      [19] 2969 	ld	a,-6 (ix)
   9674 C6 17         [ 7] 2970 	add	a, #0x17
   9676 4F            [ 4] 2971 	ld	c,a
   9677 DD 7E FB      [19] 2972 	ld	a,-5 (ix)
   967A CE 00         [ 7] 2973 	adc	a, #0x00
   967C 47            [ 4] 2974 	ld	b,a
   967D E1            [10] 2975 	pop	hl
   967E E5            [11] 2976 	push	hl
   967F 5E            [ 7] 2977 	ld	e,(hl)
   9680 23            [ 6] 2978 	inc	hl
   9681 56            [ 7] 2979 	ld	d,(hl)
   9682 7B            [ 4] 2980 	ld	a,e
   9683 02            [ 7] 2981 	ld	(bc),a
                           2982 ;src/entities/entities.c:930: ent->coll.y = ent->y;
   9684 FD 21 18 00   [14] 2983 	ld	iy,#0x0018
   9688 D1            [10] 2984 	pop	de
   9689 D5            [11] 2985 	push	de
   968A FD 19         [15] 2986 	add	iy, de
   968C E1            [10] 2987 	pop	hl
   968D E5            [11] 2988 	push	hl
   968E 23            [ 6] 2989 	inc	hl
   968F 23            [ 6] 2990 	inc	hl
   9690 E5            [11] 2991 	push	hl
   9691 4E            [ 7] 2992 	ld	c,(hl)
   9692 23            [ 6] 2993 	inc	hl
   9693 46            [ 7] 2994 	ld	b,(hl)
   9694 E1            [10] 2995 	pop	hl
   9695 FD 71 00      [19] 2996 	ld	0 (iy), c
                           2997 ;src/entities/entities.c:931: ent->vmem = cpct_getScreenPtr(CPCT_VMEM_START,ent->x, ent->y);
   9698 DD 7E FA      [19] 2998 	ld	a,-6 (ix)
   969B C6 21         [ 7] 2999 	add	a, #0x21
   969D 4F            [ 4] 3000 	ld	c,a
   969E DD 7E FB      [19] 3001 	ld	a,-5 (ix)
   96A1 CE 00         [ 7] 3002 	adc	a, #0x00
   96A3 47            [ 4] 3003 	ld	b,a
   96A4 5E            [ 7] 3004 	ld	e,(hl)
   96A5 23            [ 6] 3005 	inc	hl
   96A6 56            [ 7] 3006 	ld	d,(hl)
   96A7 7B            [ 4] 3007 	ld	a,e
   96A8 E1            [10] 3008 	pop	hl
   96A9 E5            [11] 3009 	push	hl
   96AA 5E            [ 7] 3010 	ld	e,(hl)
   96AB 23            [ 6] 3011 	inc	hl
   96AC 56            [ 7] 3012 	ld	d,(hl)
   96AD 53            [ 4] 3013 	ld	d,e
   96AE C5            [11] 3014 	push	bc
   96AF F5            [11] 3015 	push	af
   96B0 33            [ 6] 3016 	inc	sp
   96B1 D5            [11] 3017 	push	de
   96B2 33            [ 6] 3018 	inc	sp
   96B3 21 00 C0      [10] 3019 	ld	hl,#0xC000
   96B6 E5            [11] 3020 	push	hl
   96B7 CD 84 7A      [17] 3021 	call	_cpct_getScreenPtr
   96BA EB            [ 4] 3022 	ex	de,hl
   96BB C1            [10] 3023 	pop	bc
   96BC 7B            [ 4] 3024 	ld	a,e
   96BD 02            [ 7] 3025 	ld	(bc),a
   96BE 03            [ 6] 3026 	inc	bc
   96BF 7A            [ 4] 3027 	ld	a,d
   96C0 02            [ 7] 3028 	ld	(bc),a
   96C1 DD F9         [10] 3029 	ld	sp, ix
   96C3 DD E1         [14] 3030 	pop	ix
   96C5 C9            [10] 3031 	ret
                           3032 ;src/entities/entities.c:935: void calculaAllEntities(TPlayer* player){
                           3033 ;	---------------------------------
                           3034 ; Function calculaAllEntities
                           3035 ; ---------------------------------
   96C6                    3036 _calculaAllEntities::
   96C6 DD E5         [15] 3037 	push	ix
   96C8 DD 21 00 00   [14] 3038 	ld	ix,#0
   96CC DD 39         [15] 3039 	add	ix,sp
   96CE F5            [11] 3040 	push	af
   96CF F5            [11] 3041 	push	af
                           3042 ;src/entities/entities.c:938: exp = getExplosion();
   96D0 CD BD 63      [17] 3043 	call	_getExplosion
   96D3 4D            [ 4] 3044 	ld	c,l
   96D4 44            [ 4] 3045 	ld	b,h
                           3046 ;src/entities/entities.c:939: calculaEntity(&player->ent, SI);
   96D5 DD 5E 04      [19] 3047 	ld	e,4 (ix)
   96D8 DD 56 05      [19] 3048 	ld	d,5 (ix)
   96DB FD 21 26 00   [14] 3049 	ld	iy,#0x0026
   96DF FD 19         [15] 3050 	add	iy, de
   96E1 C5            [11] 3051 	push	bc
   96E2 D5            [11] 3052 	push	de
   96E3 3E 01         [ 7] 3053 	ld	a,#0x01
   96E5 F5            [11] 3054 	push	af
   96E6 33            [ 6] 3055 	inc	sp
   96E7 FD E5         [15] 3056 	push	iy
   96E9 CD 6C 95      [17] 3057 	call	_calculaEntity
   96EC F1            [10] 3058 	pop	af
   96ED 33            [ 6] 3059 	inc	sp
   96EE D1            [10] 3060 	pop	de
   96EF C1            [10] 3061 	pop	bc
                           3062 ;src/entities/entities.c:940: calculaEntity(&player->bullet.ent, SI);
   96F0 13            [ 6] 3063 	inc	de
   96F1 13            [ 6] 3064 	inc	de
   96F2 13            [ 6] 3065 	inc	de
   96F3 C5            [11] 3066 	push	bc
   96F4 3E 01         [ 7] 3067 	ld	a,#0x01
   96F6 F5            [11] 3068 	push	af
   96F7 33            [ 6] 3069 	inc	sp
   96F8 D5            [11] 3070 	push	de
   96F9 CD 6C 95      [17] 3071 	call	_calculaEntity
   96FC F1            [10] 3072 	pop	af
   96FD 33            [ 6] 3073 	inc	sp
   96FE C1            [10] 3074 	pop	bc
                           3075 ;src/entities/entities.c:941: calculaEntity(&exp->ent, SI);
   96FF 03            [ 6] 3076 	inc	bc
   9700 3E 01         [ 7] 3077 	ld	a,#0x01
   9702 F5            [11] 3078 	push	af
   9703 33            [ 6] 3079 	inc	sp
   9704 C5            [11] 3080 	push	bc
   9705 CD 6C 95      [17] 3081 	call	_calculaEntity
   9708 F1            [10] 3082 	pop	af
   9709 33            [ 6] 3083 	inc	sp
                           3084 ;src/entities/entities.c:942: for(i=0;i < NUM_ENEMIGOS;++i){
   970A DD 36 FC 00   [19] 3085 	ld	-4 (ix),#0x00
   970E 01 00 00      [10] 3086 	ld	bc,#0x0000
   9711                    3087 00104$:
                           3088 ;src/entities/entities.c:943: if(enemigos[i].ent.cuadrante == mapaActual){
   9711 21 03 87      [10] 3089 	ld	hl,#_enemigos
   9714 09            [11] 3090 	add	hl,bc
   9715 EB            [ 4] 3091 	ex	de,hl
   9716 21 26 00      [10] 3092 	ld	hl,#0x0026
   9719 19            [11] 3093 	add	hl,de
   971A DD 75 FE      [19] 3094 	ld	-2 (ix),l
   971D DD 74 FF      [19] 3095 	ld	-1 (ix),h
   9720 D5            [11] 3096 	push	de
   9721 FD E1         [14] 3097 	pop	iy
   9723 FD 7E 42      [19] 3098 	ld	a,66 (iy)
   9726 DD 77 FD      [19] 3099 	ld	-3 (ix),a
   9729 3A 03 86      [13] 3100 	ld	a,(#_mapaActual + 0)
   972C DD 96 FD      [19] 3101 	sub	a, -3 (ix)
   972F 20 27         [12] 3102 	jr	NZ,00105$
                           3103 ;src/entities/entities.c:944: calculaEntity(&enemigos[i].ent, SI);
   9731 DD 6E FE      [19] 3104 	ld	l,-2 (ix)
   9734 DD 66 FF      [19] 3105 	ld	h,-1 (ix)
   9737 E5            [11] 3106 	push	hl
   9738 FD E1         [14] 3107 	pop	iy
   973A C5            [11] 3108 	push	bc
   973B D5            [11] 3109 	push	de
   973C 3E 01         [ 7] 3110 	ld	a,#0x01
   973E F5            [11] 3111 	push	af
   973F 33            [ 6] 3112 	inc	sp
   9740 FD E5         [15] 3113 	push	iy
   9742 CD 6C 95      [17] 3114 	call	_calculaEntity
   9745 F1            [10] 3115 	pop	af
   9746 33            [ 6] 3116 	inc	sp
   9747 D1            [10] 3117 	pop	de
   9748 C1            [10] 3118 	pop	bc
                           3119 ;src/entities/entities.c:945: calculaEntity(&enemigos[i].bullet.ent, SI);
   9749 13            [ 6] 3120 	inc	de
   974A 13            [ 6] 3121 	inc	de
   974B 13            [ 6] 3122 	inc	de
   974C C5            [11] 3123 	push	bc
   974D 3E 01         [ 7] 3124 	ld	a,#0x01
   974F F5            [11] 3125 	push	af
   9750 33            [ 6] 3126 	inc	sp
   9751 D5            [11] 3127 	push	de
   9752 CD 6C 95      [17] 3128 	call	_calculaEntity
   9755 F1            [10] 3129 	pop	af
   9756 33            [ 6] 3130 	inc	sp
   9757 C1            [10] 3131 	pop	bc
   9758                    3132 00105$:
                           3133 ;src/entities/entities.c:942: for(i=0;i < NUM_ENEMIGOS;++i){
   9758 21 4E 00      [10] 3134 	ld	hl,#0x004E
   975B 09            [11] 3135 	add	hl,bc
   975C 4D            [ 4] 3136 	ld	c,l
   975D 44            [ 4] 3137 	ld	b,h
   975E DD 34 FC      [23] 3138 	inc	-4 (ix)
   9761 DD 7E FC      [19] 3139 	ld	a,-4 (ix)
   9764 D6 03         [ 7] 3140 	sub	a, #0x03
   9766 38 A9         [12] 3141 	jr	C,00104$
                           3142 ;src/entities/entities.c:949: calculaEntity(&bases[mapaActual].ent, SI);
   9768 ED 4B 03 86   [20] 3143 	ld	bc,(_mapaActual)
   976C 06 00         [ 7] 3144 	ld	b,#0x00
   976E 69            [ 4] 3145 	ld	l, c
   976F 60            [ 4] 3146 	ld	h, b
   9770 29            [11] 3147 	add	hl, hl
   9771 29            [11] 3148 	add	hl, hl
   9772 29            [11] 3149 	add	hl, hl
   9773 09            [11] 3150 	add	hl, bc
   9774 29            [11] 3151 	add	hl, hl
   9775 09            [11] 3152 	add	hl, bc
   9776 29            [11] 3153 	add	hl, hl
   9777 09            [11] 3154 	add	hl, bc
   9778 11 ED 87      [10] 3155 	ld	de,#_bases
   977B 19            [11] 3156 	add	hl,de
   977C 01 04 00      [10] 3157 	ld	bc,#0x0004
   977F 09            [11] 3158 	add	hl,bc
   9780 4D            [ 4] 3159 	ld	c, l
   9781 44            [ 4] 3160 	ld	b, h
   9782 3E 01         [ 7] 3161 	ld	a,#0x01
   9784 F5            [11] 3162 	push	af
   9785 33            [ 6] 3163 	inc	sp
   9786 C5            [11] 3164 	push	bc
   9787 CD 6C 95      [17] 3165 	call	_calculaEntity
   978A DD F9         [10] 3166 	ld	sp,ix
   978C DD E1         [14] 3167 	pop	ix
   978E C9            [10] 3168 	ret
                           3169 ;src/entities/entities.c:953: void drawAll(TPlayer* player){
                           3170 ;	---------------------------------
                           3171 ; Function drawAll
                           3172 ; ---------------------------------
   978F                    3173 _drawAll::
   978F DD E5         [15] 3174 	push	ix
   9791 DD 21 00 00   [14] 3175 	ld	ix,#0
   9795 DD 39         [15] 3176 	add	ix,sp
   9797 21 F9 FF      [10] 3177 	ld	hl,#-7
   979A 39            [11] 3178 	add	hl,sp
   979B F9            [ 6] 3179 	ld	sp,hl
                           3180 ;src/entities/entities.c:957: exp = getExplosion();
   979C CD BD 63      [17] 3181 	call	_getExplosion
   979F 33            [ 6] 3182 	inc	sp
   97A0 33            [ 6] 3183 	inc	sp
   97A1 E5            [11] 3184 	push	hl
                           3185 ;src/entities/entities.c:958: bases = getBases();
   97A2 CD D5 98      [17] 3186 	call	_getBases
   97A5 4D            [ 4] 3187 	ld	c,l
   97A6 44            [ 4] 3188 	ld	b,h
                           3189 ;src/entities/entities.c:965: if(bases[mapaActual].ent.sprites[0] != NULL){
   97A7 ED 5B 03 86   [20] 3190 	ld	de,(_mapaActual)
   97AB 16 00         [ 7] 3191 	ld	d,#0x00
   97AD 6B            [ 4] 3192 	ld	l, e
   97AE 62            [ 4] 3193 	ld	h, d
   97AF 29            [11] 3194 	add	hl, hl
   97B0 29            [11] 3195 	add	hl, hl
   97B1 29            [11] 3196 	add	hl, hl
   97B2 19            [11] 3197 	add	hl, de
   97B3 29            [11] 3198 	add	hl, hl
   97B4 19            [11] 3199 	add	hl, de
   97B5 29            [11] 3200 	add	hl, hl
   97B6 19            [11] 3201 	add	hl, de
   97B7 09            [11] 3202 	add	hl,bc
   97B8 4D            [ 4] 3203 	ld	c,l
   97B9 44            [ 4] 3204 	ld	b,h
   97BA 21 04 00      [10] 3205 	ld	hl,#0x0004
   97BD 09            [11] 3206 	add	hl,bc
   97BE EB            [ 4] 3207 	ex	de,hl
   97BF C5            [11] 3208 	push	bc
   97C0 FD E1         [14] 3209 	pop	iy
   97C2 FD 6E 0F      [19] 3210 	ld	l,15 (iy)
   97C5 FD 7E 10      [19] 3211 	ld	a, 16 (iy)
   97C8 B5            [ 4] 3212 	or	a,l
   97C9 28 1A         [12] 3213 	jr	Z,00102$
                           3214 ;src/entities/entities.c:966: redibujarEntity(&bases[mapaActual].ent, bases[mapaActual].ent.sw, bases[mapaActual].ent.sh);
   97CB 69            [ 4] 3215 	ld	l, c
   97CC 60            [ 4] 3216 	ld	h, b
   97CD C5            [11] 3217 	push	bc
   97CE 01 18 00      [10] 3218 	ld	bc, #0x0018
   97D1 09            [11] 3219 	add	hl, bc
   97D2 C1            [10] 3220 	pop	bc
   97D3 7E            [ 7] 3221 	ld	a,(hl)
   97D4 69            [ 4] 3222 	ld	l, c
   97D5 60            [ 4] 3223 	ld	h, b
   97D6 01 17 00      [10] 3224 	ld	bc, #0x0017
   97D9 09            [11] 3225 	add	hl, bc
   97DA 46            [ 7] 3226 	ld	b,(hl)
   97DB F5            [11] 3227 	push	af
   97DC 33            [ 6] 3228 	inc	sp
   97DD C5            [11] 3229 	push	bc
   97DE 33            [ 6] 3230 	inc	sp
   97DF D5            [11] 3231 	push	de
   97E0 CD 4F 94      [17] 3232 	call	_redibujarEntity
   97E3 F1            [10] 3233 	pop	af
   97E4 F1            [10] 3234 	pop	af
   97E5                    3235 00102$:
                           3236 ;src/entities/entities.c:969: redibujarEntity(&player->bullet.ent, player->bullet.ent.sw, player->bullet.ent.sh);
   97E5 DD 5E 04      [19] 3237 	ld	e,4 (ix)
   97E8 DD 56 05      [19] 3238 	ld	d,5 (ix)
   97EB D5            [11] 3239 	push	de
   97EC FD E1         [14] 3240 	pop	iy
   97EE FD 23         [10] 3241 	inc	iy
   97F0 FD 23         [10] 3242 	inc	iy
   97F2 FD 23         [10] 3243 	inc	iy
   97F4 6B            [ 4] 3244 	ld	l, e
   97F5 62            [ 4] 3245 	ld	h, d
   97F6 01 17 00      [10] 3246 	ld	bc, #0x0017
   97F9 09            [11] 3247 	add	hl, bc
   97FA 7E            [ 7] 3248 	ld	a,(hl)
   97FB 6B            [ 4] 3249 	ld	l, e
   97FC 62            [ 4] 3250 	ld	h, d
   97FD 01 16 00      [10] 3251 	ld	bc, #0x0016
   9800 09            [11] 3252 	add	hl, bc
   9801 46            [ 7] 3253 	ld	b,(hl)
   9802 D5            [11] 3254 	push	de
   9803 F5            [11] 3255 	push	af
   9804 33            [ 6] 3256 	inc	sp
   9805 C5            [11] 3257 	push	bc
   9806 33            [ 6] 3258 	inc	sp
   9807 FD E5         [15] 3259 	push	iy
   9809 CD 4F 94      [17] 3260 	call	_redibujarEntity
   980C F1            [10] 3261 	pop	af
   980D F1            [10] 3262 	pop	af
   980E D1            [10] 3263 	pop	de
                           3264 ;src/entities/entities.c:970: redibujarEntity(&player->ent, player->ent.sw, player->ent.sh);
   980F 21 26 00      [10] 3265 	ld	hl,#0x0026
   9812 19            [11] 3266 	add	hl,de
   9813 4D            [ 4] 3267 	ld	c,l
   9814 44            [ 4] 3268 	ld	b,h
   9815 D5            [11] 3269 	push	de
   9816 FD E1         [14] 3270 	pop	iy
   9818 FD 7E 3A      [19] 3271 	ld	a,58 (iy)
   981B EB            [ 4] 3272 	ex	de,hl
   981C 11 39 00      [10] 3273 	ld	de, #0x0039
   981F 19            [11] 3274 	add	hl, de
   9820 56            [ 7] 3275 	ld	d,(hl)
   9821 F5            [11] 3276 	push	af
   9822 33            [ 6] 3277 	inc	sp
   9823 D5            [11] 3278 	push	de
   9824 33            [ 6] 3279 	inc	sp
   9825 C5            [11] 3280 	push	bc
   9826 CD 4F 94      [17] 3281 	call	_redibujarEntity
   9829 F1            [10] 3282 	pop	af
   982A F1            [10] 3283 	pop	af
                           3284 ;src/entities/entities.c:971: redibujarEntity(&exp->ent,exp->ent.sw,exp->ent.sh);
   982B C1            [10] 3285 	pop	bc
   982C C5            [11] 3286 	push	bc
   982D 03            [ 6] 3287 	inc	bc
   982E C5            [11] 3288 	push	bc
   982F FD E1         [14] 3289 	pop	iy
   9831 FD 5E 14      [19] 3290 	ld	e,20 (iy)
   9834 C5            [11] 3291 	push	bc
   9835 FD E1         [14] 3292 	pop	iy
   9837 FD 56 13      [19] 3293 	ld	d,19 (iy)
   983A 7B            [ 4] 3294 	ld	a,e
   983B F5            [11] 3295 	push	af
   983C 33            [ 6] 3296 	inc	sp
   983D D5            [11] 3297 	push	de
   983E 33            [ 6] 3298 	inc	sp
   983F C5            [11] 3299 	push	bc
   9840 CD 4F 94      [17] 3300 	call	_redibujarEntity
   9843 F1            [10] 3301 	pop	af
   9844 F1            [10] 3302 	pop	af
                           3303 ;src/entities/entities.c:973: for(i = 0; i < NUM_ENEMIGOS; ++i){
   9845 DD 36 FB 00   [19] 3304 	ld	-5 (ix),#0x00
   9849 DD 36 FE 00   [19] 3305 	ld	-2 (ix),#0x00
   984D DD 36 FF 00   [19] 3306 	ld	-1 (ix),#0x00
   9851                    3307 00106$:
                           3308 ;src/entities/entities.c:974: if(enemigos[i].ent.cuadrante == mapaActual){
   9851 3E 03         [ 7] 3309 	ld	a,#<(_enemigos)
   9853 DD 86 FE      [19] 3310 	add	a, -2 (ix)
   9856 5F            [ 4] 3311 	ld	e,a
   9857 3E 87         [ 7] 3312 	ld	a,#>(_enemigos)
   9859 DD 8E FF      [19] 3313 	adc	a, -1 (ix)
   985C 57            [ 4] 3314 	ld	d,a
   985D 21 26 00      [10] 3315 	ld	hl,#0x0026
   9860 19            [11] 3316 	add	hl,de
   9861 DD 75 FC      [19] 3317 	ld	-4 (ix),l
   9864 DD 74 FD      [19] 3318 	ld	-3 (ix),h
   9867 6B            [ 4] 3319 	ld	l, e
   9868 62            [ 4] 3320 	ld	h, d
   9869 01 42 00      [10] 3321 	ld	bc, #0x0042
   986C 09            [11] 3322 	add	hl, bc
   986D 4E            [ 7] 3323 	ld	c,(hl)
   986E 3A 03 86      [13] 3324 	ld	a,(#_mapaActual + 0)
   9871 91            [ 4] 3325 	sub	a, c
   9872 20 3E         [12] 3326 	jr	NZ,00107$
                           3327 ;src/entities/entities.c:975: redibujarEntity(&enemigos[i].ent, enemigos[i].ent.sw, enemigos[i].ent.sh);
   9874 D5            [11] 3328 	push	de
   9875 FD E1         [14] 3329 	pop	iy
   9877 FD 4E 3A      [19] 3330 	ld	c,58 (iy)
   987A 6B            [ 4] 3331 	ld	l, e
   987B 62            [ 4] 3332 	ld	h, d
   987C C5            [11] 3333 	push	bc
   987D 01 39 00      [10] 3334 	ld	bc, #0x0039
   9880 09            [11] 3335 	add	hl, bc
   9881 C1            [10] 3336 	pop	bc
   9882 66            [ 7] 3337 	ld	h,(hl)
   9883 DD 6E FC      [19] 3338 	ld	l,-4 (ix)
   9886 DD 46 FD      [19] 3339 	ld	b,-3 (ix)
   9889 D5            [11] 3340 	push	de
   988A 79            [ 4] 3341 	ld	a,c
   988B F5            [11] 3342 	push	af
   988C 33            [ 6] 3343 	inc	sp
   988D E5            [11] 3344 	push	hl
   988E 33            [ 6] 3345 	inc	sp
   988F 60            [ 4] 3346 	ld	h, b
   9890 E5            [11] 3347 	push	hl
   9891 CD 4F 94      [17] 3348 	call	_redibujarEntity
   9894 F1            [10] 3349 	pop	af
   9895 F1            [10] 3350 	pop	af
   9896 D1            [10] 3351 	pop	de
                           3352 ;src/entities/entities.c:976: redibujarEntity(&enemigos[i].bullet.ent, enemigos[i].bullet.ent.sw, enemigos[i].bullet.ent.sh);
   9897 4B            [ 4] 3353 	ld	c, e
   9898 42            [ 4] 3354 	ld	b, d
   9899 03            [ 6] 3355 	inc	bc
   989A 03            [ 6] 3356 	inc	bc
   989B 03            [ 6] 3357 	inc	bc
   989C D5            [11] 3358 	push	de
   989D FD E1         [14] 3359 	pop	iy
   989F FD 7E 17      [19] 3360 	ld	a,23 (iy)
   98A2 EB            [ 4] 3361 	ex	de,hl
   98A3 11 16 00      [10] 3362 	ld	de, #0x0016
   98A6 19            [11] 3363 	add	hl, de
   98A7 56            [ 7] 3364 	ld	d,(hl)
   98A8 F5            [11] 3365 	push	af
   98A9 33            [ 6] 3366 	inc	sp
   98AA D5            [11] 3367 	push	de
   98AB 33            [ 6] 3368 	inc	sp
   98AC C5            [11] 3369 	push	bc
   98AD CD 4F 94      [17] 3370 	call	_redibujarEntity
   98B0 F1            [10] 3371 	pop	af
   98B1 F1            [10] 3372 	pop	af
   98B2                    3373 00107$:
                           3374 ;src/entities/entities.c:973: for(i = 0; i < NUM_ENEMIGOS; ++i){
   98B2 DD 7E FE      [19] 3375 	ld	a,-2 (ix)
   98B5 C6 4E         [ 7] 3376 	add	a, #0x4E
   98B7 DD 77 FE      [19] 3377 	ld	-2 (ix),a
   98BA DD 7E FF      [19] 3378 	ld	a,-1 (ix)
   98BD CE 00         [ 7] 3379 	adc	a, #0x00
   98BF DD 77 FF      [19] 3380 	ld	-1 (ix),a
   98C2 DD 34 FB      [23] 3381 	inc	-5 (ix)
   98C5 DD 7E FB      [19] 3382 	ld	a,-5 (ix)
   98C8 D6 03         [ 7] 3383 	sub	a, #0x03
   98CA 38 85         [12] 3384 	jr	C,00106$
   98CC DD F9         [10] 3385 	ld	sp, ix
   98CE DD E1         [14] 3386 	pop	ix
   98D0 C9            [10] 3387 	ret
                           3388 ;src/entities/entities.c:983: TEnemy* getEnemies(){
                           3389 ;	---------------------------------
                           3390 ; Function getEnemies
                           3391 ; ---------------------------------
   98D1                    3392 _getEnemies::
                           3393 ;src/entities/entities.c:984: return enemigos;
   98D1 21 03 87      [10] 3394 	ld	hl,#_enemigos
   98D4 C9            [10] 3395 	ret
                           3396 ;src/entities/entities.c:987: TBase* getBases(){
                           3397 ;	---------------------------------
                           3398 ; Function getBases
                           3399 ; ---------------------------------
   98D5                    3400 _getBases::
                           3401 ;src/entities/entities.c:988: return bases;
   98D5 21 ED 87      [10] 3402 	ld	hl,#_bases
   98D8 C9            [10] 3403 	ret
                           3404 	.area _CODE
                           3405 	.area _INITIALIZER
   861E                    3406 __xinit__count1:
   861E 00                 3407 	.db #0x00	; 0
   861F                    3408 __xinit__turno:
   861F 00                 3409 	.db #0x00	; 0
   8620                    3410 __xinit__bulletsTurno:
   8620 00                 3411 	.db #0x00	; 0
                           3412 	.area _CABS (ABS)
