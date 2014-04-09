class Group < ActiveRecord::Base
	#creater
	belongs_to :user
	
	# the members
	has_and_belongs_to_many :users
	# the topics(denoted as comment class here)
	has_many :comments, :as => :commentable

end
