class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :name
      t.string :email
      t.string :password_digest
      t.string :photo_url, :default => "userDefault.jpg"
      t.string :locations

      t.timestamps
    end
  end
end
