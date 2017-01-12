;--------------------------------------------------------
; File Created by SDCC : free open source ANSI-C Compiler
; Version 3.5.5 #9498 (Linux)
;--------------------------------------------------------
	.module paletajulinho
	.optsdcc -mz80
	
;--------------------------------------------------------
; Public variables in this module
;--------------------------------------------------------
	.globl _g_paletajulinho_71
	.globl _g_paletajulinho_70
	.globl _g_paletajulinho_69
	.globl _g_paletajulinho_68
	.globl _g_paletajulinho_67
	.globl _g_paletajulinho_66
	.globl _g_paletajulinho_65
	.globl _g_paletajulinho_64
	.globl _g_paletajulinho_63
	.globl _g_paletajulinho_62
	.globl _g_paletajulinho_61
	.globl _g_paletajulinho_60
	.globl _g_paletajulinho_59
	.globl _g_paletajulinho_58
	.globl _g_paletajulinho_57
	.globl _g_paletajulinho_56
	.globl _g_paletajulinho_55
	.globl _g_paletajulinho_54
	.globl _g_paletajulinho_53
	.globl _g_paletajulinho_52
	.globl _g_paletajulinho_51
	.globl _g_paletajulinho_50
	.globl _g_paletajulinho_49
	.globl _g_paletajulinho_48
	.globl _g_paletajulinho_47
	.globl _g_paletajulinho_46
	.globl _g_paletajulinho_45
	.globl _g_paletajulinho_44
	.globl _g_paletajulinho_43
	.globl _g_paletajulinho_42
	.globl _g_paletajulinho_41
	.globl _g_paletajulinho_40
	.globl _g_paletajulinho_39
	.globl _g_paletajulinho_38
	.globl _g_paletajulinho_37
	.globl _g_paletajulinho_36
	.globl _g_paletajulinho_35
	.globl _g_paletajulinho_34
	.globl _g_paletajulinho_33
	.globl _g_paletajulinho_32
	.globl _g_paletajulinho_31
	.globl _g_paletajulinho_30
	.globl _g_paletajulinho_29
	.globl _g_paletajulinho_28
	.globl _g_paletajulinho_27
	.globl _g_paletajulinho_26
	.globl _g_paletajulinho_25
	.globl _g_paletajulinho_24
	.globl _g_paletajulinho_23
	.globl _g_paletajulinho_22
	.globl _g_paletajulinho_21
	.globl _g_paletajulinho_20
	.globl _g_paletajulinho_19
	.globl _g_paletajulinho_18
	.globl _g_paletajulinho_17
	.globl _g_paletajulinho_16
	.globl _g_paletajulinho_15
	.globl _g_paletajulinho_14
	.globl _g_paletajulinho_13
	.globl _g_paletajulinho_12
	.globl _g_paletajulinho_11
	.globl _g_paletajulinho_10
	.globl _g_paletajulinho_09
	.globl _g_paletajulinho_08
	.globl _g_paletajulinho_07
	.globl _g_paletajulinho_06
	.globl _g_paletajulinho_05
	.globl _g_paletajulinho_04
	.globl _g_paletajulinho_03
	.globl _g_paletajulinho_02
	.globl _g_paletajulinho_01
	.globl _g_paletajulinho_00
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
	.dw _g_paletajulinho_00
	.dw _g_paletajulinho_01
	.dw _g_paletajulinho_02
	.dw _g_paletajulinho_03
	.dw _g_paletajulinho_04
	.dw _g_paletajulinho_05
	.dw _g_paletajulinho_06
	.dw _g_paletajulinho_07
	.dw _g_paletajulinho_08
	.dw _g_paletajulinho_09
	.dw _g_paletajulinho_10
	.dw _g_paletajulinho_11
	.dw _g_paletajulinho_12
	.dw _g_paletajulinho_13
	.dw _g_paletajulinho_14
	.dw _g_paletajulinho_15
	.dw _g_paletajulinho_16
	.dw _g_paletajulinho_17
	.dw _g_paletajulinho_18
	.dw _g_paletajulinho_19
	.dw _g_paletajulinho_20
	.dw _g_paletajulinho_21
	.dw _g_paletajulinho_22
	.dw _g_paletajulinho_23
	.dw _g_paletajulinho_24
	.dw _g_paletajulinho_25
	.dw _g_paletajulinho_26
	.dw _g_paletajulinho_27
	.dw _g_paletajulinho_28
	.dw _g_paletajulinho_29
	.dw _g_paletajulinho_30
	.dw _g_paletajulinho_31
	.dw _g_paletajulinho_32
	.dw _g_paletajulinho_33
	.dw _g_paletajulinho_34
	.dw _g_paletajulinho_35
	.dw _g_paletajulinho_36
	.dw _g_paletajulinho_37
	.dw _g_paletajulinho_38
	.dw _g_paletajulinho_39
	.dw _g_paletajulinho_40
	.dw _g_paletajulinho_41
	.dw _g_paletajulinho_42
	.dw _g_paletajulinho_43
	.dw _g_paletajulinho_44
	.dw _g_paletajulinho_45
	.dw _g_paletajulinho_46
	.dw _g_paletajulinho_47
	.dw _g_paletajulinho_48
	.dw _g_paletajulinho_49
	.dw _g_paletajulinho_50
	.dw _g_paletajulinho_51
	.dw _g_paletajulinho_52
	.dw _g_paletajulinho_53
	.dw _g_paletajulinho_54
	.dw _g_paletajulinho_55
	.dw _g_paletajulinho_56
	.dw _g_paletajulinho_57
	.dw _g_paletajulinho_58
	.dw _g_paletajulinho_59
	.dw _g_paletajulinho_60
	.dw _g_paletajulinho_61
	.dw _g_paletajulinho_62
	.dw _g_paletajulinho_63
	.dw _g_paletajulinho_64
	.dw _g_paletajulinho_65
	.dw _g_paletajulinho_66
	.dw _g_paletajulinho_67
	.dw _g_paletajulinho_68
	.dw _g_paletajulinho_69
	.dw _g_paletajulinho_70
	.dw _g_paletajulinho_71
