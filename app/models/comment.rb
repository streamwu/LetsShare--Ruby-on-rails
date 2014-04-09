class Comment < ActiveRecord::Base
	belongs_to :commentable, polymorphic: true
	belongs_to :user

	has_many :replies, :as => :repliable
end
