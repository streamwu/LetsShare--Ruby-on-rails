class CreateRates < ActiveRecord::Migration
  def change
    create_table :rates do |t|
      t.integer :score

      t.references :rateable, :polymorphic => true
      t.belongs_to :user
      
      t.timestamps
    end
  end
end
