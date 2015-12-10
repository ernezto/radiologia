class Clinic < ActiveRecord::Base
  validates :name, presence: true
end
