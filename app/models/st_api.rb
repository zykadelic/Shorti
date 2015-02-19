class STAPI
	# TODO Refactor response to separate response class
	def self.get_daily_channel(parameters = {}, block)
		STHTTPSessionManager.instance.GET('channels/dGtvt0Y', parameters:parameters, success:lambda do |task, response|
			block.call({ error: false, data: response['channel'] })
		end, failure:lambda do |task, error|
			block.call({ error: true, error_message: error })
		end)
	end
end
