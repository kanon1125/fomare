class AddYoutubeUrlToTweets < ActiveRecord::Migration[6.1]
  def change
    add_column :tweets, :youtube_url, :string
  end
end
