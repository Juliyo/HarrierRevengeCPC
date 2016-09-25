#include <stdio.h>

#include <cpctelera.h>
#include "entities.h"
#include "../mapas/mapa1.h"
#include "../sprites/naves.h"
#include "../game.h"

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
				break;
				case d_down:
					moverAbajo(player);
				break;
				case d_left:
					moverIzquierda(player);
				break;
				case d_right:
					moverDerecha(player);
				break;
			}
		break;

	}
}

void moverArriba(TPlayer* player){
	if (player->y > 0) {
      player->y--;
  	}else{

  		//Aqui yo haria scroll del mapa
  	}
}

void moverAbajo(TPlayer* player){
	if (player->y + G_NAVES_0_H < ALTO) {
      player->y++;
  	}else{

  		//Aqui yo haria scroll del mapa
  	}
}

void moverIzquierda(TPlayer* player){
	if (player->x > 0) {
      player->x--;
  	}else{

  		//Aqui yo haria scroll del mapa
  	}
}
void moverDerecha(TPlayer* player){
	if (player->x + G_NAVES_0_W < ANCHO) {
      player->x++;
  	}else{

  		//Aqui yo haria scroll del mapa
  	}
}


u8 updatePlayer(TPlayer* player){
	//Comprueba si el player se ha movido
	/*if(player->px != player->x || player->py != player->y){
		player->draw = 1;
		player->px = player->x;
   		player->py = player->y;
	}else{
		player->draw = 0;
	}*/
	
	return 1;
}

void redibujarPlayer(TPlayer* player){
   borrarPlayer(player);
   player->px = player->x;
   player->py = player->y;
   dibujarPlayer(player);
}

void borrarPlayer(TPlayer* player){
	u8 w = 2 + (player->px & 1);
	u8 h = 7 + (player->py & 3 ? 1 : 0);
	cpct_etm_drawTileBox2x4(player->px / 2, player->py /4, w, h, g_map1_W, 0, mapa);
}

void dibujarPlayer(TPlayer* player){
	//if(player->draw){
		u8* vmem = cpct_getScreenPtr(CPCT_VMEM_START,player->x, player->y);
		//cpct_drawSprite(player->sprite,vmem,G_NAVES_0_W,G_NAVES_0_H);
		cpct_drawSpriteMaskedAlignedTable(player->sprite,vmem,G_NAVES_0_W,G_NAVES_0_H, g_tablatrans);
	//}
}
//Dibujamos todos los enemigos y el player
void drawAll(TPlayer* player){
	//De momento se dibuja el player
	redibujarPlayer(player);
}
