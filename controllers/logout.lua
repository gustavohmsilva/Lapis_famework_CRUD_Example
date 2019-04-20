return function(self)
        self.session.user = nil
        return { redirect_to = '/'}
end