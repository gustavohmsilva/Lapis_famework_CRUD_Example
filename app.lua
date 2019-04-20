-- Requer biblioteca Lapis
local lapis = require('lapis')

-- Inicia uma variável chamada app que contém uma aplicação Lapis
local app = lapis.Application()

-- Carregamento da máquina de templates etlua
app:enable('etlua')
app.layout = require 'views.layout'

-- Controladores --
local index = require 'controllers.index'
local search = require 'controllers.search'
local create = require 'controllers.create'
local created = require 'controllers.created'
local search_result = require 'controllers.search_result'
local delete = require 'controllers.delete'
local login = require 'controllers.login'
local logout = require 'controllers.logout'

-- Controladores de erro --
local error_page = require 'controllers.error_page'

-- Roteador de links --
app:match('/', index)
app:match('/search', search)
app:match('/create', create)
app:match('/edit/:id_to_edit', create)
app:match('/created', created)
app:match('/created/:id_to_edit', created)
app:match('/search_result', search_result)
app:match('/delete', search)
app:match('/delete/:id_to_delete', delete)
app:match('/login', login)
app:match('/logout', logout)

-- Tratamento de erros de página --
app.handle_404 = error_page

return app
