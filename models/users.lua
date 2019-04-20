local Model = require('lapis.db.model').Model
local usuarios = Model:extend('usuarios')

function usuarios:buscar(user, pass)
        local query = 'WHERE username = ? AND password = ? LIMIT 1'
        local p = self:select(query, user, pass)
        if #p == 1 then
                return true
        end
        return false
end

return usuarios