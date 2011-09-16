require 'rubygems'
require 'nokogiri'
require 'open-uri'

linea = '1%2C2'
url = 'http://www.etr.gov.ar/getData.php?accion=getCalle&idLinea=' + linea

doc= Nokogiri::HTML(open(url))

puts doc.text

offset= doc.to_str.index(':')
while offset !=nil
		id = doc.to_str.slice((offset+1)..(doc.to_str.index('"',offset+3)))
		puts "\n id= "+ id 

		offset += 4
		
		offset = doc.to_str.index(':',offset)
		calle = doc.to_str.slice((offset+1)..doc.to_str.index('"',offset+3))

		offset = doc.to_str.index('"',offset+3)
		puts "\n calle=" + calle

		offset= doc.to_str.index(':',offset)
end
