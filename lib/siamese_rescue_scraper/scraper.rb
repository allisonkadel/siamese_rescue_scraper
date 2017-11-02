class SiameseRescueScraper::Scraper

  def self.scrape(URL)
    page1 = Nokogiri::HTML(open(URL))
    cats = []
    page1.css("u b.first.text")

end
