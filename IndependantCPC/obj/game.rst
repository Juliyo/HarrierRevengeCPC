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
   4302 CD 91 45      [17]   67 	call	_cpct_memset
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
   430C CD 56 44      [17]   81 	call	_cpct_scanKeyboard_f
                             82 ;src/game.c:26: if(cpct_isKeyPressed(Key_CursorUp)){
   430F 21 00 01      [10]   83 	ld	hl,#0x0100
   4312 CD 4A 44      [17]   84 	call	_cpct_isKeyPressed
   4315 7D            [ 4]   85 	ld	a, l
   4316 B7            [ 4]   86 	or	a, a
   4317 28 0E         [12]   87 	jr	Z,00104$
                             88 ;src/game.c:27: accion(&player, es_mover, d_up);
   4319 21 01 00      [10]   89 	ld	hl,#0x0001
   431C E5            [11]   90 	push	hl
   431D 21 06 43      [10]   91 	ld	hl,#_player
   4320 E5            [11]   92 	push	hl
   4321 CD 80 43      [17]   93 	call	_accion
   4324 F1            [10]   94 	pop	af
   4325 F1            [10]   95 	pop	af
   4326 C9            [10]   96 	ret
   4327                      97 00104$:
                             98 ;src/game.c:28: }else if(cpct_isKeyPressed(Key_CursorDown)){
   4327 21 00 04      [10]   99 	ld	hl,#0x0400
   432A CD 4A 44      [17]  100 	call	_cpct_isKeyPressed
   432D 7D            [ 4]  101 	ld	a,l
   432E B7            [ 4]  102 	or	a, a
   432F C8            [11]  103 	ret	Z
                            104 ;src/game.c:29: accion(&player, es_mover, d_down);
   4330 21 01 01      [10]  105 	ld	hl,#0x0101
   4333 E5            [11]  106 	push	hl
   4334 21 06 43      [10]  107 	ld	hl,#_player
   4337 E5            [11]  108 	push	hl
   4338 CD 80 43      [17]  109 	call	_accion
   433B F1            [10]  110 	pop	af
   433C F1            [10]  111 	pop	af
   433D C9            [10]  112 	ret
                            113 ;src/game.c:35: void play(){
                            114 ;	---------------------------------
                            115 ; Function play
                            116 ; ---------------------------------
   433E                     117 _play::
                            118 ;src/game.c:37: inicializarPantalla();
   433E CD F8 42      [17]  119 	call	_inicializarPantalla
                            120 ;src/game.c:38: incializarEntities();
   4341 CD 7F 43      [17]  121 	call	_incializarEntities
                            122 ;src/game.c:41: while(1){
   4344                     123 00102$:
                            124 ;src/game.c:42: updateUser();	
   4344 CD 0C 43      [17]  125 	call	_updateUser
                            126 ;src/game.c:43: updatePlayer(&player);
   4347 21 06 43      [10]  127 	ld	hl,#_player
   434A E5            [11]  128 	push	hl
   434B CD C2 43      [17]  129 	call	_updatePlayer
   434E F1            [10]  130 	pop	af
                            131 ;src/game.c:45: cpct_waitVSYNC();
   434F CD 89 45      [17]  132 	call	_cpct_waitVSYNC
                            133 ;src/game.c:46: drawAll(&player);
   4352 21 06 43      [10]  134 	ld	hl,#_player
   4355 E5            [11]  135 	push	hl
   4356 CD 29 44      [17]  136 	call	_drawAll
   4359 F1            [10]  137 	pop	af
   435A 18 E8         [12]  138 	jr	00102$
                            139 	.area _CODE
                            140 	.area _INITIALIZER
                            141 	.area _CABS (ABS)
