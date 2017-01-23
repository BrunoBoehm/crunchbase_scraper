class CrunchbaseScraper::Company
	attr_accessor :name, :type, :place, :description, :rank, :url

	def self.all
		self.scrape_companies
	end

	def self.scrape_companies
		companies = []

		# html = open("http://www.crunchbase.com/companies?c=a&q=funded")
		html = open("https://angel.co/search?q=travel")
		# html = RestClient.get("https://www.crunchbase.com/organization/apple")
		# RestClient::RangeNotSatisfiable: 416 Range Not Satisfiable
		doc = Nokogiri::HTML(html)
		results = doc.css(".result")
		results.each do |result|
			self.new.tap do |x|
				x.name = result.css('.title a').text.strip
				x.type = result.css('.type').text.gsub("\\n", "")
				companies << x
			end
		end

		companies
	end

end

