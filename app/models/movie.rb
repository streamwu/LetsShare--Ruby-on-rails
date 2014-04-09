class Movie < ActiveRecord::Base

  belongs_to :director
  has_and_belongs_to_many :actors
  
  has_many :pictures, :as => :imageable
  has_many :comments, :as => :commentable
  has_many :rates, :as => :rateable
  
  has_many :todoes, :as => :todoable
  has_many :dones, :as => :doneable
  has_many :beings, :as => :beingable
  

end
