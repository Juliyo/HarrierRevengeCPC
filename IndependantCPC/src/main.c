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
//prueba de commit
#include <cpctelera.h>
#include "sprites/naves.h"
#include "sprites/portada.h"
#include "sprites/flores1.h"
#include "sprites/flores2.h"
#include "game.h"

u8 mostrarMenu = 1;

void inicializar(){
	cpct_disableFirmware();
	cpct_setBorder(HW_BLACK);
	cpct_setPalette(g_palette,16);

	//Mode 0 (160x200, 16 colours)
	cpct_setVideoMode(0);
}

void menu(){
	u8* pvideomem;
	pvideomem = CPCT_VMEM_START;
	cpct_clearScreen(0);
	cpct_drawSprite (g_flores1_0,
					 cpctm_screenPtr(CPCT_VMEM_START, 0, 0)
					,G_FLORES1_0_W, G_FLORES1_0_H);	
	cpct_drawSprite (g_flores1_1,
					 cpctm_screenPtr(CPCT_VMEM_START, G_FLORES1_0_W, 0)
					,G_FLORES1_0_W, G_FLORES1_0_H);	

	cpct_drawSprite (g_flores2_0,
					 cpctm_screenPtr(CPCT_VMEM_START, 0, 180)
					,G_FLORES2_0_W, G_FLORES2_0_H);	
	cpct_drawSprite (g_flores2_1,
					 cpctm_screenPtr(CPCT_VMEM_START, G_FLORES2_0_W, 180)
					,G_FLORES2_0_W, G_FLORES2_0_H);	

	cpct_drawSprite (g_portada_0,
					 cpctm_screenPtr(CPCT_VMEM_START, 0, 10)
					,G_PORTADA_0_W, G_PORTADA_0_H);	
	cpct_drawSprite (g_portada_1,
					 cpctm_screenPtr(CPCT_VMEM_START, G_PORTADA_0_W, 10)
					,G_PORTADA_0_W, G_PORTADA_0_H);	

	cpct_drawStringM0("PRESS ENTER", cpct_getScreenPtr(CPCT_VMEM_START, 17, 160), 6, 0);
	if(player.vida == 0){
		cpct_drawStringM0("GAME OVER", cpct_getScreenPtr(CPCT_VMEM_START, 20, 110), 3, 0);
	}
	if(basesCapturadas == 6){
		cpct_drawStringM0("YOU WON!", cpct_getScreenPtr(CPCT_VMEM_START, 24, 110), 3, 0);
	}
	do{
		cpct_scanKeyboard_f();
	}while(!cpct_isKeyPressed(Key_Enter));
	mostrarMenu = 0;

}


void main(void) {

	inicializar();

   // Loop forever
   while (1){
   	if(mostrarMenu % 2 == 0){
   		menu();
   	}
   	play();
   	//mostrarMenu = 1;
   }
}