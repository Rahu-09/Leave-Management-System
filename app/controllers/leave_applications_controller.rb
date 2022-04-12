require 'date'
class LeaveApplicationsController < ApplicationController
    def index
        @leave_applications = LeaveApplication.all
        @leavetypes=LeaveType.all
        # @grp = ActiveRecord::Base.connection.execute("select leave_type_id, count(*) from leave_applications where user_id=#{current_user.id} group by leave_type_id")
        # @grp=User.find_by_id(current_user.id).leave_applications.group(:leave_type_id).count
        @grp=Hash.new
        @leavetypes.each do |leavetype|
            @grp[leavetype.id]=0
        end
        @leave_applications.each do |leave_application|
            @grp[leave_application.leave_type_id]+=(Date.parse('15-08-2000')-Date.parse('15-08-2000')).to_i+1
        end
    end
    
    def new
        @leave_application = current_user.leave_applications.build
    end
    
    def create
        @leave_application=current_user.leave_applications.build(leave_application_params)
        if @leave_application.save
            redirect_to leave_applications_path
          else
            render :new, status: :unprocessable_entity
        end
    end

    def approver
        @leave_applications = LeaveApplication.all
        # @grp=LeaveApplication.select(:current_user.id).group_by(:leave_type_id).count
    end

    def edit
        @leave_application = LeaveApplication.find(params[:id])
    end
    
    def update
    @leave_application = LeaveApplication.find(params[:id])
    
        if @leave_application.update(leave_approver_params)
          redirect_to leave_applications_path
        else
          render :edit, status: :unprocessable_entity
        end
    end

    def destroy
        @leave_application = current_user.leave_applications.find(params[:id])
        @leave_application.destroy
        redirect_to leave_applications_path, status: 303
    end
    
    private
    def leave_application_params
        params.require(:leave_application).permit(:start_date, :end_date, :leave_reason, :leave_type_id, :user_id, :description, :status)
    end
    def leave_approver_params
        params.require(:leave_application).permit(:description, :status)
    end
end
