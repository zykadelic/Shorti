class STFrontView < UIView
	attr_reader :label

	def initWithFrame(rect)
		if super
			self.backgroundColor = UIColor.whiteColor

			# Create subview which spans the inner bounds of the navigation view
			contentView = UIView.alloc.initWithFrame(App.delegate.navigation_view_rect)

			@label = UILabel.alloc.initWithFrame(CGRectZero)
			@label.text = 'My label'
			@label.textColor = UIColor.grayColor
			@label.sizeToFit

			# Position label on center of screen
			App.delegate.center_view(@label, contentView)

			contentView.addSubview(@label)
			addSubview(contentView)
		end
		self
	end
end
