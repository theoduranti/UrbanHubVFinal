class SubscribeToEventMailer < ApplicationMailer
    def send_mail_after_subscribing(user, event)
        @user = user
        
        @event = Event.find(params[:id])
        mail(to: @user.email, subject: "you subscribed to the event named <% @event.name %>")
    end
end
