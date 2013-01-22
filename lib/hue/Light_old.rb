require_relative 'Hue'
require 'json'
require 'net/http'

class Light
	attr_accessor :id, :name, :hue, :on

	def initialize(hue, id, name)
		@hue = hue
		@id = id
		@name = name
		@on = false

		update
	end
	def turnOn
		#/api/username/lights/number/state
		# HTTP PUT
		url = "#{hue.ip}/api/#{hue.username}/lights/#{id}/state"
		uri = URI.parse(url)
		data = { "on" => true }.to_json

		http = Net::HTTP.new(uri.host, uri.port)

		request = Net::HTTP::Put.new(uri.request_uri)
		request.body = data

		response = http.request(request)

		puts response.body

	end

	def turnOff
		#/api/username/lights/number/state
		# HTTP PUT
		url = "#{hue.ip}/api/#{hue.username}/lights/#{id}/state"
		uri = URI.parse(url)
		data = { "on" => false }.to_json

		http = Net::HTTP.new(uri.host, uri.port)

		request = Net::HTTP::Put.new(uri.request_uri)
		request.body = data

		response = http.request(request)

		puts response.body
	end

	def update
		url = "#{hue.ip}/api/#{hue.username}/lights/#{id}"
		uri = URI.parse(url)

		http = Net::HTTP.new(uri.host, uri.port)

		response = http.request(Net::HTTP::Get.new(uri.request_uri))

		info = JSON.parse(response.body)
		info = info["state"]

		puts info
		@on = info["on"]
	end

	def alert
		# hsl(280, 93%, 53%)
		url = "#{hue.ip}/api/#{hue.username}/lights/#{id}/state"
		uri = URI.parse(url)

		colour = (65535 * (280.0/360.0)).to_i
		tt = (2 * 10)
		data = { "hue" => colour, "sat" => 200, "bri" => 200, "transitiontime" => tt}.to_json

		http = Net::HTTP.new(uri.host, uri.port)

		request = Net::HTTP::Put.new(uri.request_uri)
		request.body = data

		response = http.request(request)

		colour = 0
		sat = (254 * 0.88).to_i
		bri = (254 * 1.0).to_i
		tt = (3 * 10)
		data = { "hue" => colour, "sat" => sat, "bri" => bri, "transitiontime" => tt }.to_json

		request.body = data

		sleep 2.0
		http.request(request)

		puts response.body
	end



	def isOn
		return @on
	end
end