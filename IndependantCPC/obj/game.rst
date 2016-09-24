                              1 ;--------------------------------------------------------
                              2 ; File Created by SDCC : free open source ANSI-C Compiler
                              3 ; Version 3.5.5 #9498 (Linux)
                              4 ;--------------------------------------------------------
                              5 	.module game
                              6 	.optsdcc -mz80
                              7 	
                              8 ;--------------------------------------------------------
                              9 ; Public variables in this module
                             10 ;--------------------------------------------------------
                             11 	.globl _drawAll
                             12 	.globl _updatePlayer
                             13 	.globl _accion
                             14 	.globl _incializarEntities
                             15 	.globl _cpct_waitVSYNC
                             16 	.globl _cpct_isKeyPressed
                             17 	.globl _cpct_scanKeyboard_f
                             18 	.globl _cpct_memset
                             19 	.globl _player
                             20 	.globl _inicializarPantalla
                             21 	.globl _updateUser
                             22 	.globl _play
                             23 ;--------------------------------------------------------
                             24 ; special function registers
                             25 ;--------------------------------------------------------
                             26 ;--------------------------------------------------------
                             27 ; ram data
                             28 ;--------------------------------------------------------
                             29 	.area _DATA
                             30 ;--------------------------------------------------------
                             31 ; ram data
                             32 ;--------------------------------------------------------
                             33 	.area _INITIALIZED
                             34 ;--------------------------------------------------------
                             35 ; absolute external ram data
                             36 ;--------------------------------------------------------
                             37 	.area _DABS (ABS)
                             38 ;--------------------------------------------------------
                             39 ; global & static initialisations
                             40 ;--------------------------------------------------------
                             41 	.area _HOME
                             42 	.area _GSINIT
                             43 	.area _GSFINAL
                             44 	.area _GSINIT
                             45 ;--------------------------------------------------------
                             46 ; Home
                             47 ;--------------------------------------------------------
                             48 	.area _HOME
                             49 	.area _HOME
                             50 ;--------------------------------------------------------
                             51 ; code
                             52 ;--------------------------------------------------------
                             53 	.area _CODE
                             54 ;src/game.c:15: void inicializarPantalla(){
                             55 ;	---------------------------------
                             56 ; Function inicializarPantalla
                             57 ; ---------------------------------
   42F8                      58 _inicializarPantalla::
                             59 ;src/game.c:17: cpct_clearScreen(0);
   42F8 21 00 40      [10]   60 	ld	hl,#0x4000
   42FB E5            [11]   61 	push	hl
   42FC AF            [ 4]   62 	xor	a, a
   42FD F5            [11]   63 	push	af
   42FE 33            [ 6]   64 	inc	sp
   42FF 26 C0         [ 7]   65 	ld	h, #0xC0
   4301 E5            [11]   66 	push	hl
   4302 CD 48 46      [17]   67 	call	_cpct_memset
   4305 C9            [10]   68 	ret
   4306                      69 _player:
   4306 64                   70 	.db #0x64	; 100	'd'
   4307 32                   71 	.db #0x32	; 50	'2'
   4308 06                   72 	.byte (_player + 0)
   4309 07                   73 	.byte (_player + 1)
   430A 90 40                74 	.dw _g_naves_1
                             75 ;src/game.c:22: void updateUser(){
                             76 ;	---------------------------------
                             77 ; Function updateUser
                             78 ; ---------------------------------
   430C                      79 _updateUser::
                             80 ;src/game.c:24: cpct_scanKeyboard_f();
   430C CD 0D 45      [17]   81 	call	_cpct_scanKeyboard_f
                             82 ;src/game.c:26: if(cpct_isKeyPressed(Key_CursorUp)){
   430F 21 00 01      [10]   83 	ld	hl,#0x0100
   4312 CD 01 45      [17]   84 	call	_cpct_isKeyPressed
   4315 7D            [ 4]   85 	ld	a, l
   4316 B7            [ 4]   86 	or	a, a
   4317 28 0E         [12]   87 	jr	Z,00110$
                             88 ;src/game.c:27: accion(&player, es_mover, d_up);
   4319 21 01 00      [10]   89 	ld	hl,#0x0001
   431C E5            [11]   90 	push	hl
   431D 21 06 43      [10]   91 	ld	hl,#_player
   4320 E5            [11]   92 	push	hl
   4321 CD B0 43      [17]   93 	call	_accion
   4324 F1            [10]   94 	pop	af
   4325 F1            [10]   95 	pop	af
   4326 C9            [10]   96 	ret
   4327                      97 00110$:
                             98 ;src/game.c:28: }else if(cpct_isKeyPressed(Key_CursorDown)){
   4327 21 00 04      [10]   99 	ld	hl,#0x0400
   432A CD 01 45      [17]  100 	call	_cpct_isKeyPressed
   432D 7D            [ 4]  101 	ld	a,l
   432E B7            [ 4]  102 	or	a, a
   432F 28 0E         [12]  103 	jr	Z,00107$
                            104 ;src/game.c:29: accion(&player, es_mover, d_down);
   4331 21 01 01      [10]  105 	ld	hl,#0x0101
   4334 E5            [11]  106 	push	hl
   4335 21 06 43      [10]  107 	ld	hl,#_player
   4338 E5            [11]  108 	push	hl
   4339 CD B0 43      [17]  109 	call	_accion
   433C F1            [10]  110 	pop	af
   433D F1            [10]  111 	pop	af
   433E C9            [10]  112 	ret
   433F                     113 00107$:
                            114 ;src/game.c:30: }else if(cpct_isKeyPressed(Key_CursorRight)){
   433F 21 00 02      [10]  115 	ld	hl,#0x0200
   4342 CD 01 45      [17]  116 	call	_cpct_isKeyPressed
   4345 7D            [ 4]  117 	ld	a,l
   4346 B7            [ 4]  118 	or	a, a
   4347 28 0E         [12]  119 	jr	Z,00104$
                            120 ;src/game.c:31: accion(&player,es_mover,d_right);
   4349 21 01 02      [10]  121 	ld	hl,#0x0201
   434C E5            [11]  122 	push	hl
   434D 21 06 43      [10]  123 	ld	hl,#_player
   4350 E5            [11]  124 	push	hl
   4351 CD B0 43      [17]  125 	call	_accion
   4354 F1            [10]  126 	pop	af
   4355 F1            [10]  127 	pop	af
   4356 C9            [10]  128 	ret
   4357                     129 00104$:
                            130 ;src/game.c:32: }else if(cpct_isKeyPressed(Key_CursorLeft)){
   4357 21 01 01      [10]  131 	ld	hl,#0x0101
   435A CD 01 45      [17]  132 	call	_cpct_isKeyPressed
   435D 7D            [ 4]  133 	ld	a,l
   435E B7            [ 4]  134 	or	a, a
   435F C8            [11]  135 	ret	Z
                            136 ;src/game.c:33: accion(&player,es_mover,d_left);
   4360 21 01 03      [10]  137 	ld	hl,#0x0301
   4363 E5            [11]  138 	push	hl
   4364 21 06 43      [10]  139 	ld	hl,#_player
   4367 E5            [11]  140 	push	hl
   4368 CD B0 43      [17]  141 	call	_accion
   436B F1            [10]  142 	pop	af
   436C F1            [10]  143 	pop	af
   436D C9            [10]  144 	ret
                            145 ;src/game.c:39: void play(){
                            146 ;	---------------------------------
                            147 ; Function play
                            148 ; ---------------------------------
   436E                     149 _play::
                            150 ;src/game.c:41: inicializarPantalla();
   436E CD F8 42      [17]  151 	call	_inicializarPantalla
                            152 ;src/game.c:42: incializarEntities();
   4371 CD AF 43      [17]  153 	call	_incializarEntities
                            154 ;src/game.c:45: while(1){
   4374                     155 00102$:
                            156 ;src/game.c:46: updateUser();	
   4374 CD 0C 43      [17]  157 	call	_updateUser
                            158 ;src/game.c:47: updatePlayer(&player);
   4377 21 06 43      [10]  159 	ld	hl,#_player
   437A E5            [11]  160 	push	hl
   437B CD 79 44      [17]  161 	call	_updatePlayer
   437E F1            [10]  162 	pop	af
                            163 ;src/game.c:49: cpct_waitVSYNC();
   437F CD 40 46      [17]  164 	call	_cpct_waitVSYNC
                            165 ;src/game.c:50: drawAll(&player);
   4382 21 06 43      [10]  166 	ld	hl,#_player
   4385 E5            [11]  167 	push	hl
   4386 CD E0 44      [17]  168 	call	_drawAll
   4389 F1            [10]  169 	pop	af
   438A 18 E8         [12]  170 	jr	00102$
                            171 	.area _CODE
                            172 	.area _INITIALIZER
                            173 	.area _CABS (ABS)
