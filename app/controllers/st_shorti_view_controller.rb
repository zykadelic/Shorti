class STShortiViewController < UIViewController
	def initWithTitleAndShorti(title, shorti: shorti)
		if init
			self.title = title
			@shorti = shorti
		end
		self
	end

	def loadView
		self.view = STShortiView.alloc.initWithShorti(@shorti)
	end
end
