#ifndef _GAME_H_
#define _GAME_H_

#include <types.h>

#define ANCHO 80
#define ALTO 200

#define ORIGEN_MAPA_Y 40
#define ORIGEN_MAPA cpctm_screenPtr(CPCT_VMEM_START, 0, ORIGEN_MAPA_Y)

#define NUM_MAPAS 6

typedef enum {
   es_static, 
   es_mover,
   es_disparado,
   es_explotando,
   es_muerto
} TPlayerStatus;

typedef enum{
	d_up,
	d_right,
	d_down,
	d_left,
	d_nothing	//Usado para detectae colision con los bordes del mapa
} TPlayerDirection;

//Tipos de entityes que tenemos en el juego
typedef enum{
	e_enemy,
	e_player,
	e_bullet
} TEntityType;

typedef struct {
   u8    x, y;
   u8    w, h;
} TCollision;

typedef struct Entity
{
	i16 x,y; //Posicion
	i16 px, py; //Posicion previa
	u8 vx, vy; //Velocidad
	u8 draw;
	u8* sprites[4];
	u8 sw, sh; //SpriteWidth, SpriteHeight
	TPlayerDirection curr_dir;
	TEntityType type;
	TCollision coll;
	u8 tw, th, tpx, tpy; //TileWidth, TileHeight, PositionX, PositionY
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

void calculaColisiones();
u8 checkCollision(TCollision *col1, TCollision *col2);

#endif