#include <stdio.h>

#include <cpctelera.h>
#include "entities.h"
#include "../sprites/naves.h"


void incializarEntities(){
	//Inicializar entities necesarias
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
