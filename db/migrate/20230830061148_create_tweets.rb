class CreateTweets < ActiveRecord::Migration[6.1]
  def change
    create_table :tweets do |t|
      t.string :singer
      t.string :song
      t.text :about

      t.timestamps
    end
  end
end
