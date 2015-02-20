class STHTTPSessionManager < AFHTTPSessionManager
	# make this class a singleton
	def self.setup!
		Dispatch.once { @instance ||= new }
		@instance
	end

	def self.instance
		@instance
	end
	# end make singleton

	def init
		baseUrl = 'http://shorti.org/api/v2/'
		if initWithBaseURL(NSURL.URLWithString(baseUrl));end
		self
	end
end
