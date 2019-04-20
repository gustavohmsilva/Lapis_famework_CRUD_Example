local Produtos = require("models.products")

return function(self)
	if self.params.id_to_delete then
		local success = Produtos:deletar(self.params.id_to_delete)
		self.error = true
		self.error_msg = "Registro não encontrado!"
		if success then
			self.error_msg = "PRODUTO DELETADO DA BASE DE DADOS!"
		end
	end
	return {render = "delete"}
end
