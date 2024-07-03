/// @description Inserir descrição aqui
// Você pode escrever seu código neste editor

if pagina = 2 { // se for pg 2, entrar no modo escolha
	escolha = true
}
if !escolha { // se não estiver no modo escolha
	if keyboard_check_released(ord("C")){
		

		if pagina < array_length(texto) -1{ // tem algum texto pra avançar?
			pagina++; // sim, avançar
			} else {
				instance_destroy(obj_dialogo); // não, destruir caixa de texto	
				obj_margarida.estado_margarida = scr_margarida_andando;
				obj_par_npcs.indo_dialogar = false;
			
		}	
	}
} else { // se estiver no modo escolha
	var _comeco_x = 1 * escala;
	slotl = 15 * escala;
	
	var _comeco_y = 1 * escala;
	slota = 3 * escala;
	var _buffer = 9 * escala;
	var _tot_resp = 2;
	for (var _i = 1; _i <= _tot_resp; _i++) {
		bttnx = respx + _comeco_x + ((slotl + _buffer) * (_i - 1));		
		bttny = respy + _comeco_y;
		if point_in_rectangle(mouse_x, mouse_y, bttnx, bttny, bttnx + slotl, bttny + slota) {
			escolhendo = true;
			if bttnx2 = -1 { 
				bttnx2 = bttnx
			}
				
			
			if mouse_check_button_pressed(mb_right) {
				
				resposta = _i;
				escolhendo = false;
				escolha = false;
				pagina ++;
				
				
			
			} 
		
		} else { 
				escolhendo = false; 
				
			}
	}
}

// Quando o obj_dialogo for criado, vai desencadear essa função
scr_textos();