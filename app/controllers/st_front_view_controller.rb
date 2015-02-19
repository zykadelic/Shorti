class STFrontViewController < UIViewController
	def init
		if super
			self.title = 'ShortiTest'
		end
		self
	end

	def loadView
		# The rect here must fill the entire screen
		self.view = STFrontView.alloc.initWithFrame(CGRectMake(0, 0, Device.screen.width, Device.screen.height))
	end

	def viewDidLoad
		view.label.when_tapped do
			controller = STOptionsViewController.alloc.init
			navigationController.pushViewController(controller, animated:true)
		end
	end
end
