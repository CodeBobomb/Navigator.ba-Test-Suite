class PlaceScreen

	def rate_place(num)
		id('com.atlantbh.navigator.debug:id/profile_rating').click			
		id_string='com.atlantbh.navigator.debug:id/profile_star_'+num.to_s
		rated=id(id_string)
		check_button=id('com.atlantbh.navigator.debug:id/rate_dialog_positive_button')
		star_pressed=rated.click
		if check_button.click && star_pressed
			return num
		else 
			return -1
		end
	end

	def check_map
		exists { id('com.atlantbh.navigator.debug:id/profile_name') } ?  name=id('com.atlantbh.navigator.debug:id/profile_name').text : name=nil 
		exists { id('com.atlantbh.navigator.debug:id/profile_address') } ? address=id('com.atlantbh.navigator.debug:id/profile_address').text : address=nil
		exists { id('com.atlantbh.navigator.debug:id/profile_phone') } ? phone=id('com.atlantbh.navigator.debug:id/profile_phone').text : phone=nil
		text('Mapa').click

		exists { id('com.atlantbh.navigator.debug:id/bubble_title') } ? bubble_title=id('com.atlantbh.navigator.debug:id/bubble_title').text : bubble_title=nil
		exists { id('com.atlantbh.navigator.debug:id/bubble_description') } ? bubble_address=id('com.atlantbh.navigator.debug:id/bubble_description').text : bubble_address=nil
		exists { id('com.atlantbh.navigator.debug:id/bubble_phone') } ? bubble_phone=id('com.atlantbh.navigator.debug:id/bubble_phone').text : bubble_phone=nil
		equals = [ bubble_title.downcase == name.downcase, address.downcase.include?(bubble_address.downcase), bubble_phone == phone]
		previous_screen
		return equals
	end

	def previous_screen
		back
	end

	def browse_gallery
		items=[]
		image=id('com.atlantbh.navigator.debug:id/profile_image')
		image.click

		arrow_right=id('com.atlantbh.navigator.debug:id/arrow_right')
		arrow_right.nil? ? items << false : items << arrow_right.click

		arrow_left=id('com.atlantbh.navigator.debug:id/arrow_left')
		arrow_left.nil? ? items << false : items << arrow_left.click

		previous_screen
		items
	end

	def full_details_exist?
		name=id('com.atlantbh.navigator.debug:id/profile_name').text 
		image=id('com.atlantbh.navigator.debug:id/profile_image').text 
		address=id('com.atlantbh.navigator.debug:id/profile_address').text 
		phone=id('com.atlantbh.navigator.debug:id/profile_phone').text 
		email=id('com.atlantbh.navigator.debug:id/profile_email').text 
		rating=id('com.atlantbh.navigator.debug:id/profile_rating').text 
		ratnum=id('com.atlantbh.navigator.debug:id/profile_ratingnum').text
		worktime=id('com.atlantbh.navigator.debug:id/profile_working_hours').text
		web=id('com.atlantbh.navigator.debug:id/profile_web').text
		Appium::TouchAction.new.swipe(start_x: 100, start_y: 1100, end_x: 100, end_y: 170, duration: 1000).perform 
		desc=id('com.atlantbh.navigator.debug:id/profile_description')
		Appium::TouchAction.new.swipe(start_x: 100, start_y: 200, end_x: 100, end_y: 1100, duration: 1000).perform 
			return !(name.nil? || image.nil? || address.nil? || phone.nil? || email.nil? || rating.nil? || ratnum.nil? || web.nil? || desc.nil?)
	end

	def required_details_exist?
		name=id('com.atlantbh.navigator.debug:id/profile_name').text 
		address=id('com.atlantbh.navigator.debug:id/profile_address').text 
		rating=id('com.atlantbh.navigator.debug:id/profile_rating').text 
		ratnum=id('com.atlantbh.navigator.debug:id/profile_ratingnum').text
		return !(name.nil? || address.nil? || rating.nil? || ratnum.nil?)
	end
end
