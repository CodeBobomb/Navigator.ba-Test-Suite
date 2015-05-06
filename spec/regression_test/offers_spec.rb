require 'appium_lib'

describe "Navigator.ba regression test: Today's offers" do

	before :all do
		@homescreen = HomeScreen.new
		@placescreen = PlaceScreen.new
		@eventslistscreen = EventsListScreen.new
		@eventscreen = EventScreen.new
	end

	context "Click the 'Danas aktuelno' item on the home viewscreen" do
		it 'item clicked, offers list viewscreen appeared' do
			expect(@homescreen.open_main_item('Danas aktuelno')).to eql('DANAS AKTUELNO')
		end
	end

	context "Select the first offer on the list viewscreen" do
		it 'offer selected, offer viewscreen appeared' do
			@eventslistscreen.select_offer(0)
			expect(@eventscreen.required_fields_exist?).to be_truthy
		end
	end

	context "Check if offer viewscreen data is the same as offet list item data" do
		it 'data matches' do
			expect(@eventslistscreen.get_event_info).to match_array([@eventscreen.name.text,@eventscreen.day.text,@eventscreen.month.text,@eventscreen.time.text,@eventscreen.theater.text,@eventscreen.genre.text,@eventscreen.price.text])
		end
	end

	context "Open the location of the event" do
		it 'place viewscreen appeared' do
			expect(@eventscreen.open_event_place).to eql('PASHA')
		end
	end

	context "Press the Map button on options menu and check pin content" do
		it "map viewscreen appeared and pin content verified" do
			expect(@placescreen.check_map).to eql([true,true,true])
		end
	end

	context "Return to event viewscreen" do
		it 'returned to event viewscreen' do
			@placescreen.previous_screen
			expect(@eventscreen.required_fields_exist?).to be_truthy
		end
	end

	context "Press the 'Book a ticket' button" do
		it 'button pressed, textfields appeared' do
			expect(@eventscreen.open_booking_menu).to be_truthy
		end
	end

	context "Reserve a ticket with data 'John','Testcase','adnan.praksa@gmail.com', '061508633', 2 tickets, 'No notes' " do
		it 'Tickets successfully reserved' do
			expect(@eventscreen.reserve_tickets('John','Testcase','adnan.praksa@gmail.com','061508633','No notes',2)).to eql('Vaša rezervacija je proslijeđena osoblju objekta.')
		end
	end

	context "Return to home viewscreen" do
		it 'returned to heme viewscreen' do
			@eventscreen.previous_screen
			@eventslistscreen.previous_screen
			expect(@homescreen.on_screen?).to be_truthy
		end
	end
end
