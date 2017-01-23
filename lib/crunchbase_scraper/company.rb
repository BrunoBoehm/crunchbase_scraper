class CrunchbaseScraper::Company
	attr_accessor :name, :place, :description, :rank, :url

	def self.all
		# puts <<-DOC.gsub(/^\s*/, '')
		# 	1. Facebook - Menlo Park, California, United States - Facebook is an online social networking service... - #1
		# 	2. Alibaba - Hangzhou, Zhejiang, China - Alibaba is a Chinese e-commerce company operating online... - #2
		# DOC

		company_1 = self.new
		company_1.name = "Facebook"
		company_1.place = "Menlo Park, California, United States"
		company_1.description = "Facebook is an online social networking service..."
		company_1.rank = "#1"
		company_1.url = "the URL"


		company_2 = self.new
		company_2.name = "Alibaba"
		company_2.place = "Hangzhou, Zhejiang, China"
		company_2.description = "Alibaba is a Chinese e-commerce company operating online..."
		company_2.rank = "#2"
		company_2.url = "the URL"

		[company_1, company_2]
	end

end