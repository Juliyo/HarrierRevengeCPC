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
   6C7E                      47 _g_naves8x8_0:
   6C7E 00                   48 	.db #0x00	; 0
   6C7F 44                   49 	.db #0x44	; 68	'D'
   6C80 88                   50 	.db #0x88	; 136
   6C81 00                   51 	.db #0x00	; 0
   6C82 00                   52 	.db #0x00	; 0
   6C83 FF                   53 	.db #0xFF	; 255
   6C84 FF                   54 	.db #0xFF	; 255
   6C85 00                   55 	.db #0x00	; 0
   6C86 00                   56 	.db #0x00	; 0
   6C87 EA                   57 	.db #0xEA	; 234
   6C88 D5                   58 	.db #0xD5	; 213
   6C89 00                   59 	.db #0x00	; 0
   6C8A 55                   60 	.db #0x55	; 85	'U'
   6C8B FF                   61 	.db #0xFF	; 255
   6C8C FF                   62 	.db #0xFF	; 255
   6C8D AA                   63 	.db #0xAA	; 170
   6C8E FF                   64 	.db #0xFF	; 255
   6C8F EA                   65 	.db #0xEA	; 234
   6C90 D5                   66 	.db #0xD5	; 213
   6C91 FF                   67 	.db #0xFF	; 255
   6C92 AA                   68 	.db #0xAA	; 170
   6C93 EA                   69 	.db #0xEA	; 234
   6C94 D5                   70 	.db #0xD5	; 213
   6C95 55                   71 	.db #0x55	; 85	'U'
   6C96 AA                   72 	.db #0xAA	; 170
   6C97 FF                   73 	.db #0xFF	; 255
   6C98 FF                   74 	.db #0xFF	; 255
   6C99 55                   75 	.db #0x55	; 85	'U'
   6C9A AA                   76 	.db #0xAA	; 170
   6C9B 05                   77 	.db #0x05	; 5
   6C9C 0A                   78 	.db #0x0A	; 10
   6C9D 55                   79 	.db #0x55	; 85	'U'
   6C9E                      80 _g_naves8x8_1:
   6C9E FF                   81 	.db #0xFF	; 255
   6C9F FF                   82 	.db #0xFF	; 255
   6CA0 00                   83 	.db #0x00	; 0
   6CA1 00                   84 	.db #0x00	; 0
   6CA2 00                   85 	.db #0x00	; 0
   6CA3 55                   86 	.db #0x55	; 85	'U'
   6CA4 AA                   87 	.db #0xAA	; 170
   6CA5 00                   88 	.db #0x00	; 0
   6CA6 55                   89 	.db #0x55	; 85	'U'
   6CA7 FF                   90 	.db #0xFF	; 255
   6CA8 FF                   91 	.db #0xFF	; 255
   6CA9 AA                   92 	.db #0xAA	; 170
   6CAA 5F                   93 	.db #0x5F	; 95
   6CAB C0                   94 	.db #0xC0	; 192
   6CAC EA                   95 	.db #0xEA	; 234
   6CAD EE                   96 	.db #0xEE	; 238
   6CAE 5F                   97 	.db #0x5F	; 95
   6CAF C0                   98 	.db #0xC0	; 192
   6CB0 EA                   99 	.db #0xEA	; 234
   6CB1 EE                  100 	.db #0xEE	; 238
   6CB2 55                  101 	.db #0x55	; 85	'U'
   6CB3 FF                  102 	.db #0xFF	; 255
   6CB4 FF                  103 	.db #0xFF	; 255
   6CB5 AA                  104 	.db #0xAA	; 170
   6CB6 00                  105 	.db #0x00	; 0
   6CB7 55                  106 	.db #0x55	; 85	'U'
   6CB8 AA                  107 	.db #0xAA	; 170
   6CB9 00                  108 	.db #0x00	; 0
   6CBA FF                  109 	.db #0xFF	; 255
   6CBB FF                  110 	.db #0xFF	; 255
   6CBC 00                  111 	.db #0x00	; 0
   6CBD 00                  112 	.db #0x00	; 0
   6CBE                     113 _g_naves8x8_2:
   6CBE AA                  114 	.db #0xAA	; 170
   6CBF 05                  115 	.db #0x05	; 5
   6CC0 0A                  116 	.db #0x0A	; 10
   6CC1 55                  117 	.db #0x55	; 85	'U'
   6CC2 AA                  118 	.db #0xAA	; 170
   6CC3 FF                  119 	.db #0xFF	; 255
   6CC4 FF                  120 	.db #0xFF	; 255
   6CC5 55                  121 	.db #0x55	; 85	'U'
   6CC6 AA                  122 	.db #0xAA	; 170
   6CC7 EA                  123 	.db #0xEA	; 234
   6CC8 D5                  124 	.db #0xD5	; 213
   6CC9 55                  125 	.db #0x55	; 85	'U'
   6CCA FF                  126 	.db #0xFF	; 255
   6CCB EA                  127 	.db #0xEA	; 234
   6CCC D5                  128 	.db #0xD5	; 213
   6CCD FF                  129 	.db #0xFF	; 255
   6CCE 55                  130 	.db #0x55	; 85	'U'
   6CCF FF                  131 	.db #0xFF	; 255
   6CD0 FF                  132 	.db #0xFF	; 255
   6CD1 AA                  133 	.db #0xAA	; 170
   6CD2 00                  134 	.db #0x00	; 0
   6CD3 EA                  135 	.db #0xEA	; 234
   6CD4 D5                  136 	.db #0xD5	; 213
   6CD5 00                  137 	.db #0x00	; 0
   6CD6 00                  138 	.db #0x00	; 0
   6CD7 FF                  139 	.db #0xFF	; 255
   6CD8 FF                  140 	.db #0xFF	; 255
   6CD9 00                  141 	.db #0x00	; 0
   6CDA 00                  142 	.db #0x00	; 0
   6CDB 44                  143 	.db #0x44	; 68	'D'
   6CDC 88                  144 	.db #0x88	; 136
   6CDD 00                  145 	.db #0x00	; 0
   6CDE                     146 _g_naves8x8_3:
   6CDE 00                  147 	.db #0x00	; 0
   6CDF 00                  148 	.db #0x00	; 0
   6CE0 FF                  149 	.db #0xFF	; 255
   6CE1 FF                  150 	.db #0xFF	; 255
   6CE2 00                  151 	.db #0x00	; 0
   6CE3 55                  152 	.db #0x55	; 85	'U'
   6CE4 AA                  153 	.db #0xAA	; 170
   6CE5 00                  154 	.db #0x00	; 0
   6CE6 55                  155 	.db #0x55	; 85	'U'
   6CE7 FF                  156 	.db #0xFF	; 255
   6CE8 FF                  157 	.db #0xFF	; 255
   6CE9 AA                  158 	.db #0xAA	; 170
   6CEA DD                  159 	.db #0xDD	; 221
   6CEB D5                  160 	.db #0xD5	; 213
   6CEC C0                  161 	.db #0xC0	; 192
   6CED AF                  162 	.db #0xAF	; 175
   6CEE DD                  163 	.db #0xDD	; 221
   6CEF D5                  164 	.db #0xD5	; 213
   6CF0 C0                  165 	.db #0xC0	; 192
   6CF1 AF                  166 	.db #0xAF	; 175
   6CF2 55                  167 	.db #0x55	; 85	'U'
   6CF3 FF                  168 	.db #0xFF	; 255
   6CF4 FF                  169 	.db #0xFF	; 255
   6CF5 AA                  170 	.db #0xAA	; 170
   6CF6 00                  171 	.db #0x00	; 0
   6CF7 55                  172 	.db #0x55	; 85	'U'
   6CF8 AA                  173 	.db #0xAA	; 170
   6CF9 00                  174 	.db #0x00	; 0
   6CFA 00                  175 	.db #0x00	; 0
   6CFB 00                  176 	.db #0x00	; 0
   6CFC FF                  177 	.db #0xFF	; 255
   6CFD FF                  178 	.db #0xFF	; 255
                            179 	.area _INITIALIZER
                            180 	.area _CABS (ABS)
