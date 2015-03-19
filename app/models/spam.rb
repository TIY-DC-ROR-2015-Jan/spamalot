class Spam < ActiveRecord::Base
  validates :url, presence: true, uniqueness: true

  has_many :deliveries
  has_many :users, through: :deliveries
end
