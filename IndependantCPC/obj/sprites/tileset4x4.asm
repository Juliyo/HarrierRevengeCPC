;--------------------------------------------------------
; File Created by SDCC : free open source ANSI-C Compiler
; Version 3.5.5 #9498 (Linux)
;--------------------------------------------------------
	.module tileset4x4
	.optsdcc -mz80
	
;--------------------------------------------------------
; Public variables in this module
;--------------------------------------------------------
	.globl _g_tileset4x4_23
	.globl _g_tileset4x4_22
	.globl _g_tileset4x4_21
	.globl _g_tileset4x4_20
	.globl _g_tileset4x4_19
	.globl _g_tileset4x4_18
	.globl _g_tileset4x4_17
	.globl _g_tileset4x4_16
	.globl _g_tileset4x4_15
	.globl _g_tileset4x4_14
	.globl _g_tileset4x4_13
	.globl _g_tileset4x4_12
	.globl _g_tileset4x4_11
	.globl _g_tileset4x4_10
	.globl _g_tileset4x4_09
	.globl _g_tileset4x4_08
	.globl _g_tileset4x4_07
	.globl _g_tileset4x4_06
	.globl _g_tileset4x4_05
	.globl _g_tileset4x4_04
	.globl _g_tileset4x4_03
	.globl _g_tileset4x4_02
	.globl _g_tileset4x4_01
	.globl _g_tileset4x4_00
	.globl _g_tileset
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
_g_tileset:
	.dw _g_tileset4x4_00
	.dw _g_tileset4x4_01
	.dw _g_tileset4x4_02
	.dw _g_tileset4x4_03
	.dw _g_tileset4x4_04
	.dw _g_tileset4x4_05
	.dw _g_tileset4x4_06
	.dw _g_tileset4x4_07
	.dw _g_tileset4x4_08
	.dw _g_tileset4x4_09
	.dw _g_tileset4x4_10
	.dw _g_tileset4x4_11
	.dw _g_tileset4x4_12
	.dw _g_tileset4x4_13
	.dw _g_tileset4x4_14
	.dw _g_tileset4x4_15
	.dw _g_tileset4x4_16
	.dw _g_tileset4x4_17
	.dw _g_tileset4x4_18
	.dw _g_tileset4x4_19
	.dw _g_tileset4x4_20
	.dw _g_tileset4x4_21
	.dw _g_tileset4x4_22
	.dw _g_tileset4x4_23
_g_tileset4x4_00:
	.db #0xA9	; 169
	.db #0xFC	; 252
	.db #0xA9	; 169
	.db #0x03	; 3
	.db #0x16	; 22
	.db #0x94	; 148
	.db #0xA9	; 169
	.db #0xC0	; 192
_g_tileset4x4_01:
	.db #0x03	; 3
	.db #0xA9	; 169
	.db #0x03	; 3
	.db #0x03	; 3
	.db #0x68	; 104	'h'
	.db #0xC0	; 192
	.db #0xC0	; 192
	.db #0xC0	; 192
_g_tileset4x4_02:
	.db #0xA9	; 169
	.db #0xA9	; 169
	.db #0x03	; 3
	.db #0x03	; 3
	.db #0xC0	; 192
	.db #0x3C	; 60
	.db #0xC0	; 192
	.db #0xC0	; 192
_g_tileset4x4_03:
	.db #0x56	; 86	'V'
	.db #0x56	; 86	'V'
	.db #0x03	; 3
	.db #0x56	; 86	'V'
	.db #0x94	; 148
	.db #0x03	; 3
	.db #0x94	; 148
	.db #0x56	; 86	'V'
_g_tileset4x4_04:
	.db #0xC0	; 192
	.db #0xC0	; 192
	.db #0xC0	; 192
	.db #0x42	; 66	'B'
	.db #0x81	; 129
	.db #0x56	; 86	'V'
	.db #0x81	; 129
	.db #0x03	; 3
_g_tileset4x4_05:
	.db #0xC0	; 192
	.db #0xC0	; 192
	.db #0x42	; 66	'B'
	.db #0xC0	; 192
	.db #0x03	; 3
	.db #0xC0	; 192
	.db #0xFC	; 252
	.db #0xC0	; 192
_g_tileset4x4_06:
	.db #0xA9	; 169
	.db #0xC0	; 192
	.db #0x03	; 3
	.db #0xC0	; 192
	.db #0xA9	; 169
	.db #0xC0	; 192
	.db #0x03	; 3
	.db #0xC0	; 192
_g_tileset4x4_07:
	.db #0xC0	; 192
	.db #0xC0	; 192
	.db #0xC0	; 192
	.db #0xC0	; 192
	.db #0xC0	; 192
	.db #0xC0	; 192
	.db #0xC0	; 192
	.db #0xC0	; 192
