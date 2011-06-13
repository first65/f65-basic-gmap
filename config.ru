require 'rubygems'
require 'open-uri'
require 'sinatra'

configure do
	Rack::Mime::MIME_TYPES[".manifest"] = "text/cache-manifest"
end

set :public, File.dirname(__FILE__) + '/public'

get '/' do
  open(File.dirname(__FILE__) + '/public/index.html').read
end

get '/b' do
  open(params[:url]).read
end

run Sinatra::Application