require 'nokogiri'
require 'open-uri'

def pages
  page = Nokogiri::HTML(URI.open("https://coinmarketcap.com/all/views/all/"))
  crypto_name_array = page.xpath('//table/tbody/tr[*]/td[3]/div').map(&:text)
  price_array = page.xpath('//table/tbody/tr[*]/td[5]/div').map(&:text).map{|symbol| symbol.delete("$")}
  return crypto_name_array, price_array
end

def crypto_names_hash(price_array,crypto_name_array)
  price_array_float = price_array.map{|value| value.to_f} 
  price_crypto_hash = Hash[crypto_name_array.zip(price_array_float)]
  return price_crypto_hash
end

def crypto_names_array(price_crypto_hash)
final_array = []
price_crypto_hash.each {|key, value| final_array << {key => value} }
return final_array
end

def perform
  crypto_name_array, price_array = pages
  price_crypto_hash = crypto_names_hash(price_array, crypto_name_array)
  final_array = crypto_names_array(price_crypto_hash)
  final_array
  
end

puts perform

