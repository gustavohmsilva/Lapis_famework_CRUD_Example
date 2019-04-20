-- Guarda as configurações do site
local config = require('lapis.config')

config(
	'development',
	{	
		postgres = {
			host = '127.0.0.1',
			user = 'meusite',
			password = 'servidor-lua',
			database = 'meusite'	
		},
		session_name = 'meusite',
		secret = 'O Rato Roeu a Roupa do Rei de Roma'
	}
)
