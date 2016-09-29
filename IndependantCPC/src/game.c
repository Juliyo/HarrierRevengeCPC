#include <stdio.h>
#include <cpctelera.h>
#include "sprites/naves.h"
#include "sprites/paletajulinho.h"
#include "mapas/map11.h"

#include "game.h"
#include "entities/entities.h"

const TEntity player = {
	20,
	157,
	player.x,
	player.y,
	SI,
	g_naves_0,
	d_up
};

const u8* mapa = NULL;


void inicializarPantalla(){
	//Limpiar la pantalla
	cpct_clearScreen(0);

	mapa = g_map11;
	cpct_etm_setTileset2x4(g_tileset);
	dibujarMapa();
	//Aqui dibujariamos cosas de la pantalla 
}

void dibujarMapa(){
	cpct_etm_drawTilemap2x4(g_map11_W, g_map11_H, ORIGEN_MAPA, mapa);
}

void updateUser(){
	// Scan Keyboard
	cpct_scanKeyboard_if();
	if(cpct_isAnyKeyPressed()){
		if(cpct_isKeyPressed(Key_CursorUp)){
			accion(&player, es_mover, d_up);
		}else if(cpct_isKeyPressed(Key_CursorDown)){
			accion(&player, es_mover, d_down);
		}else if(cpct_isKeyPressed(Key_CursorRight)){
			accion(&player,es_mover,d_right);
		}else if(cpct_isKeyPressed(Key_CursorLeft)){
			accion(&player,es_mover,d_left);
		}
	}
   


}

void play(){

	u8 alive = 1;

	inicializarPantalla();
	incializarEntities();

	//Esto seria mientras estes vivo
	while(alive){
		

		updateUser();	
		alive = updatePlayer(&player);
		updateEntities();
		cpct_waitVSYNC();
		drawAll(&player);
	}
	
}