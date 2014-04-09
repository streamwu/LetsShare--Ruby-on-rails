class CreateGroups < ActiveRecord::Migration
  def change
    create_table :groups do |t|
      t.string :title
      t.string :photo_url
      t.text :description	
      t.belongs_to :user
      
      t.timestamps
    end
  end
end
