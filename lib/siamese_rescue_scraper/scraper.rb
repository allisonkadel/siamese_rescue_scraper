require 'open-uri'

class SiameseRescueScraper::Scraper

  def self.scrape(url)
    index_page = Nokogiri::HTML(open(url))
    cats = []
    index_page.css(".galleryNB").each do |card|

      name = card.css("span")[0].text
      id = card.css("span")[1].text
      loc = card.css("span")[2].text
#      sex = card.css("span")[3].text
#      age = card.css("span")[4].text
#      weight = card.css("span")[5].text
#      declawed = card.css("span")[6].text
#      points = card.css("span")[7].text
#      datin = card.css("span")[8].text

      cats << {name: name, id: id, loc: loc}#, sex: sex, age: age, weight: weight, declawed: declawed, points: points, datein: datein}
        #attr = self.send("#{card.css("b")[i+1].text.gsub(/[^a-z]/i, '')}=","#{card.css("span")[i].text}")
        #cat << attr
    end
    cats
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
