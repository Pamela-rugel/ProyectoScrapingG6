class GrabJobs
  def extraerData(url)
    CSV.open('csvfiles/GrabJobs.csv', 'wb') do |csv|
      conf=0; pagina=1
      csv << %w[num titulo_empleo descripcion_empleo etiquetas_empleo]
      while (pagina<130)
        puts "Scrapeando la pagina # #{pagina} de la URL"
        link = "#{url}#{pagina}"
        grabJobsHTML = URI.open(link)
        datos = grabJobsHTML.read
        parsed_content = Nokogiri::HTML(datos)
        inf_container = parsed_content.css('a.link-card').each do |oferta|
          newUrl = oferta['href']
          titulo = oferta.css('h2.card-title').inner_text
          etiquetas = oferta.css('h3 > span.mx-2').inner_text
          ofertaGrabJobsHTML = URI.open(newUrl)
          ofertaDatos = ofertaGrabJobsHTML.read
          oferta_parsed_content = Nokogiri::HTML(ofertaDatos)
          descripcion = oferta_parsed_content.css('#job-description').inner_text

          csv << [conf.to_s, titulo.to_s, descripcion.to_s, etiquetas.to_s]
          conf+=1
        end
        pagina+=1
      end
      puts "Fin de Extracción, GrabJobs ofertas laborales"
    end
  end
end
