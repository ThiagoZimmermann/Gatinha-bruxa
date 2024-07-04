/// @description Inserir descrição aqui
// Você pode escrever seu código neste editor

if mudei { // se ja mudou de sala, enclarecer
	
	alpha -= .05;
	
} else { // se ainda não mudou de sala, escurecer
	
	alpha += .05;
	
	}
	
if alpha >= 1 { // quando estiver escuro, mudar de sala
		
	room_goto(sala);
		
	obj_player.x = personagemx;

	obj_player.y = personagemy;
	
}
