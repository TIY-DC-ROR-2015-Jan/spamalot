class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  has_many :deliveries
  has_many :spams, through: :deliveries

  def send_spam_delivery!
    next_spams = find_undelivered 3
    SpamMailer.spam_aggregate(self, next_spams).deliver_later
    note_delivery next_spams
  end

  def find_undelivered count
    delivered = spams.pluck :id
    Spam.where.not(id: delivered).order("RANDOM()").first count
  end

  def note_delivery delivered
    # Delivery.create user: self, spam: s
    delivered.each { |s| spams.push s }
  end
end
