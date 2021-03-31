require "rails_helper"

RSpec.describe FriendNotifierMailer, type: :mailer do
  describe "inform" do
    sending_user = User.create(
      username: "newuser",
      email: "newuser@email.com",
      password: "123"
    )

    email_info = {
      user: sending_user,
      friend: "user2",
      message: "Event Details: Name: Event Party Duration: 300 Start Time: "
    }

    let(:mail) { FriendNotifierMailer.inform(email_info, "user2@email.com") }

    it "renders the headers" do
      expect(mail.subject).to eq("newuser is inviting you to a viewing party")
      expect(mail.to).to eq(["user2@email.com"])
      expect(mail.from).to eq(["from@example.com"])
      expect(mail.reply_to).to eq(["newuser@email.com"])
    end

    it "renders the body" do
      expect(mail.text_part.body.to_s).to include("Hello user2")
      expect(mail.text_part.body.to_s).to include("newuser is inviting you to a viewing party: Event Details: Name: Event Party Duration: 300 Start Time: ")

      expect(mail.html_part.body.to_s).to include("Hello user2")
      expect(mail.html_part.body.to_s).to include("newuser is inviting you to a viewing party: Event Details: Name: Event Party Duration: 300 Start Time: ")

      expect(mail.body.encoded).to include("Hello user2")
      expect(mail.body.encoded).to include("newuser is inviting you to a viewing party: Event Details: Name: Event Party Duration: 300 Start Time: ")
    end
  end
end
