#ifndef _ENTITIES_H_
#define _ENTITIES_H_

#include <types.h>

#include "../game.h"

#define SI 1
#define NO 0

#define NUM_ENEMIGOS 2

extern const TEntity enemigos[NUM_ENEMIGOS];
extern u32 seed;

extern u8 count1;

void incializarEntities();


//Acciones Entities
void accion(TEntity* ent, TPlayerStatus action, TPlayerDirection dir);
void moverArriba(TEntity* ent);
void moverAbajo(TEntity* ent);
void moverIzquierda(TEntity* ent);
void moverDerecha(TEntity* ent);

//Acciones Bullet
void disparar(TBullet* bullet, u8 x, u8 y, TPlayerDirection dir);
void updateBullet(TBullet* bullet, TPlayerDirection dir);

//Operaciones con sprites
void flipSprite(TEntity* ent, TPlayerDirection dir);


//Updates
u8 updatePlayer(TPlayer* player);
void updateEntities();

//Renders
void redibujarEntity(TEntity* ent, u8 w, u8 h);
void borrarEntity(TEntity* ent);
void dibujarEntity(TEntity* ent, u8 w, u8 h);
void drawAll(TPlayer* player);
void calculaEntity(TEntity* ent);
void calculaAllEntities(TPlayer* player);

#endif