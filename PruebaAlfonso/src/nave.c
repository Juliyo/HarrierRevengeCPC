#include "nave.h"
// Data created with Img2CPC - (c) Retroworks - 2007-2015
// Tile g_nave_0: 16x16 pixels, 8x16 bytes.
const u8 g_nave_0[8 * 16] = {
	0x00, 0x00, 0x00, 0x04, 0x08, 0x00, 0x00, 0x00,
	0x00, 0x00, 0x00, 0x04, 0x08, 0x00, 0x00, 0x00,
	0x00, 0x00, 0x00, 0xff, 0xff, 0x00, 0x00, 0x00,
	0x00, 0xaa, 0x00, 0xea, 0xd5, 0x00, 0x55, 0x00,
	0x00, 0xaa, 0x00, 0xea, 0xd5, 0x00, 0x55, 0x00,
	0x55, 0x00, 0x55, 0xff, 0xff, 0xaa, 0x00, 0xaa,
	0x55, 0x00, 0x55, 0xc0, 0xc0, 0xaa, 0x00, 0xaa,
	0x55, 0x00, 0x55, 0xc0, 0xc0, 0xaa, 0x00, 0xaa,
	0x55, 0xaa, 0xff, 0xc0, 0xc0, 0xff, 0x55, 0xaa,
	0x55, 0xff, 0xd5, 0xc0, 0xc0, 0xea, 0xff, 0xaa,
	0x55, 0xea, 0xd5, 0xc0, 0xc0, 0xea, 0xd5, 0xaa,
	0xff, 0xc0, 0xd5, 0xc0, 0xc0, 0xea, 0xc0, 0xff,
	0xea, 0xc0, 0xff, 0xc0, 0xc0, 0xff, 0xc0, 0xd5,
	0xea, 0xd5, 0x55, 0xea, 0xd5, 0xaa, 0xea, 0xd5,
	0xea, 0xaa, 0x00, 0xae, 0x5d, 0x00, 0x55, 0xd5,
	0xff, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0xff
};

// Tile g_nave_1: 16x16 pixels, 8x16 bytes.
const u8 g_nave_1[8 * 16] = {
	0xff, 0xff, 0xaa, 0x00, 0x00, 0x00, 0x00, 0x00,
	0xea, 0xc0, 0xff, 0xff, 0xff, 0xaa, 0x00, 0x00,
	0x55, 0xc0, 0xd5, 0xff, 0x00, 0x55, 0xaa, 0x00,
	0x00, 0xea, 0xc0, 0xaa, 0x00, 0x00, 0x00, 0x00,
	0x00, 0x55, 0xc0, 0xd5, 0x00, 0x00, 0x00, 0x00,
	0x00, 0xff, 0xff, 0xff, 0xff, 0xaa, 0x00, 0x00,
	0x55, 0xea, 0xc0, 0xc0, 0xc0, 0xff, 0xff, 0x00,
	0x04, 0xc0, 0xc0, 0xc0, 0xc0, 0xea, 0xd5, 0x0c,
	0x04, 0xc0, 0xc0, 0xc0, 0xc0, 0xea, 0xd5, 0x0c,
	0x55, 0xea, 0xc0, 0xc0, 0xc0, 0xff, 0xff, 0x00,
	0x00, 0xff, 0xff, 0xff, 0xff, 0xaa, 0x00, 0x00,
	0x00, 0x55, 0xc0, 0xd5, 0x00, 0x00, 0x00, 0x00,
	0x00, 0xea, 0xc0, 0xaa, 0x00, 0x00, 0x00, 0x00,
	0x55, 0xc0, 0xd5, 0xff, 0xaa, 0x55, 0xaa, 0x00,
	0xea, 0xc0, 0xff, 0xff, 0xff, 0xaa, 0x00, 0x00,
	0xff, 0xff, 0xaa, 0x00, 0x00, 0x00, 0x00, 0x00
};

// Tile g_nave_2: 16x16 pixels, 8x16 bytes.
const u8 g_nave_2[8 * 16] = {
	0xff, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0xff,
	0xea, 0xaa, 0x00, 0xae, 0x5d, 0x00, 0x55, 0xd5,
	0xea, 0xd5, 0x55, 0xea, 0xd5, 0xaa, 0xea, 0xd5,
	0xea, 0xc0, 0xff, 0xc0, 0xc0, 0xff, 0xc0, 0xd5,
	0x55, 0xc0, 0xd5, 0xc0, 0xc0, 0xea, 0xc0, 0xaa,
	0x55, 0xea, 0xd5, 0xc0, 0xc0, 0xea, 0xd5, 0xaa,
	0x55, 0xff, 0xd5, 0xc0, 0xc0, 0xea, 0xff, 0xaa,
	0x55, 0xaa, 0xff, 0xc0, 0xc0, 0xff, 0x55, 0xaa,
	0x55, 0x00, 0x55, 0xc0, 0xc0, 0xaa, 0x00, 0xaa,
	0x55, 0x00, 0x55, 0xc0, 0xc0, 0xaa, 0x00, 0xaa,
	0x55, 0x00, 0x55, 0xff, 0xff, 0xaa, 0x00, 0xaa,
	0x00, 0xaa, 0x00, 0xea, 0xd5, 0x00, 0x55, 0x00,
	0x00, 0xaa, 0x00, 0xea, 0xd5, 0x00, 0x55, 0x00,
	0x00, 0x00, 0x00, 0xff, 0xff, 0x00, 0x00, 0x00,
	0x00, 0x00, 0x00, 0x04, 0x08, 0x00, 0x00, 0x00,
	0x00, 0x00, 0x00, 0x04, 0x08, 0x00, 0x00, 0x00
};

// Tile g_nave_3: 16x16 pixels, 8x16 bytes.
const u8 g_nave_3[8 * 16] = {
	0x00, 0x00, 0x00, 0x00, 0x00, 0x55, 0xff, 0xff,
	0x00, 0x00, 0x55, 0xff, 0xff, 0xff, 0xc0, 0xd5,
	0x00, 0x55, 0xaa, 0x00, 0xff, 0xea, 0xc0, 0xaa,
	0x00, 0x00, 0x00, 0x00, 0x55, 0xc0, 0xd5, 0x00,
	0x00, 0x00, 0x00, 0x00, 0xea, 0xc0, 0xaa, 0x00,
	0x00, 0x00, 0x55, 0xff, 0xff, 0xff, 0xff, 0x00,
	0x00, 0xff, 0xff, 0xc0, 0xc0, 0xc0, 0xd5, 0xaa,
	0x0c, 0xea, 0xd5, 0xc0, 0xc0, 0xc0, 0xc0, 0x08,
	0x0c, 0xea, 0xd5, 0xc0, 0xc0, 0xc0, 0xc0, 0x08,
	0x00, 0xff, 0xff, 0xc0, 0xc0, 0xc0, 0xd5, 0xaa,
	0x00, 0x00, 0x55, 0xff, 0xff, 0xff, 0xff, 0x00,
	0x00, 0x00, 0x00, 0x00, 0xea, 0xc0, 0xaa, 0x00,
	0x00, 0x00, 0x00, 0x00, 0x55, 0xc0, 0xd5, 0x00,
	0x00, 0x55, 0xaa, 0x00, 0xff, 0xea, 0xc0, 0xaa,
	0x00, 0x00, 0x55, 0xff, 0xff, 0xff, 0xc0, 0xd5,
	0x00, 0x00, 0x00, 0x00, 0x00, 0x55, 0xff, 0xff
};

