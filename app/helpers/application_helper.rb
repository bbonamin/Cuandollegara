module ApplicationHelper

	def facebook_like
		content_tag :iframe, nil, :src => "http://www.facebook.com/plugins/like.php?href=#{CGI::escape(request.url)}&layout=standard&show_faces=false&width=320&action=like&font=arial&colorscheme=light&height=10", :scrolling => 'no', :frameborder => '0', :allowtransparency => true, :id => :facebook_like
	end
end
