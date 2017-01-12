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
                             14 	.globl _play
                             15 	.globl _cpct_getScreenPtr
                             16 	.globl _cpct_setPALColour
                             17 	.globl _cpct_setPalette
                             18 	.globl _cpct_setVideoMode
                             19 	.globl _cpct_drawStringM0
                             20 	.globl _cpct_drawSprite
                             21 	.globl _cpct_isKeyPressed
                             22 	.globl _cpct_scanKeyboard_f
                             23 	.globl _cpct_memset
                             24 	.globl _cpct_disableFirmware
                             25 	.globl _mostrarMenu
                             26 ;--------------------------------------------------------
                             27 ; special function registers
                             28 ;--------------------------------------------------------
                             29 ;--------------------------------------------------------
                             30 ; ram data
                             31 ;--------------------------------------------------------
                             32 	.area _DATA
                             33 ;--------------------------------------------------------
                             34 ; ram data
                             35 ;--------------------------------------------------------
                             36 	.area _INITIALIZED
   7D84                      37 _mostrarMenu::
   7D84                      38 	.ds 1
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
                             59 ;src/main.c:28: void inicializar(){
                             60 ;	---------------------------------
                             61 ; Function inicializar
                             62 ; ---------------------------------
   625D                      63 _inicializar::
                             64 ;src/main.c:29: cpct_disableFirmware();
   625D CD 02 71      [17]   65 	call	_cpct_disableFirmware
                             66 ;src/main.c:30: cpct_setBorder(HW_BLACK);
   6260 21 10 14      [10]   67 	ld	hl,#0x1410
   6263 E5            [11]   68 	push	hl
   6264 CD 57 6D      [17]   69 	call	_cpct_setPALColour
                             70 ;src/main.c:31: cpct_setPalette(g_palette,16);
   6267 21 10 00      [10]   71 	ld	hl,#0x0010
   626A E5            [11]   72 	push	hl
   626B 21 E8 56      [10]   73 	ld	hl,#_g_palette
   626E E5            [11]   74 	push	hl
   626F CD CA 6C      [17]   75 	call	_cpct_setPalette
                             76 ;src/main.c:34: cpct_setVideoMode(0);
   6272 2E 00         [ 7]   77 	ld	l,#0x00
   6274 CD CE 70      [17]   78 	call	_cpct_setVideoMode
   6277 C9            [10]   79 	ret
                             80 ;src/main.c:37: void menu(){
                             81 ;	---------------------------------
                             82 ; Function menu
                             83 ; ---------------------------------
   6278                      84 _menu::
                             85 ;src/main.c:40: cpct_clearScreen(0);
   6278 21 00 40      [10]   86 	ld	hl,#0x4000
   627B E5            [11]   87 	push	hl
   627C AF            [ 4]   88 	xor	a, a
   627D F5            [11]   89 	push	af
   627E 33            [ 6]   90 	inc	sp
   627F 26 C0         [ 7]   91 	ld	h, #0xC0
   6281 E5            [11]   92 	push	hl
   6282 CD F4 70      [17]   93 	call	_cpct_memset
                             94 ;src/main.c:41: cpct_drawSprite (g_flores1_0,
   6285 21 28 0A      [10]   95 	ld	hl,#0x0A28
   6288 E5            [11]   96 	push	hl
   6289 21 00 C0      [10]   97 	ld	hl,#0xC000
   628C E5            [11]   98 	push	hl
   628D 21 70 3B      [10]   99 	ld	hl,#_g_flores1_0
   6290 E5            [11]  100 	push	hl
   6291 CD 87 6D      [17]  101 	call	_cpct_drawSprite
                            102 ;src/main.c:44: cpct_drawSprite (g_flores1_1,
   6294 21 28 0A      [10]  103 	ld	hl,#0x0A28
   6297 E5            [11]  104 	push	hl
   6298 26 C0         [ 7]  105 	ld	h, #0xC0
   629A E5            [11]  106 	push	hl
   629B 21 00 3D      [10]  107 	ld	hl,#_g_flores1_1
   629E E5            [11]  108 	push	hl
   629F CD 87 6D      [17]  109 	call	_cpct_drawSprite
                            110 ;src/main.c:48: cpct_drawSprite (g_flores2_0,
   62A2 21 28 0A      [10]  111 	ld	hl,#0x0A28
   62A5 E5            [11]  112 	push	hl
   62A6 21 E0 E6      [10]  113 	ld	hl,#0xE6E0
   62A9 E5            [11]  114 	push	hl
   62AA 21 50 38      [10]  115 	ld	hl,#_g_flores2_0
   62AD E5            [11]  116 	push	hl
   62AE CD 87 6D      [17]  117 	call	_cpct_drawSprite
                            118 ;src/main.c:51: cpct_drawSprite (g_flores2_1,
   62B1 21 28 0A      [10]  119 	ld	hl,#0x0A28
   62B4 E5            [11]  120 	push	hl
   62B5 21 08 E7      [10]  121 	ld	hl,#0xE708
   62B8 E5            [11]  122 	push	hl
   62B9 21 E0 39      [10]  123 	ld	hl,#_g_flores2_1
   62BC E5            [11]  124 	push	hl
   62BD CD 87 6D      [17]  125 	call	_cpct_drawSprite
                            126 ;src/main.c:55: cpct_drawSprite (g_portada_0,
   62C0 21 28 42      [10]  127 	ld	hl,#0x4228
   62C3 E5            [11]  128 	push	hl
   62C4 21 50 D0      [10]  129 	ld	hl,#0xD050
   62C7 E5            [11]  130 	push	hl
   62C8 21 90 3E      [10]  131 	ld	hl,#_g_portada_0
   62CB E5            [11]  132 	push	hl
   62CC CD 87 6D      [17]  133 	call	_cpct_drawSprite
                            134 ;src/main.c:58: cpct_drawSprite (g_portada_1,
   62CF 21 28 42      [10]  135 	ld	hl,#0x4228
   62D2 E5            [11]  136 	push	hl
   62D3 21 78 D0      [10]  137 	ld	hl,#0xD078
   62D6 E5            [11]  138 	push	hl
   62D7 21 E0 48      [10]  139 	ld	hl,#_g_portada_1
   62DA E5            [11]  140 	push	hl
   62DB CD 87 6D      [17]  141 	call	_cpct_drawSprite
                            142 ;src/main.c:62: cpct_drawStringM0("PRESS ENTER", cpct_getScreenPtr(CPCT_VMEM_START, 17, 160), 6, 0);
   62DE 21 11 A0      [10]  143 	ld	hl,#0xA011
   62E1 E5            [11]  144 	push	hl
   62E2 21 00 C0      [10]  145 	ld	hl,#0xC000
   62E5 E5            [11]  146 	push	hl
   62E6 CD 27 72      [17]  147 	call	_cpct_getScreenPtr
   62E9 4D            [ 4]  148 	ld	c,l
   62EA 44            [ 4]  149 	ld	b,h
   62EB 21 06 00      [10]  150 	ld	hl,#0x0006
   62EE E5            [11]  151 	push	hl
   62EF C5            [11]  152 	push	bc
   62F0 21 58 63      [10]  153 	ld	hl,#___str_0
   62F3 E5            [11]  154 	push	hl
   62F4 CD 63 6D      [17]  155 	call	_cpct_drawStringM0
   62F7 21 06 00      [10]  156 	ld	hl,#6
   62FA 39            [11]  157 	add	hl,sp
   62FB F9            [ 6]  158 	ld	sp,hl
                            159 ;src/main.c:63: if(player.vida == 0){
   62FC 3A 21 59      [13]  160 	ld	a, (#(_player + 0x0049) + 0)
   62FF B7            [ 4]  161 	or	a, a
   6300 20 1E         [12]  162 	jr	NZ,00102$
                            163 ;src/main.c:64: cpct_drawStringM0("GAME OVER", cpct_getScreenPtr(CPCT_VMEM_START, 20, 110), 3, 0);
   6302 21 14 6E      [10]  164 	ld	hl,#0x6E14
   6305 E5            [11]  165 	push	hl
   6306 21 00 C0      [10]  166 	ld	hl,#0xC000
   6309 E5            [11]  167 	push	hl
   630A CD 27 72      [17]  168 	call	_cpct_getScreenPtr
   630D 4D            [ 4]  169 	ld	c,l
   630E 44            [ 4]  170 	ld	b,h
   630F 21 03 00      [10]  171 	ld	hl,#0x0003
   6312 E5            [11]  172 	push	hl
   6313 C5            [11]  173 	push	bc
   6314 21 64 63      [10]  174 	ld	hl,#___str_1
   6317 E5            [11]  175 	push	hl
   6318 CD 63 6D      [17]  176 	call	_cpct_drawStringM0
   631B 21 06 00      [10]  177 	ld	hl,#6
   631E 39            [11]  178 	add	hl,sp
   631F F9            [ 6]  179 	ld	sp,hl
   6320                     180 00102$:
                            181 ;src/main.c:66: if(basesCapturadas == 6){
   6320 3A 80 7D      [13]  182 	ld	a,(#_basesCapturadas + 0)
   6323 D6 06         [ 7]  183 	sub	a, #0x06
   6325 20 1E         [12]  184 	jr	NZ,00105$
                            185 ;src/main.c:67: cpct_drawStringM0("YOU WON!", cpct_getScreenPtr(CPCT_VMEM_START, 20, 110), 3, 0);
   6327 21 14 6E      [10]  186 	ld	hl,#0x6E14
   632A E5            [11]  187 	push	hl
   632B 21 00 C0      [10]  188 	ld	hl,#0xC000
   632E E5            [11]  189 	push	hl
   632F CD 27 72      [17]  190 	call	_cpct_getScreenPtr
   6332 4D            [ 4]  191 	ld	c,l
   6333 44            [ 4]  192 	ld	b,h
   6334 21 03 00      [10]  193 	ld	hl,#0x0003
   6337 E5            [11]  194 	push	hl
   6338 C5            [11]  195 	push	bc
   6339 21 6E 63      [10]  196 	ld	hl,#___str_2
   633C E5            [11]  197 	push	hl
   633D CD 63 6D      [17]  198 	call	_cpct_drawStringM0
   6340 21 06 00      [10]  199 	ld	hl,#6
   6343 39            [11]  200 	add	hl,sp
   6344 F9            [ 6]  201 	ld	sp,hl
                            202 ;src/main.c:69: do{
   6345                     203 00105$:
                            204 ;src/main.c:70: cpct_scanKeyboard_f();
   6345 CD E1 6C      [17]  205 	call	_cpct_scanKeyboard_f
                            206 ;src/main.c:71: }while(!cpct_isKeyPressed(Key_Enter));
   6348 21 00 40      [10]  207 	ld	hl,#0x4000
   634B CD 4B 6D      [17]  208 	call	_cpct_isKeyPressed
   634E 7D            [ 4]  209 	ld	a,l
   634F B7            [ 4]  210 	or	a, a
   6350 28 F3         [12]  211 	jr	Z,00105$
                            212 ;src/main.c:72: mostrarMenu = 0;
   6352 21 84 7D      [10]  213 	ld	hl,#_mostrarMenu + 0
   6355 36 00         [10]  214 	ld	(hl), #0x00
   6357 C9            [10]  215 	ret
   6358                     216 ___str_0:
   6358 50 52 45 53 53 20   217 	.ascii "PRESS ENTER"
        45 4E 54 45 52
   6363 00                  218 	.db 0x00
   6364                     219 ___str_1:
   6364 47 41 4D 45 20 4F   220 	.ascii "GAME OVER"
        56 45 52
   636D 00                  221 	.db 0x00
   636E                     222 ___str_2:
   636E 59 4F 55 20 57 4F   223 	.ascii "YOU WON!"
        4E 21
   6376 00                  224 	.db 0x00
                            225 ;src/main.c:77: void main(void) {
                            226 ;	---------------------------------
                            227 ; Function main
                            228 ; ---------------------------------
   6377                     229 _main::
                            230 ;src/main.c:79: inicializar();
   6377 CD 5D 62      [17]  231 	call	_inicializar
                            232 ;src/main.c:82: while (1){
   637A                     233 00104$:
                            234 ;src/main.c:83: if(mostrarMenu % 2 == 0){
   637A 21 84 7D      [10]  235 	ld	hl,#_mostrarMenu+0
   637D CB 46         [12]  236 	bit	0, (hl)
   637F 20 03         [12]  237 	jr	NZ,00102$
                            238 ;src/main.c:84: menu();
   6381 CD 78 62      [17]  239 	call	_menu
   6384                     240 00102$:
                            241 ;src/main.c:86: play();
   6384 CD 0B 62      [17]  242 	call	_play
   6387 18 F1         [12]  243 	jr	00104$
                            244 	.area _CODE
                            245 	.area _INITIALIZER
   7D97                     246 __xinit__mostrarMenu:
   7D97 01                  247 	.db #0x01	; 1
                            248 	.area _CABS (ABS)
