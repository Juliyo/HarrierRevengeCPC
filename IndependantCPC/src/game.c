#include <stdio.h>
#include <cpctelera.h>
#include "sprites/naves.h"
#include "sprites/bala.h"
#include "sprites/paletajulinho.h"
#include "sprites/hearth.h"
#include "mapas/map11.h"
#include "mapas/map12.h"
#include "mapas/map21.h"
#include "mapas/map22.h"
#include "mapas/map31.h"
#include "mapas/map32.h"

#include "game.h"
#include "entities/entities.h"
#include "animation/animation.h"
#include <time.h>

#define VIDA_SPRITE_MEM cpct_getScreenPtr(CPCT_VMEM_START,2,10)

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
			},
			0
		}
	},
	{	
		px_spawn,				//x
		py_spawn,			//y
		px_spawn,				//px
		py_spawn,			//py
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
			px_spawn,
			py_spawn,
			G_NAVES_0_W,
			G_NAVES_0_H
		},
		0				//cuadrante
	},
	3,	//vida
	3,	//pvida
	0 	//Puntuacion Inicial

};

const TEntity hearth = {
	2,				//x
	10,			//y
	2,				//px
	10,			//py
	1,				//vx
	1,				//vy
	SI,				//draw
	{				//sprites
		g_hearth,
		NULL,
		NULL,
		NULL,
	},	
	G_HEARTH_W,	//sw
	G_HEARTH_H,	//sh
	d_up,			//curr_dir
};

const u8* mapa = NULL;

u8* const mapas[NUM_MAPAS] = { g_map11, g_map12, g_map21, g_map22, g_map31, g_map32 };
u8 mapaActual = 0;
u8 salirMenu = 0;

void inicializarPantalla(){
	u8 i;
	TPlayer* p = &player;
	TEntity* ent = &hearth;
	//Limpiar la pantalla
	cpct_clearScreen(0);
	mapaActual = 0;

	mapa = g_map11;
	cpct_etm_setTileset2x4(g_tileset);
	dibujarMapa();
	cpct_drawStringM0("Score: 000",cpct_getScreenPtr(CPCT_VMEM_START,36,23),2,0);

	for(i = 0; i < player.vida; ++i){
		ent->vmem = cpct_getScreenPtr(CPCT_VMEM_START,ent->x, ent->y);
		dibujarEntity(ent,ent->sw,ent->sh);
		ent->x+=10;
	}


	ent->x = 2;
	//calculaEntity(&hearth, NO);
	//Aqui dibujariamos cosas de la pantalla 
	//cpct_drawStringM0("Vidas: ", VIDA_STRING_MEM, 2, 0);
}

void dibujarMapa(){
	cpct_etm_drawTilemap2x4(g_map11_W, g_map11_H, ORIGEN_MAPA, mapa);
}
void resetearDrawEnemigos(){
	TEnemy *enemigos;
	u8 i;
	enemigos = getEnemies();
	for(i=0;i<NUM_ENEMIGOS;++i){
		if(enemigos[i].ent.vivo == 1)
			enemigos[i].ent.draw = SI;
	}
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
	resetearDrawEnemigos();
	resetearBala();
	return mapaActual;
}	
void resetearBala(){
	explosionBala(&player.bullet);
	calculaEntity(&player.bullet.ent,SI);
	borrarEntity(&player.bullet.ent);
}

void cambiarDerecha(TEntity* ent){
	if(mapaActual >= 0 && mapaActual < 6 && mapaActual % 2 == 0){ //pongo a mano el numero de mapas que hay en total y se mueve si son pares
		mapaActual = cambiarMapa(1,1);
		ent->cuadrante = mapaActual;
		ent->x = 0; //esto es para cambiar la posision del player cuando cambia de mapa.
	}
}

void cambiarIzquierda(TEntity* ent){
	if(mapaActual >= 0 && mapaActual < 6 && mapaActual % 2 != 0){ //pongo a mano el numero de mapas que hay en total y se mueve si son impares
		mapaActual = cambiarMapa(0,1);
		ent->cuadrante = mapaActual;
		ent->x = 74;//80-6 == ancho del mapa - ancho sprite(en bytes), poner en variables
	}
}

void cambiarArriba(TEntity* ent){
	if(mapaActual >= 0 && mapaActual < 4){//desde los 4 primeros mapas puedo subir
		mapaActual = cambiarMapa(1,2);
		ent->cuadrante = mapaActual;
		ent->y = 188;//200-12 == alto del mapa - alto sprite, poner en variables
	}

}

void cambiarAbajo(TEntity* ent){
	if(mapaActual > 1 && mapaActual < 6){ //desde los 4 ultimos mapas puedo bajar
		mapaActual = cambiarMapa(0,2);
		ent->cuadrante = mapaActual;
		ent->y = 40;//en 40 comienza el mapa a pintarse
	}		
}

