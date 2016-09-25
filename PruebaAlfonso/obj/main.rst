                              1 ;--------------------------------------------------------
                              2 ; File Created by SDCC : free open source ANSI-C Compiler
                              3 ; Version 3.5.5 #9498 (Linux)
                              4 ;--------------------------------------------------------
                              5 	.module main
                              6 	.optsdcc -mz80
                              7 	
                              8 ;--------------------------------------------------------
                              9 ; Public variables in this module
                             10 ;--------------------------------------------------------
                             11 	.globl _main
                             12 	.globl _inicializar
                             13 	.globl _redibujarProta
                             14 	.globl _borrarProta
                             15 	.globl _comprobarTeclado
                             16 	.globl _moverDerecha
                             17 	.globl _moverIzquierda
                             18 	.globl _dibujarMapa
                             19 	.globl _dibujaRotulo
                             20 	.globl _dibujarProta
                             21 	.globl _interrupcion
                             22 	.globl _cpct_etm_setTileset2x4
                             23 	.globl _cpct_etm_drawTileBox2x4
                             24 	.globl _cpct_getScreenPtr
                             25 	.globl _cpct_setPALColour
                             26 	.globl _cpct_setPalette
                             27 	.globl _cpct_setVideoMode
                             28 	.globl _cpct_drawSpriteMaskedAlignedTable
                             29 	.globl _cpct_drawSprite
                             30 	.globl _cpct_isAnyKeyPressed
                             31 	.globl _cpct_isKeyPressed
                             32 	.globl _cpct_scanKeyboard_if
                             33 	.globl _cpct_setInterruptHandler
                             34 	.globl _cpct_disableFirmware
                             35 	.globl _mapa
                             36 	.globl _prota
                             37 ;--------------------------------------------------------
                             38 ; special function registers
                             39 ;--------------------------------------------------------
                             40 ;--------------------------------------------------------
                             41 ; ram data
                             42 ;--------------------------------------------------------
                             43 	.area _DATA
   6D7A                      44 _prota::
   6D7A                      45 	.ds 7
   6D81                      46 _mapa::
   6D81                      47 	.ds 2
   6D83                      48 _interrupcion_kk_1_77:
   6D83                      49 	.ds 1
                             50 ;--------------------------------------------------------
                             51 ; ram data
                             52 ;--------------------------------------------------------
                             53 	.area _INITIALIZED
                             54 ;--------------------------------------------------------
                             55 ; absolute external ram data
                             56 ;--------------------------------------------------------
                             57 	.area _DABS (ABS)
                             58 ;--------------------------------------------------------
                             59 ; global & static initialisations
                             60 ;--------------------------------------------------------
                             61 	.area _HOME
                             62 	.area _GSINIT
                             63 	.area _GSFINAL
                             64 	.area _GSINIT
                             65 ;--------------------------------------------------------
                             66 ; Home
                             67 ;--------------------------------------------------------
                             68 	.area _HOME
                             69 	.area _HOME
                             70 ;--------------------------------------------------------
                             71 ; code
                             72 ;--------------------------------------------------------
                             73 	.area _CODE
                             74 ;src/main.c:36: cpctm_createTransparentMaskTable(g_tablatrans,0x0100, M0, 0);
                             75 ;	---------------------------------
                             76 ; Function dummy_cpct_transparentMaskTable0M0_container
                             77 ; ---------------------------------
   6AB0                      78 _dummy_cpct_transparentMaskTable0M0_container::
                             79 	.area _g_tablatrans_ (ABS) 
   0100                      80 	.org 0x0100 
   0100                      81 	 _g_tablatrans::
   0100 FF AA 55 00 AA AA    82 	.db 0xFF, 0xAA, 0x55, 0x00, 0xAA, 0xAA, 0x00, 0x00 
        00 00
   0108 55 00 55 00 00 00    83 	.db 0x55, 0x00, 0x55, 0x00, 0x00, 0x00, 0x00, 0x00 
        00 00
   0110 AA AA 00 00 AA AA    84 	.db 0xAA, 0xAA, 0x00, 0x00, 0xAA, 0xAA, 0x00, 0x00 
        00 00
   0118 00 00 00 00 00 00    85 	.db 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00 
        00 00
   0120 55 00 55 00 00 00    86 	.db 0x55, 0x00, 0x55, 0x00, 0x00, 0x00, 0x00, 0x00 
        00 00
   0128 55 00 55 00 00 00    87 	.db 0x55, 0x00, 0x55, 0x00, 0x00, 0x00, 0x00, 0x00 
        00 00
   0130 00 00 00 00 00 00    88 	.db 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00 
        00 00
   0138 00 00 00 00 00 00    89 	.db 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00 
        00 00
   0140 AA AA 00 00 AA AA    90 	.db 0xAA, 0xAA, 0x00, 0x00, 0xAA, 0xAA, 0x00, 0x00 
        00 00
   0148 00 00 00 00 00 00    91 	.db 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00 
        00 00
   0150 AA AA 00 00 AA AA    92 	.db 0xAA, 0xAA, 0x00, 0x00, 0xAA, 0xAA, 0x00, 0x00 
        00 00
   0158 00 00 00 00 00 00    93 	.db 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00 
        00 00
   0160 00 00 00 00 00 00    94 	.db 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00 
        00 00
   0168 00 00 00 00 00 00    95 	.db 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00 
        00 00
   0170 00 00 00 00 00 00    96 	.db 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00 
        00 00
   0178 00 00 00 00 00 00    97 	.db 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00 
        00 00
   0180 55 00 55 00 00 00    98 	.db 0x55, 0x00, 0x55, 0x00, 0x00, 0x00, 0x00, 0x00 
        00 00
   0188 55 00 55 00 00 00    99 	.db 0x55, 0x00, 0x55, 0x00, 0x00, 0x00, 0x00, 0x00 
        00 00
   0190 00 00 00 00 00 00   100 	.db 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00 
        00 00
   0198 00 00 00 00 00 00   101 	.db 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00 
        00 00
   01A0 55 00 55 00 00 00   102 	.db 0x55, 0x00, 0x55, 0x00, 0x00, 0x00, 0x00, 0x00 
        00 00
   01A8 55 00 55 00 00 00   103 	.db 0x55, 0x00, 0x55, 0x00, 0x00, 0x00, 0x00, 0x00 
        00 00
   01B0 00 00 00 00 00 00   104 	.db 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00 
        00 00
   01B8 00 00 00 00 00 00   105 	.db 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00 
        00 00
   01C0 00 00 00 00 00 00   106 	.db 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00 
        00 00
   01C8 00 00 00 00 00 00   107 	.db 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00 
        00 00
   01D0 00 00 00 00 00 00   108 	.db 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00 
        00 00
   01D8 00 00 00 00 00 00   109 	.db 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00 
        00 00
   01E0 00 00 00 00 00 00   110 	.db 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00 
        00 00
   01E8 00 00 00 00 00 00   111 	.db 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00 
        00 00
   01F0 00 00 00 00 00 00   112 	.db 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00 
        00 00
   01F8 00 00 00 00 00 00   113 	.db 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00 
        00 00
                            114 	.area _CSEG (REL, CON) 
                            115 ;src/main.c:51: void interrupcion() {
                            116 ;	---------------------------------
                            117 ; Function interrupcion
                            118 ; ---------------------------------
   6D84                     119 _interrupcion::
                            120 ;src/main.c:54: if (++kk == 5) {
   6D84 21 83 6D      [10]  121 	ld	hl, #_interrupcion_kk_1_77+0
   6D87 34            [11]  122 	inc	(hl)
   6D88 3A 83 6D      [13]  123 	ld	a,(#_interrupcion_kk_1_77 + 0)
   6D8B D6 05         [ 7]  124 	sub	a, #0x05
   6D8D C0            [11]  125 	ret	NZ
                            126 ;src/main.c:56: cpct_scanKeyboard_if();
   6D8E CD 4F 6C      [17]  127 	call	_cpct_scanKeyboard_if
                            128 ;src/main.c:57: kk = 0;
   6D91 21 83 6D      [10]  129 	ld	hl,#_interrupcion_kk_1_77 + 0
   6D94 36 00         [10]  130 	ld	(hl), #0x00
   6D96 C9            [10]  131 	ret
                            132 ;src/main.c:61: void dibujarProta(){
                            133 ;	---------------------------------
                            134 ; Function dibujarProta
                            135 ; ---------------------------------
   6D97                     136 _dibujarProta::
                            137 ;src/main.c:63: u8* pvmem	= cpct_getScreenPtr(CPCT_VMEM_START, prota.x, prota.y);
   6D97 21 7B 6D      [10]  138 	ld	hl, #_prota + 1
   6D9A 56            [ 7]  139 	ld	d,(hl)
   6D9B 21 7A 6D      [10]  140 	ld	hl, #_prota + 0
   6D9E 46            [ 7]  141 	ld	b,(hl)
   6D9F D5            [11]  142 	push	de
   6DA0 33            [ 6]  143 	inc	sp
   6DA1 C5            [11]  144 	push	bc
   6DA2 33            [ 6]  145 	inc	sp
   6DA3 21 00 C0      [10]  146 	ld	hl,#0xC000
   6DA6 E5            [11]  147 	push	hl
   6DA7 CD F7 6C      [17]  148 	call	_cpct_getScreenPtr
   6DAA EB            [ 4]  149 	ex	de,hl
                            150 ;src/main.c:73: G_NAVE_0_H, g_tablatrans);
                            151 ;src/main.c:72: cpct_drawSpriteMaskedAlignedTable (prota.sprite, pvmem, G_NAVE_0_W, 
   6DAB ED 4B 7E 6D   [20]  152 	ld	bc, (#_prota + 4)
   6DAF 21 00 01      [10]  153 	ld	hl,#_g_tablatrans
   6DB2 E5            [11]  154 	push	hl
   6DB3 21 08 10      [10]  155 	ld	hl,#0x1008
   6DB6 E5            [11]  156 	push	hl
   6DB7 D5            [11]  157 	push	de
   6DB8 C5            [11]  158 	push	bc
   6DB9 CD 17 6D      [17]  159 	call	_cpct_drawSpriteMaskedAlignedTable
   6DBC C9            [10]  160 	ret
                            161 ;src/main.c:78: void dibujaRotulo(){
                            162 ;	---------------------------------
                            163 ; Function dibujaRotulo
                            164 ; ---------------------------------
   6DBD                     165 _dibujaRotulo::
                            166 ;src/main.c:79: cpct_drawSprite(g_retropolis_0, 
   6DBD 21 28 42      [10]  167 	ld	hl,#0x4228
   6DC0 E5            [11]  168 	push	hl
   6DC1 21 00 C0      [10]  169 	ld	hl,#0xC000
   6DC4 E5            [11]  170 	push	hl
   6DC5 21 00 48      [10]  171 	ld	hl,#_g_retropolis_0
   6DC8 E5            [11]  172 	push	hl
   6DC9 CD DF 6A      [17]  173 	call	_cpct_drawSprite
                            174 ;src/main.c:82: cpct_drawSprite(g_retropolis_1,
   6DCC 21 28 42      [10]  175 	ld	hl,#0x4228
   6DCF E5            [11]  176 	push	hl
   6DD0 26 C0         [ 7]  177 	ld	h, #0xC0
   6DD2 E5            [11]  178 	push	hl
   6DD3 21 50 52      [10]  179 	ld	hl,#_g_retropolis_1
   6DD6 E5            [11]  180 	push	hl
   6DD7 CD DF 6A      [17]  181 	call	_cpct_drawSprite
   6DDA C9            [10]  182 	ret
                            183 ;src/main.c:88: void dibujarMapa(){
                            184 ;	---------------------------------
                            185 ; Function dibujarMapa
                            186 ; ---------------------------------
   6DDB                     187 _dibujarMapa::
                            188 ;src/main.c:89: cpct_etm_drawTilemap2x4(g_map1_W, g_map1_H, cpctm_screenPtr(CPCT_VMEM_START,0,68)
   6DDB 2A 81 6D      [16]  189 	ld	hl,(_mapa)
   6DDE E5            [11]  190 	push	hl
   6DDF 21 80 E2      [10]  191 	ld	hl,#0xE280
   6DE2 E5            [11]  192 	push	hl
   6DE3 21 21 28      [10]  193 	ld	hl,#0x2821
   6DE6 E5            [11]  194 	push	hl
   6DE7 2E 00         [ 7]  195 	ld	l, #0x00
   6DE9 E5            [11]  196 	push	hl
   6DEA AF            [ 4]  197 	xor	a, a
   6DEB F5            [11]  198 	push	af
   6DEC 33            [ 6]  199 	inc	sp
   6DED CD 84 6B      [17]  200 	call	_cpct_etm_drawTileBox2x4
   6DF0 C9            [10]  201 	ret
                            202 ;src/main.c:96: void moverIzquierda(){
                            203 ;	---------------------------------
                            204 ; Function moverIzquierda
                            205 ; ---------------------------------
   6DF1                     206 _moverIzquierda::
                            207 ;src/main.c:97: if(prota.x > 0 ){
   6DF1 01 7A 6D      [10]  208 	ld	bc,#_prota+0
   6DF4 0A            [ 7]  209 	ld	a,(bc)
   6DF5 B7            [ 4]  210 	or	a, a
   6DF6 C8            [11]  211 	ret	Z
                            212 ;src/main.c:98: prota.x--;
   6DF7 C6 FF         [ 7]  213 	add	a,#0xFF
   6DF9 02            [ 7]  214 	ld	(bc),a
                            215 ;src/main.c:99: prota.mover = SI;
   6DFA 21 80 6D      [10]  216 	ld	hl,#(_prota + 0x0006)
   6DFD 36 01         [10]  217 	ld	(hl),#0x01
   6DFF C9            [10]  218 	ret
                            219 ;src/main.c:103: void moverDerecha(){
                            220 ;	---------------------------------
                            221 ; Function moverDerecha
                            222 ; ---------------------------------
   6E00                     223 _moverDerecha::
                            224 ;src/main.c:104: if(prota.x < LIMITE_DERECHO){
   6E00 21 7A 6D      [10]  225 	ld	hl,#_prota+0
   6E03 4E            [ 7]  226 	ld	c,(hl)
   6E04 79            [ 4]  227 	ld	a,c
   6E05 D6 48         [ 7]  228 	sub	a, #0x48
   6E07 D0            [11]  229 	ret	NC
                            230 ;src/main.c:105: prota.x++;
   6E08 0C            [ 4]  231 	inc	c
   6E09 71            [ 7]  232 	ld	(hl),c
                            233 ;src/main.c:106: prota.mover = SI;
   6E0A 21 80 6D      [10]  234 	ld	hl,#(_prota + 0x0006)
   6E0D 36 01         [10]  235 	ld	(hl),#0x01
   6E0F C9            [10]  236 	ret
                            237 ;src/main.c:110: void comprobarTeclado(){
                            238 ;	---------------------------------
                            239 ; Function comprobarTeclado
                            240 ; ---------------------------------
   6E10                     241 _comprobarTeclado::
                            242 ;src/main.c:112: cpct_scanKeyboard_if();
   6E10 CD 4F 6C      [17]  243 	call	_cpct_scanKeyboard_if
                            244 ;src/main.c:113: if(cpct_isAnyKeyPressed()){
   6E13 CD 42 6C      [17]  245 	call	_cpct_isAnyKeyPressed
   6E16 7D            [ 4]  246 	ld	a,l
   6E17 B7            [ 4]  247 	or	a, a
   6E18 C8            [11]  248 	ret	Z
                            249 ;src/main.c:114: if(cpct_isKeyPressed(Key_CursorLeft)){
   6E19 21 01 01      [10]  250 	ld	hl,#0x0101
   6E1C CD C7 6A      [17]  251 	call	_cpct_isKeyPressed
   6E1F 7D            [ 4]  252 	ld	a,l
   6E20 B7            [ 4]  253 	or	a, a
                            254 ;src/main.c:115: moverIzquierda();
   6E21 C2 F1 6D      [10]  255 	jp	NZ,_moverIzquierda
                            256 ;src/main.c:116: }else if(cpct_isKeyPressed(Key_CursorRight)){
   6E24 21 00 02      [10]  257 	ld	hl,#0x0200
   6E27 CD C7 6A      [17]  258 	call	_cpct_isKeyPressed
   6E2A 7D            [ 4]  259 	ld	a,l
   6E2B B7            [ 4]  260 	or	a, a
   6E2C C8            [11]  261 	ret	Z
                            262 ;src/main.c:117: moverDerecha();
   6E2D C3 00 6E      [10]  263 	jp  _moverDerecha
                            264 ;src/main.c:128: void borrarProta(){
                            265 ;	---------------------------------
                            266 ; Function borrarProta
                            267 ; ---------------------------------
   6E30                     268 _borrarProta::
   6E30 DD E5         [15]  269 	push	ix
   6E32 DD 21 00 00   [14]  270 	ld	ix,#0
   6E36 DD 39         [15]  271 	add	ix,sp
   6E38 F5            [11]  272 	push	af
   6E39 3B            [ 6]  273 	dec	sp
                            274 ;src/main.c:130: u8 w = 2 + (prota.px & 1);
   6E3A 21 7C 6D      [10]  275 	ld	hl, #_prota + 2
   6E3D 4E            [ 7]  276 	ld	c,(hl)
   6E3E 79            [ 4]  277 	ld	a,c
   6E3F E6 01         [ 7]  278 	and	a, #0x01
   6E41 47            [ 4]  279 	ld	b,a
   6E42 04            [ 4]  280 	inc	b
   6E43 04            [ 4]  281 	inc	b
                            282 ;src/main.c:131: u8 h = 7 + (prota.py & 3 ? 1: 0);
   6E44 21 7D 6D      [10]  283 	ld	hl, #_prota + 3
   6E47 5E            [ 7]  284 	ld	e,(hl)
   6E48 7B            [ 4]  285 	ld	a,e
   6E49 E6 03         [ 7]  286 	and	a, #0x03
   6E4B 28 04         [12]  287 	jr	Z,00103$
   6E4D 3E 01         [ 7]  288 	ld	a,#0x01
   6E4F 18 02         [12]  289 	jr	00104$
   6E51                     290 00103$:
   6E51 3E 00         [ 7]  291 	ld	a,#0x00
   6E53                     292 00104$:
   6E53 C6 07         [ 7]  293 	add	a, #0x07
   6E55 DD 77 FD      [19]  294 	ld	-3 (ix),a
                            295 ;src/main.c:132: cpct_etm_drawTileBox2x4 (prota.px/2, (prota.py - ORIGEN_MAPA_Y)/4,w, h,g_map1_W,ORIGEN_MAPA,mapa);
   6E58 FD 2A 81 6D   [20]  296 	ld	iy,(_mapa)
   6E5C 16 00         [ 7]  297 	ld	d,#0x00
   6E5E 7B            [ 4]  298 	ld	a,e
   6E5F C6 BC         [ 7]  299 	add	a,#0xBC
   6E61 DD 77 FE      [19]  300 	ld	-2 (ix),a
   6E64 7A            [ 4]  301 	ld	a,d
   6E65 CE FF         [ 7]  302 	adc	a,#0xFF
   6E67 DD 77 FF      [19]  303 	ld	-1 (ix),a
   6E6A DD 6E FE      [19]  304 	ld	l,-2 (ix)
   6E6D DD 66 FF      [19]  305 	ld	h,-1 (ix)
   6E70 DD CB FF 7E   [20]  306 	bit	7, -1 (ix)
   6E74 28 04         [12]  307 	jr	Z,00105$
   6E76 21 BF FF      [10]  308 	ld	hl,#0xFFBF
   6E79 19            [11]  309 	add	hl,de
   6E7A                     310 00105$:
   6E7A CB 2C         [ 8]  311 	sra	h
   6E7C CB 1D         [ 8]  312 	rr	l
   6E7E CB 2C         [ 8]  313 	sra	h
   6E80 CB 1D         [ 8]  314 	rr	l
   6E82 55            [ 4]  315 	ld	d,l
   6E83 CB 39         [ 8]  316 	srl	c
   6E85 FD E5         [15]  317 	push	iy
   6E87 21 80 E2      [10]  318 	ld	hl,#0xE280
   6E8A E5            [11]  319 	push	hl
   6E8B 3E 28         [ 7]  320 	ld	a,#0x28
   6E8D F5            [11]  321 	push	af
   6E8E 33            [ 6]  322 	inc	sp
   6E8F DD 7E FD      [19]  323 	ld	a,-3 (ix)
   6E92 F5            [11]  324 	push	af
   6E93 33            [ 6]  325 	inc	sp
   6E94 C5            [11]  326 	push	bc
   6E95 33            [ 6]  327 	inc	sp
   6E96 D5            [11]  328 	push	de
   6E97 33            [ 6]  329 	inc	sp
   6E98 79            [ 4]  330 	ld	a,c
   6E99 F5            [11]  331 	push	af
   6E9A 33            [ 6]  332 	inc	sp
   6E9B CD 84 6B      [17]  333 	call	_cpct_etm_drawTileBox2x4
   6E9E DD F9         [10]  334 	ld	sp, ix
   6EA0 DD E1         [14]  335 	pop	ix
   6EA2 C9            [10]  336 	ret
                            337 ;src/main.c:136: void redibujarProta(){
                            338 ;	---------------------------------
                            339 ; Function redibujarProta
                            340 ; ---------------------------------
   6EA3                     341 _redibujarProta::
                            342 ;src/main.c:138: borrarProta();
   6EA3 CD 30 6E      [17]  343 	call	_borrarProta
                            344 ;src/main.c:139: prota.px = prota.x;
   6EA6 01 7C 6D      [10]  345 	ld	bc,#_prota + 2
   6EA9 3A 7A 6D      [13]  346 	ld	a, (#_prota + 0)
   6EAC 02            [ 7]  347 	ld	(bc),a
                            348 ;src/main.c:140: prota.py = prota.y;
   6EAD 01 7D 6D      [10]  349 	ld	bc,#_prota + 3
   6EB0 3A 7B 6D      [13]  350 	ld	a, (#_prota + 1)
   6EB3 02            [ 7]  351 	ld	(bc),a
                            352 ;src/main.c:141: dibujarProta();
   6EB4 C3 97 6D      [10]  353 	jp  _dibujarProta
                            354 ;src/main.c:148: void inicializar(){
                            355 ;	---------------------------------
                            356 ; Function inicializar
                            357 ; ---------------------------------
   6EB7                     358 _inicializar::
                            359 ;src/main.c:150: cpct_disableFirmware();
   6EB7 CD C5 6C      [17]  360 	call	_cpct_disableFirmware
                            361 ;src/main.c:151: cpct_setVideoMode(0);
   6EBA 2E 00         [ 7]  362 	ld	l,#0x00
   6EBC CD B7 6C      [17]  363 	call	_cpct_setVideoMode
                            364 ;src/main.c:152: cpct_setBorder(HW_BLACK);
   6EBF 21 10 14      [10]  365 	ld	hl,#0x1410
   6EC2 E5            [11]  366 	push	hl
   6EC3 CD D3 6A      [17]  367 	call	_cpct_setPALColour
                            368 ;src/main.c:153: cpct_setPalette(g_palette, 16);
   6EC6 21 10 00      [10]  369 	ld	hl,#0x0010
   6EC9 E5            [11]  370 	push	hl
   6ECA 21 A0 5C      [10]  371 	ld	hl,#_g_palette
   6ECD E5            [11]  372 	push	hl
   6ECE CD B0 6A      [17]  373 	call	_cpct_setPalette
                            374 ;src/main.c:155: prota.x = prota.px = 20;
   6ED1 21 7C 6D      [10]  375 	ld	hl,#(_prota + 0x0002)
   6ED4 36 14         [10]  376 	ld	(hl),#0x14
   6ED6 21 7A 6D      [10]  377 	ld	hl,#_prota
   6ED9 36 14         [10]  378 	ld	(hl),#0x14
                            379 ;src/main.c:156: prota.y = prota.py = 160;
   6EDB 21 7D 6D      [10]  380 	ld	hl,#(_prota + 0x0003)
   6EDE 36 A0         [10]  381 	ld	(hl),#0xA0
   6EE0 21 7B 6D      [10]  382 	ld	hl,#(_prota + 0x0001)
   6EE3 36 A0         [10]  383 	ld	(hl),#0xA0
                            384 ;src/main.c:157: prota.mover = NO;
   6EE5 21 80 6D      [10]  385 	ld	hl,#(_prota + 0x0006)
   6EE8 36 00         [10]  386 	ld	(hl),#0x00
                            387 ;src/main.c:158: prota.sprite = g_nave_0;
   6EEA 21 F0 45      [10]  388 	ld	hl,#_g_nave_0
   6EED 22 7E 6D      [16]  389 	ld	((_prota + 0x0004)), hl
                            390 ;src/main.c:160: dibujaRotulo();
   6EF0 CD BD 6D      [17]  391 	call	_dibujaRotulo
                            392 ;src/main.c:163: mapa = g_map1;
   6EF3 21 00 40      [10]  393 	ld	hl,#_g_map1+0
   6EF6 22 81 6D      [16]  394 	ld	(_mapa),hl
                            395 ;src/main.c:164: cpct_etm_setTileset2x4(g_tileset);
   6EF9 21 28 45      [10]  396 	ld	hl,#_g_tileset
   6EFC CD 13 6C      [17]  397 	call	_cpct_etm_setTileset2x4
                            398 ;src/main.c:165: dibujarMapa();
   6EFF CD DB 6D      [17]  399 	call	_dibujarMapa
                            400 ;src/main.c:167: dibujarProta();
   6F02 CD 97 6D      [17]  401 	call	_dibujarProta
                            402 ;src/main.c:169: cpct_setInterruptHandler(interrupcion);
   6F05 21 84 6D      [10]  403 	ld	hl,#_interrupcion
   6F08 CD 52 6D      [17]  404 	call	_cpct_setInterruptHandler
   6F0B C9            [10]  405 	ret
                            406 ;src/main.c:180: void main(void) {
                            407 ;	---------------------------------
                            408 ; Function main
                            409 ; ---------------------------------
   6F0C                     410 _main::
                            411 ;src/main.c:182: inicializar();
   6F0C CD B7 6E      [17]  412 	call	_inicializar
                            413 ;src/main.c:186: while (1){
   6F0F                     414 00104$:
                            415 ;src/main.c:187: comprobarTeclado();
   6F0F CD 10 6E      [17]  416 	call	_comprobarTeclado
                            417 ;src/main.c:188: if(prota.mover){
   6F12 3A 80 6D      [13]  418 	ld	a, (#(_prota + 0x0006) + 0)
   6F15 B7            [ 4]  419 	or	a, a
   6F16 28 F7         [12]  420 	jr	Z,00104$
                            421 ;src/main.c:189: redibujarProta(); //es muy lento dibujarlo todo el rato
   6F18 CD A3 6E      [17]  422 	call	_redibujarProta
                            423 ;src/main.c:190: prota.mover = NO;
   6F1B 21 80 6D      [10]  424 	ld	hl,#(_prota + 0x0006)
   6F1E 36 00         [10]  425 	ld	(hl),#0x00
   6F20 18 ED         [12]  426 	jr	00104$
                            427 	.area _CODE
                            428 	.area _INITIALIZER
                            429 	.area _CABS (ABS)
