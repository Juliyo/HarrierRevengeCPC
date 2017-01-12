;--------------------------------------------------------
; File Created by SDCC : free open source ANSI-C Compiler
; Version 3.5.5 #9498 (Linux)
;--------------------------------------------------------
	.module naveEnemiga3
	.optsdcc -mz80
	
;--------------------------------------------------------
; Public variables in this module
;--------------------------------------------------------
	.globl _g_naveEnemiga3_3
	.globl _g_naveEnemiga3_2
	.globl _g_naveEnemiga3_1
	.globl _g_naveEnemiga3_0
;--------------------------------------------------------
; special function registers
;--------------------------------------------------------
;--------------------------------------------------------
; ram data
;--------------------------------------------------------
	.area _DATA
;--------------------------------------------------------
; ram data
;--------------------------------------------------------
	.area _INITIALIZED
;--------------------------------------------------------
; absolute external ram data
;--------------------------------------------------------
	.area _DABS (ABS)
;--------------------------------------------------------
; global & static initialisations
;--------------------------------------------------------
	.area _HOME
	.area _GSINIT
	.area _GSFINAL
	.area _GSINIT
;--------------------------------------------------------
; Home
;--------------------------------------------------------
	.area _HOME
	.area _HOME
;--------------------------------------------------------
; code
;--------------------------------------------------------
	.area _CODE
	.area _CODE
_g_naveEnemiga3_0:
	.db #0x00	; 0
	.db #0x44	; 68	'D'
	.db #0x88	; 136
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0xBF	; 191
	.db #0x7F	; 127
	.db #0x00	; 0
	.db #0x55	; 85	'U'
	.db #0xBF	; 191
	.db #0x7F	; 127
	.db #0xAA	; 170
	.db #0xFF	; 255
	.db #0x3F	; 63
	.db #0x3F	; 63
	.db #0xFF	; 255
	.db #0xFF	; 255
	.db #0x3F	; 63
	.db #0x3F	; 63
	.db #0xFF	; 255
	.db #0xFF	; 255
	.db #0x15	; 21
	.db #0x2A	; 42
	.db #0xFF	; 255
	.db #0xAA	; 170
	.db #0x15	; 21
	.db #0x2A	; 42
	.db #0x55	; 85	'U'
	.db #0xAA	; 170
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x55	; 85	'U'
_g_naveEnemiga3_1:
	.db #0xFF	; 255
	.db #0xFF	; 255
	.db #0xAA	; 170
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0xFF	; 255
	.db #0xFF	; 255
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x15	; 21
	.db #0x7F	; 127
	.db #0xAA	; 170
	.db #0x15	; 21
	.db #0x3F	; 63
	.db #0x3F	; 63
	.db #0x6E	; 110	'n'
	.db #0x15	; 21
	.db #0x3F	; 63
	.db #0x3F	; 63
	.db #0x6E	; 110	'n'
	.db #0x00	; 0
	.db #0x15	; 21
	.db #0x7F	; 127
	.db #0xAA	; 170
	.db #0x00	; 0
	.db #0xFF	; 255
	.db #0xFF	; 255
	.db #0x00	; 0
	.db #0xFF	; 255
	.db #0xFF	; 255
	.db #0xAA	; 170
	.db #0x00	; 0
_g_naveEnemiga3_2:
	.db #0xAA	; 170
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x55	; 85	'U'
	.db #0xAA	; 170
	.db #0x15	; 21
	.db #0x2A	; 42
	.db #0x55	; 85	'U'
	.db #0xFF	; 255
	.db #0x15	; 21
	.db #0x2A	; 42
	.db #0xFF	; 255
	.db #0xFF	; 255
	.db #0x3F	; 63
	.db #0x3F	; 63
	.db #0xFF	; 255
	.db #0xFF	; 255
	.db #0x3F	; 63
	.db #0x3F	; 63
	.db #0xFF	; 255
	.db #0x55	; 85	'U'
	.db #0xBF	; 191
	.db #0x7F	; 127
	.db #0xAA	; 170
	.db #0x00	; 0
	.db #0xBF	; 191
	.db #0x7F	; 127
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x44	; 68	'D'
	.db #0x88	; 136
	.db #0x00	; 0
_g_naveEnemiga3_3:
	.db #0x00	; 0
	.db #0x55	; 85	'U'
	.db #0xFF	; 255
	.db #0xFF	; 255
	.db #0x00	; 0
	.db #0xFF	; 255
	.db #0xFF	; 255
	.db #0x00	; 0
	.db #0x55	; 85	'U'
	.db #0xBF	; 191
	.db #0x2A	; 42
	.db #0x00	; 0
	.db #0x9D	; 157
	.db #0x3F	; 63
	.db #0x3F	; 63
	.db #0x2A	; 42
	.db #0x9D	; 157
	.db #0x3F	; 63
	.db #0x3F	; 63
	.db #0x2A	; 42
	.db #0x55	; 85	'U'
	.db #0xBF	; 191
	.db #0x2A	; 42
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0xFF	; 255
	.db #0xFF	; 255
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x55	; 85	'U'
	.db #0xFF	; 255
	.db #0xFF	; 255
	.area _INITIALIZER
	.area _CABS (ABS)
