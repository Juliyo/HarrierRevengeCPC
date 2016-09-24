#ifndef _GAME_H_
#define _GAME_H_

#include <types.h>

#define ANCHO 168
#define ALTO 80

typedef enum {
   es_static, 
   es_mover
} TPlayerStatus;

typedef enum{
	d_up,
	d_down,
	d_right,
	d_left
} TPlayerDirection;

typedef struct Player
{
	u8 x,y;
	u8 px, py;
	u8* sprite;
} TPlayer;


//Funciones
void inicializarPantalla();
void updateUser();
void play();

#endif