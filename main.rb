require 'open-uri'
require 'nokogiri'
require 'csv'
require './plataformas/Freelancer'

#------------------------------------------- URLS A SCRAPEAR -------------------------------------------
urlFreelancer = 'https://www.freelancer.ec/job-search/developer/' 

# ---------------------------------------------- SCRAPING ---------------------------------------------
puts "Freelancers"
Freelancer.new.extraerData(urlFreelancer)

