class Todo < ActiveRecord::Base
	belongs_to :todoable, :polymorphic => true
	belongs_to :user
end
