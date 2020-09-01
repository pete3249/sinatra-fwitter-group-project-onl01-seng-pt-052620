require './config/environment'

class ApplicationController < Sinatra::Base

  configure do
    set :public_folder, 'public'
    set :views, 'app/views'
    set :sessions, true
    set :session_secret, ENV["SESSION_SECRET"]
    set :method_override, true
  end

  get '/' do 
    erb :welcome
  end 

  get '/signup' do
    redirect '/users/new'
  end

  post '/signup' do
    @user = User.new(params)
    if @user.save
        session[:id] = @user.id
        redirect '/tweets'
    else
        erb :'/users/new'
    end 
  end 

end
