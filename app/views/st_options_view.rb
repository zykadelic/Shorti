class STOptionsView < UIView
	def initWithFrame(rect)
		if super
			self.backgroundColor = UIColor.whiteColor

			contentView = UIView.alloc.initWithFrame(App.delegate.navigation_view_rect)

			label = UILabel.alloc.initWithFrame(CGRectZero)
			label.text = 'My second label'
			label.textColor = UIColor.blackColor
			label.sizeToFit
			App.delegate.center_view(label, contentView)

			contentView.addSubview(label)
			addSubview(contentView)
		end
		self
	end
end
