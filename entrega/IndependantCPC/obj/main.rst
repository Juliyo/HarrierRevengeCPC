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
                             17 	.globl _cpct_akp_musicPlay
                             18 	.globl _cpct_akp_musicInit
                             19 	.globl _cpct_getScreenPtr
                             20 	.globl _cpct_setPALColour
                             21 	.globl _cpct_setPalette
                             22 	.globl _cpct_setVideoMode
                             23 	.globl _cpct_drawStringM0
                             24 	.globl _cpct_drawSprite
                             25 	.globl _cpct_isKeyPressed
                             26 	.globl _cpct_scanKeyboard_if
                             27 	.globl _cpct_scanKeyboard_f
                             28 	.globl _cpct_memset
                             29 	.globl _cpct_setInterruptHandler
                             30 	.globl _cpct_disableFirmware
                             31 	.globl _mostrarMenu
                             32 ;--------------------------------------------------------
                             33 ; special function registers
                             34 ;--------------------------------------------------------
                             35 ;--------------------------------------------------------
                             36 ; ram data
                             37 ;--------------------------------------------------------
                             38 	.area _DATA
   85FE                      39 _interrupcion_kk_1_84:
   85FE                      40 	.ds 1
                             41 ;--------------------------------------------------------
                             42 ; ram data
                             43 ;--------------------------------------------------------
                             44 	.area _INITIALIZED
   860A                      45 _mostrarMenu::
   860A                      46 	.ds 1
                             47 ;--------------------------------------------------------
                             48 ; absolute external ram data
                             49 ;--------------------------------------------------------
                             50 	.area _DABS (ABS)
                             51 ;--------------------------------------------------------
                             52 ; global & static initialisations
                             53 ;--------------------------------------------------------
                             54 	.area _HOME
                             55 	.area _GSINIT
                             56 	.area _GSFINAL
                             57 	.area _GSINIT
                             58 ;--------------------------------------------------------
                             59 ; Home
                             60 ;--------------------------------------------------------
                             61 	.area _HOME
                             62 	.area _HOME
                             63 ;--------------------------------------------------------
                             64 ; code
                             65 ;--------------------------------------------------------
                             66 	.area _CODE
                             67 ;src/main.c:30: void playmusic() {
                             68 ;	---------------------------------
                             69 ; Function playmusic
                             70 ; ---------------------------------
   625A                      71 _playmusic::
                             72 ;src/main.c:45: __endasm;
   625A D9            [ 4]   73 	exx
   625B 08                   74 	.db	#0x08
   625C F5            [11]   75 	push	af
   625D C5            [11]   76 	push	bc
   625E D5            [11]   77 	push	de
   625F E5            [11]   78 	push	hl
   6260 CD 38 71      [17]   79 	call	_cpct_akp_musicPlay
   6263 E1            [10]   80 	pop	hl
   6264 D1            [10]   81 	pop	de
   6265 C1            [10]   82 	pop	bc
   6266 F1            [10]   83 	pop	af
   6267 08                   84 	.db	#0x08
   6268 D9            [ 4]   85 	exx
   6269 C9            [10]   86 	ret
                             87 ;src/main.c:48: void interrupcion() {
                             88 ;	---------------------------------
                             89 ; Function interrupcion
                             90 ; ---------------------------------
   626A                      91 _interrupcion::
                             92 ;src/main.c:51: if (++kk == 5) {
   626A 21 FE 85      [10]   93 	ld	hl, #_interrupcion_kk_1_84+0
   626D 34            [11]   94 	inc	(hl)
   626E 3A FE 85      [13]   95 	ld	a,(#_interrupcion_kk_1_84 + 0)
   6271 D6 05         [ 7]   96 	sub	a, #0x05
   6273 C0            [11]   97 	ret	NZ
                             98 ;src/main.c:52: playmusic();
   6274 CD 5A 62      [17]   99 	call	_playmusic
                            100 ;src/main.c:53: cpct_scanKeyboard_if();
   6277 CD 9A 70      [17]  101 	call	_cpct_scanKeyboard_if
                            102 ;src/main.c:54: kk = 0;
   627A 21 FE 85      [10]  103 	ld	hl,#_interrupcion_kk_1_84 + 0
   627D 36 00         [10]  104 	ld	(hl), #0x00
   627F C9            [10]  105 	ret
                            106 ;src/main.c:57: void inicializar(){
                            107 ;	---------------------------------
                            108 ; Function inicializar
                            109 ; ---------------------------------
   6280                     110 _inicializar::
                            111 ;src/main.c:58: cpct_disableFirmware();
   6280 CD 5F 79      [17]  112 	call	_cpct_disableFirmware
                            113 ;src/main.c:59: cpct_setBorder(HW_BLACK);
   6283 21 10 14      [10]  114 	ld	hl,#0x1410
   6286 E5            [11]  115 	push	hl
   6287 CD 8B 6D      [17]  116 	call	_cpct_setPALColour
                            117 ;src/main.c:60: cpct_setPalette(g_palette,16);
   628A 21 10 00      [10]  118 	ld	hl,#0x0010
   628D E5            [11]  119 	push	hl
   628E 21 E8 56      [10]  120 	ld	hl,#_g_palette
   6291 E5            [11]  121 	push	hl
   6292 CD FE 6C      [17]  122 	call	_cpct_setPalette
                            123 ;src/main.c:63: cpct_setVideoMode(0);
   6295 2E 00         [ 7]  124 	ld	l,#0x00
   6297 CD 02 71      [17]  125 	call	_cpct_setVideoMode
                            126 ;src/main.c:65: cpct_akp_musicInit(g_mysong);    // Initialize the music
   629A 21 00 02      [10]  127 	ld	hl,#_g_mysong
   629D E5            [11]  128 	push	hl
   629E CD 3B 78      [17]  129 	call	_cpct_akp_musicInit
   62A1 F1            [10]  130 	pop	af
                            131 ;src/main.c:66: cpct_setInterruptHandler(interrupcion);
   62A2 21 6A 62      [10]  132 	ld	hl,#_interrupcion
   62A5 CD A4 7A      [17]  133 	call	_cpct_setInterruptHandler
   62A8 C9            [10]  134 	ret
                            135 ;src/main.c:69: void menu(){
                            136 ;	---------------------------------
                            137 ; Function menu
                            138 ; ---------------------------------
   62A9                     139 _menu::
                            140 ;src/main.c:72: cpct_clearScreen(0);
   62A9 21 00 40      [10]  141 	ld	hl,#0x4000
   62AC E5            [11]  142 	push	hl
   62AD AF            [ 4]  143 	xor	a, a
   62AE F5            [11]  144 	push	af
   62AF 33            [ 6]  145 	inc	sp
   62B0 26 C0         [ 7]  146 	ld	h, #0xC0
   62B2 E5            [11]  147 	push	hl
   62B3 CD 28 71      [17]  148 	call	_cpct_memset
                            149 ;src/main.c:73: cpct_drawSprite (g_flores1_0,
   62B6 21 28 0A      [10]  150 	ld	hl,#0x0A28
   62B9 E5            [11]  151 	push	hl
   62BA 21 00 C0      [10]  152 	ld	hl,#0xC000
   62BD E5            [11]  153 	push	hl
   62BE 21 70 3B      [10]  154 	ld	hl,#_g_flores1_0
   62C1 E5            [11]  155 	push	hl
   62C2 CD BB 6D      [17]  156 	call	_cpct_drawSprite
                            157 ;src/main.c:76: cpct_drawSprite (g_flores1_1,
   62C5 21 28 0A      [10]  158 	ld	hl,#0x0A28
   62C8 E5            [11]  159 	push	hl
   62C9 26 C0         [ 7]  160 	ld	h, #0xC0
   62CB E5            [11]  161 	push	hl
   62CC 21 00 3D      [10]  162 	ld	hl,#_g_flores1_1
   62CF E5            [11]  163 	push	hl
   62D0 CD BB 6D      [17]  164 	call	_cpct_drawSprite
                            165 ;src/main.c:80: cpct_drawSprite (g_flores2_0,
   62D3 21 28 0A      [10]  166 	ld	hl,#0x0A28
   62D6 E5            [11]  167 	push	hl
   62D7 21 E0 E6      [10]  168 	ld	hl,#0xE6E0
   62DA E5            [11]  169 	push	hl
   62DB 21 50 38      [10]  170 	ld	hl,#_g_flores2_0
   62DE E5            [11]  171 	push	hl
   62DF CD BB 6D      [17]  172 	call	_cpct_drawSprite
                            173 ;src/main.c:83: cpct_drawSprite (g_flores2_1,
   62E2 21 28 0A      [10]  174 	ld	hl,#0x0A28
   62E5 E5            [11]  175 	push	hl
   62E6 21 08 E7      [10]  176 	ld	hl,#0xE708
   62E9 E5            [11]  177 	push	hl
   62EA 21 E0 39      [10]  178 	ld	hl,#_g_flores2_1
   62ED E5            [11]  179 	push	hl
   62EE CD BB 6D      [17]  180 	call	_cpct_drawSprite
                            181 ;src/main.c:87: cpct_drawSprite (g_portada_0,
   62F1 21 28 42      [10]  182 	ld	hl,#0x4228
   62F4 E5            [11]  183 	push	hl
   62F5 21 50 D0      [10]  184 	ld	hl,#0xD050
   62F8 E5            [11]  185 	push	hl
   62F9 21 90 3E      [10]  186 	ld	hl,#_g_portada_0
   62FC E5            [11]  187 	push	hl
   62FD CD BB 6D      [17]  188 	call	_cpct_drawSprite
                            189 ;src/main.c:90: cpct_drawSprite (g_portada_1,
   6300 21 28 42      [10]  190 	ld	hl,#0x4228
   6303 E5            [11]  191 	push	hl
   6304 21 78 D0      [10]  192 	ld	hl,#0xD078
   6307 E5            [11]  193 	push	hl
   6308 21 E0 48      [10]  194 	ld	hl,#_g_portada_1
   630B E5            [11]  195 	push	hl
   630C CD BB 6D      [17]  196 	call	_cpct_drawSprite
                            197 ;src/main.c:94: cpct_drawStringM0("PRESS ENTER", cpct_getScreenPtr(CPCT_VMEM_START, 17, 160), 6, 0);
   630F 21 11 A0      [10]  198 	ld	hl,#0xA011
   6312 E5            [11]  199 	push	hl
   6313 21 00 C0      [10]  200 	ld	hl,#0xC000
   6316 E5            [11]  201 	push	hl
   6317 CD 84 7A      [17]  202 	call	_cpct_getScreenPtr
   631A 4D            [ 4]  203 	ld	c,l
   631B 44            [ 4]  204 	ld	b,h
   631C 21 06 00      [10]  205 	ld	hl,#0x0006
   631F E5            [11]  206 	push	hl
   6320 C5            [11]  207 	push	bc
   6321 21 89 63      [10]  208 	ld	hl,#___str_0
   6324 E5            [11]  209 	push	hl
   6325 CD 97 6D      [17]  210 	call	_cpct_drawStringM0
   6328 21 06 00      [10]  211 	ld	hl,#6
   632B 39            [11]  212 	add	hl,sp
   632C F9            [ 6]  213 	ld	sp,hl
                            214 ;src/main.c:95: if(player.vida == 0){
   632D 3A 21 59      [13]  215 	ld	a, (#(_player + 0x0049) + 0)
   6330 B7            [ 4]  216 	or	a, a
   6331 20 1E         [12]  217 	jr	NZ,00102$
                            218 ;src/main.c:96: cpct_drawStringM0("GAME OVER", cpct_getScreenPtr(CPCT_VMEM_START, 20, 110), 3, 0);
   6333 21 14 6E      [10]  219 	ld	hl,#0x6E14
   6336 E5            [11]  220 	push	hl
   6337 21 00 C0      [10]  221 	ld	hl,#0xC000
   633A E5            [11]  222 	push	hl
   633B CD 84 7A      [17]  223 	call	_cpct_getScreenPtr
   633E 4D            [ 4]  224 	ld	c,l
   633F 44            [ 4]  225 	ld	b,h
   6340 21 03 00      [10]  226 	ld	hl,#0x0003
   6343 E5            [11]  227 	push	hl
   6344 C5            [11]  228 	push	bc
   6345 21 95 63      [10]  229 	ld	hl,#___str_1
   6348 E5            [11]  230 	push	hl
   6349 CD 97 6D      [17]  231 	call	_cpct_drawStringM0
   634C 21 06 00      [10]  232 	ld	hl,#6
   634F 39            [11]  233 	add	hl,sp
   6350 F9            [ 6]  234 	ld	sp,hl
   6351                     235 00102$:
                            236 ;src/main.c:98: if(basesCapturadas == 6){
   6351 3A 06 86      [13]  237 	ld	a,(#_basesCapturadas + 0)
   6354 D6 06         [ 7]  238 	sub	a, #0x06
   6356 20 1E         [12]  239 	jr	NZ,00105$
                            240 ;src/main.c:99: cpct_drawStringM0("YOU WON!", cpct_getScreenPtr(CPCT_VMEM_START, 24, 110), 3, 0);
   6358 21 18 6E      [10]  241 	ld	hl,#0x6E18
   635B E5            [11]  242 	push	hl
   635C 21 00 C0      [10]  243 	ld	hl,#0xC000
   635F E5            [11]  244 	push	hl
   6360 CD 84 7A      [17]  245 	call	_cpct_getScreenPtr
   6363 4D            [ 4]  246 	ld	c,l
   6364 44            [ 4]  247 	ld	b,h
   6365 21 03 00      [10]  248 	ld	hl,#0x0003
   6368 E5            [11]  249 	push	hl
   6369 C5            [11]  250 	push	bc
   636A 21 9F 63      [10]  251 	ld	hl,#___str_2
   636D E5            [11]  252 	push	hl
   636E CD 97 6D      [17]  253 	call	_cpct_drawStringM0
   6371 21 06 00      [10]  254 	ld	hl,#6
   6374 39            [11]  255 	add	hl,sp
   6375 F9            [ 6]  256 	ld	sp,hl
                            257 ;src/main.c:101: do{
   6376                     258 00105$:
                            259 ;src/main.c:102: cpct_scanKeyboard_f();
   6376 CD 15 6D      [17]  260 	call	_cpct_scanKeyboard_f
                            261 ;src/main.c:103: }while(!cpct_isKeyPressed(Key_Enter));
   6379 21 00 40      [10]  262 	ld	hl,#0x4000
   637C CD 7F 6D      [17]  263 	call	_cpct_isKeyPressed
   637F 7D            [ 4]  264 	ld	a,l
   6380 B7            [ 4]  265 	or	a, a
   6381 28 F3         [12]  266 	jr	Z,00105$
                            267 ;src/main.c:104: mostrarMenu = 0;
   6383 21 0A 86      [10]  268 	ld	hl,#_mostrarMenu + 0
   6386 36 00         [10]  269 	ld	(hl), #0x00
   6388 C9            [10]  270 	ret
   6389                     271 ___str_0:
   6389 50 52 45 53 53 20   272 	.ascii "PRESS ENTER"
        45 4E 54 45 52
   6394 00                  273 	.db 0x00
   6395                     274 ___str_1:
   6395 47 41 4D 45 20 4F   275 	.ascii "GAME OVER"
        56 45 52
   639E 00                  276 	.db 0x00
   639F                     277 ___str_2:
   639F 59 4F 55 20 57 4F   278 	.ascii "YOU WON!"
        4E 21
   63A7 00                  279 	.db 0x00
                            280 ;src/main.c:109: void main(void) {
                            281 ;	---------------------------------
                            282 ; Function main
                            283 ; ---------------------------------
   63A8                     284 _main::
                            285 ;src/main.c:111: inicializar();
   63A8 CD 80 62      [17]  286 	call	_inicializar
                            287 ;src/main.c:114: while (1){
   63AB                     288 00104$:
                            289 ;src/main.c:115: cpct_akp_musicPlay();
   63AB CD 38 71      [17]  290 	call	_cpct_akp_musicPlay
                            291 ;src/main.c:116: if(mostrarMenu % 2 == 0){
   63AE 21 0A 86      [10]  292 	ld	hl,#_mostrarMenu+0
   63B1 CB 46         [12]  293 	bit	0, (hl)
   63B3 20 03         [12]  294 	jr	NZ,00102$
                            295 ;src/main.c:117: menu();
   63B5 CD A9 62      [17]  296 	call	_menu
   63B8                     297 00102$:
                            298 ;src/main.c:119: play();
   63B8 CD 08 62      [17]  299 	call	_play
   63BB 18 EE         [12]  300 	jr	00104$
                            301 	.area _CODE
                            302 	.area _INITIALIZER
   861D                     303 __xinit__mostrarMenu:
   861D 01                  304 	.db #0x01	; 1
                            305 	.area _CABS (ABS)
