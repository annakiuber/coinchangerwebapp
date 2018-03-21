require "sinatra"
require_relative "coinchanger_app.rb"

enable :sessions

get "/" do 
	erb :page_1
end

post "/numbers" do 
	session[:num1] = params[:num1].to_i
	redirect '/number'
end

get "/number" do
	num1 = session[:num1]
	cents = hash_to_string(num1)
	erb :page_2, locals:{num1: num1, cents:cents}
end

# post "theend" do
# 	num1= session[:num1]
# 	ce

