require 'hue/base_station'

module Hue::Endpoint::Control
	def on?
		response = send_message()
	end

	private
		def base_station
			@base_station ||= BaseStation.new 
		end

		def send_message(data)

		end
end