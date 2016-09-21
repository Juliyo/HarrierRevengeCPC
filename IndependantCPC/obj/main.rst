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
                             13 	.globl _dibujarPlayer
                             14 	.globl _cpct_getScreenPtr
                             15 	.globl _cpct_setPALColour
                             16 	.globl _cpct_setPalette
                             17 	.globl _cpct_setVideoMode
                             18 	.globl _cpct_drawSprite
                             19 	.globl _cpct_disableFirmware
                             20 	.globl _player
                             21 ;--------------------------------------------------------
                             22 ; special function registers
                             23 ;--------------------------------------------------------
                             24 ;--------------------------------------------------------
                             25 ; ram data
                             26 ;--------------------------------------------------------
                             27 	.area _DATA
   51D5                      28 _player::
   51D5                      29 	.ds 4
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
                             54 ;src/main.c:32: void dibujarPlayer(){
                             55 ;	---------------------------------
                             56 ; Function dibujarPlayer
                             57 ; ---------------------------------
   5078                      58 _dibujarPlayer::
                             59 ;src/main.c:33: u8* vmem = cpct_getScreenPtr(CPCT_VMEM_START,player.x, player.y);
   5078 21 D6 51      [10]   60 	ld	hl, #_player + 1
   507B 56            [ 7]   61 	ld	d,(hl)
   507C 21 D5 51      [10]   62 	ld	hl, #_player + 0
   507F 46            [ 7]   63 	ld	b,(hl)
   5080 D5            [11]   64 	push	de
   5081 33            [ 6]   65 	inc	sp
   5082 C5            [11]   66 	push	bc
   5083 33            [ 6]   67 	inc	sp
   5084 21 00 C0      [10]   68 	ld	hl,#0xC000
   5087 E5            [11]   69 	push	hl
   5088 CD B5 51      [17]   70 	call	_cpct_getScreenPtr
   508B 5D            [ 4]   71 	ld	e,l
   508C 54            [ 4]   72 	ld	d,h
                             73 ;src/main.c:34: cpct_drawSprite(player.sprite,vmem,8,17);
   508D ED 4B D7 51   [20]   74 	ld	bc, (#_player + 2)
   5091 21 08 11      [10]   75 	ld	hl,#0x1108
   5094 E5            [11]   76 	push	hl
   5095 D5            [11]   77 	push	de
   5096 C5            [11]   78 	push	bc
   5097 CD F1 50      [17]   79 	call	_cpct_drawSprite
   509A C9            [10]   80 	ret
                             81 ;src/main.c:37: void inicializar(){
                             82 ;	---------------------------------
                             83 ; Function inicializar
                             84 ; ---------------------------------
   509B                      85 _inicializar::
                             86 ;src/main.c:38: cpct_disableFirmware();
   509B CD A4 51      [17]   87 	call	_cpct_disableFirmware
                             88 ;src/main.c:39: cpct_setVideoMode(0);
   509E 2E 00         [ 7]   89 	ld	l,#0x00
   50A0 CD 96 51      [17]   90 	call	_cpct_setVideoMode
                             91 ;src/main.c:40: cpct_setBorder(HW_BLACK);
   50A3 21 10 14      [10]   92 	ld	hl,#0x1410
   50A6 E5            [11]   93 	push	hl
   50A7 CD E5 50      [17]   94 	call	_cpct_setPALColour
                             95 ;src/main.c:41: cpct_setPalette(g_palette,16);
   50AA 21 10 00      [10]   96 	ld	hl,#0x0010
   50AD E5            [11]   97 	push	hl
   50AE 21 80 4D      [10]   98 	ld	hl,#_g_palette
   50B1 E5            [11]   99 	push	hl
   50B2 CD CE 50      [17]  100 	call	_cpct_setPalette
                            101 ;src/main.c:43: player.x = 100;
   50B5 21 D5 51      [10]  102 	ld	hl,#_player
   50B8 36 64         [10]  103 	ld	(hl),#0x64
                            104 ;src/main.c:44: player.y = 50;
   50BA 21 D6 51      [10]  105 	ld	hl,#(_player + 0x0001)
   50BD 36 32         [10]  106 	ld	(hl),#0x32
                            107 ;src/main.c:45: player.sprite = g_naves_0;
   50BF 21 90 4D      [10]  108 	ld	hl,#_g_naves_0
   50C2 22 D7 51      [16]  109 	ld	((_player + 0x0002)), hl
                            110 ;src/main.c:47: dibujarPlayer();
   50C5 CD 78 50      [17]  111 	call	_dibujarPlayer
   50C8 C9            [10]  112 	ret
                            113 ;src/main.c:51: void main(void) {
                            114 ;	---------------------------------
                            115 ; Function main
                            116 ; ---------------------------------
   50C9                     117 _main::
                            118 ;src/main.c:55: inicializar();
   50C9 CD 9B 50      [17]  119 	call	_inicializar
                            120 ;src/main.c:58: while (1);
   50CC                     121 00102$:
   50CC 18 FE         [12]  122 	jr	00102$
                            123 	.area _CODE
                            124 	.area _INITIALIZER
                            125 	.area _CABS (ABS)
