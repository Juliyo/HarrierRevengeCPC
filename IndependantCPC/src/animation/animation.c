#include <stdio.h>

#include <cpctelera.h>

#include "animation.h"
#include "../entities/entities.h"
#include "../sprites/explosion.h"

u8* const g_frames[EXPLOSION_FRAMES] = {
       g_explosion_00 ,  g_explosion_01 ,
       g_explosion_02 ,  g_explosion_03 ,
       g_explosion_04 ,  g_explosion_05 ,
       g_explosion_06 ,  g_explosion_07 ,
       g_explosion_08 ,  g_explosion_09 ,
       g_explosion_10 ,  g_explosion_11 
};

const TStaticAnimation explosion = {
	0,					//nFrames
	{
		0,				//x
		0,				//y
		0,				//px
		0,				//py
		0,				//vx
		0,				//vy
		NO,				//draw
		{				//sprites
			NULL,
			NULL,
			NULL,
			NULL,
		},		
		G_EXPLOSION_00_W,		//sw
		G_EXPLOSION_00_H,		//sh
		d_up			//curr_dir
	}
};

TStaticAnimation* getExplosion(){
	return &explosion;
}


//Esta función activará una animación de explosión en la posición de la bala que le pasan por parámetro
void explosionBala(TBullet* bullet){
	//Solo si la bala estaba en el estado de disparado
	if(bullet->state == es_disparado){
		TStaticAnimation* exp;
		exp = &explosion;
		exp->n_frames = 0;
		exp->ent.draw = SI;

		updateXY(&exp->ent, bullet->ent.x, bullet->ent.y);

		exp->ent.sprites[0] = g_frames[0];
		exp->ent.curr_dir = 0;
		exp->ent.cuadrante = mapaActual;
		bullet->ent.draw = NO;
		bullet->ent.vivo = NO;
		bullet->state = es_explotando;	//Cambiamos a la bala estado explotando
		
	}
	
}

void updateXY(TEntity* ent1, i16 x, i16 y){
	ent1->x = x;
	ent1->y = y;
	ent1->px = x;
	ent1->py = y;
}
//Esta función se encarga de updatear la explosión de la bala
void updateExplosion(TBullet* bullet){
	TStaticAnimation* exp;
	if(bullet->state == es_explotando){	//Solo se updatea si está en estado de explosión	
			exp = &explosion;
			exp->ent.draw = SI;
			exp->ent.cuadrante = mapaActual;
			//Primera posicion de los sprites cambia por el frame que toca de la explosion
			exp->ent.sprites[0] = g_frames[exp->n_frames];
			exp->n_frames = exp->n_frames + 1;
			if(exp->n_frames == EXPLOSION_FRAMES - 1){
				calculaEntity(&exp->ent,SI);
				borrarEntity(&exp->ent);
				exp->ent.draw = NO;
				bullet->state = es_static;
				exp->n_frames = 0;
			}
			
	}
}