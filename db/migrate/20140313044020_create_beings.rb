class CreateBeings < ActiveRecord::Migration
  def change
    create_table :beings do |t|
      t.references :beingable, :polymorphic => true
      t.belongs_to :user
      
      t.timestamps
    end
  end
end
