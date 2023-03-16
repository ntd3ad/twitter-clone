class TweetsController < ApplicationController
  before_action :authenticate_user!

  def show
    @tweet = Tweet.find(params[:id])
    @tweet_presenter = TweetPresenter.new(tweet: @tweet, current_user: current_user)
  end

  def create
    @tweet = Tweet.new(tweet_params.merge(user: current_user))

    if @tweet.save
      respond_to do |format|
        format.turbo_stream
        format.html {redirect_to dashboard_path}
      end
    end
  end

  def destroy
    @tweet = Tweet.find(params[:tweet_presenter])
    @tweet.destroy
    redirect_to '/dashboard'
  end

  private
  def tweet_params
    params.require(:tweet).permit(:body)
  end

end
