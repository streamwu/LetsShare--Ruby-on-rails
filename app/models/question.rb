class Question < ActiveRecord::Base
	belongs_to :questionable, polymorphic:true
	belongs_to :user

	has_many :replies, :as => :repliable
end
