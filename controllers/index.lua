return function(self)
	if not self.session.user then
		return {render = "index"}
	else
		return {redirect_to = 'search'}
	end
end
