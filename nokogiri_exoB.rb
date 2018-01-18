require 'rubygems'
require 'nokogiri'
require 'open-uri'

#METHODE 1 : CODE FONCTIONNEL 


PAGE_URL = "https://coinmarketcap.com/all/views/all/"
def crypto_trader
    crypto_names = [] #création des tableaux de données
    crypto_price = []
    my_hash = Hash.new #création du hash
    page = Nokogiri::HTML(open(PAGE_URL))
    i = 0
    page.css('.currency-name-container').each do |elem|
        crypto_names << elem.text #scrap des données nom des crypto
    end
    page.css('.price').each do |p| #scrap des données prix des crypto
        crypto_price << p.text
    end
    size = crypto_names.length
    while i < size do #boucle pour ranger tableaux dans le hash
        my_hash[crypto_names[i]] = crypto_price[i]
        i += 1 #évolution indice du hash 
    end
    puts my_hash
end
crypto_trader

=begin
METHODE 1 : CODE A REPRENDRE: DIFFICULTÉS D'APPEL A DES VARIABLES SITUÉES EN DEHORS DES METHODES

#initialisation des variables en dehors des fonctions
$crypto_name = []
$crypto_value = []

def names_crypto #récupère le nom de chacune des cryptomonnaies et les range dans un tableau
 	coin_market_url="https://coinmarketcap.com/all/views/all/"
 	page=Nokogiri::HTML(open(coin_market_url))
 	page.xpath("//td[2]/a").each do |name|
 		crypto_name << name.text
	end
end 


def value_crypto #récupère la valeur de chacune des cryptomonnaies et les range dans un tableau
	coin_market_url="https://coinmarketcap.com/all/views/all/"
	page=Nokogiri::HTML(open(coin_market_url))
	page.xpath("//td[5]/a").each do |value|
		crypto_value << value.text 
	end
end 

def all_value #consolidation des deux tableaux dans un hash {clé : valeur}
size = $crypto_name.length
all = Hash.new
i = 0
while i < size do
 	all[$crypto_name[i]] = $crypto_value[i]
 	i += 1
 	end
puts all
end

$crypto_name = names_crypto
$crypto_value = value_crypto

all_value()
=end