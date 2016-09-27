#include <stdio.h>

#include <cpctelera.h>
#include "entities.h"
#include "../mapas/mapa1.h"
#include "../sprites/naves.h"
#include "../game.h"

#define COLUMNA 8
#define FILA 16

cpctm_createTransparentMaskTable(g_tablatrans,0x0100,M0,0);

void incializarEntities(){
	//Inicializar entities necesarias
}

//Este metodo habria que hacerlo compatible no solo con el player, sino con un tipo entity,
//Asi ahorramos codigo cuando haya que mover enemigos
void accion(TPlayer* player, TPlayerStatus action, TPlayerDirection dir){
	switch(action){
		case es_mover:
			switch(dir){
				case d_up:
					moverArriba(player);
					flipSprite(player,dir);
				break;
				case d_down:
					moverAbajo(player);
					flipSprite(player,dir);
				break;
				case d_left:
					moverIzquierda(player);
					flipSprite(player,dir);
				break;
				case d_right:
					moverDerecha(player);
					flipSprite(player,dir);
				break;
			}
		break;

	}
}

//Recibe al entity y la direccion hacia la que quiere girar, entonces se cambia de sprite
void flipSprite(TPlayer* player, TPlayerDirection dir){
	if(player->curr_dir != dir){
		switch(dir){
			case d_up:
				//player->sprite = g_naves_0;
			flipByMolto();
			break;
			case d_down:
				//player->sprite = g_naves_2;
				flipByMolto();
			break;
			case d_left:
				player->sprite = g_naves_3;
			break;
			case d_right:
				player->sprite = g_naves_1;
			break;
		}
		player->curr_dir = dir; 
	}
}


void flipByMolto(){

	u8 i;
	u8 j;

	u8 aux[FILA];

	for(i=0;i<FILA/2;i++){
		for(j=0;j<COLUMNA;j++){
			aux[j]=g_naves_0[i*FILA+j];
			g_naves_0[i*FILA+j] = g_naves_0[(FILA-i-1)*(COLUMNA)+j];
			g_naves_0[(FILA-i-1)*(COLUMNA)+j] = aux[j];
		}
	}
}
void moverArriba(TPlayer* player){
	if (player->y > 0) {
		if(player->y%2 == 0)
      		player->y-=2;
      	else
      		player->y--;

      player->draw  = SI;
  	}else{

  		//Aqui yo haria scroll del mapa
  	}
}

void moverAbajo(TPlayer* player){
	if (player->y + G_NAVES_0_H < ALTO) {
		if(player->y%2 == 0)
      		player->y+=2;
      	else
      		player->y++;

      player->draw  = SI;
  	}else{

  		//Aqui yo haria scroll del mapa
  	}
}

void moverIzquierda(TPlayer* player){
	if (player->x > 0) {
      player->x--;
      player->draw  = SI;
  	}else{

  		//Aqui yo haria scroll del mapa
  	}
}
void moverDerecha(TPlayer* player){
	if (player->x + G_NAVES_0_W < ANCHO) {
      player->x++;
      player->draw  = SI;
  	}else{

  		//Aqui yo haria scroll del mapa
  	}
}


u8 updatePlayer(TPlayer* player){
	
	return 1;
}

void redibujarPlayer(TPlayer* player){
	if (player->draw) {
		borrarPlayer(player);
		player->px = player->x;
		player->py = player->y;
		dibujarPlayer(player);
		player->draw = NO;
	}
}

void borrarPlayer(TPlayer* player){
	u8 w = 4 + (player->px & 1);
	u8 h = 4 + (player->py & 3 ? 1 : 0);
	cpct_etm_drawTileBox2x4(player->px / 2, player->py /4, w, h, g_map1_W, ORIGEN_MAPA, mapa);
}

void dibujarPlayer(TPlayer* player){
	u8* vmem = cpct_getScreenPtr(CPCT_VMEM_START,player->x, player->y);
	cpct_drawSpriteMaskedAlignedTable(player->sprite,vmem,G_NAVES_0_W,G_NAVES_0_H, g_tablatrans);
}
//Dibujamos todos los enemigos y el player
void drawAll(TPlayer* player){
	//De momento se dibuja el player
	redibujarPlayer(player);
}
