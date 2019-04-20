local md5 = require 'md5'
local Usuarios = require('models.users')

return function(self)
        local username = md5.sumhexa(self.params.username)
        local password = md5.sumhexa(self.params.password)
        local login = Usuarios:buscar(username:upper(), password:upper())
        if not login then
                return { redirect_to = '/'}
        else
                self.session.user = {
                        username = self.params.username,
                        login_date = os.date('%d/%m/%Y, %H:%M:%S')
                }
                return { redirect_to = 'search'}
        end
end