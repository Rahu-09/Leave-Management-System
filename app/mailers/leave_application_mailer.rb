class LeaveApplicationMailer < ApplicationMailer

    def send_application_mail(leave)
        user = leave.user
        # binding.pry
        mail(to: user.email, subject: 'Leave Application')

    #    send_to(user: user, subject: 'Chutti de do malik') 
    end
end
