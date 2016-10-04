#ifndef _ANIMATION_H_
#define _ANIMATION_H_

#include "../game.h"

#define EXPLOSION_FRAMES 12

typedef struct{
	u8 n_frames;
	TEntity ent;
}TStaticAnimation;


extern const TStaticAnimation explosion;

//Funciones explosion
void explosionBala(TBullet* bullet);
void updateExplosion(TBullet* bullet);

TStaticAnimation* getExplosion();

#endif