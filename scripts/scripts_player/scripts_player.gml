// Os recursos de script mudaram para a v2.3.0; veja
// https://help.yoyogames.com/hc/en-us/articles/360005277377 para obter mais informações
function scr_player_andando(){
	
#region SISTEMA BASICO MOVIMENTO, SPRITE, COLISAO PORTAS

// SISTEMA DE MOVIMENTO

	// Definindo teclas de movimento

		direita = keyboard_check(vk_right);
		cima = keyboard_check(vk_up);
		esquerda = keyboard_check(vk_left);
		baixo = keyboard_check(vk_down);
	
			// Essas vars estão com valor booleano (0/1: false/true)
	
	/* Definindo velocidade: DESSA FORMA, ACONTECE O BUG DE FICAR RÁPIDO QUANDO FOR PARA DIAGONAL
	
		hveloc = (direita - esquerda) * veloc; 

	
			// Se direita for 1, o resultado vai ser 1.2 (2 = velocidade)
			// Se esquerda for 1, o resultado vai ser -1.2 por causa do "-"
		
		vveloc = (baixo - cima) * veloc;

	*/
	
	//Definindo velocidade sem ter o bug:
	
		// define se está andando e para qual direção
	
		hveloc = (direita - esquerda);
		vveloc = (baixo - cima);
	
		// Vamos pegar o ponto para onde o personagem está indo 
		// os dois primeiros valores são o ponto de inicio, os dois ultimos são a posição final
	
		veloc_dir = point_direction(x,y, x + hveloc, y + vveloc);
	
		// se estiver andando, velocidade = 2
	
		if hveloc != 0 or vveloc != 0{
		
			veloc = 2;
		
		} else { // senão, velocidade = 0
		
				veloc = 0;
	
		}
		

	
		// Agora, vamos definir o quanto o personagem deve andar para chegar no ponto final,
		// definindo as velocidades como o quanto deve-se andar até chegar na posição desejada
	
		hveloc = lengthdir_x(veloc, veloc_dir);
		vveloc = lengthdir_y(veloc, veloc_dir);
	

// SISTEMA DE COLISÃO
	
	// Horizontal
	
		if place_meeting(x + hveloc, y, obj_colosao_){ 
		
			// Analisa se a hveloc pixels de distância há parede
		
			while !place_meeting(x + sign(hveloc), y, obj_colosao_){
			
				x += sign(hveloc);
			
				// ! = oposto
			
				// Sign transforma um número em 1 se for posistivo, -1 se negativo ou 0 se nulo (0)
			
				// Enquanto não está colidindo horizontalmente, o boneco anda 1 pixel na horizontal em direção à parede
					// até chegar nela
			
				// Faz com que o objeto seja "sugado" para a parede quando está perto demais
				// isso faz com que a colisão seja perfeita
			
			}
		
			hveloc = 0;
		
			// Se x + hveloc colidir com obj_tree, hveloc é 0 e o personagem não avança
			// hveloc não afeta ir para outra direção pq o local de place meeting muda
		
			// Mudar sprite para personagem parado se estiver colidindo
			if keyboard_check(vk_left) and sprite_index = spr_personagem_correndo_esquerda{ 
			
				sprite_index = spr_personagem_parado_esquerda;
			
			} else  if sprite_index = spr_personagem_correndo_direita{
				
					sprite_index = spr_personagem_parado_direita;
			
			}			
		}
		
	// Vertical
	
		if place_meeting(x, y + vveloc, obj_colosao_){
			
			while !place_meeting(x, y + sign(vveloc), obj_colosao_){
			
				y += sign(vveloc);
			
			}
			
			vveloc = 0;
			
			if keyboard_check(vk_up){ 
			
				sprite_index = spr_personagem_parado_cima;
			
			} else {
				
					sprite_index = spr_personagem_parado_baixo;
			
			}
		}
		
#region Colisão portas


	if place_meeting(x+hveloc, y, obj_transicao_sala) {
			
			var _porta = instance_nearest(x,y, obj_transicao_sala);
			show_debug_message(_porta.sala);
	
			hveloc = 0;
		
			if keyboard_check_released(ord("Z")) {
	
			room_goto(_porta.sala);

			x = _porta.personagemx;

			y = _porta.personagemy;

		} 
	
	}
	
	if place_meeting(x, y+vveloc, obj_transicao_sala) {
		
			vveloc = 0;
			
			var _porta = instance_nearest(x,y, obj_transicao_sala);
			
			if keyboard_check_released(ord("Z")) {
	
			room_goto(_porta.sala);

			x = _porta.personagemx;

			y = _porta.personagemy;

		} 
	
	}

#endregion
	
// DEFININDO X E Y DO PERSONAGEM

	// Só é possivel fazer isso agora por causa do sistema de colisão que usa essas vars

	x += hveloc;
	y += vveloc;


	
// ALTERAR SPRITE


	if hveloc = 0 and vveloc = 0 {
		
		if keyboard_check_released(vk_up){
			
			sprite_index = spr_personagem_parado_cima;
			
		} else if keyboard_check_released(vk_down){
			
				sprite_index = spr_personagem_parado_baixo;
			
		} else if keyboard_check_released(vk_left){
			
				sprite_index = spr_personagem_parado_esquerda;
		
		} else if keyboard_check_released(vk_right){
			
				sprite_index = spr_personagem_parado_direita;
		
			}
			
		} else if keyboard_check(vk_up) {
			
				sprite_index = spr_personagem_correndo_cima;
				dir = "cima";
			
			} else if keyboard_check(vk_down){
			
				sprite_index = spr_personagem_correndo_baixo;
				dir = "baixo";
			
			} else if keyboard_check(vk_left){
			
				sprite_index = spr_personagem_correndo_esquerda;
				dir = "esquerda";
		
			} else if keyboard_check(vk_right){
			
				sprite_index = spr_personagem_correndo_direita;
				dir = "direita";
			}
#endregion

	/* EXEMPLO PARA MUDAR DE ESTADO:
	
		if keyboard_check(ord("Z")) and place_meeting(x +2, y+2, obj_baú){
			
			estado = scr_player_chest;
		
		}
	
	*/
	
	// Estado baú
	if (place_meeting(x+2, y+2, obj_bau) or place_meeting(x-2,y-2, obj_bau)) and keyboard_check_released(ord("Z")){
		
		estado_player = scr_player_bau;
		
		switch_dir();
		
	}
	
	// Estado Menu
	if keyboard_check_released(ord("X")){
		
		estado_player = scr_player_menu;
		
		switch_dir();
				
		
	}
	
	// Diálogo
	
	if distance_to_object(obj_par_npc_jogo) <= 10 and keyboard_check_pressed(ord("Z")){
	
		estado_player = scr_dialogo;
		
		switch_dir();
	
	}



}

// Estado para quando estiver abrindo baú

function scr_player_bau(){
	
	if keyboard_check_released(ord("Z")){
		
		estado_player = scr_player_andando;
		
	}
	
}

function scr_player_menu(){
	
	if keyboard_check_released(ord("X")) {
		
		estado_player = scr_player_andando;
	
	}
	
}

function scr_player_inventario(){
	
	if keyboard_check_released(ord("X")) {
		
		estado_player = scr_player_andando;
	
	}
	
}

function scr_dialogo(){ // sistema de diálogo, descrito em scripts_margarida

	npc = instance_nearest(x,y, obj_par_npc_jogo);
	show_debug_message(npc)
	var _dialogo = instance_create_layer(x,y, "Dialogo", obj_dialogo_jogo);
	_dialogo.npc_nome = npc.nome;

}

