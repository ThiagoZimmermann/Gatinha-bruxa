// Os recursos de script mudaram para a v2.3.0; veja
// https://help.yoyogames.com/hc/en-us/articles/360005277377 para obter mais informações
function scr_textos(){
	switch npc_nome{
		
		#region Mundo normal
		case "Menina":
			texto[0] = "Oi, aventureiro! Gostaria de te fazer uma pergunta: o que e pior do que a dor e a morte?";
			texto[1] = "gosto de batata";
			texto[2] = "e de arroz";
			if resposta == 1 {
			
				texto[3] = "Seu lindo <3";
				
			} else {
				
				texto[3] = "Seu feioso >:(";
				
			}
			
		break;
		
		
		#endregion 
		
		#region Jogo
		
		case "Marujo Rato":
		
			texto[0] = "Oibiiiiiiiiiii";
			texto[1] = "baibaiii";
		
		break;

		#endregion
		
}
		
}