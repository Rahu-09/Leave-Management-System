class LeaveApplication < ApplicationRecord
    belongs_to :user
    has_one :leave_type
end
