class FriendNotifierMailer < ApplicationMailer
  def inform(info, recipient)
    @user = info[:user]
    @message = info[:message]
    @friend = info[:friend]

    mail(
      reply_to: @user.email,
      to: recipient,
      subject: "#{@user.username} is inviting you to a viewing party"
    )
  end
end
