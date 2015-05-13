class HomeScreen
	attr_accessor :categories
	def enter_place(place)
		search_box=id('com.atlantbh.navigator.debug:id/search_input_custom')
		search_box.type(place)
		sleep(2)
		#return search_box.text == place
	end

	def search
		venues=find('GLAVNE LOKACIJE') 
		loc=venues.location #suggested results is on the same location as "Glavne lokacije" item
		Appium::TouchAction.new.tap(x:loc[:x],y:loc[:y]).perform
	end

	def previous_screen
		back
	end

	def search_place(place)
		enter_place(place)
		search
		sleep(2)
		title=id('com.atlantbh.navigator.debug:id/title')
		title.text
	end

	def open_main_item(item_name)
		main_item=find(item_name)
		main_item.click
		id('com.atlantbh.navigator.debug:id/title').text
	end

	def get_all_categories
		@categories={}
		current_length=-1
		while @categories.length!=current_length
			current_length=@categories.length
			visible_categories=ids('com.atlantbh.navigator.debug:id/home_category_title')
			visible_categories.each do |cat|
				next if @categories[cat.text]!=nil
				cat.click  
				if !(exists { id('com.atlantbh.navigator.debug:id/title') })
					raise Exception 'Title not found' 
				end
				title=id('com.atlantbh.navigator.debug:id/title').text
				previous_screen
				@categories[cat.text]=title

			end
			swipe_up
		end
		@categories
	end
	
	def swipe_up
		Appium::TouchAction.new.swipe(start_x: 0.5, start_y: 0.8, end_x: 0.5, end_y: 0.3, duration: 1000).perform
	end

	def swipe_down
		Appium::TouchAction.new.swipe(start_x: 0.5, start_y: 0.3, end_x: 0.5, end_y: 0.8, duration: 1000).perform
	end

	def nav_bar(input)
		button=nil
		if(input=='Pretraga' || input=='Search')
			button=find('Pretraga')
		elsif(input=='Početak' || input=='Home')
			button=find('Home')
		elsif(input=='Postavke' || input=='Settings')
			button=find('Postavke')
		elsif(input=='Kreiraj Objekat' || input=='Create place')
			button=find('Kreiraj Objekat')
		end
		button.click
		id('com.atlantbh.navigator.debug:id/title').text
	end

	def on_screen?
		!(find('Početak').nil? || find('Pretraga').nil? || find('Kreiraj Objekat').nil? || find('Postavke').nil? || id('com.atlantbh.navigator.debug:id/search_input_custom').nil?)
	end
end


