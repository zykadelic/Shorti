class STAPI
	# TODO Refactor response to separate response class
	def self.get_daily(parameters = {}, &block)
		STHTTPSessionManager.instance.GET('daily', parameters:parameters, success:lambda do |task, response|
			block.call({ error: false, data: response['daily_shortis'] })
		end, failure:lambda do |task, error|
			block.call({ error: true, error_message: error })
		end)
	end
end
