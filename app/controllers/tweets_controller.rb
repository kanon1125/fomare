class TweetsController < ApplicationController
  before_action :authenticate_user! 
  def index
    @tweets = Tweet.all
    if params[:search] == nil
      @tweets= Tweet.all
    elsif params[:search] == ''
      @tweets= Tweet.all
    else
      #部分検索
      @tweets = Tweet.where("singer LIKE ? OR song LIKE ?","%#{params[:search]}%", "%#{params[:search]}%")
    end
  if params[:tag_ids]
    @tweets = []
    params[:tag_ids].each do |key, value|      
      @tweets += Tag.find_by(name: key).tweets if value == "1"
    end
    @tweets.uniq!
  end

end
  def new 
    @tweet = Tweet.new
  end

  def create
    tweet = Tweet.new(tweet_params)
    tweet.user_id = current_user.id 
    if tweet.save!
      redirect_to :action => "index"
    else
      redirect_to :action => "new"
    end
  end
  
  def show 
    @tweet = Tweet.find(params[:id])
  end

  def edit
    @tweet = Tweet.find(params[:id])
  end

  private
  def tweet_params
    params.require(:tweet).permit(:singer, :song, :about, :youtube_url, tag_ids: [])
  end
end
