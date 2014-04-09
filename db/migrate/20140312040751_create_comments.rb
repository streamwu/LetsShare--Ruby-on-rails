class CreateComments < ActiveRecord::Migration
  def change
    create_table :comments do |t|
      t.string :title
      t.text :content

      # :commentable_id, :commentable_type
      t.references :commentable, polymorphic: true
      # :user_id
      t.belongs_to :user

      t.timestamps
    end
  end
end
