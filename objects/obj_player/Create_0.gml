window_set_size(1020, 576)
window_center()

/// @description Insert description here
// You can write your code in this editor

// Variáveis para teclas de movimento

	direita = -1;
	cima = -1;
	esquerda = -1;
	baixo = -1;
	
	dir = -1;

// Variáveis de vel

	hveloc = 0;
	vveloc = 0;

	veloc = 2;
	
	veloc_dir = -1;

// ESTADO: atribuindo um script (um grupo de códigos que podemos chamá-los) a uma vairável, a qual podemos variar
// de acordo com o momento/ação do player.

	obj_margarida.estado_player = scr_player_andando;
	
// Profundidade do sprite 

	depth = -y;
	
	npc = -1;
	
