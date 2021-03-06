;--------------------------------------------------------
; File Created by SDCC : free open source ANSI-C Compiler
; Version 3.5.5 #9498 (Linux)
;--------------------------------------------------------
	.module naves
	.optsdcc -mz80
	
;--------------------------------------------------------
; Public variables in this module
;--------------------------------------------------------
	.globl _g_naves_3
	.globl _g_naves_2
	.globl _g_naves_1
	.globl _g_naves_0
	.globl _g_palette
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
_g_palette:
	.db #0x54	; 84	'T'
	.db #0x44	; 68	'D'
	.db #0x55	; 85	'U'
	.db #0x5C	; 92
	.db #0x4C	; 76	'L'
	.db #0x56	; 86	'V'
	.db #0x57	; 87	'W'
	.db #0x5E	; 94
	.db #0x40	; 64
	.db #0x5F	; 95
	.db #0x4E	; 78	'N'
	.db #0x42	; 66	'B'
	.db #0x53	; 83	'S'
	.db #0x4A	; 74	'J'
	.db #0x43	; 67	'C'
	.db #0x4B	; 75	'K'
_g_naves_0:
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x44	; 68	'D'
	.db #0x88	; 136
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x88	; 136
	.db #0xFF	; 255
	.db #0xFF	; 255
	.db #0x44	; 68	'D'
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0xAA	; 170
	.db #0xEA	; 234
	.db #0xD5	; 213
	.db #0x55	; 85	'U'
	.db #0x00	; 0
	.db #0x55	; 85	'U'
	.db #0x00	; 0
	.db #0xEA	; 234
	.db #0xD5	; 213
	.db #0x00	; 0
	.db #0xAA	; 170
	.db #0x55	; 85	'U'
	.db #0x55	; 85	'U'
	.db #0xFF	; 255
	.db #0xFF	; 255
	.db #0xAA	; 170
	.db #0xAA	; 170
	.db #0x55	; 85	'U'
	.db #0x55	; 85	'U'
	.db #0xC0	; 192
	.db #0xC0	; 192
	.db #0xAA	; 170
	.db #0xAA	; 170
	.db #0x00	; 0
	.db #0xFF	; 255
	.db #0xC0	; 192
	.db #0xC0	; 192
	.db #0xFF	; 255
	.db #0x00	; 0
	.db #0x55	; 85	'U'
	.db #0xD5	; 213
	.db #0xC0	; 192
	.db #0xC0	; 192
	.db #0xEA	; 234
	.db #0xAA	; 170
	.db #0xEA	; 234
	.db #0xD5	; 213
	.db #0xC0	; 192
	.db #0xC0	; 192
	.db #0xEA	; 234
	.db #0xD5	; 213
	.db #0xEA	; 234
	.db #0xD5	; 213
	.db #0xC0	; 192
	.db #0xC0	; 192
	.db #0xEA	; 234
	.db #0xD5	; 213
	.db #0xEA	; 234
	.db #0xAA	; 170
	.db #0xAF	; 175
	.db #0x5F	; 95
	.db #0x55	; 85	'U'
	.db #0xD5	; 213
	.db #0xFF	; 255
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0xFF	; 255
_g_naves_1:
	.db #0xFF	; 255
	.db #0xFF	; 255
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0xEA	; 234
	.db #0xC0	; 192
	.db #0xAA	; 170
	.db #0xFF	; 255
	.db #0xAA	; 170
	.db #0x00	; 0
	.db #0x55	; 85	'U'
	.db #0xC0	; 192
	.db #0xD5	; 213
	.db #0x00	; 0
	.db #0x55	; 85	'U'
	.db #0x88	; 136
	.db #0x00	; 0
	.db #0xFF	; 255
	.db #0xFF	; 255
	.db #0xFF	; 255
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x55	; 85	'U'
	.db #0xC0	; 192
	.db #0xC0	; 192
	.db #0xD5	; 213
	.db #0xFF	; 255
	.db #0xAA	; 170
	.db #0x05	; 5
	.db #0xC0	; 192
	.db #0xC0	; 192
	.db #0xD5	; 213
	.db #0xC0	; 192
	.db #0xEE	; 238
	.db #0x05	; 5
	.db #0xC0	; 192
	.db #0xC0	; 192
	.db #0xD5	; 213
	.db #0xC0	; 192
	.db #0xEE	; 238
	.db #0x55	; 85	'U'
	.db #0xC0	; 192
	.db #0xC0	; 192
	.db #0xD5	; 213
	.db #0xFF	; 255
	.db #0xAA	; 170
	.db #0x00	; 0
	.db #0xFF	; 255
	.db #0xFF	; 255
	.db #0xFF	; 255
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x55	; 85	'U'
	.db #0xC0	; 192
	.db #0xD5	; 213
	.db #0x00	; 0
	.db #0x55	; 85	'U'
	.db #0x88	; 136
	.db #0xEA	; 234
	.db #0xC0	; 192
	.db #0xAA	; 170
	.db #0xFF	; 255
	.db #0xAA	; 170
	.db #0x00	; 0
	.db #0xFF	; 255
	.db #0xFF	; 255
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
_g_naves_2:
	.db #0xFF	; 255
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0xFF	; 255
	.db #0xEA	; 234
	.db #0xAA	; 170
	.db #0xAF	; 175
	.db #0x5F	; 95
	.db #0x55	; 85	'U'
	.db #0xD5	; 213
	.db #0xEA	; 234
	.db #0xD5	; 213
	.db #0xC0	; 192
	.db #0xC0	; 192
	.db #0xEA	; 234
	.db #0xD5	; 213
	.db #0xEA	; 234
	.db #0xD5	; 213
	.db #0xC0	; 192
	.db #0xC0	; 192
	.db #0xEA	; 234
	.db #0xD5	; 213
	.db #0x55	; 85	'U'
	.db #0xD5	; 213
	.db #0xC0	; 192
	.db #0xC0	; 192
	.db #0xEA	; 234
	.db #0xAA	; 170
	.db #0x00	; 0
	.db #0xFF	; 255
	.db #0xC0	; 192
	.db #0xC0	; 192
	.db #0xFF	; 255
	.db #0x00	; 0
	.db #0x55	; 85	'U'
	.db #0x55	; 85	'U'
	.db #0xC0	; 192
	.db #0xC0	; 192
	.db #0xAA	; 170
	.db #0xAA	; 170
	.db #0x55	; 85	'U'
	.db #0x55	; 85	'U'
	.db #0xFF	; 255
	.db #0xFF	; 255
	.db #0xAA	; 170
	.db #0xAA	; 170
	.db #0x55	; 85	'U'
	.db #0x00	; 0
	.db #0xEA	; 234
	.db #0xD5	; 213
	.db #0x00	; 0
	.db #0xAA	; 170
	.db #0x00	; 0
	.db #0xAA	; 170
	.db #0xEA	; 234
	.db #0xD5	; 213
	.db #0x55	; 85	'U'
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x88	; 136
	.db #0xFF	; 255
	.db #0xFF	; 255
	.db #0x44	; 68	'D'
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x44	; 68	'D'
	.db #0x88	; 136
	.db #0x00	; 0
	.db #0x00	; 0
