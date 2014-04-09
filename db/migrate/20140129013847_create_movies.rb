class CreateMovies < ActiveRecord::Migration
  def change
    create_table :movies do |t|
      t.string :title
      t.integer :year
      t.integer :duration, default: 0
      t.string :poster_url
      t.text :plot
      t.string :trailer_url
      t.integer :rating_num, default: 0
      t.integer :rating_score, default: 0
      t.string :official_website
      t.string :video_url

      t.belongs_to :director

      

      t.timestamps
    end
  end
end
