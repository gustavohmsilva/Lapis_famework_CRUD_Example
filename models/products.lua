local Model = require('lapis.db.model').Model
local Produtos = Model:extend('produtos')

function Produtos:inserir(prdt, qtd, prc, lct)
	local p = self:create({
		produto = prdt,
		quantidade = qtd,
		preco = prc,
		localizacao = lct
	})
	return p
end

function Produtos:buscar(value, field)
	local query = 'WHERE %s = ?'
	if field == 'produto' or field == 'localizacao' then
		query = 'WHERE %s LIKE ?'
		value = '%'..value..'%'
	end
	local query = string.format(query, field)
	local p = self:select(query, value)
	return p
end

function Produtos:deletar(id)
	local record = self:find(id)
	if record then record:delete() else return false end
	return true
end

function Produtos:editar(id, prdt, qtd, prc, lct)
	local record = self:find(id)
	r = record:update(
		{
			produto = prdt,
			quantidade = qtd,
			preco = prc,
			localizacao = lct
		}
	)
	return r
end

return Produtos
