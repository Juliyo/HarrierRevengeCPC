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
   7D85                      69 _count1::
   7D85                      70 	.ds 1
   7D86                      71 _turno::
   7D86                      72 	.ds 1
   7D87                      73 _bulletsTurno::
   7D87                      74 	.ds 1
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
   64EF                      99 _dummy_cpct_transparentMaskTable0M0_container::
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
   7DA1                     140 _incializarEntities::
   7DA1 DD E5         [15]  141 	push	ix
   7DA3 DD 21 00 00   [14]  142 	ld	ix,#0
   7DA7 DD 39         [15]  143 	add	ix,sp
   7DA9 F5            [11]  144 	push	af
   7DAA F5            [11]  145 	push	af
   7DAB 3B            [ 6]  146 	dec	sp
                            147 ;src/entities/entities.c:434: TBase* bases = getBases();
   7DAC CD 4F 90      [17]  148 	call	_getBases
   7DAF DD 75 FE      [19]  149 	ld	-2 (ix),l
   7DB2 DD 74 FF      [19]  150 	ld	-1 (ix),h
                            151 ;src/entities/entities.c:435: TEnemy* enes = getEnemies();
   7DB5 CD 4B 90      [17]  152 	call	_getEnemies
   7DB8 DD 75 FC      [19]  153 	ld	-4 (ix),l
   7DBB DD 74 FD      [19]  154 	ld	-3 (ix),h
                            155 ;src/entities/entities.c:438: p->vida = 3;
   7DBE DD 4E 04      [19]  156 	ld	c,4 (ix)
   7DC1 DD 46 05      [19]  157 	ld	b,5 (ix)
   7DC4 21 49 00      [10]  158 	ld	hl,#0x0049
   7DC7 09            [11]  159 	add	hl,bc
   7DC8 36 03         [10]  160 	ld	(hl),#0x03
                            161 ;src/entities/entities.c:439: p->pvida = 3;
   7DCA 21 4A 00      [10]  162 	ld	hl,#0x004A
   7DCD 09            [11]  163 	add	hl,bc
   7DCE 36 03         [10]  164 	ld	(hl),#0x03
                            165 ;src/entities/entities.c:440: p->ent.x = px_spawn;
   7DD0 21 26 00      [10]  166 	ld	hl,#0x0026
   7DD3 09            [11]  167 	add	hl,bc
   7DD4 36 0A         [10]  168 	ld	(hl),#0x0A
   7DD6 23            [ 6]  169 	inc	hl
   7DD7 36 00         [10]  170 	ld	(hl),#0x00
                            171 ;src/entities/entities.c:441: p->ent.y = py_spawn;
   7DD9 21 28 00      [10]  172 	ld	hl,#0x0028
   7DDC 09            [11]  173 	add	hl,bc
   7DDD 36 AA         [10]  174 	ld	(hl),#0xAA
   7DDF 23            [ 6]  175 	inc	hl
   7DE0 36 00         [10]  176 	ld	(hl),#0x00
                            177 ;src/entities/entities.c:442: p->ent.draw = SI;
   7DE2 21 30 00      [10]  178 	ld	hl,#0x0030
   7DE5 09            [11]  179 	add	hl,bc
   7DE6 36 01         [10]  180 	ld	(hl),#0x01
                            181 ;src/entities/entities.c:443: p->puntuacion = 0;
   7DE8 21 4B 00      [10]  182 	ld	hl,#0x004B
   7DEB 09            [11]  183 	add	hl,bc
   7DEC AF            [ 4]  184 	xor	a, a
   7DED 77            [ 7]  185 	ld	(hl), a
   7DEE 23            [ 6]  186 	inc	hl
   7DEF 77            [ 7]  187 	ld	(hl), a
                            188 ;src/entities/entities.c:444: p->puntuacionPrev = 0;
   7DF0 21 4D 00      [10]  189 	ld	hl,#0x004D
   7DF3 09            [11]  190 	add	hl,bc
   7DF4 AF            [ 4]  191 	xor	a, a
   7DF5 77            [ 7]  192 	ld	(hl), a
   7DF6 23            [ 6]  193 	inc	hl
   7DF7 77            [ 7]  194 	ld	(hl), a
                            195 ;src/entities/entities.c:446: for(i = 0; i < NUM_BASES; ++i){
   7DF8 0E 00         [ 7]  196 	ld	c,#0x00
   7DFA 11 00 00      [10]  197 	ld	de,#0x0000
   7DFD                     198 00105$:
                            199 ;src/entities/entities.c:447: bases[i].whom = 1;
   7DFD DD 6E FE      [19]  200 	ld	l,-2 (ix)
   7E00 DD 66 FF      [19]  201 	ld	h,-1 (ix)
   7E03 19            [11]  202 	add	hl,de
   7E04 36 01         [10]  203 	ld	(hl),#0x01
                            204 ;src/entities/entities.c:448: bases[i].ent.sprites[0] = NULL;
   7E06 FD 21 0F 00   [14]  205 	ld	iy,#0x000F
   7E0A C5            [11]  206 	push	bc
   7E0B 4D            [ 4]  207 	ld	c, l
   7E0C 44            [ 4]  208 	ld	b, h
   7E0D FD 09         [15]  209 	add	iy, bc
   7E0F C1            [10]  210 	pop	bc
   7E10 FD 36 00 00   [19]  211 	ld	0 (iy),#0x00
   7E14 FD 36 01 00   [19]  212 	ld	1 (iy),#0x00
                            213 ;src/entities/entities.c:449: bases[i].cycles = 0;
   7E18 23            [ 6]  214 	inc	hl
   7E19 23            [ 6]  215 	inc	hl
   7E1A 23            [ 6]  216 	inc	hl
   7E1B 44            [ 4]  217 	ld	b,h
   7E1C 60            [ 4]  218 	ld	h, b
   7E1D 36 00         [10]  219 	ld	(hl),#0x00
                            220 ;src/entities/entities.c:446: for(i = 0; i < NUM_BASES; ++i){
   7E1F 21 27 00      [10]  221 	ld	hl,#0x0027
   7E22 19            [11]  222 	add	hl,de
   7E23 EB            [ 4]  223 	ex	de,hl
   7E24 0C            [ 4]  224 	inc	c
   7E25 79            [ 4]  225 	ld	a,c
   7E26 D6 06         [ 7]  226 	sub	a, #0x06
   7E28 38 D3         [12]  227 	jr	C,00105$
                            228 ;src/entities/entities.c:451: for(i = 0; i< NUM_ENEMIGOS; ++i){
   7E2A DD 36 FB 00   [19]  229 	ld	-5 (ix),#0x00
   7E2E 01 00 00      [10]  230 	ld	bc,#0x0000
   7E31                     231 00107$:
                            232 ;src/entities/entities.c:452: if(enes[i].ent.cuadrante == 0){
   7E31 DD 7E FC      [19]  233 	ld	a,-4 (ix)
   7E34 81            [ 4]  234 	add	a, c
   7E35 5F            [ 4]  235 	ld	e,a
   7E36 DD 7E FD      [19]  236 	ld	a,-3 (ix)
   7E39 88            [ 4]  237 	adc	a, b
   7E3A 57            [ 4]  238 	ld	d,a
   7E3B D5            [11]  239 	push	de
   7E3C FD E1         [14]  240 	pop	iy
   7E3E FD 7E 42      [19]  241 	ld	a,66 (iy)
   7E41 B7            [ 4]  242 	or	a, a
   7E42 20 12         [12]  243 	jr	NZ,00108$
                            244 ;src/entities/entities.c:453: enes[i].ent.vivo = 0;
   7E44 21 41 00      [10]  245 	ld	hl,#0x0041
   7E47 19            [11]  246 	add	hl,de
   7E48 36 00         [10]  247 	ld	(hl),#0x00
                            248 ;src/entities/entities.c:454: enes[i].bullet.ent.vivo = 0;
   7E4A 21 1E 00      [10]  249 	ld	hl,#0x001E
   7E4D 19            [11]  250 	add	hl,de
   7E4E 36 00         [10]  251 	ld	(hl),#0x00
                            252 ;src/entities/entities.c:455: enes[i].ent.draw = NO;
   7E50 21 30 00      [10]  253 	ld	hl,#0x0030
   7E53 19            [11]  254 	add	hl,de
   7E54 36 00         [10]  255 	ld	(hl),#0x00
   7E56                     256 00108$:
                            257 ;src/entities/entities.c:451: for(i = 0; i< NUM_ENEMIGOS; ++i){
   7E56 21 4E 00      [10]  258 	ld	hl,#0x004E
   7E59 09            [11]  259 	add	hl,bc
   7E5A 4D            [ 4]  260 	ld	c,l
   7E5B 44            [ 4]  261 	ld	b,h
   7E5C DD 34 FB      [23]  262 	inc	-5 (ix)
   7E5F DD 7E FB      [19]  263 	ld	a,-5 (ix)
   7E62 D6 03         [ 7]  264 	sub	a, #0x03
   7E64 38 CB         [12]  265 	jr	C,00107$
                            266 ;src/entities/entities.c:458: wshot_cycles = 30;
   7E66 21 82 7D      [10]  267 	ld	hl,#_wshot_cycles + 0
   7E69 36 1E         [10]  268 	ld	(hl), #0x1E
                            269 ;src/entities/entities.c:459: basesCapturadas = 0;
   7E6B 21 80 7D      [10]  270 	ld	hl,#_basesCapturadas + 0
   7E6E 36 00         [10]  271 	ld	(hl), #0x00
                            272 ;src/entities/entities.c:460: prev_basesCapturadas = 0;
   7E70 21 81 7D      [10]  273 	ld	hl,#_prev_basesCapturadas + 0
   7E73 36 00         [10]  274 	ld	(hl), #0x00
                            275 ;src/entities/entities.c:462: inicializarWaveManager();
   7E75 CD 9C 65      [17]  276 	call	_inicializarWaveManager
   7E78 DD F9         [10]  277 	ld	sp, ix
   7E7A DD E1         [14]  278 	pop	ix
   7E7C C9            [10]  279 	ret
   7E7D                     280 _enemigos:
   7E7D 00                  281 	.db #0x00	; 0
   7E7E 01                  282 	.db #0x01	; 1
   7E7F 00                  283 	.db #0x00	; 0
   7E80 00 00               284 	.dw #0x0000
   7E82 00 00               285 	.dw #0x0000
   7E84 00 00               286 	.dw #0x0000
   7E86 00 00               287 	.dw #0x0000
   7E88 02                  288 	.db #0x02	; 2
   7E89 04                  289 	.db #0x04	; 4
   7E8A 00                  290 	.db #0x00	; 0
   7E8B 40 55               291 	.dw _g_bala_enemiga
   7E8D 40 55               292 	.dw _g_bala_enemiga
   7E8F 40 55               293 	.dw _g_bala_enemiga
   7E91 40 55               294 	.dw _g_bala_enemiga
   7E93 02                  295 	.db #0x02	; 2
   7E94 04                  296 	.db #0x04	; 4
   7E95 00                  297 	.db #0x00	; 0
   7E96 02                  298 	.db #0x02	; 2
   7E97 00                  299 	.db #0x00	; 0
   7E98 00                  300 	.db #0x00	; 0
   7E99 02                  301 	.db #0x02	; 2
   7E9A 04                  302 	.db #0x04	; 4
   7E9B 00                  303 	.db #0x00	; 0
   7E9C 02                  304 	.db #0x02	; 2
   7E9D 00                  305 	.db #0x00	; 0
   7E9E 00                  306 	.db #0x00	; 0
   7E9F 00                  307 	.db #0x00	; 0
   7EA0 00                  308 	.db #0x00	; 0
   7EA1 00 00               309 	.dw #0x0000
   7EA3 32 00               310 	.dw #0x0032
   7EA5 9D 00               311 	.dw #0x009D
   7EA7 32 00               312 	.dw #0x0032
   7EA9 9D 00               313 	.dw #0x009D
   7EAB 01                  314 	.db #0x01	; 1
   7EAC 02                  315 	.db #0x02	; 2
   7EAD 01                  316 	.db #0x01	; 1
   7EAE 68 56               317 	.dw _g_naveEnemiga1_0
   7EB0 88 56               318 	.dw _g_naveEnemiga1_1
   7EB2 A8 56               319 	.dw _g_naveEnemiga1_2
   7EB4 C8 56               320 	.dw _g_naveEnemiga1_3
   7EB6 04                  321 	.db #0x04	; 4
   7EB7 08                  322 	.db #0x08	; 8
   7EB8 00                  323 	.db #0x00	; 0
   7EB9 00                  324 	.db #0x00	; 0
   7EBA 32                  325 	.db #0x32	; 50	'2'
   7EBB 9D                  326 	.db #0x9D	; 157
   7EBC 04                  327 	.db #0x04	; 4
   7EBD 08                  328 	.db #0x08	; 8
   7EBE 01                  329 	.db #0x01	; 1
   7EBF 02                  330 	.db #0x02	; 2
   7EC0 00                  331 	.db #0x00	; 0
   7EC1 00                  332 	.db #0x00	; 0
   7EC2 00                  333 	.db #0x00	; 0
   7EC3 00                  334 	.db #0x00	; 0
   7EC4 00 00               335 	.dw #0x0000
   7EC6 00                  336 	.db #0x00	; 0
   7EC7 00                  337 	.db #0x00	; 0
   7EC8 01                  338 	.db #0x01	; 1
   7EC9 00                  339 	.db #0x00	; 0
   7ECA 00                  340 	.db #0x00	; 0
   7ECB 00                  341 	.db #0x00	; 0
   7ECC 01                  342 	.db #0x01	; 1
   7ECD 00                  343 	.db #0x00	; 0
   7ECE 00 00               344 	.dw #0x0000
   7ED0 00 00               345 	.dw #0x0000
   7ED2 00 00               346 	.dw #0x0000
   7ED4 00 00               347 	.dw #0x0000
   7ED6 02                  348 	.db #0x02	; 2
   7ED7 04                  349 	.db #0x04	; 4
   7ED8 00                  350 	.db #0x00	; 0
   7ED9 40 55               351 	.dw _g_bala_enemiga
   7EDB 40 55               352 	.dw _g_bala_enemiga
   7EDD 40 55               353 	.dw _g_bala_enemiga
   7EDF 40 55               354 	.dw _g_bala_enemiga
   7EE1 02                  355 	.db #0x02	; 2
   7EE2 04                  356 	.db #0x04	; 4
   7EE3 00                  357 	.db #0x00	; 0
   7EE4 02                  358 	.db #0x02	; 2
   7EE5 00                  359 	.db #0x00	; 0
   7EE6 00                  360 	.db #0x00	; 0
   7EE7 02                  361 	.db #0x02	; 2
   7EE8 04                  362 	.db #0x04	; 4
   7EE9 00                  363 	.db #0x00	; 0
   7EEA 04                  364 	.db #0x04	; 4
   7EEB 00                  365 	.db #0x00	; 0
   7EEC 00                  366 	.db #0x00	; 0
   7EED 00                  367 	.db #0x00	; 0
   7EEE 00                  368 	.db #0x00	; 0
   7EEF 00 00               369 	.dw #0x0000
   7EF1 14 00               370 	.dw #0x0014
   7EF3 32 00               371 	.dw #0x0032
   7EF5 14 00               372 	.dw #0x0014
   7EF7 32 00               373 	.dw #0x0032
   7EF9 01                  374 	.db #0x01	; 1
   7EFA 02                  375 	.db #0x02	; 2
   7EFB 01                  376 	.db #0x01	; 1
   7EFC E8 55               377 	.dw _g_naveEnemiga2_0
   7EFE 08 56               378 	.dw _g_naveEnemiga2_1
   7F00 28 56               379 	.dw _g_naveEnemiga2_2
   7F02 48 56               380 	.dw _g_naveEnemiga2_3
   7F04 04                  381 	.db #0x04	; 4
   7F05 08                  382 	.db #0x08	; 8
   7F06 00                  383 	.db #0x00	; 0
   7F07 00                  384 	.db #0x00	; 0
   7F08 14                  385 	.db #0x14	; 20
   7F09 32                  386 	.db #0x32	; 50	'2'
   7F0A 04                  387 	.db #0x04	; 4
   7F0B 08                  388 	.db #0x08	; 8
   7F0C 01                  389 	.db #0x01	; 1
   7F0D 04                  390 	.db #0x04	; 4
   7F0E 00                  391 	.db #0x00	; 0
   7F0F 00                  392 	.db #0x00	; 0
   7F10 00                  393 	.db #0x00	; 0
   7F11 00                  394 	.db #0x00	; 0
   7F12 00 00               395 	.dw #0x0000
   7F14 00                  396 	.db #0x00	; 0
   7F15 00                  397 	.db #0x00	; 0
   7F16 01                  398 	.db #0x01	; 1
   7F17 00                  399 	.db #0x00	; 0
   7F18 00                  400 	.db #0x00	; 0
   7F19 00                  401 	.db #0x00	; 0
   7F1A 01                  402 	.db #0x01	; 1
   7F1B 00                  403 	.db #0x00	; 0
   7F1C 00 00               404 	.dw #0x0000
   7F1E 00 00               405 	.dw #0x0000
   7F20 00 00               406 	.dw #0x0000
   7F22 00 00               407 	.dw #0x0000
   7F24 02                  408 	.db #0x02	; 2
   7F25 04                  409 	.db #0x04	; 4
   7F26 00                  410 	.db #0x00	; 0
   7F27 40 55               411 	.dw _g_bala_enemiga
   7F29 40 55               412 	.dw _g_bala_enemiga
   7F2B 40 55               413 	.dw _g_bala_enemiga
   7F2D 40 55               414 	.dw _g_bala_enemiga
   7F2F 02                  415 	.db #0x02	; 2
   7F30 04                  416 	.db #0x04	; 4
   7F31 00                  417 	.db #0x00	; 0
   7F32 02                  418 	.db #0x02	; 2
   7F33 00                  419 	.db #0x00	; 0
   7F34 00                  420 	.db #0x00	; 0
   7F35 02                  421 	.db #0x02	; 2
   7F36 04                  422 	.db #0x04	; 4
   7F37 00                  423 	.db #0x00	; 0
   7F38 00                  424 	.db #0x00	; 0
   7F39 00                  425 	.db #0x00	; 0
   7F3A 00                  426 	.db #0x00	; 0
   7F3B 00                  427 	.db #0x00	; 0
   7F3C 00                  428 	.db #0x00	; 0
   7F3D 00 00               429 	.dw #0x0000
   7F3F 23 00               430 	.dw #0x0023
   7F41 78 00               431 	.dw #0x0078
   7F43 23 00               432 	.dw #0x0023
   7F45 78 00               433 	.dw #0x0078
   7F47 01                  434 	.db #0x01	; 1
   7F48 02                  435 	.db #0x02	; 2
   7F49 01                  436 	.db #0x01	; 1
   7F4A 68 55               437 	.dw _g_naveEnemiga3_0
   7F4C 88 55               438 	.dw _g_naveEnemiga3_1
   7F4E A8 55               439 	.dw _g_naveEnemiga3_2
   7F50 C8 55               440 	.dw _g_naveEnemiga3_3
   7F52 04                  441 	.db #0x04	; 4
   7F53 08                  442 	.db #0x08	; 8
   7F54 00                  443 	.db #0x00	; 0
   7F55 00                  444 	.db #0x00	; 0
   7F56 23                  445 	.db #0x23	; 35
   7F57 78                  446 	.db #0x78	; 120	'x'
   7F58 04                  447 	.db #0x04	; 4
   7F59 08                  448 	.db #0x08	; 8
   7F5A 01                  449 	.db #0x01	; 1
   7F5B 00                  450 	.db #0x00	; 0
   7F5C 00                  451 	.db #0x00	; 0
   7F5D 00                  452 	.db #0x00	; 0
   7F5E 00                  453 	.db #0x00	; 0
   7F5F 00                  454 	.db #0x00	; 0
   7F60 00 00               455 	.dw #0x0000
   7F62 00                  456 	.db #0x00	; 0
   7F63 00                  457 	.db #0x00	; 0
   7F64 01                  458 	.db #0x01	; 1
   7F65 00                  459 	.db #0x00	; 0
   7F66 00                  460 	.db #0x00	; 0
   7F67                     461 _bases:
   7F67 01                  462 	.db #0x01	; 1
   7F68 64                  463 	.db #0x64	; 100	'd'
   7F69 C8                  464 	.db #0xC8	; 200
   7F6A 00                  465 	.db #0x00	; 0
   7F6B 30 00               466 	.dw #0x0030
   7F6D 9C 00               467 	.dw #0x009C
   7F6F 30 00               468 	.dw #0x0030
   7F71 9C 00               469 	.dw #0x009C
   7F73 00                  470 	.db #0x00	; 0
   7F74 00                  471 	.db #0x00	; 0
   7F75 01                  472 	.db #0x01	; 1
   7F76 00 00               473 	.dw #0x0000
   7F78 00 00               474 	.dw #0x0000
   7F7A 00 00               475 	.dw #0x0000
   7F7C 00 00               476 	.dw #0x0000
   7F7E 08                  477 	.db #0x08	; 8
   7F7F 14                  478 	.db #0x14	; 20
   7F80 00                  479 	.db #0x00	; 0
   7F81 03                  480 	.db #0x03	; 3
   7F82 30                  481 	.db #0x30	; 48	'0'
   7F83 9C                  482 	.db #0x9C	; 156
   7F84 08                  483 	.db #0x08	; 8
   7F85 14                  484 	.db #0x14	; 20
   7F86 01                  485 	.db #0x01	; 1
   7F87 00                  486 	.db #0x00	; 0
   7F88 00                  487 	.db #0x00	; 0
   7F89 00                  488 	.db #0x00	; 0
   7F8A 00                  489 	.db #0x00	; 0
   7F8B 00                  490 	.db #0x00	; 0
   7F8C 00 00               491 	.dw #0x0000
   7F8E 01                  492 	.db #0x01	; 1
   7F8F 64                  493 	.db #0x64	; 100	'd'
   7F90 E8                  494 	.db #0xE8	; 232
   7F91 00                  495 	.db #0x00	; 0
   7F92 2E 00               496 	.dw #0x002E
   7F94 64 00               497 	.dw #0x0064
   7F96 2E 00               498 	.dw #0x002E
   7F98 64 00               499 	.dw #0x0064
   7F9A 00                  500 	.db #0x00	; 0
   7F9B 00                  501 	.db #0x00	; 0
   7F9C 01                  502 	.db #0x01	; 1
   7F9D 00 00               503 	.dw #0x0000
   7F9F 00 00               504 	.dw #0x0000
   7FA1 00 00               505 	.dw #0x0000
   7FA3 00 00               506 	.dw #0x0000
   7FA5 08                  507 	.db #0x08	; 8
   7FA6 14                  508 	.db #0x14	; 20
   7FA7 00                  509 	.db #0x00	; 0
   7FA8 03                  510 	.db #0x03	; 3
   7FA9 2E                  511 	.db #0x2E	; 46
   7FAA 64                  512 	.db #0x64	; 100	'd'
   7FAB 08                  513 	.db #0x08	; 8
   7FAC 14                  514 	.db #0x14	; 20
   7FAD 01                  515 	.db #0x01	; 1
   7FAE 01                  516 	.db #0x01	; 1
   7FAF 00                  517 	.db #0x00	; 0
   7FB0 00                  518 	.db #0x00	; 0
   7FB1 00                  519 	.db #0x00	; 0
   7FB2 00                  520 	.db #0x00	; 0
   7FB3 00 00               521 	.dw #0x0000
   7FB5 01                  522 	.db #0x01	; 1
   7FB6 64                  523 	.db #0x64	; 100	'd'
   7FB7 E8                  524 	.db #0xE8	; 232
   7FB8 00                  525 	.db #0x00	; 0
   7FB9 04 00               526 	.dw #0x0004
   7FBB 70 00               527 	.dw #0x0070
   7FBD 04 00               528 	.dw #0x0004
   7FBF 70 00               529 	.dw #0x0070
   7FC1 00                  530 	.db #0x00	; 0
   7FC2 00                  531 	.db #0x00	; 0
   7FC3 01                  532 	.db #0x01	; 1
   7FC4 00 00               533 	.dw #0x0000
   7FC6 00 00               534 	.dw #0x0000
   7FC8 00 00               535 	.dw #0x0000
   7FCA 00 00               536 	.dw #0x0000
   7FCC 08                  537 	.db #0x08	; 8
   7FCD 14                  538 	.db #0x14	; 20
   7FCE 00                  539 	.db #0x00	; 0
   7FCF 03                  540 	.db #0x03	; 3
   7FD0 04                  541 	.db #0x04	; 4
   7FD1 70                  542 	.db #0x70	; 112	'p'
   7FD2 08                  543 	.db #0x08	; 8
   7FD3 14                  544 	.db #0x14	; 20
   7FD4 01                  545 	.db #0x01	; 1
   7FD5 02                  546 	.db #0x02	; 2
   7FD6 00                  547 	.db #0x00	; 0
   7FD7 00                  548 	.db #0x00	; 0
   7FD8 00                  549 	.db #0x00	; 0
   7FD9 00                  550 	.db #0x00	; 0
   7FDA 00 00               551 	.dw #0x0000
   7FDC 01                  552 	.db #0x01	; 1
   7FDD 64                  553 	.db #0x64	; 100	'd'
   7FDE E8                  554 	.db #0xE8	; 232
   7FDF 00                  555 	.db #0x00	; 0
   7FE0 44 00               556 	.dw #0x0044
   7FE2 88 00               557 	.dw #0x0088
   7FE4 88 00               558 	.dw #0x0088
   7FE6 88 00               559 	.dw #0x0088
   7FE8 00                  560 	.db #0x00	; 0
   7FE9 00                  561 	.db #0x00	; 0
   7FEA 01                  562 	.db #0x01	; 1
   7FEB 00 00               563 	.dw #0x0000
   7FED 00 00               564 	.dw #0x0000
   7FEF 00 00               565 	.dw #0x0000
   7FF1 00 00               566 	.dw #0x0000
   7FF3 08                  567 	.db #0x08	; 8
   7FF4 14                  568 	.db #0x14	; 20
   7FF5 00                  569 	.db #0x00	; 0
   7FF6 03                  570 	.db #0x03	; 3
   7FF7 44                  571 	.db #0x44	; 68	'D'
   7FF8 88                  572 	.db #0x88	; 136
   7FF9 08                  573 	.db #0x08	; 8
   7FFA 14                  574 	.db #0x14	; 20
   7FFB 01                  575 	.db #0x01	; 1
   7FFC 03                  576 	.db #0x03	; 3
   7FFD 00                  577 	.db #0x00	; 0
   7FFE 00                  578 	.db #0x00	; 0
   7FFF 00                  579 	.db #0x00	; 0
   8000 00                  580 	.db #0x00	; 0
   8001 00 00               581 	.dw #0x0000
   8003 01                  582 	.db #0x01	; 1
   8004 64                  583 	.db #0x64	; 100	'd'
   8005 E8                  584 	.db #0xE8	; 232
   8006 00                  585 	.db #0x00	; 0
   8007 04 00               586 	.dw #0x0004
   8009 44 00               587 	.dw #0x0044
   800B 04 00               588 	.dw #0x0004
   800D 44 00               589 	.dw #0x0044
   800F 00                  590 	.db #0x00	; 0
   8010 00                  591 	.db #0x00	; 0
   8011 01                  592 	.db #0x01	; 1
   8012 00 00               593 	.dw #0x0000
   8014 00 00               594 	.dw #0x0000
   8016 00 00               595 	.dw #0x0000
   8018 00 00               596 	.dw #0x0000
   801A 08                  597 	.db #0x08	; 8
   801B 14                  598 	.db #0x14	; 20
   801C 00                  599 	.db #0x00	; 0
   801D 03                  600 	.db #0x03	; 3
   801E 04                  601 	.db #0x04	; 4
   801F 44                  602 	.db #0x44	; 68	'D'
   8020 08                  603 	.db #0x08	; 8
   8021 14                  604 	.db #0x14	; 20
   8022 01                  605 	.db #0x01	; 1
   8023 04                  606 	.db #0x04	; 4
   8024 00                  607 	.db #0x00	; 0
   8025 00                  608 	.db #0x00	; 0
   8026 00                  609 	.db #0x00	; 0
   8027 00                  610 	.db #0x00	; 0
   8028 00 00               611 	.dw #0x0000
   802A 01                  612 	.db #0x01	; 1
   802B 64                  613 	.db #0x64	; 100	'd'
   802C E8                  614 	.db #0xE8	; 232
   802D 00                  615 	.db #0x00	; 0
   802E 44 00               616 	.dw #0x0044
   8030 68 00               617 	.dw #0x0068
   8032 44 00               618 	.dw #0x0044
   8034 68 00               619 	.dw #0x0068
   8036 00                  620 	.db #0x00	; 0
   8037 00                  621 	.db #0x00	; 0
   8038 01                  622 	.db #0x01	; 1
   8039 00 00               623 	.dw #0x0000
   803B 00 00               624 	.dw #0x0000
   803D 00 00               625 	.dw #0x0000
   803F 00 00               626 	.dw #0x0000
   8041 08                  627 	.db #0x08	; 8
   8042 14                  628 	.db #0x14	; 20
   8043 00                  629 	.db #0x00	; 0
   8044 03                  630 	.db #0x03	; 3
   8045 44                  631 	.db #0x44	; 68	'D'
   8046 68                  632 	.db #0x68	; 104	'h'
   8047 08                  633 	.db #0x08	; 8
   8048 14                  634 	.db #0x14	; 20
   8049 01                  635 	.db #0x01	; 1
   804A 05                  636 	.db #0x05	; 5
   804B 00                  637 	.db #0x00	; 0
   804C 00                  638 	.db #0x00	; 0
   804D 00                  639 	.db #0x00	; 0
   804E 00                  640 	.db #0x00	; 0
   804F 00 00               641 	.dw #0x0000
   8051                     642 _puntos:
   8051 28                  643 	.db #0x28	; 40
   8052 3C                  644 	.db #0x3C	; 60
   8053 28                  645 	.db #0x28	; 40
   8054 B9                  646 	.db #0xB9	; 185
   8055 41                  647 	.db #0x41	; 65	'A'
   8056 64                  648 	.db #0x64	; 100	'd'
   8057 0A                  649 	.db #0x0A	; 10
   8058 64                  650 	.db #0x64	; 100	'd'
                            651 ;src/entities/entities.c:466: TPlayerDirection accion(TEntity* ent, TPlayerStatus action, TPlayerDirection dir){
                            652 ;	---------------------------------
                            653 ; Function accion
                            654 ; ---------------------------------
   8059                     655 _accion::
   8059 DD E5         [15]  656 	push	ix
   805B DD 21 00 00   [14]  657 	ld	ix,#0
   805F DD 39         [15]  658 	add	ix,sp
   8061 3B            [ 6]  659 	dec	sp
                            660 ;src/entities/entities.c:468: switch(action){
   8062 DD 7E 06      [19]  661 	ld	a,6 (ix)
   8065 3D            [ 4]  662 	dec	a
   8066 C2 06 81      [10]  663 	jp	NZ,00107$
                            664 ;src/entities/entities.c:470: switch(dir){
   8069 3E 03         [ 7]  665 	ld	a,#0x03
   806B DD 96 07      [19]  666 	sub	a, 7 (ix)
   806E DA 06 81      [10]  667 	jp	C,00107$
   8071 DD 5E 07      [19]  668 	ld	e,7 (ix)
   8074 16 00         [ 7]  669 	ld	d,#0x00
   8076 21 7C 80      [10]  670 	ld	hl,#00120$
   8079 19            [11]  671 	add	hl,de
   807A 19            [11]  672 	add	hl,de
                            673 ;src/entities/entities.c:471: case d_up:
   807B E9            [ 4]  674 	jp	(hl)
   807C                     675 00120$:
   807C 18 06         [12]  676 	jr	00102$
   807E 18 67         [12]  677 	jr	00105$
   8080 18 23         [12]  678 	jr	00103$
   8082 18 42         [12]  679 	jr	00104$
   8084                     680 00102$:
                            681 ;src/entities/entities.c:472: collision = moverArriba(ent);
   8084 DD 6E 04      [19]  682 	ld	l,4 (ix)
   8087 DD 66 05      [19]  683 	ld	h,5 (ix)
   808A E5            [11]  684 	push	hl
   808B CD 27 81      [17]  685 	call	_moverArriba
   808E F1            [10]  686 	pop	af
   808F 4D            [ 4]  687 	ld	c,l
                            688 ;src/entities/entities.c:473: flipSprite(ent,dir);
   8090 C5            [11]  689 	push	bc
   8091 DD 7E 07      [19]  690 	ld	a,7 (ix)
   8094 F5            [11]  691 	push	af
   8095 33            [ 6]  692 	inc	sp
   8096 DD 6E 04      [19]  693 	ld	l,4 (ix)
   8099 DD 66 05      [19]  694 	ld	h,5 (ix)
   809C E5            [11]  695 	push	hl
   809D CD 0B 81      [17]  696 	call	_flipSprite
   80A0 F1            [10]  697 	pop	af
   80A1 33            [ 6]  698 	inc	sp
   80A2 C1            [10]  699 	pop	bc
                            700 ;src/entities/entities.c:474: break;
   80A3 18 61         [12]  701 	jr	00107$
                            702 ;src/entities/entities.c:475: case d_down:
   80A5                     703 00103$:
                            704 ;src/entities/entities.c:476: collision = moverAbajo(ent);
   80A5 DD 6E 04      [19]  705 	ld	l,4 (ix)
   80A8 DD 66 05      [19]  706 	ld	h,5 (ix)
   80AB E5            [11]  707 	push	hl
   80AC CD 88 81      [17]  708 	call	_moverAbajo
   80AF F1            [10]  709 	pop	af
   80B0 4D            [ 4]  710 	ld	c,l
                            711 ;src/entities/entities.c:477: flipSprite(ent,dir);
   80B1 C5            [11]  712 	push	bc
   80B2 DD 7E 07      [19]  713 	ld	a,7 (ix)
   80B5 F5            [11]  714 	push	af
   80B6 33            [ 6]  715 	inc	sp
   80B7 DD 6E 04      [19]  716 	ld	l,4 (ix)
   80BA DD 66 05      [19]  717 	ld	h,5 (ix)
   80BD E5            [11]  718 	push	hl
   80BE CD 0B 81      [17]  719 	call	_flipSprite
   80C1 F1            [10]  720 	pop	af
   80C2 33            [ 6]  721 	inc	sp
   80C3 C1            [10]  722 	pop	bc
                            723 ;src/entities/entities.c:478: break;
   80C4 18 40         [12]  724 	jr	00107$
                            725 ;src/entities/entities.c:479: case d_left:
   80C6                     726 00104$:
                            727 ;src/entities/entities.c:480: collision = moverIzquierda(ent);
   80C6 DD 6E 04      [19]  728 	ld	l,4 (ix)
   80C9 DD 66 05      [19]  729 	ld	h,5 (ix)
   80CC E5            [11]  730 	push	hl
   80CD CD 2B 82      [17]  731 	call	_moverIzquierda
   80D0 F1            [10]  732 	pop	af
   80D1 4D            [ 4]  733 	ld	c,l
                            734 ;src/entities/entities.c:481: flipSprite(ent,dir);
   80D2 C5            [11]  735 	push	bc
   80D3 DD 7E 07      [19]  736 	ld	a,7 (ix)
   80D6 F5            [11]  737 	push	af
   80D7 33            [ 6]  738 	inc	sp
   80D8 DD 6E 04      [19]  739 	ld	l,4 (ix)
   80DB DD 66 05      [19]  740 	ld	h,5 (ix)
   80DE E5            [11]  741 	push	hl
   80DF CD 0B 81      [17]  742 	call	_flipSprite
   80E2 F1            [10]  743 	pop	af
   80E3 33            [ 6]  744 	inc	sp
   80E4 C1            [10]  745 	pop	bc
                            746 ;src/entities/entities.c:482: break;
   80E5 18 1F         [12]  747 	jr	00107$
                            748 ;src/entities/entities.c:483: case d_right:
   80E7                     749 00105$:
                            750 ;src/entities/entities.c:484: collision = moverDerecha(ent);
   80E7 DD 6E 04      [19]  751 	ld	l,4 (ix)
   80EA DD 66 05      [19]  752 	ld	h,5 (ix)
   80ED E5            [11]  753 	push	hl
   80EE CD 78 82      [17]  754 	call	_moverDerecha
   80F1 F1            [10]  755 	pop	af
   80F2 4D            [ 4]  756 	ld	c,l
                            757 ;src/entities/entities.c:485: flipSprite(ent,dir);
   80F3 C5            [11]  758 	push	bc
   80F4 DD 7E 07      [19]  759 	ld	a,7 (ix)
   80F7 F5            [11]  760 	push	af
   80F8 33            [ 6]  761 	inc	sp
   80F9 DD 6E 04      [19]  762 	ld	l,4 (ix)
   80FC DD 66 05      [19]  763 	ld	h,5 (ix)
   80FF E5            [11]  764 	push	hl
   8100 CD 0B 81      [17]  765 	call	_flipSprite
   8103 F1            [10]  766 	pop	af
   8104 33            [ 6]  767 	inc	sp
   8105 C1            [10]  768 	pop	bc
                            769 ;src/entities/entities.c:490: }
   8106                     770 00107$:
                            771 ;src/entities/entities.c:491: return collision;
   8106 69            [ 4]  772 	ld	l,c
   8107 33            [ 6]  773 	inc	sp
   8108 DD E1         [14]  774 	pop	ix
   810A C9            [10]  775 	ret
                            776 ;src/entities/entities.c:495: void flipSprite(TEntity* ent, TPlayerDirection dir){
                            777 ;	---------------------------------
                            778 ; Function flipSprite
                            779 ; ---------------------------------
   810B                     780 _flipSprite::
                            781 ;src/entities/entities.c:496: if(ent->curr_dir != dir){
   810B D1            [10]  782 	pop	de
   810C C1            [10]  783 	pop	bc
   810D C5            [11]  784 	push	bc
   810E D5            [11]  785 	push	de
   810F 21 15 00      [10]  786 	ld	hl,#0x0015
   8112 09            [11]  787 	add	hl,bc
   8113 4D            [ 4]  788 	ld	c,l
   8114 44            [ 4]  789 	ld	b,h
   8115 0A            [ 7]  790 	ld	a,(bc)
   8116 5F            [ 4]  791 	ld	e,a
   8117 FD 21 04 00   [14]  792 	ld	iy,#4
   811B FD 39         [15]  793 	add	iy,sp
   811D FD 7E 00      [19]  794 	ld	a,0 (iy)
   8120 93            [ 4]  795 	sub	a, e
   8121 C8            [11]  796 	ret	Z
                            797 ;src/entities/entities.c:497: ent->curr_dir = dir; 
   8122 FD 7E 00      [19]  798 	ld	a,0 (iy)
   8125 02            [ 7]  799 	ld	(bc),a
   8126 C9            [10]  800 	ret
                            801 ;src/entities/entities.c:501: TPlayerDirection moverArriba(TEntity* ent){
                            802 ;	---------------------------------
                            803 ; Function moverArriba
                            804 ; ---------------------------------
   8127                     805 _moverArriba::
   8127 DD E5         [15]  806 	push	ix
   8129 DD 21 00 00   [14]  807 	ld	ix,#0
   812D DD 39         [15]  808 	add	ix,sp
   812F F5            [11]  809 	push	af
                            810 ;src/entities/entities.c:504: ent->y -= ent->vy;
   8130 DD 4E 04      [19]  811 	ld	c,4 (ix)
   8133 DD 46 05      [19]  812 	ld	b,5 (ix)
   8136 21 02 00      [10]  813 	ld	hl,#0x0002
   8139 09            [11]  814 	add	hl,bc
   813A E3            [19]  815 	ex	(sp), hl
   813B E1            [10]  816 	pop	hl
   813C E5            [11]  817 	push	hl
   813D 5E            [ 7]  818 	ld	e,(hl)
   813E 23            [ 6]  819 	inc	hl
   813F 56            [ 7]  820 	ld	d,(hl)
   8140 C5            [11]  821 	push	bc
   8141 FD E1         [14]  822 	pop	iy
   8143 FD 6E 09      [19]  823 	ld	l,9 (iy)
   8146 26 00         [ 7]  824 	ld	h,#0x00
   8148 7B            [ 4]  825 	ld	a,e
   8149 95            [ 4]  826 	sub	a, l
   814A 5F            [ 4]  827 	ld	e,a
   814B 7A            [ 4]  828 	ld	a,d
   814C 9C            [ 4]  829 	sbc	a, h
   814D 57            [ 4]  830 	ld	d,a
   814E E1            [10]  831 	pop	hl
   814F E5            [11]  832 	push	hl
   8150 73            [ 7]  833 	ld	(hl),e
   8151 23            [ 6]  834 	inc	hl
   8152 72            [ 7]  835 	ld	(hl),d
                            836 ;src/entities/entities.c:505: if(MAX(ORIGEN_MAPA_Y, ent->y) == ORIGEN_MAPA_Y){
   8153 E1            [10]  837 	pop	hl
   8154 E5            [11]  838 	push	hl
   8155 7E            [ 7]  839 	ld	a, (hl)
   8156 23            [ 6]  840 	inc	hl
   8157 66            [ 7]  841 	ld	h,(hl)
   8158 6F            [ 4]  842 	ld	l,a
   8159 7B            [ 4]  843 	ld	a,e
   815A D6 28         [ 7]  844 	sub	a, #0x28
   815C 7A            [ 4]  845 	ld	a,d
   815D 17            [ 4]  846 	rla
   815E 3F            [ 4]  847 	ccf
   815F 1F            [ 4]  848 	rra
   8160 DE 80         [ 7]  849 	sbc	a, #0x80
   8162 30 03         [12]  850 	jr	NC,00106$
   8164 21 28 00      [10]  851 	ld	hl,#0x0028
   8167                     852 00106$:
   8167 7D            [ 4]  853 	ld	a,l
   8168 D6 28         [ 7]  854 	sub	a,#0x28
   816A 20 0E         [12]  855 	jr	NZ,00102$
   816C B4            [ 4]  856 	or	a,h
   816D 20 0B         [12]  857 	jr	NZ,00102$
                            858 ;src/entities/entities.c:506: ent->y = ORIGEN_MAPA_Y;
   816F E1            [10]  859 	pop	hl
   8170 E5            [11]  860 	push	hl
   8171 36 28         [10]  861 	ld	(hl),#0x28
   8173 23            [ 6]  862 	inc	hl
   8174 36 00         [10]  863 	ld	(hl),#0x00
                            864 ;src/entities/entities.c:508: collision = d_up;
   8176 1E 00         [ 7]  865 	ld	e,#0x00
   8178 18 02         [12]  866 	jr	00103$
   817A                     867 00102$:
                            868 ;src/entities/entities.c:510: collision = d_nothing;
   817A 1E 04         [ 7]  869 	ld	e,#0x04
   817C                     870 00103$:
                            871 ;src/entities/entities.c:513: ent->draw  = SI;
   817C 21 0A 00      [10]  872 	ld	hl,#0x000A
   817F 09            [11]  873 	add	hl,bc
   8180 36 01         [10]  874 	ld	(hl),#0x01
                            875 ;src/entities/entities.c:515: return collision;
   8182 6B            [ 4]  876 	ld	l,e
   8183 DD F9         [10]  877 	ld	sp, ix
   8185 DD E1         [14]  878 	pop	ix
   8187 C9            [10]  879 	ret
                            880 ;src/entities/entities.c:518: TPlayerDirection moverAbajo(TEntity* ent){
                            881 ;	---------------------------------
                            882 ; Function moverAbajo
                            883 ; ---------------------------------
   8188                     884 _moverAbajo::
   8188 DD E5         [15]  885 	push	ix
   818A DD 21 00 00   [14]  886 	ld	ix,#0
   818E DD 39         [15]  887 	add	ix,sp
   8190 21 FA FF      [10]  888 	ld	hl,#-6
   8193 39            [11]  889 	add	hl,sp
   8194 F9            [ 6]  890 	ld	sp,hl
                            891 ;src/entities/entities.c:521: ent->y += ent->vy;
   8195 DD 4E 04      [19]  892 	ld	c,4 (ix)
   8198 DD 46 05      [19]  893 	ld	b,5 (ix)
   819B 21 02 00      [10]  894 	ld	hl,#0x0002
   819E 09            [11]  895 	add	hl,bc
   819F DD 75 FC      [19]  896 	ld	-4 (ix),l
   81A2 DD 74 FD      [19]  897 	ld	-3 (ix),h
   81A5 DD 6E FC      [19]  898 	ld	l,-4 (ix)
   81A8 DD 66 FD      [19]  899 	ld	h,-3 (ix)
   81AB 5E            [ 7]  900 	ld	e,(hl)
   81AC 23            [ 6]  901 	inc	hl
   81AD 56            [ 7]  902 	ld	d,(hl)
   81AE C5            [11]  903 	push	bc
   81AF FD E1         [14]  904 	pop	iy
   81B1 FD 6E 09      [19]  905 	ld	l,9 (iy)
   81B4 26 00         [ 7]  906 	ld	h,#0x00
   81B6 19            [11]  907 	add	hl,de
   81B7 EB            [ 4]  908 	ex	de,hl
   81B8 DD 6E FC      [19]  909 	ld	l,-4 (ix)
   81BB DD 66 FD      [19]  910 	ld	h,-3 (ix)
   81BE 73            [ 7]  911 	ld	(hl),e
   81BF 23            [ 6]  912 	inc	hl
   81C0 72            [ 7]  913 	ld	(hl),d
   81C1 DD 6E FC      [19]  914 	ld	l,-4 (ix)
   81C4 DD 66 FD      [19]  915 	ld	h,-3 (ix)
   81C7 7E            [ 7]  916 	ld	a,(hl)
   81C8 DD 77 FA      [19]  917 	ld	-6 (ix),a
   81CB 23            [ 6]  918 	inc	hl
   81CC 7E            [ 7]  919 	ld	a,(hl)
   81CD DD 77 FB      [19]  920 	ld	-5 (ix),a
                            921 ;src/entities/entities.c:522: if(MIN(ent->y, ALTO - ent->sh) != ent->y){
   81D0 C5            [11]  922 	push	bc
   81D1 FD E1         [14]  923 	pop	iy
   81D3 FD 6E 14      [19]  924 	ld	l,20 (iy)
   81D6 26 00         [ 7]  925 	ld	h,#0x00
   81D8 3E C8         [ 7]  926 	ld	a,#0xC8
   81DA 95            [ 4]  927 	sub	a, l
   81DB DD 77 FE      [19]  928 	ld	-2 (ix),a
   81DE 3E 00         [ 7]  929 	ld	a,#0x00
   81E0 9C            [ 4]  930 	sbc	a, h
   81E1 DD 77 FF      [19]  931 	ld	-1 (ix),a
   81E4 7B            [ 4]  932 	ld	a,e
   81E5 DD 96 FE      [19]  933 	sub	a, -2 (ix)
   81E8 7A            [ 4]  934 	ld	a,d
   81E9 DD 9E FF      [19]  935 	sbc	a, -1 (ix)
   81EC E2 F1 81      [10]  936 	jp	PO, 00116$
   81EF EE 80         [ 7]  937 	xor	a, #0x80
   81F1                     938 00116$:
   81F1 F2 F8 81      [10]  939 	jp	P,00106$
   81F4 D1            [10]  940 	pop	de
   81F5 D5            [11]  941 	push	de
   81F6 18 06         [12]  942 	jr	00107$
   81F8                     943 00106$:
   81F8 DD 5E FE      [19]  944 	ld	e,-2 (ix)
   81FB DD 56 FF      [19]  945 	ld	d,-1 (ix)
   81FE                     946 00107$:
   81FE DD 7E FA      [19]  947 	ld	a,-6 (ix)
   8201 93            [ 4]  948 	sub	a, e
   8202 20 06         [12]  949 	jr	NZ,00117$
   8204 DD 7E FB      [19]  950 	ld	a,-5 (ix)
   8207 92            [ 4]  951 	sub	a, d
   8208 28 13         [12]  952 	jr	Z,00102$
   820A                     953 00117$:
                            954 ;src/entities/entities.c:523: ent->y = ALTO - ent->sh;
   820A DD 6E FC      [19]  955 	ld	l,-4 (ix)
   820D DD 66 FD      [19]  956 	ld	h,-3 (ix)
   8210 DD 7E FE      [19]  957 	ld	a,-2 (ix)
   8213 77            [ 7]  958 	ld	(hl),a
   8214 23            [ 6]  959 	inc	hl
   8215 DD 7E FF      [19]  960 	ld	a,-1 (ix)
   8218 77            [ 7]  961 	ld	(hl),a
                            962 ;src/entities/entities.c:524: collision =  d_down;
   8219 1E 02         [ 7]  963 	ld	e,#0x02
   821B 18 02         [12]  964 	jr	00103$
   821D                     965 00102$:
                            966 ;src/entities/entities.c:526: collision = d_nothing;
   821D 1E 04         [ 7]  967 	ld	e,#0x04
   821F                     968 00103$:
                            969 ;src/entities/entities.c:529: ent->draw  = SI;
   821F 21 0A 00      [10]  970 	ld	hl,#0x000A
   8222 09            [11]  971 	add	hl,bc
   8223 36 01         [10]  972 	ld	(hl),#0x01
                            973 ;src/entities/entities.c:531: return collision;
   8225 6B            [ 4]  974 	ld	l,e
   8226 DD F9         [10]  975 	ld	sp, ix
   8228 DD E1         [14]  976 	pop	ix
   822A C9            [10]  977 	ret
                            978 ;src/entities/entities.c:534: TPlayerDirection moverIzquierda(TEntity* ent){
                            979 ;	---------------------------------
                            980 ; Function moverIzquierda
                            981 ; ---------------------------------
   822B                     982 _moverIzquierda::
   822B DD E5         [15]  983 	push	ix
   822D DD 21 00 00   [14]  984 	ld	ix,#0
   8231 DD 39         [15]  985 	add	ix,sp
                            986 ;src/entities/entities.c:537: ent->x -= ent->vx;
   8233 DD 4E 04      [19]  987 	ld	c,4 (ix)
   8236 DD 46 05      [19]  988 	ld	b,5 (ix)
   8239 69            [ 4]  989 	ld	l, c
   823A 60            [ 4]  990 	ld	h, b
   823B 5E            [ 7]  991 	ld	e,(hl)
   823C 23            [ 6]  992 	inc	hl
   823D 56            [ 7]  993 	ld	d,(hl)
   823E C5            [11]  994 	push	bc
   823F FD E1         [14]  995 	pop	iy
   8241 FD 6E 08      [19]  996 	ld	l,8 (iy)
   8244 26 00         [ 7]  997 	ld	h,#0x00
   8246 7B            [ 4]  998 	ld	a,e
   8247 95            [ 4]  999 	sub	a, l
   8248 5F            [ 4] 1000 	ld	e,a
   8249 7A            [ 4] 1001 	ld	a,d
   824A 9C            [ 4] 1002 	sbc	a, h
   824B 57            [ 4] 1003 	ld	d,a
   824C 69            [ 4] 1004 	ld	l, c
   824D 60            [ 4] 1005 	ld	h, b
   824E 73            [ 7] 1006 	ld	(hl),e
   824F 23            [ 6] 1007 	inc	hl
   8250 72            [ 7] 1008 	ld	(hl),d
                           1009 ;src/entities/entities.c:538: if(MAX(0, ent->x) == 0){
   8251 69            [ 4] 1010 	ld	l, c
   8252 60            [ 4] 1011 	ld	h, b
   8253 7E            [ 7] 1012 	ld	a, (hl)
   8254 23            [ 6] 1013 	inc	hl
   8255 66            [ 7] 1014 	ld	h,(hl)
   8256 6F            [ 4] 1015 	ld	l,a
   8257 CB 7A         [ 8] 1016 	bit	7, d
   8259 28 03         [12] 1017 	jr	Z,00106$
   825B 21 00 00      [10] 1018 	ld	hl,#0x0000
   825E                    1019 00106$:
   825E 7C            [ 4] 1020 	ld	a,h
   825F B5            [ 4] 1021 	or	a,l
   8260 20 0A         [12] 1022 	jr	NZ,00102$
                           1023 ;src/entities/entities.c:539: ent->x = 0;
   8262 69            [ 4] 1024 	ld	l, c
   8263 60            [ 4] 1025 	ld	h, b
   8264 AF            [ 4] 1026 	xor	a, a
   8265 77            [ 7] 1027 	ld	(hl), a
   8266 23            [ 6] 1028 	inc	hl
   8267 77            [ 7] 1029 	ld	(hl), a
                           1030 ;src/entities/entities.c:541: collision = d_left;
   8268 1E 03         [ 7] 1031 	ld	e,#0x03
   826A 18 02         [12] 1032 	jr	00103$
   826C                    1033 00102$:
                           1034 ;src/entities/entities.c:543: collision = d_nothing;
   826C 1E 04         [ 7] 1035 	ld	e,#0x04
   826E                    1036 00103$:
                           1037 ;src/entities/entities.c:545: ent->draw  = SI;
   826E 21 0A 00      [10] 1038 	ld	hl,#0x000A
   8271 09            [11] 1039 	add	hl,bc
   8272 36 01         [10] 1040 	ld	(hl),#0x01
                           1041 ;src/entities/entities.c:547: return collision;
   8274 6B            [ 4] 1042 	ld	l,e
   8275 DD E1         [14] 1043 	pop	ix
   8277 C9            [10] 1044 	ret
                           1045 ;src/entities/entities.c:549: TPlayerDirection moverDerecha(TEntity* ent){
                           1046 ;	---------------------------------
                           1047 ; Function moverDerecha
                           1048 ; ---------------------------------
   8278                    1049 _moverDerecha::
   8278 DD E5         [15] 1050 	push	ix
   827A DD 21 00 00   [14] 1051 	ld	ix,#0
   827E DD 39         [15] 1052 	add	ix,sp
   8280 F5            [11] 1053 	push	af
   8281 F5            [11] 1054 	push	af
                           1055 ;src/entities/entities.c:552: ent->x += ent->vx;
   8282 DD 4E 04      [19] 1056 	ld	c,4 (ix)
   8285 DD 46 05      [19] 1057 	ld	b,5 (ix)
   8288 69            [ 4] 1058 	ld	l, c
   8289 60            [ 4] 1059 	ld	h, b
   828A 5E            [ 7] 1060 	ld	e,(hl)
   828B 23            [ 6] 1061 	inc	hl
   828C 56            [ 7] 1062 	ld	d,(hl)
   828D C5            [11] 1063 	push	bc
   828E FD E1         [14] 1064 	pop	iy
   8290 FD 6E 08      [19] 1065 	ld	l,8 (iy)
   8293 26 00         [ 7] 1066 	ld	h,#0x00
   8295 19            [11] 1067 	add	hl,de
   8296 EB            [ 4] 1068 	ex	de,hl
   8297 69            [ 4] 1069 	ld	l, c
   8298 60            [ 4] 1070 	ld	h, b
   8299 73            [ 7] 1071 	ld	(hl),e
   829A 23            [ 6] 1072 	inc	hl
   829B 72            [ 7] 1073 	ld	(hl),d
                           1074 ;src/entities/entities.c:553: if(MIN(ent->x, ANCHO - ent->sw) != ent->x){
   829C 0A            [ 7] 1075 	ld	a,(bc)
   829D DD 77 FE      [19] 1076 	ld	-2 (ix),a
   82A0 03            [ 6] 1077 	inc	bc
   82A1 0A            [ 7] 1078 	ld	a,(bc)
   82A2 DD 77 FF      [19] 1079 	ld	-1 (ix),a
   82A5 0B            [ 6] 1080 	dec	bc
   82A6 C5            [11] 1081 	push	bc
   82A7 FD E1         [14] 1082 	pop	iy
   82A9 FD 6E 13      [19] 1083 	ld	l,19 (iy)
   82AC 26 00         [ 7] 1084 	ld	h,#0x00
   82AE 3E 50         [ 7] 1085 	ld	a,#0x50
   82B0 95            [ 4] 1086 	sub	a, l
   82B1 DD 77 FC      [19] 1087 	ld	-4 (ix),a
   82B4 3E 00         [ 7] 1088 	ld	a,#0x00
   82B6 9C            [ 4] 1089 	sbc	a, h
   82B7 DD 77 FD      [19] 1090 	ld	-3 (ix),a
   82BA 7B            [ 4] 1091 	ld	a,e
   82BB DD 96 FC      [19] 1092 	sub	a, -4 (ix)
   82BE 7A            [ 4] 1093 	ld	a,d
   82BF DD 9E FD      [19] 1094 	sbc	a, -3 (ix)
   82C2 E2 C7 82      [10] 1095 	jp	PO, 00116$
   82C5 EE 80         [ 7] 1096 	xor	a, #0x80
   82C7                    1097 00116$:
   82C7 F2 D2 82      [10] 1098 	jp	P,00106$
   82CA DD 5E FE      [19] 1099 	ld	e,-2 (ix)
   82CD DD 56 FF      [19] 1100 	ld	d,-1 (ix)
   82D0 18 02         [12] 1101 	jr	00107$
   82D2                    1102 00106$:
   82D2 D1            [10] 1103 	pop	de
   82D3 D5            [11] 1104 	push	de
   82D4                    1105 00107$:
   82D4 DD 7E FE      [19] 1106 	ld	a,-2 (ix)
   82D7 93            [ 4] 1107 	sub	a, e
   82D8 20 06         [12] 1108 	jr	NZ,00117$
   82DA DD 7E FF      [19] 1109 	ld	a,-1 (ix)
   82DD 92            [ 4] 1110 	sub	a, d
   82DE 28 0F         [12] 1111 	jr	Z,00102$
   82E0                    1112 00117$:
                           1113 ;src/entities/entities.c:555: ent->x = ANCHO - ent->sw;
   82E0 69            [ 4] 1114 	ld	l, c
   82E1 60            [ 4] 1115 	ld	h, b
   82E2 DD 7E FC      [19] 1116 	ld	a,-4 (ix)
   82E5 77            [ 7] 1117 	ld	(hl),a
   82E6 23            [ 6] 1118 	inc	hl
   82E7 DD 7E FD      [19] 1119 	ld	a,-3 (ix)
   82EA 77            [ 7] 1120 	ld	(hl),a
                           1121 ;src/entities/entities.c:556: collision = d_right;
   82EB 1E 01         [ 7] 1122 	ld	e,#0x01
   82ED 18 02         [12] 1123 	jr	00103$
   82EF                    1124 00102$:
                           1125 ;src/entities/entities.c:558: collision = d_nothing;
   82EF 1E 04         [ 7] 1126 	ld	e,#0x04
   82F1                    1127 00103$:
                           1128 ;src/entities/entities.c:561: ent->draw  = SI;
   82F1 21 0A 00      [10] 1129 	ld	hl,#0x000A
   82F4 09            [11] 1130 	add	hl,bc
   82F5 36 01         [10] 1131 	ld	(hl),#0x01
                           1132 ;src/entities/entities.c:563: return collision;
   82F7 6B            [ 4] 1133 	ld	l,e
   82F8 DD F9         [10] 1134 	ld	sp, ix
   82FA DD E1         [14] 1135 	pop	ix
   82FC C9            [10] 1136 	ret
                           1137 ;src/entities/entities.c:567: void updatePlayer(TPlayer* player){
                           1138 ;	---------------------------------
                           1139 ; Function updatePlayer
                           1140 ; ---------------------------------
   82FD                    1141 _updatePlayer::
                           1142 ;src/entities/entities.c:568: if(previousMap == mapaActual){
   82FD 3A 7E 7D      [13] 1143 	ld	a,(#_previousMap + 0)
   8300 FD 21 7D 7D   [14] 1144 	ld	iy,#_mapaActual
   8304 FD 96 00      [19] 1145 	sub	a, 0 (iy)
   8307 20 05         [12] 1146 	jr	NZ,00102$
                           1147 ;src/entities/entities.c:570: updateTiempoEnMapa();
   8309 CD B2 65      [17] 1148 	call	_updateTiempoEnMapa
   830C 18 09         [12] 1149 	jr	00103$
   830E                    1150 00102$:
                           1151 ;src/entities/entities.c:572: previousMap = mapaActual;
   830E 3A 7D 7D      [13] 1152 	ld	a,(#_mapaActual + 0)
   8311 32 7E 7D      [13] 1153 	ld	(#_previousMap + 0),a
                           1154 ;src/entities/entities.c:573: resetearTimepoEnMapa();
   8314 CD DF 65      [17] 1155 	call	_resetearTimepoEnMapa
   8317                    1156 00103$:
                           1157 ;src/entities/entities.c:576: updateBullet(&player->bullet);
   8317 D1            [10] 1158 	pop	de
   8318 C1            [10] 1159 	pop	bc
   8319 C5            [11] 1160 	push	bc
   831A D5            [11] 1161 	push	de
   831B C5            [11] 1162 	push	bc
   831C CD AD 84      [17] 1163 	call	_updateBullet
   831F F1            [10] 1164 	pop	af
   8320 C9            [10] 1165 	ret
                           1166 ;src/entities/entities.c:580: void corregirPosicion(TBullet* bullet, u8 x, u8 y, TPlayerDirection dir){
                           1167 ;	---------------------------------
                           1168 ; Function corregirPosicion
                           1169 ; ---------------------------------
   8321                    1170 _corregirPosicion::
   8321 DD E5         [15] 1171 	push	ix
   8323 DD 21 00 00   [14] 1172 	ld	ix,#0
   8327 DD 39         [15] 1173 	add	ix,sp
                           1174 ;src/entities/entities.c:591: x = ANCHO - bullet->ent.sw;
   8329 DD 4E 04      [19] 1175 	ld	c,4 (ix)
   832C DD 46 05      [19] 1176 	ld	b,5 (ix)
                           1177 ;src/entities/entities.c:581: switch(dir){
   832F 3E 03         [ 7] 1178 	ld	a,#0x03
   8331 DD 96 08      [19] 1179 	sub	a, 8 (ix)
   8334 DA E8 83      [10] 1180 	jp	C,00115$
                           1181 ;src/entities/entities.c:583: x+=2;
   8337 DD 5E 06      [19] 1182 	ld	e,6 (ix)
   833A 1C            [ 4] 1183 	inc	e
   833B 1C            [ 4] 1184 	inc	e
                           1185 ;src/entities/entities.c:581: switch(dir){
   833C D5            [11] 1186 	push	de
   833D DD 5E 08      [19] 1187 	ld	e,8 (ix)
   8340 16 00         [ 7] 1188 	ld	d,#0x00
   8342 21 49 83      [10] 1189 	ld	hl,#00138$
   8345 19            [11] 1190 	add	hl,de
   8346 19            [11] 1191 	add	hl,de
                           1192 ;src/entities/entities.c:582: case d_up:
   8347 D1            [10] 1193 	pop	de
   8348 E9            [ 4] 1194 	jp	(hl)
   8349                    1195 00138$:
   8349 18 06         [12] 1196 	jr	00101$
   834B 18 1A         [12] 1197 	jr	00104$
   834D 18 67         [12] 1198 	jr	00111$
   834F 18 4E         [12] 1199 	jr	00108$
   8351                    1200 00101$:
                           1201 ;src/entities/entities.c:583: x+=2;
   8351 DD 73 06      [19] 1202 	ld	6 (ix),e
                           1203 ;src/entities/entities.c:584: if(y >= ORIGEN_MAPA_Y + 7 )
   8354 DD 7E 07      [19] 1204 	ld	a,7 (ix)
   8357 D6 2F         [ 7] 1205 	sub	a, #0x2F
   8359 DA E8 83      [10] 1206 	jp	C,00115$
                           1207 ;src/entities/entities.c:585: y-=7;
   835C DD 7E 07      [19] 1208 	ld	a,7 (ix)
   835F C6 F9         [ 7] 1209 	add	a,#0xF9
   8361 DD 77 07      [19] 1210 	ld	7 (ix),a
                           1211 ;src/entities/entities.c:586: break;
   8364 C3 E8 83      [10] 1212 	jp	00115$
                           1213 ;src/entities/entities.c:587: case d_right:
   8367                    1214 00104$:
                           1215 ;src/entities/entities.c:588: if(x + 7 <= ANCHO)
   8367 DD 5E 06      [19] 1216 	ld	e,6 (ix)
   836A 16 00         [ 7] 1217 	ld	d,#0x00
   836C 21 07 00      [10] 1218 	ld	hl,#0x0007
   836F 19            [11] 1219 	add	hl,de
   8370 3E 50         [ 7] 1220 	ld	a,#0x50
   8372 BD            [ 4] 1221 	cp	a, l
   8373 3E 00         [ 7] 1222 	ld	a,#0x00
   8375 9C            [ 4] 1223 	sbc	a, h
   8376 E2 7B 83      [10] 1224 	jp	PO, 00139$
   8379 EE 80         [ 7] 1225 	xor	a, #0x80
   837B                    1226 00139$:
   837B FA 88 83      [10] 1227 	jp	M,00106$
                           1228 ;src/entities/entities.c:589: x+=7;
   837E DD 7E 06      [19] 1229 	ld	a,6 (ix)
   8381 C6 07         [ 7] 1230 	add	a, #0x07
   8383 DD 77 06      [19] 1231 	ld	6 (ix),a
   8386 18 0C         [12] 1232 	jr	00107$
   8388                    1233 00106$:
                           1234 ;src/entities/entities.c:591: x = ANCHO - bullet->ent.sw;
   8388 C5            [11] 1235 	push	bc
   8389 FD E1         [14] 1236 	pop	iy
   838B FD 5E 16      [19] 1237 	ld	e,22 (iy)
   838E 3E 50         [ 7] 1238 	ld	a,#0x50
   8390 93            [ 4] 1239 	sub	a, e
   8391 DD 77 06      [19] 1240 	ld	6 (ix),a
   8394                    1241 00107$:
                           1242 ;src/entities/entities.c:592: y+=3;
   8394 DD 34 07      [23] 1243 	inc	7 (ix)
   8397 DD 34 07      [23] 1244 	inc	7 (ix)
   839A DD 34 07      [23] 1245 	inc	7 (ix)
                           1246 ;src/entities/entities.c:594: break;
   839D 18 49         [12] 1247 	jr	00115$
                           1248 ;src/entities/entities.c:595: case d_left:
   839F                    1249 00108$:
                           1250 ;src/entities/entities.c:596: if(x > 6)
   839F 3E 06         [ 7] 1251 	ld	a,#0x06
   83A1 DD 96 06      [19] 1252 	sub	a, 6 (ix)
   83A4 30 08         [12] 1253 	jr	NC,00110$
                           1254 ;src/entities/entities.c:597: x-=5;
   83A6 DD 7E 06      [19] 1255 	ld	a,6 (ix)
   83A9 C6 FB         [ 7] 1256 	add	a,#0xFB
   83AB DD 77 06      [19] 1257 	ld	6 (ix),a
   83AE                    1258 00110$:
                           1259 ;src/entities/entities.c:598: y+=2;
   83AE DD 34 07      [23] 1260 	inc	7 (ix)
   83B1 DD 34 07      [23] 1261 	inc	7 (ix)
                           1262 ;src/entities/entities.c:600: break;
   83B4 18 32         [12] 1263 	jr	00115$
                           1264 ;src/entities/entities.c:601: case d_down:
   83B6                    1265 00111$:
                           1266 ;src/entities/entities.c:602: if(y + 15 <= ALTO)
   83B6 DD 6E 07      [19] 1267 	ld	l,7 (ix)
   83B9 26 00         [ 7] 1268 	ld	h,#0x00
   83BB D5            [11] 1269 	push	de
   83BC 11 0F 00      [10] 1270 	ld	de,#0x000F
   83BF 19            [11] 1271 	add	hl, de
   83C0 D1            [10] 1272 	pop	de
   83C1 3E C8         [ 7] 1273 	ld	a,#0xC8
   83C3 BD            [ 4] 1274 	cp	a, l
   83C4 3E 00         [ 7] 1275 	ld	a,#0x00
   83C6 9C            [ 4] 1276 	sbc	a, h
   83C7 E2 CC 83      [10] 1277 	jp	PO, 00140$
   83CA EE 80         [ 7] 1278 	xor	a, #0x80
   83CC                    1279 00140$:
   83CC FA D9 83      [10] 1280 	jp	M,00113$
                           1281 ;src/entities/entities.c:603: y +=15;
   83CF DD 7E 07      [19] 1282 	ld	a,7 (ix)
   83D2 C6 0F         [ 7] 1283 	add	a, #0x0F
   83D4 DD 77 07      [19] 1284 	ld	7 (ix),a
   83D7 18 0C         [12] 1285 	jr	00114$
   83D9                    1286 00113$:
                           1287 ;src/entities/entities.c:605: y = ALTO - bullet->ent.sh;
   83D9 C5            [11] 1288 	push	bc
   83DA FD E1         [14] 1289 	pop	iy
   83DC FD 56 17      [19] 1290 	ld	d,23 (iy)
   83DF 3E C8         [ 7] 1291 	ld	a,#0xC8
   83E1 92            [ 4] 1292 	sub	a, d
   83E2 DD 77 07      [19] 1293 	ld	7 (ix),a
   83E5                    1294 00114$:
                           1295 ;src/entities/entities.c:606: x +=2;
   83E5 DD 73 06      [19] 1296 	ld	6 (ix),e
                           1297 ;src/entities/entities.c:608: }
   83E8                    1298 00115$:
                           1299 ;src/entities/entities.c:610: bullet->ent.x = x;
   83E8 69            [ 4] 1300 	ld	l, c
   83E9 60            [ 4] 1301 	ld	h, b
   83EA 23            [ 6] 1302 	inc	hl
   83EB 23            [ 6] 1303 	inc	hl
   83EC 23            [ 6] 1304 	inc	hl
   83ED DD 5E 06      [19] 1305 	ld	e,6 (ix)
   83F0 16 00         [ 7] 1306 	ld	d,#0x00
   83F2 73            [ 7] 1307 	ld	(hl),e
   83F3 23            [ 6] 1308 	inc	hl
   83F4 72            [ 7] 1309 	ld	(hl),d
                           1310 ;src/entities/entities.c:611: bullet->ent.y = y;
   83F5 21 05 00      [10] 1311 	ld	hl,#0x0005
   83F8 09            [11] 1312 	add	hl,bc
   83F9 DD 4E 07      [19] 1313 	ld	c,7 (ix)
   83FC 06 00         [ 7] 1314 	ld	b,#0x00
   83FE 71            [ 7] 1315 	ld	(hl),c
   83FF 23            [ 6] 1316 	inc	hl
   8400 70            [ 7] 1317 	ld	(hl),b
   8401 DD E1         [14] 1318 	pop	ix
   8403 C9            [10] 1319 	ret
                           1320 ;src/entities/entities.c:613: void updateX(TEntity* ent, i16 x){
                           1321 ;	---------------------------------
                           1322 ; Function updateX
                           1323 ; ---------------------------------
   8404                    1324 _updateX::
                           1325 ;src/entities/entities.c:614: ent->x = x;
   8404 C1            [10] 1326 	pop	bc
   8405 E1            [10] 1327 	pop	hl
   8406 E5            [11] 1328 	push	hl
   8407 C5            [11] 1329 	push	bc
   8408 FD 21 04 00   [14] 1330 	ld	iy,#4
   840C FD 39         [15] 1331 	add	iy,sp
   840E FD 7E 00      [19] 1332 	ld	a,0 (iy)
   8411 77            [ 7] 1333 	ld	(hl),a
   8412 23            [ 6] 1334 	inc	hl
   8413 FD 7E 01      [19] 1335 	ld	a,1 (iy)
   8416 77            [ 7] 1336 	ld	(hl),a
                           1337 ;src/entities/entities.c:615: ent->coll.x = x;
   8417 01 16 00      [10] 1338 	ld	bc,#0x0017-1
   841A 09            [11] 1339 	add	hl,bc
   841B FD 4E 00      [19] 1340 	ld	c,0 (iy)
   841E 71            [ 7] 1341 	ld	(hl),c
   841F C9            [10] 1342 	ret
                           1343 ;src/entities/entities.c:617: void updateY(TEntity* ent, i16 y){
                           1344 ;	---------------------------------
                           1345 ; Function updateY
                           1346 ; ---------------------------------
   8420                    1347 _updateY::
                           1348 ;src/entities/entities.c:618: ent->y = y;
   8420 D1            [10] 1349 	pop	de
   8421 C1            [10] 1350 	pop	bc
   8422 C5            [11] 1351 	push	bc
   8423 D5            [11] 1352 	push	de
   8424 59            [ 4] 1353 	ld	e, c
   8425 50            [ 4] 1354 	ld	d, b
   8426 13            [ 6] 1355 	inc	de
   8427 13            [ 6] 1356 	inc	de
   8428 FD 21 04 00   [14] 1357 	ld	iy,#4
   842C FD 39         [15] 1358 	add	iy,sp
   842E FD 7E 00      [19] 1359 	ld	a,0 (iy)
   8431 12            [ 7] 1360 	ld	(de),a
   8432 13            [ 6] 1361 	inc	de
   8433 FD 7E 01      [19] 1362 	ld	a,1 (iy)
   8436 12            [ 7] 1363 	ld	(de),a
                           1364 ;src/entities/entities.c:619: ent->coll.y = y;
   8437 21 18 00      [10] 1365 	ld	hl,#0x0018
   843A 09            [11] 1366 	add	hl,bc
   843B FD 4E 00      [19] 1367 	ld	c,0 (iy)
   843E 71            [ 7] 1368 	ld	(hl),c
   843F C9            [10] 1369 	ret
                           1370 ;src/entities/entities.c:621: void disparar(TBullet* bullet, u8 x, u8 y, TPlayerDirection dir){
                           1371 ;	---------------------------------
                           1372 ; Function disparar
                           1373 ; ---------------------------------
   8440                    1374 _disparar::
   8440 DD E5         [15] 1375 	push	ix
   8442 DD 21 00 00   [14] 1376 	ld	ix,#0
   8446 DD 39         [15] 1377 	add	ix,sp
                           1378 ;src/entities/entities.c:622: if(bullet->state == es_static){
   8448 DD 4E 04      [19] 1379 	ld	c,4 (ix)
   844B DD 46 05      [19] 1380 	ld	b,5 (ix)
   844E 69            [ 4] 1381 	ld	l, c
   844F 60            [ 4] 1382 	ld	h, b
   8450 23            [ 6] 1383 	inc	hl
   8451 23            [ 6] 1384 	inc	hl
   8452 7E            [ 7] 1385 	ld	a,(hl)
   8453 B7            [ 4] 1386 	or	a, a
   8454 20 54         [12] 1387 	jr	NZ,00103$
                           1388 ;src/entities/entities.c:623: bullet->state = es_disparado;
   8456 36 02         [10] 1389 	ld	(hl),#0x02
                           1390 ;src/entities/entities.c:624: corregirPosicion(bullet,x,y,dir);
   8458 C5            [11] 1391 	push	bc
   8459 DD 66 08      [19] 1392 	ld	h,8 (ix)
   845C DD 6E 07      [19] 1393 	ld	l,7 (ix)
   845F E5            [11] 1394 	push	hl
   8460 DD 7E 06      [19] 1395 	ld	a,6 (ix)
   8463 F5            [11] 1396 	push	af
   8464 33            [ 6] 1397 	inc	sp
   8465 C5            [11] 1398 	push	bc
   8466 CD 21 83      [17] 1399 	call	_corregirPosicion
   8469 F1            [10] 1400 	pop	af
   846A F1            [10] 1401 	pop	af
   846B 33            [ 6] 1402 	inc	sp
   846C C1            [10] 1403 	pop	bc
                           1404 ;src/entities/entities.c:625: bullet->ent.px = bullet->ent.x;
   846D 69            [ 4] 1405 	ld	l, c
   846E 60            [ 4] 1406 	ld	h, b
   846F FD 21 07 00   [14] 1407 	ld	iy,#0x0007
   8473 FD 09         [15] 1408 	add	iy, bc
   8475 23            [ 6] 1409 	inc	hl
   8476 23            [ 6] 1410 	inc	hl
   8477 23            [ 6] 1411 	inc	hl
   8478 5E            [ 7] 1412 	ld	e,(hl)
   8479 23            [ 6] 1413 	inc	hl
   847A 56            [ 7] 1414 	ld	d,(hl)
   847B FD 73 00      [19] 1415 	ld	0 (iy),e
   847E FD 72 01      [19] 1416 	ld	1 (iy),d
                           1417 ;src/entities/entities.c:626: bullet->ent.py = bullet->ent.y;
   8481 FD 21 09 00   [14] 1418 	ld	iy,#0x0009
   8485 FD 09         [15] 1419 	add	iy, bc
   8487 69            [ 4] 1420 	ld	l, c
   8488 60            [ 4] 1421 	ld	h, b
   8489 11 05 00      [10] 1422 	ld	de, #0x0005
   848C 19            [11] 1423 	add	hl, de
   848D 5E            [ 7] 1424 	ld	e,(hl)
   848E 23            [ 6] 1425 	inc	hl
   848F 56            [ 7] 1426 	ld	d,(hl)
   8490 FD 73 00      [19] 1427 	ld	0 (iy),e
   8493 FD 72 01      [19] 1428 	ld	1 (iy),d
                           1429 ;src/entities/entities.c:627: bullet->ent.draw = SI;
   8496 21 0D 00      [10] 1430 	ld	hl,#0x000D
   8499 09            [11] 1431 	add	hl,bc
   849A 36 01         [10] 1432 	ld	(hl),#0x01
                           1433 ;src/entities/entities.c:628: bullet->ent.vivo = SI;
   849C 21 1E 00      [10] 1434 	ld	hl,#0x001E
   849F 09            [11] 1435 	add	hl,bc
   84A0 36 01         [10] 1436 	ld	(hl),#0x01
                           1437 ;src/entities/entities.c:629: bullet->ent.curr_dir = dir;
   84A2 21 18 00      [10] 1438 	ld	hl,#0x0018
   84A5 09            [11] 1439 	add	hl,bc
   84A6 DD 7E 08      [19] 1440 	ld	a,8 (ix)
   84A9 77            [ 7] 1441 	ld	(hl),a
   84AA                    1442 00103$:
   84AA DD E1         [14] 1443 	pop	ix
   84AC C9            [10] 1444 	ret
                           1445 ;src/entities/entities.c:633: void updateBullet(TBullet* bullet){
                           1446 ;	---------------------------------
                           1447 ; Function updateBullet
                           1448 ; ---------------------------------
   84AD                    1449 _updateBullet::
   84AD DD E5         [15] 1450 	push	ix
   84AF DD 21 00 00   [14] 1451 	ld	ix,#0
   84B3 DD 39         [15] 1452 	add	ix,sp
   84B5 F5            [11] 1453 	push	af
   84B6 F5            [11] 1454 	push	af
   84B7 3B            [ 6] 1455 	dec	sp
                           1456 ;src/entities/entities.c:635: switch(bullet->state){
   84B8 DD 4E 04      [19] 1457 	ld	c,4 (ix)
   84BB DD 46 05      [19] 1458 	ld	b,5 (ix)
   84BE 59            [ 4] 1459 	ld	e, c
   84BF 50            [ 4] 1460 	ld	d, b
   84C0 13            [ 6] 1461 	inc	de
   84C1 13            [ 6] 1462 	inc	de
   84C2 1A            [ 7] 1463 	ld	a,(de)
   84C3 6F            [ 4] 1464 	ld	l,a
   84C4 D6 02         [ 7] 1465 	sub	a, #0x02
   84C6 28 08         [12] 1466 	jr	Z,00101$
   84C8 7D            [ 4] 1467 	ld	a,l
   84C9 D6 03         [ 7] 1468 	sub	a, #0x03
   84CB 28 78         [12] 1469 	jr	Z,00107$
   84CD C3 4A 85      [10] 1470 	jp	00109$
                           1471 ;src/entities/entities.c:636: case es_disparado:	//Solo updateamos la bala si ha sido disparada
   84D0                    1472 00101$:
                           1473 ;src/entities/entities.c:638: if(bullet->frameCount >= bullet->frameLimit){
   84D0 0A            [ 7] 1474 	ld	a,(bc)
   84D1 DD 77 FF      [19] 1475 	ld	-1 (ix),a
   84D4 69            [ 4] 1476 	ld	l, c
   84D5 60            [ 4] 1477 	ld	h, b
   84D6 23            [ 6] 1478 	inc	hl
   84D7 DD 7E FF      [19] 1479 	ld	a,-1 (ix)
   84DA 96            [ 7] 1480 	sub	a,(hl)
   84DB 38 61         [12] 1481 	jr	C,00105$
                           1482 ;src/entities/entities.c:639: bullet->ent.draw = SI;
   84DD 21 03 00      [10] 1483 	ld	hl,#0x0003
   84E0 09            [11] 1484 	add	hl,bc
   84E1 DD 75 FD      [19] 1485 	ld	-3 (ix),l
   84E4 DD 74 FE      [19] 1486 	ld	-2 (ix),h
   84E7 21 0D 00      [10] 1487 	ld	hl,#0x000D
   84EA 09            [11] 1488 	add	hl,bc
   84EB E3            [19] 1489 	ex	(sp), hl
   84EC E1            [10] 1490 	pop	hl
   84ED E5            [11] 1491 	push	hl
   84EE 36 01         [10] 1492 	ld	(hl),#0x01
                           1493 ;src/entities/entities.c:642: if(accion(&bullet->ent, es_mover, bullet->ent.curr_dir) != d_nothing){
   84F0 C5            [11] 1494 	push	bc
   84F1 FD E1         [14] 1495 	pop	iy
   84F3 FD 66 18      [19] 1496 	ld	h,24 (iy)
   84F6 C5            [11] 1497 	push	bc
   84F7 D5            [11] 1498 	push	de
   84F8 E5            [11] 1499 	push	hl
   84F9 33            [ 6] 1500 	inc	sp
   84FA 3E 01         [ 7] 1501 	ld	a,#0x01
   84FC F5            [11] 1502 	push	af
   84FD 33            [ 6] 1503 	inc	sp
   84FE DD 6E FD      [19] 1504 	ld	l,-3 (ix)
   8501 DD 66 FE      [19] 1505 	ld	h,-2 (ix)
   8504 E5            [11] 1506 	push	hl
   8505 CD 59 80      [17] 1507 	call	_accion
   8508 F1            [10] 1508 	pop	af
   8509 F1            [10] 1509 	pop	af
   850A D1            [10] 1510 	pop	de
   850B C1            [10] 1511 	pop	bc
   850C 7D            [ 4] 1512 	ld	a,l
   850D D6 04         [ 7] 1513 	sub	a, #0x04
   850F 28 29         [12] 1514 	jr	Z,00103$
                           1515 ;src/entities/entities.c:643: bullet->state = es_static;
   8511 AF            [ 4] 1516 	xor	a, a
   8512 12            [ 7] 1517 	ld	(de),a
                           1518 ;src/entities/entities.c:644: calculaEntity(&bullet->ent, SI);
   8513 C5            [11] 1519 	push	bc
   8514 3E 01         [ 7] 1520 	ld	a,#0x01
   8516 F5            [11] 1521 	push	af
   8517 33            [ 6] 1522 	inc	sp
   8518 DD 6E FD      [19] 1523 	ld	l,-3 (ix)
   851B DD 66 FE      [19] 1524 	ld	h,-2 (ix)
   851E E5            [11] 1525 	push	hl
   851F CD E6 8C      [17] 1526 	call	_calculaEntity
   8522 F1            [10] 1527 	pop	af
   8523 33            [ 6] 1528 	inc	sp
   8524 DD 6E FD      [19] 1529 	ld	l,-3 (ix)
   8527 DD 66 FE      [19] 1530 	ld	h,-2 (ix)
   852A E5            [11] 1531 	push	hl
   852B CD 34 8C      [17] 1532 	call	_borrarEntity
   852E F1            [10] 1533 	pop	af
   852F C1            [10] 1534 	pop	bc
                           1535 ;src/entities/entities.c:646: bullet->ent.draw = NO;
   8530 E1            [10] 1536 	pop	hl
   8531 E5            [11] 1537 	push	hl
   8532 36 00         [10] 1538 	ld	(hl),#0x00
                           1539 ;src/entities/entities.c:647: bullet->ent.vivo = NO;
   8534 21 1E 00      [10] 1540 	ld	hl,#0x001E
   8537 09            [11] 1541 	add	hl,bc
   8538 36 00         [10] 1542 	ld	(hl),#0x00
   853A                    1543 00103$:
                           1544 ;src/entities/entities.c:650: bullet->frameCount = 0;
   853A AF            [ 4] 1545 	xor	a, a
   853B 02            [ 7] 1546 	ld	(bc),a
   853C 18 0C         [12] 1547 	jr	00109$
   853E                    1548 00105$:
                           1549 ;src/entities/entities.c:652: bullet->frameCount++;
   853E DD 7E FF      [19] 1550 	ld	a,-1 (ix)
   8541 3C            [ 4] 1551 	inc	a
   8542 02            [ 7] 1552 	ld	(bc),a
                           1553 ;src/entities/entities.c:654: break;
   8543 18 05         [12] 1554 	jr	00109$
                           1555 ;src/entities/entities.c:656: case es_explotando:
   8545                    1556 00107$:
                           1557 ;src/entities/entities.c:657: updateExplosion(bullet);
   8545 C5            [11] 1558 	push	bc
   8546 CD 8C 64      [17] 1559 	call	_updateExplosion
   8549 F1            [10] 1560 	pop	af
                           1561 ;src/entities/entities.c:659: }
   854A                    1562 00109$:
   854A DD F9         [10] 1563 	ld	sp, ix
   854C DD E1         [14] 1564 	pop	ix
   854E C9            [10] 1565 	ret
                           1566 ;src/entities/entities.c:663: void playerHerido(TPlayer* player){
                           1567 ;	---------------------------------
                           1568 ; Function playerHerido
                           1569 ; ---------------------------------
   854F                    1570 _playerHerido::
   854F DD E5         [15] 1571 	push	ix
   8551 DD 21 00 00   [14] 1572 	ld	ix,#0
   8555 DD 39         [15] 1573 	add	ix,sp
                           1574 ;src/entities/entities.c:664: TBase* bases = getBases();
   8557 CD 4F 90      [17] 1575 	call	_getBases
   855A 4D            [ 4] 1576 	ld	c,l
   855B 44            [ 4] 1577 	ld	b,h
                           1578 ;src/entities/entities.c:665: player->vida--;
   855C DD 5E 04      [19] 1579 	ld	e,4 (ix)
   855F DD 56 05      [19] 1580 	ld	d,5 (ix)
   8562 21 49 00      [10] 1581 	ld	hl,#0x0049
   8565 19            [11] 1582 	add	hl,de
   8566 7E            [ 7] 1583 	ld	a,(hl)
   8567 C6 FF         [ 7] 1584 	add	a,#0xFF
   8569 77            [ 7] 1585 	ld	(hl),a
                           1586 ;src/entities/entities.c:666: player->ent.x = px_spawn;
   856A 21 26 00      [10] 1587 	ld	hl,#0x0026
   856D 19            [11] 1588 	add	hl,de
   856E 36 0A         [10] 1589 	ld	(hl),#0x0A
   8570 23            [ 6] 1590 	inc	hl
   8571 36 00         [10] 1591 	ld	(hl),#0x00
                           1592 ;src/entities/entities.c:667: player->ent.y = py_spawn;
   8573 21 28 00      [10] 1593 	ld	hl,#0x0028
   8576 19            [11] 1594 	add	hl,de
   8577 36 AA         [10] 1595 	ld	(hl),#0xAA
   8579 23            [ 6] 1596 	inc	hl
   857A 36 00         [10] 1597 	ld	(hl),#0x00
                           1598 ;src/entities/entities.c:668: player->ent.draw = SI;
   857C 21 30 00      [10] 1599 	ld	hl,#0x0030
   857F 19            [11] 1600 	add	hl,de
   8580 36 01         [10] 1601 	ld	(hl),#0x01
                           1602 ;src/entities/entities.c:669: mapaActual = 0;
   8582 21 7D 7D      [10] 1603 	ld	hl,#_mapaActual + 0
   8585 36 00         [10] 1604 	ld	(hl), #0x00
                           1605 ;src/entities/entities.c:670: player->ent.cuadrante = 0;
   8587 21 42 00      [10] 1606 	ld	hl,#0x0042
   858A 19            [11] 1607 	add	hl,de
   858B 36 00         [10] 1608 	ld	(hl),#0x00
                           1609 ;src/entities/entities.c:671: mapa = mapas[0];
   858D 21 4A 59      [10] 1610 	ld	hl, #_mapas + 0
   8590 7E            [ 7] 1611 	ld	a,(hl)
   8591 FD 21 7B 7D   [14] 1612 	ld	iy,#_mapa
   8595 FD 77 00      [19] 1613 	ld	0 (iy),a
   8598 23            [ 6] 1614 	inc	hl
   8599 7E            [ 7] 1615 	ld	a,(hl)
   859A 32 7C 7D      [13] 1616 	ld	(#_mapa + 1),a
                           1617 ;src/entities/entities.c:672: bases[mapaActual].ent.draw = SI;
   859D 21 0E 00      [10] 1618 	ld	hl,#0x000E
   85A0 09            [11] 1619 	add	hl,bc
   85A1 36 01         [10] 1620 	ld	(hl),#0x01
                           1621 ;src/entities/entities.c:673: dibujarMapa();
   85A3 DD E1         [14] 1622 	pop	ix
   85A5 C3 6C 59      [10] 1623 	jp	_dibujarMapa
                           1624 ;src/entities/entities.c:676: void updateEntities(){
                           1625 ;	---------------------------------
                           1626 ; Function updateEntities
                           1627 ; ---------------------------------
   85A8                    1628 _updateEntities::
                           1629 ;src/entities/entities.c:683: for(i=0;i<NUM_ENEMIGOS;++i){
   85A8 0E 00         [ 7] 1630 	ld	c,#0x00
   85AA 11 00 00      [10] 1631 	ld	de,#0x0000
   85AD                    1632 00102$:
                           1633 ;src/entities/entities.c:686: updateBullet(&enemigos[i].bullet);
   85AD 21 7D 7E      [10] 1634 	ld	hl,#_enemigos
   85B0 19            [11] 1635 	add	hl,de
   85B1 C5            [11] 1636 	push	bc
   85B2 D5            [11] 1637 	push	de
   85B3 E5            [11] 1638 	push	hl
   85B4 CD AD 84      [17] 1639 	call	_updateBullet
   85B7 F1            [10] 1640 	pop	af
   85B8 D1            [10] 1641 	pop	de
   85B9 C1            [10] 1642 	pop	bc
                           1643 ;src/entities/entities.c:683: for(i=0;i<NUM_ENEMIGOS;++i){
   85BA 21 4E 00      [10] 1644 	ld	hl,#0x004E
   85BD 19            [11] 1645 	add	hl,de
   85BE EB            [ 4] 1646 	ex	de,hl
   85BF 0C            [ 4] 1647 	inc	c
   85C0 79            [ 4] 1648 	ld	a,c
   85C1 D6 03         [ 7] 1649 	sub	a, #0x03
   85C3 38 E8         [12] 1650 	jr	C,00102$
                           1651 ;src/entities/entities.c:694: updateIA();
   85C5 C3 19 86      [10] 1652 	jp  _updateIA
                           1653 ;src/entities/entities.c:696: u8 contarEnemigos(){
                           1654 ;	---------------------------------
                           1655 ; Function contarEnemigos
                           1656 ; ---------------------------------
   85C8                    1657 _contarEnemigos::
   85C8 DD E5         [15] 1658 	push	ix
   85CA DD 21 00 00   [14] 1659 	ld	ix,#0
   85CE DD 39         [15] 1660 	add	ix,sp
   85D0 F5            [11] 1661 	push	af
   85D1 3B            [ 6] 1662 	dec	sp
                           1663 ;src/entities/entities.c:699: for(i=0;i<NUM_ENEMIGOS;++i){
   85D2 DD 36 FE 00   [19] 1664 	ld	-2 (ix),#0x00
   85D6 DD 36 FD 00   [19] 1665 	ld	-3 (ix),#0x00
   85DA 01 00 00      [10] 1666 	ld	bc,#0x0000
   85DD                    1667 00105$:
                           1668 ;src/entities/entities.c:700: if(enemigos[i].ent.cuadrante == mapaActual && enemigos[i].ent.vivo == 1){
   85DD 21 7D 7E      [10] 1669 	ld	hl,#_enemigos
   85E0 09            [11] 1670 	add	hl,bc
   85E1 5D            [ 4] 1671 	ld	e,l
   85E2 54            [ 4] 1672 	ld	d,h
   85E3 C5            [11] 1673 	push	bc
   85E4 01 42 00      [10] 1674 	ld	bc, #0x0042
   85E7 09            [11] 1675 	add	hl, bc
   85E8 C1            [10] 1676 	pop	bc
   85E9 7E            [ 7] 1677 	ld	a,(hl)
   85EA DD 77 FF      [19] 1678 	ld	-1 (ix),a
   85ED 3A 7D 7D      [13] 1679 	ld	a,(#_mapaActual + 0)
   85F0 DD 96 FF      [19] 1680 	sub	a, -1 (ix)
   85F3 20 0C         [12] 1681 	jr	NZ,00106$
   85F5 D5            [11] 1682 	push	de
   85F6 FD E1         [14] 1683 	pop	iy
   85F8 FD 5E 41      [19] 1684 	ld	e,65 (iy)
   85FB 1D            [ 4] 1685 	dec	e
   85FC 20 03         [12] 1686 	jr	NZ,00106$
                           1687 ;src/entities/entities.c:701: cuenta++;
   85FE DD 34 FE      [23] 1688 	inc	-2 (ix)
   8601                    1689 00106$:
                           1690 ;src/entities/entities.c:699: for(i=0;i<NUM_ENEMIGOS;++i){
   8601 21 4E 00      [10] 1691 	ld	hl,#0x004E
   8604 09            [11] 1692 	add	hl,bc
   8605 4D            [ 4] 1693 	ld	c,l
   8606 44            [ 4] 1694 	ld	b,h
   8607 DD 34 FD      [23] 1695 	inc	-3 (ix)
   860A DD 7E FD      [19] 1696 	ld	a,-3 (ix)
   860D D6 03         [ 7] 1697 	sub	a, #0x03
   860F 38 CC         [12] 1698 	jr	C,00105$
                           1699 ;src/entities/entities.c:704: return cuenta;
   8611 DD 6E FE      [19] 1700 	ld	l,-2 (ix)
   8614 DD F9         [10] 1701 	ld	sp, ix
   8616 DD E1         [14] 1702 	pop	ix
   8618 C9            [10] 1703 	ret
                           1704 ;src/entities/entities.c:707: void updateIA(){
                           1705 ;	---------------------------------
                           1706 ; Function updateIA
                           1707 ; ---------------------------------
   8619                    1708 _updateIA::
   8619 DD E5         [15] 1709 	push	ix
   861B DD 21 00 00   [14] 1710 	ld	ix,#0
   861F DD 39         [15] 1711 	add	ix,sp
   8621 F5            [11] 1712 	push	af
                           1713 ;src/entities/entities.c:713: for(i=0;i<NUM_ENEMIGOS;++i){
   8622 DD 36 FE 00   [19] 1714 	ld	-2 (ix),#0x00
   8626 01 00 00      [10] 1715 	ld	bc,#0x0000
   8629                    1716 00105$:
                           1717 ;src/entities/entities.c:716: if(enemigos[i].ent.cuadrante == mapaActual && enemigos[i].ent.vivo){
   8629 21 7D 7E      [10] 1718 	ld	hl,#_enemigos
   862C 09            [11] 1719 	add	hl,bc
   862D EB            [ 4] 1720 	ex	de,hl
   862E D5            [11] 1721 	push	de
   862F FD E1         [14] 1722 	pop	iy
   8631 FD 7E 42      [19] 1723 	ld	a,66 (iy)
   8634 DD 77 FF      [19] 1724 	ld	-1 (ix),a
   8637 3A 7D 7D      [13] 1725 	ld	a,(#_mapaActual + 0)
   863A DD 96 FF      [19] 1726 	sub	a, -1 (ix)
   863D 20 10         [12] 1727 	jr	NZ,00106$
   863F D5            [11] 1728 	push	de
   8640 FD E1         [14] 1729 	pop	iy
   8642 FD 7E 41      [19] 1730 	ld	a,65 (iy)
   8645 B7            [ 4] 1731 	or	a, a
   8646 28 07         [12] 1732 	jr	Z,00106$
                           1733 ;src/entities/entities.c:718: updateIAState(&enemigos[i]);
   8648 C5            [11] 1734 	push	bc
   8649 D5            [11] 1735 	push	de
   864A CD 4E 88      [17] 1736 	call	_updateIAState
   864D F1            [10] 1737 	pop	af
   864E C1            [10] 1738 	pop	bc
   864F                    1739 00106$:
                           1740 ;src/entities/entities.c:713: for(i=0;i<NUM_ENEMIGOS;++i){
   864F 21 4E 00      [10] 1741 	ld	hl,#0x004E
   8652 09            [11] 1742 	add	hl,bc
   8653 4D            [ 4] 1743 	ld	c,l
   8654 44            [ 4] 1744 	ld	b,h
   8655 DD 34 FE      [23] 1745 	inc	-2 (ix)
   8658 DD 7E FE      [19] 1746 	ld	a,-2 (ix)
   865B D6 03         [ 7] 1747 	sub	a, #0x03
   865D 38 CA         [12] 1748 	jr	C,00105$
   865F DD F9         [10] 1749 	ld	sp, ix
   8661 DD E1         [14] 1750 	pop	ix
   8663 C9            [10] 1751 	ret
                           1752 ;src/entities/entities.c:727: TPlayerDirection comprobarEjeX(TEnemy* ene){
                           1753 ;	---------------------------------
                           1754 ; Function comprobarEjeX
                           1755 ; ---------------------------------
   8664                    1756 _comprobarEjeX::
   8664 DD E5         [15] 1757 	push	ix
   8666 DD 21 00 00   [14] 1758 	ld	ix,#0
   866A DD 39         [15] 1759 	add	ix,sp
                           1760 ;src/entities/entities.c:730: if(ene->ent.x > puntos[ene->puntoDeControl].x){	//Si se cumple movemos hacia la izquierda
   866C DD 4E 04      [19] 1761 	ld	c,4 (ix)
   866F DD 46 05      [19] 1762 	ld	b,5 (ix)
   8672 69            [ 4] 1763 	ld	l, c
   8673 60            [ 4] 1764 	ld	h, b
   8674 11 26 00      [10] 1765 	ld	de, #0x0026
   8677 19            [11] 1766 	add	hl, de
   8678 5E            [ 7] 1767 	ld	e,(hl)
   8679 23            [ 6] 1768 	inc	hl
   867A 56            [ 7] 1769 	ld	d,(hl)
   867B 69            [ 4] 1770 	ld	l, c
   867C 60            [ 4] 1771 	ld	h, b
   867D 01 4D 00      [10] 1772 	ld	bc, #0x004D
   8680 09            [11] 1773 	add	hl, bc
   8681 6E            [ 7] 1774 	ld	l,(hl)
   8682 26 00         [ 7] 1775 	ld	h,#0x00
   8684 29            [11] 1776 	add	hl, hl
   8685 01 51 80      [10] 1777 	ld	bc,#_puntos
   8688 09            [11] 1778 	add	hl,bc
   8689 4E            [ 7] 1779 	ld	c,(hl)
   868A 06 00         [ 7] 1780 	ld	b,#0x00
   868C 79            [ 4] 1781 	ld	a,c
   868D 93            [ 4] 1782 	sub	a, e
   868E 78            [ 4] 1783 	ld	a,b
   868F 9A            [ 4] 1784 	sbc	a, d
   8690 E2 95 86      [10] 1785 	jp	PO, 00110$
   8693 EE 80         [ 7] 1786 	xor	a, #0x80
   8695                    1787 00110$:
   8695 F2 9C 86      [10] 1788 	jp	P,00102$
                           1789 ;src/entities/entities.c:731: dir = d_left;
   8698 2E 03         [ 7] 1790 	ld	l,#0x03
   869A 18 02         [12] 1791 	jr	00103$
   869C                    1792 00102$:
                           1793 ;src/entities/entities.c:733: dir = d_right;
   869C 2E 01         [ 7] 1794 	ld	l,#0x01
   869E                    1795 00103$:
                           1796 ;src/entities/entities.c:736: return dir;
   869E DD E1         [14] 1797 	pop	ix
   86A0 C9            [10] 1798 	ret
                           1799 ;src/entities/entities.c:738: TPlayerDirection comprobarEjeY(TEnemy* ene){
                           1800 ;	---------------------------------
                           1801 ; Function comprobarEjeY
                           1802 ; ---------------------------------
   86A1                    1803 _comprobarEjeY::
   86A1 DD E5         [15] 1804 	push	ix
   86A3 DD 21 00 00   [14] 1805 	ld	ix,#0
   86A7 DD 39         [15] 1806 	add	ix,sp
                           1807 ;src/entities/entities.c:741: if(ene->ent.y > puntos[ene->puntoDeControl].y){	//Si se cumple movemos hacia la derecha
   86A9 DD 4E 04      [19] 1808 	ld	c,4 (ix)
   86AC DD 46 05      [19] 1809 	ld	b,5 (ix)
   86AF 69            [ 4] 1810 	ld	l, c
   86B0 60            [ 4] 1811 	ld	h, b
   86B1 11 28 00      [10] 1812 	ld	de, #0x0028
   86B4 19            [11] 1813 	add	hl, de
   86B5 5E            [ 7] 1814 	ld	e,(hl)
   86B6 23            [ 6] 1815 	inc	hl
   86B7 56            [ 7] 1816 	ld	d,(hl)
   86B8 69            [ 4] 1817 	ld	l, c
   86B9 60            [ 4] 1818 	ld	h, b
   86BA 01 4D 00      [10] 1819 	ld	bc, #0x004D
   86BD 09            [11] 1820 	add	hl, bc
   86BE 6E            [ 7] 1821 	ld	l,(hl)
   86BF 26 00         [ 7] 1822 	ld	h,#0x00
   86C1 29            [11] 1823 	add	hl, hl
   86C2 01 51 80      [10] 1824 	ld	bc,#_puntos
   86C5 09            [11] 1825 	add	hl,bc
   86C6 23            [ 6] 1826 	inc	hl
   86C7 4E            [ 7] 1827 	ld	c,(hl)
   86C8 06 00         [ 7] 1828 	ld	b,#0x00
   86CA 79            [ 4] 1829 	ld	a,c
   86CB 93            [ 4] 1830 	sub	a, e
   86CC 78            [ 4] 1831 	ld	a,b
   86CD 9A            [ 4] 1832 	sbc	a, d
   86CE E2 D3 86      [10] 1833 	jp	PO, 00110$
   86D1 EE 80         [ 7] 1834 	xor	a, #0x80
   86D3                    1835 00110$:
   86D3 F2 DA 86      [10] 1836 	jp	P,00102$
                           1837 ;src/entities/entities.c:742: dir = d_up;
   86D6 2E 00         [ 7] 1838 	ld	l,#0x00
   86D8 18 02         [12] 1839 	jr	00103$
   86DA                    1840 00102$:
                           1841 ;src/entities/entities.c:744: dir = d_down;
   86DA 2E 02         [ 7] 1842 	ld	l,#0x02
   86DC                    1843 00103$:
                           1844 ;src/entities/entities.c:747: return dir;
   86DC DD E1         [14] 1845 	pop	ix
   86DE C9            [10] 1846 	ret
                           1847 ;src/entities/entities.c:749: u8 moverHaciaPuntoDeControl(TEnemy* ene){
                           1848 ;	---------------------------------
                           1849 ; Function moverHaciaPuntoDeControl
                           1850 ; ---------------------------------
   86DF                    1851 _moverHaciaPuntoDeControl::
   86DF DD E5         [15] 1852 	push	ix
   86E1 DD 21 00 00   [14] 1853 	ld	ix,#0
   86E5 DD 39         [15] 1854 	add	ix,sp
   86E7 21 F6 FF      [10] 1855 	ld	hl,#-10
   86EA 39            [11] 1856 	add	hl,sp
   86EB F9            [ 6] 1857 	ld	sp,hl
                           1858 ;src/entities/entities.c:752: u8 llego = NO;
   86EC DD 36 F6 00   [19] 1859 	ld	-10 (ix),#0x00
                           1860 ;src/entities/entities.c:753: if(++ene->cycles >= ene->wait_cycles){
   86F0 DD 4E 04      [19] 1861 	ld	c,4 (ix)
   86F3 DD 46 05      [19] 1862 	ld	b,5 (ix)
   86F6 21 4A 00      [10] 1863 	ld	hl,#0x004A
   86F9 09            [11] 1864 	add	hl,bc
   86FA DD 75 FC      [19] 1865 	ld	-4 (ix),l
   86FD DD 74 FD      [19] 1866 	ld	-3 (ix),h
   8700 DD 6E FC      [19] 1867 	ld	l,-4 (ix)
   8703 DD 66 FD      [19] 1868 	ld	h,-3 (ix)
   8706 5E            [ 7] 1869 	ld	e,(hl)
   8707 1C            [ 4] 1870 	inc	e
   8708 DD 6E FC      [19] 1871 	ld	l,-4 (ix)
   870B DD 66 FD      [19] 1872 	ld	h,-3 (ix)
   870E 73            [ 7] 1873 	ld	(hl),e
   870F 69            [ 4] 1874 	ld	l, c
   8710 60            [ 4] 1875 	ld	h, b
   8711 C5            [11] 1876 	push	bc
   8712 01 4B 00      [10] 1877 	ld	bc, #0x004B
   8715 09            [11] 1878 	add	hl, bc
   8716 C1            [10] 1879 	pop	bc
   8717 56            [ 7] 1880 	ld	d,(hl)
                           1881 ;src/entities/entities.c:756: diff = abs(ene->ent.x - puntos[ene->puntoDeControl].x);	
   8718 21 26 00      [10] 1882 	ld	hl,#0x0026
   871B 09            [11] 1883 	add	hl,bc
   871C DD 75 F9      [19] 1884 	ld	-7 (ix),l
   871F DD 74 FA      [19] 1885 	ld	-6 (ix),h
                           1886 ;src/entities/entities.c:764: ene->ent.curr_dir = dir;
   8722 21 3B 00      [10] 1887 	ld	hl,#0x003B
   8725 09            [11] 1888 	add	hl,bc
   8726 DD 75 F7      [19] 1889 	ld	-9 (ix),l
   8729 DD 74 F8      [19] 1890 	ld	-8 (ix),h
                           1891 ;src/entities/entities.c:753: if(++ene->cycles >= ene->wait_cycles){
   872C 7B            [ 4] 1892 	ld	a,e
   872D 92            [ 4] 1893 	sub	a, d
   872E DA D1 87      [10] 1894 	jp	C,00106$
                           1895 ;src/entities/entities.c:754: dir = comprobarEjeX(ene);
   8731 C5            [11] 1896 	push	bc
   8732 C5            [11] 1897 	push	bc
   8733 CD 64 86      [17] 1898 	call	_comprobarEjeX
   8736 F1            [10] 1899 	pop	af
   8737 C1            [10] 1900 	pop	bc
   8738 DD 75 FB      [19] 1901 	ld	-5 (ix),l
                           1902 ;src/entities/entities.c:756: diff = abs(ene->ent.x - puntos[ene->puntoDeControl].x);	
   873B DD 6E F9      [19] 1903 	ld	l,-7 (ix)
   873E DD 66 FA      [19] 1904 	ld	h,-6 (ix)
   8741 7E            [ 7] 1905 	ld	a,(hl)
   8742 DD 77 FE      [19] 1906 	ld	-2 (ix),a
   8745 23            [ 6] 1907 	inc	hl
   8746 7E            [ 7] 1908 	ld	a,(hl)
   8747 DD 77 FF      [19] 1909 	ld	-1 (ix),a
   874A 21 4D 00      [10] 1910 	ld	hl,#0x004D
   874D 09            [11] 1911 	add	hl,bc
   874E EB            [ 4] 1912 	ex	de,hl
   874F 1A            [ 7] 1913 	ld	a,(de)
   8750 6F            [ 4] 1914 	ld	l,a
   8751 26 00         [ 7] 1915 	ld	h,#0x00
   8753 29            [11] 1916 	add	hl, hl
   8754 3E 51         [ 7] 1917 	ld	a,#<(_puntos)
   8756 85            [ 4] 1918 	add	a, l
   8757 6F            [ 4] 1919 	ld	l,a
   8758 3E 80         [ 7] 1920 	ld	a,#>(_puntos)
   875A 8C            [ 4] 1921 	adc	a, h
   875B 67            [ 4] 1922 	ld	h,a
   875C 6E            [ 7] 1923 	ld	l,(hl)
   875D 26 00         [ 7] 1924 	ld	h,#0x00
   875F DD 7E FE      [19] 1925 	ld	a,-2 (ix)
   8762 95            [ 4] 1926 	sub	a, l
   8763 6F            [ 4] 1927 	ld	l,a
   8764 DD 7E FF      [19] 1928 	ld	a,-1 (ix)
   8767 9C            [ 4] 1929 	sbc	a, h
   8768 67            [ 4] 1930 	ld	h,a
   8769 C5            [11] 1931 	push	bc
   876A D5            [11] 1932 	push	de
   876B E5            [11] 1933 	push	hl
   876C CD F2 87      [17] 1934 	call	_abs
   876F F1            [10] 1935 	pop	af
   8770 D1            [10] 1936 	pop	de
   8771 C1            [10] 1937 	pop	bc
                           1938 ;src/entities/entities.c:757: if(diff <= 2){
   8772 3E 02         [ 7] 1939 	ld	a,#0x02
   8774 BD            [ 4] 1940 	cp	a, l
   8775 3E 00         [ 7] 1941 	ld	a,#0x00
   8777 9C            [ 4] 1942 	sbc	a, h
   8778 E2 7D 87      [10] 1943 	jp	PO, 00121$
   877B EE 80         [ 7] 1944 	xor	a, #0x80
   877D                    1945 00121$:
   877D FA BF 87      [10] 1946 	jp	M,00104$
                           1947 ;src/entities/entities.c:758: dir = comprobarEjeY(ene);
   8780 C5            [11] 1948 	push	bc
   8781 D5            [11] 1949 	push	de
   8782 C5            [11] 1950 	push	bc
   8783 CD A1 86      [17] 1951 	call	_comprobarEjeY
   8786 F1            [10] 1952 	pop	af
   8787 D1            [10] 1953 	pop	de
   8788 C1            [10] 1954 	pop	bc
   8789 DD 75 FB      [19] 1955 	ld	-5 (ix),l
                           1956 ;src/entities/entities.c:759: diff = abs(ene->ent.y - puntos[ene->puntoDeControl].y);	
   878C 69            [ 4] 1957 	ld	l, c
   878D 60            [ 4] 1958 	ld	h, b
   878E 01 28 00      [10] 1959 	ld	bc, #0x0028
   8791 09            [11] 1960 	add	hl, bc
   8792 4E            [ 7] 1961 	ld	c,(hl)
   8793 23            [ 6] 1962 	inc	hl
   8794 46            [ 7] 1963 	ld	b,(hl)
   8795 1A            [ 7] 1964 	ld	a,(de)
   8796 6F            [ 4] 1965 	ld	l,a
   8797 26 00         [ 7] 1966 	ld	h,#0x00
   8799 29            [11] 1967 	add	hl, hl
   879A 11 51 80      [10] 1968 	ld	de,#_puntos
   879D 19            [11] 1969 	add	hl,de
   879E 23            [ 6] 1970 	inc	hl
   879F 5E            [ 7] 1971 	ld	e,(hl)
   87A0 16 00         [ 7] 1972 	ld	d,#0x00
   87A2 79            [ 4] 1973 	ld	a,c
   87A3 93            [ 4] 1974 	sub	a, e
   87A4 4F            [ 4] 1975 	ld	c,a
   87A5 78            [ 4] 1976 	ld	a,b
   87A6 9A            [ 4] 1977 	sbc	a, d
   87A7 47            [ 4] 1978 	ld	b,a
   87A8 C5            [11] 1979 	push	bc
   87A9 CD F2 87      [17] 1980 	call	_abs
   87AC F1            [10] 1981 	pop	af
                           1982 ;src/entities/entities.c:760: if(diff <= 2){
   87AD 3E 02         [ 7] 1983 	ld	a,#0x02
   87AF BD            [ 4] 1984 	cp	a, l
   87B0 3E 00         [ 7] 1985 	ld	a,#0x00
   87B2 9C            [ 4] 1986 	sbc	a, h
   87B3 E2 B8 87      [10] 1987 	jp	PO, 00122$
   87B6 EE 80         [ 7] 1988 	xor	a, #0x80
   87B8                    1989 00122$:
   87B8 FA BF 87      [10] 1990 	jp	M,00104$
                           1991 ;src/entities/entities.c:761: llego = SI;
   87BB DD 36 F6 01   [19] 1992 	ld	-10 (ix),#0x01
   87BF                    1993 00104$:
                           1994 ;src/entities/entities.c:764: ene->ent.curr_dir = dir;
   87BF DD 6E F7      [19] 1995 	ld	l,-9 (ix)
   87C2 DD 66 F8      [19] 1996 	ld	h,-8 (ix)
   87C5 DD 7E FB      [19] 1997 	ld	a,-5 (ix)
   87C8 77            [ 7] 1998 	ld	(hl),a
                           1999 ;src/entities/entities.c:765: ene->cycles = 0; //Reseteamos el ciclo actual de espera
   87C9 DD 6E FC      [19] 2000 	ld	l,-4 (ix)
   87CC DD 66 FD      [19] 2001 	ld	h,-3 (ix)
   87CF 36 00         [10] 2002 	ld	(hl),#0x00
   87D1                    2003 00106$:
                           2004 ;src/entities/entities.c:768: accion(&ene->ent, es_mover, ene->ent.curr_dir);
   87D1 DD 6E F7      [19] 2005 	ld	l,-9 (ix)
   87D4 DD 66 F8      [19] 2006 	ld	h,-8 (ix)
   87D7 46            [ 7] 2007 	ld	b,(hl)
   87D8 C5            [11] 2008 	push	bc
   87D9 33            [ 6] 2009 	inc	sp
   87DA 3E 01         [ 7] 2010 	ld	a,#0x01
   87DC F5            [11] 2011 	push	af
   87DD 33            [ 6] 2012 	inc	sp
   87DE DD 6E F9      [19] 2013 	ld	l,-7 (ix)
   87E1 DD 66 FA      [19] 2014 	ld	h,-6 (ix)
   87E4 E5            [11] 2015 	push	hl
   87E5 CD 59 80      [17] 2016 	call	_accion
   87E8 F1            [10] 2017 	pop	af
   87E9 F1            [10] 2018 	pop	af
                           2019 ;src/entities/entities.c:770: return llego;
   87EA DD 6E F6      [19] 2020 	ld	l,-10 (ix)
   87ED DD F9         [10] 2021 	ld	sp, ix
   87EF DD E1         [14] 2022 	pop	ix
   87F1 C9            [10] 2023 	ret
                           2024 ;src/entities/entities.c:772: i16 abs(i16 num){
                           2025 ;	---------------------------------
                           2026 ; Function abs
                           2027 ; ---------------------------------
   87F2                    2028 _abs::
                           2029 ;src/entities/entities.c:775: if(num<0){
   87F2 FD 21 02 00   [14] 2030 	ld	iy,#2
   87F6 FD 39         [15] 2031 	add	iy,sp
   87F8 FD CB 01 7E   [20] 2032 	bit	7,1 (iy)
   87FC 28 0C         [12] 2033 	jr	Z,00102$
                           2034 ;src/entities/entities.c:776: numPositivo -= num;
   87FE AF            [ 4] 2035 	xor	a, a
   87FF FD 96 00      [19] 2036 	sub	a, 0 (iy)
   8802 6F            [ 4] 2037 	ld	l,a
   8803 3E 00         [ 7] 2038 	ld	a, #0x00
   8805 FD 9E 01      [19] 2039 	sbc	a, 1 (iy)
   8808 67            [ 4] 2040 	ld	h,a
   8809 C9            [10] 2041 	ret
   880A                    2042 00102$:
                           2043 ;src/entities/entities.c:778: numPositivo=num;
   880A C1            [10] 2044 	pop	bc
   880B E1            [10] 2045 	pop	hl
   880C E5            [11] 2046 	push	hl
   880D C5            [11] 2047 	push	bc
                           2048 ;src/entities/entities.c:781: return numPositivo;
   880E C9            [10] 2049 	ret
                           2050 ;src/entities/entities.c:784: TPlayerDirection calculaDireccion(){
                           2051 ;	---------------------------------
                           2052 ; Function calculaDireccion
                           2053 ; ---------------------------------
   880F                    2054 _calculaDireccion::
   880F 3B            [ 6] 2055 	dec	sp
                           2056 ;src/entities/entities.c:786: switch(mapaActual){
   8810 3E 05         [ 7] 2057 	ld	a,#0x05
   8812 FD 21 7D 7D   [14] 2058 	ld	iy,#_mapaActual
   8816 FD 96 00      [19] 2059 	sub	a, 0 (iy)
   8819 38 31         [12] 2060 	jr	C,00107$
   881B FD 21 7D 7D   [14] 2061 	ld	iy,#_mapaActual
   881F FD 5E 00      [19] 2062 	ld	e,0 (iy)
   8822 16 00         [ 7] 2063 	ld	d,#0x00
   8824 21 2A 88      [10] 2064 	ld	hl,#00114$
   8827 19            [11] 2065 	add	hl,de
   8828 19            [11] 2066 	add	hl,de
                           2067 ;src/entities/entities.c:787: case 0:
   8829 E9            [ 4] 2068 	jp	(hl)
   882A                    2069 00114$:
   882A 18 0A         [12] 2070 	jr	00101$
   882C 18 0C         [12] 2071 	jr	00102$
   882E 18 0E         [12] 2072 	jr	00103$
   8830 18 10         [12] 2073 	jr	00104$
   8832 18 12         [12] 2074 	jr	00105$
   8834 18 14         [12] 2075 	jr	00106$
   8836                    2076 00101$:
                           2077 ;src/entities/entities.c:788: dir = d_right;
   8836 2E 01         [ 7] 2078 	ld	l,#0x01
                           2079 ;src/entities/entities.c:789: break;
   8838 18 12         [12] 2080 	jr	00107$
                           2081 ;src/entities/entities.c:790: case 1:
   883A                    2082 00102$:
                           2083 ;src/entities/entities.c:791: dir = d_up;
   883A 2E 00         [ 7] 2084 	ld	l,#0x00
                           2085 ;src/entities/entities.c:792: break;
   883C 18 0E         [12] 2086 	jr	00107$
                           2087 ;src/entities/entities.c:793: case 2:
   883E                    2088 00103$:
                           2089 ;src/entities/entities.c:794: dir = d_right;
   883E 2E 01         [ 7] 2090 	ld	l,#0x01
                           2091 ;src/entities/entities.c:795: break;
   8840 18 0A         [12] 2092 	jr	00107$
                           2093 ;src/entities/entities.c:796: case 3:
   8842                    2094 00104$:
                           2095 ;src/entities/entities.c:797: dir = d_up;
   8842 2E 00         [ 7] 2096 	ld	l,#0x00
                           2097 ;src/entities/entities.c:798: break;
   8844 18 06         [12] 2098 	jr	00107$
                           2099 ;src/entities/entities.c:799: case 4:
   8846                    2100 00105$:
                           2101 ;src/entities/entities.c:800: dir = d_down;
   8846 2E 02         [ 7] 2102 	ld	l,#0x02
                           2103 ;src/entities/entities.c:801: break;
   8848 18 02         [12] 2104 	jr	00107$
                           2105 ;src/entities/entities.c:802: case 5:
   884A                    2106 00106$:
                           2107 ;src/entities/entities.c:803: dir = d_down;
   884A 2E 02         [ 7] 2108 	ld	l,#0x02
                           2109 ;src/entities/entities.c:805: }
   884C                    2110 00107$:
                           2111 ;src/entities/entities.c:806: return dir;
   884C 33            [ 6] 2112 	inc	sp
   884D C9            [10] 2113 	ret
                           2114 ;src/entities/entities.c:809: void updateIAState(TEnemy* ene){
                           2115 ;	---------------------------------
                           2116 ; Function updateIAState
                           2117 ; ---------------------------------
   884E                    2118 _updateIAState::
   884E DD E5         [15] 2119 	push	ix
   8850 DD 21 00 00   [14] 2120 	ld	ix,#0
   8854 DD 39         [15] 2121 	add	ix,sp
   8856 21 F6 FF      [10] 2122 	ld	hl,#-10
   8859 39            [11] 2123 	add	hl,sp
   885A F9            [ 6] 2124 	ld	sp,hl
                           2125 ;src/entities/entities.c:810: TPlayer* p = &player;
                           2126 ;src/entities/entities.c:811: TCoord* c = &puntos[0];
                           2127 ;src/entities/entities.c:812: TBase* bases = getBases();
   885B CD 4F 90      [17] 2128 	call	_getBases
   885E DD 75 F7      [19] 2129 	ld	-9 (ix),l
   8861 DD 74 F8      [19] 2130 	ld	-8 (ix),h
                           2131 ;src/entities/entities.c:814: switch(ene->statusIA){
   8864 DD 7E 04      [19] 2132 	ld	a,4 (ix)
   8867 DD 77 FB      [19] 2133 	ld	-5 (ix),a
   886A DD 7E 05      [19] 2134 	ld	a,5 (ix)
   886D DD 77 FC      [19] 2135 	ld	-4 (ix),a
   8870 DD 7E FB      [19] 2136 	ld	a,-5 (ix)
   8873 C6 49         [ 7] 2137 	add	a, #0x49
   8875 DD 77 F9      [19] 2138 	ld	-7 (ix),a
   8878 DD 7E FC      [19] 2139 	ld	a,-4 (ix)
   887B CE 00         [ 7] 2140 	adc	a, #0x00
   887D DD 77 FA      [19] 2141 	ld	-6 (ix),a
   8880 DD 6E F9      [19] 2142 	ld	l,-7 (ix)
   8883 DD 66 FA      [19] 2143 	ld	h,-6 (ix)
   8886 7E            [ 7] 2144 	ld	a,(hl)
   8887 DD 77 FF      [19] 2145 	ld	-1 (ix), a
   888A B7            [ 4] 2146 	or	a, a
   888B 28 0B         [12] 2147 	jr	Z,00101$
   888D DD 7E FF      [19] 2148 	ld	a,-1 (ix)
   8890 D6 03         [ 7] 2149 	sub	a, #0x03
   8892 CA 28 89      [10] 2150 	jp	Z,00110$
   8895 C3 14 8A      [10] 2151 	jp	00122$
                           2152 ;src/entities/entities.c:815: case s_mover:
   8898                    2153 00101$:
                           2154 ;src/entities/entities.c:818: if(basesCapturadas >= 5 && contarEnemigos() == 1 && count == 0){
   8898 3A 80 7D      [13] 2155 	ld	a,(#_basesCapturadas + 0)
   889B D6 05         [ 7] 2156 	sub	a, #0x05
   889D 38 1B         [12] 2157 	jr	C,00103$
   889F CD C8 85      [17] 2158 	call	_contarEnemigos
   88A2 2D            [ 4] 2159 	dec	l
   88A3 20 15         [12] 2160 	jr	NZ,00103$
   88A5 3A 83 7D      [13] 2161 	ld	a,(#_count + 0)
   88A8 B7            [ 4] 2162 	or	a, a
   88A9 20 0F         [12] 2163 	jr	NZ,00103$
                           2164 ;src/entities/entities.c:819: ene->statusIA = s_huir;
   88AB DD 6E F9      [19] 2165 	ld	l,-7 (ix)
   88AE DD 66 FA      [19] 2166 	ld	h,-6 (ix)
   88B1 36 03         [10] 2167 	ld	(hl),#0x03
                           2168 ;src/entities/entities.c:820: count++;
   88B3 21 83 7D      [10] 2169 	ld	hl, #_count+0
   88B6 34            [11] 2170 	inc	(hl)
                           2171 ;src/entities/entities.c:821: break;		//Salimos
   88B7 C3 14 8A      [10] 2172 	jp	00122$
   88BA                    2173 00103$:
                           2174 ;src/entities/entities.c:824: if(moverHaciaPuntoDeControl(ene))	//si devuelve true es que ha llegado al siguiente
   88BA DD 6E FB      [19] 2175 	ld	l,-5 (ix)
   88BD DD 66 FC      [19] 2176 	ld	h,-4 (ix)
   88C0 E5            [11] 2177 	push	hl
   88C1 CD DF 86      [17] 2178 	call	_moverHaciaPuntoDeControl
   88C4 F1            [10] 2179 	pop	af
   88C5 DD 75 FF      [19] 2180 	ld	-1 (ix),l
                           2181 ;src/entities/entities.c:825: ene->puntoDeControl++;			//punto de control por lo que ahora cambia de destino
   88C8 DD 7E FB      [19] 2182 	ld	a,-5 (ix)
   88CB C6 4D         [ 7] 2183 	add	a, #0x4D
   88CD DD 77 F9      [19] 2184 	ld	-7 (ix),a
   88D0 DD 7E FC      [19] 2185 	ld	a,-4 (ix)
   88D3 CE 00         [ 7] 2186 	adc	a, #0x00
   88D5 DD 77 FA      [19] 2187 	ld	-6 (ix),a
                           2188 ;src/entities/entities.c:824: if(moverHaciaPuntoDeControl(ene))	//si devuelve true es que ha llegado al siguiente
   88D8 DD 7E FF      [19] 2189 	ld	a,-1 (ix)
   88DB B7            [ 4] 2190 	or	a, a
   88DC 28 13         [12] 2191 	jr	Z,00107$
                           2192 ;src/entities/entities.c:825: ene->puntoDeControl++;			//punto de control por lo que ahora cambia de destino
   88DE DD 6E F9      [19] 2193 	ld	l,-7 (ix)
   88E1 DD 66 FA      [19] 2194 	ld	h,-6 (ix)
   88E4 7E            [ 7] 2195 	ld	a,(hl)
   88E5 DD 77 FF      [19] 2196 	ld	-1 (ix), a
   88E8 4F            [ 4] 2197 	ld	c, a
   88E9 0C            [ 4] 2198 	inc	c
   88EA DD 6E F9      [19] 2199 	ld	l,-7 (ix)
   88ED DD 66 FA      [19] 2200 	ld	h,-6 (ix)
   88F0 71            [ 7] 2201 	ld	(hl),c
   88F1                    2202 00107$:
                           2203 ;src/entities/entities.c:826: if(ene->puntoDeControl > 3){
   88F1 DD 6E F9      [19] 2204 	ld	l,-7 (ix)
   88F4 DD 66 FA      [19] 2205 	ld	h,-6 (ix)
   88F7 4E            [ 7] 2206 	ld	c,(hl)
   88F8 3E 03         [ 7] 2207 	ld	a,#0x03
   88FA 91            [ 4] 2208 	sub	a, c
   88FB 30 18         [12] 2209 	jr	NC,00109$
                           2210 ;src/entities/entities.c:828: c->x = p->ent.x;
   88FD ED 4B FE 58   [20] 2211 	ld	bc, (#(_player + 0x0026) + 0)
   8901 21 51 80      [10] 2212 	ld	hl,#_puntos
   8904 71            [ 7] 2213 	ld	(hl),c
                           2214 ;src/entities/entities.c:829: c->y = p->ent.y;
   8905 ED 4B 00 59   [20] 2215 	ld	bc, (#(_player + 0x0026) + 2)
   8909 21 52 80      [10] 2216 	ld	hl,#(_puntos + 0x0001)
   890C 71            [ 7] 2217 	ld	(hl),c
                           2218 ;src/entities/entities.c:830: ene->puntoDeControl = 0;
   890D DD 6E F9      [19] 2219 	ld	l,-7 (ix)
   8910 DD 66 FA      [19] 2220 	ld	h,-6 (ix)
   8913 36 00         [10] 2221 	ld	(hl),#0x00
   8915                    2222 00109$:
                           2223 ;src/entities/entities.c:832: comprobarSiDisparo(ene, p);
   8915 21 D8 58      [10] 2224 	ld	hl,#_player
   8918 E5            [11] 2225 	push	hl
   8919 DD 6E FB      [19] 2226 	ld	l,-5 (ix)
   891C DD 66 FC      [19] 2227 	ld	h,-4 (ix)
   891F E5            [11] 2228 	push	hl
   8920 CD 19 8A      [17] 2229 	call	_comprobarSiDisparo
   8923 F1            [10] 2230 	pop	af
   8924 F1            [10] 2231 	pop	af
                           2232 ;src/entities/entities.c:833: break;
   8925 C3 14 8A      [10] 2233 	jp	00122$
                           2234 ;src/entities/entities.c:834: case s_huir:
   8928                    2235 00110$:
                           2236 ;src/entities/entities.c:835: ene->ent.curr_dir = calculaDireccion();
   8928 DD 7E FB      [19] 2237 	ld	a,-5 (ix)
   892B C6 26         [ 7] 2238 	add	a, #0x26
   892D 4F            [ 4] 2239 	ld	c,a
   892E DD 7E FC      [19] 2240 	ld	a,-4 (ix)
   8931 CE 00         [ 7] 2241 	adc	a, #0x00
   8933 47            [ 4] 2242 	ld	b,a
   8934 DD 7E FB      [19] 2243 	ld	a,-5 (ix)
   8937 C6 3B         [ 7] 2244 	add	a, #0x3B
   8939 6F            [ 4] 2245 	ld	l,a
   893A DD 7E FC      [19] 2246 	ld	a,-4 (ix)
   893D CE 00         [ 7] 2247 	adc	a, #0x00
   893F 67            [ 4] 2248 	ld	h,a
   8940 E5            [11] 2249 	push	hl
   8941 C5            [11] 2250 	push	bc
   8942 CD 0F 88      [17] 2251 	call	_calculaDireccion
   8945 55            [ 4] 2252 	ld	d,l
   8946 C1            [10] 2253 	pop	bc
   8947 E1            [10] 2254 	pop	hl
   8948 72            [ 7] 2255 	ld	(hl),d
                           2256 ;src/entities/entities.c:836: if(accion(&ene->ent, es_mover, ene->ent.curr_dir) != d_nothing){
   8949 C5            [11] 2257 	push	bc
   894A 1E 01         [ 7] 2258 	ld	e, #0x01
   894C D5            [11] 2259 	push	de
   894D C5            [11] 2260 	push	bc
   894E CD 59 80      [17] 2261 	call	_accion
   8951 F1            [10] 2262 	pop	af
   8952 F1            [10] 2263 	pop	af
   8953 C1            [10] 2264 	pop	bc
   8954 7D            [ 4] 2265 	ld	a,l
   8955 D6 04         [ 7] 2266 	sub	a, #0x04
   8957 CA 14 8A      [10] 2267 	jp	Z,00122$
                           2268 ;src/entities/entities.c:837: calculaEntity(&ene->ent, SI);
   895A C5            [11] 2269 	push	bc
   895B 3E 01         [ 7] 2270 	ld	a,#0x01
   895D F5            [11] 2271 	push	af
   895E 33            [ 6] 2272 	inc	sp
   895F C5            [11] 2273 	push	bc
   8960 CD E6 8C      [17] 2274 	call	_calculaEntity
   8963 F1            [10] 2275 	pop	af
   8964 33            [ 6] 2276 	inc	sp
   8965 CD 34 8C      [17] 2277 	call	_borrarEntity
   8968 F1            [10] 2278 	pop	af
                           2279 ;src/entities/entities.c:839: ene->ent.cuadrante++;
   8969 DD 7E FB      [19] 2280 	ld	a,-5 (ix)
   896C C6 42         [ 7] 2281 	add	a, #0x42
   896E 6F            [ 4] 2282 	ld	l,a
   896F DD 7E FC      [19] 2283 	ld	a,-4 (ix)
   8972 CE 00         [ 7] 2284 	adc	a, #0x00
   8974 67            [ 4] 2285 	ld	h,a
   8975 4E            [ 7] 2286 	ld	c,(hl)
   8976 0C            [ 4] 2287 	inc	c
   8977 71            [ 7] 2288 	ld	(hl),c
                           2289 ;src/entities/entities.c:840: if(ene->ent.cuadrante > 5)
   8978 3E 05         [ 7] 2290 	ld	a,#0x05
   897A 91            [ 4] 2291 	sub	a, c
   897B 30 02         [12] 2292 	jr	NC,00135$
                           2293 ;src/entities/entities.c:841: ene->ent.cuadrante = 0;
   897D 36 00         [10] 2294 	ld	(hl),#0x00
                           2295 ;src/entities/entities.c:842: for(i = 0; i<NUM_BASES; i++){
   897F                    2296 00135$:
   897F DD 36 F6 00   [19] 2297 	ld	-10 (ix),#0x00
   8983 DD 36 F9 00   [19] 2298 	ld	-7 (ix),#0x00
   8987 DD 36 FA 00   [19] 2299 	ld	-6 (ix),#0x00
   898B                    2300 00120$:
                           2301 ;src/entities/entities.c:843: if(bases[i].whom == 0 && bases[i].ent.cuadrante != mapaActual){
   898B DD 7E F7      [19] 2302 	ld	a,-9 (ix)
   898E DD 86 F9      [19] 2303 	add	a, -7 (ix)
   8991 DD 77 FB      [19] 2304 	ld	-5 (ix),a
   8994 DD 7E F8      [19] 2305 	ld	a,-8 (ix)
   8997 DD 8E FA      [19] 2306 	adc	a, -6 (ix)
   899A DD 77 FC      [19] 2307 	ld	-4 (ix),a
   899D DD 6E FB      [19] 2308 	ld	l,-5 (ix)
   89A0 DD 66 FC      [19] 2309 	ld	h,-4 (ix)
   89A3 7E            [ 7] 2310 	ld	a,(hl)
   89A4 B7            [ 4] 2311 	or	a, a
   89A5 20 52         [12] 2312 	jr	NZ,00121$
   89A7 DD 6E FB      [19] 2313 	ld	l,-5 (ix)
   89AA DD 66 FC      [19] 2314 	ld	h,-4 (ix)
   89AD 11 20 00      [10] 2315 	ld	de, #0x0020
   89B0 19            [11] 2316 	add	hl, de
   89B1 4E            [ 7] 2317 	ld	c,(hl)
   89B2 3A 7D 7D      [13] 2318 	ld	a,(#_mapaActual + 0)
   89B5 91            [ 4] 2319 	sub	a, c
   89B6 28 41         [12] 2320 	jr	Z,00121$
                           2321 ;src/entities/entities.c:844: bases[i].whom = 1;
   89B8 DD 6E FB      [19] 2322 	ld	l,-5 (ix)
   89BB DD 66 FC      [19] 2323 	ld	h,-4 (ix)
   89BE 36 01         [10] 2324 	ld	(hl),#0x01
                           2325 ;src/entities/entities.c:845: bases[i].cycles = 0;
   89C0 DD 7E FB      [19] 2326 	ld	a,-5 (ix)
   89C3 C6 03         [ 7] 2327 	add	a, #0x03
   89C5 DD 77 FD      [19] 2328 	ld	-3 (ix),a
   89C8 DD 7E FC      [19] 2329 	ld	a,-4 (ix)
   89CB CE 00         [ 7] 2330 	adc	a, #0x00
   89CD DD 77 FE      [19] 2331 	ld	-2 (ix),a
   89D0 DD 6E FD      [19] 2332 	ld	l,-3 (ix)
   89D3 DD 66 FE      [19] 2333 	ld	h,-2 (ix)
   89D6 36 00         [10] 2334 	ld	(hl),#0x00
                           2335 ;src/entities/entities.c:846: bases[i].ent.sprites[0] = NULL;
   89D8 DD 7E FB      [19] 2336 	ld	a,-5 (ix)
   89DB C6 0F         [ 7] 2337 	add	a, #0x0F
   89DD DD 77 FD      [19] 2338 	ld	-3 (ix),a
   89E0 DD 7E FC      [19] 2339 	ld	a,-4 (ix)
   89E3 CE 00         [ 7] 2340 	adc	a, #0x00
   89E5 DD 77 FE      [19] 2341 	ld	-2 (ix),a
   89E8 DD 6E FD      [19] 2342 	ld	l,-3 (ix)
   89EB DD 66 FE      [19] 2343 	ld	h,-2 (ix)
   89EE 36 00         [10] 2344 	ld	(hl),#0x00
   89F0 23            [ 6] 2345 	inc	hl
   89F1 36 00         [10] 2346 	ld	(hl),#0x00
                           2347 ;src/entities/entities.c:847: basesCapturadas--;
   89F3 21 80 7D      [10] 2348 	ld	hl, #_basesCapturadas+0
   89F6 35            [11] 2349 	dec	(hl)
                           2350 ;src/entities/entities.c:848: break;
   89F7 18 1B         [12] 2351 	jr	00122$
   89F9                    2352 00121$:
                           2353 ;src/entities/entities.c:842: for(i = 0; i<NUM_BASES; i++){
   89F9 DD 7E F9      [19] 2354 	ld	a,-7 (ix)
   89FC C6 27         [ 7] 2355 	add	a, #0x27
   89FE DD 77 F9      [19] 2356 	ld	-7 (ix),a
   8A01 DD 7E FA      [19] 2357 	ld	a,-6 (ix)
   8A04 CE 00         [ 7] 2358 	adc	a, #0x00
   8A06 DD 77 FA      [19] 2359 	ld	-6 (ix),a
   8A09 DD 34 F6      [23] 2360 	inc	-10 (ix)
   8A0C DD 7E F6      [19] 2361 	ld	a,-10 (ix)
   8A0F D6 06         [ 7] 2362 	sub	a, #0x06
   8A11 DA 8B 89      [10] 2363 	jp	C,00120$
                           2364 ;src/entities/entities.c:857: }
   8A14                    2365 00122$:
   8A14 DD F9         [10] 2366 	ld	sp, ix
   8A16 DD E1         [14] 2367 	pop	ix
   8A18 C9            [10] 2368 	ret
                           2369 ;src/entities/entities.c:859: void comprobarSiDisparo(TEnemy* ene, TPlayer* p){
                           2370 ;	---------------------------------
                           2371 ; Function comprobarSiDisparo
                           2372 ; ---------------------------------
   8A19                    2373 _comprobarSiDisparo::
   8A19 DD E5         [15] 2374 	push	ix
   8A1B DD 21 00 00   [14] 2375 	ld	ix,#0
   8A1F DD 39         [15] 2376 	add	ix,sp
   8A21 21 F1 FF      [10] 2377 	ld	hl,#-15
   8A24 39            [11] 2378 	add	hl,sp
   8A25 F9            [ 6] 2379 	ld	sp,hl
                           2380 ;src/entities/entities.c:862: if(++ene->shot_cycles >= wshot_cycles){
   8A26 DD 4E 04      [19] 2381 	ld	c,4 (ix)
   8A29 DD 46 05      [19] 2382 	ld	b,5 (ix)
   8A2C 21 4C 00      [10] 2383 	ld	hl,#0x004C
   8A2F 09            [11] 2384 	add	hl,bc
   8A30 EB            [ 4] 2385 	ex	de,hl
   8A31 1A            [ 7] 2386 	ld	a,(de)
   8A32 3C            [ 4] 2387 	inc	a
   8A33 DD 77 F5      [19] 2388 	ld	-11 (ix), a
   8A36 12            [ 7] 2389 	ld	(de),a
   8A37 21 82 7D      [10] 2390 	ld	hl,#_wshot_cycles
   8A3A DD 7E F5      [19] 2391 	ld	a,-11 (ix)
   8A3D 96            [ 7] 2392 	sub	a, (hl)
   8A3E DA C4 8B      [10] 2393 	jp	C,00114$
                           2394 ;src/entities/entities.c:863: diff = abs(ene->ent.x - p->ent.x);	
   8A41 21 26 00      [10] 2395 	ld	hl,#0x0026
   8A44 09            [11] 2396 	add	hl,bc
   8A45 DD 75 FC      [19] 2397 	ld	-4 (ix),l
   8A48 DD 74 FD      [19] 2398 	ld	-3 (ix),h
   8A4B DD 6E FC      [19] 2399 	ld	l,-4 (ix)
   8A4E DD 66 FD      [19] 2400 	ld	h,-3 (ix)
   8A51 7E            [ 7] 2401 	ld	a,(hl)
   8A52 DD 77 FA      [19] 2402 	ld	-6 (ix),a
   8A55 23            [ 6] 2403 	inc	hl
   8A56 7E            [ 7] 2404 	ld	a,(hl)
   8A57 DD 77 FB      [19] 2405 	ld	-5 (ix),a
   8A5A DD 7E 06      [19] 2406 	ld	a,6 (ix)
   8A5D DD 77 F3      [19] 2407 	ld	-13 (ix),a
   8A60 DD 7E 07      [19] 2408 	ld	a,7 (ix)
   8A63 DD 77 F4      [19] 2409 	ld	-12 (ix),a
   8A66 DD 7E F3      [19] 2410 	ld	a,-13 (ix)
   8A69 C6 26         [ 7] 2411 	add	a, #0x26
   8A6B DD 77 F6      [19] 2412 	ld	-10 (ix),a
   8A6E DD 7E F4      [19] 2413 	ld	a,-12 (ix)
   8A71 CE 00         [ 7] 2414 	adc	a, #0x00
   8A73 DD 77 F7      [19] 2415 	ld	-9 (ix),a
   8A76 DD 6E F6      [19] 2416 	ld	l,-10 (ix)
   8A79 DD 66 F7      [19] 2417 	ld	h,-9 (ix)
   8A7C 7E            [ 7] 2418 	ld	a, (hl)
   8A7D 23            [ 6] 2419 	inc	hl
   8A7E 66            [ 7] 2420 	ld	h,(hl)
   8A7F 6F            [ 4] 2421 	ld	l,a
   8A80 DD 7E FA      [19] 2422 	ld	a,-6 (ix)
   8A83 95            [ 4] 2423 	sub	a, l
   8A84 6F            [ 4] 2424 	ld	l,a
   8A85 DD 7E FB      [19] 2425 	ld	a,-5 (ix)
   8A88 9C            [ 4] 2426 	sbc	a, h
   8A89 67            [ 4] 2427 	ld	h,a
   8A8A C5            [11] 2428 	push	bc
   8A8B D5            [11] 2429 	push	de
   8A8C E5            [11] 2430 	push	hl
   8A8D CD F2 87      [17] 2431 	call	_abs
   8A90 F1            [10] 2432 	pop	af
   8A91 D1            [10] 2433 	pop	de
   8A92 C1            [10] 2434 	pop	bc
   8A93 DD 75 FA      [19] 2435 	ld	-6 (ix),l
   8A96 DD 74 FB      [19] 2436 	ld	-5 (ix),h
                           2437 ;src/entities/entities.c:865: if(ene->ent.y > p->ent.y){	//Si se cumple sabemos dir de disparo
   8A99 21 28 00      [10] 2438 	ld	hl,#0x0028
   8A9C 09            [11] 2439 	add	hl,bc
   8A9D DD 75 F8      [19] 2440 	ld	-8 (ix),l
   8AA0 DD 74 F9      [19] 2441 	ld	-7 (ix),h
   8AA3 DD 6E F8      [19] 2442 	ld	l,-8 (ix)
   8AA6 DD 66 F9      [19] 2443 	ld	h,-7 (ix)
   8AA9 7E            [ 7] 2444 	ld	a,(hl)
   8AAA DD 77 F1      [19] 2445 	ld	-15 (ix),a
   8AAD 23            [ 6] 2446 	inc	hl
   8AAE 7E            [ 7] 2447 	ld	a,(hl)
   8AAF DD 77 F2      [19] 2448 	ld	-14 (ix),a
   8AB2 E5            [11] 2449 	push	hl
   8AB3 DD 6E F3      [19] 2450 	ld	l,-13 (ix)
   8AB6 DD 66 F4      [19] 2451 	ld	h,-12 (ix)
   8AB9 E5            [11] 2452 	push	hl
   8ABA FD E1         [14] 2453 	pop	iy
   8ABC E1            [10] 2454 	pop	hl
                           2455 ;src/entities/entities.c:870: ene->ent.curr_dir = dir;
   8ABD 21 3B 00      [10] 2456 	ld	hl,#0x003B
   8AC0 09            [11] 2457 	add	hl,bc
   8AC1 DD 75 F3      [19] 2458 	ld	-13 (ix),l
   8AC4 DD 74 F4      [19] 2459 	ld	-12 (ix),h
                           2460 ;src/entities/entities.c:865: if(ene->ent.y > p->ent.y){	//Si se cumple sabemos dir de disparo
   8AC7 FD 7E 28      [19] 2461 	ld	a,40 (iy)
   8ACA DD 77 FE      [19] 2462 	ld	-2 (ix),a
   8ACD FD 7E 29      [19] 2463 	ld	a,41 (iy)
   8AD0 DD 77 FF      [19] 2464 	ld	-1 (ix),a
                           2465 ;src/entities/entities.c:864: if(diff <= 2){//Disparo en direccion dir
   8AD3 3E 02         [ 7] 2466 	ld	a,#0x02
   8AD5 DD BE FA      [19] 2467 	cp	a, -6 (ix)
   8AD8 3E 00         [ 7] 2468 	ld	a,#0x00
   8ADA DD 9E FB      [19] 2469 	sbc	a, -5 (ix)
   8ADD E2 E2 8A      [10] 2470 	jp	PO, 00136$
   8AE0 EE 80         [ 7] 2471 	xor	a, #0x80
   8AE2                    2472 00136$:
   8AE2 FA 39 8B      [10] 2473 	jp	M,00110$
                           2474 ;src/entities/entities.c:865: if(ene->ent.y > p->ent.y){	//Si se cumple sabemos dir de disparo
   8AE5 DD 7E FE      [19] 2475 	ld	a,-2 (ix)
   8AE8 DD 96 F1      [19] 2476 	sub	a, -15 (ix)
   8AEB DD 7E FF      [19] 2477 	ld	a,-1 (ix)
   8AEE DD 9E F2      [19] 2478 	sbc	a, -14 (ix)
   8AF1 E2 F6 8A      [10] 2479 	jp	PO, 00137$
   8AF4 EE 80         [ 7] 2480 	xor	a, #0x80
   8AF6                    2481 00137$:
   8AF6 F2 FD 8A      [10] 2482 	jp	P,00102$
                           2483 ;src/entities/entities.c:866: dir = d_up;
   8AF9 3E 00         [ 7] 2484 	ld	a,#0x00
   8AFB 18 02         [12] 2485 	jr	00103$
   8AFD                    2486 00102$:
                           2487 ;src/entities/entities.c:868: dir = d_down;
   8AFD 3E 02         [ 7] 2488 	ld	a,#0x02
   8AFF                    2489 00103$:
                           2490 ;src/entities/entities.c:870: ene->ent.curr_dir = dir;
   8AFF DD 6E F3      [19] 2491 	ld	l,-13 (ix)
   8B02 DD 66 F4      [19] 2492 	ld	h,-12 (ix)
   8B05 77            [ 7] 2493 	ld	(hl),a
                           2494 ;src/entities/entities.c:871: disparar(&ene->bullet, ene->ent.x, ene->ent.y, dir);
   8B06 DD 6E F8      [19] 2495 	ld	l,-8 (ix)
   8B09 DD 66 F9      [19] 2496 	ld	h,-7 (ix)
   8B0C F5            [11] 2497 	push	af
   8B0D 7E            [ 7] 2498 	ld	a, (hl)
   8B0E 23            [ 6] 2499 	inc	hl
   8B0F 66            [ 7] 2500 	ld	h,(hl)
   8B10 6F            [ 4] 2501 	ld	l,a
   8B11 F1            [10] 2502 	pop	af
   8B12 DD 75 FA      [19] 2503 	ld	-6 (ix),l
   8B15 DD 6E FC      [19] 2504 	ld	l,-4 (ix)
   8B18 DD 66 FD      [19] 2505 	ld	h,-3 (ix)
   8B1B F5            [11] 2506 	push	af
   8B1C 7E            [ 7] 2507 	ld	a, (hl)
   8B1D 23            [ 6] 2508 	inc	hl
   8B1E 66            [ 7] 2509 	ld	h,(hl)
   8B1F 6F            [ 4] 2510 	ld	l,a
   8B20 F1            [10] 2511 	pop	af
   8B21 DD 75 F5      [19] 2512 	ld	-11 (ix),l
   8B24 D5            [11] 2513 	push	de
   8B25 F5            [11] 2514 	push	af
   8B26 33            [ 6] 2515 	inc	sp
   8B27 DD 66 FA      [19] 2516 	ld	h,-6 (ix)
   8B2A DD 6E F5      [19] 2517 	ld	l,-11 (ix)
   8B2D E5            [11] 2518 	push	hl
   8B2E C5            [11] 2519 	push	bc
   8B2F CD 40 84      [17] 2520 	call	_disparar
   8B32 F1            [10] 2521 	pop	af
   8B33 F1            [10] 2522 	pop	af
   8B34 33            [ 6] 2523 	inc	sp
   8B35 D1            [10] 2524 	pop	de
   8B36 C3 C2 8B      [10] 2525 	jp	00111$
   8B39                    2526 00110$:
                           2527 ;src/entities/entities.c:873: diff = abs(ene->ent.y - p->ent.y);	
   8B39 DD 7E F1      [19] 2528 	ld	a,-15 (ix)
   8B3C DD 96 FE      [19] 2529 	sub	a, -2 (ix)
   8B3F 6F            [ 4] 2530 	ld	l,a
   8B40 DD 7E F2      [19] 2531 	ld	a,-14 (ix)
   8B43 DD 9E FF      [19] 2532 	sbc	a, -1 (ix)
   8B46 67            [ 4] 2533 	ld	h,a
   8B47 C5            [11] 2534 	push	bc
   8B48 D5            [11] 2535 	push	de
   8B49 E5            [11] 2536 	push	hl
   8B4A CD F2 87      [17] 2537 	call	_abs
   8B4D F1            [10] 2538 	pop	af
   8B4E D1            [10] 2539 	pop	de
   8B4F C1            [10] 2540 	pop	bc
                           2541 ;src/entities/entities.c:874: if(diff <= 2){
   8B50 3E 02         [ 7] 2542 	ld	a,#0x02
   8B52 BD            [ 4] 2543 	cp	a, l
   8B53 3E 00         [ 7] 2544 	ld	a,#0x00
   8B55 9C            [ 4] 2545 	sbc	a, h
   8B56 E2 5B 8B      [10] 2546 	jp	PO, 00138$
   8B59 EE 80         [ 7] 2547 	xor	a, #0x80
   8B5B                    2548 00138$:
   8B5B FA C2 8B      [10] 2549 	jp	M,00111$
                           2550 ;src/entities/entities.c:875: if(ene->ent.x > p->ent.x){	//Si se cumple sabemos dir de disparo
   8B5E DD 6E FC      [19] 2551 	ld	l,-4 (ix)
   8B61 DD 66 FD      [19] 2552 	ld	h,-3 (ix)
   8B64 7E            [ 7] 2553 	ld	a,(hl)
   8B65 DD 77 FE      [19] 2554 	ld	-2 (ix),a
   8B68 23            [ 6] 2555 	inc	hl
   8B69 7E            [ 7] 2556 	ld	a,(hl)
   8B6A DD 77 FF      [19] 2557 	ld	-1 (ix),a
   8B6D DD 6E F6      [19] 2558 	ld	l,-10 (ix)
   8B70 DD 66 F7      [19] 2559 	ld	h,-9 (ix)
   8B73 7E            [ 7] 2560 	ld	a, (hl)
   8B74 23            [ 6] 2561 	inc	hl
   8B75 66            [ 7] 2562 	ld	h,(hl)
   8B76 DD 96 FE      [19] 2563 	sub	a, -2 (ix)
   8B79 7C            [ 4] 2564 	ld	a,h
   8B7A DD 9E FF      [19] 2565 	sbc	a, -1 (ix)
   8B7D E2 82 8B      [10] 2566 	jp	PO, 00139$
   8B80 EE 80         [ 7] 2567 	xor	a, #0x80
   8B82                    2568 00139$:
   8B82 F2 89 8B      [10] 2569 	jp	P,00105$
                           2570 ;src/entities/entities.c:876: dir = d_left;
   8B85 3E 03         [ 7] 2571 	ld	a,#0x03
   8B87 18 02         [12] 2572 	jr	00106$
   8B89                    2573 00105$:
                           2574 ;src/entities/entities.c:878: dir = d_right;
   8B89 3E 01         [ 7] 2575 	ld	a,#0x01
   8B8B                    2576 00106$:
                           2577 ;src/entities/entities.c:880: ene->ent.curr_dir = dir;
   8B8B DD 6E F3      [19] 2578 	ld	l,-13 (ix)
   8B8E DD 66 F4      [19] 2579 	ld	h,-12 (ix)
   8B91 77            [ 7] 2580 	ld	(hl),a
                           2581 ;src/entities/entities.c:881: disparar(&ene->bullet, ene->ent.x, ene->ent.y, dir);
   8B92 DD 6E F8      [19] 2582 	ld	l,-8 (ix)
   8B95 DD 66 F9      [19] 2583 	ld	h,-7 (ix)
   8B98 F5            [11] 2584 	push	af
   8B99 7E            [ 7] 2585 	ld	a, (hl)
   8B9A 23            [ 6] 2586 	inc	hl
   8B9B 66            [ 7] 2587 	ld	h,(hl)
   8B9C 6F            [ 4] 2588 	ld	l,a
   8B9D F1            [10] 2589 	pop	af
   8B9E DD 75 FE      [19] 2590 	ld	-2 (ix),l
   8BA1 DD 6E FC      [19] 2591 	ld	l,-4 (ix)
   8BA4 DD 66 FD      [19] 2592 	ld	h,-3 (ix)
   8BA7 F5            [11] 2593 	push	af
   8BA8 7E            [ 7] 2594 	ld	a, (hl)
   8BA9 23            [ 6] 2595 	inc	hl
   8BAA 66            [ 7] 2596 	ld	h,(hl)
   8BAB 6F            [ 4] 2597 	ld	l,a
   8BAC F1            [10] 2598 	pop	af
   8BAD DD 75 F1      [19] 2599 	ld	-15 (ix),l
   8BB0 D5            [11] 2600 	push	de
   8BB1 F5            [11] 2601 	push	af
   8BB2 33            [ 6] 2602 	inc	sp
   8BB3 DD 66 FE      [19] 2603 	ld	h,-2 (ix)
   8BB6 DD 6E F1      [19] 2604 	ld	l,-15 (ix)
   8BB9 E5            [11] 2605 	push	hl
   8BBA C5            [11] 2606 	push	bc
   8BBB CD 40 84      [17] 2607 	call	_disparar
   8BBE F1            [10] 2608 	pop	af
   8BBF F1            [10] 2609 	pop	af
   8BC0 33            [ 6] 2610 	inc	sp
   8BC1 D1            [10] 2611 	pop	de
   8BC2                    2612 00111$:
                           2613 ;src/entities/entities.c:885: ene->shot_cycles = 0;
   8BC2 AF            [ 4] 2614 	xor	a, a
   8BC3 12            [ 7] 2615 	ld	(de),a
   8BC4                    2616 00114$:
   8BC4 DD F9         [10] 2617 	ld	sp, ix
   8BC6 DD E1         [14] 2618 	pop	ix
   8BC8 C9            [10] 2619 	ret
                           2620 ;src/entities/entities.c:891: void redibujarEntity(TEntity* ent, u8 w, u8 h){
                           2621 ;	---------------------------------
                           2622 ; Function redibujarEntity
                           2623 ; ---------------------------------
   8BC9                    2624 _redibujarEntity::
   8BC9 DD E5         [15] 2625 	push	ix
   8BCB DD 21 00 00   [14] 2626 	ld	ix,#0
   8BCF DD 39         [15] 2627 	add	ix,sp
   8BD1 3B            [ 6] 2628 	dec	sp
                           2629 ;src/entities/entities.c:892: if (ent->draw && ent->cuadrante == mapaActual) {
   8BD2 DD 4E 04      [19] 2630 	ld	c,4 (ix)
   8BD5 DD 46 05      [19] 2631 	ld	b,5 (ix)
   8BD8 21 0A 00      [10] 2632 	ld	hl,#0x000A
   8BDB 09            [11] 2633 	add	hl,bc
   8BDC EB            [ 4] 2634 	ex	de,hl
   8BDD 1A            [ 7] 2635 	ld	a,(de)
   8BDE B7            [ 4] 2636 	or	a, a
   8BDF 28 4F         [12] 2637 	jr	Z,00104$
   8BE1 C5            [11] 2638 	push	bc
   8BE2 FD E1         [14] 2639 	pop	iy
   8BE4 FD 7E 1C      [19] 2640 	ld	a,28 (iy)
   8BE7 DD 77 FF      [19] 2641 	ld	-1 (ix),a
   8BEA 3A 7D 7D      [13] 2642 	ld	a,(#_mapaActual + 0)
   8BED DD 96 FF      [19] 2643 	sub	a, -1 (ix)
   8BF0 20 3E         [12] 2644 	jr	NZ,00104$
                           2645 ;src/entities/entities.c:893: borrarEntity(ent);
   8BF2 C5            [11] 2646 	push	bc
   8BF3 D5            [11] 2647 	push	de
   8BF4 C5            [11] 2648 	push	bc
   8BF5 CD 34 8C      [17] 2649 	call	_borrarEntity
   8BF8 F1            [10] 2650 	pop	af
   8BF9 D1            [10] 2651 	pop	de
   8BFA C1            [10] 2652 	pop	bc
                           2653 ;src/entities/entities.c:894: ent->px = ent->x;
   8BFB FD 21 04 00   [14] 2654 	ld	iy,#0x0004
   8BFF FD 09         [15] 2655 	add	iy, bc
   8C01 69            [ 4] 2656 	ld	l, c
   8C02 60            [ 4] 2657 	ld	h, b
   8C03 7E            [ 7] 2658 	ld	a, (hl)
   8C04 23            [ 6] 2659 	inc	hl
   8C05 66            [ 7] 2660 	ld	h,(hl)
   8C06 FD 77 00      [19] 2661 	ld	0 (iy), a
   8C09 FD 74 01      [19] 2662 	ld	1 (iy),h
                           2663 ;src/entities/entities.c:895: ent->py = ent->y;
   8C0C FD 21 06 00   [14] 2664 	ld	iy,#0x0006
   8C10 FD 09         [15] 2665 	add	iy, bc
   8C12 69            [ 4] 2666 	ld	l, c
   8C13 60            [ 4] 2667 	ld	h, b
   8C14 23            [ 6] 2668 	inc	hl
   8C15 23            [ 6] 2669 	inc	hl
   8C16 7E            [ 7] 2670 	ld	a, (hl)
   8C17 23            [ 6] 2671 	inc	hl
   8C18 66            [ 7] 2672 	ld	h,(hl)
   8C19 FD 77 00      [19] 2673 	ld	0 (iy), a
   8C1C FD 74 01      [19] 2674 	ld	1 (iy),h
                           2675 ;src/entities/entities.c:896: dibujarEntity(ent, w, h);
   8C1F D5            [11] 2676 	push	de
   8C20 DD 66 07      [19] 2677 	ld	h,7 (ix)
   8C23 DD 6E 06      [19] 2678 	ld	l,6 (ix)
   8C26 E5            [11] 2679 	push	hl
   8C27 C5            [11] 2680 	push	bc
   8C28 CD 9A 8C      [17] 2681 	call	_dibujarEntity
   8C2B F1            [10] 2682 	pop	af
   8C2C F1            [10] 2683 	pop	af
   8C2D D1            [10] 2684 	pop	de
                           2685 ;src/entities/entities.c:897: ent->draw = NO;
   8C2E AF            [ 4] 2686 	xor	a, a
   8C2F 12            [ 7] 2687 	ld	(de),a
   8C30                    2688 00104$:
   8C30 33            [ 6] 2689 	inc	sp
   8C31 DD E1         [14] 2690 	pop	ix
   8C33 C9            [10] 2691 	ret
                           2692 ;src/entities/entities.c:901: void borrarEntity(TEntity* ent){
                           2693 ;	---------------------------------
                           2694 ; Function borrarEntity
                           2695 ; ---------------------------------
   8C34                    2696 _borrarEntity::
   8C34 DD E5         [15] 2697 	push	ix
   8C36 DD 21 00 00   [14] 2698 	ld	ix,#0
   8C3A DD 39         [15] 2699 	add	ix,sp
   8C3C F5            [11] 2700 	push	af
   8C3D F5            [11] 2701 	push	af
                           2702 ;src/entities/entities.c:902: if(ent->draw){
   8C3E DD 4E 04      [19] 2703 	ld	c,4 (ix)
   8C41 DD 46 05      [19] 2704 	ld	b,5 (ix)
   8C44 C5            [11] 2705 	push	bc
   8C45 FD E1         [14] 2706 	pop	iy
   8C47 FD 7E 0A      [19] 2707 	ld	a,10 (iy)
   8C4A B7            [ 4] 2708 	or	a, a
   8C4B 28 48         [12] 2709 	jr	Z,00103$
                           2710 ;src/entities/entities.c:903: cpct_etm_drawTileBox2x4(ent->tpx, ent->tpy, ent->tw, ent->th, g_map11_W, ORIGEN_MAPA, mapa);
   8C4D 2A 7B 7D      [16] 2711 	ld	hl,(_mapa)
   8C50 DD 75 FD      [19] 2712 	ld	-3 (ix),l
   8C53 DD 74 FE      [19] 2713 	ld	-2 (ix),h
   8C56 69            [ 4] 2714 	ld	l, c
   8C57 60            [ 4] 2715 	ld	h, b
   8C58 11 1E 00      [10] 2716 	ld	de, #0x001E
   8C5B 19            [11] 2717 	add	hl, de
   8C5C 7E            [ 7] 2718 	ld	a,(hl)
   8C5D DD 77 FF      [19] 2719 	ld	-1 (ix),a
   8C60 69            [ 4] 2720 	ld	l, c
   8C61 60            [ 4] 2721 	ld	h, b
   8C62 11 1D 00      [10] 2722 	ld	de, #0x001D
   8C65 19            [11] 2723 	add	hl, de
   8C66 7E            [ 7] 2724 	ld	a,(hl)
   8C67 DD 77 FC      [19] 2725 	ld	-4 (ix),a
   8C6A 69            [ 4] 2726 	ld	l, c
   8C6B 60            [ 4] 2727 	ld	h, b
   8C6C 11 20 00      [10] 2728 	ld	de, #0x0020
   8C6F 19            [11] 2729 	add	hl, de
   8C70 5E            [ 7] 2730 	ld	e,(hl)
   8C71 69            [ 4] 2731 	ld	l, c
   8C72 60            [ 4] 2732 	ld	h, b
   8C73 01 1F 00      [10] 2733 	ld	bc, #0x001F
   8C76 09            [11] 2734 	add	hl, bc
   8C77 46            [ 7] 2735 	ld	b,(hl)
   8C78 DD 6E FD      [19] 2736 	ld	l,-3 (ix)
   8C7B DD 66 FE      [19] 2737 	ld	h,-2 (ix)
   8C7E E5            [11] 2738 	push	hl
   8C7F 21 90 C1      [10] 2739 	ld	hl,#0xC190
   8C82 E5            [11] 2740 	push	hl
   8C83 3E 28         [ 7] 2741 	ld	a,#0x28
   8C85 F5            [11] 2742 	push	af
   8C86 33            [ 6] 2743 	inc	sp
   8C87 DD 7E FF      [19] 2744 	ld	a,-1 (ix)
   8C8A F5            [11] 2745 	push	af
   8C8B 33            [ 6] 2746 	inc	sp
   8C8C DD 56 FC      [19] 2747 	ld	d, -4 (ix)
   8C8F D5            [11] 2748 	push	de
   8C90 C5            [11] 2749 	push	bc
   8C91 33            [ 6] 2750 	inc	sp
   8C92 CD 2C 6E      [17] 2751 	call	_cpct_etm_drawTileBox2x4
   8C95                    2752 00103$:
   8C95 DD F9         [10] 2753 	ld	sp, ix
   8C97 DD E1         [14] 2754 	pop	ix
   8C99 C9            [10] 2755 	ret
                           2756 ;src/entities/entities.c:907: void dibujarEntity(TEntity* ent, u8 w, u8 h){
                           2757 ;	---------------------------------
                           2758 ; Function dibujarEntity
                           2759 ; ---------------------------------
   8C9A                    2760 _dibujarEntity::
   8C9A DD E5         [15] 2761 	push	ix
   8C9C DD 21 00 00   [14] 2762 	ld	ix,#0
   8CA0 DD 39         [15] 2763 	add	ix,sp
   8CA2 F5            [11] 2764 	push	af
                           2765 ;src/entities/entities.c:908: if (ent->draw) {
   8CA3 DD 4E 04      [19] 2766 	ld	c,4 (ix)
   8CA6 DD 46 05      [19] 2767 	ld	b,5 (ix)
   8CA9 C5            [11] 2768 	push	bc
   8CAA FD E1         [14] 2769 	pop	iy
   8CAC FD 7E 0A      [19] 2770 	ld	a,10 (iy)
   8CAF B7            [ 4] 2771 	or	a, a
   8CB0 28 2F         [12] 2772 	jr	Z,00103$
                           2773 ;src/entities/entities.c:909: cpct_drawSpriteMaskedAlignedTable(ent->sprites[ent->curr_dir],ent->vmem, w, h, g_tablatrans);
   8CB2 69            [ 4] 2774 	ld	l, c
   8CB3 60            [ 4] 2775 	ld	h, b
   8CB4 11 21 00      [10] 2776 	ld	de, #0x0021
   8CB7 19            [11] 2777 	add	hl, de
   8CB8 5E            [ 7] 2778 	ld	e,(hl)
   8CB9 23            [ 6] 2779 	inc	hl
   8CBA 56            [ 7] 2780 	ld	d,(hl)
   8CBB 21 0B 00      [10] 2781 	ld	hl,#0x000B
   8CBE 09            [11] 2782 	add	hl,bc
   8CBF E3            [19] 2783 	ex	(sp), hl
   8CC0 69            [ 4] 2784 	ld	l, c
   8CC1 60            [ 4] 2785 	ld	h, b
   8CC2 01 15 00      [10] 2786 	ld	bc, #0x0015
   8CC5 09            [11] 2787 	add	hl, bc
   8CC6 4E            [ 7] 2788 	ld	c,(hl)
   8CC7 CB 21         [ 8] 2789 	sla	c
   8CC9 E1            [10] 2790 	pop	hl
   8CCA E5            [11] 2791 	push	hl
   8CCB 06 00         [ 7] 2792 	ld	b,#0x00
   8CCD 09            [11] 2793 	add	hl, bc
   8CCE 4E            [ 7] 2794 	ld	c,(hl)
   8CCF 23            [ 6] 2795 	inc	hl
   8CD0 46            [ 7] 2796 	ld	b,(hl)
   8CD1 21 00 01      [10] 2797 	ld	hl,#_g_tablatrans
   8CD4 E5            [11] 2798 	push	hl
   8CD5 DD 66 07      [19] 2799 	ld	h,7 (ix)
   8CD8 DD 6E 06      [19] 2800 	ld	l,6 (ix)
   8CDB E5            [11] 2801 	push	hl
   8CDC D5            [11] 2802 	push	de
   8CDD C5            [11] 2803 	push	bc
   8CDE CD EC 71      [17] 2804 	call	_cpct_drawSpriteMaskedAlignedTable
   8CE1                    2805 00103$:
   8CE1 DD F9         [10] 2806 	ld	sp, ix
   8CE3 DD E1         [14] 2807 	pop	ix
   8CE5 C9            [10] 2808 	ret
                           2809 ;src/entities/entities.c:914: void calculaEntity(TEntity* ent, u8 origen){
                           2810 ;	---------------------------------
                           2811 ; Function calculaEntity
                           2812 ; ---------------------------------
   8CE6                    2813 _calculaEntity::
   8CE6 DD E5         [15] 2814 	push	ix
   8CE8 DD 21 00 00   [14] 2815 	ld	ix,#0
   8CEC DD 39         [15] 2816 	add	ix,sp
   8CEE 21 FA FF      [10] 2817 	ld	hl,#-6
   8CF1 39            [11] 2818 	add	hl,sp
   8CF2 F9            [ 6] 2819 	ld	sp,hl
                           2820 ;src/entities/entities.c:918: ent->tw = ent->sw/2 + (ent->px & 1);
   8CF3 DD 7E 04      [19] 2821 	ld	a,4 (ix)
   8CF6 DD 77 FA      [19] 2822 	ld	-6 (ix),a
   8CF9 DD 7E 05      [19] 2823 	ld	a,5 (ix)
   8CFC DD 77 FB      [19] 2824 	ld	-5 (ix),a
   8CFF DD 7E FA      [19] 2825 	ld	a,-6 (ix)
   8D02 C6 1D         [ 7] 2826 	add	a, #0x1D
   8D04 4F            [ 4] 2827 	ld	c,a
   8D05 DD 7E FB      [19] 2828 	ld	a,-5 (ix)
   8D08 CE 00         [ 7] 2829 	adc	a, #0x00
   8D0A 47            [ 4] 2830 	ld	b,a
   8D0B E1            [10] 2831 	pop	hl
   8D0C E5            [11] 2832 	push	hl
   8D0D 11 13 00      [10] 2833 	ld	de, #0x0013
   8D10 19            [11] 2834 	add	hl, de
   8D11 5E            [ 7] 2835 	ld	e,(hl)
   8D12 CB 3B         [ 8] 2836 	srl	e
   8D14 DD 7E FA      [19] 2837 	ld	a,-6 (ix)
   8D17 C6 04         [ 7] 2838 	add	a, #0x04
   8D19 DD 77 FE      [19] 2839 	ld	-2 (ix),a
   8D1C DD 7E FB      [19] 2840 	ld	a,-5 (ix)
   8D1F CE 00         [ 7] 2841 	adc	a, #0x00
   8D21 DD 77 FF      [19] 2842 	ld	-1 (ix),a
   8D24 DD 6E FE      [19] 2843 	ld	l,-2 (ix)
   8D27 DD 66 FF      [19] 2844 	ld	h,-1 (ix)
   8D2A 56            [ 7] 2845 	ld	d,(hl)
   8D2B 23            [ 6] 2846 	inc	hl
   8D2C 66            [ 7] 2847 	ld	h,(hl)
   8D2D 7A            [ 4] 2848 	ld	a,d
   8D2E E6 01         [ 7] 2849 	and	a, #0x01
   8D30 83            [ 4] 2850 	add	a,e
   8D31 02            [ 7] 2851 	ld	(bc),a
                           2852 ;src/entities/entities.c:922: ent->th = ent->sh/4 + (ent->py & 3 ? 1 : 0);
   8D32 DD 7E FA      [19] 2853 	ld	a,-6 (ix)
   8D35 C6 1E         [ 7] 2854 	add	a, #0x1E
   8D37 4F            [ 4] 2855 	ld	c,a
   8D38 DD 7E FB      [19] 2856 	ld	a,-5 (ix)
   8D3B CE 00         [ 7] 2857 	adc	a, #0x00
   8D3D 47            [ 4] 2858 	ld	b,a
   8D3E E1            [10] 2859 	pop	hl
   8D3F E5            [11] 2860 	push	hl
   8D40 11 14 00      [10] 2861 	ld	de, #0x0014
   8D43 19            [11] 2862 	add	hl, de
   8D44 5E            [ 7] 2863 	ld	e,(hl)
   8D45 CB 3B         [ 8] 2864 	srl	e
   8D47 CB 3B         [ 8] 2865 	srl	e
   8D49 DD 7E FA      [19] 2866 	ld	a,-6 (ix)
   8D4C C6 06         [ 7] 2867 	add	a, #0x06
   8D4E DD 77 FC      [19] 2868 	ld	-4 (ix),a
   8D51 DD 7E FB      [19] 2869 	ld	a,-5 (ix)
   8D54 CE 00         [ 7] 2870 	adc	a, #0x00
   8D56 DD 77 FD      [19] 2871 	ld	-3 (ix),a
   8D59 DD 6E FC      [19] 2872 	ld	l,-4 (ix)
   8D5C DD 66 FD      [19] 2873 	ld	h,-3 (ix)
   8D5F 56            [ 7] 2874 	ld	d,(hl)
   8D60 23            [ 6] 2875 	inc	hl
   8D61 6E            [ 7] 2876 	ld	l,(hl)
   8D62 7A            [ 4] 2877 	ld	a,d
   8D63 E6 03         [ 7] 2878 	and	a, #0x03
   8D65 28 04         [12] 2879 	jr	Z,00106$
   8D67 16 01         [ 7] 2880 	ld	d,#0x01
   8D69 18 02         [12] 2881 	jr	00107$
   8D6B                    2882 00106$:
   8D6B 16 00         [ 7] 2883 	ld	d,#0x00
   8D6D                    2884 00107$:
   8D6D 7B            [ 4] 2885 	ld	a,e
   8D6E 82            [ 4] 2886 	add	a, d
   8D6F 02            [ 7] 2887 	ld	(bc),a
                           2888 ;src/entities/entities.c:924: ent->tpx = ent->px / 2;
   8D70 DD 7E FA      [19] 2889 	ld	a,-6 (ix)
   8D73 C6 1F         [ 7] 2890 	add	a, #0x1F
   8D75 4F            [ 4] 2891 	ld	c,a
   8D76 DD 7E FB      [19] 2892 	ld	a,-5 (ix)
   8D79 CE 00         [ 7] 2893 	adc	a, #0x00
   8D7B 47            [ 4] 2894 	ld	b,a
   8D7C DD 6E FE      [19] 2895 	ld	l,-2 (ix)
   8D7F DD 66 FF      [19] 2896 	ld	h,-1 (ix)
   8D82 5E            [ 7] 2897 	ld	e,(hl)
   8D83 23            [ 6] 2898 	inc	hl
   8D84 56            [ 7] 2899 	ld	d,(hl)
   8D85 6B            [ 4] 2900 	ld	l, e
   8D86 62            [ 4] 2901 	ld	h, d
   8D87 CB 7A         [ 8] 2902 	bit	7, d
   8D89 28 02         [12] 2903 	jr	Z,00108$
   8D8B EB            [ 4] 2904 	ex	de,hl
   8D8C 23            [ 6] 2905 	inc	hl
   8D8D                    2906 00108$:
   8D8D CB 2C         [ 8] 2907 	sra	h
   8D8F CB 1D         [ 8] 2908 	rr	l
   8D91 7D            [ 4] 2909 	ld	a,l
   8D92 02            [ 7] 2910 	ld	(bc),a
                           2911 ;src/entities/entities.c:922: ent->th = ent->sh/4 + (ent->py & 3 ? 1 : 0);
   8D93 DD 6E FC      [19] 2912 	ld	l,-4 (ix)
   8D96 DD 66 FD      [19] 2913 	ld	h,-3 (ix)
   8D99 4E            [ 7] 2914 	ld	c,(hl)
   8D9A 23            [ 6] 2915 	inc	hl
   8D9B 46            [ 7] 2916 	ld	b,(hl)
                           2917 ;src/entities/entities.c:926: ent->tpy = (ent->py - ORIGEN_MAPA_Y) / 4;
   8D9C DD 7E FA      [19] 2918 	ld	a,-6 (ix)
   8D9F C6 20         [ 7] 2919 	add	a, #0x20
   8DA1 5F            [ 4] 2920 	ld	e,a
   8DA2 DD 7E FB      [19] 2921 	ld	a,-5 (ix)
   8DA5 CE 00         [ 7] 2922 	adc	a, #0x00
   8DA7 57            [ 4] 2923 	ld	d,a
                           2924 ;src/entities/entities.c:925: if(origen == SI)
   8DA8 DD 7E 06      [19] 2925 	ld	a,6 (ix)
   8DAB 3D            [ 4] 2926 	dec	a
   8DAC 20 28         [12] 2927 	jr	NZ,00102$
                           2928 ;src/entities/entities.c:926: ent->tpy = (ent->py - ORIGEN_MAPA_Y) / 4;
   8DAE 79            [ 4] 2929 	ld	a,c
   8DAF C6 D8         [ 7] 2930 	add	a,#0xD8
   8DB1 DD 77 FC      [19] 2931 	ld	-4 (ix),a
   8DB4 78            [ 4] 2932 	ld	a,b
   8DB5 CE FF         [ 7] 2933 	adc	a,#0xFF
   8DB7 DD 77 FD      [19] 2934 	ld	-3 (ix),a
   8DBA DD 6E FC      [19] 2935 	ld	l,-4 (ix)
   8DBD DD 66 FD      [19] 2936 	ld	h,-3 (ix)
   8DC0 DD CB FD 7E   [20] 2937 	bit	7, -3 (ix)
   8DC4 28 04         [12] 2938 	jr	Z,00109$
   8DC6 21 DB FF      [10] 2939 	ld	hl,#0xFFDB
   8DC9 09            [11] 2940 	add	hl,bc
   8DCA                    2941 00109$:
   8DCA CB 2C         [ 8] 2942 	sra	h
   8DCC CB 1D         [ 8] 2943 	rr	l
   8DCE CB 2C         [ 8] 2944 	sra	h
   8DD0 CB 1D         [ 8] 2945 	rr	l
   8DD2 7D            [ 4] 2946 	ld	a,l
   8DD3 12            [ 7] 2947 	ld	(de),a
   8DD4 18 15         [12] 2948 	jr	00103$
   8DD6                    2949 00102$:
                           2950 ;src/entities/entities.c:928: ent->tpy = (ent->py) / 4;
   8DD6 69            [ 4] 2951 	ld	l, c
   8DD7 60            [ 4] 2952 	ld	h, b
   8DD8 CB 78         [ 8] 2953 	bit	7, b
   8DDA 28 05         [12] 2954 	jr	Z,00110$
   8DDC 69            [ 4] 2955 	ld	l, c
   8DDD 60            [ 4] 2956 	ld	h, b
   8DDE 23            [ 6] 2957 	inc	hl
   8DDF 23            [ 6] 2958 	inc	hl
   8DE0 23            [ 6] 2959 	inc	hl
   8DE1                    2960 00110$:
   8DE1 CB 2C         [ 8] 2961 	sra	h
   8DE3 CB 1D         [ 8] 2962 	rr	l
   8DE5 CB 2C         [ 8] 2963 	sra	h
   8DE7 CB 1D         [ 8] 2964 	rr	l
   8DE9 7D            [ 4] 2965 	ld	a,l
   8DEA 12            [ 7] 2966 	ld	(de),a
   8DEB                    2967 00103$:
                           2968 ;src/entities/entities.c:929: ent->coll.x = ent->x;
   8DEB DD 7E FA      [19] 2969 	ld	a,-6 (ix)
   8DEE C6 17         [ 7] 2970 	add	a, #0x17
   8DF0 4F            [ 4] 2971 	ld	c,a
   8DF1 DD 7E FB      [19] 2972 	ld	a,-5 (ix)
   8DF4 CE 00         [ 7] 2973 	adc	a, #0x00
   8DF6 47            [ 4] 2974 	ld	b,a
   8DF7 E1            [10] 2975 	pop	hl
   8DF8 E5            [11] 2976 	push	hl
   8DF9 5E            [ 7] 2977 	ld	e,(hl)
   8DFA 23            [ 6] 2978 	inc	hl
   8DFB 56            [ 7] 2979 	ld	d,(hl)
   8DFC 7B            [ 4] 2980 	ld	a,e
   8DFD 02            [ 7] 2981 	ld	(bc),a
                           2982 ;src/entities/entities.c:930: ent->coll.y = ent->y;
   8DFE FD 21 18 00   [14] 2983 	ld	iy,#0x0018
   8E02 D1            [10] 2984 	pop	de
   8E03 D5            [11] 2985 	push	de
   8E04 FD 19         [15] 2986 	add	iy, de
   8E06 E1            [10] 2987 	pop	hl
   8E07 E5            [11] 2988 	push	hl
   8E08 23            [ 6] 2989 	inc	hl
   8E09 23            [ 6] 2990 	inc	hl
   8E0A E5            [11] 2991 	push	hl
   8E0B 4E            [ 7] 2992 	ld	c,(hl)
   8E0C 23            [ 6] 2993 	inc	hl
   8E0D 46            [ 7] 2994 	ld	b,(hl)
   8E0E E1            [10] 2995 	pop	hl
   8E0F FD 71 00      [19] 2996 	ld	0 (iy), c
                           2997 ;src/entities/entities.c:931: ent->vmem = cpct_getScreenPtr(CPCT_VMEM_START,ent->x, ent->y);
   8E12 DD 7E FA      [19] 2998 	ld	a,-6 (ix)
   8E15 C6 21         [ 7] 2999 	add	a, #0x21
   8E17 4F            [ 4] 3000 	ld	c,a
   8E18 DD 7E FB      [19] 3001 	ld	a,-5 (ix)
   8E1B CE 00         [ 7] 3002 	adc	a, #0x00
   8E1D 47            [ 4] 3003 	ld	b,a
   8E1E 5E            [ 7] 3004 	ld	e,(hl)
   8E1F 23            [ 6] 3005 	inc	hl
   8E20 56            [ 7] 3006 	ld	d,(hl)
   8E21 7B            [ 4] 3007 	ld	a,e
   8E22 E1            [10] 3008 	pop	hl
   8E23 E5            [11] 3009 	push	hl
   8E24 5E            [ 7] 3010 	ld	e,(hl)
   8E25 23            [ 6] 3011 	inc	hl
   8E26 56            [ 7] 3012 	ld	d,(hl)
   8E27 53            [ 4] 3013 	ld	d,e
   8E28 C5            [11] 3014 	push	bc
   8E29 F5            [11] 3015 	push	af
   8E2A 33            [ 6] 3016 	inc	sp
   8E2B D5            [11] 3017 	push	de
   8E2C 33            [ 6] 3018 	inc	sp
   8E2D 21 00 C0      [10] 3019 	ld	hl,#0xC000
   8E30 E5            [11] 3020 	push	hl
   8E31 CD 27 72      [17] 3021 	call	_cpct_getScreenPtr
   8E34 EB            [ 4] 3022 	ex	de,hl
   8E35 C1            [10] 3023 	pop	bc
   8E36 7B            [ 4] 3024 	ld	a,e
   8E37 02            [ 7] 3025 	ld	(bc),a
   8E38 03            [ 6] 3026 	inc	bc
   8E39 7A            [ 4] 3027 	ld	a,d
   8E3A 02            [ 7] 3028 	ld	(bc),a
   8E3B DD F9         [10] 3029 	ld	sp, ix
   8E3D DD E1         [14] 3030 	pop	ix
   8E3F C9            [10] 3031 	ret
                           3032 ;src/entities/entities.c:935: void calculaAllEntities(TPlayer* player){
                           3033 ;	---------------------------------
                           3034 ; Function calculaAllEntities
                           3035 ; ---------------------------------
   8E40                    3036 _calculaAllEntities::
   8E40 DD E5         [15] 3037 	push	ix
   8E42 DD 21 00 00   [14] 3038 	ld	ix,#0
   8E46 DD 39         [15] 3039 	add	ix,sp
   8E48 F5            [11] 3040 	push	af
   8E49 F5            [11] 3041 	push	af
                           3042 ;src/entities/entities.c:938: exp = getExplosion();
   8E4A CD 89 63      [17] 3043 	call	_getExplosion
   8E4D 4D            [ 4] 3044 	ld	c,l
   8E4E 44            [ 4] 3045 	ld	b,h
                           3046 ;src/entities/entities.c:939: calculaEntity(&player->ent, SI);
   8E4F DD 5E 04      [19] 3047 	ld	e,4 (ix)
   8E52 DD 56 05      [19] 3048 	ld	d,5 (ix)
   8E55 FD 21 26 00   [14] 3049 	ld	iy,#0x0026
   8E59 FD 19         [15] 3050 	add	iy, de
   8E5B C5            [11] 3051 	push	bc
   8E5C D5            [11] 3052 	push	de
   8E5D 3E 01         [ 7] 3053 	ld	a,#0x01
   8E5F F5            [11] 3054 	push	af
   8E60 33            [ 6] 3055 	inc	sp
   8E61 FD E5         [15] 3056 	push	iy
   8E63 CD E6 8C      [17] 3057 	call	_calculaEntity
   8E66 F1            [10] 3058 	pop	af
   8E67 33            [ 6] 3059 	inc	sp
   8E68 D1            [10] 3060 	pop	de
   8E69 C1            [10] 3061 	pop	bc
                           3062 ;src/entities/entities.c:940: calculaEntity(&player->bullet.ent, SI);
   8E6A 13            [ 6] 3063 	inc	de
   8E6B 13            [ 6] 3064 	inc	de
   8E6C 13            [ 6] 3065 	inc	de
   8E6D C5            [11] 3066 	push	bc
   8E6E 3E 01         [ 7] 3067 	ld	a,#0x01
   8E70 F5            [11] 3068 	push	af
   8E71 33            [ 6] 3069 	inc	sp
   8E72 D5            [11] 3070 	push	de
   8E73 CD E6 8C      [17] 3071 	call	_calculaEntity
   8E76 F1            [10] 3072 	pop	af
   8E77 33            [ 6] 3073 	inc	sp
   8E78 C1            [10] 3074 	pop	bc
                           3075 ;src/entities/entities.c:941: calculaEntity(&exp->ent, SI);
   8E79 03            [ 6] 3076 	inc	bc
   8E7A 3E 01         [ 7] 3077 	ld	a,#0x01
   8E7C F5            [11] 3078 	push	af
   8E7D 33            [ 6] 3079 	inc	sp
   8E7E C5            [11] 3080 	push	bc
   8E7F CD E6 8C      [17] 3081 	call	_calculaEntity
   8E82 F1            [10] 3082 	pop	af
   8E83 33            [ 6] 3083 	inc	sp
                           3084 ;src/entities/entities.c:942: for(i=0;i < NUM_ENEMIGOS;++i){
   8E84 DD 36 FC 00   [19] 3085 	ld	-4 (ix),#0x00
   8E88 01 00 00      [10] 3086 	ld	bc,#0x0000
   8E8B                    3087 00104$:
                           3088 ;src/entities/entities.c:943: if(enemigos[i].ent.cuadrante == mapaActual){
   8E8B 21 7D 7E      [10] 3089 	ld	hl,#_enemigos
   8E8E 09            [11] 3090 	add	hl,bc
   8E8F EB            [ 4] 3091 	ex	de,hl
   8E90 21 26 00      [10] 3092 	ld	hl,#0x0026
   8E93 19            [11] 3093 	add	hl,de
   8E94 DD 75 FE      [19] 3094 	ld	-2 (ix),l
   8E97 DD 74 FF      [19] 3095 	ld	-1 (ix),h
   8E9A D5            [11] 3096 	push	de
   8E9B FD E1         [14] 3097 	pop	iy
   8E9D FD 7E 42      [19] 3098 	ld	a,66 (iy)
   8EA0 DD 77 FD      [19] 3099 	ld	-3 (ix),a
   8EA3 3A 7D 7D      [13] 3100 	ld	a,(#_mapaActual + 0)
   8EA6 DD 96 FD      [19] 3101 	sub	a, -3 (ix)
   8EA9 20 27         [12] 3102 	jr	NZ,00105$
                           3103 ;src/entities/entities.c:944: calculaEntity(&enemigos[i].ent, SI);
   8EAB DD 6E FE      [19] 3104 	ld	l,-2 (ix)
   8EAE DD 66 FF      [19] 3105 	ld	h,-1 (ix)
   8EB1 E5            [11] 3106 	push	hl
   8EB2 FD E1         [14] 3107 	pop	iy
   8EB4 C5            [11] 3108 	push	bc
   8EB5 D5            [11] 3109 	push	de
   8EB6 3E 01         [ 7] 3110 	ld	a,#0x01
   8EB8 F5            [11] 3111 	push	af
   8EB9 33            [ 6] 3112 	inc	sp
   8EBA FD E5         [15] 3113 	push	iy
   8EBC CD E6 8C      [17] 3114 	call	_calculaEntity
   8EBF F1            [10] 3115 	pop	af
   8EC0 33            [ 6] 3116 	inc	sp
   8EC1 D1            [10] 3117 	pop	de
   8EC2 C1            [10] 3118 	pop	bc
                           3119 ;src/entities/entities.c:945: calculaEntity(&enemigos[i].bullet.ent, SI);
   8EC3 13            [ 6] 3120 	inc	de
   8EC4 13            [ 6] 3121 	inc	de
   8EC5 13            [ 6] 3122 	inc	de
   8EC6 C5            [11] 3123 	push	bc
   8EC7 3E 01         [ 7] 3124 	ld	a,#0x01
   8EC9 F5            [11] 3125 	push	af
   8ECA 33            [ 6] 3126 	inc	sp
   8ECB D5            [11] 3127 	push	de
   8ECC CD E6 8C      [17] 3128 	call	_calculaEntity
   8ECF F1            [10] 3129 	pop	af
   8ED0 33            [ 6] 3130 	inc	sp
   8ED1 C1            [10] 3131 	pop	bc
   8ED2                    3132 00105$:
                           3133 ;src/entities/entities.c:942: for(i=0;i < NUM_ENEMIGOS;++i){
   8ED2 21 4E 00      [10] 3134 	ld	hl,#0x004E
   8ED5 09            [11] 3135 	add	hl,bc
   8ED6 4D            [ 4] 3136 	ld	c,l
   8ED7 44            [ 4] 3137 	ld	b,h
   8ED8 DD 34 FC      [23] 3138 	inc	-4 (ix)
   8EDB DD 7E FC      [19] 3139 	ld	a,-4 (ix)
   8EDE D6 03         [ 7] 3140 	sub	a, #0x03
   8EE0 38 A9         [12] 3141 	jr	C,00104$
                           3142 ;src/entities/entities.c:949: calculaEntity(&bases[mapaActual].ent, SI);
   8EE2 ED 4B 7D 7D   [20] 3143 	ld	bc,(_mapaActual)
   8EE6 06 00         [ 7] 3144 	ld	b,#0x00
   8EE8 69            [ 4] 3145 	ld	l, c
   8EE9 60            [ 4] 3146 	ld	h, b
   8EEA 29            [11] 3147 	add	hl, hl
   8EEB 29            [11] 3148 	add	hl, hl
   8EEC 29            [11] 3149 	add	hl, hl
   8EED 09            [11] 3150 	add	hl, bc
   8EEE 29            [11] 3151 	add	hl, hl
   8EEF 09            [11] 3152 	add	hl, bc
   8EF0 29            [11] 3153 	add	hl, hl
   8EF1 09            [11] 3154 	add	hl, bc
   8EF2 11 67 7F      [10] 3155 	ld	de,#_bases
   8EF5 19            [11] 3156 	add	hl,de
   8EF6 01 04 00      [10] 3157 	ld	bc,#0x0004
   8EF9 09            [11] 3158 	add	hl,bc
   8EFA 4D            [ 4] 3159 	ld	c, l
   8EFB 44            [ 4] 3160 	ld	b, h
   8EFC 3E 01         [ 7] 3161 	ld	a,#0x01
   8EFE F5            [11] 3162 	push	af
   8EFF 33            [ 6] 3163 	inc	sp
   8F00 C5            [11] 3164 	push	bc
   8F01 CD E6 8C      [17] 3165 	call	_calculaEntity
   8F04 DD F9         [10] 3166 	ld	sp,ix
   8F06 DD E1         [14] 3167 	pop	ix
   8F08 C9            [10] 3168 	ret
                           3169 ;src/entities/entities.c:953: void drawAll(TPlayer* player){
                           3170 ;	---------------------------------
                           3171 ; Function drawAll
                           3172 ; ---------------------------------
   8F09                    3173 _drawAll::
   8F09 DD E5         [15] 3174 	push	ix
   8F0B DD 21 00 00   [14] 3175 	ld	ix,#0
   8F0F DD 39         [15] 3176 	add	ix,sp
   8F11 21 F9 FF      [10] 3177 	ld	hl,#-7
   8F14 39            [11] 3178 	add	hl,sp
   8F15 F9            [ 6] 3179 	ld	sp,hl
                           3180 ;src/entities/entities.c:957: exp = getExplosion();
   8F16 CD 89 63      [17] 3181 	call	_getExplosion
   8F19 33            [ 6] 3182 	inc	sp
   8F1A 33            [ 6] 3183 	inc	sp
   8F1B E5            [11] 3184 	push	hl
                           3185 ;src/entities/entities.c:958: bases = getBases();
   8F1C CD 4F 90      [17] 3186 	call	_getBases
   8F1F 4D            [ 4] 3187 	ld	c,l
   8F20 44            [ 4] 3188 	ld	b,h
                           3189 ;src/entities/entities.c:965: if(bases[mapaActual].ent.sprites[0] != NULL){
   8F21 ED 5B 7D 7D   [20] 3190 	ld	de,(_mapaActual)
   8F25 16 00         [ 7] 3191 	ld	d,#0x00
   8F27 6B            [ 4] 3192 	ld	l, e
   8F28 62            [ 4] 3193 	ld	h, d
   8F29 29            [11] 3194 	add	hl, hl
   8F2A 29            [11] 3195 	add	hl, hl
   8F2B 29            [11] 3196 	add	hl, hl
   8F2C 19            [11] 3197 	add	hl, de
   8F2D 29            [11] 3198 	add	hl, hl
   8F2E 19            [11] 3199 	add	hl, de
   8F2F 29            [11] 3200 	add	hl, hl
   8F30 19            [11] 3201 	add	hl, de
   8F31 09            [11] 3202 	add	hl,bc
   8F32 4D            [ 4] 3203 	ld	c,l
   8F33 44            [ 4] 3204 	ld	b,h
   8F34 21 04 00      [10] 3205 	ld	hl,#0x0004
   8F37 09            [11] 3206 	add	hl,bc
   8F38 EB            [ 4] 3207 	ex	de,hl
   8F39 C5            [11] 3208 	push	bc
   8F3A FD E1         [14] 3209 	pop	iy
   8F3C FD 6E 0F      [19] 3210 	ld	l,15 (iy)
   8F3F FD 7E 10      [19] 3211 	ld	a, 16 (iy)
   8F42 B5            [ 4] 3212 	or	a,l
   8F43 28 1A         [12] 3213 	jr	Z,00102$
                           3214 ;src/entities/entities.c:966: redibujarEntity(&bases[mapaActual].ent, bases[mapaActual].ent.sw, bases[mapaActual].ent.sh);
   8F45 69            [ 4] 3215 	ld	l, c
   8F46 60            [ 4] 3216 	ld	h, b
   8F47 C5            [11] 3217 	push	bc
   8F48 01 18 00      [10] 3218 	ld	bc, #0x0018
   8F4B 09            [11] 3219 	add	hl, bc
   8F4C C1            [10] 3220 	pop	bc
   8F4D 7E            [ 7] 3221 	ld	a,(hl)
   8F4E 69            [ 4] 3222 	ld	l, c
   8F4F 60            [ 4] 3223 	ld	h, b
   8F50 01 17 00      [10] 3224 	ld	bc, #0x0017
   8F53 09            [11] 3225 	add	hl, bc
   8F54 46            [ 7] 3226 	ld	b,(hl)
   8F55 F5            [11] 3227 	push	af
   8F56 33            [ 6] 3228 	inc	sp
   8F57 C5            [11] 3229 	push	bc
   8F58 33            [ 6] 3230 	inc	sp
   8F59 D5            [11] 3231 	push	de
   8F5A CD C9 8B      [17] 3232 	call	_redibujarEntity
   8F5D F1            [10] 3233 	pop	af
   8F5E F1            [10] 3234 	pop	af
   8F5F                    3235 00102$:
                           3236 ;src/entities/entities.c:969: redibujarEntity(&player->bullet.ent, player->bullet.ent.sw, player->bullet.ent.sh);
   8F5F DD 5E 04      [19] 3237 	ld	e,4 (ix)
   8F62 DD 56 05      [19] 3238 	ld	d,5 (ix)
   8F65 D5            [11] 3239 	push	de
   8F66 FD E1         [14] 3240 	pop	iy
   8F68 FD 23         [10] 3241 	inc	iy
   8F6A FD 23         [10] 3242 	inc	iy
   8F6C FD 23         [10] 3243 	inc	iy
   8F6E 6B            [ 4] 3244 	ld	l, e
   8F6F 62            [ 4] 3245 	ld	h, d
   8F70 01 17 00      [10] 3246 	ld	bc, #0x0017
   8F73 09            [11] 3247 	add	hl, bc
   8F74 7E            [ 7] 3248 	ld	a,(hl)
   8F75 6B            [ 4] 3249 	ld	l, e
   8F76 62            [ 4] 3250 	ld	h, d
   8F77 01 16 00      [10] 3251 	ld	bc, #0x0016
   8F7A 09            [11] 3252 	add	hl, bc
   8F7B 46            [ 7] 3253 	ld	b,(hl)
   8F7C D5            [11] 3254 	push	de
   8F7D F5            [11] 3255 	push	af
   8F7E 33            [ 6] 3256 	inc	sp
   8F7F C5            [11] 3257 	push	bc
   8F80 33            [ 6] 3258 	inc	sp
   8F81 FD E5         [15] 3259 	push	iy
   8F83 CD C9 8B      [17] 3260 	call	_redibujarEntity
   8F86 F1            [10] 3261 	pop	af
   8F87 F1            [10] 3262 	pop	af
   8F88 D1            [10] 3263 	pop	de
                           3264 ;src/entities/entities.c:970: redibujarEntity(&player->ent, player->ent.sw, player->ent.sh);
   8F89 21 26 00      [10] 3265 	ld	hl,#0x0026
   8F8C 19            [11] 3266 	add	hl,de
   8F8D 4D            [ 4] 3267 	ld	c,l
   8F8E 44            [ 4] 3268 	ld	b,h
   8F8F D5            [11] 3269 	push	de
   8F90 FD E1         [14] 3270 	pop	iy
   8F92 FD 7E 3A      [19] 3271 	ld	a,58 (iy)
   8F95 EB            [ 4] 3272 	ex	de,hl
   8F96 11 39 00      [10] 3273 	ld	de, #0x0039
   8F99 19            [11] 3274 	add	hl, de
   8F9A 56            [ 7] 3275 	ld	d,(hl)
   8F9B F5            [11] 3276 	push	af
   8F9C 33            [ 6] 3277 	inc	sp
   8F9D D5            [11] 3278 	push	de
   8F9E 33            [ 6] 3279 	inc	sp
   8F9F C5            [11] 3280 	push	bc
   8FA0 CD C9 8B      [17] 3281 	call	_redibujarEntity
   8FA3 F1            [10] 3282 	pop	af
   8FA4 F1            [10] 3283 	pop	af
                           3284 ;src/entities/entities.c:971: redibujarEntity(&exp->ent,exp->ent.sw,exp->ent.sh);
   8FA5 C1            [10] 3285 	pop	bc
   8FA6 C5            [11] 3286 	push	bc
   8FA7 03            [ 6] 3287 	inc	bc
   8FA8 C5            [11] 3288 	push	bc
   8FA9 FD E1         [14] 3289 	pop	iy
   8FAB FD 5E 14      [19] 3290 	ld	e,20 (iy)
   8FAE C5            [11] 3291 	push	bc
   8FAF FD E1         [14] 3292 	pop	iy
   8FB1 FD 56 13      [19] 3293 	ld	d,19 (iy)
   8FB4 7B            [ 4] 3294 	ld	a,e
   8FB5 F5            [11] 3295 	push	af
   8FB6 33            [ 6] 3296 	inc	sp
   8FB7 D5            [11] 3297 	push	de
   8FB8 33            [ 6] 3298 	inc	sp
   8FB9 C5            [11] 3299 	push	bc
   8FBA CD C9 8B      [17] 3300 	call	_redibujarEntity
   8FBD F1            [10] 3301 	pop	af
   8FBE F1            [10] 3302 	pop	af
                           3303 ;src/entities/entities.c:973: for(i = 0; i < NUM_ENEMIGOS; ++i){
   8FBF DD 36 FB 00   [19] 3304 	ld	-5 (ix),#0x00
   8FC3 DD 36 FE 00   [19] 3305 	ld	-2 (ix),#0x00
   8FC7 DD 36 FF 00   [19] 3306 	ld	-1 (ix),#0x00
   8FCB                    3307 00106$:
                           3308 ;src/entities/entities.c:974: if(enemigos[i].ent.cuadrante == mapaActual){
   8FCB 3E 7D         [ 7] 3309 	ld	a,#<(_enemigos)
   8FCD DD 86 FE      [19] 3310 	add	a, -2 (ix)
   8FD0 5F            [ 4] 3311 	ld	e,a
   8FD1 3E 7E         [ 7] 3312 	ld	a,#>(_enemigos)
   8FD3 DD 8E FF      [19] 3313 	adc	a, -1 (ix)
   8FD6 57            [ 4] 3314 	ld	d,a
   8FD7 21 26 00      [10] 3315 	ld	hl,#0x0026
   8FDA 19            [11] 3316 	add	hl,de
   8FDB DD 75 FC      [19] 3317 	ld	-4 (ix),l
   8FDE DD 74 FD      [19] 3318 	ld	-3 (ix),h
   8FE1 6B            [ 4] 3319 	ld	l, e
   8FE2 62            [ 4] 3320 	ld	h, d
   8FE3 01 42 00      [10] 3321 	ld	bc, #0x0042
   8FE6 09            [11] 3322 	add	hl, bc
   8FE7 4E            [ 7] 3323 	ld	c,(hl)
   8FE8 3A 7D 7D      [13] 3324 	ld	a,(#_mapaActual + 0)
   8FEB 91            [ 4] 3325 	sub	a, c
   8FEC 20 3E         [12] 3326 	jr	NZ,00107$
                           3327 ;src/entities/entities.c:975: redibujarEntity(&enemigos[i].ent, enemigos[i].ent.sw, enemigos[i].ent.sh);
   8FEE D5            [11] 3328 	push	de
   8FEF FD E1         [14] 3329 	pop	iy
   8FF1 FD 4E 3A      [19] 3330 	ld	c,58 (iy)
   8FF4 6B            [ 4] 3331 	ld	l, e
   8FF5 62            [ 4] 3332 	ld	h, d
   8FF6 C5            [11] 3333 	push	bc
   8FF7 01 39 00      [10] 3334 	ld	bc, #0x0039
   8FFA 09            [11] 3335 	add	hl, bc
   8FFB C1            [10] 3336 	pop	bc
   8FFC 66            [ 7] 3337 	ld	h,(hl)
   8FFD DD 6E FC      [19] 3338 	ld	l,-4 (ix)
   9000 DD 46 FD      [19] 3339 	ld	b,-3 (ix)
   9003 D5            [11] 3340 	push	de
   9004 79            [ 4] 3341 	ld	a,c
   9005 F5            [11] 3342 	push	af
   9006 33            [ 6] 3343 	inc	sp
   9007 E5            [11] 3344 	push	hl
   9008 33            [ 6] 3345 	inc	sp
   9009 60            [ 4] 3346 	ld	h, b
   900A E5            [11] 3347 	push	hl
   900B CD C9 8B      [17] 3348 	call	_redibujarEntity
   900E F1            [10] 3349 	pop	af
   900F F1            [10] 3350 	pop	af
   9010 D1            [10] 3351 	pop	de
                           3352 ;src/entities/entities.c:976: redibujarEntity(&enemigos[i].bullet.ent, enemigos[i].bullet.ent.sw, enemigos[i].bullet.ent.sh);
   9011 4B            [ 4] 3353 	ld	c, e
   9012 42            [ 4] 3354 	ld	b, d
   9013 03            [ 6] 3355 	inc	bc
   9014 03            [ 6] 3356 	inc	bc
   9015 03            [ 6] 3357 	inc	bc
   9016 D5            [11] 3358 	push	de
   9017 FD E1         [14] 3359 	pop	iy
   9019 FD 7E 17      [19] 3360 	ld	a,23 (iy)
   901C EB            [ 4] 3361 	ex	de,hl
   901D 11 16 00      [10] 3362 	ld	de, #0x0016
   9020 19            [11] 3363 	add	hl, de
   9021 56            [ 7] 3364 	ld	d,(hl)
   9022 F5            [11] 3365 	push	af
   9023 33            [ 6] 3366 	inc	sp
   9024 D5            [11] 3367 	push	de
   9025 33            [ 6] 3368 	inc	sp
   9026 C5            [11] 3369 	push	bc
   9027 CD C9 8B      [17] 3370 	call	_redibujarEntity
   902A F1            [10] 3371 	pop	af
   902B F1            [10] 3372 	pop	af
   902C                    3373 00107$:
                           3374 ;src/entities/entities.c:973: for(i = 0; i < NUM_ENEMIGOS; ++i){
   902C DD 7E FE      [19] 3375 	ld	a,-2 (ix)
   902F C6 4E         [ 7] 3376 	add	a, #0x4E
   9031 DD 77 FE      [19] 3377 	ld	-2 (ix),a
   9034 DD 7E FF      [19] 3378 	ld	a,-1 (ix)
   9037 CE 00         [ 7] 3379 	adc	a, #0x00
   9039 DD 77 FF      [19] 3380 	ld	-1 (ix),a
   903C DD 34 FB      [23] 3381 	inc	-5 (ix)
   903F DD 7E FB      [19] 3382 	ld	a,-5 (ix)
   9042 D6 03         [ 7] 3383 	sub	a, #0x03
   9044 38 85         [12] 3384 	jr	C,00106$
   9046 DD F9         [10] 3385 	ld	sp, ix
   9048 DD E1         [14] 3386 	pop	ix
   904A C9            [10] 3387 	ret
                           3388 ;src/entities/entities.c:983: TEnemy* getEnemies(){
                           3389 ;	---------------------------------
                           3390 ; Function getEnemies
                           3391 ; ---------------------------------
   904B                    3392 _getEnemies::
                           3393 ;src/entities/entities.c:984: return enemigos;
   904B 21 7D 7E      [10] 3394 	ld	hl,#_enemigos
   904E C9            [10] 3395 	ret
                           3396 ;src/entities/entities.c:987: TBase* getBases(){
                           3397 ;	---------------------------------
                           3398 ; Function getBases
                           3399 ; ---------------------------------
   904F                    3400 _getBases::
                           3401 ;src/entities/entities.c:988: return bases;
   904F 21 67 7F      [10] 3402 	ld	hl,#_bases
   9052 C9            [10] 3403 	ret
                           3404 	.area _CODE
                           3405 	.area _INITIALIZER
   7D98                    3406 __xinit__count1:
   7D98 00                 3407 	.db #0x00	; 0
   7D99                    3408 __xinit__turno:
   7D99 00                 3409 	.db #0x00	; 0
   7D9A                    3410 __xinit__bulletsTurno:
   7D9A 00                 3411 	.db #0x00	; 0
                           3412 	.area _CABS (ABS)
