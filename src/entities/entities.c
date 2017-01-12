#include <stdio.h>
#include <math.h>

#include <cpctelera.h>
#include "entities.h"
#include "../mapas/map11.h"
#include "../sprites/naves.h"
#include "../sprites/bala.h"
#include "../sprites/bala_enemiga.h"
#include "../sprites/naveEnemiga1.h"
#include "../sprites/naveEnemiga2.h"
#include "../sprites/naveEnemiga3.h"
#include "../game.h"
#include "../animation/animation.h"
#include "../entities/wavemanager.h"
#include "../sprites/captutada.h"
#include "../sprites/capturada.h"

#define COLUMNA 8
#define FILA 16

// Total random numbers to show (up to 255)
#define N_RND_NUMBERS   50



#define MIN(a,b) (((a)<(b))?(a):(b))
#define MAX(a,b) (((a)>(b))?(a):(b))

cpctm_createTransparentMaskTable(g_tablatrans,0x0100,M0,0);

const TEnemy enemigos[NUM_ENEMIGOS] = {
	{
		{					//Bullet
			0,				//frameCount
			1,				//FrameLimit	
			es_static,		//state
			{
				0,				//x
				0,				//y
				0,				//px
				0,				//py
				2,				//vx
				4,				//vy
				NO,				//draw
				{				//sprites
					g_bala_enemiga,
					g_bala_enemiga,
					g_bala_enemiga,
					g_bala_enemiga,
				},		
				G_BALA_ENEMIGA_W,		//sw
				G_BALA_ENEMIGA_H,		//sh
				d_up,			//curr_dir
				e_bullet,		//Bullet
				{
					0,
					0,
					G_BALA_0_W,
					G_BALA_0_H
				},
				0,				//vivo
				2,				//cuadrante
			}
		},
		{	50,				//x
			157,			//y
			50,				//px
			157,			//py
			1,				//vx
			2,				//vy
			1,				//draw
			{				//sprites
				g_naveEnemiga1_0,
				g_naveEnemiga1_1,
				g_naveEnemiga1_2,
				g_naveEnemiga1_3,
			},	
			G_NAVEENEMIGA1_0_W,
			G_NAVEENEMIGA1_0_H,
			d_up,			//curr_dir
			e_enemy,
			{
				50,
				157,
				G_NAVEENEMIGA1_0_W,
				G_NAVEENEMIGA1_0_H
			},
			1,
			2,				//cuadrante
			s_mover
		},
		s_mover,	//statusIA
		0,			//cycles
		1,			//wait_cycles
		0,
		0			//puntoControl

	},
	{
		{					//Bullet
			0,				//frameCount
			1,				//FrameLimit	
			es_static,		//state
			{
				0,				//x
				0,				//y
				0,				//px
				0,				//py
				2,				//vx
				4,				//vy
				NO,				//draw
				{				//sprites
					g_bala_enemiga,
					g_bala_enemiga,
					g_bala_enemiga,
					g_bala_enemiga,
				},		
				G_BALA_ENEMIGA_W,		//sw
				G_BALA_ENEMIGA_H,		//sh
				d_up,			//curr_dir
				e_bullet,		//Bullet
				{
					0,
					0,
					G_BALA_0_W,
					G_BALA_0_H
				},
				0,				//vivo
				4				//cuadrante
			}
		},
		{	20,				//x
			50,				//y
			20,				//px
			50,				//py
			1,				//vx
			2,				//vy
			1,				//draw
			{				//sprites
				g_naveEnemiga2_0,
				g_naveEnemiga2_1,
				g_naveEnemiga2_2,
				g_naveEnemiga2_3,
			},	
			G_NAVEENEMIGA2_0_W,
			G_NAVEENEMIGA2_0_H,
			d_up,			//curr_dir
			e_enemy,
			{
				20,
				50,
				G_NAVEENEMIGA2_0_W,
				G_NAVEENEMIGA2_0_H
			},
			1,
			4,				//cuadrante
			s_mover
		},
		s_mover,	//statusIA
		0,			//cycles
		1,			//wait_cycles
		0,
		0			//puntoControl
	},
	{
		{					//Bullet
			0,				//frameCount
			1,				//FrameLimit	
			es_static,		//state
			{
				0,				//x
				0,				//y
				0,				//px
				0,				//py
				2,				//vx
				4,				//vy
				NO,				//draw
				{				//sprites
					g_bala_enemiga,
					g_bala_enemiga,
					g_bala_enemiga,
					g_bala_enemiga,
				},		
				G_BALA_ENEMIGA_W,		//sw
				G_BALA_ENEMIGA_H,		//sh
				d_up,			//curr_dir
				e_bullet,		//Bullet
				{
					0,
					0,
					G_BALA_0_W,
					G_BALA_0_H
				},
				0,
				0
			}
		},
		{	35,				//x
			120,			//y
			35,				//px
			120,			//py
			1,				//vx
			2,				//vy
			1,				//draw
			{				//sprites
				g_naveEnemiga3_0,
				g_naveEnemiga3_1,
				g_naveEnemiga3_2,
				g_naveEnemiga3_3,
			},	
			G_NAVEENEMIGA3_0_W,
			G_NAVEENEMIGA3_0_H,
			d_up,			//curr_dir
			e_enemy,
			{
				35,
				120,
				G_NAVEENEMIGA3_0_W,
				G_NAVEENEMIGA3_0_H
			},
			1,				//vivo
			0,				//cuadrante
			s_mover
		},
		s_mover,	//statusIA
		0,			//cycles
		1,			//wait_cycles
		0,
		0			//puntoControl
	}
};

