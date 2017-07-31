class User < ActiveRecord::Base
  validates :first_name, presence: true
  validates :last_name, presence: true
  validates_formatting_of :email, :using => :email, presence: true, uniqueness: true
  validates_formatting_of :ssn, :using => :ssn, presence: true, uniqueness: true
end
