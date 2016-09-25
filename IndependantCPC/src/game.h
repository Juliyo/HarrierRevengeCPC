#ifndef _GAME_H_
#define _GAME_H_

#include <types.h>

#define ANCHO 80
#define ALTO 200

#define ORIGEN_MAPA_Y 0
#define ORIGEN_MAPA cpctm_screenPtr(CPCT_VMEM_START, 0, ORIGEN_MAPA_Y)

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
	u8 draw;
	u8* sprite;
} TPlayer;

extern const u8* mapa;

//Funciones
void inicializarPantalla();
void dibujarMapa();
void updateUser();
void play();

#endif