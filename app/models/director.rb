class Director < ActiveRecord::Base

  has_many :movies, :dependent => :nullify
  has_many :pictures, :as => :imageable

end
