require 'rubygems'
require 'nokogiri'
require 'open-uri'

crypto_name = []
crypto_value = []

def names_crypto()
 	coin_market_url="https://coinmarketcap.com/all/views/all/"
 	page=Nokogiri::HTML(open(coin_market_url))
 	page.xpath("//td[2]/a").each do |name|
 		crypto_name << name.text
	end
end 


def value_crypto()
	coin_market_url="https://coinmarketcap.com/all/views/all/"
	page=Nokogiri::HTML(open(coin_market_url))
	page.xpath("//td[5]/a").each do |value|
		crypto_value << value.text
	end
end 

def all_value
size = crypto_name.length
all = Hash.new
i = 0
while i < size do
	all[crypto_name[i]] = crypto_value[i]
	i += 1
	end
puts all
end

all_value()