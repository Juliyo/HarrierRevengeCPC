                              1 ;--------------------------------------------------------
                              2 ; File Created by SDCC : free open source ANSI-C Compiler
                              3 ; Version 3.5.5 #9498 (Linux)
                              4 ;--------------------------------------------------------
                              5 	.module random
                              6 	.optsdcc -mz80
                              7 	
                              8 ;--------------------------------------------------------
                              9 ; Public variables in this module
                             10 ;--------------------------------------------------------
                             11 	.globl _getRandomUniform
                             12 	.globl _g_nextRand
                             13 	.globl _g_randUnif
                             14 ;--------------------------------------------------------
                             15 ; special function registers
                             16 ;--------------------------------------------------------
                             17 ;--------------------------------------------------------
                             18 ; ram data
                             19 ;--------------------------------------------------------
                             20 	.area _DATA
   8600                      21 _g_nextRand::
   8600                      22 	.ds 1
                             23 ;--------------------------------------------------------
                             24 ; ram data
                             25 ;--------------------------------------------------------
                             26 	.area _INITIALIZED
                             27 ;--------------------------------------------------------
                             28 ; absolute external ram data
                             29 ;--------------------------------------------------------
                             30 	.area _DABS (ABS)
                             31 ;--------------------------------------------------------
                             32 ; global & static initialisations
                             33 ;--------------------------------------------------------
                             34 	.area _HOME
                             35 	.area _GSINIT
                             36 	.area _GSFINAL
                             37 	.area _GSINIT
                             38 ;--------------------------------------------------------
                             39 ; Home
                             40 ;--------------------------------------------------------
                             41 	.area _HOME
                             42 	.area _HOME
                             43 ;--------------------------------------------------------
                             44 ; code
                             45 ;--------------------------------------------------------
                             46 	.area _CODE
                             47 ;src/random/random.c:55: u8 getRandomUniform(u8 inc) {
                             48 ;	---------------------------------
                             49 ; Function getRandomUniform
                             50 ; ---------------------------------
   6A93                      51 _getRandomUniform::
                             52 ;src/random/random.c:56: g_nextRand += inc;               // Move to next random value to get
   6A93 21 02 00      [10]   53 	ld	hl,#2
   6A96 39            [11]   54 	add	hl,sp
   6A97 D5            [11]   55 	push	de
   6A98 FD 21 00 86   [14]   56 	ld	iy,#_g_nextRand
   6A9C FD E5         [15]   57 	push	iy
   6A9E D1            [10]   58 	pop	de
   6A9F 1A            [ 7]   59 	ld	a,(de)
   6AA0 86            [ 7]   60 	add	a, (hl)
   6AA1 12            [ 7]   61 	ld	(de),a
   6AA2 D1            [10]   62 	pop	de
                             63 ;src/random/random.c:57: return g_randUnif[g_nextRand];   // Return the random value
   6AA3 01 AE 6A      [10]   64 	ld	bc,#_g_randUnif+0
   6AA6 2A 00 86      [16]   65 	ld	hl,(_g_nextRand)
   6AA9 26 00         [ 7]   66 	ld	h,#0x00
   6AAB 09            [11]   67 	add	hl,bc
   6AAC 6E            [ 7]   68 	ld	l,(hl)
   6AAD C9            [10]   69 	ret
   6AAE                      70 _g_randUnif:
   6AAE FD                   71 	.db #0xFD	; 253
   6AAF 45                   72 	.db #0x45	; 69	'E'
   6AB0 9E                   73 	.db #0x9E	; 158
   6AB1 70                   74 	.db #0x70	; 112	'p'
   6AB2 E1                   75 	.db #0xE1	; 225
   6AB3 52                   76 	.db #0x52	; 82	'R'
   6AB4 24                   77 	.db #0x24	; 36
   6AB5 23                   78 	.db #0x23	; 35
   6AB6 69                   79 	.db #0x69	; 105	'i'
   6AB7 2A                   80 	.db #0x2A	; 42
   6AB8 6C                   81 	.db #0x6C	; 108	'l'
   6AB9 B0                   82 	.db #0xB0	; 176
   6ABA DB                   83 	.db #0xDB	; 219
   6ABB C7                   84 	.db #0xC7	; 199
   6ABC 5E                   85 	.db #0x5E	; 94
   6ABD 18                   86 	.db #0x18	; 24
   6ABE FF                   87 	.db #0xFF	; 255
   6ABF D7                   88 	.db #0xD7	; 215
   6AC0 F1                   89 	.db #0xF1	; 241
   6AC1 48                   90 	.db #0x48	; 72	'H'
   6AC2 08                   91 	.db #0x08	; 8
   6AC3 AF                   92 	.db #0xAF	; 175
   6AC4 20                   93 	.db #0x20	; 32
   6AC5 F8                   94 	.db #0xF8	; 248
   6AC6 C0                   95 	.db #0xC0	; 192
   6AC7 73                   96 	.db #0x73	; 115	's'
   6AC8 5B                   97 	.db #0x5B	; 91
   6AC9 2C                   98 	.db #0x2C	; 44
   6ACA D5                   99 	.db #0xD5	; 213
   6ACB 50                  100 	.db #0x50	; 80	'P'
   6ACC 82                  101 	.db #0x82	; 130
   6ACD 3F                  102 	.db #0x3F	; 63
   6ACE 46                  103 	.db #0x46	; 70	'F'
   6ACF D9                  104 	.db #0xD9	; 217
   6AD0 5D                  105 	.db #0x5D	; 93
   6AD1 CD                  106 	.db #0xCD	; 205
   6AD2 60                  107 	.db #0x60	; 96
   6AD3 66                  108 	.db #0x66	; 102	'f'
   6AD4 0D                  109 	.db #0x0D	; 13
   6AD5 F3                  110 	.db #0xF3	; 243
   6AD6 6D                  111 	.db #0x6D	; 109	'm'
   6AD7 86                  112 	.db #0x86	; 134
   6AD8 9F                  113 	.db #0x9F	; 159
   6AD9 D2                  114 	.db #0xD2	; 210
   6ADA 42                  115 	.db #0x42	; 66	'B'
   6ADB E7                  116 	.db #0xE7	; 231
   6ADC B8                  117 	.db #0xB8	; 184
   6ADD 80                  118 	.db #0x80	; 128
   6ADE 51                  119 	.db #0x51	; 81	'Q'
   6ADF 38                  120 	.db #0x38	; 56	'8'
   6AE0 AA                  121 	.db #0xAA	; 170
   6AE1 B6                  122 	.db #0xB6	; 182
   6AE2 DD                  123 	.db #0xDD	; 221
   6AE3 63                  124 	.db #0x63	; 99	'c'
   6AE4 4E                  125 	.db #0x4E	; 78	'N'
   6AE5 7A                  126 	.db #0x7A	; 122	'z'
   6AE6 93                  127 	.db #0x93	; 147
   6AE7 75                  128 	.db #0x75	; 117	'u'
   6AE8 94                  129 	.db #0x94	; 148
   6AE9 17                  130 	.db #0x17	; 23
   6AEA 76                  131 	.db #0x76	; 118	'v'
   6AEB FA                  132 	.db #0xFA	; 250
   6AEC DC                  133 	.db #0xDC	; 220
   6AED 5A                  134 	.db #0x5A	; 90	'Z'
   6AEE D8                  135 	.db #0xD8	; 216
   6AEF 22                  136 	.db #0x22	; 34
   6AF0 BC                  137 	.db #0xBC	; 188
   6AF1 6F                  138 	.db #0x6F	; 111	'o'
   6AF2 CF                  139 	.db #0xCF	; 207
   6AF3 2B                  140 	.db #0x2B	; 43
   6AF4 D0                  141 	.db #0xD0	; 208
   6AF5 B5                  142 	.db #0xB5	; 181
   6AF6 1A                  143 	.db #0x1A	; 26
   6AF7 BE                  144 	.db #0xBE	; 190
   6AF8 77                  145 	.db #0x77	; 119	'w'
   6AF9 8B                  146 	.db #0x8B	; 139
   6AFA DA                  147 	.db #0xDA	; 218
   6AFB 04                  148 	.db #0x04	; 4
   6AFC 96                  149 	.db #0x96	; 150
   6AFD A4                  150 	.db #0xA4	; 164
   6AFE 92                  151 	.db #0x92	; 146
   6AFF BA                  152 	.db #0xBA	; 186
   6B00 4D                  153 	.db #0x4D	; 77	'M'
   6B01 A2                  154 	.db #0xA2	; 162
   6B02 47                  155 	.db #0x47	; 71	'G'
   6B03 2E                  156 	.db #0x2E	; 46
   6B04 A8                  157 	.db #0xA8	; 168
   6B05 54                  158 	.db #0x54	; 84	'T'
   6B06 7B                  159 	.db #0x7B	; 123
   6B07 EE                  160 	.db #0xEE	; 238
   6B08 53                  161 	.db #0x53	; 83	'S'
   6B09 EF                  162 	.db #0xEF	; 239
   6B0A AB                  163 	.db #0xAB	; 171
   6B0B 43                  164 	.db #0x43	; 67	'C'
   6B0C 8E                  165 	.db #0x8E	; 142
   6B0D 3A                  166 	.db #0x3A	; 58
   6B0E 88                  167 	.db #0x88	; 136
   6B0F 29                  168 	.db #0x29	; 41
   6B10 E2                  169 	.db #0xE2	; 226
   6B11 3D                  170 	.db #0x3D	; 61
   6B12 D4                  171 	.db #0xD4	; 212
   6B13 BB                  172 	.db #0xBB	; 187
   6B14 FB                  173 	.db #0xFB	; 251
   6B15 74                  174 	.db #0x74	; 116	't'
   6B16 21                  175 	.db #0x21	; 33
   6B17 56                  176 	.db #0x56	; 86	'V'
   6B18 06                  177 	.db #0x06	; 6
   6B19 8A                  178 	.db #0x8A	; 138
   6B1A AE                  179 	.db #0xAE	; 174
   6B1B 8F                  180 	.db #0x8F	; 143
   6B1C 62                  181 	.db #0x62	; 98	'b'
   6B1D 61                  182 	.db #0x61	; 97	'a'
   6B1E 6E                  183 	.db #0x6E	; 110	'n'
   6B1F 4C                  184 	.db #0x4C	; 76	'L'
   6B20 1D                  185 	.db #0x1D	; 29
   6B21 78                  186 	.db #0x78	; 120	'x'
   6B22 87                  187 	.db #0x87	; 135
   6B23 89                  188 	.db #0x89	; 137
   6B24 91                  189 	.db #0x91	; 145
   6B25 0C                  190 	.db #0x0C	; 12
   6B26 9A                  191 	.db #0x9A	; 154
   6B27 95                  192 	.db #0x95	; 149
   6B28 40                  193 	.db #0x40	; 64
   6B29 12                  194 	.db #0x12	; 18
   6B2A 7C                  195 	.db #0x7C	; 124
   6B2B 07                  196 	.db #0x07	; 7
   6B2C 3B                  197 	.db #0x3B	; 59
   6B2D EB                  198 	.db #0xEB	; 235
   6B2E 71                  199 	.db #0x71	; 113	'q'
   6B2F 13                  200 	.db #0x13	; 19
   6B30 F2                  201 	.db #0xF2	; 242
   6B31 4F                  202 	.db #0x4F	; 79	'O'
   6B32 0A                  203 	.db #0x0A	; 10
   6B33 3C                  204 	.db #0x3C	; 60
   6B34 F0                  205 	.db #0xF0	; 240
   6B35 65                  206 	.db #0x65	; 101	'e'
   6B36 03                  207 	.db #0x03	; 3
   6B37 64                  208 	.db #0x64	; 100	'd'
   6B38 6A                  209 	.db #0x6A	; 106	'j'
   6B39 02                  210 	.db #0x02	; 2
   6B3A FC                  211 	.db #0xFC	; 252
   6B3B C5                  212 	.db #0xC5	; 197
   6B3C 01                  213 	.db #0x01	; 1
   6B3D 15                  214 	.db #0x15	; 21
   6B3E 5C                  215 	.db #0x5C	; 92
   6B3F 98                  216 	.db #0x98	; 152
   6B40 97                  217 	.db #0x97	; 151
   6B41 2F                  218 	.db #0x2F	; 47
   6B42 84                  219 	.db #0x84	; 132
   6B43 F9                  220 	.db #0xF9	; 249
   6B44 33                  221 	.db #0x33	; 51	'3'
   6B45 16                  222 	.db #0x16	; 22
   6B46 72                  223 	.db #0x72	; 114	'r'
   6B47 BF                  224 	.db #0xBF	; 191
   6B48 1B                  225 	.db #0x1B	; 27
   6B49 F6                  226 	.db #0xF6	; 246
   6B4A C9                  227 	.db #0xC9	; 201
   6B4B 7D                  228 	.db #0x7D	; 125
   6B4C 37                  229 	.db #0x37	; 55	'7'
   6B4D 90                  230 	.db #0x90	; 144
   6B4E 58                  231 	.db #0x58	; 88	'X'
   6B4F 27                  232 	.db #0x27	; 39
   6B50 14                  233 	.db #0x14	; 20
   6B51 9D                  234 	.db #0x9D	; 157
   6B52 35                  235 	.db #0x35	; 53	'5'
   6B53 A5                  236 	.db #0xA5	; 165
   6B54 C2                  237 	.db #0xC2	; 194
   6B55 C3                  238 	.db #0xC3	; 195
   6B56 E8                  239 	.db #0xE8	; 232
   6B57 E9                  240 	.db #0xE9	; 233
   6B58 11                  241 	.db #0x11	; 17
   6B59 31                  242 	.db #0x31	; 49	'1'
   6B5A B7                  243 	.db #0xB7	; 183
   6B5B 67                  244 	.db #0x67	; 103	'g'
   6B5C CB                  245 	.db #0xCB	; 203
   6B5D AC                  246 	.db #0xAC	; 172
   6B5E 7F                  247 	.db #0x7F	; 127
   6B5F 2D                  248 	.db #0x2D	; 45
   6B60 7E                  249 	.db #0x7E	; 126
   6B61 44                  250 	.db #0x44	; 68	'D'
   6B62 A6                  251 	.db #0xA6	; 166
   6B63 ED                  252 	.db #0xED	; 237
   6B64 A7                  253 	.db #0xA7	; 167
   6B65 C6                  254 	.db #0xC6	; 198
   6B66 0B                  255 	.db #0x0B	; 11
   6B67 E6                  256 	.db #0xE6	; 230
   6B68 AD                  257 	.db #0xAD	; 173
   6B69 22                  258 	.db #0x22	; 34
   6B6A F4                  259 	.db #0xF4	; 244
   6B6B F5                  260 	.db #0xF5	; 245
   6B6C C4                  261 	.db #0xC4	; 196
   6B6D C8                  262 	.db #0xC8	; 200
   6B6E 5F                  263 	.db #0x5F	; 95
   6B6F CE                  264 	.db #0xCE	; 206
   6B70 E0                  265 	.db #0xE0	; 224
   6B71 49                  266 	.db #0x49	; 73	'I'
   6B72 E3                  267 	.db #0xE3	; 227
   6B73 EC                  268 	.db #0xEC	; 236
   6B74 39                  269 	.db #0x39	; 57	'9'
   6B75 D3                  270 	.db #0xD3	; 211
   6B76 19                  271 	.db #0x19	; 25
   6B77 79                  272 	.db #0x79	; 121	'y'
   6B78 26                  273 	.db #0x26	; 38
   6B79 A1                  274 	.db #0xA1	; 161
   6B7A CA                  275 	.db #0xCA	; 202
   6B7B 83                  276 	.db #0x83	; 131
   6B7C BD                  277 	.db #0xBD	; 189
   6B7D 30                  278 	.db #0x30	; 48	'0'
   6B7E 99                  279 	.db #0x99	; 153
   6B7F 85                  280 	.db #0x85	; 133
   6B80 CC                  281 	.db #0xCC	; 204
   6B81 81                  282 	.db #0x81	; 129
   6B82 05                  283 	.db #0x05	; 5
   6B83 1F                  284 	.db #0x1F	; 31
   6B84 9C                  285 	.db #0x9C	; 156
   6B85 41                  286 	.db #0x41	; 65	'A'
   6B86 32                  287 	.db #0x32	; 50	'2'
   6B87 36                  288 	.db #0x36	; 54	'6'
   6B88 F7                  289 	.db #0xF7	; 247
   6B89 4A                  290 	.db #0x4A	; 74	'J'
   6B8A A0                  291 	.db #0xA0	; 160
   6B8B 6B                  292 	.db #0x6B	; 107	'k'
   6B8C DF                  293 	.db #0xDF	; 223
   6B8D 8C                  294 	.db #0x8C	; 140
   6B8E B3                  295 	.db #0xB3	; 179
   6B8F DE                  296 	.db #0xDE	; 222
   6B90 FE                  297 	.db #0xFE	; 254
   6B91 B2                  298 	.db #0xB2	; 178
   6B92 09                  299 	.db #0x09	; 9
   6B93 B4                  300 	.db #0xB4	; 180
   6B94 A3                  301 	.db #0xA3	; 163
   6B95 28                  302 	.db #0x28	; 40
   6B96 D6                  303 	.db #0xD6	; 214
   6B97 E5                  304 	.db #0xE5	; 229
   6B98 0F                  305 	.db #0x0F	; 15
   6B99 C1                  306 	.db #0xC1	; 193
   6B9A E4                  307 	.db #0xE4	; 228
   6B9B 1C                  308 	.db #0x1C	; 28
   6B9C 34                  309 	.db #0x34	; 52	'4'
   6B9D B1                  310 	.db #0xB1	; 177
   6B9E 57                  311 	.db #0x57	; 87	'W'
   6B9F 25                  312 	.db #0x25	; 37
   6BA0 59                  313 	.db #0x59	; 89	'Y'
   6BA1 B9                  314 	.db #0xB9	; 185
   6BA2 9B                  315 	.db #0x9B	; 155
   6BA3 0E                  316 	.db #0x0E	; 14
   6BA4 D1                  317 	.db #0xD1	; 209
   6BA5 10                  318 	.db #0x10	; 16
   6BA6 A9                  319 	.db #0xA9	; 169
   6BA7 68                  320 	.db #0x68	; 104	'h'
   6BA8 00                  321 	.db #0x00	; 0
   6BA9 8D                  322 	.db #0x8D	; 141
   6BAA 55                  323 	.db #0x55	; 85	'U'
   6BAB 3E                  324 	.db #0x3E	; 62
   6BAC 1E                  325 	.db #0x1E	; 30
   6BAD 4B                  326 	.db #0x4B	; 75	'K'
                            327 	.area _CODE
                            328 	.area _INITIALIZER
                            329 	.area _CABS (ABS)
