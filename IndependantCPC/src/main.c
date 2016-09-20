//-----------------------------LICENSE NOTICE------------------------------------
//  This file is part of CPCtelera: An Amstrad CPC Game Engine
//  Copyright (C) 2015 ronaldo / Fremos / Cheesetea / ByteRealms (@FranGallegoBR)
//
//  This program is free software: you can redistribute it and/or modify
//  it under the terms of the GNU Lesser General Public License as published by
//  the Free Software Foundation, either version 3 of the License, or
//  (at your option) any later version.
//
//  This program is distributed in the hope that it will be useful,
//  but WITHOUT ANY WARRANTY; without even the implied warranty of
//  MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
//  GNU Lesser General Public License for more details.
//
//  You should have received a copy of the GNU Lesser General Public License
//  along with this program.  If not, see <http://www.gnu.org/licenses/>.
//------------------------------------------------------------------------------

#include <cpctelera.h>
#include "ghost.h"
//#include "hero.h"

#define VMEM_START (u8*)0xC000

//Pos. memoria
//u8* vmem;

/*void dibujarProta() {
	u8* vmem = cpct_getScreenPtr(CPCT_VMEM_START,20, 20);
	cpct_drawSprite(g_hero_00,vmem,8,27);
}*/


void main(void) {

	cpct_disableFirmware();
	cpct_setVideoMode(0);
	cpct_setBorder(HW_BLACK);

	cpct_setPalette(g_palette,16);
	//dibujarProta();
	/*vmem = cpct_getScreenPtr(CPCT_VMEM_START,20, 20);*/
	cpct_drawSprite(g_ghost,VMEM_START,8,16);

   // Loop forever
   while (1);
}
