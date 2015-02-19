class STFrontViewController < UIViewController
	def init
		if super
			self.title = 'Shorti Channel'
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

		MBProgressHUD.showHUDAddedTo(view, animated:true)

		# .weak! in the end of the lambda says that self (the controller) will be a weak reference,
		# in other words dont reference count it, making sure we dont leak memory in a reference loop
		# Needs to be lambda, not block, because of a RubyMotion bug; .weak! cant be called on blocks
		STAPI.get_current_channel(lambda do |response|
			if response[:error]
				@alert = UIAlertView.alloc.initWithTitle('Could not load channel' , message:'Try choosing a different channel from the settings.', delegate:nil, cancelButtonTitle:nil, otherButtonTitles:nil)
				@alert.show
			else
				shorti = response[:data]['shortis'].first['shorti']
				view.label.text = shorti['title']
			end

			MBProgressHUD.hideHUDForView(view, animated:true)
		end.weak!)
	end
end
