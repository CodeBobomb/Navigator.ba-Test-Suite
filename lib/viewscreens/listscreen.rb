require 'appium_lib'


class ListScreen
	
	def get_item(name)
		ids('com.atlantbh.navigator.debug:id/place_title').select { |item| item.text == name }[0]
	end


	def open_item(name)
		get_item(name).click
	end
	
	def previous_screen
		back
	end
end