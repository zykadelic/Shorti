class STFrontView < UIView
	def initWithFrame(rect)
		if super
			self.backgroundColor = UIColor.whiteColor

			# Create subview which spans the inner bounds of the navigation view
			contentView = UIView.alloc.initWithFrame(App.delegate.navigation_view_rect)

			label = UILabel.alloc.initWithFrame(CGRectZero)
			label.text = 'My label'
			label.textColor = UIColor.grayColor
			label.sizeToFit

			# Position label on center of screen
			label_frame = label.frame
			label_frame.origin = CGPointMake(CGRectGetMidX(contentView.bounds) - label_frame.size.width / 2, CGRectGetMidY(contentView.bounds) - label_frame.size.height / 2)
			label.frame = label_frame

			contentView.addSubview(label)
			addSubview(contentView)
		end
		self
	end
end
