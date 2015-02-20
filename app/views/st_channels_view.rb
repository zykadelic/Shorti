class STChannelView < UIView
	attr_reader :label

	def initWithFrame(rect)
		if super
			self.backgroundColor = UIColor.whiteColor

			# Create subview which spans the inner bounds of the navigation view
			contentView = UIView.alloc.initWithFrame(App.delegate.navigation_view_rect)

			@label = STLabel.alloc.initWithFrame(CGRectZero)
			@label.textColor = UIColor.grayColor

			contentView.addSubview(@label)
			addSubview(contentView)
		end
		self
	end
end
