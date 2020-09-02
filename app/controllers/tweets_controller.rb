class TweetsController < ApplicationController

get '/tweets' do 
    if logged_in?
        @user = current_user
        erb :'/tweets/index'
    else
        redirect '/login'
    end 
end 

 get '/tweets/new' do
    if logged_in?
        erb :'/tweets/new'
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

 post '/tweets' do
    @user = current_user
    if logged_in?
        if !@params[:content].empty?
            @tweet = @user.tweets.build(params)
            @tweet.save
            redirect '/tweets'
        else
            redirect '/tweets/new'
        end
    else 
        redirect '/tweets'
    end 
 end

end