const TBase bases[NUM_BASES] = {
 {        //Base del primer mapa (11)
  1,       //Base enemiga (1) al principio
  100,      //Porcentaje capturado (100 para el enemigo)
  200,      //Tiempo (ciclos) necesarios para capturar la base
  0,       //Ciclos que han pasado
  {       //Entity
   48, 156,     //Posicion
   48, 156,     //Posicion Prev
   0, 0,     //Velocidad
   SI,      //DRAW
   {      //SPRITES
    NULL,
    NULL,
    NULL,
    NULL
   },
   G_CAPTURADA_W,
   G_CAPTURADA_H,
   d_up,
   e_base,
   {
    48,
    156,
    G_CAPTURADA_W,
    G_CAPTURADA_H
   },
   1,
   0
  }
 },
 {
  1,       //Base enemiga (1) al principio
  100,      //Porcentaje capturado (100 para el enemigo)
  1000,      //Tiempo (ciclos) necesarios para capturar la base
  0,       //Ciclos que han pasado
  {       //Entity
   46, 100,     //Posicion
   46, 100,     //Posicion Prev
   0, 0,     //Velocidad
   SI,      //DRAW
   {      //SPRITES
    NULL,
    NULL,
    NULL,
    NULL
   },
   G_CAPTURADA_W,
   G_CAPTURADA_H,
   d_up,
   e_base,
   {
    46,
    100,
    G_CAPTURADA_W,
    G_CAPTURADA_H
   },
   1,
   1
  }
 },
 {
  1,       //Base enemiga (1) al principio
  100,      //Porcentaje capturado (100 para el enemigo)
  1000,      //Tiempo (ciclos) necesarios para capturar la base
  0,       //Ciclos que han pasado
  {       //Entity
   4, 112,     //Posicion
   4, 112,     //Posicion Prev
   0, 0,     //Velocidad
   SI,      //DRAW
   {      //SPRITES
    NULL,
    NULL,
    NULL,
    NULL
   },
   G_CAPTURADA_W,
   G_CAPTURADA_H,
   d_up,
   e_base,
   {
    4,
    112,
    G_CAPTURADA_W,
    G_CAPTURADA_H
   },
   1,
   2
  }
 },
 {
  1,       //Base enemiga (1) al principio
  100,      //Porcentaje capturado (100 para el enemigo)
  1000,      //Tiempo (ciclos) necesarios para capturar la base
  0,       //Ciclos que han pasado
  {       //Entity
   68, 136,     //Posicion
   136, 136,     //Posicion Prev
   0, 0,     //Velocidad
   SI,      //DRAW
   {      //SPRITES
    NULL,
    NULL,
    NULL,
    NULL
   },
   G_CAPTURADA_W,
   G_CAPTURADA_H,
   d_up,
   e_base,
   {
    68,
    136,
    G_CAPTURADA_W,
    G_CAPTURADA_H
   },
   1,
   3
  }
 },
 {
  1,       //Base enemiga (1) al principio
  100,      //Porcentaje capturado (100 para el enemigo)
  1000,      //Tiempo (ciclos) necesarios para capturar la base
  0,       //Ciclos que han pasado
  {       //Entity
   4, 68,     //Posicion
   4, 68,     //Posicion Prev
   0, 0,     //Velocidad
   SI,      //DRAW
   {      //SPRITES
    NULL,
    NULL,
    NULL,
    NULL
   },
   G_CAPTURADA_W,
   G_CAPTURADA_H,
   d_up,
   e_base,
   {
    4,
    68,
    G_CAPTURADA_W,
    G_CAPTURADA_H
   },
   1,
   4
  }
 },
 {
  1,       //Base enemiga (1) al principio
  100,      //Porcentaje capturado (100 para el enemigo)
  1000,      //Tiempo (ciclos) necesarios para capturar la base
  0,       //Ciclos que han pasado
  {       //Entity
   68, 104,     //Posicion
   68, 104,     //Posicion Prev
   0, 0,     //Velocidad
   SI,      //DRAW
   {      //SPRITES
    NULL,
    NULL,
    NULL,
    NULL
   },
   G_CAPTURADA_W,
   G_CAPTURADA_H,
   d_up,
   e_base,
   {
    68,
    104,
    G_CAPTURADA_W,
    G_CAPTURADA_H
   },
   1,
   5
  }
 }
};
// 0 = punto1(Arriba), 1 = punto2(Abajo), 3 = punto3(Derecha), 4 = punto4(Izquierda)
const TCoord puntos[4] = {
	{ 40, ORIGEN_MAPA_Y + 20 },		//Arriba por el centro
	{ 40, ALTO - 15 	     },		//Abajo por el centro
	{ 65, ORIGEN_MAPA_Y + 60 },		//Derecha por el centro
	{ 10, ORIGEN_MAPA_Y + 60 }		//Izquierda por el centro
};



