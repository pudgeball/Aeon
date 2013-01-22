lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'hue/version'

Gem::Specification.new do |gem|
	gem.name = 'hue'
	gem.version = Hue::VERSION
	gem.authors = ['Nick McGuire']
	gem.email = ['nick@nickmcguire.com']
	gem.description = 'Control Philips Hue lights with Ruby'
	gem.summary = gem.description
	gem.homepage = 'https://github.com/pudgeball/Aeon'

	gem.files = `git ls-files`.split($/)
	#gem.executables = gem.files.grep(%r{^bin/}).map { |f| File.basename(f) }
	#gem.test_files = gem.files.grep(%r{^(test|spec|features)/})

end