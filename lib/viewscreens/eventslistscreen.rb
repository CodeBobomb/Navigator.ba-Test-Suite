 class EventsListScreen

	attr_accessor :time
	attr_accessor :day
	attr_accessor :month
	attr_accessor :name
	attr_accessor :theater
	attr_accessor :genre
	attr_accessor :price

	def initialize

	end

	def select_offer(num)
		offers=ids('com.atlantbh.navigator.debug:id/event_name')
		@name=offers[num].text
		@day=ids('com.atlantbh.navigator.debug:id/event_date')[num].text
		@month=ids('com.atlantbh.navigator.debug:id/event_month')[num].text
		@time=ids('com.atlantbh.navigator.debug:id/event_time')[num].text
		@theater=ids('com.atlantbh.navigator.debug:id/event_place_name')[num].text
		@genre=ids('com.atlantbh.navigator.debug:id/event_type')[num].text
		@price=ids('com.atlantbh.navigator.debug:id/event_price')[num].text
		offers[num].click
	end

	def get_event_info
		[@name, @day, @month, @time, @theater, @genre, @price]
	end

	def matches_event?(name,day,month,time,theater,genre,price)
		@name == name && @day == day && @month == month && @time == time && @theater == theater && @genre == genre && @price == price
	end

	def previous_screen
		back
	end
end