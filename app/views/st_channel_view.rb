class STChannelView < UITableView
	def initWithFrame(rect)
		if super
			self.backgroundColor	= UIColor.colorWithWhite(0.96, alpha: 1)
			self.separatorColor		= UIColor.colorWithHue(0.5416666666666666, saturation: 0.03, brightness: 0.86, alpha: 1)
		end
		self
	end
end
