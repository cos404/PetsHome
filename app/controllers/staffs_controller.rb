class StaffsController < ApplicationController
  def index
    @staffs = ShelterStaff.joins(:user).select('users.username AS username', :role, :user_id).where(shelter_id: params[:shelter_id])

    render partial: "index", locals: {staffs: @staffs}, layout: false, status: :ok
  end

  def create
    @shelter = Shelter.find(params[:shelter_id])
    authorize @shelter

    @user = User.find_by(username: staff_params[:username])

    unless @user
      return render json: {error: "User not found!"}, status: :not_found
    end

    @staff = @shelter.shelter_staffs.new({user_id: @user.id, shelter_id: @shelter.id, role: staff_params[:role]})

    if @staff.save
      user_staff = {}
      user_staff[:id]        = @staff[:id]
      user_staff[:user_id]   = @staff[:user_id]
      user_staff[:role]      = @staff[:role]
      user_staff[:username]  = staff_params[:username]

      render partial: "staffs/show", locals: {staff: user_staff}, layout: false, status: :created
    else
      render json: {message: @staff.errors}, status: :bad_request
    end
  end

  private

  def staff_params
    params.require(:shelter_staff).permit(:username, :role)
  end

end