_g_paletajulinho_00:
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
_g_paletajulinho_01:
	.db #0xC0	; 192
	.db #0xC0	; 192
	.db #0xC0	; 192
	.db #0xC0	; 192
	.db #0xC0	; 192
	.db #0xC0	; 192
	.db #0xC0	; 192
	.db #0xC0	; 192
_g_paletajulinho_02:
	.db #0x0C	; 12
	.db #0x0C	; 12
	.db #0x0C	; 12
	.db #0x0C	; 12
	.db #0x0C	; 12
	.db #0x0C	; 12
	.db #0x0C	; 12
	.db #0x0C	; 12
_g_paletajulinho_03:
	.db #0xC0	; 192
	.db #0x0C	; 12
	.db #0xC0	; 192
	.db #0x0C	; 12
	.db #0xC0	; 192
	.db #0xC0	; 192
	.db #0xC0	; 192
	.db #0xC0	; 192
_g_paletajulinho_04:
	.db #0xCC	; 204
	.db #0xCC	; 204
	.db #0xCC	; 204
	.db #0xCC	; 204
	.db #0xCC	; 204
	.db #0xCC	; 204
	.db #0xCC	; 204
	.db #0xCC	; 204
_g_paletajulinho_05:
	.db #0x30	; 48	'0'
	.db #0x30	; 48	'0'
	.db #0x30	; 48	'0'
	.db #0x30	; 48	'0'
	.db #0x30	; 48	'0'
	.db #0x30	; 48	'0'
	.db #0x30	; 48	'0'
	.db #0x30	; 48	'0'
_g_paletajulinho_06:
	.db #0xF0	; 240
	.db #0xF0	; 240
	.db #0xF0	; 240
	.db #0xF0	; 240
	.db #0xF0	; 240
	.db #0xF0	; 240
	.db #0xF0	; 240
	.db #0xF0	; 240
