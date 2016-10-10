#ifndef _ENTITIES_H_
#define _ENTITIES_H_

#include <types.h>

#include "../game.h"

#define SI 1
#define NO 0

#define NUM_ENEMIGOS 1

extern const TEnemy enemigos[NUM_ENEMIGOS];
extern u32 seed;

extern u8 count1;

void incializarEntities(TPlayer* player);


//Acciones Entities
TPlayerDirection accion(TEntity* ent, TPlayerStatus action, TPlayerDirection dir);
TPlayerDirection moverArriba(TEntity* ent);
TPlayerDirection moverAbajo(TEntity* ent);
TPlayerDirection moverIzquierda(TEntity* ent);
TPlayerDirection moverDerecha(TEntity* ent);

void playerHerido(TPlayer* player);

//Acciones Bullet
void disparar(TBullet* bullet, u8 x, u8 y, TPlayerDirection dir);
void updateBullet(TBullet* bullet);
void corregirPosicion(TBullet* bullet, u8 x, u8 y, TPlayerDirection dir);

//Operaciones con sprites
void flipSprite(TEntity* ent, TPlayerDirection dir);

//Updates
void updatePlayer(TPlayer* player);
void updateEntities();

//Renders
void redibujarEntity(TEntity* ent, u8 w, u8 h);
void borrarEntity(TEntity* ent);
void dibujarEntity(TEntity* ent, u8 w, u8 h);
void drawAll(TPlayer* player);
void calculaEntity(TEntity* ent, u8 origen);
void calculaAllEntities(TPlayer* player);

TEnemy* getEnemies();

#endif