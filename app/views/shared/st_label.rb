class STLabel < UILabel
	def text=(text)
		super
		self.sizeToFit
		# Position label on center of screen
		App.delegate.centerView(self, superview)
	end
end
