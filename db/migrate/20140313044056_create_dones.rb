class CreateDones < ActiveRecord::Migration
  def change
    create_table :dones do |t|
      t.references :doneable, :polymorphic => true
      t.belongs_to :user
      
      t.timestamps
    end
  end
end
