require 'open-uri'

class SiameseRescueScraper::Scraper
  #should I make these methods class or instance?

  @@cats = []

  def self.scrape(url)
    first_page = Nokogiri::HTML(open(url))
    pages_num = first_page.css("a.notelink1").last.values[0].scan(/\d/).join.to_i
    for page_num in 1..pages_num
      self.scrape_page("https://va.siameserescue.org/webbuild.php?type=adoptme&page=#{page_num}&state=")
    end
    @@cats
  end

  def self.scrape_page(url)
    current_page = Nokogiri::HTML(open(url))
    current_page.css("table.gallery").each do |card|

      #name = card.css(".galleryNB span")[0].text
      #id = card.css(".galleryNB span")[1].text
      #loc = card.css(".galleryNB span")[2].text
      bio = card.css("td.gallery span").text.strip

      #not looping properly!!!!
      info = card.css(".galleryNB").text

      list = info.split("\n")
      downsized = list[2..10]
      downsized.map! do |element|
        element = element.split("\u00A0")
        element.delete("")
        element
        #t = "#{values[0].downcase}=, #{values[1]}"
        #send("#{values.[0].downcase}=",values[1])
      end

      #This would write following code but it breaks
      #for i in 0..7
      #  send("#{downsized[i][0].downcase.gsub(":","")}=",downsized[i][1])
      #end


      name = downsized[0][1]
      id = downsized[1][1]
      loc = downsized[2][1]
      sex = downsized[3][1]
      age = downsized[4][1]
      weight = downsized[5][1]
      declawed = downsized[6][1]
      points = downsized[7][1]
      datein = downsized[8].join.split(":")[1].strip

      @@cats << {name: name, id: id, loc: loc, sex: sex, age: age, weight: weight, declawed: declawed, points: points, datein: datein, bio: bio}
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
