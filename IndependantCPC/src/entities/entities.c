#include <stdio.h>

#include <cpctelera.h>
#include "entities.h"
#include "../mapas/map11.h"
#include "../sprites/naves.h"
#include "../sprites/bala.h"
#include "../game.h"

#define COLUMNA 8
#define FILA 16

// Total random numbers to show (up to 255)
#define N_RND_NUMBERS   50

#define MIN(a,b) (((a)<(b))?(a):(b))
#define MAX(a,b) (((a)>(b))?(a):(b))

cpctm_createTransparentMaskTable(g_tablatrans,0x0100,M0,0);

const TEntity enemigos[NUM_ENEMIGOS] = {
	{	50,				//x
		157,			//y
		20,				//px
		157,			//py
		1,				//vx
		2,				//vy
		1,				//draw
		{				//sprites
			g_naves_0,
			g_naves_1,
			g_naves_2,
			g_naves_3,
		},	
		G_NAVES_0_W,
		G_NAVES_0_H,
		d_up			//curr_dir
	},
	{	20,				//x
		50,				//y
		20,				//px
		50,				//py
		1,				//vx
		2,				//vy
		1,				//draw
		{				//sprites
			g_naves_0,
			g_naves_1,
			g_naves_2,
			g_naves_3,
		},	
		G_NAVES_0_W,
		G_NAVES_0_H,
		d_up			//curr_dir
	}
};

u32 seed = 1;
u8 count1 = 0;

void incializarEntities(){
	//Inicializar entities necesarias

}

//Devuelve un TPlayerDirection que indica si ha habido colision con el borde y la direccion en la que se ha producido
TPlayerDirection accion(TEntity* ent, TPlayerStatus action, TPlayerDirection dir){
	TPlayerDirection collision;
	switch(action){
		case es_mover:
			switch(dir){
				case d_up:
					collision = moverArriba(ent);
					flipSprite(ent,dir);
				break;
				case d_down:
					collision = moverAbajo(ent);
					flipSprite(ent,dir);
				break;
				case d_left:
					collision = moverIzquierda(ent);
					flipSprite(ent,dir);
				break;
				case d_right:
					collision = moverDerecha(ent);
					flipSprite(ent,dir);
				break;
			}
		break;

	}
	return collision;
}

//Recibe al entity y la direccion hacia la que quiere girar, entonces se cambia de sprite
void flipSprite(TEntity* ent, TPlayerDirection dir){
	if(ent->curr_dir != dir){
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
TPlayerDirection moverArriba(TEntity* ent){
	TPlayerDirection collision;
	//Movemos y resolvemos colisiones con los bordes
	ent->y -= ent->vy;
	if(MAX(ORIGEN_MAPA_Y, ent->y) == ORIGEN_MAPA_Y){
		ent->y = ORIGEN_MAPA_Y;
		//Cambiar mapa
		collision = d_up;
	}else{
		collision = d_nothing;
	}

    ent->draw  = SI;

    return collision;
}

TPlayerDirection moverAbajo(TEntity* ent){
	TPlayerDirection collision;
	//Movemos y resolvemos colisiones con los bordes
	ent->y += ent->vy;
	if(MIN(ent->y, ALTO - ent->sh) != ent->y){
		ent->y = ALTO - ent->sh;
		collision =  d_down;
	}else{//else Cambiar de mapa
		collision = d_nothing;
	}
	
    ent->draw  = SI;

    return collision;
}

TPlayerDirection moverIzquierda(TEntity* ent){
	TPlayerDirection collision;
  	//Movemos y resolvemos colisiones con los bordes
	ent->x -= ent->vx;
	if(MAX(0, ent->x) == 0){
		ent->x = 0;
		// Cambiar mapa
		collision = d_left;
	}else{
		collision = d_nothing;
	}
	ent->draw  = SI;

	return collision;
}
TPlayerDirection moverDerecha(TEntity* ent){
	TPlayerDirection collision;
	//Movemos y resolvemos colisiones con los bordes
	ent->x += ent->vx;
	if(MIN(ent->x, ANCHO - ent->sw) != ent->x){
		// Cambiar de mapa
		ent->x = ANCHO - ent->sw;
		collision = d_right;
	}else{
		collision = d_nothing;
	}
	
    ent->draw  = SI;

    return collision;
}


u8 updatePlayer(TPlayer* player){
	
	updateBullet(&player->bullet);

	return 1;
}

void disparar(TBullet* bullet, u8 x, u8 y, TPlayerDirection dir){
	if(!bullet->disparada){
		bullet->disparada = SI;
		bullet->ent.x = x;
		bullet->ent.y = y;
		bullet->ent.px = x;
		bullet->ent.py = y;
		bullet->ent.draw = SI;
		bullet->ent.curr_dir = dir;
	}
}

void updateBullet(TBullet* bullet){
	//Solo updateamos la bala si ha sido disparada
	if(bullet->disparada == SI){
		//Actualizamos la bala cada 30 frames
		if(bullet->frameCount > bullet->frameLimit){
			
			bullet->ent.draw = SI;
			//Se mueve la bala y si se devuelve el valor d_nothing es porque no hay colision con el borde
			//En caso contrario habra colision y se podra volver a disparar
			if(accion(&bullet->ent, es_mover, bullet->ent.curr_dir) != d_nothing){
				bullet->disparada = NO;
			}
			
			bullet->frameCount = 0;
		}else{
			bullet->frameCount++;
		}
	}
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
	if(ent->draw){
		cpct_etm_drawTileBox2x4(ent->tpx, ent->tpy, ent->tw, ent->th, g_map11_W, ORIGEN_MAPA, mapa);
	}
}

void dibujarEntity(TEntity* ent, u8 w, u8 h){
	if (ent->draw) {
		cpct_drawSpriteMaskedAlignedTable(ent->sprites[ent->curr_dir],ent->vmem, w, h, g_tablatrans);
	}
}

//Calculamos lo que vamos a dibujar
void calculaEntity(TEntity* ent){
	ent->tw = ent->sw/2 + (ent->px & 1);
	ent->th = ent->sh/4 + (ent->py & 3 ? 1 : 0);
	ent->tpx = ent->px / 2;
	ent->tpy = (ent->py-ORIGEN_MAPA_Y) / 4;
	ent->vmem = cpct_getScreenPtr(CPCT_VMEM_START,ent->x, ent->y);
}

//Calculamos TODAS las entities
void calculaAllEntities(TPlayer* player){
	u8 i;
	calculaEntity(&player->ent);
	calculaEntity(&player->bullet.ent);
	for(i=0;i < NUM_ENEMIGOS;++i){
		calculaEntity(&enemigos[i]);
	}
}

//Dibujamos todos los enemigos y el player
void drawAll(TPlayer* player){
	u8 i;
	redibujarEntity(&player->ent, player->ent.sw, player->ent.sh);
	redibujarEntity(&player->bullet.ent, player->bullet.ent.sw, player->bullet.ent.sh);
	//Dibujamos los enemigos
	for(i = 0; i < NUM_ENEMIGOS; ++i){
		redibujarEntity(&enemigos[i], enemigos[i].sw, enemigos[i].sh);
	}
}