_g_tileset4x4_08:
	.db #0xC0	; 192
	.db #0xC0	; 192
	.db #0xC0	; 192
	.db #0xC0	; 192
	.db #0xC0	; 192
	.db #0xC0	; 192
	.db #0xC0	; 192
	.db #0xC0	; 192
_g_tileset4x4_09:
	.db #0x94	; 148
	.db #0x03	; 3
	.db #0xC0	; 192
	.db #0x03	; 3
	.db #0xC0	; 192
	.db #0x56	; 86	'V'
	.db #0xC0	; 192
	.db #0x03	; 3
_g_tileset4x4_10:
	.db #0xC0	; 192
	.db #0x56	; 86	'V'
	.db #0xC0	; 192
	.db #0xFC	; 252
	.db #0x81	; 129
	.db #0xC0	; 192
	.db #0xC0	; 192
	.db #0xC0	; 192
_g_tileset4x4_11:
	.db #0x56	; 86	'V'
	.db #0x42	; 66	'B'
	.db #0xFC	; 252
	.db #0xC0	; 192
	.db #0x42	; 66	'B'
	.db #0xC0	; 192
	.db #0xC0	; 192
	.db #0xC0	; 192
_g_tileset4x4_12:
	.db #0xA9	; 169
	.db #0xC0	; 192
	.db #0xA9	; 169
	.db #0xC0	; 192
	.db #0x03	; 3
	.db #0xC0	; 192
	.db #0x42	; 66	'B'
	.db #0xC0	; 192
_g_tileset4x4_13:
	.db #0xC0	; 192
	.db #0xC0	; 192
	.db #0xC0	; 192
	.db #0xC0	; 192
	.db #0xC0	; 192
	.db #0xC0	; 192
	.db #0xC0	; 192
	.db #0xC0	; 192
_g_tileset4x4_14:
	.db #0xC0	; 192
	.db #0xC0	; 192
	.db #0xC0	; 192
	.db #0xC0	; 192
	.db #0xC0	; 192
	.db #0xC0	; 192
	.db #0xC0	; 192
	.db #0xC0	; 192
_g_tileset4x4_15:
	.db #0xC0	; 192
	.db #0x03	; 3
	.db #0xC0	; 192
	.db #0x7C	; 124
	.db #0xC0	; 192
	.db #0x56	; 86	'V'
	.db #0xC0	; 192
	.db #0x03	; 3
_g_tileset4x4_16:
	.db #0xC0	; 192
	.db #0xC0	; 192
	.db #0xC0	; 192
	.db #0xC0	; 192
	.db #0x56	; 86	'V'
	.db #0x94	; 148
	.db #0x56	; 86	'V'
	.db #0xA9	; 169
_g_tileset4x4_17:
	.db #0xC0	; 192
	.db #0xC0	; 192
	.db #0xC0	; 192
	.db #0xC0	; 192
	.db #0xC0	; 192
	.db #0xC0	; 192
	.db #0x68	; 104	'h'
	.db #0xC0	; 192
_g_tileset4x4_18:
	.db #0xE8	; 232
	.db #0xC0	; 192
	.db #0xA9	; 169
	.db #0xC0	; 192
	.db #0x03	; 3
	.db #0x68	; 104	'h'
	.db #0x03	; 3
	.db #0xFC	; 252
_g_tileset4x4_19:
	.db #0xC0	; 192
	.db #0xC0	; 192
	.db #0xC0	; 192
	.db #0xC0	; 192
	.db #0xC0	; 192
	.db #0x94	; 148
	.db #0x03	; 3
	.db #0x56	; 86	'V'
_g_tileset4x4_20:
	.db #0xC0	; 192
	.db #0xC0	; 192
	.db #0xC0	; 192
	.db #0xC0	; 192
	.db #0x03	; 3
	.db #0x3C	; 60
	.db #0xA9	; 169
	.db #0x56	; 86	'V'
_g_tileset4x4_21:
	.db #0xC0	; 192
	.db #0x03	; 3
	.db #0xC0	; 192
	.db #0x81	; 129
	.db #0xC0	; 192
	.db #0x56	; 86	'V'
	.db #0xA9	; 169
	.db #0x56	; 86	'V'
_g_tileset4x4_22:
	.db #0xDC	; 220
	.db #0xFC	; 252
	.db #0xA9	; 169
	.db #0x03	; 3
	.db #0x03	; 3
	.db #0x03	; 3
	.db #0x56	; 86	'V'
	.db #0xFC	; 252
_g_tileset4x4_23:
	.db #0xC0	; 192
	.db #0xC0	; 192
	.db #0x42	; 66	'B'
	.db #0xC0	; 192
	.db #0x03	; 3
	.db #0xC0	; 192
	.db #0xFC	; 252
	.db #0xE8	; 232
	.area _INITIALIZER
	.area _CABS (ABS)
