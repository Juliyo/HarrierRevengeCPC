#include <stdio.h>

#include <cpctelera.h>
#include "entities.h"
#include "../sprites/naves.h"


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
				break;
			}
		break;

	}
}

void moverArriba(TPlayer* player){
	if (player->x + G_NAVES_0_W < ALTO) {
      player->x++;
  	}else{
  		//Aqui yo haria scroll del mapa z
  	}
}

void updatePlayer(TPlayer* player){

}

void redibujarPlayer(TPlayer* player){
   borrarPlayer(player);
   player->px = player->x;
   player->py = player->y;
   dibujarPlayer(player);
}

void borrarPlayer(TPlayer* player){

}

void dibujarPlayer(TPlayer* player){
	u8* vmem = cpct_getScreenPtr(CPCT_VMEM_START,player->x, player->y);
	cpct_drawSprite(player->sprite,vmem,G_NAVES_0_W,G_NAVES_0_H);
}
//Dibujamos todos los enemigos y el player
void drawAll(TPlayer* player){
	//De momento se dibuja el player
	dibujarPlayer(player);
}
