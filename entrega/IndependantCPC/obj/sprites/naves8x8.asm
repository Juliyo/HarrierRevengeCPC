;--------------------------------------------------------
; File Created by SDCC : free open source ANSI-C Compiler
; Version 3.5.5 #9498 (Linux)
;--------------------------------------------------------
	.module naves8x8
	.optsdcc -mz80
	
;--------------------------------------------------------
; Public variables in this module
;--------------------------------------------------------
	.globl _g_naves8x8_3
	.globl _g_naves8x8_2
	.globl _g_naves8x8_1
	.globl _g_naves8x8_0
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
_g_naves8x8_0:
	.db #0x00	; 0
	.db #0x44	; 68	'D'
	.db #0x88	; 136
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0xFF	; 255
	.db #0xFF	; 255
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0xEA	; 234
	.db #0xD5	; 213
	.db #0x00	; 0
	.db #0x55	; 85	'U'
	.db #0xFF	; 255
	.db #0xFF	; 255
	.db #0xAA	; 170
	.db #0xFF	; 255
	.db #0xEA	; 234
	.db #0xD5	; 213
	.db #0xFF	; 255
	.db #0xAA	; 170
	.db #0xEA	; 234
	.db #0xD5	; 213
	.db #0x55	; 85	'U'
	.db #0xAA	; 170
	.db #0xFF	; 255
	.db #0xFF	; 255
	.db #0x55	; 85	'U'
	.db #0xAA	; 170
	.db #0x05	; 5
	.db #0x0A	; 10
	.db #0x55	; 85	'U'
_g_naves8x8_1:
	.db #0xFF	; 255
	.db #0xFF	; 255
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x55	; 85	'U'
	.db #0xAA	; 170
	.db #0x00	; 0
	.db #0x55	; 85	'U'
	.db #0xFF	; 255
	.db #0xFF	; 255
	.db #0xAA	; 170
	.db #0x5F	; 95
	.db #0xC0	; 192
	.db #0xEA	; 234
	.db #0xEE	; 238
	.db #0x5F	; 95
	.db #0xC0	; 192
	.db #0xEA	; 234
	.db #0xEE	; 238
	.db #0x55	; 85	'U'
	.db #0xFF	; 255
	.db #0xFF	; 255
	.db #0xAA	; 170
	.db #0x00	; 0
	.db #0x55	; 85	'U'
	.db #0xAA	; 170
	.db #0x00	; 0
	.db #0xFF	; 255
	.db #0xFF	; 255
	.db #0x00	; 0
	.db #0x00	; 0
_g_naves8x8_2:
	.db #0xAA	; 170
	.db #0x05	; 5
	.db #0x0A	; 10
	.db #0x55	; 85	'U'
	.db #0xAA	; 170
	.db #0xFF	; 255
	.db #0xFF	; 255
	.db #0x55	; 85	'U'
	.db #0xAA	; 170
	.db #0xEA	; 234
	.db #0xD5	; 213
	.db #0x55	; 85	'U'
	.db #0xFF	; 255
	.db #0xEA	; 234
	.db #0xD5	; 213
	.db #0xFF	; 255
	.db #0x55	; 85	'U'
	.db #0xFF	; 255
	.db #0xFF	; 255
	.db #0xAA	; 170
	.db #0x00	; 0
	.db #0xEA	; 234
	.db #0xD5	; 213
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0xFF	; 255
	.db #0xFF	; 255
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x44	; 68	'D'
	.db #0x88	; 136
	.db #0x00	; 0
_g_naves8x8_3:
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0xFF	; 255
	.db #0xFF	; 255
	.db #0x00	; 0
	.db #0x55	; 85	'U'
	.db #0xAA	; 170
	.db #0x00	; 0
	.db #0x55	; 85	'U'
	.db #0xFF	; 255
	.db #0xFF	; 255
	.db #0xAA	; 170
	.db #0xDD	; 221
	.db #0xD5	; 213
	.db #0xC0	; 192
	.db #0xAF	; 175
	.db #0xDD	; 221
	.db #0xD5	; 213
	.db #0xC0	; 192
	.db #0xAF	; 175
	.db #0x55	; 85	'U'
	.db #0xFF	; 255
	.db #0xFF	; 255
	.db #0xAA	; 170
	.db #0x00	; 0
	.db #0x55	; 85	'U'
	.db #0xAA	; 170
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0xFF	; 255
	.db #0xFF	; 255
	.area _INITIALIZER
	.area _CABS (ABS)