u8 count1 = 0;

u8 turno = 0;		//Para controlar el updateado de las naves enemigas (1a por update)

u8 bulletsTurno = 0;     //Para controlar el updateado de las balas enemigas (1a por update)


void incializarEntities(TPlayer* p){
	TBase* bases = getBases();
	TEnemy* enes = getEnemies();
	u8 i = 0;
	//Inicializar entities necesarias
	p->vida = 3;
	p->pvida = 3;
	p->ent.x = px_spawn;
	p->ent.y = py_spawn;
	p->ent.draw = SI;
	p->puntuacion = 0;
	p->puntuacionPrev = 0;

	for(i = 0; i < NUM_BASES; ++i){
		bases[i].whom = 1;
		bases[i].ent.sprites[0] = NULL;
		bases[i].cycles = 0;
	}
	for(i = 0; i< NUM_ENEMIGOS; ++i){
		if(enes[i].ent.cuadrante == 0){
			enes[i].ent.vivo = 0;
			enes[i].bullet.ent.vivo = 0;
			enes[i].ent.draw = NO;
		}
	}
	wshot_cycles = 30;
	basesCapturadas = 0;
	prev_basesCapturadas = 0;

	inicializarWaveManager();
}

//Devuelve un TPlayerDirection que indica si ha habido colision con el borde y la direccion en la que se ha producido
TPlayerDirection accion(TEntity* ent, TPlayerStatus action, TPlayerDirection dir){
	TPlayerDirection collision;
	switch(action){
		case es_mover:
			switch(dir){
				case d_up:
					collision = moverArriba(ent);
					flipSprite(ent,dir);
				break;
				case d_down:
					collision = moverAbajo(ent);
					flipSprite(ent,dir);
				break;
				case d_left:
					collision = moverIzquierda(ent);
					flipSprite(ent,dir);
				break;
				case d_right:
					collision = moverDerecha(ent);
					flipSprite(ent,dir);
				break;
			}
		break;

	}
	return collision;
}

