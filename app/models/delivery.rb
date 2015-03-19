class Delivery < ActiveRecord::Base
  belongs_to :user
  belongs_to :spam

  validates :user, presence: true
  validates :spam, presence: true, uniqueness: { scope: :user }
end
