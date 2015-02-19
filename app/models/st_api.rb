class STAPI
	# TODO Refactor response to separate response class
	def self.get_current_channel(block)
		default = 'dGtvt0Y' # FIXME Add this to some sort of configatron
		channel = NSUserDefaults.standardUserDefaults['channel'] || default

		STHTTPSessionManager.instance.GET("channels/#{channel}", parameters:nil, success:lambda do |task, response|
			block.call({ error: false, data: response['channel'] })
		end, failure:lambda do |task, error|
			block.call({ error: true, error_message: error })
		end)
	end
end