_g_paletajulinho_07:
	.db #0xC0	; 192
	.db #0xC0	; 192
	.db #0xC0	; 192
	.db #0xC0	; 192
	.db #0x0C	; 12
	.db #0xC0	; 192
	.db #0x0C	; 12
	.db #0xC0	; 192
_g_paletajulinho_08:
	.db #0x3C	; 60
	.db #0x3C	; 60
	.db #0x3C	; 60
	.db #0x3C	; 60
	.db #0x3C	; 60
	.db #0x3C	; 60
	.db #0x3C	; 60
	.db #0x3C	; 60
_g_paletajulinho_09:
	.db #0xFC	; 252
	.db #0xFC	; 252
	.db #0xFC	; 252
	.db #0xFC	; 252
	.db #0xFC	; 252
	.db #0xFC	; 252
	.db #0xFC	; 252
	.db #0xFC	; 252
_g_paletajulinho_10:
	.db #0x03	; 3
	.db #0x03	; 3
	.db #0x03	; 3
	.db #0x03	; 3
	.db #0x03	; 3
	.db #0x03	; 3
	.db #0x03	; 3
	.db #0x03	; 3
_g_paletajulinho_11:
	.db #0x30	; 48	'0'
	.db #0x70	; 112	'p'
	.db #0x30	; 48	'0'
	.db #0x70	; 112	'p'
	.db #0x30	; 48	'0'
	.db #0x70	; 112	'p'
	.db #0x30	; 48	'0'
	.db #0x70	; 112	'p'
_g_paletajulinho_12:
	.db #0xC3	; 195
	.db #0xC3	; 195
	.db #0xC3	; 195
	.db #0xC3	; 195
	.db #0xC3	; 195
	.db #0xC3	; 195
	.db #0xC3	; 195
	.db #0xC3	; 195
_g_paletajulinho_13:
	.db #0x0F	; 15
	.db #0x0F	; 15
	.db #0x0F	; 15
	.db #0x0F	; 15
	.db #0x0F	; 15
	.db #0x0F	; 15
	.db #0x0F	; 15
	.db #0x0F	; 15
_g_paletajulinho_14:
	.db #0xCF	; 207
	.db #0xCF	; 207
	.db #0xCF	; 207
	.db #0xCF	; 207
	.db #0xCF	; 207
	.db #0xCF	; 207
	.db #0xCF	; 207
	.db #0xCF	; 207
_g_paletajulinho_15:
	.db #0xB0	; 176
	.db #0x30	; 48	'0'
	.db #0xB0	; 176
	.db #0x30	; 48	'0'
	.db #0xB0	; 176
	.db #0x30	; 48	'0'
	.db #0xB0	; 176
	.db #0x30	; 48	'0'
_g_paletajulinho_16:
	.db #0x33	; 51	'3'
	.db #0x33	; 51	'3'
	.db #0x33	; 51	'3'
	.db #0x33	; 51	'3'
	.db #0x33	; 51	'3'
	.db #0x33	; 51	'3'
	.db #0x33	; 51	'3'
	.db #0x33	; 51	'3'
_g_paletajulinho_17:
	.db #0xF3	; 243
	.db #0xF3	; 243
	.db #0xF3	; 243
	.db #0xF3	; 243
	.db #0xF3	; 243
	.db #0xF3	; 243
	.db #0xF3	; 243
	.db #0xF3	; 243
_g_paletajulinho_18:
	.db #0x3F	; 63
	.db #0x3F	; 63
	.db #0x3F	; 63
	.db #0x3F	; 63
	.db #0x3F	; 63
	.db #0x3F	; 63
	.db #0x3F	; 63
	.db #0x3F	; 63
_g_paletajulinho_19:
	.db #0xF0	; 240
	.db #0xF0	; 240
	.db #0x30	; 48	'0'
	.db #0x30	; 48	'0'
	.db #0x30	; 48	'0'
	.db #0x30	; 48	'0'
	.db #0x30	; 48	'0'
	.db #0x30	; 48	'0'
