require 'pry'
require 'sinatra'
require 'sinatra/reloader' if development?

enable :sessions

get '/get_value' do
  "value = " << session[:value].inspect
end

get '/set/:value' do
  session[:value] = params[:value]
end


helpers do
  def reverse_and_upcase(str)
    str.reverse.upcase
  end
end



#Hell World
get '/' do
  "Hello World"
end

get '/' do
  "hello general assembly"
end

get '/hello/:name/:age/:gender' do |n, a|
  "hello #{n}, you're #{a}!"
end

get '/say/*/to/*' do
  params[:splat] # => ["hello", "world"]
end

get '/download/*.*' do |path, ext|
  [path, ext]
  @path = params[:splat[0]]
  @ext = params[:splat[1]]
end

# 617 - 500 - 7400
# 10 digits
# first 3 digits, dash, 3 digits, dash, 4 digits


get '/is_valid_phone/*' do
end


get '/comments.?:format?' do
   if params[:format].nil?
      return "No format"
    else
      return params[:format]
   end
 end

get '/blog_post/?:size?' do
  if params[:size] == "big"
    "this is my blog".upcase
  else
    "this is a blog"
  end
end