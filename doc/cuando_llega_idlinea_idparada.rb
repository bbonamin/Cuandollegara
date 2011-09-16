require 'mechanize'

agent = Mechanize.new
agent.post("http://www.etr.gov.ar/getSmsResponse.php", {"parada" => "4152", "linea"=>"112"})
puts agent.page.content
