class CreateAblums < ActiveRecord::Migration
  def change
    create_table :ablums do |t|
      t.string :title
      t.integer :year
      t.integer :duration
      t.string :poster_url
      t.integer :rating_num, default: 0
      t.integer :rating_score, default: 0
      t.string :source_url

      t.belongs_to :singer	

      t.timestamps
    end
  end
end