//Recibe al entity y la direccion hacia la que quiere girar, entonces se cambia de sprite
void flipSprite(TEntity* ent, TPlayerDirection dir){
	if(ent->curr_dir != dir){
		ent->curr_dir = dir; 
	}
}

TPlayerDirection moverArriba(TEntity* ent){
	TPlayerDirection collision;
	//Movemos y resolvemos colisiones con los bordes
	ent->y -= ent->vy;
	if(MAX(ORIGEN_MAPA_Y, ent->y) == ORIGEN_MAPA_Y){
		ent->y = ORIGEN_MAPA_Y;
		//Cambiar mapa
		collision = d_up;
	}else{
		collision = d_nothing;
	}

    ent->draw  = SI;

    return collision;
}

TPlayerDirection moverAbajo(TEntity* ent){
	TPlayerDirection collision;
	//Movemos y resolvemos colisiones con los bordes
	ent->y += ent->vy;
	if(MIN(ent->y, ALTO - ent->sh) != ent->y){
		ent->y = ALTO - ent->sh;
		collision =  d_down;
	}else{//else Cambiar de mapa
		collision = d_nothing;
	}
	
    ent->draw  = SI;

    return collision;
}

TPlayerDirection moverIzquierda(TEntity* ent){
	TPlayerDirection collision;
  	//Movemos y resolvemos colisiones con los bordes
	ent->x -= ent->vx;
	if(MAX(0, ent->x) == 0){
		ent->x = 0;
		// Cambiar mapa
		collision = d_left;
	}else{
		collision = d_nothing;
	}
	ent->draw  = SI;

	return collision;
}
TPlayerDirection moverDerecha(TEntity* ent){
	TPlayerDirection collision;
	//Movemos y resolvemos colisiones con los bordes
	ent->x += ent->vx;
	if(MIN(ent->x, ANCHO - ent->sw) != ent->x){
		// Cambiar de mapa
		ent->x = ANCHO - ent->sw;
		collision = d_right;
	}else{
		collision = d_nothing;
	}
	
    ent->draw  = SI;

    return collision;
}


void updatePlayer(TPlayer* player){
	if(previousMap == mapaActual){
		//Tiempo que lleva el player sin cambiar de mapa
		updateTiempoEnMapa();
	}else{
		previousMap = mapaActual;
		resetearTimepoEnMapa();
	}
	
	updateBullet(&player->bullet);
		
}
//Ajusta la posicion de la bala a la posicion de la nave
void corregirPosicion(TBullet* bullet, u8 x, u8 y, TPlayerDirection dir){
	switch(dir){
		case d_up:
			x+=2;
			if(y >= ORIGEN_MAPA_Y + 7 )
				y-=7;
		break;
		case d_right:
			if(x + 7 <= ANCHO)
				x+=7;
			else
				x = ANCHO - bullet->ent.sw;
			y+=3;

		break;
		case d_left:
			if(x > 6)
				x-=5;
			y+=2;

		break;
		case d_down:
			if(y + 15 <= ALTO)
				y +=15;
			else
				y = ALTO - bullet->ent.sh;
			x +=2;
		break;
	}

	bullet->ent.x = x;
	bullet->ent.y = y;
}
void updateX(TEntity* ent, i16 x){
	ent->x = x;
	ent->coll.x = x;
}
void updateY(TEntity* ent, i16 y){
	ent->y = y;
	ent->coll.y = y;
}
void disparar(TBullet* bullet, u8 x, u8 y, TPlayerDirection dir){
	if(bullet->state == es_static){
		bullet->state = es_disparado;
		corregirPosicion(bullet,x,y,dir);
		bullet->ent.px = bullet->ent.x;
		bullet->ent.py = bullet->ent.y;
		bullet->ent.draw = SI;
		bullet->ent.vivo = SI;
		bullet->ent.curr_dir = dir;
	}
}

