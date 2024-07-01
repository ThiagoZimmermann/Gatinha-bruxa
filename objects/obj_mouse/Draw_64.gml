/// @description Inserir descrição aqui
// Você pode escrever seu código neste editor

var _escala = 1;

	// Desenhando o item selecionado no mouse	
if obj_inventario.item_selecionado != -1 {
		
	draw_sprite_ext(obj_inventario.grid_itens[# Infos.Mundo, obj_inventario.pos_selecionada], obj_inventario.item_selecionado, x, y, 4, 4, 0 , c_white, 1);
	
} else {
	
	draw_sprite_ext(spr_mouse, 0, x, y, _escala, _escala, 0, c_white, 1);
	
}






