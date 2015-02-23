class STAPI
	# TODO Refactor response to separate response class
	def self.getCurrentChannel(block)
		STHTTPSessionManager.instance.GET("channels/#{currentChannel}", parameters: nil, success: lambda do |task, data|
			block.call({ error: false, data: data })
		end, failure: lambda do |task, error|
			block.call({ error: true, error_message: error })
		end)
	end

	def self.updateCurrentChannel!
		if currentChannel.eql? currentChannelFromSettings
			false
		else
			self.currentChannel = currentChannelFromSettings
			true
		end
	end

	def self.currentChannel
		@currentChannel ||= currentChannelFromSettings
	end

	def self.currentChannel=(channel)
		@currentChannel = channel
	end

	def self.currentChannelFromSettings
		default = 'dGtvt0Y' # FIXME Add this to some sort of configatron
		return NSUserDefaults.standardUserDefaults['channel'] || default
	end
end