_g_paletajulinho_20:
	.db #0xFF	; 255
	.db #0xFF	; 255
	.db #0xFF	; 255
	.db #0xFF	; 255
	.db #0xFF	; 255
	.db #0xFF	; 255
	.db #0xFF	; 255
	.db #0xFF	; 255
_g_paletajulinho_21:
	.db #0xC3	; 195
	.db #0xC3	; 195
	.db #0x03	; 3
	.db #0x43	; 67	'C'
	.db #0x0F	; 15
	.db #0x43	; 67	'C'
	.db #0x0F	; 15
	.db #0x43	; 67	'C'
_g_paletajulinho_22:
	.db #0xC3	; 195
	.db #0xC3	; 195
	.db #0x83	; 131
	.db #0x03	; 3
	.db #0x83	; 131
	.db #0x0F	; 15
	.db #0x83	; 131
	.db #0x0F	; 15
_g_paletajulinho_23:
	.db #0x30	; 48	'0'
	.db #0x30	; 48	'0'
	.db #0x30	; 48	'0'
	.db #0x30	; 48	'0'
	.db #0x30	; 48	'0'
	.db #0x30	; 48	'0'
	.db #0xF0	; 240
	.db #0xF0	; 240
_g_paletajulinho_24:
	.db #0x0F	; 15
	.db #0x43	; 67	'C'
	.db #0x0F	; 15
	.db #0x43	; 67	'C'
	.db #0x03	; 3
	.db #0x43	; 67	'C'
	.db #0xC3	; 195
	.db #0xC3	; 195
_g_paletajulinho_25:
	.db #0x83	; 131
	.db #0x0F	; 15
	.db #0x83	; 131
	.db #0x0F	; 15
	.db #0x83	; 131
	.db #0x03	; 3
	.db #0xC3	; 195
	.db #0xC3	; 195
_g_paletajulinho_26:
	.db #0x83	; 131
	.db #0x0F	; 15
	.db #0x83	; 131
	.db #0x0F	; 15
	.db #0x83	; 131
	.db #0x0F	; 15
	.db #0x83	; 131
	.db #0x0F	; 15
_g_paletajulinho_27:
	.db #0x30	; 48	'0'
	.db #0x60	; 96
	.db #0x30	; 48	'0'
	.db #0x60	; 96
	.db #0x30	; 48	'0'
	.db #0x60	; 96
	.db #0x30	; 48	'0'
	.db #0x60	; 96
_g_paletajulinho_28:
	.db #0x0F	; 15
	.db #0x43	; 67	'C'
	.db #0x0F	; 15
	.db #0x43	; 67	'C'
	.db #0x0F	; 15
	.db #0x43	; 67	'C'
	.db #0x0F	; 15
	.db #0x43	; 67	'C'
_g_paletajulinho_29:
	.db #0xC3	; 195
	.db #0xC3	; 195
	.db #0x03	; 3
	.db #0x03	; 3
	.db #0x0F	; 15
	.db #0x0F	; 15
	.db #0x0F	; 15
	.db #0x0F	; 15
_g_paletajulinho_30:
	.db #0x0F	; 15
	.db #0x0F	; 15
	.db #0x0F	; 15
	.db #0x0F	; 15
	.db #0x03	; 3
	.db #0x03	; 3
	.db #0xC3	; 195
	.db #0xC3	; 195
_g_paletajulinho_31:
	.db #0x90	; 144
	.db #0x30	; 48	'0'
	.db #0x90	; 144
	.db #0x30	; 48	'0'
	.db #0x90	; 144
	.db #0x30	; 48	'0'
	.db #0x90	; 144
	.db #0x30	; 48	'0'
_g_paletajulinho_32:
	.db #0x30	; 48	'0'
	.db #0x30	; 48	'0'
	.db #0x30	; 48	'0'
	.db #0x30	; 48	'0'
	.db #0x30	; 48	'0'
	.db #0xFF	; 255
	.db #0x30	; 48	'0'
	.db #0xBA	; 186
