/// @description Inserir descrição aqui
// Você pode escrever seu código neste editor

npc_nome = "";
texto[0] = "";
pagina = 0;

inicializar = false;

draw_set_font(fnt_comic_sans);
draw_set_halign(fa_left);

guil = display_get_gui_width();
guia = display_get_gui_height();


// Resposta vars

escolha = false;
escolhendo = false;
resposta = -1;

escala = 5;
respl = sprite_get_width(spr_resposta);
respa = sprite_get_height(spr_resposta);
respx = guil/2 - (respl*escala)/2;
respy = (guia/10)*9.5 - respa * escala;


// botao vars

bttnx = -1
bttny = -1
slotl = -1 
slota = -1
bttnx2 = -1
bttny2 = -1
slotl2 = -1 
slota2 = -1





