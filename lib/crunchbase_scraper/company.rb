class CrunchbaseScraper::Company
	attr_accessor :name, :type, :place, :description, :url, :size, :tags, :website

	def self.all
		self.scrape_companies
	end

	def self.scrape_companies
		# CrunchbaseScraper::Company.scrape_companies
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
				x.url = result.css('.title a').attribute('href').value.gsub("\\\"", "")
				companies << x
			end
		end

		companies
	end

	def scrape_company
		doc = Nokogiri::HTML(RestClient.get(self.url))

		# with open-uri I get a 404
		# name = "document",
		# children = [
		#   #(DTD:0x3fd190c57564 { name = "html" }),
		#   #(Element:0x3fd190c47178 {
		#     name = "html",
		#     children = [
		#       #(Element:0x3fd190c36e90 {
		#         name = "body",
		#         children = [ #(Element:0x3fd19146fa80 { name = "p", children = [ #(Text "https://angel.co/travelnuts")] })]
		#         })]
		#     })]
		# })

		self.description = doc.css('h2').text.strip.gsub("\nAlso on AngelList", "")
		self.place = doc.css('.js-location_tags a').text
		self.size = doc.css('.js-company_size').text.strip
		self.tags = doc.css('.js-market_tags a').map{|a| a.text }.join(", ")
		self.website = doc.css('.company_url').text
		self
	end

end

