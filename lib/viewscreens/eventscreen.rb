require 'appium_lib'

class EventScreen

	# Bakir: Use attr_accessor as you modify these values also
	attr_reader :time
	attr_reader :day
	attr_reader :month
	attr_reader :name
	attr_reader :theater
	attr_reader :genre
	attr_reader :price

	# BAKIR: You can remove empty constructor
	def initialize
		#event details attributes

	end

	def required_fields_exist?
		@name=id('com.atlantbh.navigator.debug:id/event_name')
		@day=id('com.atlantbh.navigator.debug:id/event_date')
		@month=id('com.atlantbh.navigator.debug:id/event_month')
		@time=id('com.atlantbh.navigator.debug:id/event_time')
		@theater=id('com.atlantbh.navigator.debug:id/event_place_name')
		@genre=id('com.atlantbh.navigator.debug:id/event_type')
		@price=id('com.atlantbh.navigator.debug:id/event_price')
		@book_button=id('com.atlantbh.navigator.debug:id/reserve_ticket_button')
		share_button=id('com.atlantbh.navigator.debug:id/event_button_share')
		when_value=id('com.atlantbh.navigator.debug:id/when')
		@where=id('com.atlantbh.navigator.debug:id/where')
		desc=id('com.atlantbh.navigator.debug:id/event_description')

		# BAKIR: This means if all of these values are nil than return true? Should it be: if all values are not nil, then return false?
		@name.nil? && @day.nil? && @month.nil? && @time.nil? && @theater.nil? && @genre.nil? && @price.nil? && @book_button.nil? && share_button.nil? && when_value.nil? && @where.nil? && desc.nil?
	end

	def open_event_place
		@where.click
	end

	def open_booking_menu
		@book_button.click
		@first_name=id('com.atlantbh.navigator.debug:id/reservation_name')
		@last_name=id('com.atlantbh.navigator.debug:id/reservation_surname')
		@email=id('com.atlantbh.navigator.debug:id/reservation_email')
		@phone=id('com.atlantbh.navigator.debug:id/reservation_phone')
		@notes=id('com.atlantbh.navigator.debug:id/reservation_note')
		Appium::TouchAction.new.swipe(start_x: 0.5, start_y: 0.8, end_x: 0.5, end_y: 0.2, duration: 1000).perform
		@num_of_tickets=id('com.atlantbh.navigator.debug:id/reservation_nmb')
		@reserve_button=id('com.atlantbh.navigator.debug:id/reserve_ticket_button_submit')

		# BAKIR: Same comment like in method required_fields_exist
		@first_name.nil? && @last_name.nil? && @email.nil? && @phone.nil? && @notes.nil? && @num_of_tickets.nil? && @reserve_button.nil?
	end

	def reserve_tickets(input_name, input_last, input_email, input_phone, input_note, nmb)
		#entering values
		@first_name.type(input_name)
		@last_name.type(input_last)
		@email.type(input_email)
		@phone.type(input_phone)
		@note.type(input_note)
		@num_of_tickets.type(nmb)
		@reserve_button.click
		sleep(2)
		popup=id('android:id/message')
		ok_button=id('android:id/button1')

		popup.nil? && ok_button.click
	end

	def previous_screen
		back
	end
end