#ifndef _GAME_H_
#define _GAME_H_

#include <types.h>

typedef struct Player
{
	u8 x,y;
	u8* sprite;
} TPlayer;


//Funciones
void inicializarPantalla();
//void updateUser(TPlayer* user);
void play();

#endif