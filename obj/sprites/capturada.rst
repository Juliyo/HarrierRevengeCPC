                              1 ;--------------------------------------------------------
                              2 ; File Created by SDCC : free open source ANSI-C Compiler
                              3 ; Version 3.5.5 #9498 (Linux)
                              4 ;--------------------------------------------------------
                              5 	.module capturada
                              6 	.optsdcc -mz80
                              7 	
                              8 ;--------------------------------------------------------
                              9 ; Public variables in this module
                             10 ;--------------------------------------------------------
                             11 	.globl _g_capturada
                             12 ;--------------------------------------------------------
                             13 ; special function registers
                             14 ;--------------------------------------------------------
                             15 ;--------------------------------------------------------
                             16 ; ram data
                             17 ;--------------------------------------------------------
                             18 	.area _DATA
                             19 ;--------------------------------------------------------
                             20 ; ram data
                             21 ;--------------------------------------------------------
                             22 	.area _INITIALIZED
                             23 ;--------------------------------------------------------
                             24 ; absolute external ram data
                             25 ;--------------------------------------------------------
                             26 	.area _DABS (ABS)
                             27 ;--------------------------------------------------------
                             28 ; global & static initialisations
                             29 ;--------------------------------------------------------
                             30 	.area _HOME
                             31 	.area _GSINIT
                             32 	.area _GSFINAL
                             33 	.area _GSINIT
                             34 ;--------------------------------------------------------
                             35 ; Home
                             36 ;--------------------------------------------------------
                             37 	.area _HOME
                             38 	.area _HOME
                             39 ;--------------------------------------------------------
                             40 ; code
                             41 ;--------------------------------------------------------
                             42 	.area _CODE
                             43 	.area _CODE
   6B7A                      44 _g_capturada:
   6B7A F0                   45 	.db #0xF0	; 240
   6B7B F0                   46 	.db #0xF0	; 240
   6B7C F0                   47 	.db #0xF0	; 240
   6B7D F0                   48 	.db #0xF0	; 240
   6B7E F0                   49 	.db #0xF0	; 240
   6B7F F0                   50 	.db #0xF0	; 240
   6B80 F0                   51 	.db #0xF0	; 240
   6B81 F0                   52 	.db #0xF0	; 240
   6B82 A1                   53 	.db #0xA1	; 161
   6B83 03                   54 	.db #0x03	; 3
   6B84 03                   55 	.db #0x03	; 3
   6B85 03                   56 	.db #0x03	; 3
   6B86 03                   57 	.db #0x03	; 3
   6B87 03                   58 	.db #0x03	; 3
   6B88 03                   59 	.db #0x03	; 3
   6B89 52                   60 	.db #0x52	; 82	'R'
   6B8A A1                   61 	.db #0xA1	; 161
   6B8B 0F                   62 	.db #0x0F	; 15
   6B8C 0F                   63 	.db #0x0F	; 15
   6B8D 0F                   64 	.db #0x0F	; 15
   6B8E 0F                   65 	.db #0x0F	; 15
   6B8F 0F                   66 	.db #0x0F	; 15
   6B90 0F                   67 	.db #0x0F	; 15
   6B91 52                   68 	.db #0x52	; 82	'R'
   6B92 A1                   69 	.db #0xA1	; 161
   6B93 0F                   70 	.db #0x0F	; 15
   6B94 0F                   71 	.db #0x0F	; 15
   6B95 0F                   72 	.db #0x0F	; 15
   6B96 0F                   73 	.db #0x0F	; 15
   6B97 0F                   74 	.db #0x0F	; 15
   6B98 0F                   75 	.db #0x0F	; 15
   6B99 52                   76 	.db #0x52	; 82	'R'
   6B9A A1                   77 	.db #0xA1	; 161
   6B9B 0F                   78 	.db #0x0F	; 15
   6B9C F0                   79 	.db #0xF0	; 240
   6B9D F0                   80 	.db #0xF0	; 240
   6B9E F0                   81 	.db #0xF0	; 240
   6B9F F0                   82 	.db #0xF0	; 240
   6BA0 0F                   83 	.db #0x0F	; 15
   6BA1 52                   84 	.db #0x52	; 82	'R'
   6BA2 A1                   85 	.db #0xA1	; 161
   6BA3 0F                   86 	.db #0x0F	; 15
   6BA4 F0                   87 	.db #0xF0	; 240
   6BA5 F0                   88 	.db #0xF0	; 240
   6BA6 F0                   89 	.db #0xF0	; 240
   6BA7 F0                   90 	.db #0xF0	; 240
   6BA8 0F                   91 	.db #0x0F	; 15
   6BA9 52                   92 	.db #0x52	; 82	'R'
   6BAA A1                   93 	.db #0xA1	; 161
   6BAB 0F                   94 	.db #0x0F	; 15
   6BAC F0                   95 	.db #0xF0	; 240
   6BAD F5                   96 	.db #0xF5	; 245
   6BAE FA                   97 	.db #0xFA	; 250
   6BAF F0                   98 	.db #0xF0	; 240
   6BB0 0F                   99 	.db #0x0F	; 15
   6BB1 52                  100 	.db #0x52	; 82	'R'
   6BB2 A1                  101 	.db #0xA1	; 161
   6BB3 0F                  102 	.db #0x0F	; 15
   6BB4 F0                  103 	.db #0xF0	; 240
   6BB5 FA                  104 	.db #0xFA	; 250
   6BB6 F5                  105 	.db #0xF5	; 245
   6BB7 F0                  106 	.db #0xF0	; 240
   6BB8 0F                  107 	.db #0x0F	; 15
   6BB9 52                  108 	.db #0x52	; 82	'R'
   6BBA A1                  109 	.db #0xA1	; 161
   6BBB 0F                  110 	.db #0x0F	; 15
   6BBC F0                  111 	.db #0xF0	; 240
   6BBD FA                  112 	.db #0xFA	; 250
   6BBE F5                  113 	.db #0xF5	; 245
   6BBF F0                  114 	.db #0xF0	; 240
   6BC0 0F                  115 	.db #0x0F	; 15
   6BC1 52                  116 	.db #0x52	; 82	'R'
   6BC2 A1                  117 	.db #0xA1	; 161
   6BC3 0F                  118 	.db #0x0F	; 15
   6BC4 F0                  119 	.db #0xF0	; 240
   6BC5 FF                  120 	.db #0xFF	; 255
   6BC6 FF                  121 	.db #0xFF	; 255
   6BC7 F0                  122 	.db #0xF0	; 240
   6BC8 0F                  123 	.db #0x0F	; 15
   6BC9 52                  124 	.db #0x52	; 82	'R'
   6BCA A1                  125 	.db #0xA1	; 161
   6BCB 0F                  126 	.db #0x0F	; 15
   6BCC F0                  127 	.db #0xF0	; 240
   6BCD FA                  128 	.db #0xFA	; 250
   6BCE F5                  129 	.db #0xF5	; 245
   6BCF F0                  130 	.db #0xF0	; 240
   6BD0 0F                  131 	.db #0x0F	; 15
   6BD1 52                  132 	.db #0x52	; 82	'R'
   6BD2 A1                  133 	.db #0xA1	; 161
   6BD3 0F                  134 	.db #0x0F	; 15
   6BD4 F0                  135 	.db #0xF0	; 240
   6BD5 FA                  136 	.db #0xFA	; 250
   6BD6 F5                  137 	.db #0xF5	; 245
   6BD7 F0                  138 	.db #0xF0	; 240
   6BD8 0F                  139 	.db #0x0F	; 15
   6BD9 52                  140 	.db #0x52	; 82	'R'
   6BDA A1                  141 	.db #0xA1	; 161
   6BDB 0F                  142 	.db #0x0F	; 15
   6BDC F0                  143 	.db #0xF0	; 240
   6BDD FA                  144 	.db #0xFA	; 250
   6BDE F5                  145 	.db #0xF5	; 245
   6BDF F0                  146 	.db #0xF0	; 240
   6BE0 0F                  147 	.db #0x0F	; 15
   6BE1 52                  148 	.db #0x52	; 82	'R'
   6BE2 A1                  149 	.db #0xA1	; 161
   6BE3 0F                  150 	.db #0x0F	; 15
   6BE4 F0                  151 	.db #0xF0	; 240
   6BE5 F0                  152 	.db #0xF0	; 240
   6BE6 F0                  153 	.db #0xF0	; 240
   6BE7 F0                  154 	.db #0xF0	; 240
   6BE8 0F                  155 	.db #0x0F	; 15
   6BE9 52                  156 	.db #0x52	; 82	'R'
   6BEA A1                  157 	.db #0xA1	; 161
   6BEB 0F                  158 	.db #0x0F	; 15
   6BEC F0                  159 	.db #0xF0	; 240
   6BED F0                  160 	.db #0xF0	; 240
   6BEE F0                  161 	.db #0xF0	; 240
   6BEF F0                  162 	.db #0xF0	; 240
   6BF0 0F                  163 	.db #0x0F	; 15
   6BF1 52                  164 	.db #0x52	; 82	'R'
   6BF2 A1                  165 	.db #0xA1	; 161
   6BF3 0F                  166 	.db #0x0F	; 15
   6BF4 F0                  167 	.db #0xF0	; 240
   6BF5 F0                  168 	.db #0xF0	; 240
   6BF6 F0                  169 	.db #0xF0	; 240
   6BF7 F0                  170 	.db #0xF0	; 240
   6BF8 0F                  171 	.db #0x0F	; 15
   6BF9 52                  172 	.db #0x52	; 82	'R'
   6BFA A1                  173 	.db #0xA1	; 161
   6BFB 0F                  174 	.db #0x0F	; 15
   6BFC 0F                  175 	.db #0x0F	; 15
   6BFD 0F                  176 	.db #0x0F	; 15
   6BFE 0F                  177 	.db #0x0F	; 15
   6BFF 0F                  178 	.db #0x0F	; 15
   6C00 0F                  179 	.db #0x0F	; 15
   6C01 52                  180 	.db #0x52	; 82	'R'
   6C02 A1                  181 	.db #0xA1	; 161
   6C03 0F                  182 	.db #0x0F	; 15
   6C04 0F                  183 	.db #0x0F	; 15
   6C05 0F                  184 	.db #0x0F	; 15
   6C06 0F                  185 	.db #0x0F	; 15
   6C07 0F                  186 	.db #0x0F	; 15
   6C08 0F                  187 	.db #0x0F	; 15
   6C09 52                  188 	.db #0x52	; 82	'R'
   6C0A A1                  189 	.db #0xA1	; 161
   6C0B 03                  190 	.db #0x03	; 3
   6C0C 03                  191 	.db #0x03	; 3
   6C0D 03                  192 	.db #0x03	; 3
   6C0E 03                  193 	.db #0x03	; 3
   6C0F 03                  194 	.db #0x03	; 3
   6C10 03                  195 	.db #0x03	; 3
   6C11 52                  196 	.db #0x52	; 82	'R'
   6C12 F0                  197 	.db #0xF0	; 240
   6C13 F0                  198 	.db #0xF0	; 240
   6C14 F0                  199 	.db #0xF0	; 240
   6C15 F0                  200 	.db #0xF0	; 240
   6C16 F0                  201 	.db #0xF0	; 240
   6C17 F0                  202 	.db #0xF0	; 240
   6C18 F0                  203 	.db #0xF0	; 240
   6C19 F0                  204 	.db #0xF0	; 240
                            205 	.area _INITIALIZER
                            206 	.area _CABS (ABS)
