class Reply < ActiveRecord::Base
	belongs_to :repliable, :polymorphic => true
	belongs_to :user

	#reply has many replies
	has_many :replies, :as => :repliable
end
