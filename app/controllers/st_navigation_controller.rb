class STNavigationController < UINavigationController
	# def initOverride
	# 	if super
	# 		# override
	# 	end
	# 	self
	# end

	# def regularMethodOverride
	#	super
	#	# override
	# end

	def initWithRootViewController(viewController)
		if super
			navigationBar.barTintColor = UIColor.colorWithHue(0.5833333333333334, saturation: 1, brightness: 0.8, alpha: 1)
			navigationBar.tintColor = UIColor.whiteColor
			navigationBar.setTitleTextAttributes({ NSForegroundColorAttributeName => UIColor.whiteColor })
		end
		self
	end
end
