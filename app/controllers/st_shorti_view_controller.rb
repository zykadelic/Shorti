class STShortiViewController < UIViewController
	def initWithTitleAndShorti(title, shorti: shorti)
		if init
			self.title = title
			puts shorti
		end
		self
	end

	def loadView
		self.view = STShortiView.alloc.initWithFrame(CGRectMake(0, 0, Device.screen.width, Device.screen.height))
	end
end
