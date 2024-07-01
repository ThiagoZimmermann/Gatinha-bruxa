// Os recursos de script mudaram para a v2.3.0; veja
// https://help.yoyogames.com/hc/en-us/articles/360005277377 para obter mais informações
function scr_margarida_andando(){
	
#region	SISTEMA DE MOVIMENTAÇÃO E COLISÃO
	// SISTEMA DE MOVIMENTAÇÃO E COLISÃO	
	
		// Horizontal
		
		 if place_meeting(x + 1,y, obj_colosao_){
		
			xx = mouse.none
			col = "direita"
			
		 } 
		 else { 
			 
			 if  place_meeting(x - 1,y, obj_colosao_) {
			 
				xx = mouse.none
				col = "esquerda"
			 
			}
		 }
		 
		 
		 // Vertical
		 
		if place_meeting(x, y + 1, obj_colosao_){
		
			yy = mouse.none
			col = "baixo"
		
		 } 
		 else { 
			 if place_meeting(x, y -1 , obj_colosao_) {
			 
			 yy = mouse.none
			 col = "cima"
			 
			}
		 }
		 
		
		if (xx != mouse.none and yy != mouse.none) { //se não estiver colidindo ou parado
					
			move_towards_point(xx,yy,veloc); //andar até o mouse
					
			} 
			else { 
				
				if col == "direita" and dirx != 1 and mouse_check_button_pressed(mb_left){ // se estiver colidindo horizontalmente e nao estiver clicando para esta direçaõ
				
					xx = mouse_x
					yy = mouse_y
					move_towards_point(xx,yy,veloc);
					
				}  
				
				else { 
				
					if col == "esquerda" and dirx == 1 and mouse_check_button_pressed(mb_left){ // se estiver colidindo horizontalmente e nao estiver clicando para esta direçaõ
				
					xx = mouse_x
					yy = mouse_y
					move_towards_point(xx,yy,veloc);
					
					} 
					else {
					 
						if col == "baixo" and diry != 1  and mouse_check_button_pressed(mb_left){ 
						 
							xx = mouse_x
							yy = mouse_y
							move_towards_point(xx,yy,veloc)
					 
						} 
						else {
							
							if col == "cima" and diry == 1  and mouse_check_button_pressed(mb_left){ 
						 
							xx = mouse_x
							yy = mouse_y
							move_towards_point(xx,yy,veloc)
						
							}
							else { // se estiver parado
					
								speed=0;
							
							}
						}
					}
				}
			}
			
		// Se estiver próximo do xx, xx vira nulo
		
		if distance_to_point(xx,yy) < veloc + 2 { 
		
			xx = mouse.none;
			yy = mouse.none;
		
		}
		
	#region		
			// parar se colidir
				
			
				// Mudar sprite para parado
				
			
			
			
	// x e y do personagem
	
	// x += hveloc;
	
	/* Alterar sprite
	
		switch veloc {
		
			case 0:
			
				if keyboard_check_released(vk_right) {
					
					sprite_index = spr_margarida_parada_direita;	
					
				} else if keyboard_check_released(vk_left){
					
					sprite_index = spr_margarida_parada_esquerda;
				
					}
			
			break;
			
			case 2:
			
				if esquerda = 1 {
				
					sprite_index = spr_margarida_andando_esquerda;
				
				} else {
					
					sprite_index = spr_margarida_andando_direita;
					
					}	
			
			break;
			
		
		}
	*/
#endregion
#endregion

	// DIÁLOGO
	
		if obj_par_npcs.indo_dialogar {

			estado_player = scr_margarida_dialogo;
		
		}
		
}

function scr_margarida_inventario() {
		
	xx = mouse.none;
	yy = mouse.none;
	speed = 0

	if keyboard_check(vk_escape) {
	
		estado_player = scr_margarida_andando;
		obj_inventario.item_selecionado = -1;
		obj_inventario.pos_selecionada = -1;
	
	}

}

function scr_margarida_dialogo() {
	
	// Andando até o npc
	if obj_par_npcs.indo_dialogar { 
		
		if distance_to_point(xx,yy) < veloc + 2 and !instance_exists(obj_dialogo) { 
		
			// Parando a margarida
			xx = mouse.none;
			yy = mouse.none;
			speed = 0;
			
			// Encontrando qual é o npc clicado. x,y, instancia a ser vasculhada
			npc = instance_nearest(x,y,obj_par_npcs);
			show_debug_message(npc)
			// Criando um objeto para a caixa de texto
			var _dialogo = instance_create_layer(x,y, "Dialogo", obj_dialogo);
			// Pegando o valor da var npc_nome que está dentro do obj_dialogo e alterando pelo valor da var nome do npc mais perto (_npc)
			_dialogo.npc_nome = npc.nome
		
		}	
		
	}

	
}


