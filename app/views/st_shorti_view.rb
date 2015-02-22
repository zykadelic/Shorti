class STShortiView < UIView
	def initWithShorti(shorti)
		if initWithFrame(CGRectMake(0, 0, Device.screen.width, Device.screen.height))
			self.backgroundColor = UIColor.whiteColor

			contentView = UIView.alloc.initWithFrame(App.delegate.navigationViewRect)

			title		= titleLabel(shorti['title'])
			titleFrame	= title.frame
			contentView.addSubview(title)

			contentView.addSubview(title)
			addSubview(contentView)

			body				= bodyLabel(shorti['body'])
			bodyFrame			= body.frame
			bodyFrame.origin	= CGPointMake(bodyFrame.origin.x, bodyFrame.origin.y + titleFrame.size.height + 10)
			body.frame			= bodyFrame
			contentView.addSubview(body)
		end
		self
	end

	def titleLabel(title)
		label			= UILabel.alloc.initWithFrame(CGRectZero)
		label.text		= title
		label.textColor	= UIColor.blackColor
		label.sizeToFit
		label
	end

	def bodyLabel(body)
		label				= UILabel.alloc.initWithFrame(CGRectZero)
		label.text			= body
		label.textColor		= UIColor.blueColor
		label.numberOfLines	= 0

		label.sizeToFit
		# Given maximum allowable size, how big do you need to be to fit?
		size = label.sizeThatFits(CGSizeMake(bounds.size.width, Float::MAX))
		# Set the entire frame with a position & a size
		label.frame = CGRectMake(0, 0, size.width, size.height)
		label
	end
end
