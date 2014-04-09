class CreateDiaries < ActiveRecord::Migration
  def change
    create_table :diaries do |t|
      t.string :title
      t.text :content
      
      t.belongs_to :user

      t.timestamps
    end
  end
end
