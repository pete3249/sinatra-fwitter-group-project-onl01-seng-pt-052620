class TweetsController < ApplicationController

get '/tweets' do 
    @user = User.find_by(username: params[:username])
    erb :'tweets/index'
end 

end
