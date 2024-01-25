require 'nokogiri'
require 'open-uri'
  
# méthode prenant pour paramètre l'url d'une ville lambda : le but étant de ne pas spécifier la ville pour que la méthode fonctionne avec n'importe quelle ville
def get_townhall_email(townhall_url)
  page = Nokogiri::HTML(URI.open(townhall_url))
  email = page.xpath('//html/body/div/main/section[2]/div/table/tbody/tr[4]/td[2]').text
  return email
end

def get_townhalls_url
  page = Nokogiri::HTML(URI.open("https://annuaire-des-mairies.com/val-d-oise.html"))
  townhall_urls_array = page.xpath('//table//a[@class="lientxt"]/@href').map(&:text)
  full_urls_array = townhall_urls_array.map {|url| "https://annuaire-des-mairies.com" + url[1..-1]}
  return full_urls_array
end

def get_emails
  townhall_urls_array = get_townhalls_url
  emails = Array.new

  townhall_urls_array.each do |url|
    townhall_name = url.split("/").last.gsub(".html", "").capitalize
    email = get_townhall_email(url)
    emails << { townhall_name => email }
  end
  return emails
end

puts get_emails


