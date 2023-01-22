class Freelancer
  def extraerData(url)
    CSV.open('csvfiles/Freelancer.csv', 'wb') do |csv|
      csv << %w[num titulo_empleo descripcion_empleo etiquetas_empleo]
      conf=0; pagina=1
      while (pagina<150)
        puts "Scrapeando la url #{url}#{pagina}"
        link = "#{url}#{pagina}"
        freelancerHTML = URI.open(link)
        datos = freelancerHTML.read
        parsed_content = Nokogiri::HTML(datos)

        parsed_content.css('.JobSearchCard-list').css('.JobSearchCard-item').css('.JobSearchCard-item-inner').css('.JobSearchCard-primary').each do |contenido|
          etiquetas=[]
          contenido.css('.JobSearchCard-primary-tagsLink').each do | a|
            etiquetas.push(a.inner_text.strip)
          end
          #puts etiquetas
          titulo = contenido.css('.JobSearchCard-primary-heading').css('.JobSearchCard-primary-heading-link').inner_text.strip
          #puts titulo
          descripcion = contenido.css('p.JobSearchCard-primary-description').inner_text.strip
          #puts descripcion

          csv << [conf.to_s, titulo.to_s, descripcion.to_s, etiquetas.to_s]
          conf+=1
        end
        pagina+=1
      end
      puts "Fin de Extracción, Freelancer ofertas laborales"
    end
  end
end
