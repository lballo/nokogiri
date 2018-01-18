require 'rubygems'
require 'nokogiri'
require 'open-uri'   

def get_the_email_of_a_townhal_from_its_webpage
 	page = Nokogiri::HTML(open("http://annuaire-des-mairies.com/95/vaureal.html"))   
 	element = page.css('tr td p font')
 		element.each do |x|
      		if x.text.include?('@')
      			puts x.text
  			end
  		end
end

get_the_email_of_a_townhal_from_its_webpage

def get_all_the_urls_of_val_doise_townhalls
page2 = Nokogiri::HTML(open("http://annuaire-des-mairies.com/val-d-oise.html")) 
townhalls_url = page2.css('a')
lien = townhalls_url.each{|link| print link['href'] + " "}
end

get_all_the_urls_of_val_doise_townhalls