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
#include "game.h"

void inicializar(){
	cpct_disableFirmware();
	cpct_setBorder(HW_BLACK);
	cpct_setPalette(g_palette,16);

	//Mode 0 (160x200, 16 colours)
	cpct_setVideoMode(0);
}

void main(void) {

	inicializar();

   // Loop forever
   while (1){
   	play();
   }
}