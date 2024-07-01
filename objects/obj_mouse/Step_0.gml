/// @description Inserir descrição aqui
// Você pode escrever seu código neste editor

x = mouse_x;
y = mouse_y;


if place_meeting(x,y, obj_botoes) {

	if mouse_check_button(mb_left) {
		
		sprite_index = spr_mouse_atencao;
	
	} else {
		
	sprite_index = spr_mouse_click;
	
	}

} else {

	sprite_index = spr_mouse;

}








