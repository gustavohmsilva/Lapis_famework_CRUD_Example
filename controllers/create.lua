local Produtos = require('models.products')
local check = require('valua')

local check_id = check:new().number().integer()

return function(self)
	if not self.session.user then
		return { redirect_to = '/'}
	else
		if self.params.id_to_edit ~= nil then
			self.continue, self.err = check_id(tonumber(self.params.id_to_edit))
		else
			self.continue = true
		end
		if self.continue then
			if self.params.id_to_edit then
				self.modo_edicao = true
				self.texto_modo_edicao = 'Este formulário está em modo de edição, isto signigica \
					que você está alterando um registro existente. Nenhum novo registro será \
					criado! Caso você esteja aqui por engano, clique no botão "Criar", na \
					barra de menu superior.'
				self.texto_botao = 'Editar'
				self.dados = Produtos:buscar(self.params.id_to_edit, 'id')
				if #self.dados == 0 then
					self.error = true
					self.error_msg = 'Registro inexistente, impossível editar!'
					return {render = 'search'}
				else
					self.produto = self.dados[1].produto
					self.quantidade = self.dados[1].quantidade
					self.preco = self.dados[1].preco
					self.localizacao = self.dados[1].localizacao
				end
			else
				self.modo_edicao = false
				self.texto_botao = 'Criar'
				self.produto = 'Digite o nome do produto...'
				self.quantidade = 'Digite a quantidade disponível no estoque...'
				self.preco = 'Digite o preço...'
				self.localizacao = 'Local no estoque...'
			end
			
			return {render = "create"}
		end
			self.error = not self.continue
			self.error_msg = self.err
			return {render = 'search'}
	end
end
