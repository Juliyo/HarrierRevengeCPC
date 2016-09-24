#include <stdio.h>
#include <cpctelera.h>
#include "sprites/naves.h"
#include "game.h"
#include "entities/entities.h"

const TPlayer player = {
	100,
	50,
	player.x,
	player.y,
	g_naves_1
};

void inicializarPantalla(){
	//Limpiar la pantalla
	cpct_clearScreen(0);

	//Aqui dibujariamos cosas de la pantalla 
}

void updateUser(){
	// Scan Keyboard
   cpct_scanKeyboard_f();

   if(cpct_isKeyPressed(Key_CursorUp)){
   		accion(&player, es_mover, d_up);
   }else if(cpct_isKeyPressed(Key_CursorDown)){
   		accion(&player, es_mover, d_down);
   }else if(cpct_isKeyPressed(Key_CursorRight)){
   		accion(&player,es_mover,d_right);
   }else if(cpct_isKeyPressed(Key_CursorLeft)){
   		accion(&player,es_mover,d_left);
   }


}

void play(){

	inicializarPantalla();
	incializarEntities();

	//Esto seria mientras estes vivo
	while(1){
		updateUser();	
		updatePlayer(&player);

		cpct_waitVSYNC();
		drawAll(&player);
	}
}