_g_paletajulinho_33:
	.db #0x30	; 48	'0'
	.db #0x30	; 48	'0'
	.db #0x30	; 48	'0'
	.db #0x30	; 48	'0'
	.db #0xFF	; 255
	.db #0x30	; 48	'0'
	.db #0x30	; 48	'0'
	.db #0x30	; 48	'0'
_g_paletajulinho_34:
	.db #0xF0	; 240
	.db #0xF0	; 240
	.db #0xFC	; 252
	.db #0xF0	; 240
	.db #0xFC	; 252
	.db #0xF0	; 240
	.db #0xF0	; 240
	.db #0xF0	; 240
_g_paletajulinho_35:
	.db #0x30	; 48	'0'
	.db #0x24	; 36
	.db #0x30	; 48	'0'
	.db #0x24	; 36
	.db #0x30	; 48	'0'
	.db #0x24	; 36
	.db #0x30	; 48	'0'
	.db #0x24	; 36
_g_paletajulinho_36:
	.db #0x30	; 48	'0'
	.db #0xBA	; 186
	.db #0x30	; 48	'0'
	.db #0xFF	; 255
	.db #0x30	; 48	'0'
	.db #0xBA	; 186
	.db #0x30	; 48	'0'
	.db #0xBA	; 186
_g_paletajulinho_37:
	.db #0x30	; 48	'0'
	.db #0x30	; 48	'0'
	.db #0xFF	; 255
	.db #0x30	; 48	'0'
	.db #0x30	; 48	'0'
	.db #0x30	; 48	'0'
	.db #0x30	; 48	'0'
	.db #0x30	; 48	'0'
_g_paletajulinho_38:
	.db #0xF0	; 240
	.db #0xF0	; 240
	.db #0xF4	; 244
	.db #0xF8	; 248
	.db #0xF4	; 244
	.db #0xF8	; 248
	.db #0xF0	; 240
	.db #0xF0	; 240
_g_paletajulinho_39:
	.db #0x18	; 24
	.db #0x30	; 48	'0'
	.db #0x18	; 24
	.db #0x30	; 48	'0'
	.db #0x18	; 24
	.db #0x30	; 48	'0'
	.db #0x18	; 24
	.db #0x30	; 48	'0'
_g_paletajulinho_40:
	.db #0x30	; 48	'0'
	.db #0xFF	; 255
	.db #0x30	; 48	'0'
	.db #0x30	; 48	'0'
	.db #0x30	; 48	'0'
	.db #0x30	; 48	'0'
	.db #0x30	; 48	'0'
	.db #0x30	; 48	'0'
_g_paletajulinho_41:
	.db #0xFF	; 255
	.db #0x30	; 48	'0'
	.db #0x30	; 48	'0'
	.db #0x30	; 48	'0'
	.db #0x30	; 48	'0'
	.db #0x30	; 48	'0'
	.db #0x30	; 48	'0'
	.db #0x30	; 48	'0'
_g_paletajulinho_42:
	.db #0x3C	; 60
	.db #0x3C	; 60
	.db #0x39	; 57	'9'
	.db #0x36	; 54	'6'
	.db #0x39	; 57	'9'
	.db #0x36	; 54	'6'
	.db #0x3C	; 60
	.db #0x3C	; 60
_g_paletajulinho_43:
	.db #0x3F	; 63
	.db #0x3F	; 63
	.db #0x7F	; 127
	.db #0xBF	; 191
	.db #0x7F	; 127
	.db #0xBF	; 191
	.db #0x3F	; 63
	.db #0x3F	; 63
_g_paletajulinho_44:
	.db #0x3C	; 60
	.db #0x3C	; 60
	.db #0x3C	; 60
	.db #0x33	; 51	'3'
	.db #0x3C	; 60
	.db #0x33	; 51	'3'
	.db #0x3C	; 60
	.db #0x3C	; 60
_g_paletajulinho_45:
	.db #0x0C	; 12
	.db #0x0C	; 12
	.db #0x1C	; 28
	.db #0x2C	; 44
	.db #0x1C	; 28
	.db #0x2C	; 44
	.db #0x0C	; 12
	.db #0x0C	; 12