void updateBullet(TBullet* bullet){

	switch(bullet->state){
		case es_disparado:	//Solo updateamos la bala si ha sido disparada
			//Actualizamos la bala cada 30 frames
			if(bullet->frameCount >= bullet->frameLimit){
				bullet->ent.draw = SI;
				//Se mueve la bala y si se devuelve el valor d_nothing es porque no hay colision con el borde
				//En caso contrario habra colision y se podra volver a disparar
				if(accion(&bullet->ent, es_mover, bullet->ent.curr_dir) != d_nothing){
					bullet->state = es_static;
					calculaEntity(&bullet->ent, SI);
					borrarEntity(&bullet->ent);
					bullet->ent.draw = NO;
					bullet->ent.vivo = NO;
				}
				
				bullet->frameCount = 0;
			}else{
				bullet->frameCount++;
			}
		break;

		case es_explotando:
			updateExplosion(bullet);
		break;
	}
}


void playerHerido(TPlayer* player){
	TBase* bases = getBases();
	player->vida--;
	player->ent.x = px_spawn;
	player->ent.y = py_spawn;
	player->ent.draw = SI;
	mapaActual = 0;
	player->ent.cuadrante = 0;
	mapa = mapas[0];
	bases[mapaActual].ent.draw = SI;
	dibujarMapa();
}

void updateEntities(){
	u8 i;
	/*if(bulletsTurno >= NUM_ENEMIGOS){
		bulletsTurno = 0;
	}*/

	
	for(i=0;i<NUM_ENEMIGOS;++i){
		/*if(enemigos[i].bullet.ent.cuadrante == mapaActual && enemigos[i].bullet.ent.vivo){
			if(bulletsTurno == i){*/
				updateBullet(&enemigos[i].bullet);
			/*}
		}else{
			bulletsTurno++;
		}*/

	}
	
	updateIA();
}
u8 contarEnemigos(){
	u8 i;
	u8 cuenta = 0;
	for(i=0;i<NUM_ENEMIGOS;++i){
		if(enemigos[i].ent.cuadrante == mapaActual && enemigos[i].ent.vivo == 1){
			cuenta++;
		}
	}
	return cuenta;
}

void updateIA(){
	u8 i;
	/*if(turno >= NUM_ENEMIGOS){
		turno = 0;
	}*/

	for(i=0;i<NUM_ENEMIGOS;++i){
		//Solo updateamos la IA si ese enemigo esta en el cuadrante del player
		//Y es su turno
		if(enemigos[i].ent.cuadrante == mapaActual && enemigos[i].ent.vivo){
			//if(turno == i){
				updateIAState(&enemigos[i]);
				/*turno++;
			}*/
			
		}/*else{
			turno++;
		}*/
	}
}
TPlayerDirection comprobarEjeX(TEnemy* ene){
	TPlayerDirection dir;
	//Comprobamos hacia donde moverse
	if(ene->ent.x > puntos[ene->puntoDeControl].x){	//Si se cumple movemos hacia la izquierda
		dir = d_left;
	}else{
		dir = d_right;
	}

	return dir;
}
TPlayerDirection comprobarEjeY(TEnemy* ene){
	TPlayerDirection dir;
	//Comprobamos hacia donde moverse
	if(ene->ent.y > puntos[ene->puntoDeControl].y){	//Si se cumple movemos hacia la derecha
		dir = d_up;
	}else{
		dir = d_down;
	}

	return dir;
}
u8 moverHaciaPuntoDeControl(TEnemy* ene){
	TPlayerDirection dir;
	i16 diff;
	u8 llego = NO;
	if(++ene->cycles >= ene->wait_cycles){
		dir = comprobarEjeX(ene);
		//Calculamos el valor absoluto de la diferencia de eje X
		diff = abs(ene->ent.x - puntos[ene->puntoDeControl].x);	
		if(diff <= 2){
			dir = comprobarEjeY(ene);
			diff = abs(ene->ent.y - puntos[ene->puntoDeControl].y);	
			if(diff <= 2){
				llego = SI;
			}
		}
		ene->ent.curr_dir = dir;
		ene->cycles = 0; //Reseteamos el ciclo actual de espera
	}
	
	accion(&ene->ent, es_mover, ene->ent.curr_dir);

	return llego;
}
i16 abs(i16 num){
	i16 i;
	i16 numPositivo=0;
	if(num<0){
		numPositivo -= num;
	}else{
		numPositivo=num;
	}

	return numPositivo;
}

