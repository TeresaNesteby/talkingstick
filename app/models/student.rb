class Student < ActiveRecord::Base
  belongs_to :teacher
  belongs_to :period
  has_many :notes
end
