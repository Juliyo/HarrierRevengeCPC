;--------------------------------------------------------
; File Created by SDCC : free open source ANSI-C Compiler
; Version 3.5.5 #9498 (Linux)
;--------------------------------------------------------
	.module capturada
	.optsdcc -mz80
	
;--------------------------------------------------------
; Public variables in this module
;--------------------------------------------------------
	.globl _g_capturada
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
_g_capturada:
	.db #0xF0	; 240
	.db #0xF0	; 240
	.db #0xF0	; 240
	.db #0xF0	; 240
	.db #0xF0	; 240
	.db #0xF0	; 240
	.db #0xF0	; 240
	.db #0xF0	; 240
	.db #0xA1	; 161
	.db #0x03	; 3
	.db #0x03	; 3
	.db #0x03	; 3
	.db #0x03	; 3
	.db #0x03	; 3
	.db #0x03	; 3
	.db #0x52	; 82	'R'
	.db #0xA1	; 161
	.db #0x0F	; 15
	.db #0x0F	; 15
	.db #0x0F	; 15
	.db #0x0F	; 15
	.db #0x0F	; 15
	.db #0x0F	; 15
	.db #0x52	; 82	'R'
	.db #0xA1	; 161
	.db #0x0F	; 15
	.db #0x0F	; 15
	.db #0x0F	; 15
	.db #0x0F	; 15
	.db #0x0F	; 15
	.db #0x0F	; 15
	.db #0x52	; 82	'R'
	.db #0xA1	; 161
	.db #0x0F	; 15
	.db #0xF0	; 240
	.db #0xF0	; 240
	.db #0xF0	; 240
	.db #0xF0	; 240
	.db #0x0F	; 15
	.db #0x52	; 82	'R'
	.db #0xA1	; 161
	.db #0x0F	; 15
	.db #0xF0	; 240
	.db #0xF0	; 240
	.db #0xF0	; 240
	.db #0xF0	; 240
	.db #0x0F	; 15
	.db #0x52	; 82	'R'
	.db #0xA1	; 161
	.db #0x0F	; 15
	.db #0xF0	; 240
	.db #0xF5	; 245
	.db #0xFA	; 250
	.db #0xF0	; 240
	.db #0x0F	; 15
	.db #0x52	; 82	'R'
	.db #0xA1	; 161
	.db #0x0F	; 15
	.db #0xF0	; 240
	.db #0xFA	; 250
	.db #0xF5	; 245
	.db #0xF0	; 240
	.db #0x0F	; 15
	.db #0x52	; 82	'R'
	.db #0xA1	; 161
	.db #0x0F	; 15
	.db #0xF0	; 240
	.db #0xFA	; 250
	.db #0xF5	; 245
	.db #0xF0	; 240
	.db #0x0F	; 15
	.db #0x52	; 82	'R'
	.db #0xA1	; 161
	.db #0x0F	; 15
	.db #0xF0	; 240
	.db #0xFF	; 255
	.db #0xFF	; 255
	.db #0xF0	; 240
	.db #0x0F	; 15
	.db #0x52	; 82	'R'
	.db #0xA1	; 161
	.db #0x0F	; 15
	.db #0xF0	; 240
	.db #0xFA	; 250
	.db #0xF5	; 245
	.db #0xF0	; 240
	.db #0x0F	; 15
	.db #0x52	; 82	'R'
	.db #0xA1	; 161
	.db #0x0F	; 15
	.db #0xF0	; 240
	.db #0xFA	; 250
	.db #0xF5	; 245
	.db #0xF0	; 240
	.db #0x0F	; 15
	.db #0x52	; 82	'R'
	.db #0xA1	; 161
	.db #0x0F	; 15
	.db #0xF0	; 240
	.db #0xFA	; 250
	.db #0xF5	; 245
	.db #0xF0	; 240
	.db #0x0F	; 15
	.db #0x52	; 82	'R'
	.db #0xA1	; 161
	.db #0x0F	; 15
	.db #0xF0	; 240
	.db #0xF0	; 240
	.db #0xF0	; 240
	.db #0xF0	; 240
	.db #0x0F	; 15
	.db #0x52	; 82	'R'
	.db #0xA1	; 161
	.db #0x0F	; 15
	.db #0xF0	; 240
	.db #0xF0	; 240
	.db #0xF0	; 240
	.db #0xF0	; 240
	.db #0x0F	; 15
	.db #0x52	; 82	'R'
	.db #0xA1	; 161
	.db #0x0F	; 15
	.db #0xF0	; 240
	.db #0xF0	; 240
	.db #0xF0	; 240
	.db #0xF0	; 240
	.db #0x0F	; 15
	.db #0x52	; 82	'R'
	.db #0xA1	; 161
	.db #0x0F	; 15
	.db #0x0F	; 15
	.db #0x0F	; 15
	.db #0x0F	; 15
	.db #0x0F	; 15
	.db #0x0F	; 15
	.db #0x52	; 82	'R'
	.db #0xA1	; 161
	.db #0x0F	; 15
	.db #0x0F	; 15
	.db #0x0F	; 15
	.db #0x0F	; 15
	.db #0x0F	; 15
	.db #0x0F	; 15
	.db #0x52	; 82	'R'
	.db #0xA1	; 161
	.db #0x03	; 3
	.db #0x03	; 3
	.db #0x03	; 3
	.db #0x03	; 3
	.db #0x03	; 3
	.db #0x03	; 3
	.db #0x52	; 82	'R'
	.db #0xF0	; 240
	.db #0xF0	; 240
	.db #0xF0	; 240
	.db #0xF0	; 240
	.db #0xF0	; 240
	.db #0xF0	; 240
	.db #0xF0	; 240
	.db #0xF0	; 240
	.area _INITIALIZER
	.area _CABS (ABS)
