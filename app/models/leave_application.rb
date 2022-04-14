class LeaveApplication < ApplicationRecord
    belongs_to :user
    belongs_to :leave_type
    validates :start_date, presence: true
    validates :end_date, presence: true

    validate :end_date_is_after_start_date
    after_create :send_leave_mail

    def send_leave_mail
        LeaveApplicationMailer.send_application_mail(self).deliver_now
    end

    private

    def end_date_is_after_start_date
        if end_date < start_date
        errors.add(:end_date, 'cannot be before the start date')
        end
    end
end
