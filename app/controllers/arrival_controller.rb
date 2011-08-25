class ArrivalController < ApplicationController
  def select
  	@buses = Bus.all
  end

  def show
  	agent = Mechanize.new
	agent.post("http://www.etr.gov.ar/getSmsResponse.php", {"parada" => "#{params[:stop]}", "linea"=>"#{params[:line]}"})
	@llegada = agent.page.content
  end

end
