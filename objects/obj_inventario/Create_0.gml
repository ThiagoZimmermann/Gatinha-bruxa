/// @description Inserir descrição aqui
// Você pode escrever seu código neste editor

// PARTE DE ITENS
	#region
	
	inventario = false;
	escala = 4;

	comeco_x = 4 * escala;
	comeco_y = 4 * escala;

	slots_h = 5;
	slots_v = 2;
	total_slots = slots_h * slots_v;
	tamanho_slot = 8 * escala;
	buffer = 2 * escala; 

	inventario_l = sprite_get_width(spr_inventario) * escala;
	inventario_a = sprite_get_height(spr_inventario) * escala;

	item_selecionado = -1;
	pos_selecionada = -1;
	sprite = -1;

	// enum enumera os valores em { } para o nome dado

	enum Itens_pt1 {
		FAmarela, // 0
		FVermelha, // 1
		FAzul, // 2
		Videogame, // 3
		Altura // quantos itens está dentro de Itens
	}

	// então, Itens.Vermelha = 1

	enum Itens_pt2 {
		EAmarela,
		EAzul,
		ERosa,
		Altura
	}

	// para indexarmos qual coluna do grid estamos falando: Item (coluna 0) ou Quantidade (coluna 1)
	enum Infos {
		Item,
		Quantidade,
		Mundo,
		Altura
	}

	//criar um grid para colocar os itens com tal informação no inventário

	// 2 é quantas informações vamos guardar e total_slots é quantas células vão ter
	grid_itens = ds_grid_create(Infos.Altura, total_slots); 

	//para cada célula não ser 0, vamos alterar para -1
	// qual grid alterar, qual é a primeira célula (xy), qual é a última célula a mudar (xy), para o que mudar
	ds_grid_set_region(grid_itens, 0, 0, Infos.Altura -1, total_slots - 1, -1);

	/* Primeiro Slot - Há duas formas de colocar um item em um grid. Esta (manual) e a proxima (com função)

		// para acessar uma célula do grid, usar [# x, y]
	
		// na célula 0,0, séra colocado o valor 0, ou seja, Flor Amarela
		grid_itens[# Infos.Item, 0] = Itens_pt1.FAmarela;
		// na célula 1, 0, será colocado o valor 3, ou seja, há 3 Flores Amarelas
		grid_itens[# Infos.Quantidade, 0] = 3
		grid_itens[# Infos.Mundo
	*/

	// Adicionando os itens tb, mas usando a função ds_grid_add_item (criada por mim)
	//				(Item,		Quantidade,		Mundo)
	// pt1
	ds_grid_add_item(Itens_pt1.FAzul, 1,		spr_itens_pt1);
	ds_grid_add_item(Itens_pt1.FVermelha, 129,	spr_itens_pt1);
	ds_grid_add_item(Itens_pt1.FAmarela, 12,	spr_itens_pt1);
		
		// Videogame
		ds_grid_add_item(Itens_pt1.Videogame, 1, spr_itens_pt1);		

	// pt2
	ds_grid_add_item(Itens_pt2.EAmarela, 6,		spr_itens_pt2);
	ds_grid_add_item(Itens_pt2.ERosa, 2,		spr_itens_pt2);
	ds_grid_add_item(Itens_pt2.EAzul, 7,		spr_itens_pt2);
	
	
	
	#endregion

// BOTÕES
	
	comeco_botao_x = 4 * escala;
	comeco_botao_y = 28 *escala;
	
	tot_botoes = 3;
	horizontal_botoes = (15 * escala)-1;
	vertical_botoes = (7 * escala)-1;
	buffer_botao = (1 * escala) +1;

	usar = false;
	juntar = false;
	examinar = false;
	

	
	
