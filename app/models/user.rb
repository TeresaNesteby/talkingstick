class User < ActiveRecord::Base
  has_secure_password
  has_many :students
  has_many :notes
  has_many :periods
end
