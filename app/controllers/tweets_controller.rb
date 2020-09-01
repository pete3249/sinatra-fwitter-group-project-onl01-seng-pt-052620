class TweetsController < ApplicationController

get '/tweets' do 
    if logged_in?
        @user = User.find_by_id(session[:user_id])
        erb :'/tweets/index'
    else
        redirect '/users/login'
    end 
end 

end
