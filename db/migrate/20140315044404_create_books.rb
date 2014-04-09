class CreateBooks < ActiveRecord::Migration
  def change
    create_table :books do |t|
      t.string :title
      t.integer :year
      t.integer :pages, default: 0
      t.string :poster_url
      t.text :description
      t.integer :rating_num, default: 0
      t.integer :rating_score, default: 0
      t.string :source_url
      t.text :editorial_review

      t.belongs_to :author

      t.timestamps
    end
  end
end
