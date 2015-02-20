class STShortiViewController < UIViewController
	def init
		if super
			self.title = 'My label'
		end
		self
	end

	def loadView
		self.view = STShortiView.alloc.initWithFrame(CGRectMake(0, 0, Device.screen.width, Device.screen.height))
	end
end
