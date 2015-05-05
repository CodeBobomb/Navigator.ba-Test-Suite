require 'appium_lib'

class CreateScreen
	
	def add_name(name)
		textbox=id('com.atlantbh.navigator.debug:id/cp_name')
		textbox.type(name)
		textbox.text == name
	end

	def address_screen
		address=id('com.atlantbh.navigator.debug:id/cp_address')
		address.click
	end

	def set_address(street_value, number_value, city_value, zip_value)
		street=id('com.atlantbh.navigator.debug:id/cp_address_street_name')
		street.type(street_value)

		number=id('com.atlantbh.navigator.debug:id/cp_address_house_num')
		number.type(number_value)

		city=id('com.atlantbh.navigator.debug:id/cp_address_city')
		city.type(city_value)

		zip=id('com.atlantbh.navigator.debug:id/cp_address_zip')
		zip.type(zip_value)

		button=id('com.atlantbh.navigator.debug:id/cp_address_savebutton')

		if street.text==street_value && number.text==number_value && city.text==city_value && zip.text==zip_value
			return button.click 
		else
			return false
		end
	end

	def select_primary_category(category,subcategory="")
		category_list=tags('android.widget.TextView')
		primary_category=category_list.select{ |cat| cat.text==category }[0]
		primary_category.click
		sleep(2)
		subcategory_list=tags('android.widget.TextView')
		if subcategory!=""
			subcategory=subcategory_list.select { |cat| cat.text==subcategory}[0]
		else
			subcategory=subcategory_list.select { |cat| cat.text==category}[0]
		end
		subcategory.click
	end

	def category_screen
		category=id('com.atlantbh.navigator.debug:id/cp_cat_prim')
		result=category.click
		sleep(5)
		result
	end

	def add_comment(comm)
		sleep(1)
		comment=id('com.atlantbh.navigator.debug:id/cp_comment')
		comment.type(comm)
		comment.text == comm
	end

	def map_screen
		map=id('com.atlantbh.navigator.debug:id/mapContainer')
		map.click
	end	

	def drag_pin
		sleep(1)
		Appium::TouchAction.new.swipe(start_x: 0.5, start_y: 0.5, end_x: 0.5, end_y: 0.3, duration: 1000).perform
		id('com.atlantbh.navigator.debug:id/cp_savebutton').click
		Appium::TouchAction.new.swipe(start_x: 0.5, start_y: 0.5, end_x: 0.5, end_y: 0.3, duration: 1000).perform
	end

	def save_button 
		id('com.atlantbh.navigator.debug:id/create_place_button').click
		sleep(3)
	end

	def previous_screen
		back
	end
end