TPlayerDirection calculaDireccion(){
	TPlayerDirection dir;
	switch(mapaActual){
		case 0:
			dir = d_right;
		break;
		case 1:
			dir = d_up;
		break;
		case 2:
			dir = d_right;
		break;
		case 3:
			dir = d_up;
		break;
		case 4:
			dir = d_down;
		break;
		case 5:
			dir = d_down;
		break;
	}
	return dir;
}

void updateIAState(TEnemy* ene){
		TPlayer* p = &player;
		TCoord* c = &puntos[0];
		TBase* bases = getBases();
		u8 i = 0;
		switch(ene->statusIA){
			case s_mover:
				//Hay que comprobar si hay 5 o mas bases capturadas
				//Y si el enemigo esta solo, entonces huye
				if(basesCapturadas >= 5 && contarEnemigos() == 1 && count == 0){
					ene->statusIA = s_huir;
					count++;
					break;		//Salimos
				}
				// 0 = punto1(Arriba), 1 = punto2(Abajo), 3 = punto3(Derecha), 4 = punto4(Izquierda)
				if(moverHaciaPuntoDeControl(ene))	//si devuelve true es que ha llegado al siguiente
					ene->puntoDeControl++;			//punto de control por lo que ahora cambia de destino
				if(ene->puntoDeControl > 3){
					//Cambiamos una posicion del punto de control a la posicion del enemigo actualmente
					c->x = p->ent.x;
					c->y = p->ent.y;
					ene->puntoDeControl = 0;
				}
				comprobarSiDisparo(ene, p);
			break;
			case s_huir:
			ene->ent.curr_dir = calculaDireccion();
			if(accion(&ene->ent, es_mover, ene->ent.curr_dir) != d_nothing){
				calculaEntity(&ene->ent, SI);
				borrarEntity(&ene->ent);
				ene->ent.cuadrante++;
				if(ene->ent.cuadrante > 5)
					ene->ent.cuadrante = 0;
				for(i = 0; i<NUM_BASES; i++){
					if(bases[i].whom == 0 && bases[i].ent.cuadrante != mapaActual){
						bases[i].whom = 1;
						bases[i].cycles = 0;
						bases[i].ent.sprites[0] = NULL;
						basesCapturadas--;
						break;
					}
				}
			}
				//Huir
				/*random_number = getRandomUniform(seed)%2 + 1;
				if(random_number)
					respawnearEnemigo(&enemies[random_number]);*/
			break;
		}
}
void comprobarSiDisparo(TEnemy* ene, TPlayer* p){
	TPlayerDirection dir;
	i16 diff;
	if(++ene->shot_cycles >= wshot_cycles){
		diff = abs(ene->ent.x - p->ent.x);	
		if(diff <= 2){//Disparo en direccion dir
			if(ene->ent.y > p->ent.y){	//Si se cumple sabemos dir de disparo
				dir = d_up;
			}else{
				dir = d_down;
			}
			ene->ent.curr_dir = dir;
			disparar(&ene->bullet, ene->ent.x, ene->ent.y, dir);
		}else{
			diff = abs(ene->ent.y - p->ent.y);	
			if(diff <= 2){
				if(ene->ent.x > p->ent.x){	//Si se cumple sabemos dir de disparo
					dir = d_left;
				}else{
					dir = d_right;
				}
				ene->ent.curr_dir = dir;
				disparar(&ene->bullet, ene->ent.x, ene->ent.y, dir);
			}
		}
		//reinicio la cuenta
		ene->shot_cycles = 0;
	}
	
		
}

