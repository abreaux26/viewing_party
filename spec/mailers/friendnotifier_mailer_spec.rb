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
      message: "Event Details: Name: Movie Name Host: newuser Duration: 300 Start Time: April 1, 2021 09:30 AM"
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
      expect(mail.text_part.body.to_s).to include("newuser is inviting you to a viewing party: Event Details: Name: Movie Name Host: newuser Duration: 300 Start Time: April 1, 2021 09:30 AM")

      expect(mail.html_part.body.to_s).to include("Hello user2")
      expect(mail.html_part.body.to_s).to include("newuser is inviting you to a viewing party: Event Details: Name: Movie Name Host: newuser Duration: 300 Start Time: April 1, 2021 09:30 AM")

      expect(mail.body.encoded).to include("Hello user2")
      expect(mail.body.encoded).to include("newuser is inviting you to a viewing party: Event Details: Name: Movie Name Host: newuser Duration: 300 Start Time: April 1, 2021 09:30 AM")
    end
  end
end
