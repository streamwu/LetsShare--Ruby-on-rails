class CreatePictures < ActiveRecord::Migration
  def change
    create_table :pictures do |t|
      t.string :pic_url
      t.text :pic_comment

      # :imageable_id, :imageable_type
      t.references :imageable, polymorphic: true

      t.timestamps
    end
  end
end
