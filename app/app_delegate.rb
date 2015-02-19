class AppDelegate
  def application(application, didFinishLaunchingWithOptions:launchOptions)
    @window = UIWindow.alloc.initWithFrame(UIScreen.mainScreen.bounds)

    rootViewController = STFrontViewController.alloc.init
    rootViewController.title = 'ShortiTest'

    navigationController = STNavigationController.alloc.initWithRootViewController(rootViewController)
    @window.rootViewController = navigationController
    @window.makeKeyAndVisible

    true
  end

  # Inner bounds of a navigation subview
  def navigation_view_rect
    navbar_height = @window.rootViewController.navigationBar.frame.size.height + 20
    return CGRectMake(0, navbar_height, Device.screen.width, Device.screen.height - navbar_height)
  end
end
