class SendMailAfterFiveMailer < ApplicationMailer
    def send_five(prof,event)
        @prof = prof
        @event = event
        mail(to: @prof.email, subject: "5 inscrits pour l'<%= @event.name %>!")
    end
end
