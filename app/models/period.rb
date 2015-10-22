class Period < ActiveRecord::Base
  has_many :students
  belongs_to :teacher
  has_many :notes
end
