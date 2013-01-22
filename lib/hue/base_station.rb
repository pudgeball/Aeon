require 'digest/sha1'
require 'net/http'

module Hue
	class BaseStation
		attr_reader :ip, :url, :username, :devicetype, :client

		def initialize ()
			@username = Digest::SHA1.hexdigest Hue::NAME
			@devicetype = Hue::NAME

			@ip = Hue::IP

			@url = "http://#{ip}/api/#{username}"

			uri = URI
		end

		def call
		end
	end
end