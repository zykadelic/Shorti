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
		base_url = 'http://shorti.org/api/v2/'
		if initWithBaseURL(NSURL.URLWithString(base_url));end
		self
	end
end
