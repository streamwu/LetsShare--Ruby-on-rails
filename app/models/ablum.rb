class Ablum < ActiveRecord::Base

  belongs_to :singer
  
  has_many :comments, :as => :commentable
  has_many :rates, :as => :rateable
  
  has_many :todoes, :as => :todoable
  has_many :dones, :as => :doneable
  has_many :beings, :as => :beingable

  has_many :songs

end
