#include <stdio.h>

#include <cpctelera.h>
#include "entities.h"
#include "../mapas/map11.h"
#include "../sprites/naves.h"
#include "../game.h"

#define COLUMNA 8
#define FILA 16

// Total random numbers to show (up to 255)
#define N_RND_NUMBERS   50

cpctm_createTransparentMaskTable(g_tablatrans,0x0100,M0,0);

const TEntity enemigos[NUM_ENEMIGOS] = {
	{	50,
		157,
		20,
		157,
		1,
		g_naves_0,
		d_up	},
	{	20,
		50,
		20,
		50,
		1,
		g_naves_0,
		d_up}
};

u32 seed = 1;
u8 count1 = 0;
u8 count2 = 0;

void incializarEntities(){
	//Inicializar entities necesarias

}

//Este metodo habria que hacerlo compatible no solo con el player, sino con un tipo entity,
//Asi ahorramos codigo cuando haya que mover enemigos
void accion(TEntity* ent, TPlayerStatus action, TPlayerDirection dir){
	switch(action){
		case es_mover:
			switch(dir){
				case d_up:
					moverArriba(ent);
					flipSprite(ent,dir);
				break;
				case d_down:
					moverAbajo(ent);
					flipSprite(ent,dir);
				break;
				case d_left:
					moverIzquierda(ent);
					flipSprite(ent,dir);
				break;
				case d_right:
					moverDerecha(ent);
					flipSprite(ent,dir);
				break;
			}
		break;

	}
}

//Recibe al entity y la direccion hacia la que quiere girar, entonces se cambia de sprite
void flipSprite(TEntity* ent, TPlayerDirection dir){
	if(ent->curr_dir != dir){
		switch(dir){
			case d_up:
				ent->sprite = g_naves_0;
				//flipByMolto();
			break;
			case d_down:
				ent->sprite = g_naves_2;
				//flipByMolto();
			break;
			case d_left:
				ent->sprite = g_naves_3;
			break;
			case d_right:
				ent->sprite = g_naves_1;
			break;
		}
		ent->curr_dir = dir; 
	}
}


/*void flipByMolto(){

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
}*/
void moverArriba(TEntity* ent){
	if (ent->y > 0) {
		if(ent->y%2 == 0)
      		ent->y-=2;
      	else
      		ent->y--;

      ent->draw  = SI;
  	}else{

  		//Aqui yo haria scroll del mapa
  	}

  		
}

void moverAbajo(TEntity* ent){
	if (ent->y + G_NAVES_0_H < ALTO) {
		if(ent->y%2 == 0)
      		ent->y+=2;
      	else
      		ent->y++;

      ent->draw  = SI;
  	}else{

  		//Aqui yo haria scroll del mapa
  	}
}

void moverIzquierda(TEntity* ent){
	if (ent->x > 0) {
      ent->x--;
      ent->draw  = SI;
  	}else{

  		//Aqui yo haria scroll del mapa
  	}
}
void moverDerecha(TEntity* ent){
	if (ent->x + G_NAVES_0_W < ANCHO) {
      ent->x++;
      ent->draw  = SI;
  	}else{

  		//Aqui yo haria scroll del mapa
  	}
}


u8 updatePlayer(TEntity* player){
	
	return 1;
}



void updateEntities(){
	
	u8 random_number;
	u8 i;

	TEntity* ent;

	//seed = 1;

	seed++;
	if(seed > 15000)
		seed = 1;

	cpct_srand(seed);

	//Dibujamos los enemigos
	for(i = 0; i < NUM_ENEMIGOS; i++){
		ent = &enemigos[i];
		accion(&enemigos[i],es_mover,enemigos[i].curr_dir);
		random_number = cpct_rand()%4;
		if(count1 > 60){
			count1 = 0;
			ent->curr_dir = random_number;
		}

		count1++;
	}

	
}

void redibujarEntity(TEntity* ent, u8 w, u8 h){
	if (ent->draw) {
		borrarEntity(ent);
		ent->px = ent->x;
		ent->py = ent->y;
		dibujarEntity(ent, w, h);
		ent->draw = NO;
	}
}

void borrarEntity(TEntity* ent){
	u8 w = 4 + (ent->px & 1);
	u8 h = 4 + (ent->py & 3 ? 1 : 0);
	cpct_etm_drawTileBox2x4(ent->px / 2, (ent->py - ORIGEN_MAPA_Y)/4, w, h, g_map11_W, ORIGEN_MAPA, mapa);
}

void dibujarEntity(TEntity* ent, u8 w, u8 h){
	u8* vmem = cpct_getScreenPtr(CPCT_VMEM_START,ent->x, ent->y);
	cpct_drawSpriteMaskedAlignedTable(ent->sprite,vmem,w,h, g_tablatrans);
}
//Dibujamos todos los enemigos y el player
void drawAll(TEntity* player){
	u8 i;
	//De momento se dibuja el player
	redibujarEntity(player, G_NAVES_0_W, G_NAVES_0_H);

	//Dibujamos los enemigos
	for(i = 0; i < NUM_ENEMIGOS; i++){
		redibujarEntity(&enemigos[i], G_NAVES_0_W, G_NAVES_0_H);
	}
}
