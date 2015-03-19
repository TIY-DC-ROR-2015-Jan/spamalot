class DeliveriesController < ApplicationController
  def new
  end

  def create
    current_user.send_spam_delivery!
    flash[:success] = "Spam on the way!"
    redirect_to :back
  end
end
