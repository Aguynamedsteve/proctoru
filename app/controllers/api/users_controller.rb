class Api::UsersController < ApplicationController
  before_action :log_api_request

  # GET /users
  def index
    college = College.find_by_id(params[:college_id])
    exam = Exam.find_by_id(params[:exam_id])
    
    return bad_request_status("College not found.") if college.nil?
    return bad_request_status("Exam not found.") if exam.nil?
    return bad_request_status("This Exam has already ended.") unless exam.exam_window.falls_within_time_window? params[:start_time]
    return bad_request_status("#{college.name} is not currently offering this exam.") unless college.id == exam.college_id

    user = User.find_or_create_by(
                                    first_name: params[:first_name], 
                                    last_name: params[:last_name], 
                                    phone_number: params[:phone_number],
                                    college_id: params[:college_id]
                                  )
    user.update(exam_id: exam.id)

    render json: { status: "200 OK", message: "Success" }, status: 200
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_user
    @user = User.find(params[:id])
  end

  # Only allow a trusted parameter "white list" through.
  def user_params
    params.require(:user).permit(:first_name, :last_name, :phone_number)
  end

  def bad_request_status message
    render json: { status: "400 Bad Request", message: message }, status: 400
  end

  def log_api_request
    ApiRequest.create(
      endpoint: request.fullpath,
      remote_ip: request.remote_ip,
      payload: params,
      created_at: Time.now.iso8601
    )
  end
end
