#include <stdio.h>
#include <cpctelera.h>
#include "sprites/naves.h"
#include "game.h"
#include "entities/entities.h"

const TPlayer player = {
	100,
	50,
	g_naves_0
};

void inicializarPantalla(){
	//Limpiar la pantalla
	cpct_clearScreen(0);

	//Aqui dibujariamos cosas de la pantalla 
}

/*void updateUser(TPlayer* user){

}*/

void play(){

	inicializarPantalla();
	incializarEntities();

	//Esto seria mientras estes vivo
	while(1){
		//updateUser(&player);	
		//updatePlayer(player);
		drawAll(&player);
	}
}