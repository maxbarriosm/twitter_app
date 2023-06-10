class TweetsController < ApplicationController
    def index
        #Buscamos todos los tweets y con el @ elegimos donde
        @tweets = Tweet.all
    end

    def show
        #mostrar los tweets de manera individual
        @tweet =Tweet.find params[:id]
    end

    def new
        @tweet = Tweet.new
    end

    def create
        tweet = Tweet.new tweet_params
        tweet.user = current_user
        if tweet.save
            redirect_to tweet, notice: "tweet guardado con exito"
        else
            render :new
        end
    end

    def destroy
        tweet = Tweet.find params[:id]
        tweet.destroy
        redirect_to tweets_path, notice:  "Se ha eliminado correctamente"
    end

    private
    def tweet_params
        #le exigo que venga solamente un body y asi no tener vulnerabilidad
        params.require(:tweet).permit(:body) 
    end

end