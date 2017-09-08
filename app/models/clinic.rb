class Clinic < ActiveRecord::Base
  validates :name, presence: true
  validates :address, presence: true
  has_and_belongs_to_many :doctor
end
