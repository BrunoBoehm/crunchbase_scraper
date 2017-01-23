# CLI controller
class CrunchbaseScraper::CLI

	def call
		puts "Welcome to the Crunchbase CLI"
		list_companies
		menu
	end

	def list_companies
		@companies = CrunchbaseScraper::Company.all
	end

	def menu
		input = nil
		while input != "exit"
			puts ""
			puts "Type the company number to get more info, list to see the list again, or exit:"
			input = gets.strip
			if input == "list"
				list_companies
			elsif input.to_i == 0
				puts "more info thanks to company name"
			elsif input.to_i > 0
				puts "more info thanks to company number"
			end			
		end
		puts "Goodbye!"
	end

end