require 'rubygems'
require 'appium_lib'
require 'singleton'

require './lib/viewscreens/homescreen.rb'
require './lib/viewscreens/placescreen.rb'
require './lib/viewscreens/createscreen.rb'
require './lib/viewscreens/listscreen.rb'
require './lib/viewscreens/eventslistscreen.rb'
require './lib/viewscreens/eventscreen.rb'
require './lib/viewscreens/changesscreen.rb'
class AppiumInit

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
		Appium.promote_appium_methods ListScreen
		Appium.promote_appium_methods EventsListScreen
		Appium.promote_appium_methods EventScreen
		Appium.promote_appium_methods ChangesScreen
	end

	def initialize
		setup_driver
		promote_methods
		sleep 7
	end
end