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
	{					//Bullet
		0,				//frameCount
		1,				//FrameLimit	
		es_static,		//state
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
			d_up,			//curr_dir
			e_bullet,		//Bullet
			{
				0,
				0,
				G_BALA_0_W,
				G_BALA_0_H
			}
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
		d_up,			//curr_dir
		e_player,		//Player Entity
		{
			20,
			157,
			G_NAVES_0_W,
			G_NAVES_0_H
		}
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

void cambiarIzquierda(TEntity* ent){
	if(mapaActual >= 0 && mapaActual < 6 && mapaActual % 2 != 0){ //pongo a mano el numero de mapas que hay en total y se mueve si son impares
		mapaActual = cambiarMapa(0,1);
		ent->x = 74;//80-6 == ancho del mapa - ancho sprite(en bytes), poner en variables
	}
}

void cambiarArriba(TEntity* ent){
	if(mapaActual >= 0 && mapaActual < 4){//desde los 4 primeros mapas puedo subir
		mapaActual = cambiarMapa(1,2);
		ent->y = 188;//200-12 == alto del mapa - alto sprite, poner en variables
	}
		
}

void cambiarAbajo(TEntity* ent){
	if(mapaActual > 1 && mapaActual < 6){ //desde los 4 ultimos mapas puedo bajar
		mapaActual = cambiarMapa(0,2);
		ent->y = 40;//en 40 comienza el mapa a pintarse
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
			if(accion(&player.ent, es_mover, d_up) == d_up){
				cambiarArriba(&player.ent);
			}
		}else if(cpct_isKeyPressed(Key_CursorDown)){
			if(accion(&player.ent, es_mover, d_down) == d_down){
				cambiarAbajo(&player.ent);
			}
		}else if(cpct_isKeyPressed(Key_CursorRight)){
			if(accion(&player.ent,es_mover,d_right) == d_right){
				cambiarDerecha(&player.ent);
			}
		}else if(cpct_isKeyPressed(Key_CursorLeft)){
			if(accion(&player.ent,es_mover,d_left) == d_left){
				cambiarIzquierda(&player.ent);
			}
		}
	}

}

u8 checkCollision(TCollision *col1, TCollision *col2){
	u8 collide;
	u8 str[1];
	if (col1->x < col2->x + col2->w &&
	   col1->x + col1->w > col2->x &&
	   col1->y < col2->y + col2->h &&
	   col1->h + col1->y > col2->y) {
   		// collision detected!
   		collide = 1;
	}else{
		collide = 0;
	}
	/*sprintf(str,"%d",collide);
	cpct_drawStringM0(str, cpct_getScreenPtr(CPCT_VMEM_START,20,10), 1, 0);*/
	return collide;
}

void calculaColisiones(){
	TEnemy *enemigos;
	u8 collide,i;
	enemigos = getEnemies();

	//PLAYER - ENEMIES
	for(i=0;i<NUM_ENEMIGOS;++i){
		collide = checkCollision(&player.ent.coll, &enemigos[i].ent.coll);
		if(collide){
			cpct_setBorder(HW_RED);
			break;
		}
	}
	
	//BALA - ENEMIGO
	for(i=0;i<NUM_ENEMIGOS;++i){
		collide = checkCollision(&player.bullet.ent.coll, &enemigos[i].ent.coll);
		if(collide){
			cpct_setBorder(HW_BLUE);
			break;
		}
	}
	
	
	//sprintf(str,"%d",collide);
	//cpct_drawStringM0(str, cpct_getScreenPtr(CPCT_VMEM_START,10,10), 1, 0);
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
		calculaColisiones();
		calculaAllEntities(&player);
		//cpct_setBorder(HW_RED);
		cpct_waitVSYNC();
		//cpct_setBorder(HW_GREEN);
		drawAll(&player);
		//cpct_setBorder(HW_GREEN);
	}
}