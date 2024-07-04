/// @description Inserir descrição aqui
// Você pode escrever seu código neste editor

var _guil = display_get_gui_width();
var _guia = display_get_gui_height();

var _mx = device_mouse_x_to_gui(0);
var _my = device_mouse_y_to_gui(0);

if inventario == true {

	var _invx = _guil/2 - inventario_l/2
	var _invy = _guia/2 - inventario_a/2
	show_debug_message(_invx)
	
	draw_sprite_ext(spr_inventario, 0, _invx, _invy, escala, escala, 0, c_white, 1);
	
	var _ix = 0; // slot no sentido x
	var _iy = 0; // slot no sentido y
	
	// quando ix = 8, soma 1 em iy e ix volta a 0
	
	// CÓDIGO SLOTS
		#region
		// REPETIR ENQUANTO i < total_slots, SOMANDO 1 a cada vez
		for (var _i = 0; _i < total_slots; _i++) { 
		
			// pegar o x e o y do slot para criá-lo
			var _slotsx = _invx + comeco_x + ((tamanho_slot + buffer) * _ix);
			var _slotsy = _invy + comeco_y + ((tamanho_slot + buffer) * _iy);
		
			if point_in_rectangle(_mx, _my, _slotsx, _slotsy, _slotsx + tamanho_slot, _slotsy + tamanho_slot) {
		
				// show_debug_message mostra var na barra de baixo
		
				draw_sprite_ext(spr_seletor_inventario, 0, _slotsx, _slotsy, escala, escala, 0, c_white, 1);
			
				// Ao clicar em um dos slots
			
				if mouse_check_button_pressed(mb_left) {
				
					if item_selecionado == -1 { 
					// Caso ainda não tenha nenhum item selecionado
					item_selecionado = grid_itens[# Infos.Item, _i];
					pos_selecionada = _i;	
			
					} else { // Caso já tenha um item selecionado	
				
						// 1- Caso o slot selecionado esteja vazio
						if grid_itens[# Infos.Item, _i] == -1 and pos_selecionada != _i {
				
							// Vai trocar colocar o item selecionado no slot vazio
							grid_itens[# Infos.Item, _i] = grid_itens[# Infos.Item, pos_selecionada];
							grid_itens[# Infos.Quantidade, _i] = grid_itens[# Infos.Quantidade, pos_selecionada];
							grid_itens[# Infos.Mundo, _i] = grid_itens[# Infos.Mundo, pos_selecionada];
					
							// Limpando o slot vazio
							grid_itens[# Infos.Item, pos_selecionada] = -1;
							grid_itens[# Infos.Quantidade, pos_selecionada] = -1;
							grid_itens[# Infos.Mundo, pos_selecionada] = -1;
						
							item_selecionado = -1;
							pos_selecionada = -1;
						}
						// 2- Caso o slot selecionado já tenha um item e vamos trocar as posições
						else if grid_itens[# Infos.Item, pos_selecionada] != grid_itens[# Infos.Item, _i] or grid_itens[# Infos.Mundo, pos_selecionada] != grid_itens[# Infos.Mundo, _i] {
							
							// Se juntar nao estiver ligado
							if juntar = false {
				
								var _item = grid_itens[# Infos.Item, _i];
								var _quantidade = grid_itens[# Infos.Quantidade, _i];
								var _mundo = grid_itens[# Infos.Mundo, _i];				
									
								// Colocando o selecionado no slot
								grid_itens[# Infos.Item, _i] = grid_itens[# Infos.Item, pos_selecionada]; 
								grid_itens[# Infos.Quantidade, _i] = grid_itens[# Infos.Quantidade, pos_selecionada];
								grid_itens[# Infos.Mundo, _i] = grid_itens[# Infos.Mundo, pos_selecionada];
					
								// Colocando o do slot na selecionada
								grid_itens[# Infos.Item, pos_selecionada] = _item;
								grid_itens[# Infos.Quantidade, pos_selecionada] = _quantidade;
								grid_itens[# Infos.Mundo, pos_selecionada] = _mundo;

								item_selecionado = -1;
								pos_selecionada = -1;
								
							// se juntar estiver ligado
							} else {
								
								// Se juntar FAmarela com FAzul, = F Vermelha
								if (item_selecionado == grid_itens[# Infos.Item, Itens_pt1.FAmarela] and grid_itens[# Infos.Item, _i] == grid_itens[# Infos.Item, Itens_pt1.FAzul]) or (item_selecionado == grid_itens[# Infos.Item, Itens_pt1.FAzul] and grid_itens[# Infos.Item, _i] == grid_itens[# Infos.Item, Itens_pt1.FAmarela]) {
									
									show_debug_message("yipee")
									// Colocando FAzul no slot _i
									grid_itens[# Infos.Item,  _i] = grid_itens[# Infos.Item, Itens_pt1.FVermelha];
									grid_itens[# Infos.Quantidade, _i] = grid_itens[# Infos.Quantidade, Itens_pt1.FVermelha];
									grid_itens[# Infos.Mundo, _i] = grid_itens[# Infos.Mundo, Itens_pt1.FVermelha];
									
									// Esvaziando item_selecionado
									grid_itens[# Infos.Item, pos_selecionada] = -1;
									grid_itens[# Infos.Quantidade, pos_selecionada] = -1;
									grid_itens[# Infos.Mundo, pos_selecionada] = -1;
									
									item_selecionado = -1;
									pos_selecionada = -1;
									juntar = false;
								
								}
								
							}

						}
				
					}
				}
			}
		
			// pegando o sprite de cada slot para desenhá-lo
			sprite = grid_itens[# Infos.Mundo, _i];
		
			// se a célula não estiver vazia (-1), ou seja, se estiver com algum item, ele vai desenhá-lo
		
			if grid_itens[# Infos.Item, _i] != -1 {
			
				//desenhar o spr_itens, mas no frame certo (slot i, frame i)
			
				// se o item selecionado for o que vai desenhar, deixar ele mais escuro
				if item_selecionado == grid_itens[# Infos.Item, _i] and grid_itens[# Infos.Mundo, _i] == grid_itens[# Infos.Mundo, pos_selecionada] {
				
					draw_sprite_ext(sprite, grid_itens[# 0, _i], _slotsx, _slotsy, escala, escala, 0, c_gray, 1);
				
			
				} else {
			
					draw_sprite_ext(sprite, grid_itens[# 0, _i], _slotsx, _slotsy, escala, escala, 0, c_white, 1);
			
				}
			
				// colocar a quantidade do item
				
					// setando a fonte
					draw_set_font(fnt_comic_sans);
					// setando o alinhamento (central)
					draw_set_halign(fa_center);
					// escrevendo na parte debaixo direita
					draw_text(_slotsx + tamanho_slot, _slotsy + tamanho_slot - 8, grid_itens[# Infos.Quantidade, _i]);
		
			}
		
			_ix++; // somando 1 a uma variável
		
			// se o ix superar a quantidade de slots horivzontal, ix volta ao primeiro slot (0) e iy avança 1 linha
			if _ix >= slots_h {
			
				_ix = 0 
				_iy++;
			
				}	
		}
	
		// 3- Largar um item selecionado
	
		if mouse_check_button_pressed(mb_right) {
	
			item_selecionado = -1;
			pos_selecionada = -1;
	
		}
	#endregion
	// CÓDIGO BOTOES
	
		// Se tiver com algum item selcionado
		if item_selecionado != -1 {
			
			// botao no sentido x, vai servir para multiplicar e ter o x de qualquer botao
			// var _ibx = 0;
			
			// Varrer botoes
			for (var _ibx = 0; _ibx < tot_botoes; _ibx++) {
			
				var _botaox = _invx + comeco_botao_x + ((horizontal_botoes + buffer_botao) * _ibx);
				var _botaoy = _invy + comeco_botao_y;
				
				// Se tiver com o mouse em cima do botão _ib
				if point_in_rectangle(_mx, _my, _botaox, _botaoy, _botaox + horizontal_botoes, _botaoy + vertical_botoes) and mouse_check_button_pressed(mb_left) {
					
					switch _ibx {
						
						// Se for o botao 0, ou USAR
						case 0: 
							 
							// Se for o VIDEOGAME, entrar no mundo virtual
							// Att.: aqui tá falando apenas item 3, talvez seja necessário mudar para item 3, mundo 1
							if item_selecionado == grid_itens[# Infos.Item, 3] {
								
								obj_margarida.estado_margarida = scr_videogame;
								var _tran = instance_create_layer(0,0,"Instances",obj_transicao_mundos)
								_tran.sala = Videogame_sala1;
								
		
							} else { // Senão, é um item normal
							// Fecha o inventário e ativa uma var que, ao clicar nos objs da sala, ativa outras ações e pensamentos
							usar = true;
							}
								
						break;
						
						// Se for o botao 1, ou JUNTAR
						case 1:
						
							// Ativar uma var que, ao juntar com certos itens, um novo é criado
							juntar = true;							
						
						break;
						
						// Se for o botao 2, ou EXAMINAR
						case 2:

							// Ativa a Caixa de Pensamento. Cada item terá sua descrição
							examinar = true;
						
						break;
					
					}
					
				}

			}
		
		}
		
}