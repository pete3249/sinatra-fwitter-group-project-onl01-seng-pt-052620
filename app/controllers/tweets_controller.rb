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
        @tweet = Tweet.find_by_id(params[:id])
        erb :'/tweets/show'
    else
        redirect '/login'
    end 
end

post '/tweets' do
    @user = current_user
    if logged_in?
        if !params[:content].empty?
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

get '/tweets/:id/edit' do
    @tweet = Tweet.find_by_id(params[:id])
     if logged_in?
        erb :'/tweets/edit'
     else
        redirect '/login'
     end
end

patch '/tweets/:id' do
    @tweet = Tweet.find_by_id(params[:id])
    if logged_in?
        if !params[:content].empty?
            @tweet.update(content: params[:content])
            redirect '/tweets'
        else
           redirect "/tweets/#{@tweet.id}/edit"
        end 
    else
        redirect '/login'
    end 
end

delete '/tweets/:id' do
    @tweet = Tweet.find_by_id(params[:id])
    if current_user == @tweet.user
        @tweet.destroy
        redirect '/tweets'
    else
        redirect "/tweets/#{@tweet.id}"
    end
end

end
