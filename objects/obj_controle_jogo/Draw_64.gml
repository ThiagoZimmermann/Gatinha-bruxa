/// @description Inserir descrição aqui
// Você pode escrever seu código neste editor

var _escala = 5.5;
var _guia = display_get_gui_height();
var _guil = display_get_gui_width();


if obj_player.estado_player = scr_player_bau{
	
	// spr, sub-image, x, y, xscale, yscale, rotação, cor (white para manter), alpha (translucidez)
	draw_sprite_ext(spr_jogo_inventario_aberto, 0, _guil/2, _guia/2, _escala, _escala, 0 , c_white, 1);
	draw_text_ext_transformed(_guil/2 - 120, _guia/2 - 125,"Margarida", 10 , 300, 1.5, 1.5, 0)

}

if obj_player.estado_player = scr_player_menu {
	
	draw_sprite_ext(spr_jogo_inventario_aberto,0, _guil/2, _guia/2, _escala, _escala, 0, c_white, 1);
	draw_text_ext_transformed(_guil/2 - 120, _guia/2 -125, "Margarida", 10, 300, 1.5, 1.5, 0);

}

if obj_player.estado_player = scr_player_inventario {
	
	draw_sprite_ext(spr_jogo_inventario_aberto, 0, (_guil/10), (_guia/10)*9,_escala, _escala, 0, c_white, 1);
}

if instance_exists(obj_player) {

	draw_sprite_ext(spr_tela, 0, 0, 0, 0.35, 0.35, 0, c_white, 1);
	

}