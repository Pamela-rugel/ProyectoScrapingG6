class Jora
  def extraerData(urlpt1, urlpt2)
    CSV.open('csvfiles/Jora.csv', 'wb') do |csv|
      csv << %w[num titulo_empleo descripcion_empleo etiquetas_empleo]
      conf=0; pagina=1
      while (pagina<7)
        puts "Scrapeando la url #{urlpt1}#{pagina}#{urlpt2}"
        link = "#{urlpt1}#{pagina}#{urlpt2}"
        multitrabajosHTML = URI.open(link)
        datos = multitrabajosHTML.read
        parsed_content = Nokogiri::HTML(datos)
        inf_container = parsed_content.css('.job-card').each do |oferta|
          titulo = oferta.css('.top-container').css('.job-title').css('.job-link').inner_text
          descripcion = oferta.css('.job-abstract').inner_text
          etiquetas = oferta.css('.info-container').css('.job-company').inner_text

          csv << [conf.to_s, titulo.to_s, descripcion.to_s, etiquetas.to_s]
          conf+=1
        end
        pagina+=1
      end
      puts "Fin de Extracción, Jora ofertas laborales"
    end
  end
end
