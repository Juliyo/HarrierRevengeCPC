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
//#include "fantasma.h"
#include "retropolis.h"
#include "tiles.h"
#include "map1.h"
//#include "hero.h"
#include "nave.h"


#define SI 1
#define NO 0

#define ORIGEN_MAPA_Y 68
#define ORIGEN_MAPA cpctm_screenPtr(CPCT_VMEM_START, 0, ORIGEN_MAPA_Y)
#define VMEM (u8*) 0xC000

//creamos la tabla de tansparencias
cpctm_createTransparentMaskTable(g_tablatrans,0x0100, M0, 0);


typedef struct{
		
		u8 x, y;
		u8 px, py;
		u8* sprite;
		u8 mover;

} TProta;

TProta prota;
u8* mapa;

void interrupcion() {
   static u8 kk;

   if (++kk == 5) {
      //playmusic();
      cpct_scanKeyboard_if();
      kk = 0;
   }
}

void dibujarProta(){

	u8* pvmem	= cpct_getScreenPtr(CPCT_VMEM_START, prota.x, prota.y);


	/*
	//din tabla de transparencias
	cpct_drawSprite(prota.sprite, pvmem, G_HERO_00_W, G_HERO_00_H);
	*/

	//con tabla de transparencias
	 cpct_drawSpriteMaskedAlignedTable (prota.sprite, pvmem, G_NAVE_0_W, 
	 		G_NAVE_0_H, g_tablatrans);


}

void dibujaRotulo(){
	cpct_drawSprite(g_retropolis_0, 
									cpctm_screenPtr(CPCT_VMEM_START,0,0)
									,G_RETROPOLIS_0_W,G_RETROPOLIS_0_H);
	cpct_drawSprite(g_retropolis_1,
									cpctm_screenPtr(CPCT_VMEM_START, G_RETROPOLIS_0_W, 0)
									,G_RETROPOLIS_1_W, G_RETROPOLIS_1_H);

}

void dibujarMapa(){
	cpct_etm_drawTilemap2x4(g_map1_W, g_map1_H, cpctm_screenPtr(CPCT_VMEM_START,0,68)
											,mapa);
}

#define ANCHO_PANTALLA 80
#define LIMITE_DERECHO ANCHO_PANTALLA - G_NAVE_0_W

void moverIzquierda(){
	if(prota.x > 0 ){
		prota.x--;
		prota.mover = SI;
	}
}

void moverDerecha(){
	if(prota.x < LIMITE_DERECHO){
		prota.x++;
		prota.mover = SI;
	}
}

void comprobarTeclado(){

	cpct_scanKeyboard_if();
	if(cpct_isAnyKeyPressed()){
		if(cpct_isKeyPressed(Key_CursorLeft)){
			moverIzquierda();
		}else if(cpct_isKeyPressed(Key_CursorRight)){
			moverDerecha();
		}
	}
}







void borrarProta(){

	u8 w = 2 + (prota.px & 1);
	u8 h = 7 + (prota.py & 3 ? 1: 0);
	cpct_etm_drawTileBox2x4 (prota.px/2, (prota.py - ORIGEN_MAPA_Y)/4,w, h,g_map1_W,ORIGEN_MAPA,mapa);

}

void redibujarProta(){

	borrarProta();
	prota.px = prota.x;
	prota.py = prota.y;
	dibujarProta();

}




void inicializar(){

	cpct_disableFirmware();
	cpct_setVideoMode(0);
	cpct_setBorder(HW_BLACK);
	cpct_setPalette(g_palette, 16);

	prota.x = prota.px = 20;
	prota.y = prota.py = 160;
	prota.mover = NO;
	prota.sprite = g_nave_0;

	dibujaRotulo();


	mapa = g_map1;
	cpct_etm_setTileset2x4(g_tileset);
	dibujarMapa();

	dibujarProta();

	cpct_setInterruptHandler(interrupcion);





}




void main(void) {
	
	inicializar();


  // Loop forever
  while (1){
  	comprobarTeclado();
  	if(prota.mover){
  		redibujarProta(); //es muy lento dibujarlo todo el rato
  		prota.mover = NO;
  	}
  	
  }
}
