#Obtiene las intersecciones de calles mandando un id de linea y id de calle

require 'mechanize'
require 'rails'

agent = Mechanize.new
agent.get("http://www.etr.gov.ar/getData.php?accion=getInterseccion&idLinea=1,2&idCalle=1308")
json = agent.page.content

data = ActiveSupport::JSON.decode(json)

data.each do |parada|
	puts "ID: #{parada['id']}"
	puts "DESCRIPCION: #{parada['desc']}"
	puts "---"
end
