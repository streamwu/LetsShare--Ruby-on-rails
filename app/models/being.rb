class Being < ActiveRecord::Base
	belongs_to :beingable, :polymorphic => true
	belongs_to :user
end
