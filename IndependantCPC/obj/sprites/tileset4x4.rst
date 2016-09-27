                              1 ;--------------------------------------------------------
                              2 ; File Created by SDCC : free open source ANSI-C Compiler
                              3 ; Version 3.5.5 #9498 (Linux)
                              4 ;--------------------------------------------------------
                              5 	.module tileset4x4
                              6 	.optsdcc -mz80
                              7 	
                              8 ;--------------------------------------------------------
                              9 ; Public variables in this module
                             10 ;--------------------------------------------------------
                             11 	.globl _g_tileset4x4_27
                             12 	.globl _g_tileset4x4_26
                             13 	.globl _g_tileset4x4_25
                             14 	.globl _g_tileset4x4_24
                             15 	.globl _g_tileset4x4_23
                             16 	.globl _g_tileset4x4_22
                             17 	.globl _g_tileset4x4_21
                             18 	.globl _g_tileset4x4_20
                             19 	.globl _g_tileset4x4_19
                             20 	.globl _g_tileset4x4_18
                             21 	.globl _g_tileset4x4_17
                             22 	.globl _g_tileset4x4_16
                             23 	.globl _g_tileset4x4_15
                             24 	.globl _g_tileset4x4_14
                             25 	.globl _g_tileset4x4_13
                             26 	.globl _g_tileset4x4_12
                             27 	.globl _g_tileset4x4_11
                             28 	.globl _g_tileset4x4_10
                             29 	.globl _g_tileset4x4_09
                             30 	.globl _g_tileset4x4_08
                             31 	.globl _g_tileset4x4_07
                             32 	.globl _g_tileset4x4_06
                             33 	.globl _g_tileset4x4_05
                             34 	.globl _g_tileset4x4_04
                             35 	.globl _g_tileset4x4_03
                             36 	.globl _g_tileset4x4_02
                             37 	.globl _g_tileset4x4_01
                             38 	.globl _g_tileset4x4_00
                             39 	.globl _g_tileset
                             40 ;--------------------------------------------------------
                             41 ; special function registers
                             42 ;--------------------------------------------------------
                             43 ;--------------------------------------------------------
                             44 ; ram data
                             45 ;--------------------------------------------------------
                             46 	.area _DATA
                             47 ;--------------------------------------------------------
                             48 ; ram data
                             49 ;--------------------------------------------------------
                             50 	.area _INITIALIZED
                             51 ;--------------------------------------------------------
                             52 ; absolute external ram data
                             53 ;--------------------------------------------------------
                             54 	.area _DABS (ABS)
                             55 ;--------------------------------------------------------
                             56 ; global & static initialisations
                             57 ;--------------------------------------------------------
                             58 	.area _HOME
                             59 	.area _GSINIT
                             60 	.area _GSFINAL
                             61 	.area _GSINIT
                             62 ;--------------------------------------------------------
                             63 ; Home
                             64 ;--------------------------------------------------------
                             65 	.area _HOME
                             66 	.area _HOME
                             67 ;--------------------------------------------------------
                             68 ; code
                             69 ;--------------------------------------------------------
                             70 	.area _CODE
                             71 	.area _CODE
   47D0                      72 _g_tileset:
   47D0 08 48                73 	.dw _g_tileset4x4_00
   47D2 10 48                74 	.dw _g_tileset4x4_01
   47D4 18 48                75 	.dw _g_tileset4x4_02
   47D6 20 48                76 	.dw _g_tileset4x4_03
   47D8 28 48                77 	.dw _g_tileset4x4_04
   47DA 30 48                78 	.dw _g_tileset4x4_05
   47DC 38 48                79 	.dw _g_tileset4x4_06
   47DE 40 48                80 	.dw _g_tileset4x4_07
   47E0 48 48                81 	.dw _g_tileset4x4_08
   47E2 50 48                82 	.dw _g_tileset4x4_09
   47E4 58 48                83 	.dw _g_tileset4x4_10
   47E6 60 48                84 	.dw _g_tileset4x4_11
   47E8 68 48                85 	.dw _g_tileset4x4_12
   47EA 70 48                86 	.dw _g_tileset4x4_13
   47EC 78 48                87 	.dw _g_tileset4x4_14
   47EE 80 48                88 	.dw _g_tileset4x4_15
   47F0 88 48                89 	.dw _g_tileset4x4_16
   47F2 90 48                90 	.dw _g_tileset4x4_17
   47F4 98 48                91 	.dw _g_tileset4x4_18
   47F6 A0 48                92 	.dw _g_tileset4x4_19
   47F8 A8 48                93 	.dw _g_tileset4x4_20
   47FA B0 48                94 	.dw _g_tileset4x4_21
   47FC B8 48                95 	.dw _g_tileset4x4_22
   47FE C0 48                96 	.dw _g_tileset4x4_23
   4800 C8 48                97 	.dw _g_tileset4x4_24
   4802 D0 48                98 	.dw _g_tileset4x4_25
   4804 D8 48                99 	.dw _g_tileset4x4_26
   4806 E0 48               100 	.dw _g_tileset4x4_27
   4808                     101 _g_tileset4x4_00:
   4808 CC                  102 	.db #0xCC	; 204
   4809 CC                  103 	.db #0xCC	; 204
   480A CC                  104 	.db #0xCC	; 204
   480B CC                  105 	.db #0xCC	; 204
   480C CC                  106 	.db #0xCC	; 204
   480D 0C                  107 	.db #0x0C	; 12
   480E CC                  108 	.db #0xCC	; 204
   480F C0                  109 	.db #0xC0	; 192
   4810                     110 _g_tileset4x4_01:
   4810 CC                  111 	.db #0xCC	; 204
   4811 CC                  112 	.db #0xCC	; 204
   4812 8C                  113 	.db #0x8C	; 140
   4813 CC                  114 	.db #0xCC	; 204
   4814 84                  115 	.db #0x84	; 132
   4815 0C                  116 	.db #0x0C	; 12
   4816 48                  117 	.db #0x48	; 72	'H'
   4817 C0                  118 	.db #0xC0	; 192
   4818                     119 _g_tileset4x4_02:
   4818 CC                  120 	.db #0xCC	; 204
   4819 CC                  121 	.db #0xCC	; 204
   481A 4C                  122 	.db #0x4C	; 76	'L'
   481B 8C                  123 	.db #0x8C	; 140
   481C C0                  124 	.db #0xC0	; 192
   481D 0C                  125 	.db #0x0C	; 12
   481E 48                  126 	.db #0x48	; 72	'H'
   481F 48                  127 	.db #0x48	; 72	'H'
   4820                     128 _g_tileset4x4_03:
   4820 CC                  129 	.db #0xCC	; 204
   4821 CC                  130 	.db #0xCC	; 204
   4822 CC                  131 	.db #0xCC	; 204
   4823 CC                  132 	.db #0xCC	; 204
   4824 0C                  133 	.db #0x0C	; 12
   4825 CC                  134 	.db #0xCC	; 204
   4826 C0                  135 	.db #0xC0	; 192
   4827 CC                  136 	.db #0xCC	; 204
   4828                     137 _g_tileset4x4_04:
   4828 DD                  138 	.db #0xDD	; 221
   4829 FF                  139 	.db #0xFF	; 255
   482A DD                  140 	.db #0xDD	; 221
   482B FF                  141 	.db #0xFF	; 255
   482C DD                  142 	.db #0xDD	; 221
   482D FF                  143 	.db #0xFF	; 255
   482E DD                  144 	.db #0xDD	; 221
   482F FF                  145 	.db #0xFF	; 255
   4830                     146 _g_tileset4x4_05:
   4830 C0                  147 	.db #0xC0	; 192
   4831 C0                  148 	.db #0xC0	; 192
   4832 84                  149 	.db #0x84	; 132
   4833 0C                  150 	.db #0x0C	; 12
   4834 84                  151 	.db #0x84	; 132
   4835 CC                  152 	.db #0xCC	; 204
   4836 84                  153 	.db #0x84	; 132
   4837 CC                  154 	.db #0xCC	; 204
   4838                     155 _g_tileset4x4_06:
   4838 C0                  156 	.db #0xC0	; 192
   4839 D5                  157 	.db #0xD5	; 213
   483A 0C                  158 	.db #0x0C	; 12
   483B D5                  159 	.db #0xD5	; 213
   483C 8C                  160 	.db #0x8C	; 140
   483D D5                  161 	.db #0xD5	; 213
   483E 8C                  162 	.db #0x8C	; 140
   483F D5                  163 	.db #0xD5	; 213
   4840                     164 _g_tileset4x4_07:
   4840 CC                  165 	.db #0xCC	; 204
   4841 48                  166 	.db #0x48	; 72	'H'
   4842 8C                  167 	.db #0x8C	; 140
   4843 48                  168 	.db #0x48	; 72	'H'
   4844 CC                  169 	.db #0xCC	; 204
   4845 48                  170 	.db #0x48	; 72	'H'
   4846 CC                  171 	.db #0xCC	; 204
   4847 84                  172 	.db #0x84	; 132
   4848                     173 _g_tileset4x4_08:
   4848 48                  174 	.db #0x48	; 72	'H'
   4849 C0                  175 	.db #0xC0	; 192
   484A C0                  176 	.db #0xC0	; 192
   484B C0                  177 	.db #0xC0	; 192
   484C C0                  178 	.db #0xC0	; 192
   484D C0                  179 	.db #0xC0	; 192
   484E C0                  180 	.db #0xC0	; 192
   484F 48                  181 	.db #0x48	; 72	'H'
   4850                     182 _g_tileset4x4_09:
   4850 C0                  183 	.db #0xC0	; 192
   4851 C0                  184 	.db #0xC0	; 192
   4852 C0                  185 	.db #0xC0	; 192
   4853 C0                  186 	.db #0xC0	; 192
   4854 C0                  187 	.db #0xC0	; 192
   4855 C0                  188 	.db #0xC0	; 192
   4856 C0                  189 	.db #0xC0	; 192
   4857 C0                  190 	.db #0xC0	; 192
   4858                     191 _g_tileset4x4_10:
   4858 C0                  192 	.db #0xC0	; 192
   4859 4C                  193 	.db #0x4C	; 76	'L'
   485A C0                  194 	.db #0xC0	; 192
   485B CC                  195 	.db #0xCC	; 204
   485C C0                  196 	.db #0xC0	; 192
   485D 4C                  197 	.db #0x4C	; 76	'L'
   485E C0                  198 	.db #0xC0	; 192
   485F CC                  199 	.db #0xCC	; 204
   4860                     200 _g_tileset4x4_11:
   4860 5D                  201 	.db #0x5D	; 93
   4861 FF                  202 	.db #0xFF	; 255
   4862 DD                  203 	.db #0xDD	; 221
   4863 FF                  204 	.db #0xFF	; 255
   4864 DD                  205 	.db #0xDD	; 221
   4865 FF                  206 	.db #0xFF	; 255
   4866 CC                  207 	.db #0xCC	; 204
   4867 DD                  208 	.db #0xDD	; 221
   4868                     209 _g_tileset4x4_12:
   4868 84                  210 	.db #0x84	; 132
   4869 CC                  211 	.db #0xCC	; 204
   486A 84                  212 	.db #0x84	; 132
   486B 0C                  213 	.db #0x0C	; 12
   486C C0                  214 	.db #0xC0	; 192
   486D C0                  215 	.db #0xC0	; 192
   486E FF                  216 	.db #0xFF	; 255
   486F FF                  217 	.db #0xFF	; 255
   4870                     218 _g_tileset4x4_13:
   4870 8C                  219 	.db #0x8C	; 140
   4871 D5                  220 	.db #0xD5	; 213
   4872 0C                  221 	.db #0x0C	; 12
   4873 D5                  222 	.db #0xD5	; 213
   4874 C0                  223 	.db #0xC0	; 192
   4875 D5                  224 	.db #0xD5	; 213
   4876 DD                  225 	.db #0xDD	; 221
   4877 FF                  226 	.db #0xFF	; 255
   4878                     227 _g_tileset4x4_14:
   4878 CC                  228 	.db #0xCC	; 204
   4879 84                  229 	.db #0x84	; 132
   487A 8C                  230 	.db #0x8C	; 140
   487B 48                  231 	.db #0x48	; 72	'H'
   487C CC                  232 	.db #0xCC	; 204
   487D 48                  233 	.db #0x48	; 72	'H'
   487E CC                  234 	.db #0xCC	; 204
   487F 48                  235 	.db #0x48	; 72	'H'
   4880                     236 _g_tileset4x4_15:
   4880 C0                  237 	.db #0xC0	; 192
   4881 48                  238 	.db #0x48	; 72	'H'
   4882 C0                  239 	.db #0xC0	; 192
   4883 48                  240 	.db #0x48	; 72	'H'
   4884 C0                  241 	.db #0xC0	; 192
   4885 C0                  242 	.db #0xC0	; 192
   4886 C0                  243 	.db #0xC0	; 192
   4887 C0                  244 	.db #0xC0	; 192
   4888                     245 _g_tileset4x4_16:
   4888 C0                  246 	.db #0xC0	; 192
   4889 C0                  247 	.db #0xC0	; 192
   488A C0                  248 	.db #0xC0	; 192
   488B C0                  249 	.db #0xC0	; 192
   488C 48                  250 	.db #0x48	; 72	'H'
   488D C0                  251 	.db #0xC0	; 192
   488E C0                  252 	.db #0xC0	; 192
   488F C0                  253 	.db #0xC0	; 192
   4890                     254 _g_tileset4x4_17:
   4890 C0                  255 	.db #0xC0	; 192
   4891 4C                  256 	.db #0x4C	; 76	'L'
   4892 C0                  257 	.db #0xC0	; 192
   4893 CC                  258 	.db #0xCC	; 204
   4894 C0                  259 	.db #0xC0	; 192
   4895 CC                  260 	.db #0xCC	; 204
   4896 48                  261 	.db #0x48	; 72	'H'
   4897 4C                  262 	.db #0x4C	; 76	'L'
   4898                     263 _g_tileset4x4_18:
   4898 4C                  264 	.db #0x4C	; 76	'L'
   4899 C8                  265 	.db #0xC8	; 200
   489A DD                  266 	.db #0xDD	; 221
   489B C8                  267 	.db #0xC8	; 200
   489C DD                  268 	.db #0xDD	; 221
   489D DD                  269 	.db #0xDD	; 221
   489E DD                  270 	.db #0xDD	; 221
   489F DD                  271 	.db #0xDD	; 221
   48A0                     272 _g_tileset4x4_19:
   48A0 CC                  273 	.db #0xCC	; 204
   48A1 CC                  274 	.db #0xCC	; 204
   48A2 CC                  275 	.db #0xCC	; 204
   48A3 CC                  276 	.db #0xCC	; 204
   48A4 CC                  277 	.db #0xCC	; 204
   48A5 CC                  278 	.db #0xCC	; 204
   48A6 CC                  279 	.db #0xCC	; 204
   48A7 CC                  280 	.db #0xCC	; 204
   48A8                     281 _g_tileset4x4_20:
   48A8 DD                  282 	.db #0xDD	; 221
   48A9 FF                  283 	.db #0xFF	; 255
   48AA DD                  284 	.db #0xDD	; 221
   48AB FF                  285 	.db #0xFF	; 255
   48AC DD                  286 	.db #0xDD	; 221
   48AD FF                  287 	.db #0xFF	; 255
   48AE DD                  288 	.db #0xDD	; 221
   48AF FF                  289 	.db #0xFF	; 255
   48B0                     290 _g_tileset4x4_21:
   48B0 CC                  291 	.db #0xCC	; 204
   48B1 84                  292 	.db #0x84	; 132
   48B2 CC                  293 	.db #0xCC	; 204
   48B3 0C                  294 	.db #0x0C	; 12
   48B4 CC                  295 	.db #0xCC	; 204
   48B5 CC                  296 	.db #0xCC	; 204
   48B6 CC                  297 	.db #0xCC	; 204
   48B7 CC                  298 	.db #0xCC	; 204
   48B8                     299 _g_tileset4x4_22:
   48B8 C0                  300 	.db #0xC0	; 192
   48B9 48                  301 	.db #0x48	; 72	'H'
   48BA 0C                  302 	.db #0x0C	; 12
   48BB 84                  303 	.db #0x84	; 132
   48BC 8C                  304 	.db #0x8C	; 140
   48BD CC                  305 	.db #0xCC	; 204
   48BE CC                  306 	.db #0xCC	; 204
   48BF CC                  307 	.db #0xCC	; 204
   48C0                     308 _g_tileset4x4_23:
   48C0 C0                  309 	.db #0xC0	; 192
   48C1 84                  310 	.db #0x84	; 132
   48C2 0C                  311 	.db #0x0C	; 12
   48C3 0C                  312 	.db #0x0C	; 12
   48C4 8C                  313 	.db #0x8C	; 140
   48C5 8C                  314 	.db #0x8C	; 140
   48C6 CC                  315 	.db #0xCC	; 204
   48C7 CC                  316 	.db #0xCC	; 204
   48C8                     317 _g_tileset4x4_24:
   48C8 84                  318 	.db #0x84	; 132
   48C9 CC                  319 	.db #0xCC	; 204
   48CA 84                  320 	.db #0x84	; 132
   48CB CC                  321 	.db #0xCC	; 204
   48CC CC                  322 	.db #0xCC	; 204
   48CD CC                  323 	.db #0xCC	; 204
   48CE CC                  324 	.db #0xCC	; 204
   48CF CC                  325 	.db #0xCC	; 204
   48D0                     326 _g_tileset4x4_25:
   48D0 DD                  327 	.db #0xDD	; 221
   48D1 DD                  328 	.db #0xDD	; 221
   48D2 DD                  329 	.db #0xDD	; 221
   48D3 DD                  330 	.db #0xDD	; 221
   48D4 DD                  331 	.db #0xDD	; 221
   48D5 DD                  332 	.db #0xDD	; 221
   48D6 CC                  333 	.db #0xCC	; 204
   48D7 DD                  334 	.db #0xDD	; 221
   48D8                     335 _g_tileset4x4_26:
   48D8 CC                  336 	.db #0xCC	; 204
   48D9 CC                  337 	.db #0xCC	; 204
   48DA FF                  338 	.db #0xFF	; 255
   48DB FF                  339 	.db #0xFF	; 255
   48DC FF                  340 	.db #0xFF	; 255
   48DD EA                  341 	.db #0xEA	; 234
   48DE FF                  342 	.db #0xFF	; 255
   48DF EA                  343 	.db #0xEA	; 234
   48E0                     344 _g_tileset4x4_27:
   48E0 DD                  345 	.db #0xDD	; 221
   48E1 FF                  346 	.db #0xFF	; 255
   48E2 FF                  347 	.db #0xFF	; 255
   48E3 FF                  348 	.db #0xFF	; 255
   48E4 FF                  349 	.db #0xFF	; 255
   48E5 FF                  350 	.db #0xFF	; 255
   48E6 FF                  351 	.db #0xFF	; 255
   48E7 FF                  352 	.db #0xFF	; 255
                            353 	.area _INITIALIZER
                            354 	.area _CABS (ABS)
