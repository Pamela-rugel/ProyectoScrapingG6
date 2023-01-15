require 'open-uri'
require 'nokogiri'
require 'csv'
require './plataformas/Freelancer'
require './plataformas/GrabJobs'
#------------------------------------------- URLS A SCRAPEAR -------------------------------------------
urlFreelancer = 'https://www.freelancer.ec/job-search/developer/' 
urlGrabJobs = 'https://grabjobs.co/ecuador/jobs?q=desarrollador+developer+software+web+movil+Java+JavaScript+Python+C+C+R+PHP+Go+Ruby+Objective+C+C&p=' 
# ---------------------------------------------- SCRAPING ---------------------------------------------
#puts "Freelancers"
#Freelancer.new.extraerData(urlFreelancer)

puts "GrabJobs"
GrabJobs.new.extraerData(urlGrabJobs)