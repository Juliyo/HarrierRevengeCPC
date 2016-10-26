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
                             12 	.globl _menu
                             13 	.globl _inicializar
                             14 	.globl _interrupcion
                             15 	.globl _playmusic
                             16 	.globl _play
                             17 	.globl _cpct_getScreenPtr
                             18 	.globl _cpct_setPALColour
                             19 	.globl _cpct_setPalette
                             20 	.globl _cpct_setVideoMode
                             21 	.globl _cpct_drawStringM0
                             22 	.globl _cpct_drawSprite
                             23 	.globl _cpct_isKeyPressed
                             24 	.globl _cpct_scanKeyboard_if
                             25 	.globl _cpct_scanKeyboard_f
                             26 	.globl _cpct_memset
                             27 	.globl _cpct_disableFirmware
                             28 	.globl _mostrarMenu
                             29 ;--------------------------------------------------------
                             30 ; special function registers
                             31 ;--------------------------------------------------------
                             32 ;--------------------------------------------------------
                             33 ; ram data
                             34 ;--------------------------------------------------------
                             35 	.area _DATA
   858A                      36 _interrupcion_kk_1_84:
   858A                      37 	.ds 1
                             38 ;--------------------------------------------------------
                             39 ; ram data
                             40 ;--------------------------------------------------------
                             41 	.area _INITIALIZED
   8596                      42 _mostrarMenu::
   8596                      43 	.ds 1
                             44 ;--------------------------------------------------------
                             45 ; absolute external ram data
                             46 ;--------------------------------------------------------
                             47 	.area _DABS (ABS)
                             48 ;--------------------------------------------------------
                             49 ; global & static initialisations
                             50 ;--------------------------------------------------------
                             51 	.area _HOME
                             52 	.area _GSINIT
                             53 	.area _GSFINAL
                             54 	.area _GSINIT
                             55 ;--------------------------------------------------------
                             56 ; Home
                             57 ;--------------------------------------------------------
                             58 	.area _HOME
                             59 	.area _HOME
                             60 ;--------------------------------------------------------
                             61 ; code
                             62 ;--------------------------------------------------------
                             63 	.area _CODE
                             64 ;src/main.c:30: void playmusic() {
                             65 ;	---------------------------------
                             66 ; Function playmusic
                             67 ; ---------------------------------
   624D                      68 _playmusic::
                             69 ;src/main.c:45: __endasm;
   624D D9            [ 4]   70 	exx
   624E 08                   71 	.db	#0x08
   624F F5            [11]   72 	push	af
   6250 C5            [11]   73 	push	bc
   6251 D5            [11]   74 	push	de
   6252 E5            [11]   75 	push	hl
   6253 CD FC 70      [17]   76 	call	_cpct_akp_musicPlay
   6256 E1            [10]   77 	pop	hl
   6257 D1            [10]   78 	pop	de
   6258 C1            [10]   79 	pop	bc
   6259 F1            [10]   80 	pop	af
   625A 08                   81 	.db	#0x08
   625B D9            [ 4]   82 	exx
   625C C9            [10]   83 	ret
                             84 ;src/main.c:48: void interrupcion() {
                             85 ;	---------------------------------
                             86 ; Function interrupcion
                             87 ; ---------------------------------
   625D                      88 _interrupcion::
                             89 ;src/main.c:51: if (++kk == 5) {
   625D 21 8A 85      [10]   90 	ld	hl, #_interrupcion_kk_1_84+0
   6260 34            [11]   91 	inc	(hl)
   6261 3A 8A 85      [13]   92 	ld	a,(#_interrupcion_kk_1_84 + 0)
   6264 D6 05         [ 7]   93 	sub	a, #0x05
   6266 C0            [11]   94 	ret	NZ
                             95 ;src/main.c:52: playmusic();
   6267 CD 4D 62      [17]   96 	call	_playmusic
                             97 ;src/main.c:53: cpct_scanKeyboard_if();
   626A CD 4E 70      [17]   98 	call	_cpct_scanKeyboard_if
                             99 ;src/main.c:54: kk = 0;
   626D 21 8A 85      [10]  100 	ld	hl,#_interrupcion_kk_1_84 + 0
   6270 36 00         [10]  101 	ld	(hl), #0x00
   6272 C9            [10]  102 	ret
                            103 ;src/main.c:57: void inicializar(){
                            104 ;	---------------------------------
                            105 ; Function inicializar
                            106 ; ---------------------------------
   6273                     107 _inicializar::
                            108 ;src/main.c:58: cpct_disableFirmware();
   6273 CD EA 70      [17]  109 	call	_cpct_disableFirmware
                            110 ;src/main.c:59: cpct_setBorder(HW_BLACK);
   6276 21 10 14      [10]  111 	ld	hl,#0x1410
   6279 E5            [11]  112 	push	hl
   627A CD 3F 6D      [17]  113 	call	_cpct_setPALColour
                            114 ;src/main.c:60: cpct_setPalette(g_palette,16);
   627D 21 10 00      [10]  115 	ld	hl,#0x0010
   6280 E5            [11]  116 	push	hl
   6281 21 E8 56      [10]  117 	ld	hl,#_g_palette
   6284 E5            [11]  118 	push	hl
   6285 CD B2 6C      [17]  119 	call	_cpct_setPalette
                            120 ;src/main.c:63: cpct_setVideoMode(0);
   6288 2E 00         [ 7]  121 	ld	l,#0x00
   628A CD B6 70      [17]  122 	call	_cpct_setVideoMode
   628D C9            [10]  123 	ret
                            124 ;src/main.c:69: void menu(){
                            125 ;	---------------------------------
                            126 ; Function menu
                            127 ; ---------------------------------
   628E                     128 _menu::
                            129 ;src/main.c:72: cpct_clearScreen(0);
   628E 21 00 40      [10]  130 	ld	hl,#0x4000
   6291 E5            [11]  131 	push	hl
   6292 AF            [ 4]  132 	xor	a, a
   6293 F5            [11]  133 	push	af
   6294 33            [ 6]  134 	inc	sp
   6295 26 C0         [ 7]  135 	ld	h, #0xC0
   6297 E5            [11]  136 	push	hl
   6298 CD DC 70      [17]  137 	call	_cpct_memset
                            138 ;src/main.c:73: cpct_drawSprite (g_flores1_0,
   629B 21 28 0A      [10]  139 	ld	hl,#0x0A28
   629E E5            [11]  140 	push	hl
   629F 21 00 C0      [10]  141 	ld	hl,#0xC000
   62A2 E5            [11]  142 	push	hl
   62A3 21 70 3B      [10]  143 	ld	hl,#_g_flores1_0
   62A6 E5            [11]  144 	push	hl
   62A7 CD 6F 6D      [17]  145 	call	_cpct_drawSprite
                            146 ;src/main.c:76: cpct_drawSprite (g_flores1_1,
   62AA 21 28 0A      [10]  147 	ld	hl,#0x0A28
   62AD E5            [11]  148 	push	hl
   62AE 26 C0         [ 7]  149 	ld	h, #0xC0
   62B0 E5            [11]  150 	push	hl
   62B1 21 00 3D      [10]  151 	ld	hl,#_g_flores1_1
   62B4 E5            [11]  152 	push	hl
   62B5 CD 6F 6D      [17]  153 	call	_cpct_drawSprite
                            154 ;src/main.c:80: cpct_drawSprite (g_flores2_0,
   62B8 21 28 0A      [10]  155 	ld	hl,#0x0A28
   62BB E5            [11]  156 	push	hl
   62BC 21 E0 E6      [10]  157 	ld	hl,#0xE6E0
   62BF E5            [11]  158 	push	hl
   62C0 21 50 38      [10]  159 	ld	hl,#_g_flores2_0
   62C3 E5            [11]  160 	push	hl
   62C4 CD 6F 6D      [17]  161 	call	_cpct_drawSprite
                            162 ;src/main.c:83: cpct_drawSprite (g_flores2_1,
   62C7 21 28 0A      [10]  163 	ld	hl,#0x0A28
   62CA E5            [11]  164 	push	hl
   62CB 21 08 E7      [10]  165 	ld	hl,#0xE708
   62CE E5            [11]  166 	push	hl
   62CF 21 E0 39      [10]  167 	ld	hl,#_g_flores2_1
   62D2 E5            [11]  168 	push	hl
   62D3 CD 6F 6D      [17]  169 	call	_cpct_drawSprite
                            170 ;src/main.c:87: cpct_drawSprite (g_portada_0,
   62D6 21 28 42      [10]  171 	ld	hl,#0x4228
   62D9 E5            [11]  172 	push	hl
   62DA 21 50 D0      [10]  173 	ld	hl,#0xD050
   62DD E5            [11]  174 	push	hl
   62DE 21 90 3E      [10]  175 	ld	hl,#_g_portada_0
   62E1 E5            [11]  176 	push	hl
   62E2 CD 6F 6D      [17]  177 	call	_cpct_drawSprite
                            178 ;src/main.c:90: cpct_drawSprite (g_portada_1,
   62E5 21 28 42      [10]  179 	ld	hl,#0x4228
   62E8 E5            [11]  180 	push	hl
   62E9 21 78 D0      [10]  181 	ld	hl,#0xD078
   62EC E5            [11]  182 	push	hl
   62ED 21 E0 48      [10]  183 	ld	hl,#_g_portada_1
   62F0 E5            [11]  184 	push	hl
   62F1 CD 6F 6D      [17]  185 	call	_cpct_drawSprite
                            186 ;src/main.c:94: cpct_drawStringM0("PULSA INTRO", cpct_getScreenPtr(CPCT_VMEM_START, 17, 160), 6, 0);
   62F4 21 11 A0      [10]  187 	ld	hl,#0xA011
   62F7 E5            [11]  188 	push	hl
   62F8 21 00 C0      [10]  189 	ld	hl,#0xC000
   62FB E5            [11]  190 	push	hl
   62FC CD 38 7A      [17]  191 	call	_cpct_getScreenPtr
   62FF 4D            [ 4]  192 	ld	c,l
   6300 44            [ 4]  193 	ld	b,h
   6301 21 06 00      [10]  194 	ld	hl,#0x0006
   6304 E5            [11]  195 	push	hl
   6305 C5            [11]  196 	push	bc
   6306 21 49 63      [10]  197 	ld	hl,#___str_0
   6309 E5            [11]  198 	push	hl
   630A CD 4B 6D      [17]  199 	call	_cpct_drawStringM0
   630D 21 06 00      [10]  200 	ld	hl,#6
   6310 39            [11]  201 	add	hl,sp
   6311 F9            [ 6]  202 	ld	sp,hl
                            203 ;src/main.c:95: if(player.vida == 0){
   6312 3A 21 59      [13]  204 	ld	a, (#(_player + 0x0049) + 0)
   6315 B7            [ 4]  205 	or	a, a
   6316 20 1E         [12]  206 	jr	NZ,00103$
                            207 ;src/main.c:96: cpct_drawStringM0("GAME OVER", cpct_getScreenPtr(CPCT_VMEM_START, 20, 110), 3, 0);
   6318 21 14 6E      [10]  208 	ld	hl,#0x6E14
   631B E5            [11]  209 	push	hl
   631C 21 00 C0      [10]  210 	ld	hl,#0xC000
   631F E5            [11]  211 	push	hl
   6320 CD 38 7A      [17]  212 	call	_cpct_getScreenPtr
   6323 4D            [ 4]  213 	ld	c,l
   6324 44            [ 4]  214 	ld	b,h
   6325 21 03 00      [10]  215 	ld	hl,#0x0003
   6328 E5            [11]  216 	push	hl
   6329 C5            [11]  217 	push	bc
   632A 21 55 63      [10]  218 	ld	hl,#___str_1
   632D E5            [11]  219 	push	hl
   632E CD 4B 6D      [17]  220 	call	_cpct_drawStringM0
   6331 21 06 00      [10]  221 	ld	hl,#6
   6334 39            [11]  222 	add	hl,sp
   6335 F9            [ 6]  223 	ld	sp,hl
                            224 ;src/main.c:98: do{
   6336                     225 00103$:
                            226 ;src/main.c:99: cpct_scanKeyboard_f();
   6336 CD C9 6C      [17]  227 	call	_cpct_scanKeyboard_f
                            228 ;src/main.c:100: }while(!cpct_isKeyPressed(Key_Enter));
   6339 21 00 40      [10]  229 	ld	hl,#0x4000
   633C CD 33 6D      [17]  230 	call	_cpct_isKeyPressed
   633F 7D            [ 4]  231 	ld	a,l
   6340 B7            [ 4]  232 	or	a, a
   6341 28 F3         [12]  233 	jr	Z,00103$
                            234 ;src/main.c:101: mostrarMenu = 0;
   6343 21 96 85      [10]  235 	ld	hl,#_mostrarMenu + 0
   6346 36 00         [10]  236 	ld	(hl), #0x00
   6348 C9            [10]  237 	ret
   6349                     238 ___str_0:
   6349 50 55 4C 53 41 20   239 	.ascii "PULSA INTRO"
        49 4E 54 52 4F
   6354 00                  240 	.db 0x00
   6355                     241 ___str_1:
   6355 47 41 4D 45 20 4F   242 	.ascii "GAME OVER"
        56 45 52
   635E 00                  243 	.db 0x00
                            244 ;src/main.c:106: void main(void) {
                            245 ;	---------------------------------
                            246 ; Function main
                            247 ; ---------------------------------
   635F                     248 _main::
                            249 ;src/main.c:108: inicializar();
   635F CD 73 62      [17]  250 	call	_inicializar
                            251 ;src/main.c:111: while (1){
   6362                     252 00104$:
                            253 ;src/main.c:113: if(mostrarMenu % 2 == 0){
   6362 21 96 85      [10]  254 	ld	hl,#_mostrarMenu+0
   6365 CB 46         [12]  255 	bit	0, (hl)
   6367 20 03         [12]  256 	jr	NZ,00102$
                            257 ;src/main.c:114: menu();
   6369 CD 8E 62      [17]  258 	call	_menu
   636C                     259 00102$:
                            260 ;src/main.c:116: play();
   636C CD 08 62      [17]  261 	call	_play
   636F 18 F1         [12]  262 	jr	00104$
                            263 	.area _CODE
                            264 	.area _INITIALIZER
   85A9                     265 __xinit__mostrarMenu:
   85A9 01                  266 	.db #0x01	; 1
                            267 	.area _CABS (ABS)
