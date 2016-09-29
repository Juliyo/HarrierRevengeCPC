#include <stdio.h>
#include <cpctelera.h>
#include "sprites/naves.h"
#include "sprites/tileset4x4.h"
#include "sprites/bala.h"
#include "mapas/mapa1.h"

#include "game.h"
#include "entities/entities.h"

const TPlayer player = {
	{		
		0,	
		2,
		NO,
		{
			0,				//x
			0,				//y
			0,				//px
			0,				//py
			6,				//vx
			12,				//vy
			NO,				//draw
			g_bala_0,		//sprite
			G_BALA_0_W,		//sw
			G_BALA_0_H,		//sh
			d_up			//curr_dir
		}
	},
	{
		20,				//x
		157,			//y
		20,				//px
		157,			//py
		1,				//vx
		2,				//vy
		SI,				//draw
		g_naves_0,		//sprite
		G_NAVES_0_W,	//sw
		G_NAVES_0_H,	//sh
		d_up			//curr_dir
	}

	
};

const u8* mapa = NULL;


void inicializarPantalla(){
	//Limpiar la pantalla
	cpct_clearScreen(0);

	mapa = g_map1;
	cpct_etm_setTileset2x4(g_tileset);
	dibujarMapa();
	//Aqui dibujariamos cosas de la pantalla 
}

void dibujarMapa(){
	cpct_etm_drawTilemap2x4(g_map1_W, g_map1_H, ORIGEN_MAPA, mapa);
}

void updateUser(){
	// Scan Keyboard
	cpct_scanKeyboard_if();
	if(cpct_isAnyKeyPressed()){
		if(cpct_isKeyPressed(Key_CursorUp)){
			accion(&player.ent, es_mover, d_up);
		}else if(cpct_isKeyPressed(Key_CursorDown)){
			accion(&player.ent, es_mover, d_down);
		}else if(cpct_isKeyPressed(Key_CursorRight)){
			accion(&player.ent,es_mover,d_right);
		}else if(cpct_isKeyPressed(Key_CursorLeft)){
			accion(&player.ent,es_mover,d_left);
		}else if(cpct_isKeyPressed(Key_Space)){
			disparar(&player.bullet, player.ent.x, player.ent.y, player.ent.curr_dir);
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
		//updateEntities();
		//cpct_setBorder(HW_RED);
		calculaAllEntities(&player);
		//cpct_setBorder(HW_RED);
		cpct_waitVSYNC();
		//cpct_setBorder(HW_GREEN);
		drawAll(&player);
		//cpct_setBorder(HW_GREEN);
	}
}