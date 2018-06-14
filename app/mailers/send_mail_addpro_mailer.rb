class SendMailAddproMailer < ApplicationMailer
    def notify_addpro(prof,event)
       
        @event = event
        mail(to: @email_prof.email, subject: "tu es invité a l'event <%= @event.name %>!")
    end
end


