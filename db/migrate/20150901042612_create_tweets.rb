class CreateTweets < ActiveRecord::Migration
  def change
    create_table :tweets do |t|
      t.string :user_id
      t.string :body

      t.timestamps
    end
  end
end
