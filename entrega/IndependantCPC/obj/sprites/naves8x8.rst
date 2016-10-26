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
   6C32                      47 _g_naves8x8_0:
   6C32 00                   48 	.db #0x00	; 0
   6C33 44                   49 	.db #0x44	; 68	'D'
   6C34 88                   50 	.db #0x88	; 136
   6C35 00                   51 	.db #0x00	; 0
   6C36 00                   52 	.db #0x00	; 0
   6C37 FF                   53 	.db #0xFF	; 255
   6C38 FF                   54 	.db #0xFF	; 255
   6C39 00                   55 	.db #0x00	; 0
   6C3A 00                   56 	.db #0x00	; 0
   6C3B EA                   57 	.db #0xEA	; 234
   6C3C D5                   58 	.db #0xD5	; 213
   6C3D 00                   59 	.db #0x00	; 0
   6C3E 55                   60 	.db #0x55	; 85	'U'
   6C3F FF                   61 	.db #0xFF	; 255
   6C40 FF                   62 	.db #0xFF	; 255
   6C41 AA                   63 	.db #0xAA	; 170
   6C42 FF                   64 	.db #0xFF	; 255
   6C43 EA                   65 	.db #0xEA	; 234
   6C44 D5                   66 	.db #0xD5	; 213
   6C45 FF                   67 	.db #0xFF	; 255
   6C46 AA                   68 	.db #0xAA	; 170
   6C47 EA                   69 	.db #0xEA	; 234
   6C48 D5                   70 	.db #0xD5	; 213
   6C49 55                   71 	.db #0x55	; 85	'U'
   6C4A AA                   72 	.db #0xAA	; 170
   6C4B FF                   73 	.db #0xFF	; 255
   6C4C FF                   74 	.db #0xFF	; 255
   6C4D 55                   75 	.db #0x55	; 85	'U'
   6C4E AA                   76 	.db #0xAA	; 170
   6C4F 05                   77 	.db #0x05	; 5
   6C50 0A                   78 	.db #0x0A	; 10
   6C51 55                   79 	.db #0x55	; 85	'U'
   6C52                      80 _g_naves8x8_1:
   6C52 FF                   81 	.db #0xFF	; 255
   6C53 FF                   82 	.db #0xFF	; 255
   6C54 00                   83 	.db #0x00	; 0
   6C55 00                   84 	.db #0x00	; 0
   6C56 00                   85 	.db #0x00	; 0
   6C57 55                   86 	.db #0x55	; 85	'U'
   6C58 AA                   87 	.db #0xAA	; 170
   6C59 00                   88 	.db #0x00	; 0
   6C5A 55                   89 	.db #0x55	; 85	'U'
   6C5B FF                   90 	.db #0xFF	; 255
   6C5C FF                   91 	.db #0xFF	; 255
   6C5D AA                   92 	.db #0xAA	; 170
   6C5E 5F                   93 	.db #0x5F	; 95
   6C5F C0                   94 	.db #0xC0	; 192
   6C60 EA                   95 	.db #0xEA	; 234
   6C61 EE                   96 	.db #0xEE	; 238
   6C62 5F                   97 	.db #0x5F	; 95
   6C63 C0                   98 	.db #0xC0	; 192
   6C64 EA                   99 	.db #0xEA	; 234
   6C65 EE                  100 	.db #0xEE	; 238
   6C66 55                  101 	.db #0x55	; 85	'U'
   6C67 FF                  102 	.db #0xFF	; 255
   6C68 FF                  103 	.db #0xFF	; 255
   6C69 AA                  104 	.db #0xAA	; 170
   6C6A 00                  105 	.db #0x00	; 0
   6C6B 55                  106 	.db #0x55	; 85	'U'
   6C6C AA                  107 	.db #0xAA	; 170
   6C6D 00                  108 	.db #0x00	; 0
   6C6E FF                  109 	.db #0xFF	; 255
   6C6F FF                  110 	.db #0xFF	; 255
   6C70 00                  111 	.db #0x00	; 0
   6C71 00                  112 	.db #0x00	; 0
   6C72                     113 _g_naves8x8_2:
   6C72 AA                  114 	.db #0xAA	; 170
   6C73 05                  115 	.db #0x05	; 5
   6C74 0A                  116 	.db #0x0A	; 10
   6C75 55                  117 	.db #0x55	; 85	'U'
   6C76 AA                  118 	.db #0xAA	; 170
   6C77 FF                  119 	.db #0xFF	; 255
   6C78 FF                  120 	.db #0xFF	; 255
   6C79 55                  121 	.db #0x55	; 85	'U'
   6C7A AA                  122 	.db #0xAA	; 170
   6C7B EA                  123 	.db #0xEA	; 234
   6C7C D5                  124 	.db #0xD5	; 213
   6C7D 55                  125 	.db #0x55	; 85	'U'
   6C7E FF                  126 	.db #0xFF	; 255
   6C7F EA                  127 	.db #0xEA	; 234
   6C80 D5                  128 	.db #0xD5	; 213
   6C81 FF                  129 	.db #0xFF	; 255
   6C82 55                  130 	.db #0x55	; 85	'U'
   6C83 FF                  131 	.db #0xFF	; 255
   6C84 FF                  132 	.db #0xFF	; 255
   6C85 AA                  133 	.db #0xAA	; 170
   6C86 00                  134 	.db #0x00	; 0
   6C87 EA                  135 	.db #0xEA	; 234
   6C88 D5                  136 	.db #0xD5	; 213
   6C89 00                  137 	.db #0x00	; 0
   6C8A 00                  138 	.db #0x00	; 0
   6C8B FF                  139 	.db #0xFF	; 255
   6C8C FF                  140 	.db #0xFF	; 255
   6C8D 00                  141 	.db #0x00	; 0
   6C8E 00                  142 	.db #0x00	; 0
   6C8F 44                  143 	.db #0x44	; 68	'D'
   6C90 88                  144 	.db #0x88	; 136
   6C91 00                  145 	.db #0x00	; 0
   6C92                     146 _g_naves8x8_3:
   6C92 00                  147 	.db #0x00	; 0
   6C93 00                  148 	.db #0x00	; 0
   6C94 FF                  149 	.db #0xFF	; 255
   6C95 FF                  150 	.db #0xFF	; 255
   6C96 00                  151 	.db #0x00	; 0
   6C97 55                  152 	.db #0x55	; 85	'U'
   6C98 AA                  153 	.db #0xAA	; 170
   6C99 00                  154 	.db #0x00	; 0
   6C9A 55                  155 	.db #0x55	; 85	'U'
   6C9B FF                  156 	.db #0xFF	; 255
   6C9C FF                  157 	.db #0xFF	; 255
   6C9D AA                  158 	.db #0xAA	; 170
   6C9E DD                  159 	.db #0xDD	; 221
   6C9F D5                  160 	.db #0xD5	; 213
   6CA0 C0                  161 	.db #0xC0	; 192
   6CA1 AF                  162 	.db #0xAF	; 175
   6CA2 DD                  163 	.db #0xDD	; 221
   6CA3 D5                  164 	.db #0xD5	; 213
   6CA4 C0                  165 	.db #0xC0	; 192
   6CA5 AF                  166 	.db #0xAF	; 175
   6CA6 55                  167 	.db #0x55	; 85	'U'
   6CA7 FF                  168 	.db #0xFF	; 255
   6CA8 FF                  169 	.db #0xFF	; 255
   6CA9 AA                  170 	.db #0xAA	; 170
   6CAA 00                  171 	.db #0x00	; 0
   6CAB 55                  172 	.db #0x55	; 85	'U'
   6CAC AA                  173 	.db #0xAA	; 170
   6CAD 00                  174 	.db #0x00	; 0
   6CAE 00                  175 	.db #0x00	; 0
   6CAF 00                  176 	.db #0x00	; 0
   6CB0 FF                  177 	.db #0xFF	; 255
   6CB1 FF                  178 	.db #0xFF	; 255
                            179 	.area _INITIALIZER
                            180 	.area _CABS (ABS)
