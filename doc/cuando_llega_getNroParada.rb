#Obtiene la parada mandando las dos calles

require 'mechanize'
require 'rails'

agent = Mechanize.new
agent.get("http://www.etr.gov.ar/getData.php?accion=getInfoParadas&idLinea=1,2&idCalle=1308&idInt=1290")
parada = agent.page.links.first.text
puts parada
