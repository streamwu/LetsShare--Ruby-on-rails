class Done < ActiveRecord::Base
	belongs_to :doneable, :polymorphic => true
	belongs_to :user
end
