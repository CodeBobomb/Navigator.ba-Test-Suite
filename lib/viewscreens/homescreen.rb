require 'appium_lib'
=begin
 Appium::TouchAction.new.swipe(start_x: 50, start_y: 700, end_x: 50, end_y: 300, duration: 100).perform
=end
	class HomeScreen
		def enter_place(place)
			search_box=id('com.atlantbh.navigator.debug:id/search_input_custom')
			search_box.type(place)
			sleep(2)
			return search_box.text == place
		end

		def search
			venues=find('GLAVNE LOKACIJE') if exists { find('GLAVNE LOKACIJE') }
			loc=venues.location #suggested results is on the same location as "Glavne lokacije" item
			Appium::TouchAction.new.tap(x:loc[:x],y:loc[:y]).perform
		end

		def search_place(place)
			valid=enter_place(place)
			search
			return valid
		end
		def open_main_item(item_name)
			main_item=find(item_name)
			main_item.click
			sleep(2)
		end


		def nav_bar(input)
			button=nil
			if(input=='Preatraga' || input=='Search')
				button=find('Pretraga')
			elsif(input=='Početak' || input=='Home')
				button=find('Home')
			elsif(input=='Postavke' || input=='Settings')
				button=find('Postavke')
			elsif(input=='Kreiraj Objekat' || input=='Create place')
				button=find('Kreiraj Objekat')
			end
			button.click
		end

		def on_screen?
			!(find('Početak').nil? || find('Pretraga').nil? || find('Kreiraj Objekat').nil? || find('Postavke').nil? || id('com.atlantbh.navigator.debug:id/search_input_custom').nil?)
		end
	end


