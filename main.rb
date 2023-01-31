require 'open-uri'
require 'nokogiri'
require 'csv'
require './plataformas/Freelancer'
require './plataformas/GrabJobs'
require './plataformas/Jora'
#------------------------------------------- URLS A SCRAPEAR -------------------------------------------
urlFreelancer = 'https://www.freelancer.ec/job-search/developer/'
urlGrabJobs = 'https://grabjobs.co/ecuador/jobs?q=desarrollador+developer+software+web+movil+Java+JavaScript+Python+C+C+R+PHP+Go+Ruby+Objective+C+C&p='
urlJoraPt1 = 'https://ec.jora.com/j?l=Ecuador&p='
urlJoraPt2 = '&q=Software+developer&sp=search&surl=0&tk=LY7GRVzLKKkhT_hHHCIz-K0XYrcCvI4SpH1jYTraQ'
# ---------------------------------------------- SCRAPING ---------------------------------------------

#puts 'Freelancers'
#Freelancer.new.extraerData(urlFreelancer)

#puts 'GrabJobs'
#GrabJobs.new.extraerData(urlGrabJobs)

#puts "Jora"
#Jora.new.extraerData(urlJoraPt1,urlJoraPt2)

require "csv"

CSV.open("Visualizacion/final.csv", "wb", write_headers: true, headers: ["num", "titulo_empleo", "descripcion_empleo", "etiquetas_empleo"]) do |csv|
  Dir["csvfiles/*.csv"].each do |path|
    CSV.foreach(path, headers: true, return_headers: false) do |row|
      csv << row
    end
  end
end