_g_paletajulinho_46:
	.db #0x0C	; 12
	.db #0x0C	; 12
	.db #0x0C	; 12
	.db #0x0C	; 12
	.db #0x1C	; 28
	.db #0x2C	; 44
	.db #0x1C	; 28
	.db #0x2C	; 44
_g_paletajulinho_47:
	.db #0x3F	; 63
	.db #0x3F	; 63
	.db #0x3F	; 63
	.db #0x3F	; 63
	.db #0xFF	; 255
	.db #0x3F	; 63
	.db #0xFF	; 255
	.db #0x3F	; 63
_g_paletajulinho_48:
	.db #0xFC	; 252
	.db #0xFC	; 252
	.db #0xED	; 237
	.db #0xDE	; 222
	.db #0xED	; 237
	.db #0xDE	; 222
	.db #0xFC	; 252
	.db #0xFC	; 252
_g_paletajulinho_49:
	.db #0xFC	; 252
	.db #0xFC	; 252
	.db #0xFC	; 252
	.db #0xFC	; 252
	.db #0xFC	; 252
	.db #0xCF	; 207
	.db #0xFC	; 252
	.db #0xCF	; 207
_g_paletajulinho_50:
	.db #0xF3	; 243
	.db #0xF3	; 243
	.db #0xB7	; 183
	.db #0x7B	; 123
	.db #0xB7	; 183
	.db #0x7B	; 123
	.db #0xF3	; 243
	.db #0xF3	; 243
_g_paletajulinho_51:
	.db #0x3F	; 63
	.db #0xF3	; 243
	.db #0x3F	; 63
	.db #0xF3	; 243
	.db #0xF3	; 243
	.db #0xF3	; 243
	.db #0xF3	; 243
	.db #0xF3	; 243
_g_paletajulinho_52:
	.db #0x38	; 56	'8'
	.db #0x30	; 48	'0'
	.db #0x38	; 56	'8'
	.db #0x30	; 48	'0'
	.db #0x38	; 56	'8'
	.db #0x30	; 48	'0'
	.db #0x38	; 56	'8'
	.db #0x30	; 48	'0'
_g_paletajulinho_53:
	.db #0x30	; 48	'0'
	.db #0x34	; 52	'4'
	.db #0x30	; 48	'0'
	.db #0x34	; 52	'4'
	.db #0x30	; 48	'0'
	.db #0x34	; 52	'4'
	.db #0x30	; 48	'0'
	.db #0x34	; 52	'4'
_g_paletajulinho_54:
	.db #0x3A	; 58
	.db #0x30	; 48	'0'
	.db #0x3A	; 58
	.db #0x30	; 48	'0'
	.db #0x3A	; 58
	.db #0x30	; 48	'0'
	.db #0x3A	; 58
	.db #0x30	; 48	'0'
_g_paletajulinho_55:
	.db #0x30	; 48	'0'
	.db #0x35	; 53	'5'
	.db #0x30	; 48	'0'
	.db #0x35	; 53	'5'
	.db #0x30	; 48	'0'
	.db #0x35	; 53	'5'
	.db #0x30	; 48	'0'
	.db #0x35	; 53	'5'
_g_paletajulinho_56:
	.db #0x30	; 48	'0'
	.db #0x30	; 48	'0'
	.db #0x30	; 48	'0'
	.db #0x30	; 48	'0'
	.db #0x30	; 48	'0'
	.db #0x30	; 48	'0'
	.db #0x3F	; 63
	.db #0x3F	; 63
_g_paletajulinho_57:
	.db #0x30	; 48	'0'
	.db #0x71	; 113	'q'
	.db #0x30	; 48	'0'
	.db #0x71	; 113	'q'
	.db #0x30	; 48	'0'
	.db #0x71	; 113	'q'
	.db #0x30	; 48	'0'
	.db #0x71	; 113	'q'
_g_paletajulinho_58:
	.db #0x12	; 18
	.db #0x30	; 48	'0'
	.db #0x12	; 18
	.db #0x30	; 48	'0'
	.db #0x12	; 18
	.db #0x30	; 48	'0'
	.db #0x12	; 18
	.db #0x30	; 48	'0'
