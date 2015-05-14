class ChangesScreen

	attr_accessor :title
	attr_accessor :info
	attr_accessor :name_field
	attr_accessor :category_field
	attr_accessor :address_field
	attr_accessor :contact_field
	attr_accessor :map_field
	attr_accessor :comment_field

	def required_fields_exist?
		@title=id('com.atlantbh.navigator.debug:id/edit_name')
		@info=id('com.atlantbh.navigator.debug:id/edit_info')
		@name_field=id('com.atlantbh.navigator.debug:id/cp_name')
		@category_field=id('com.atlantbh.navigator.debug:id/edit_category')
		@address_field=id('com.atlantbh.navigator.debug:id/cp_address')
		@contact_field=id('com.atlantbh.navigator.debug:id/cp_contact_details')
		@map_field=id('com.atlantbh.navigator.debug:id/edit_location')
		@comment_field=id('com.atlantbh.navigator.debug:id/edit_other')
		!(@title.nil? || @info.nil? || @name_field.nil? || @category_field.nil? || @address_field.nil? || @contact_field.nil? || @map_field.nil? || @comment_field.nil?)
	end

	def previous_screen
		back
	end


	def open_name_screen(name=nil)
		@name_field=id('com.atlantbh.navigator.debug:id/cp_name') if @name_field.nil?
		@name_field.click
		name_box=id('com.atlantbh.navigator.debug:id/cp_name_name')
		comment_box=id('com.atlantbh.navigator.debug:id/cp_comment')
		submit_button=id('com.atlantbh.navigator.debug:id/cp_address_savebutton')
		title=id('com.atlantbh.navigator.debug:id/title').text
		if name.nil?
			previous_screen
			if !(name_box.nil? || comment_box.nil? || submit_button.nil?)
				return title
			else
				return nil
			end
		else
			name_box.send_keys(name)
			submit_button.click
			sleep(3)
			Appium::TouchAction.new.swipe(start_x: 0.5, start_y: 0.2, end_x: 0.5, end_y: 0.8, duration: 1000).perform 
			return nil
		end
	end

	def try_name_change(name)
		@name_field=id('com.atlantbh.navigator.debug:id/cp_name') if @name_field.nil?
		@name_field.click
		name_box=id('com.atlantbh.navigator.debug:id/cp_name_name')
		comment_box=id('com.atlantbh.navigator.debug:id/cp_comment')
		submit_button=id('com.atlantbh.navigator.debug:id/cp_address_savebutton')
		title=id('com.atlantbh.navigator.debug:id/title').text
		name_box.send_keys(name)
		submit_button.click
		sleep(3)
		if exists{ id('com.atlantbh.navigator.debug:id/cp_address_savebutton') }
			previous_screen
			return_to_placescreen
			return title
		else
			return nil
		end
	end

	def try_address_change(street,house,city,zip,comment)
		@address_field=id('com.atlantbh.navigator.debug:id/cp_address') if @address_field.nil?
		@address_field.click
		street_box=id('com.atlantbh.navigator.debug:id/cp_address_street_name')
		house_box=id('com.atlantbh.navigator.debug:id/cp_address_house_num')
		city_box=id('com.atlantbh.navigator.debug:id/cp_address_city')
		zip_box=id('com.atlantbh.navigator.debug:id/cp_address_zip')
		comment_box=id('com.atlantbh.navigator.debug:id/cp_comment')
		submit_button=id('com.atlantbh.navigator.debug:id/cp_address_savebutton')

		#street_box.clear
		street_box.send_keys(street)

		#house_box.clear
		house_box.send_keys(house)

		#city_box.clear
		city_box.send_keys(city)

		#zip_box.clear
		zip_box.send_keys(zip)

		#comment_box.clear
		comment_box.send_keys(comment)
		submit_button.click

		if exists{ id('com.atlantbh.navigator.debug:id/cp_address_savebutton') }
			previous_screen
			return_to_placescreen
			return title
		else
			return false
		end
	end

	def open_category_screen
		@category_field=id('com.atlantbh.navigator.debug:id/edit_category') if @category_field.nil?
		@category_field.click
		prim_cat=id('com.atlantbh.navigator.debug:id/cp_cat_prim')
		sec_cat=id('com.atlantbh.navigator.debug:id/cp_cat_sec')
		comment_box=id('com.atlantbh.navigator.debug:id/cp_comment')
		submit_button=id('com.atlantbh.navigator.debug:id/cp_address_savebutton')
		
		prim_cat.click
		sleep(5)
		prim_list=tags('android.widget.TextView').length > 1
		previous_screen

		sec_cat.click
		sleep(5)
		sec_list=tags('android.widget.TextView').length > 1
		previous_screen
		
		title=id('com.atlantbh.navigator.debug:id/title').text
		previous_screen
		if prim_list && sec_list && !(comment_box.nil? || submit_button.nil?)
			return title
		else
			return nil
		end
	end


	def open_address_sceen
		@address_field=id('com.atlantbh.navigator.debug:id/cp_address') if @address_field.nil?
		@address_field.click
		street_box=id('com.atlantbh.navigator.debug:id/cp_address_street_name')
		house_box=id('com.atlantbh.navigator.debug:id/cp_address_house_num')
		city_box=id('com.atlantbh.navigator.debug:id/cp_address_city')
		zip_box=id('com.atlantbh.navigator.debug:id/cp_address_zip')
		comment_box=id('com.atlantbh.navigator.debug:id/cp_comment')
		submit_button=id('com.atlantbh.navigator.debug:id/cp_address_savebutton')
		title=id('com.atlantbh.navigator.debug:id/title').text
		previous_screen
		if !(street_box.nil? || house_box.nil? || city_box.nil? || zip_box.nil? || comment_box.nil? || submit_button.nil?)
			return title
		else
			return nil
		end
	end

	def open_contact_screen
		@contact_field=id('com.atlantbh.navigator.debug:id/cp_contact_details') if @contact_field.nil?
		@contact_field.click
		web_box=id('com.atlantbh.navigator.debug:id/cp_cd_web')
		phone_box=id('com.atlantbh.navigator.debug:id/cp_cd_phone')
		mobile_box=id('com.atlantbh.navigator.debug:id/cp_cd_mobile')
		comment_box=id('com.atlantbh.navigator.debug:id/cp_comment')
		submit_button=id('com.atlantbh.navigator.debug:id/cp_address_savebutton')
		title=id('com.atlantbh.navigator.debug:id/title').text
		previous_screen
		if !(web_box.nil? || phone_box.nil? || mobile_box.nil? || comment_box.nil? || submit_button.nil?)
			return title
		else
			return nil
		end
	end

	def try_contact_change(web,phone,mobile,comment)
		@contact_field=id('com.atlantbh.navigator.debug:id/cp_contact_details') if @contact_field.nil?
		@contact_field.click
		web_box=id('com.atlantbh.navigator.debug:id/cp_cd_web')
		phone_box=id('com.atlantbh.navigator.debug:id/cp_cd_phone')
		mobile_box=id('com.atlantbh.navigator.debug:id/cp_cd_mobile')
		comment_box=id('com.atlantbh.navigator.debug:id/cp_comment')
		submit_button=id('com.atlantbh.navigator.debug:id/cp_address_savebutton')
		title=id('com.atlantbh.navigator.debug:id/title').text

		web_box.clear
		web_box.send_keys(web)

		phone_box.clear
		phone_box.send_keys(phone)

		mobile_box.clear
		mobile_box.send_keys(mobile)

		comment_box.clear
		comment_box.send_keys(comment)

		submit_button.click
		if exists{ id('com.atlantbh.navigator.debug:id/cp_address_savebutton') }
			previous_screen
			return_to_placescreen(1)
			return title
		else
			return false
		end
	end

	def open_map_screen
		@map_field=id('com.atlantbh.navigator.debug:id/edit_location')
		@map_field.click
		map=id('com.atlantbh.navigator.debug:id/mapContainer')
		save=id('com.atlantbh.navigator.debug:id/cp_savebutton')
		title=id('com.atlantbh.navigator.debug:id/title').text
		previous_screen
		if !(map.nil? || save.nil?)
			return title 
		else
			return nil
		end
	end

	def return_to_placescreen(choice)
		previous_screen
		message=id('android:id/message').text
		if !(message.nil?)
			if choice
				id('android:id/button1').click
			else
				id('android:id/button2').click
			end
		end
		return message.nil?
	end

	def open_comment_screen
		@comment_field=id('com.atlantbh.navigator.debug:id/edit_other')
		@comment_field.click
		comment_box=id('com.atlantbh.navigator.debug:id/cp_comment')
		submit_button=id('com.atlantbh.navigator.debug:id/cp_address_savebutton')
		title=id('com.atlantbh.navigator.debug:id/title').text
		previous_screen
		if !(comment_box.nil? || submit_button.nil?)
			title
		else
			return nil
		end
	end
end