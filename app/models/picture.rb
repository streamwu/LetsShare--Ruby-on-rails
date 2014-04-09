class Picture < ActiveRecord::Base
	belongs_to :imageable, polymorphic:true
	has_many :comments, :as => :commentable
end
