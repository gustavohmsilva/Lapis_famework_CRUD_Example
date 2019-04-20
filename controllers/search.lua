return function(self)
	if not self.session.user then
		return { redirect_to = '/'}
	else
		if not self.error then self.error = false end
		return {render = 'search'}
	end
end
