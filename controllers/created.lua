local Produtos = require('models.products')
local check = require('valua')

local check_id = check:new().not_empty()

return function(self)
	self.continue, self.err = check_id(tonumber(self.params.id_to_edit))
	if self.continue then
		if self.params.id_to_edit then
			Produtos:editar(
				self.params.id_to_edit,
				self.params.produto,
				self.params.quantidade,
				self.params.preco,
				self.params.localizacao
			)
			self.error = false
			return {render = 'search'}
		end
		self.resultado_busca = Produtos:inserir(
			self.params.produto,
			self.params.quantidade,
			self.params.preco,
			self.params.localizacao
		)
		return {render = "created"}
	else
		self.error_code = '422'
		self.error_description = 'Requisição não pode ser processada...'
		return {render = 'error_page'}
	end
end
