require 'open-uri'

class SiameseRescueScraper::Scraper

  def self.scrape(url)
    index_page = Nokogiri::HTML(open(url))
    cats = []
    index_page.css(".galleryNB").each do |card|
      cat_name = card.css("span").first.text
      cats << cat_name
    end
    binding.pry
    cats
  end


end