void redibujarEntity(TEntity* ent, u8 w, u8 h){
	if (ent->draw && ent->cuadrante == mapaActual) {
			borrarEntity(ent);
			ent->px = ent->x;
			ent->py = ent->y;
			dibujarEntity(ent, w, h);
			ent->draw = NO;
	}
}

void borrarEntity(TEntity* ent){
	if(ent->draw){
		cpct_etm_drawTileBox2x4(ent->tpx, ent->tpy, ent->tw, ent->th, g_map11_W, ORIGEN_MAPA, mapa);
	}
}

void dibujarEntity(TEntity* ent, u8 w, u8 h){
	if (ent->draw) {
		cpct_drawSpriteMaskedAlignedTable(ent->sprites[ent->curr_dir],ent->vmem, w, h, g_tablatrans);
	}
}

//Calculamos lo que vamos a dibujar
void calculaEntity(TEntity* ent, u8 origen){
	/*if(ent->sw%2 != 0)
		ent->tw = ent->sw/2 + (ent->px & 1) + 1;
	else*/
		ent->tw = ent->sw/2 + (ent->px & 1);
	/*if(ent->sh%4 != 0)
		ent->th = ent->sh/4 + 1 + (ent->py & 3 ? 1 : 0);
	else*/
		ent->th = ent->sh/4 + (ent->py & 3 ? 1 : 0);
	
	ent->tpx = ent->px / 2;
	if(origen == SI)
		ent->tpy = (ent->py - ORIGEN_MAPA_Y) / 4;
	else
		ent->tpy = (ent->py) / 4;
	ent->coll.x = ent->x;
	ent->coll.y = ent->y;
	ent->vmem = cpct_getScreenPtr(CPCT_VMEM_START,ent->x, ent->y);
}

//Calculamos TODAS las entities
void calculaAllEntities(TPlayer* player){
	u8 i;
	TStaticAnimation* exp;
	exp = getExplosion();
	calculaEntity(&player->ent, SI);
	calculaEntity(&player->bullet.ent, SI);
	calculaEntity(&exp->ent, SI);
	for(i=0;i < NUM_ENEMIGOS;++i){
		if(enemigos[i].ent.cuadrante == mapaActual){
			calculaEntity(&enemigos[i].ent, SI);
			calculaEntity(&enemigos[i].bullet.ent, SI);
		}
		
	}
	calculaEntity(&bases[mapaActual].ent, SI);
}

//Dibujamos todos los enemigos y el player
void drawAll(TPlayer* player){
	u8 i;
	TBase *bases;
	TStaticAnimation* exp;
	exp = getExplosion();
	bases = getBases();

	/*for(i=0;i < NUM_BASES; ++i){
		if(bases[i].ent.sprites[0] != NULL){
			redibujarEntity(&bases[i].ent, bases[i].ent.sw, bases[i].ent.sh);
		}
	}*/
	if(bases[mapaActual].ent.sprites[0] != NULL){
			redibujarEntity(&bases[mapaActual].ent, bases[mapaActual].ent.sw, bases[mapaActual].ent.sh);
		}

	redibujarEntity(&player->bullet.ent, player->bullet.ent.sw, player->bullet.ent.sh);
	redibujarEntity(&player->ent, player->ent.sw, player->ent.sh);
	redibujarEntity(&exp->ent,exp->ent.sw,exp->ent.sh);
	//Dibujamos los enemigos
	for(i = 0; i < NUM_ENEMIGOS; ++i){
		if(enemigos[i].ent.cuadrante == mapaActual){
			redibujarEntity(&enemigos[i].ent, enemigos[i].ent.sw, enemigos[i].ent.sh);
			redibujarEntity(&enemigos[i].bullet.ent, enemigos[i].bullet.ent.sw, enemigos[i].bullet.ent.sh);
		}
	}
	
}


TEnemy* getEnemies(){
	return enemigos;
}

TBase* getBases(){
	return bases;
}