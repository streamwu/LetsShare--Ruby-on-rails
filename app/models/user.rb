class User < ActiveRecord::Base
    has_secure_password

    has_many :pictures, as: :imgeable
	has_many :diaries

	has_many :comments
	has_many :questions
	has_many :rates
	has_many :replies
	
	has_many :todoes
	has_many :dones
	has_many :beings

	has_and_belongs_to_many :groups
end
