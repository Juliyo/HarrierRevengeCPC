#include "fantasma.h"
// Data created with Img2CPC - (c) Retroworks - 2007-2015
// Palette uses hardware values.
const u8 g_palette[16] = { 0x54, 0x44, 0x5c, 0x58, 0x45, 0x56, 0x46, 0x5e, 0x40, 0x47, 0x42, 0x53, 0x5a, 0x4a, 0x43, 0x4b };

// Tile g_fantasma: 16x16 pixels, 8x16 bytes.
const u8 g_fantasma[8 * 16] = {
	0xff, 0xff, 0x00, 0x00, 0x00, 0x00, 0xff, 0xff,
	0xff, 0x00, 0x30, 0x30, 0x20, 0x00, 0x55, 0xff,
	0xaa, 0x30, 0x30, 0x20, 0x55, 0xab, 0x02, 0xff,
	0x10, 0x30, 0x30, 0x20, 0xff, 0xff, 0x03, 0x55,
	0xaa, 0x30, 0x30, 0x00, 0xff, 0xff, 0x03, 0x55,
	0xff, 0x00, 0x00, 0x55, 0xaa, 0x55, 0x00, 0x02,
	0xaa, 0x00, 0x00, 0x55, 0xaa, 0x55, 0x00, 0x02,
	0xaa, 0x30, 0x30, 0x55, 0xff, 0xff, 0xab, 0x02,
	0xaa, 0x30, 0x30, 0x00, 0xff, 0xff, 0xab, 0x02,
	0xff, 0x10, 0x30, 0x20, 0xff, 0xaa, 0xab, 0x00,
	0xaa, 0x10, 0x30, 0x20, 0x55, 0xaa, 0x03, 0x55,
	0xaa, 0x20, 0x00, 0x30, 0x00, 0xab, 0x02, 0x08,
	0x10, 0x30, 0x20, 0x00, 0xf3, 0x00, 0x10, 0x08,
	0x00, 0x04, 0x0c, 0x08, 0x10, 0x30, 0x20, 0x00,
	0xff, 0x00, 0x00, 0x00, 0x02, 0x04, 0x0c, 0x55,
	0xff, 0xff, 0x00, 0xff, 0xab, 0x00, 0x00, 0xff
};

