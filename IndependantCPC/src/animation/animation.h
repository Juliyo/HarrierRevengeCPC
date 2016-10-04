#ifndef _ANIMATION_H_
#define _ANIMATION_H_

#include "../game.h"

#define EXPLOSION_FRAMES 12

typedef struct{
	u8 nFrames;
	TEntity ent;
}TStaticAnimation;

extern const TStaticAnimation explosion;

extern const u8* g_frames[EXPLOSION_FRAMES];

//Funciones explosion
void explosionBala(TBullet* bullet);
void updateExplosion();

TStaticAnimation* getExplosion();

#endif