require 'digest/sha1'
require 'net/http'

require_relative 'Light'

class Hue
	attr_accessor :name, :username, :ip
	def initialize(name, ip)
		@name = name
		#Take the name and create a hash
		@username = Digest::SHA1.hexdigest @name
		@ip = "http://#{ip}"

		puts @name
		puts @username
		puts @ip
	end

	def getLights
		#Get all lights and return an array of them
		# /api/username/lights
		url = "#{ip}/api/#{username}/lights"

		uri = URI.parse(url)

		http = Net::HTTP.new(uri.host, uri.port)

		response = http.request(Net::HTTP::Get.new(uri.request_uri))

		puts url

		lights = JSON.parse(response.body)

		puts lights

		lights.each_pair do |num, info|
			puts num
			puts info
			puts "---"
		end
	end
end