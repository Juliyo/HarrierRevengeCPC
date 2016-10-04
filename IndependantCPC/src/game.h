#ifndef _GAME_H_
#define _GAME_H_

#include <types.h>

#define ANCHO 80
#define ALTO 200

#define ORIGEN_MAPA_Y 40
#define ORIGEN_MAPA cpctm_screenPtr(CPCT_VMEM_START, 0, ORIGEN_MAPA_Y)

#define NUM_MAPAS 6

typedef enum {
   es_static = 0, 
   es_mover,
   es_disparado,
   es_explotando
} TPlayerStatus;

typedef enum{
	d_up = 0,
	d_right,
	d_down,
	d_left,
	d_nothing	//Usado para detectae colision con los bordes del mapa
} TPlayerDirection;

typedef struct Entity
{
	i16 x,y;
	i16 px, py;
	u8 vx, vy;
	u8 draw;
	u8* sprites[4];
	u8 sw, sh;
	TPlayerDirection curr_dir;
	u8 tw, th, tpx, tpy;
	u8* vmem;
}TEntity;

typedef struct Bullet
{
	u8 frameCount;
	u8 frameLimit;
	TPlayerStatus state;
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

//Funciones mapa
u8 cambiarMapa(u8 suma, u8 cantidad); //suma: 1 suma, 0 resta. 
void cambiarDerecha(TEntity* ent);
void cambiarIzquierda(TEntity* ent);
void cambiarArriba(TEntity* ent);
void cambiarAbajo(TEntity* ent);

#endif