class Author < ActiveRecord::Base
  has_many :books, :dependent => :nullify
end
