class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  has_many :deliveries
  has_many :spams, through: :deliveries

  def send_spam_delivery!
    # FIXME: implement
    SpamMailer.spam_aggregate(self).deliver_now
  end
end
