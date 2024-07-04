/// @description Inserir descrição aqui
// Você pode escrever seu código neste editor
if array_length(texto) > pagina {
var _c = c_black;
var _w = c_white;

// Pegando o obj do npc
	var _npc = obj_player.npc;
	
	// pegando a altura e largura do texto
	var _textol = string_width_ext(texto[pagina],10,200);
	var _textoa = string_height_ext(texto[pagina],10,200);
	
// Desenhando a caixa de texto
draw_rectangle_color(31, guia/10*6, 310, 161, _c, _c, _c, _c, false);
draw_rectangle_color(31, guia/10*6, 310, 161, _w, _w, _w, _w, true);
draw_text_ext(31, guia/10*6, texto[pagina], 10, 200);
}