require 'rubygems'
require 'appium_lib'
require 'singleton'

require_relative './viewscreens/homescreen.rb'
require_relative './viewscreens/placescreen.rb'
require_relative './viewscreens/createscreen.rb'

class AppiumInit
	include Singleton

	def setup_driver
		appium_text = File.join(Dir.pwd,'/config/appium.txt')
		@caps = Appium.load_appium_txt file: appium_text
		Appium::Driver.new(@caps).start_driver
	end

	def promote_methods
		Appium.promote_appium_methods RSpec::Core::ExampleGroup
		Appium.promote_appium_methods HomeScreen
		Appium.promote_appium_methods PlaceScreen
		Appium.promote_appium_methods CreateScreen
	end

	def initialize
		setup_driver
		promote_methods
	end
end