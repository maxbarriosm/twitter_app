class TweetsController < ApplicationController
    def index
        #Buscamos todos los tweets y con el @ elegimos donde
        @tweets = Tweet.all
    end

    def show
        #mostrar los tweets de manera individual
        @tweet =Tweet.find params[:id]
    end
end