void updateUser(){
	TPlayer* p = &player;
	// Scan Keyboard
	cpct_scanKeyboard_if();
	if(cpct_isAnyKeyPressed()){
		if(cpct_isKeyPressed(Key_Space)){
			disparar(&player.bullet, player.ent.x, player.ent.y, player.ent.curr_dir);
		}
		if(cpct_isKeyPressed(Key_CursorUp)){
			if(accion(&player.ent, es_mover, d_up) == d_up){
				cambiarArriba(&player.ent);
				p->bullet.ent.cuadrante = mapaActual;
			}
		}else if(cpct_isKeyPressed(Key_CursorDown)){
			if(accion(&player.ent, es_mover, d_down) == d_down){
				cambiarAbajo(&player.ent);
				p->bullet.ent.cuadrante = mapaActual;
			}
		}else if(cpct_isKeyPressed(Key_CursorRight)){
			if(accion(&player.ent,es_mover,d_right) == d_right){
				cambiarDerecha(&player.ent);
				p->bullet.ent.cuadrante = mapaActual;
			}
		}else if(cpct_isKeyPressed(Key_CursorLeft)){
			if(accion(&player.ent,es_mover,d_left) == d_left){
				cambiarIzquierda(&player.ent);
				p->bullet.ent.cuadrante = mapaActual;
			}
		}else if(cpct_isKeyPressed(Key_Esc)){
			salirMenu = 1;
			//cpct_setBorder(HW_RED);
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
	TPlayer *p;
	p = &player;
	enemigos = getEnemies();
	//PLAYER - ENEMIES
	for(i=0;i<NUM_ENEMIGOS;++i){
		collide = checkCollision(&player.ent.coll, &enemigos[i].ent.coll);
		if(collide && mapaActual == enemigos[i].ent.cuadrante && enemigos[i].ent.vivo ==1){
			playerHerido(&player);
			break;
		}
	}
	
	//BALA - ENEMIGO
	for(i=0;i<NUM_ENEMIGOS;++i){
		collide = checkCollision(&player.bullet.ent.coll, &enemigos[i].ent.coll);
		if(collide && mapaActual == enemigos[i].ent.cuadrante && enemigos[i].ent.vivo == 1){
			//Hacemos la bala explotar(cuando la animacion funcione :D)
			explosionBala(&player.bullet);
			
			p->puntuacion = p->puntuacion + 100;
			enemigos[i].ent.vivo = 0;
			enemigos[i].ent.draw = NO;
			break;
		}
	}

	//PLAYER - BASES


	//ENEMIGOS - BASES


	
}

void drawHUD(){
	u8 i;
	TPlayer* p = &player;
	TEntity* ent = &hearth;
	
	if(player.vida != player.pvida){

		//Borramos una vida
		cpct_drawSolidBox(
			cpct_getScreenPtr(CPCT_VMEM_START,2 + 10*(player.vida),ent->y)
			,0
			,ent->sw
			,ent->sh
			);

		/*for(i = 0; i < player.vida; ++i){
			ent->vmem = cpct_getScreenPtr(CPCT_VMEM_START,ent->x, ent->y);
			dibujarEntity(ent,ent->sw,ent->sh);
			ent->x+=10;
		}*/
		
		
		ent->x = 2;
		p->pvida = p->vida;
	}
	dibujarPuntos();
}
void dibujarPuntos(){
	TPlayer* p = &player;
	char strPts[4];
	if(p->puntuacion != p->puntuacionPrev){
		//Borramos la de antes

		cpct_drawSolidBox(
			cpct_getScreenPtr(CPCT_VMEM_START,62,23)
			,0
			,20
			,8
			);
		sprintf(strPts,"%d",p->puntuacion);
		cpct_drawStringM0(strPts,cpct_getScreenPtr(CPCT_VMEM_START,62,23),2,0);
		p->puntuacionPrev = p->puntuacion;
	}
}

void play(){
	/*
	TPlayer* p = &player;
	p->pvida = 4;
	p->vida = 3;
	*/
	salirMenu = 0;
	incializarEntities(&player);
	inicializarPantalla();

	//Esto seria mientras estes vivo
	while(player.vida>0){
		updateUser();
		updatePlayer(&player);
		//updateEntities();
		//cpct_setBorder(HW_RED);
		calculaColisiones();
		calculaAllEntities(&player);
		//cpct_setBorder(HW_RED);
		cpct_waitVSYNC();
		//cpct_setBorder(HW_GREEN);
		drawAll(&player);
		drawHUD();
		//cpct_setBorder(HW_GREEN);
		if(salirMenu % 2 == 1){

			return;
		}

	}
	/*if(player.vida == 0){
		cpct_drawStringM0("GAME OVER", cpct_getScreenPtr(CPCT_VMEM_START, 20, 110), 3, 0);
	}*/
}

void capturaBase(TBase *base, TEntity *who){

}