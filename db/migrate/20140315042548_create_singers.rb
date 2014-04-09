class CreateSingers < ActiveRecord::Migration
  def change
    create_table :singers do |t|
      t.string :name
      t.string :birthdate
      t.string :gender
      t.string :country
      t.string :photo_url
      t.text   :bio

      t.timestamps
    end
  end
end
