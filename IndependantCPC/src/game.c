#include <stdio.h>
#include <cpctelera.h>
#include "sprites/naves.h"
#include "sprites/bala.h"
#include "sprites/paletajulinho.h"
#include "mapas/map11.h"
#include "mapas/map12.h"
#include "mapas/map21.h"
#include "mapas/map22.h"
#include "mapas/map31.h"
#include "mapas/map32.h"

#include "game.h"
#include "entities/entities.h"

const TPlayer player = {
	{		
		0,	
		1,
		NO,
		{
			0,				//x
			0,				//y
			0,				//px
			0,				//py
			3,				//vx
			6,				//vy
			NO,				//draw
			{				//sprites
				g_bala_0,
				g_bala_1,
				g_bala_2,
				g_bala_3,
			},		
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
		{				//sprites
			g_naves_0,
			g_naves_1,
			g_naves_2,
			g_naves_3,
		},	
		G_NAVES_0_W,	//sw
		G_NAVES_0_H,	//sh
		d_up			//curr_dir
	}

	
};

const u8* mapa = NULL;

u8* const mapas[NUM_MAPAS] = { g_map11, g_map12, g_map21, g_map22, g_map31, g_map32 };
u8 mapaActual = 0;

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

u8 cambiarMapa(u8 suma, u8 cantidad){
	if(suma % 2 != 0){ //tengo que sumar
		mapaActual = mapaActual + cantidad;
		mapa = mapas[mapaActual];
		dibujarMapa();
	}else{//tengo que restar
		mapaActual = mapaActual - cantidad;
		mapa = mapas[mapaActual];
		dibujarMapa();
	}
	return mapaActual;
}	

void cambiarDerecha(TEntity* ent){
	if(mapaActual >= 0 && mapaActual < 6 && mapaActual % 2 == 0){ //pongo a mano el numero de mapas que hay en total y se mueve si son pares
		mapaActual = cambiarMapa(1,1);
		ent->x = 0; //esto es para cambiar la posision del player cuando cambia de mapa.
	}
}
void updateUser(){
	// Scan Keyboard
	cpct_scanKeyboard_if();
	if(cpct_isAnyKeyPressed()){
		if(cpct_isKeyPressed(Key_Space)){
			disparar(&player.bullet, player.ent.x, player.ent.y, player.ent.curr_dir);
		}

		if(cpct_isKeyPressed(Key_CursorUp)){
			accion(&player.ent, es_mover, d_up);
		}else if(cpct_isKeyPressed(Key_CursorDown)){
			accion(&player.ent, es_mover, d_down);
		}else if(cpct_isKeyPressed(Key_CursorRight)){
			if(accion(&player.ent,es_mover,d_right) == d_right)
				cambiarDerecha(&player.ent);
		}else if(cpct_isKeyPressed(Key_CursorLeft)){
			accion(&player.ent,es_mover,d_left);
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