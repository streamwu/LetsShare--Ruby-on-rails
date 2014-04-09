class CreateQuestions < ActiveRecord::Migration
  def change
    create_table :questions do |t|
      t.string :title
      t.text :content

      t.references :questionable, polymorphic: true
      t.belongs_to :user

      t.timestamps
    end
  end
end
