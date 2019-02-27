class CreateEvents < ActiveRecord::Migration[6.0]
  def change
    create_table :events do |t|
      t.references :conference, foreign_key: true
      t.string :city
      t.string :country
      t.date :starts_on
      t.date :ends_on
      t.string :time_zone
      t.string :hashtag
      t.string :google_map_url
      t.string :cfp_url
      t.date :cfp_ends_on

      t.timestamps
    end
  end
end
