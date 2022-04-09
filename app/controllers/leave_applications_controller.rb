class LeaveApplicationsController < ApplicationController
    def index
        @leave_applications = LeaveApplication.all
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
            params.require(:leave_application).permit(:start_date, :end_date, :leave_reason, :user_id, :description, :status)
        end
        def leave_approver_params
            params.require(:leave_application).permit(:description, :status)
        end
end
