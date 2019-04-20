local Produtos = require('models.products')

return function(self)
	local search_type = self.params.type
	local value = self.params.value
	value = value:gsub("R%$", "")
	value = value:gsub(",", ".")
	if search_type == 'id' or
	search_type == 'quantidade' or
	search_type == 'preco' then
		if type(tonumber(value)) ~= 'number' then
			self.error = true
			self.error_msg = 'Valor deve ser um número válido!'
			return {render = 'search'}
		end
	end

	self.resultado_busca = Produtos:buscar(value, search_type)
	if #self.resultado_busca == 0 then
		self.error = true
		self.error_msg = "Nenhum resultado encontrado!"
		return {render = 'search'}
	else
		return {render = 'search_result'}
	end
end
