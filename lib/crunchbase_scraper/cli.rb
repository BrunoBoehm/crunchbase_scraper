# CLI controller
class CrunchbaseScraper::CLI

	def call
		puts "Welcome to the Crunchbase CLI"
		list_companies
		menu
	end

	def list_companies
		puts <<-DOC.gsub(/^\s*/, '')
			1. Facebook - Menlo Park, California, United States - Facebook is an online social networking service... - #1
			2. Alibaba - Hangzhou, Zhejiang, China - Alibaba is a Chinese e-commerce company operating online... - #2
		DOC
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