_g_naves_3:
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0xFF	; 255
	.db #0xFF	; 255
	.db #0x00	; 0
	.db #0x55	; 85	'U'
	.db #0xFF	; 255
	.db #0x55	; 85	'U'
	.db #0xC0	; 192
	.db #0xD5	; 213
	.db #0x44	; 68	'D'
	.db #0xAA	; 170
	.db #0x00	; 0
	.db #0xEA	; 234
	.db #0xC0	; 192
	.db #0xAA	; 170
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0xFF	; 255
	.db #0xFF	; 255
	.db #0xFF	; 255
	.db #0x00	; 0
	.db #0x55	; 85	'U'
	.db #0xFF	; 255
	.db #0xEA	; 234
	.db #0xC0	; 192
	.db #0xC0	; 192
	.db #0xAA	; 170
	.db #0xDD	; 221
	.db #0xC0	; 192
	.db #0xEA	; 234
	.db #0xC0	; 192
	.db #0xC0	; 192
	.db #0x0A	; 10
	.db #0xDD	; 221
	.db #0xC0	; 192
	.db #0xEA	; 234
	.db #0xC0	; 192
	.db #0xC0	; 192
	.db #0x0A	; 10
	.db #0x55	; 85	'U'
	.db #0xFF	; 255
	.db #0xEA	; 234
	.db #0xC0	; 192
	.db #0xC0	; 192
	.db #0xAA	; 170
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0xFF	; 255
	.db #0xFF	; 255
	.db #0xFF	; 255
	.db #0x00	; 0
	.db #0x44	; 68	'D'
	.db #0xAA	; 170
	.db #0x00	; 0
	.db #0xEA	; 234
	.db #0xC0	; 192
	.db #0xAA	; 170
	.db #0x00	; 0
	.db #0x55	; 85	'U'
	.db #0xFF	; 255
	.db #0x55	; 85	'U'
	.db #0xC0	; 192
	.db #0xD5	; 213
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0xFF	; 255
	.db #0xFF	; 255
	.area _INITIALIZER
	.area _CABS (ABS)
