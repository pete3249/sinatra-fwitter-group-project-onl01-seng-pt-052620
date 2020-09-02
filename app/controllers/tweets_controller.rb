class TweetsController < ApplicationController

get '/tweets' do 
    if logged_in?
        @user = current_user
        erb :'/tweets/index'
    else
        redirect '/login'
    end 
end 

get '/tweets/:id' do
     if logged_in?
         @user = current_user
         erb :'/tweets/index'
     else
         redirect '/login'
     end 
 end

end
