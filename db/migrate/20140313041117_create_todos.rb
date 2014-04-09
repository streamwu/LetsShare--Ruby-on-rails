class CreateTodos < ActiveRecord::Migration
  def change
    create_table :todos do |t|
      t.references :todoable, :polymorphic => true
      t.belongs_to :user
      
      t.timestamps
    end
  end
end
