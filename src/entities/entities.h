#ifndef _ENTITIES_H_
#define _ENTITIES_H_

#include <types.h>

#include "../game.h"
#include "wavemanager.h"

#define SI 1
#define NO 0
#define NUM_BASES 		6


typedef struct{
	u8 x,y;
}TCoord;

extern const TCoord puntos[4];
extern const TEnemy enemigos[NUM_ENEMIGOS];
extern const TBase bases[NUM_BASES];

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
void updateX(TEntity* ent, i16 x);
void updateY(TEntity* ent, i16 y);

//IA
void updateIAState(TEnemy* ene);
void updateIA();
u8 contarEnemigos();
u8 moverHaciaPuntoDeControl(TEnemy* ene);
TPlayerDirection comprobarEjeX(TEnemy* ene);
TPlayerDirection comprobarEjeY(TEnemy* ene);
void comprobarSiDisparo(TEnemy* ene, TPlayer* p);

i16 abs(i16 num);

//Renders
void redibujarEntity(TEntity* ent, u8 w, u8 h);
void borrarEntity(TEntity* ent);
void dibujarEntity(TEntity* ent, u8 w, u8 h);
void drawAll(TPlayer* player);
void calculaEntity(TEntity* ent, u8 origen);
void calculaAllEntities(TPlayer* player);

TEnemy* getEnemies();
TBase* 	getBases();

#endif