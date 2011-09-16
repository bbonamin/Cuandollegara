#Obtiene las primeras calles mandando un id de linea

require 'mechanize'
require 'rails'

agent = Mechanize.new
agent.get("http://www.etr.gov.ar/getData.php?accion=getCalle&idLinea=1,2")
json = agent.page.content

data = ActiveSupport::JSON.decode(json)

data.each do |linea|
	puts "ID: #{linea['id']}"
	puts "DESCRIPCION: #{linea['desc']}"
	puts "---"
end
