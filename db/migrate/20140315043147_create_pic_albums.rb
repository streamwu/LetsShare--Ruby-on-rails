class CreatePicAlbums < ActiveRecord::Migration
  def change
    create_table :pic_albums do |t|
      t.string :title
      t.string :description
      t.string :cover
      
      t.belongs_to :user	

      t.timestamps
    end
  end
end
