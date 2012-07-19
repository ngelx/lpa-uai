class Student < ActiveRecord::Base
  attr_accessible :dni, :name
  has_many :expedients
end
