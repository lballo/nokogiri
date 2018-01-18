require 'rubygems'
require 'nokogiri'
require 'open-uri'
require 'pry'

#METHODE 1 : CODE FONCTIONNEL 


PAGE_URL = "http://mon-incubateur.com/site_incubateur/incubateurs"
def incubator
    incubator_names = [] #création des tableaux de données nom, code postal et site internet
    incubator_postalcode = []
    incubator_website = []
    my_hash = Hash.new #création du hash

    page = Nokogiri::HTML(open(PAGE_URL))

    i = 0

    page.css('tr td p span a').each do |name|
        incubator_names << name.text #scrap des données nom des incubateurs
    end

    sites = page.css('a') 
    lien = sites.each{|link| print link['href'] + " "}
    lien.each do |site| #scrap des sites internet
        incubator_website << site.text
    end

    zip = page.css('a').text #scrap des données code postal
        zip.each do |z| #scrap des sites internet
        incubator_postalcode << z.text
    end


    size = incubator_names.length
    while i < size do #boucle pour ranger tableaux dans le hash
        my_hash[incubator_names[i]] = incubator_postalcode[i]
        my_hash[incubator_names[i]] = incubator_website[i]
        i += 1 #évolution indice du hash 
    end
    puts my_hash

end

incubator

