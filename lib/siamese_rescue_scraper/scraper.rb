require 'open-uri'

class SiameseRescueScraper::Scraper
  #should I make these methods class or instance?

  @@cats = []

  def self.scrape(url)
    first_page = Nokogiri::HTML(open(url))
    binding.pry
    pages_num = first_page.css("a.notelink1").last.values[0].scan(/\d/).join.to_i
    binding.pry
    for page_num in 1..pages_num
      self.scrape_page("https://va.siameserescue.org/webbuild.php?type=adoptme&page=#{page_num}&state=")
    end
    @@cats
  end

  def self.scrape_page(url)
    current_page = Nokogiri::HTML(open(url))
    binding.pry
    current_page.css("table.gallery").each do |card|

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
