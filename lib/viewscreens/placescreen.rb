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
		exists { id('com.atlantbh.navigator.debug:id/profile_name') } ? name=id('com.atlantbh.navigator.debug:id/profile_name').text : name=nil 
		exists { id('com.atlantbh.navigator.debug:id/profile_image') } ? image=id('com.atlantbh.navigator.debug:id/profile_image') : image=nil
		exists { id('com.atlantbh.navigator.debug:id/profile_address') } ? address=id('com.atlantbh.navigator.debug:id/profile_address') : address=nil
		exists { id('com.atlantbh.navigator.debug:id/profile_phone') }  ? phone=id('com.atlantbh.navigator.debug:id/profile_phone') : phone=nil
		exists { id('com.atlantbh.navigator.debug:id/profile_email') } ? email=id('com.atlantbh.navigator.debug:id/profile_email') : email=nil
		exists { id('com.atlantbh.navigator.debug:id/profile_rating') } ? rating=id('com.atlantbh.navigator.debug:id/profile_rating') : rating=nil
		exists { id('com.atlantbh.navigator.debug:id/profile_ratingnum') } ? ratnum=id('com.atlantbh.navigator.debug:id/profile_ratingnum') : ratnum=nil
		exists { id('com.atlantbh.navigator.debug:id/profile_working_hours') } ? worktime=id('com.atlantbh.navigator.debug:id/profile_working_hours') : worktime=nil 
		exists { id('com.atlantbh.navigator.debug:id/profile_web') } ? web=id('com.atlantbh.navigator.debug:id/profile_web') : web=nil
		Appium::TouchAction.new.swipe(start_x: 100, start_y: 1100, end_x: 100, end_y: 170, duration: 1000).perform 
		exists { id('com.atlantbh.navigator.debug:id/profile_description') } ? desc=id('com.atlantbh.navigator.debug:id/profile_description') : desc=nil
		Appium::TouchAction.new.swipe(start_x: 100, start_y: 200, end_x: 100, end_y: 1100, duration: 1000).perform 
		return !(name.nil? || image.nil? || address.nil? || phone.nil? || email.nil? || rating.nil? || ratnum.nil? || web.nil? || desc.nil?)
	end

	def required_details_exist?
		exists { id('com.atlantbh.navigator.debug:id/profile_name') } ? name=id('com.atlantbh.navigator.debug:id/profile_name').text : name=nil 
		exists { id('com.atlantbh.navigator.debug:id/profile_address') } ? address=id('com.atlantbh.navigator.debug:id/profile_address') : address=nil
		exists { id('com.atlantbh.navigator.debug:id/profile_rating') } ? rating=id('com.atlantbh.navigator.debug:id/profile_rating') : rating=nil
		exists { id('com.atlantbh.navigator.debug:id/profile_ratingnum') } ? ratnum=id('com.atlantbh.navigator.debug:id/profile_ratingnum') : ratnum=nil
		return !(name.nil? || address.nil? || rating.nil? || ratnum.nil?)
	end

	def open_changes_screen 
		while !(exists { id('com.atlantbh.navigator.debug:id/profile_button_edit') })
			Appium::TouchAction.new.swipe(start_x: 0.5, start_y: 0.8, end_x: 0.5, end_y: 0.25, duration: 1000).perform
		end
		changes_button=id('com.atlantbh.navigator.debug:id/profile_button_edit')
		changes_button.click
		id('com.atlantbh.navigator.debug:id/title').text
	end
end
