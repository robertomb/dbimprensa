class Vehicle < ActiveRecord::Base
	belongs_to :users
	has_many :journalists

end
