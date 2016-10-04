#include <stdio.h>

#include <cpctelera.h>

#include "animation.h"
#include "../entities/entities.h"
#include "../sprites/explosion.h"

const u8* g_frames[EXPLOSION_FRAMES] = {
      g_explosion_00, g_explosion_01,
      g_explosion_02, g_explosion_03,
      g_explosion_04, g_explosion_05,
      g_explosion_06, g_explosion_07,
      g_explosion_08, g_explosion_09,
      g_explosion_10, g_explosion_11
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
	return explosion;
}
void explosionBala(TBullet* bullet){
	TStaticAnimation* exp;
	exp = getExplosion();

	exp->ent.draw = SI;
	exp->ent.x = bullet->ent.x;
	exp->ent.y = bullet->ent.y;

	exp->ent.px = bullet->ent.px;
	exp->ent.py = bullet->ent.py;

	exp->ent.sprites[0] = *g_frames[10];

	bullet->ent.draw = NO;
	bullet->state = es_explotando;
	
}

void updateExplosion(){
	TStaticAnimation* exp;
	exp = getExplosion();
	if(++exp->nFrames == EXPLOSION_FRAMES){
		exp->ent.draw = NO;
		exp->nFrames = 0;
	}
	exp->ent.sprites[0] = g_frames[exp->nFrames];
}