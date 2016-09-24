#ifndef _ENTITIES_H_
#define _ENTITIES_H_

#include <types.h>

#include "../game.h"

void incializarEntities();
void accion(TPlayer* player, TPlayerStatus action, TPlayerDirection dir);

//Acciones Entities
void moverArriba(TPlayer* player);
void moverAbajo(TPlayer* player);
void moverIzquierda(TPlayer* player);
void moverDerecha(TPlayer* player);

void updatePlayer(TPlayer* player);


void redibujarPlayer(TPlayer *player);
void borrarPlayer(TPlayer *player);
void dibujarPlayer(TPlayer* player);
void drawAll(TPlayer* player);

#endif