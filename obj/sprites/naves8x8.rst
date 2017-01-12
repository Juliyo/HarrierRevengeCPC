                              1 ;--------------------------------------------------------
                              2 ; File Created by SDCC : free open source ANSI-C Compiler
                              3 ; Version 3.5.5 #9498 (Linux)
                              4 ;--------------------------------------------------------
                              5 	.module naves8x8
                              6 	.optsdcc -mz80
                              7 	
                              8 ;--------------------------------------------------------
                              9 ; Public variables in this module
                             10 ;--------------------------------------------------------
                             11 	.globl _g_naves8x8_3
                             12 	.globl _g_naves8x8_2
                             13 	.globl _g_naves8x8_1
                             14 	.globl _g_naves8x8_0
                             15 ;--------------------------------------------------------
                             16 ; special function registers
                             17 ;--------------------------------------------------------
                             18 ;--------------------------------------------------------
                             19 ; ram data
                             20 ;--------------------------------------------------------
                             21 	.area _DATA
                             22 ;--------------------------------------------------------
                             23 ; ram data
                             24 ;--------------------------------------------------------
                             25 	.area _INITIALIZED
                             26 ;--------------------------------------------------------
                             27 ; absolute external ram data
                             28 ;--------------------------------------------------------
                             29 	.area _DABS (ABS)
                             30 ;--------------------------------------------------------
                             31 ; global & static initialisations
                             32 ;--------------------------------------------------------
                             33 	.area _HOME
                             34 	.area _GSINIT
                             35 	.area _GSFINAL
                             36 	.area _GSINIT
                             37 ;--------------------------------------------------------
                             38 ; Home
                             39 ;--------------------------------------------------------
                             40 	.area _HOME
                             41 	.area _HOME
                             42 ;--------------------------------------------------------
                             43 ; code
                             44 ;--------------------------------------------------------
                             45 	.area _CODE
                             46 	.area _CODE
   6C4A                      47 _g_naves8x8_0:
   6C4A 00                   48 	.db #0x00	; 0
   6C4B 44                   49 	.db #0x44	; 68	'D'
   6C4C 88                   50 	.db #0x88	; 136
   6C4D 00                   51 	.db #0x00	; 0
   6C4E 00                   52 	.db #0x00	; 0
   6C4F FF                   53 	.db #0xFF	; 255
   6C50 FF                   54 	.db #0xFF	; 255
   6C51 00                   55 	.db #0x00	; 0
   6C52 00                   56 	.db #0x00	; 0
   6C53 EA                   57 	.db #0xEA	; 234
   6C54 D5                   58 	.db #0xD5	; 213
   6C55 00                   59 	.db #0x00	; 0
   6C56 55                   60 	.db #0x55	; 85	'U'
   6C57 FF                   61 	.db #0xFF	; 255
   6C58 FF                   62 	.db #0xFF	; 255
   6C59 AA                   63 	.db #0xAA	; 170
   6C5A FF                   64 	.db #0xFF	; 255
   6C5B EA                   65 	.db #0xEA	; 234
   6C5C D5                   66 	.db #0xD5	; 213
   6C5D FF                   67 	.db #0xFF	; 255
   6C5E AA                   68 	.db #0xAA	; 170
   6C5F EA                   69 	.db #0xEA	; 234
   6C60 D5                   70 	.db #0xD5	; 213
   6C61 55                   71 	.db #0x55	; 85	'U'
   6C62 AA                   72 	.db #0xAA	; 170
   6C63 FF                   73 	.db #0xFF	; 255
   6C64 FF                   74 	.db #0xFF	; 255
   6C65 55                   75 	.db #0x55	; 85	'U'
   6C66 AA                   76 	.db #0xAA	; 170
   6C67 05                   77 	.db #0x05	; 5
   6C68 0A                   78 	.db #0x0A	; 10
   6C69 55                   79 	.db #0x55	; 85	'U'
   6C6A                      80 _g_naves8x8_1:
   6C6A FF                   81 	.db #0xFF	; 255
   6C6B FF                   82 	.db #0xFF	; 255
   6C6C 00                   83 	.db #0x00	; 0
   6C6D 00                   84 	.db #0x00	; 0
   6C6E 00                   85 	.db #0x00	; 0
   6C6F 55                   86 	.db #0x55	; 85	'U'
   6C70 AA                   87 	.db #0xAA	; 170
   6C71 00                   88 	.db #0x00	; 0
   6C72 55                   89 	.db #0x55	; 85	'U'
   6C73 FF                   90 	.db #0xFF	; 255
   6C74 FF                   91 	.db #0xFF	; 255
   6C75 AA                   92 	.db #0xAA	; 170
   6C76 5F                   93 	.db #0x5F	; 95
   6C77 C0                   94 	.db #0xC0	; 192
   6C78 EA                   95 	.db #0xEA	; 234
   6C79 EE                   96 	.db #0xEE	; 238
   6C7A 5F                   97 	.db #0x5F	; 95
   6C7B C0                   98 	.db #0xC0	; 192
   6C7C EA                   99 	.db #0xEA	; 234
   6C7D EE                  100 	.db #0xEE	; 238
   6C7E 55                  101 	.db #0x55	; 85	'U'
   6C7F FF                  102 	.db #0xFF	; 255
   6C80 FF                  103 	.db #0xFF	; 255
   6C81 AA                  104 	.db #0xAA	; 170
   6C82 00                  105 	.db #0x00	; 0
   6C83 55                  106 	.db #0x55	; 85	'U'
   6C84 AA                  107 	.db #0xAA	; 170
   6C85 00                  108 	.db #0x00	; 0
   6C86 FF                  109 	.db #0xFF	; 255
   6C87 FF                  110 	.db #0xFF	; 255
   6C88 00                  111 	.db #0x00	; 0
   6C89 00                  112 	.db #0x00	; 0
   6C8A                     113 _g_naves8x8_2:
   6C8A AA                  114 	.db #0xAA	; 170
   6C8B 05                  115 	.db #0x05	; 5
   6C8C 0A                  116 	.db #0x0A	; 10
   6C8D 55                  117 	.db #0x55	; 85	'U'
   6C8E AA                  118 	.db #0xAA	; 170
   6C8F FF                  119 	.db #0xFF	; 255
   6C90 FF                  120 	.db #0xFF	; 255
   6C91 55                  121 	.db #0x55	; 85	'U'
   6C92 AA                  122 	.db #0xAA	; 170
   6C93 EA                  123 	.db #0xEA	; 234
   6C94 D5                  124 	.db #0xD5	; 213
   6C95 55                  125 	.db #0x55	; 85	'U'
   6C96 FF                  126 	.db #0xFF	; 255
   6C97 EA                  127 	.db #0xEA	; 234
   6C98 D5                  128 	.db #0xD5	; 213
   6C99 FF                  129 	.db #0xFF	; 255
   6C9A 55                  130 	.db #0x55	; 85	'U'
   6C9B FF                  131 	.db #0xFF	; 255
   6C9C FF                  132 	.db #0xFF	; 255
   6C9D AA                  133 	.db #0xAA	; 170
   6C9E 00                  134 	.db #0x00	; 0
   6C9F EA                  135 	.db #0xEA	; 234
   6CA0 D5                  136 	.db #0xD5	; 213
   6CA1 00                  137 	.db #0x00	; 0
   6CA2 00                  138 	.db #0x00	; 0
   6CA3 FF                  139 	.db #0xFF	; 255
   6CA4 FF                  140 	.db #0xFF	; 255
   6CA5 00                  141 	.db #0x00	; 0
   6CA6 00                  142 	.db #0x00	; 0
   6CA7 44                  143 	.db #0x44	; 68	'D'
   6CA8 88                  144 	.db #0x88	; 136
   6CA9 00                  145 	.db #0x00	; 0
   6CAA                     146 _g_naves8x8_3:
   6CAA 00                  147 	.db #0x00	; 0
   6CAB 00                  148 	.db #0x00	; 0
   6CAC FF                  149 	.db #0xFF	; 255
   6CAD FF                  150 	.db #0xFF	; 255
   6CAE 00                  151 	.db #0x00	; 0
   6CAF 55                  152 	.db #0x55	; 85	'U'
   6CB0 AA                  153 	.db #0xAA	; 170
   6CB1 00                  154 	.db #0x00	; 0
   6CB2 55                  155 	.db #0x55	; 85	'U'
   6CB3 FF                  156 	.db #0xFF	; 255
   6CB4 FF                  157 	.db #0xFF	; 255
   6CB5 AA                  158 	.db #0xAA	; 170
   6CB6 DD                  159 	.db #0xDD	; 221
   6CB7 D5                  160 	.db #0xD5	; 213
   6CB8 C0                  161 	.db #0xC0	; 192
   6CB9 AF                  162 	.db #0xAF	; 175
   6CBA DD                  163 	.db #0xDD	; 221
   6CBB D5                  164 	.db #0xD5	; 213
   6CBC C0                  165 	.db #0xC0	; 192
   6CBD AF                  166 	.db #0xAF	; 175
   6CBE 55                  167 	.db #0x55	; 85	'U'
   6CBF FF                  168 	.db #0xFF	; 255
   6CC0 FF                  169 	.db #0xFF	; 255
   6CC1 AA                  170 	.db #0xAA	; 170
   6CC2 00                  171 	.db #0x00	; 0
   6CC3 55                  172 	.db #0x55	; 85	'U'
   6CC4 AA                  173 	.db #0xAA	; 170
   6CC5 00                  174 	.db #0x00	; 0
   6CC6 00                  175 	.db #0x00	; 0
   6CC7 00                  176 	.db #0x00	; 0
   6CC8 FF                  177 	.db #0xFF	; 255
   6CC9 FF                  178 	.db #0xFF	; 255
                            179 	.area _INITIALIZER
                            180 	.area _CABS (ABS)
