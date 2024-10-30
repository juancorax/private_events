class AttendancesController < ApplicationController
  before_action :authenticate_user!, only: [ :create, :destroy ]

  def create
    @attendance = current_user.attendances.build(attended_event_id: attendance_params[:event_id])

    if @attendance.save
      redirect_to user_path(current_user.id), notice: "Attendance added"
    else
      redirect_to user_path(current_user.id), alert: "Try again later..."
    end
  end

  def destroy
    @attendance = Attendance.find(params[:id])
    @attendance.destroy!

    redirect_to user_path(current_user.id), notice: "Attendance removed"
  end

  private
    def attendance_params
      params.require(:attendance).permit(:event_id)
    end
end
