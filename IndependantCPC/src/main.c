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
#include "naves.h"
#include "hero.h"

#define VMEM_START (u8*)0xC000

typedef struct{
	u8 x,y;
	u8* sprite;
}TPlayer;

TPlayer player;

void dibujarPlayer(){
	u8* vmem = cpct_getScreenPtr(CPCT_VMEM_START,player.x, player.y);
	cpct_drawSprite(player.sprite,vmem,8,17);
}

void inicializar(){
	u8* vmem;

	cpct_disableFirmware();
	cpct_setVideoMode(0);
	cpct_setBorder(HW_BLACK);
	cpct_setPalette(g_palette,16);

	player.x = 100;
	player.y = 50;
	player.sprite = g_naves_0;


	dibujarPlayer();
	/*vmem = cpct_getScreenPtr(CPCT_VMEM_START,player.x, player.y);
	cpct_drawSprite(player.sprite,vmem,8,17);*/

}

void main(void) {

	
	//dibujarProta();
	inicializar();

   // Loop forever
   while (1);
}