require 'rails_helper'

describe User do
  before :each do
    @user = FactoryGirl.create :user
    10.times { FactoryGirl.create :spam }
  end

  it "can find undelivered" do
    expect(@user.spams.count).to eq 0
    ss = @user.find_undelivered 5
    expect(ss.length).to eq 5
  end

  it "can send a spam email" do
    @user.send_spam_delivery!
    expect(@user.deliveries.count).to eq 3

    expect(ActionMailer::Base.deliveries.count).to eq 1

    mail = ActionMailer::Base.deliveries.first
    expect(mail.to).to eq [@user.email]

    html = mail.html_part.body.raw_source
    @user.spams.each do |s|
      expect(html).to include s.url
    end
  end
end
