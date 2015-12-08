class TweetsController < ApplicationController

  before_action :set_tweet, only: [:show, :edit, :update, :destroy]


  def index
    @tweets = Tweet.all
  end

  def show
  end

  def edit
  end

  def new
    @tweet = Tweet.new
  end

  def create
    @tweet = Tweet.new(tweet_params)

    responds_to do |format|
      if @tweet.save
        format.html {redirect_to @tweet,
        notice: 'Tweet was successfully created.'}
      else
        format.html {render :new}
      end
    end
  end

private

      def set_tweet
        @tweet = Tweet.find(params[:id])
      end


   def tweet_params
     params.require(:tweet).permit(:message, :user_id)
   end

 end
