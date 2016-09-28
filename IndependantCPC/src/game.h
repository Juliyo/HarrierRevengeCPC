#ifndef _GAME_H_
#define _GAME_H_

#include <types.h>

#define ANCHO 80
#define ALTO 200

#define ORIGEN_MAPA_Y 0
#define ORIGEN_MAPA cpctm_screenPtr(CPCT_VMEM_START, 0, ORIGEN_MAPA_Y)

typedef enum {
   es_static, 
   es_mover,
   es_disparar
} TPlayerStatus;

typedef enum{
	d_up,
	d_down,
	d_right,
	d_left
} TPlayerDirection;

typedef struct Entity
{
	u8 x,y;
	u8 px, py;
	u8 draw;
	u8* sprite;
	u8 tw, th, tpx, tpy;
	u8* vmem;
	TPlayerDirection curr_dir;
}TEntity;

typedef struct Bullet
{
	//Otras cosas
	TEntity ent;
}TBullet;

typedef struct Player
{
	TBullet bullet;
	TEntity ent;
}TPlayer;

extern const u8* mapa;

extern const TPlayer player;

//Funciones
void inicializarPantalla();
void dibujarMapa();
void updateUser();
void play();

#endif