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
	d_up = 0,
	d_down = 1,
	d_right = 2,
	d_left = 3 
} TPlayerDirection;

typedef struct Entity
{
	u8 x,y;
	u8 px, py;
	u8 draw;
	u8* sprite;
	TPlayerDirection curr_dir;
}TEntity;

extern const u8* mapa;

//Funciones
void inicializarPantalla();
void dibujarMapa();
void updateUser();
void play();

#endif