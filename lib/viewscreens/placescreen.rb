require 'appium_lib'

	class PlaceScreen

		def rate_place(num)
			id('com.atlantbh.navigator.debug:id/profile_rating').click			
			id_string='com.atlantbh.navigator.debug:id/profile_star_'+num.to_s
			rated=id(id_string)
			check_button=id('com.atlantbh.navigator.debug:id/rate_dialog_positive_button')
			star_pressed=rated.click
			check_button.click && star_pressed
		end

		def check_map?
			name=id('com.atlantbh.navigator.debug:id/profile_name').text 
			address=id('com.atlantbh.navigator.debug:id/profile_address').text 
			#phone=id('com.atlantbh.navigator.debug:id/profile_phone').text 
			text('Mapa').click

			bubble_title=id('com.atlantbh.navigator.debug:id/bubble_title')
			bubble_address=id('com.atlantbh.navigator.debug:id/bubble_description')
			#bubble_phone=id('com.atlantbh.navigator.debug:id/bubble_phone')
			is_equal = bubble_title.text.downcase == name.downcase && address.downcase.include?(bubble_address.text.downcase) #&& bubble_phone.text == phone
			back
			return is_equal
		end

		def previous_screen
			back
		end

		def browse_gallery
			image=id('com.atlantbh.navigator.debug:id/profile_image')
			image.click

			arrow_right=id('com.atlantbh.navigator.debug:id/arrow_right')
			return false if arrow_right.nil?
			arrow_right.click
			sleep(1)

			arrow_left=id('com.atlantbh.navigator.debug:id/arrow_left')
			return false if arrow_left.nil?
			arrow_left.click
			sleep(1)

			back
			true
		end

		def full_details_exist?
			name=id('com.atlantbh.navigator.debug:id/profile_name').text 
			image=id('com.atlantbh.navigator.debug:id/profile_image').text 
			address=id('com.atlantbh.navigator.debug:id/profile_address').text 
			phone=id('com.atlantbh.navigator.debug:id/profile_phone').text 
			email=id('com.atlantbh.navigator.debug:id/profile_email').text 
			rating=id('com.atlantbh.navigator.debug:id/profile_rating').text 
			ratnum=id('com.atlantbh.navigator.debug:id/profile_ratingnum').text
			#worktime=id('com.atlantbh.navigator.debug:id/profile_working_hours').text
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
