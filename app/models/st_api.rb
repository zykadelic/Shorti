class STAPI
	def self.get_daily(parameters = {}, &block)
		STHTTPSessionManager.instance.GET('daily', parameters:parameters, success:lambda do |task, response|
			block.call response['daily_shortis']
		end, failure:lambda do |task, error|
			puts error.inspect
		end)
	end
end
