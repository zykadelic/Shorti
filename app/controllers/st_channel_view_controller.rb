class STChannelViewController < UIViewController
	def init
		if super
			self.title	= 'Shorti Channel'
			@shortis	= []
		end
		self
	end

	def loadView
		# The rect here must fill the entire screen
		self.view = STChannelView.alloc.initWithFrame(CGRectMake(0, 0, Device.screen.width, Device.screen.height))
	end

	def viewDidLoad
		view.dataSource	= self
		view.delegate	= self

		MBProgressHUD.showHUDAddedTo(view, animated: true)

		# .weak! in the end of the lambda says that self (the controller) will be a weak reference,
		# in other words dont reference count it, making sure we dont leak memory in a reference loop
		# Needs to be lambda, not block, because of a RubyMotion bug; .weak! cant be called on blocks
		STAPI.getCurrentChannel(lambda do |response|
			if response[:error]
				@alert = UIAlertView.alloc.initWithTitle('Could not load channel' , message: 'Try choosing a different channel from the settings.', delegate: nil, cancelButtonTitle: nil, otherButtonTitles: nil)
				@alert.show
			else
				channel		= response[:data]['channel']
				self.title	= channel['title']
				@shortis	= channel['shortis'].map { |info| info['shorti'] }
				view.reloadData
			end

			MBProgressHUD.hideHUDForView(view, animated: true)
		end.weak!)
	end

	def tableView(view, numberOfRowsInSection: section)
		@shortis.count
	end

	def tableView(view, cellForRowAtIndexPath: indexPath)
		@reuseIdentifier ||= 'STChannelCell'
		cell	= view.dequeueReusableCellWithIdentifier(@reuseIdentifier) || UITableViewCell.alloc.initWithStyle(UITableViewCellStyleDefault, reuseIdentifier: @reuseIdentifier)
		shorti	= @shortis[indexPath.row]

		cell.textLabel.text			= shorti['title']
		# FIXME The position of the image is buggy; jumps slightly to the left on click
		cell.imageView.contentMode	= UIViewContentModeScaleAspectFit
		cell.imageView.image		= UIImage.imageNamed('Shorti-thumbnail-placeholder.png')
		cell.imageView.imageURL		= NSURL.URLWithString(shorti['thumbnail'])
		cell
	end

	def tableView(view, didSelectRowAtIndexPath: indexPath)
		view.deselectRowAtIndexPath(indexPath, animated: true)
		controller = STOptionsViewController.alloc.init
		navigationController.pushViewController(controller, animated: true)
	end
end
