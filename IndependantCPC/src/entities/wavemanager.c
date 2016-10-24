#include <cpctelera.h>

#include "wavemanager.h"
#include "entities.h"
#include "../game.h"
#include "../random/random.h"

u16 s_samemap = 0;
u16 d_samemap = 500;

//Semilla
u8 seed = 1;

u8 enemigos_actual = NUM_ENEMIGOS;

u8 mapaPrev;

void aparecerEnemigo(){
	TEnemy* enemies;
	u8 random_number;
	//Si no hay ningun enemigo
	//Y ademas hay al menos 6 bases capturadas
	if(contarEnemigos() == 0 && basesCapturadas >= 2){
		random_number = getRandomUniform(seed)%3;
		enemies = getEnemies();
		random_number = getRandomUniform(seed)%2 + 1;
		if(random_number)
			respawnearEnemigo(&enemies[random_number]);
	}
}
void respawnearEnemigo(TEnemy* enemy){
	revivirEnemigo(enemy, getRandomUniform(seed)%70 + 5, getRandomUniform(seed)%141 + 50, getRandomUniform(seed)%3);
}

void inicializarWaveManager(){
	seed = 1;
	s_samemap = 0;
	d_samemap = 500;
	enemigos_actual = NUM_ENEMIGOS;
}
//Para contar el tiempo que lleva el jugador en el mismo mapa
void updateTiempoEnMapa(){
	if(++s_samemap >= d_samemap){
		if(contarEnemigos() == 0)
			respawnearEnemigoPorBorde();
		s_samemap = 0;
	}
	seed++;
	if(seed > 15000)
		seed = 1;
}
void resetearTimepoEnMapa(){
	s_samemap = 0;
}

//Spawnea un enemigo saliendo por un borde, se llama cuando el player lleva mucho tiempo en un mapa
void respawnearEnemigoPorBorde(){
	TEnemy* enemies;
	u8 random_number;
	//i16 x,y;
	random_number = getRandomUniform(seed)%3;
	enemies = getEnemies();

	
	/*for(i = 0; i < NUM_ENEMIGOS;++i){
		if(enemies[i].ent.vivo == NO){*/
			posicionAleatoriaBorde(&enemies[random_number]);
			//break;
		/*}
	}*/
	
}

void posicionAleatoriaBorde(TEnemy* enemy){
	i16 random_number;
	//cpct_srand(seed);
	//random_number = cpct_rand()%70 + 1;
	switch(mapaActual){
		//Primer cuadrante Borde Izquierda - Abajo
		case 0:
			random_number = getRandomUniform(seed)%2 + 1;											//Aleatorio 0 o 1
			if(random_number == 1){														//Reaparece por arriba
				revivirEnemigo(enemy, getRandomUniform(seed)%70 + 5, ORIGEN_MAPA_Y, d_down);
			}else{																		//Reaparece por derecha
				revivirEnemigo(enemy, ANCHO - enemy->ent.sw, getRandomUniform(seed)%141 + 50, d_left);	
			}
		break;
		case 1:
			random_number = getRandomUniform(seed)%2 + 1;											//Aleatorio 0 o 1
			if(random_number == 1){														//Reaparece por arriba
				revivirEnemigo(enemy, getRandomUniform(seed)%70 + 5, ORIGEN_MAPA_Y, d_down);
			}else{																		//Reaparece por izquierda
				revivirEnemigo(enemy, 0, getRandomUniform(seed)%141 + 50, d_right);	
			}
		break;
		case 2:
			random_number = getRandomUniform(seed)%3 + 1;											//Aleatorio 0 o 1
			if(random_number == 1){																				//Reaparece por arriba
				revivirEnemigo(enemy, getRandomUniform(seed)%70 + 5, ORIGEN_MAPA_Y, d_down);
			}else if(random_number == 2){																		//Reaparece por derecha
				revivirEnemigo(enemy, ANCHO - enemy->ent.sw, getRandomUniform(seed)%141 + 50, d_left);	
			}else{																								//Reaparece por abajo
				revivirEnemigo(enemy, getRandomUniform(seed)%70 + 5, ALTO - enemy->ent.sh, d_up);
			}
		break;
		case 3:
			random_number = getRandomUniform(seed)%3 + 1;											//Aleatorio 0 o 1
			if(random_number == 1){																				//Reaparece por arriba
				revivirEnemigo(enemy, getRandomUniform(seed)%70 + 5, ORIGEN_MAPA_Y, d_down);
			}else if(random_number == 2){																		//Reaparece por izquierda
				revivirEnemigo(enemy, 0, getRandomUniform(seed)%141 + 50, d_right);		
			}else{																								//Reaparece por abajo
				revivirEnemigo(enemy, getRandomUniform(seed)%70 + 5, ALTO - enemy->ent.sh, d_up);
			}
		break;
		case 4:
			random_number = getRandomUniform(seed)%2 + 1;											//Aleatorio 0 o 1
			if(random_number == 1){														//Reaparece por abajo
				revivirEnemigo(enemy, getRandomUniform(seed)%70 + 5, ALTO - enemy->ent.sh, d_up);
			}else{																		//Reaparece por derecha
				revivirEnemigo(enemy, ANCHO - enemy->ent.sw, getRandomUniform(seed)%141 + 50, d_left);	
			}
		break;
		case 5:
			random_number = getRandomUniform(seed)%2 + 1;											//Aleatorio 0 o 1
			if(random_number == 1){														//Reaparece por izquierda
				revivirEnemigo(enemy, 0, getRandomUniform(seed)%141 + 50, d_right);	
			}else{																		//Reaparece por abajo
				revivirEnemigo(enemy, getRandomUniform(seed)%70 + 5, ALTO - enemy->ent.sh, d_up);	
			}
		break;
	}
	
	enemigos_actual++;
}

void revivirEnemigo(TEnemy* enemy, i16 x, i16 y, TPlayerDirection dir){
	enemy->ent.vivo = SI;
	enemy->ent.draw = SI;
	enemy->ent.x = x;
	enemy->ent.y = y;
	enemy->ent.px = x;
	enemy->ent.py = y;
	enemy->ent.cuadrante = mapaActual;
	enemy->statusIA = s_mover;
	enemy->ent.curr_dir = dir;
	enemy->bullet.ent.cuadrante = mapaActual;

}


void restarEnemigo(){
	enemigos_actual--;
}