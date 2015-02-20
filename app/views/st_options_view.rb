class STOptionsView < UIView
	def initWithFrame(rect)
		if super
			self.backgroundColor = UIColor.whiteColor

			contentView = UIView.alloc.initWithFrame(App.delegate.navigationViewRect)

			label = UILabel.alloc.initWithFrame(CGRectZero)
			label.text = 'My second label'
			label.textColor = UIColor.blackColor
			label.sizeToFit
			App.delegate.centerView(label, contentView)

			contentView.addSubview(label)
			addSubview(contentView)
		end
		self
	end
end
