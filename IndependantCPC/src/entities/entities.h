#ifndef _ENTITIES_H_
#define _ENTITIES_H_

#include <types.h>

#include "../game.h"

#define SI 1
#define NO 0

#define NUM_ENEMIGOS 0

extern const TEntity enemigos[NUM_ENEMIGOS];
extern u32 seed;

extern u8 count1;
extern u8 count2;

void incializarEntities();


//Acciones Entities
void accion(TEntity* ent, TPlayerStatus action, TPlayerDirection dir);
void moverArriba(TEntity* ent);
void moverAbajo(TEntity* ent);
void moverIzquierda(TEntity* ent);
void moverDerecha(TEntity* ent);

//Operaciones con sprites
void flipSprite(TEntity* ent, TPlayerDirection dir);


//Updates
u8 updatePlayer(TEntity* player);
void updateEntities();

//Renders
void redibujarEntity(TEntity* ent, u8 w, u8 h);
void borrarEntity(TEntity* ent);
void dibujarEntity(TEntity* ent, u8 w, u8 h);
void drawAll(TEntity* player);

#endif