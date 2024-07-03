/// @description Insert description here
// You can write your code in this editor

// Chamando o script do estado
// Chamando o script do estado
	script_execute(estado_player);

#region sistema de movimento, apenas comentário
/* 
// SISTEMA DE MOVIMENTO

	// Definindo teclas de movimento

		direita = keyboard_check(vk_right);
		cima = keyboard_check(vk_up);
		esquerda = keyboard_check(vk_left);
		baixo = keyboard_check(vk_down);
	
			// Essas vars estão com valor booleano (0/1: false/true)
	
	// Definindo velocidade
	
		hveloc = (direita - esquerda) * veloc; 

	
			// Se direita for 1, o resultado vai ser 1.2 (2 = velocidade)
			// Se esquerda for 1, o resultado vai ser -1.2 por causa do "-"
		
		vveloc = (baixo - cima) * veloc;


// SISTEMA DE COLISÃO
	
	// Horizontal
	
		if place_meeting(x + hveloc, y, obj_wall){ 
		
			// Analisa se a hveloc pixels de distância há parede
		
			while !place_meeting(x + sign(hveloc), y, obj_wall){
			
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
		}
		
	// Vertical
	
		if place_meeting(x, y + vveloc, obj_wall){
			
			while !place_meeting(x, y + sign(vveloc), obj_wall){
			
				y += sign(vveloc);
			
			}
			
			vveloc = 0;
		}
	
// DEFININDO X E Y DO PERSONAGEM

	// Só é possivel fazer isso agora por causa do sistema de colisão que usa essas vars

	x += hveloc;
	y += vveloc;
	
// ALTERAR SPRITE

#region teste de alterar sprite

/* 	
	if direita = 1{
		
		sprite_index = spr_personagem_correndo_direita_strip6 
		
	} 
	
	if keyboard_check_released(vk_right){
	
		sprite_index = spr_personagem_parado_direita_strip6
		
	}
	
	if esquerda = 1{
		
		sprite_index = spr_personagem_correndo_esquerda_strip6 
		
	} 
	
	if keyboard_check_released(vk_left){
	
		sprite_index = spr_personagem_parado_esquerda_strip6
		
	}
	
	if baixo = 1{
		
		sprite_index = spr_personagem_correndo_baixo_strip6 
		
	} 
	
	if keyboard_check_released(vk_down){
	
		sprite_index = spr_personagem_parado_baixo_strip6
		
	}
	
	if cima = 1{
		
		sprite_index = spr_personagem_correndo_cima_strip6 
		
	} 
	
	if keyboard_check_released(vk_up){
	
		sprite_index = spr_personagem_parado_cima_strip6
		
	}


#endregion 

	if hveloc = 0 and vveloc = 0 {
		
		if keyboard_check_released(vk_up){
			
			sprite_index = spr_personagem_parado_cima_strip6;
			
		} else if keyboard_check_released(vk_down){
			
				sprite_index = spr_personagem_parado_baixo_strip6;
			
		} else if keyboard_check_released(vk_left){
			
				sprite_index = spr_personagem_parado_esquerda_strip6;
		
		} else if keyboard_check_released(vk_right){
			
				sprite_index = spr_personagem_parado_direita_strip6;
		
			}
			
		} else if keyboard_check(vk_up) {
			
				sprite_index = spr_personagem_correndo_cima_strip6;
			
			} else if keyboard_check(vk_down){
			
				sprite_index = spr_personagem_correndo_baixo_strip6;
			
			} else if keyboard_check(vk_left){
			
				sprite_index = spr_personagem_correndo_esquerda_strip6;
		
			} else if keyboard_check(vk_right){
			
				sprite_index = spr_personagem_correndo_direita_strip6;
		
			}
	*/
#endregion

