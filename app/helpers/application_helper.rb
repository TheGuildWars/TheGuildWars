module ApplicationHelper
  def date_string
    "%d/%m/%Y"
  end
  
  def time_string
    "%H:%M #{date_string}"
  end
  
  def gravatar_url(email,options = {})
  	require 'digest/md5'
  	hash = Digest::MD5.hexdigest(email)
  	url = "http://www.gravatar.com/avatar/#{hash}"
  	options.each do |option|
  		option == options.first ? url+="?" : url+="&"
  		key = option[0].to_s
  		value = option[1].to_s
  		url+=key + "=" + value
  	end
  	url
  end
end