_g_paletajulinho_59:
	.db #0xCF	; 207
	.db #0xCF	; 207
	.db #0xCF	; 207
	.db #0xCF	; 207
	.db #0xCF	; 207
	.db #0xCF	; 207
	.db #0xCF	; 207
	.db #0xCF	; 207
_g_paletajulinho_60:
	.db #0xF0	; 240
	.db #0xF0	; 240
	.db #0xF0	; 240
	.db #0xF0	; 240
	.db #0xF0	; 240
	.db #0xF5	; 245
	.db #0xF0	; 240
	.db #0xFA	; 250
_g_paletajulinho_61:
	.db #0xF0	; 240
	.db #0xF0	; 240
	.db #0xF0	; 240
	.db #0xF0	; 240
	.db #0xFA	; 250
	.db #0xF0	; 240
	.db #0xF5	; 245
	.db #0xF0	; 240
_g_paletajulinho_62:
	.db #0xFF	; 255
	.db #0xEF	; 239
	.db #0x3C	; 60
	.db #0xFF	; 255
	.db #0x3C	; 60
	.db #0xFF	; 255
	.db #0x3C	; 60
	.db #0xFF	; 255
_g_paletajulinho_63:
	.db #0xCF	; 207
	.db #0xCF	; 207
	.db #0xFF	; 255
	.db #0xFF	; 255
	.db #0xFF	; 255
	.db #0xFF	; 255
	.db #0xFF	; 255
	.db #0xFF	; 255
_g_paletajulinho_64:
	.db #0xF0	; 240
	.db #0xFA	; 250
	.db #0xF0	; 240
	.db #0xFF	; 255
	.db #0xF0	; 240
	.db #0xFA	; 250
	.db #0xF0	; 240
	.db #0xFA	; 250
_g_paletajulinho_65:
	.db #0xF5	; 245
	.db #0xF0	; 240
	.db #0xFF	; 255
	.db #0xF0	; 240
	.db #0xF5	; 245
	.db #0xF0	; 240
	.db #0xF5	; 245
	.db #0xF0	; 240
_g_paletajulinho_66:
	.db #0x7D	; 125
	.db #0xFF	; 255
	.db #0xFF	; 255
	.db #0xFF	; 255
	.db #0xFF	; 255
	.db #0xFF	; 255
	.db #0xFF	; 255
	.db #0xFF	; 255
_g_paletajulinho_67:
	.db #0xFF	; 255
	.db #0xFF	; 255
	.db #0xFF	; 255
	.db #0xFF	; 255
	.db #0xFF	; 255
	.db #0xFF	; 255
	.db #0xFF	; 255
	.db #0xFF	; 255
_g_paletajulinho_68:
	.db #0xF0	; 240
	.db #0xFA	; 250
	.db #0xF0	; 240
	.db #0xF0	; 240
	.db #0xF0	; 240
	.db #0xF0	; 240
	.db #0xF0	; 240
	.db #0xF0	; 240
_g_paletajulinho_69:
	.db #0xF5	; 245
	.db #0xF0	; 240
	.db #0xF0	; 240
	.db #0xF0	; 240
	.db #0xF0	; 240
	.db #0xF0	; 240
	.db #0xF0	; 240
	.db #0xF0	; 240
_g_paletajulinho_70:
	.db #0xFF	; 255
	.db #0xFF	; 255
	.db #0xFF	; 255
	.db #0xFF	; 255
	.db #0xFF	; 255
	.db #0xFF	; 255
	.db #0xFF	; 255
	.db #0xFF	; 255
_g_paletajulinho_71:
	.db #0xFF	; 255
	.db #0xFF	; 255
	.db #0xFF	; 255
	.db #0xFF	; 255
	.db #0xFF	; 255
	.db #0xFF	; 255
	.db #0xFF	; 255
	.db #0xFF	; 255
	.area _INITIALIZER
	.area _CABS (ABS)
