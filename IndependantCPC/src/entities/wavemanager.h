#ifndef _WAVEMANAGER_H_
#define _WAVEMANAGER_H_

#include <time.h>
#include "../game.h"

#define NUM_ENEMIGOS 3

extern u16 s_samemap;	//frame actual del tiempo en el mismo mapa
extern u16 d_samemap;	//frame mazimo de tiempo en el mismo mapa

extern u8 enemigos_actual;

extern u8 seed;


void updateTiempoEnMapa();
void resetearTimepoEnMapa();
void respawnearEnemigoPorBorde();
void posicionAleatoriaBorde(TEnemy* enemy);

void inicializarWaveManager();

//Respawnea un enemigo cuando el player cambia de mapa
void aparecerEnemigo();
void respawnearEnemigo(TEnemy* enemy);



void revivirEnemigo(TEnemy* enemy, i16 x, i16 y, TPlayerDirection dir);

void restarEnemigo();

#endif