class Actor < ActiveRecord::Base
  has_and_belongs_to_many :movies
  has_many :pictures, :as => :imageable

end
