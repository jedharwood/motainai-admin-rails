# frozen_string_literal: true

require 'rails_helper'

RSpec.describe ProfileMailer, type: :mailer do
  describe "update_profile" do
    let(:user) { create(:user) }
    let(:mail) { ProfileMailer.with(user: user).update_profile }

    it "renders the headers" do
      expect(mail.subject).to eq("Please update your profile")
      expect(mail.to).to eq([user.email])
      expect(mail.from).to eq(["admin1@motainai.co.jp"])
    end

    it "renders the text body" do
      expect(mail.body.parts[0].encoded).to match("Content-Type: text/plain;\r\n charset=UTF-8\r\nContent-Transfer-Encoding: 7bit\r\n\r\nWelcome to Motainai Admin, plan_2@fromouterspace.com\r\n===============================================\r\n\r\nYou have successfully signed up to Motainai Admin,\r\nyour username is: plan_2@fromouterspace.com.\r\n\r\nIf you have not already filled in your profile information please click the following link: <a href=\"http://localhost:5000/profile/#{user.profile.id}/edit\">http://localhost:5000/profile/#{user.profile.id}/edit</a>.\r\n\r\nYou will be contacted once an administrator has approved your account.\r\n\r\n")
    end

    it "renders the html body" do
      expect(mail.body.parts[1].encoded).to match("Content-Type: text/html;\r\n charset=UTF-8\r\nContent-Transfer-Encoding: 7bit\r\n\r\n<!DOCTYPE html>\r\n<html>\r\n  <head>\r\n    <meta http-equiv=\"Content-Type\" content=\"text/html; charset=utf-8\" />\r\n    <style>\r\n      /* Email styles need to be inline */\r\n    </style>\r\n  </head>\r\n\r\n  <body>\r\n    <!DOCTYPE html>\r\n<html>\r\n  <head>\r\n    <meta content='text/html; charset=UTF-8' http-equiv='Content-Type' />\r\n  </head>\r\n  <body>\r\n    <h1>Welcome to Motainai Admin, plan_3@fromouterspace.com</h1>\r\n    <p>\r\n      You have successfully signed up to Motainai Admin,\r\n      your username is: plan_3@fromouterspace.com.<br>\r\n    </p>\r\n    <p>\r\n      If you have not already filled in your profile information please click the following link: <a href=\"http://localhost:5000/profile/#{user.profile.id}/edit\">http://localhost:5000/profile/#{user.profile.id}/edit</a>.\r\n    </p>\r\n    <p>You will be contacted once an administrator has approved your account.</p>\r\n  </body>\r\n</html>\r\n\r\n  </body>\r\n</html>\r\n")
    end
  end

  describe "profile_approved" do
    let(:user) { create(:user) }
    let(:mail) { ProfileMailer.with(user: user).profile_approved }

    it "renders the headers" do
      expect(mail.subject).to eq("Profile approved")
      expect(mail.to).to eq([user.email])
      expect(mail.from).to eq(["admin1@motainai.co.jp"])
    end
# make a context here and and set up profile 'before'?
    it "renders the text body" do
      user.profile.update(first_name: 'Cliff', last_name: 'Burton')
      expect(mail.body.parts[0].encoded).to match("Content-Type: text/plain;\r\n charset=UTF-8\r\nContent-Transfer-Encoding: 7bit\r\n\r\nWelcome to Motainai Admin, Cliff Burton\r\n===============================================\r\n\r\nYour account has been approved,\r\nyour username is: plan_5@fromouterspace.com.\r\n\r\nYou can sign in at the following link: <a href=\"http://localhost:5000\">http://localhost:5000</a>.\r\n\r\nWelcome aboard.\r\n\r\n\r\n\r\n")
    end

    it "renders the html body" do
      user.profile.update(first_name: 'Cliff', last_name: 'Burton')
      expect(mail.body.parts[1].encoded).to match("Content-Type: text/html;\r\n charset=UTF-8\r\nContent-Transfer-Encoding: 7bit\r\n\r\n<!DOCTYPE html>\r\n<html>\r\n  <head>\r\n    <meta http-equiv=\"Content-Type\" content=\"text/html; charset=utf-8\" />\r\n    <style>\r\n      /* Email styles need to be inline */\r\n    </style>\r\n  </head>\r\n\r\n  <body>\r\n    <!DOCTYPE html>\r\n<html>\r\n  <head>\r\n    <meta content='text/html; charset=UTF-8' http-equiv='Content-Type' />\r\n  </head>\r\n  <body>\r\n    <h1>Welcome to Motainai Admin, Cliff Burton</h1>\r\n    <p>\r\n      Your account has been approved,\r\n      your username is: plan_6@fromouterspace.com.<br>\r\n    </p>\r\n    <p>\r\n      You can sign in at the following link: <a href=\"http://localhost:5000\">http://localhost:5000</a>.\r\n    </p>\r\n    <p>Welcome aboard.</p>\r\n  </body>\r\n</html>\r\n\r\n  </body>\r\n</html>\r\n")
    end
  end

  describe "approval_revoked" do
    let(:user) { create(:user) }
    let(:mail) { ProfileMailer.with(user: user).approval_revoked }

    it "renders the headers" do
      expect(mail.subject).to eq("Approval revoked")
      expect(mail.to).to eq([user.email])
      expect(mail.from).to eq(["admin1@motainai.co.jp"])
    end

    it "renders the text body" do
      user.profile.update(first_name: 'Cliff', last_name: 'Burton')
      expect(mail.body.parts[0].encoded).to match("Content-Type: text/plain;\r\n charset=UTF-8\r\nContent-Transfer-Encoding: 7bit\r\n\r\nWe're sorry to see you go, Cliff Burton\r\n===============================================\r\n\r\nYour approval has been revoked for the username: plan_8@fromouterspace.com.\r\n\r\nIf you believe this is the result of an error please contact an admin at: <a href=\"http://localhost:5000\">http://localhost:5000</a> or by replying to this email.\r\n\r\nThankyou\r\n\r\n")
    end

    it "renders the html body" do
      user.profile.update(first_name: 'Cliff', last_name: 'Burton')
      expect(mail.body.parts[1].encoded).to match("Content-Type: text/html;\r\n charset=UTF-8\r\nContent-Transfer-Encoding: 7bit\r\n\r\n<!DOCTYPE html>\r\n<html>\r\n  <head>\r\n    <meta http-equiv=\"Content-Type\" content=\"text/html; charset=utf-8\" />\r\n    <style>\r\n      /* Email styles need to be inline */\r\n    </style>\r\n  </head>\r\n\r\n  <body>\r\n    <!DOCTYPE html>\r\n<html>\r\n  <head>\r\n    <meta content='text/html; charset=UTF-8' http-equiv='Content-Type' />\r\n  </head>\r\n  <body>\r\n    <h1>We're sorry to see you go, Cliff Burton</h1>\r\n    <p>\r\n      Your approval has been revoked for the username: plan_9@fromouterspace.com.<br>\r\n    </p>\r\n    <p>\r\n      If you believe this is the result of an error please contact an admin at: <a href=\"http://localhost:5000\">http://localhost:5000</a> or by replying to this email.\r\n    </p>\r\n    <p>Thankyou.</p>\r\n  </body>\r\n</html>\r\n\r\n  </body>\r\n</html>\r\n")
    end
  end
end

