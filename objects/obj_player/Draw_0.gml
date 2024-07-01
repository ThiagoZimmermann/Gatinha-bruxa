/// @description Inserir descrição aqui
// Você pode escrever seu código neste editor

// Sombra do personagem: (colocar primeiro, pois aqui funciona como camadas, de cima para baixo

	draw_sprite(spr_personagem_sombra, 0, x, y + 7);

	// Como funciona: após falar qual sprite vc quer, diga qual dos frames iniciará (0),
	// e as coordenadas (x, y + 3). Está assim para ficar próximo, mas abaixo do player

// Ao criar o evento Desenhar, devemos falar para o obj escrever novamente a si mesmo,
//  pois senão ele não se desenha. 

	draw_self();

