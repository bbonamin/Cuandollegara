class ArrivalController < ApplicationController
  def select
  	@buses = Bus.all
  	@line = session[:line_value]
  	@stop = session[:stop]
  end

  def show
  	agent = Mechanize.new
	agent.post("http://www.etr.gov.ar/getSmsResponse.php", {"parada" => "#{params[:stop]}", "linea"=>"#{params[:line]}"})
	@llegada = agent.page.content
  end

  def select_line
  	@buses = Bus.all	
  end

  def find_street
  	agent = Mechanize.new
	agent.get("http://www.etr.gov.ar/getData.php?accion=getCalle&idLinea=#{params[:line]}")
	streets_json = agent.page.content

	@streets = ActiveSupport::JSON.decode(streets_json)

	# data.each do |linea|
	# 	puts "ID: #{linea['id']}"
	# 	puts "DESCRIPCION: #{linea['desc']}"
	# 	puts "---"
	# end
  end

  def find_intersection
  	agent = Mechanize.new
	agent.get("http://www.etr.gov.ar/getData.php?accion=getInterseccion&idLinea=#{params[:line]}&idCalle=#{params[:street][:id]}")
	intersections_json = agent.page.content

	@intersections = ActiveSupport::JSON.decode(intersections_json)
	@street = params[:street][:id]
  end

  def find_stop
  	agent = Mechanize.new
	agent.get("http://www.etr.gov.ar/getData.php?accion=getInfoParadas&idLinea=#{params[:line]}&idCalle=#{params[:street]}&idInt=#{params[:intersection][:id]}")
	session[:stop] = agent.page.links.first.text
	session[:line_value] = Bus.find_by_line_id(params[:line]).value
	redirect_to arrival_select_path
  end
end
