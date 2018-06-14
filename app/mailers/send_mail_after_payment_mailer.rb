class SendMailAfterPaymentMailer < ApplicationMailer
    def notify(user, event)
        @user = user
        @event = event
        mail(to: @user.email, subject: "you paid and confirmed your presence to the event named <%= @event.name %>")
end
