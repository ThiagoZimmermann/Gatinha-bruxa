// Os recursos de script mudaram para a v2.3.0; veja
// https://help.yoyogames.com/hc/en-us/articles/360005277377 para obter mais informações
function ds_grid_add_item(){
	///@agr Item
	///@agr Quantidade
	///@agr Mundo
	
	var _grid = obj_inventario.grid_itens;
	var _checagem = 0;
	
	// Checar qual slot ta vazio
	while _grid[# Infos.Item, _checagem] != -1 {
		_checagem++;
	}
	
	// argument serve pra criar os argumentos de uma função, como se fosse as do GM
	_grid[# 0, _checagem] = argument[0]; // argument 0, ou o primeiro argumento, é para o item a ser selecionado
	_grid[# 1, _checagem] = argument[1]; // argument 1, ou o segundo argumento, é para a quantidade a ser selecionada
	_grid[# 2, _checagem] = argument[2]; // argument 2, ou o terceiro argumento, é para o Mundo a ser selecionado
}
