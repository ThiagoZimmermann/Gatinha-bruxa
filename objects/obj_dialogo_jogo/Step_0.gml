/// @description Inserir descrição aqui
// Você pode escrever seu código neste editor

	if keyboard_check_released(ord("C")){
		
		if pagina < array_length(texto) -1 { // tem algum texto pra avançar?
			pagina++; // sim, avançar
			} else {
				instance_destroy(obj_dialogo_jogo); // não, destruir caixa de texto	
				obj_margarida.estado_player = scr_player_andando;
				obj_margarida.indo_dialogar = false;
				
			}
			
	}

// Quando o obj_dialogo for criado, vai desencadear essa função
scr_textos();