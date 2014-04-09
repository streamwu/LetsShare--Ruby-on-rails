class CreateReplies < ActiveRecord::Migration
  def change
    create_table :replies do |t|
      t.text :content

      t.references :repliable, :polymorphic => true
      t.belongs_to :user

      t.timestamps
    end
  end
end
