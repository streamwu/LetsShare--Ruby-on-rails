class Diary < ActiveRecord::Base
	belongs_to :user
	has_many :replies, :as => :repliable
end
