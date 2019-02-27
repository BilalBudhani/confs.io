class CreateConferences < ActiveRecord::Migration[6.0]
  def change
    create_table :conferences do |t|
      t.string :name
      t.string :username
      t.string :twitter_screen_name
      t.string :twitter_id
      t.string :website

      t.timestamps
    end
  end
end
