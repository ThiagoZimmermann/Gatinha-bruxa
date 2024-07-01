/// @description Inserir descrição aqui
// Você pode escrever seu código neste editor

var _c = c_black;
var _w = c_white;

var _npcx = x;
var _npcy = y;
var _margaridax = obj_margarida.x;
var _margariday = obj_margarida.y;

// SISTEMA DIÁLOGO

	// Pegando o obj do npc
	var _npc = obj_margarida.npc;
	
	// pegando o sprite mais proximo
	if (_npc.sprite_index != -1) {
		var _npc_sprite = _npc.sprite_index;
	} else {
	 var _npc_sprite = 0;
	}

	// altura e comprimento do sprite do npc
	var _npca = sprite_get_height(_npc_sprite);
	var _npcl = sprite_get_width(_npc_sprite);
	
	// escala do sprite
	var _escalax = _npc.image_xscale;
	var _escalay = _npc.image_yscale;
	
	// pegando a altura e largura do texto
	var _textol = string_width_ext(texto[pagina],10,200);
	var _textoa = string_height_ext(texto[pagina],10,200);

	// alocando na tela onde seria o x1 e y1 do balão - a extremidade superior esquerda do personagem 
	var _balaox = _npc.x + (_npcl);
	var _balaoy = _npc.y - (_npca * _escalay);
	
	// alocando x2 e y2
	var _balaox2 =  _balaox + (_textol + 2);
	var _balaoy2 = _balaoy - (_textoa + 2);

	var _textox = _balaox + 2;
	var _textoy = _balaoy - _textoa;
	
	if !(_balaox >= 0 and _balaox2 <= room_width and 
		_balaoy >= 0 and _balaoy2 <= room_height) {
		
		// mudando x1 e x2
		_balaox = _npc.x - (_npcl);
			
		// pegando a altura/altura e colocando as margens
		_balaox2 =  _balaox - (_textol + 2);
		
		_textox = _balaox;
		draw_set_halign(fa_right);
		
	}
		
// Desenhando a caixa de texto
draw_rectangle_color(_balaox, _balaoy, _balaox2, _balaoy2, _c, _c, _c, _c, false);
draw_rectangle_color(_balaox, _balaoy, _balaox2, _balaoy2, _c, _c, _c, _c, true);
draw_text_ext(_textox, _textoy, texto[pagina], 10, 200);

if escolha  {
	
	draw_sprite_ext(spr_resposta, 0, respx, respy, escala, escala, 0, _w, 1);
	}if escolhendo {
		draw_rectangle_color(bttnx2, bttny, bttnx2 + slotl, bttny + slota, c_black, c_black, c_black, c_black, false)

		
	} else { bttnx2 = -1 }

