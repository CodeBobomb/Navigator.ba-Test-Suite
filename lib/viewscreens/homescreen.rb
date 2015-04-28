require 'appium_lib'
=begin
 Appium::TouchAction.new.swipe(start_x: 50, start_y: 700, end_x: 50, end_y: 300, duration: 100).perform
=end
module ViewScreen
	module HomeScreen
		class << self 

			def enter_place(place)
				@search_box=id('com.atlantbh.navigator.debug:id/search_input_custom')
				@search_box.send_keys(place)
				sleep(2)
				return @search_box.text == place
			end

			def search
				@venues=find('GLAVNE LOKACIJE') if exists { find('GLAVNE LOKACIJE') }
				loc=@venues.location #suggested results is on the same location as "Glavne lokacije" item
				Appium::TouchAction.new.tap(x:loc[:x],y:loc[:y]).perform
			end

			def search_place(place)
				valid=enter_place(place)
				search
				return valid
			end

			def on_screen?
				!(text_exact('Početak').nil? || text_exact('Pretraga').nil? || text_exact('Kreiraj objekat').nil? || text_exact('Postavke') || id('com.atlantbh.navigator.debug:id/search_input_custom').nil?)
			end
		end
	end
end


