class LeaveApplication < ApplicationRecord
    belongs_to :user
    belongs_to :leave_type
    after_create :send_leave_mail

    def send_leave_mail
        LeaveApplicationMailer.send_application_mail(self).deliver_now
    end
end
