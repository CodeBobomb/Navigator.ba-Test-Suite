describe "Naviagtor.ba mobile app regression test: Category list " do

	before :all do
		@homescreen=HomeScreen.new
		@listscreen=ListScreen.new
		@placescreen=PlaceScreen.new
		@all_categories=nil
	end

	context "Check if every category item opens a list viewscreen" do
		it 'all category items opened a list viewscreen' do
			@homescreen.get_all_categories(12) #hash with category items as keys and category list title as values
			expect(@homescreen.categories.keys).to match_array(@homescreen.categories.values)
		end
	end

	context "Check if the number of categories is 12" do
		it 'number of categories is valid' do
			expect(@homescreen.categories.length).to eql(12)
		end
	end
end