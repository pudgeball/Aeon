require_relative 'Hue'
require_relative 'Light'

#puts Digest::SHA1.hexdigest 'aeon'

#puts "Hello"

hue = Hue.new('aeon', '10.0.0.236')

light = Light.new(hue, 1, "Nick's Room Overhead light 1")

light.alert

#hue.getLights