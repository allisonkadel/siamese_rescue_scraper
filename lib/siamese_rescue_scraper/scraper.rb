require 'open-uri'

class SiameseRescueScraper::Scraper

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
      bio = card.css("td.gallery span").text.strip
      attributes = card.css(".galleryNB").text.split("\n")[2..10]

      attributes.map! do |attribute|
        attribute = attribute.split("\u00A0")
        attribute.delete("")
        attribute
      end

      #This would write following code but it breaks
      #for i in 0..7
      #  send("#{downsized[i][0].downcase.gsub(":","")}=",downsized[i][1])
      #end

      name = attributes[0][1]
      id = attributes[1][1]
      loc = attributes[2][1]
      sex = attributes[3][1]
      age = attributes[4][1]
      weight = attributes[5][1]
      declawed = attributes[6][1]
      points = attributes[7][1]
      datein = attributes[8].join.split(":")[1].strip

      @@cats << {name: name, id: id, loc: loc, sex: sex, age: age, weight: weight, declawed: declawed, points: points, datein: datein, bio: bio}
    end
    @@cats
  end

end
