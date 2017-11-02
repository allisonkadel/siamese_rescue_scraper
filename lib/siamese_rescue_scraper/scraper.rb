require 'open-uri'

class SiameseRescueScraper::Scraper
  #should I make these methods class or instance?

  @@cats = []

  def self.scrape(url)
    #this should scrape for number of pages and execute .scrape_page that many times
    number = 3
    #page = Nokogiri::HTML(open(url))
    for number in 1..number
      self.scrape_page("https://va.siameserescue.org/webbuild.php?type=adoptme&page=#{number}&state=")
    end
    @@cats
  end

  def self.scrape_page(url)
    index_page = Nokogiri::HTML(open(url))
    #binding.pry
    index_page.css("table.gallery").each do |card|

      name = card.css(".galleryNB span")[0].text
      id = card.css(".galleryNB span")[1].text
      loc = card.css(".galleryNB span")[2].text
      bio = card.css("td.gallery span").text
#      sex = card.css("span")[3].text
#      age = card.css("span")[4].text
#      weight = card.css("span")[5].text
#      declawed = card.css("span")[6].text
#      points = card.css("span")[7].text
#      datin = card.css("span")[8].text

      @@cats << {name: name, id: id, loc: loc, bio: bio}
    end
    @@cats
  end

#  def self.scrape(url)
#    index_page = Nokogiri::HTML(open(url))
#    cats = []
#    index_page.css(".galleryNB").each do |card|
#      card.css("span").each do |cat_attr|
#        cat = {}
#
#      cat_name = card.css("span").first.text
#      cats << cat_name
#    end
#    binding.pry
#    cats
#  end


end
