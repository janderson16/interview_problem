class User < ActiveRecord::Base
  validates :first_name, presence: true
  validates :last_name, presence: true
  validates :email, presence: true
  validates :ssn, presence: true
  validates_with EmailAddress::ActiveRecordValidator, field: :email
end
