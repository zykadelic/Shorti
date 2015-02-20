class AppDelegate
	def application(application, didFinishLaunchingWithOptions: launchOptions)
		@window						= UIWindow.alloc.initWithFrame(UIScreen.mainScreen.bounds)
		navigationController		= STNavigationController.alloc.initWithRootViewController(STChannelViewController.alloc.init)
		@window.rootViewController	= navigationController
		@window.makeKeyAndVisible

		STHTTPSessionManager.setup! # setup singleton class

		true
	end

	# Inner bounds of a navigation subview
	def navigationViewRect
		statusbarHeight	= 20
		navbarHeight	= @window.rootViewController.navigationBar.frame.size.height + statusbarHeight

		return CGRectMake(0, navbarHeight, Device.screen.width, Device.screen.height - navbarHeight)
	end

	def centerView(child, parent)
		frame	= child.frame
		x		= CGRectGetMidX(parent.bounds) - frame.size.width / 2
		y		= CGRectGetMidY(parent.bounds) - frame.size.height / 2

		frame.origin	= CGPointMake(x, y)
		child.frame		= frame
	end
end
