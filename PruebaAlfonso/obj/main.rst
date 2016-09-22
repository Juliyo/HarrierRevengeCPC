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
                             15 	.globl _moverIzquierda
                             16 	.globl _moverDerecha
                             17 	.globl _comprobarTeclado
                             18 	.globl _dibujarMapa
                             19 	.globl _dibujaRotulo
                             20 	.globl _dibujarProta
                             21 	.globl _cpct_etm_setTileset2x4
                             22 	.globl _cpct_etm_drawTileBox2x4
                             23 	.globl _cpct_getScreenPtr
                             24 	.globl _cpct_setPALColour
                             25 	.globl _cpct_setPalette
                             26 	.globl _cpct_setVideoMode
                             27 	.globl _cpct_drawSpriteMaskedAlignedTable
                             28 	.globl _cpct_drawSprite
                             29 	.globl _cpct_isAnyKeyPressed
                             30 	.globl _cpct_isKeyPressed
                             31 	.globl _cpct_scanKeyboard_if
                             32 	.globl _cpct_disableFirmware
                             33 	.globl _mapa
                             34 	.globl _prota
                             35 ;--------------------------------------------------------
                             36 ; special function registers
                             37 ;--------------------------------------------------------
                             38 ;--------------------------------------------------------
                             39 ; ram data
                             40 ;--------------------------------------------------------
                             41 	.area _DATA
   6B42                      42 _prota::
   6B42                      43 	.ds 7
   6B49                      44 _mapa::
   6B49                      45 	.ds 2
                             46 ;--------------------------------------------------------
                             47 ; ram data
                             48 ;--------------------------------------------------------
                             49 	.area _INITIALIZED
                             50 ;--------------------------------------------------------
                             51 ; absolute external ram data
                             52 ;--------------------------------------------------------
                             53 	.area _DABS (ABS)
                             54 ;--------------------------------------------------------
                             55 ; global & static initialisations
                             56 ;--------------------------------------------------------
                             57 	.area _HOME
                             58 	.area _GSINIT
                             59 	.area _GSFINAL
                             60 	.area _GSINIT
                             61 ;--------------------------------------------------------
                             62 ; Home
                             63 ;--------------------------------------------------------
                             64 	.area _HOME
                             65 	.area _HOME
                             66 ;--------------------------------------------------------
                             67 ; code
                             68 ;--------------------------------------------------------
                             69 	.area _CODE
                             70 ;src/main.c:35: cpctm_createTransparentMaskTable(g_tablatrans,0x0100, M0, 0);
                             71 ;	---------------------------------
                             72 ; Function dummy_cpct_transparentMaskTable0M0_container
                             73 ; ---------------------------------
   68A0                      74 _dummy_cpct_transparentMaskTable0M0_container::
                             75 	.area _g_tablatrans_ (ABS) 
   0100                      76 	.org 0x0100 
   0100                      77 	 _g_tablatrans::
   0100 FF AA 55 00 AA AA    78 	.db 0xFF, 0xAA, 0x55, 0x00, 0xAA, 0xAA, 0x00, 0x00 
        00 00
   0108 55 00 55 00 00 00    79 	.db 0x55, 0x00, 0x55, 0x00, 0x00, 0x00, 0x00, 0x00 
        00 00
   0110 AA AA 00 00 AA AA    80 	.db 0xAA, 0xAA, 0x00, 0x00, 0xAA, 0xAA, 0x00, 0x00 
        00 00
   0118 00 00 00 00 00 00    81 	.db 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00 
        00 00
   0120 55 00 55 00 00 00    82 	.db 0x55, 0x00, 0x55, 0x00, 0x00, 0x00, 0x00, 0x00 
        00 00
   0128 55 00 55 00 00 00    83 	.db 0x55, 0x00, 0x55, 0x00, 0x00, 0x00, 0x00, 0x00 
        00 00
   0130 00 00 00 00 00 00    84 	.db 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00 
        00 00
   0138 00 00 00 00 00 00    85 	.db 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00 
        00 00
   0140 AA AA 00 00 AA AA    86 	.db 0xAA, 0xAA, 0x00, 0x00, 0xAA, 0xAA, 0x00, 0x00 
        00 00
   0148 00 00 00 00 00 00    87 	.db 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00 
        00 00
   0150 AA AA 00 00 AA AA    88 	.db 0xAA, 0xAA, 0x00, 0x00, 0xAA, 0xAA, 0x00, 0x00 
        00 00
   0158 00 00 00 00 00 00    89 	.db 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00 
        00 00
   0160 00 00 00 00 00 00    90 	.db 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00 
        00 00
   0168 00 00 00 00 00 00    91 	.db 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00 
        00 00
   0170 00 00 00 00 00 00    92 	.db 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00 
        00 00
   0178 00 00 00 00 00 00    93 	.db 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00 
        00 00
   0180 55 00 55 00 00 00    94 	.db 0x55, 0x00, 0x55, 0x00, 0x00, 0x00, 0x00, 0x00 
        00 00
   0188 55 00 55 00 00 00    95 	.db 0x55, 0x00, 0x55, 0x00, 0x00, 0x00, 0x00, 0x00 
        00 00
   0190 00 00 00 00 00 00    96 	.db 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00 
        00 00
   0198 00 00 00 00 00 00    97 	.db 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00 
        00 00
   01A0 55 00 55 00 00 00    98 	.db 0x55, 0x00, 0x55, 0x00, 0x00, 0x00, 0x00, 0x00 
        00 00
   01A8 55 00 55 00 00 00    99 	.db 0x55, 0x00, 0x55, 0x00, 0x00, 0x00, 0x00, 0x00 
        00 00
   01B0 00 00 00 00 00 00   100 	.db 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00 
        00 00
   01B8 00 00 00 00 00 00   101 	.db 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00 
        00 00
   01C0 00 00 00 00 00 00   102 	.db 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00 
        00 00
   01C8 00 00 00 00 00 00   103 	.db 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00 
        00 00
   01D0 00 00 00 00 00 00   104 	.db 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00 
        00 00
   01D8 00 00 00 00 00 00   105 	.db 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00 
        00 00
   01E0 00 00 00 00 00 00   106 	.db 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00 
        00 00
   01E8 00 00 00 00 00 00   107 	.db 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00 
        00 00
   01F0 00 00 00 00 00 00   108 	.db 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00 
        00 00
   01F8 00 00 00 00 00 00   109 	.db 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00 
        00 00
                            110 	.area _CSEG (REL, CON) 
                            111 ;src/main.c:51: void dibujarProta(){
                            112 ;	---------------------------------
                            113 ; Function dibujarProta
                            114 ; ---------------------------------
   6B4B                     115 _dibujarProta::
                            116 ;src/main.c:53: u8* pvmem	= cpct_getScreenPtr(CPCT_VMEM_START, prota.x, prota.y);
   6B4B 21 43 6B      [10]  117 	ld	hl, #_prota + 1
   6B4E 56            [ 7]  118 	ld	d,(hl)
   6B4F 21 42 6B      [10]  119 	ld	hl, #_prota + 0
   6B52 46            [ 7]  120 	ld	b,(hl)
   6B53 D5            [11]  121 	push	de
   6B54 33            [ 6]  122 	inc	sp
   6B55 C5            [11]  123 	push	bc
   6B56 33            [ 6]  124 	inc	sp
   6B57 21 00 C0      [10]  125 	ld	hl,#0xC000
   6B5A E5            [11]  126 	push	hl
   6B5B CD E7 6A      [17]  127 	call	_cpct_getScreenPtr
   6B5E EB            [ 4]  128 	ex	de,hl
                            129 ;src/main.c:63: G_HERO_00_H, g_tablatrans);
                            130 ;src/main.c:62: cpct_drawSpriteMaskedAlignedTable (prota.sprite, pvmem, G_HERO_00_W, 
   6B5F ED 4B 46 6B   [20]  131 	ld	bc, (#_prota + 4)
   6B63 21 00 01      [10]  132 	ld	hl,#_g_tablatrans
   6B66 E5            [11]  133 	push	hl
   6B67 21 08 1B      [10]  134 	ld	hl,#0x1B08
   6B6A E5            [11]  135 	push	hl
   6B6B D5            [11]  136 	push	de
   6B6C C5            [11]  137 	push	bc
   6B6D CD 07 6B      [17]  138 	call	_cpct_drawSpriteMaskedAlignedTable
   6B70 C9            [10]  139 	ret
                            140 ;src/main.c:68: void dibujaRotulo(){
                            141 ;	---------------------------------
                            142 ; Function dibujaRotulo
                            143 ; ---------------------------------
   6B71                     144 _dibujaRotulo::
                            145 ;src/main.c:69: cpct_drawSprite(g_retropolis_0, 
   6B71 21 28 42      [10]  146 	ld	hl,#0x4228
   6B74 E5            [11]  147 	push	hl
   6B75 21 00 C0      [10]  148 	ld	hl,#0xC000
   6B78 E5            [11]  149 	push	hl
   6B79 21 70 53      [10]  150 	ld	hl,#_g_retropolis_0
   6B7C E5            [11]  151 	push	hl
   6B7D CD CF 68      [17]  152 	call	_cpct_drawSprite
                            153 ;src/main.c:72: cpct_drawSprite(g_retropolis_1,
   6B80 21 28 42      [10]  154 	ld	hl,#0x4228
   6B83 E5            [11]  155 	push	hl
   6B84 26 C0         [ 7]  156 	ld	h, #0xC0
   6B86 E5            [11]  157 	push	hl
   6B87 21 C0 5D      [10]  158 	ld	hl,#_g_retropolis_1
   6B8A E5            [11]  159 	push	hl
   6B8B CD CF 68      [17]  160 	call	_cpct_drawSprite
   6B8E C9            [10]  161 	ret
                            162 ;src/main.c:78: void dibujarMapa(){
                            163 ;	---------------------------------
                            164 ; Function dibujarMapa
                            165 ; ---------------------------------
   6B8F                     166 _dibujarMapa::
                            167 ;src/main.c:79: cpct_etm_drawTilemap2x4(g_map1_W, g_map1_H, cpctm_screenPtr(CPCT_VMEM_START,0,68)
   6B8F 2A 49 6B      [16]  168 	ld	hl,(_mapa)
   6B92 E5            [11]  169 	push	hl
   6B93 21 80 E2      [10]  170 	ld	hl,#0xE280
   6B96 E5            [11]  171 	push	hl
   6B97 21 21 28      [10]  172 	ld	hl,#0x2821
   6B9A E5            [11]  173 	push	hl
   6B9B 2E 00         [ 7]  174 	ld	l, #0x00
   6B9D E5            [11]  175 	push	hl
   6B9E AF            [ 4]  176 	xor	a, a
   6B9F F5            [11]  177 	push	af
   6BA0 33            [ 6]  178 	inc	sp
   6BA1 CD 74 69      [17]  179 	call	_cpct_etm_drawTileBox2x4
   6BA4 C9            [10]  180 	ret
                            181 ;src/main.c:83: void comprobarTeclado(){
                            182 ;	---------------------------------
                            183 ; Function comprobarTeclado
                            184 ; ---------------------------------
   6BA5                     185 _comprobarTeclado::
                            186 ;src/main.c:85: cpct_scanKeyboard_if();
   6BA5 CD 3F 6A      [17]  187 	call	_cpct_scanKeyboard_if
                            188 ;src/main.c:86: if(cpct_isAnyKeyPressed()){
   6BA8 CD 32 6A      [17]  189 	call	_cpct_isAnyKeyPressed
   6BAB 7D            [ 4]  190 	ld	a,l
   6BAC B7            [ 4]  191 	or	a, a
   6BAD C8            [11]  192 	ret	Z
                            193 ;src/main.c:87: if(cpct_isKeyPressed(Key_CursorLeft)){
   6BAE 21 01 01      [10]  194 	ld	hl,#0x0101
   6BB1 CD B7 68      [17]  195 	call	_cpct_isKeyPressed
   6BB4 7D            [ 4]  196 	ld	a,l
   6BB5 B7            [ 4]  197 	or	a, a
                            198 ;src/main.c:88: moverIzquierda();
   6BB6 C2 D5 6B      [10]  199 	jp	NZ,_moverIzquierda
                            200 ;src/main.c:89: }else if(cpct_isKeyPressed(Key_CursorRight)){
   6BB9 21 00 02      [10]  201 	ld	hl,#0x0200
   6BBC CD B7 68      [17]  202 	call	_cpct_isKeyPressed
   6BBF 7D            [ 4]  203 	ld	a,l
   6BC0 B7            [ 4]  204 	or	a, a
   6BC1 C8            [11]  205 	ret	Z
                            206 ;src/main.c:90: moverDerecha();
   6BC2 C3 C5 6B      [10]  207 	jp  _moverDerecha
                            208 ;src/main.c:98: void moverDerecha(){
                            209 ;	---------------------------------
                            210 ; Function moverDerecha
                            211 ; ---------------------------------
   6BC5                     212 _moverDerecha::
                            213 ;src/main.c:99: if(prota.x < LIMITE_DERECHO){
   6BC5 21 42 6B      [10]  214 	ld	hl,#_prota+0
   6BC8 4E            [ 7]  215 	ld	c,(hl)
   6BC9 79            [ 4]  216 	ld	a,c
   6BCA D6 48         [ 7]  217 	sub	a, #0x48
   6BCC D0            [11]  218 	ret	NC
                            219 ;src/main.c:100: prota.x++;
   6BCD 0C            [ 4]  220 	inc	c
   6BCE 71            [ 7]  221 	ld	(hl),c
                            222 ;src/main.c:101: prota.mover = SI;
   6BCF 21 48 6B      [10]  223 	ld	hl,#(_prota + 0x0006)
   6BD2 36 01         [10]  224 	ld	(hl),#0x01
   6BD4 C9            [10]  225 	ret
                            226 ;src/main.c:105: void moverIzquierda(){
                            227 ;	---------------------------------
                            228 ; Function moverIzquierda
                            229 ; ---------------------------------
   6BD5                     230 _moverIzquierda::
                            231 ;src/main.c:106: if(prota.x > 0 ){
   6BD5 01 42 6B      [10]  232 	ld	bc,#_prota+0
   6BD8 0A            [ 7]  233 	ld	a,(bc)
   6BD9 B7            [ 4]  234 	or	a, a
   6BDA C8            [11]  235 	ret	Z
                            236 ;src/main.c:107: prota.x--;
   6BDB C6 FF         [ 7]  237 	add	a,#0xFF
   6BDD 02            [ 7]  238 	ld	(bc),a
                            239 ;src/main.c:108: prota.mover = SI;
   6BDE 21 48 6B      [10]  240 	ld	hl,#(_prota + 0x0006)
   6BE1 36 01         [10]  241 	ld	(hl),#0x01
   6BE3 C9            [10]  242 	ret
                            243 ;src/main.c:112: void borrarProta(){
                            244 ;	---------------------------------
                            245 ; Function borrarProta
                            246 ; ---------------------------------
   6BE4                     247 _borrarProta::
   6BE4 DD E5         [15]  248 	push	ix
   6BE6 DD 21 00 00   [14]  249 	ld	ix,#0
   6BEA DD 39         [15]  250 	add	ix,sp
   6BEC F5            [11]  251 	push	af
   6BED 3B            [ 6]  252 	dec	sp
                            253 ;src/main.c:114: u8 w = 4 + (prota.px & 1);
   6BEE 21 44 6B      [10]  254 	ld	hl, #_prota + 2
   6BF1 4E            [ 7]  255 	ld	c,(hl)
   6BF2 79            [ 4]  256 	ld	a,c
   6BF3 E6 01         [ 7]  257 	and	a, #0x01
   6BF5 47            [ 4]  258 	ld	b,a
   6BF6 04            [ 4]  259 	inc	b
   6BF7 04            [ 4]  260 	inc	b
   6BF8 04            [ 4]  261 	inc	b
   6BF9 04            [ 4]  262 	inc	b
                            263 ;src/main.c:115: u8 h = 7 + (prota.py & 3 ? 1: 0);
   6BFA 21 45 6B      [10]  264 	ld	hl, #_prota + 3
   6BFD 5E            [ 7]  265 	ld	e,(hl)
   6BFE 7B            [ 4]  266 	ld	a,e
   6BFF E6 03         [ 7]  267 	and	a, #0x03
   6C01 28 04         [12]  268 	jr	Z,00103$
   6C03 3E 01         [ 7]  269 	ld	a,#0x01
   6C05 18 02         [12]  270 	jr	00104$
   6C07                     271 00103$:
   6C07 3E 00         [ 7]  272 	ld	a,#0x00
   6C09                     273 00104$:
   6C09 C6 07         [ 7]  274 	add	a, #0x07
   6C0B DD 77 FD      [19]  275 	ld	-3 (ix),a
                            276 ;src/main.c:116: cpct_etm_drawTileBox2x4 (prota.px/2, (prota.py - ORIGEN_MAPA_Y)/4,w, h,g_map1_W,ORIGEN_MAPA,mapa);
   6C0E FD 2A 49 6B   [20]  277 	ld	iy,(_mapa)
   6C12 16 00         [ 7]  278 	ld	d,#0x00
   6C14 7B            [ 4]  279 	ld	a,e
   6C15 C6 BC         [ 7]  280 	add	a,#0xBC
   6C17 DD 77 FE      [19]  281 	ld	-2 (ix),a
   6C1A 7A            [ 4]  282 	ld	a,d
   6C1B CE FF         [ 7]  283 	adc	a,#0xFF
   6C1D DD 77 FF      [19]  284 	ld	-1 (ix),a
   6C20 DD 6E FE      [19]  285 	ld	l,-2 (ix)
   6C23 DD 66 FF      [19]  286 	ld	h,-1 (ix)
   6C26 DD CB FF 7E   [20]  287 	bit	7, -1 (ix)
   6C2A 28 04         [12]  288 	jr	Z,00105$
   6C2C 21 BF FF      [10]  289 	ld	hl,#0xFFBF
   6C2F 19            [11]  290 	add	hl,de
   6C30                     291 00105$:
   6C30 CB 2C         [ 8]  292 	sra	h
   6C32 CB 1D         [ 8]  293 	rr	l
   6C34 CB 2C         [ 8]  294 	sra	h
   6C36 CB 1D         [ 8]  295 	rr	l
   6C38 55            [ 4]  296 	ld	d,l
   6C39 CB 39         [ 8]  297 	srl	c
   6C3B FD E5         [15]  298 	push	iy
   6C3D 21 80 E2      [10]  299 	ld	hl,#0xE280
   6C40 E5            [11]  300 	push	hl
   6C41 3E 28         [ 7]  301 	ld	a,#0x28
   6C43 F5            [11]  302 	push	af
   6C44 33            [ 6]  303 	inc	sp
   6C45 DD 7E FD      [19]  304 	ld	a,-3 (ix)
   6C48 F5            [11]  305 	push	af
   6C49 33            [ 6]  306 	inc	sp
   6C4A C5            [11]  307 	push	bc
   6C4B 33            [ 6]  308 	inc	sp
   6C4C D5            [11]  309 	push	de
   6C4D 33            [ 6]  310 	inc	sp
   6C4E 79            [ 4]  311 	ld	a,c
   6C4F F5            [11]  312 	push	af
   6C50 33            [ 6]  313 	inc	sp
   6C51 CD 74 69      [17]  314 	call	_cpct_etm_drawTileBox2x4
   6C54 DD F9         [10]  315 	ld	sp, ix
   6C56 DD E1         [14]  316 	pop	ix
   6C58 C9            [10]  317 	ret
                            318 ;src/main.c:120: void redibujarProta(){
                            319 ;	---------------------------------
                            320 ; Function redibujarProta
                            321 ; ---------------------------------
   6C59                     322 _redibujarProta::
                            323 ;src/main.c:122: borrarProta();
   6C59 CD E4 6B      [17]  324 	call	_borrarProta
                            325 ;src/main.c:123: prota.px = prota.x;
   6C5C 01 44 6B      [10]  326 	ld	bc,#_prota + 2
   6C5F 3A 42 6B      [13]  327 	ld	a, (#_prota + 0)
   6C62 02            [ 7]  328 	ld	(bc),a
                            329 ;src/main.c:124: prota.py = prota.y;
   6C63 01 45 6B      [10]  330 	ld	bc,#_prota + 3
   6C66 3A 43 6B      [13]  331 	ld	a, (#_prota + 1)
   6C69 02            [ 7]  332 	ld	(bc),a
                            333 ;src/main.c:125: dibujarProta();
   6C6A C3 4B 6B      [10]  334 	jp  _dibujarProta
                            335 ;src/main.c:129: void inicializar(){
                            336 ;	---------------------------------
                            337 ; Function inicializar
                            338 ; ---------------------------------
   6C6D                     339 _inicializar::
                            340 ;src/main.c:131: cpct_disableFirmware();
   6C6D CD B5 6A      [17]  341 	call	_cpct_disableFirmware
                            342 ;src/main.c:132: cpct_setVideoMode(0);
   6C70 2E 00         [ 7]  343 	ld	l,#0x00
   6C72 CD A7 6A      [17]  344 	call	_cpct_setVideoMode
                            345 ;src/main.c:133: cpct_setBorder(HW_BLACK);
   6C75 21 10 14      [10]  346 	ld	hl,#0x1410
   6C78 E5            [11]  347 	push	hl
   6C79 CD C3 68      [17]  348 	call	_cpct_setPALColour
                            349 ;src/main.c:134: cpct_setPalette(g_palette, 16);
   6C7C 21 10 00      [10]  350 	ld	hl,#0x0010
   6C7F E5            [11]  351 	push	hl
   6C80 21 10 68      [10]  352 	ld	hl,#_g_palette
   6C83 E5            [11]  353 	push	hl
   6C84 CD A0 68      [17]  354 	call	_cpct_setPalette
                            355 ;src/main.c:136: prota.x = prota.px = 20;
   6C87 21 44 6B      [10]  356 	ld	hl,#(_prota + 0x0002)
   6C8A 36 14         [10]  357 	ld	(hl),#0x14
   6C8C 21 42 6B      [10]  358 	ld	hl,#_prota
   6C8F 36 14         [10]  359 	ld	(hl),#0x14
                            360 ;src/main.c:137: prota.y = prota.py = 160;
   6C91 21 45 6B      [10]  361 	ld	hl,#(_prota + 0x0003)
   6C94 36 A0         [10]  362 	ld	(hl),#0xA0
   6C96 21 43 6B      [10]  363 	ld	hl,#(_prota + 0x0001)
   6C99 36 A0         [10]  364 	ld	(hl),#0xA0
                            365 ;src/main.c:138: prota.mover = NO;
   6C9B 21 48 6B      [10]  366 	ld	hl,#(_prota + 0x0006)
   6C9E 36 00         [10]  367 	ld	(hl),#0x00
                            368 ;src/main.c:139: prota.sprite = g_hero_00;
   6CA0 21 F0 45      [10]  369 	ld	hl,#_g_hero_00
   6CA3 22 46 6B      [16]  370 	ld	((_prota + 0x0004)), hl
                            371 ;src/main.c:141: dibujaRotulo();
   6CA6 CD 71 6B      [17]  372 	call	_dibujaRotulo
                            373 ;src/main.c:144: mapa = g_map1;
   6CA9 21 00 40      [10]  374 	ld	hl,#_g_map1+0
   6CAC 22 49 6B      [16]  375 	ld	(_mapa),hl
                            376 ;src/main.c:145: cpct_etm_setTileset2x4(g_tileset);
   6CAF 21 28 45      [10]  377 	ld	hl,#_g_tileset
   6CB2 CD 03 6A      [17]  378 	call	_cpct_etm_setTileset2x4
                            379 ;src/main.c:146: dibujarMapa();
   6CB5 CD 8F 6B      [17]  380 	call	_dibujarMapa
                            381 ;src/main.c:148: dibujarProta();
   6CB8 CD 4B 6B      [17]  382 	call	_dibujarProta
   6CBB C9            [10]  383 	ret
                            384 ;src/main.c:157: void main(void) {
                            385 ;	---------------------------------
                            386 ; Function main
                            387 ; ---------------------------------
   6CBC                     388 _main::
                            389 ;src/main.c:159: inicializar();
   6CBC CD 6D 6C      [17]  390 	call	_inicializar
                            391 ;src/main.c:163: while (1){
   6CBF                     392 00104$:
                            393 ;src/main.c:164: comprobarTeclado();
   6CBF CD A5 6B      [17]  394 	call	_comprobarTeclado
                            395 ;src/main.c:165: if(prota.mover){
   6CC2 3A 48 6B      [13]  396 	ld	a, (#(_prota + 0x0006) + 0)
   6CC5 B7            [ 4]  397 	or	a, a
   6CC6 28 F7         [12]  398 	jr	Z,00104$
                            399 ;src/main.c:166: redibujarProta(); //es muy lento dibujarlo todo el rato
   6CC8 CD 59 6C      [17]  400 	call	_redibujarProta
                            401 ;src/main.c:167: prota.mover = NO;
   6CCB 21 48 6B      [10]  402 	ld	hl,#(_prota + 0x0006)
   6CCE 36 00         [10]  403 	ld	(hl),#0x00
   6CD0 18 ED         [12]  404 	jr	00104$
                            405 	.area _CODE
                            406 	.area _INITIALIZER
                            407 	.area _CABS (ABS)
