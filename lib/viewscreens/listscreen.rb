class ListScreen
	
	def get_item(name)
		ids('com.atlantbh.navigator.debug:id/place_title').select { |item| item.text == name }[0]
	end


	def open_item(name)
		wait { get_item(name).click }
	end
	
	def previous_screen
		back
	end

	def swipe_up
		Appium::TouchAction.new.swipe(start_x: 0.5, start_y: 0.65, end_x: 0.5, end_y: 0.35, duration: 1000).perform
	end

	def swipe_down
		Appium::TouchAction.new.swipe(start_x: 0.5, start_y: 0.35, end_x: 0.5, end_y: 0.65, duration: 1000).perform
	end

end