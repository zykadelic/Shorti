class STFrontViewController < UIViewController
	def init
		if super;end
		self
	end

	def loadView
		# The rect here must fill the entire screen
		self.view = STFrontView.alloc.initWithFrame(CGRectMake(0, 0, Device.screen.width, Device.screen.height))
	end
end
