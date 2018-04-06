class StaffsController < ApplicationController
  def index
    @staffs = ShelterStaff.joins(:user).select('users.username AS username', :role, :user_id, :id).where(shelter_id: params[:shelter_id])

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
      _staff = {}
      _staff[:id]        = @staff[:id]
      _staff[:user_id]   = @staff[:user_id]
      _staff[:role]      = @staff[:role]
      _staff[:username]  = staff_params[:username]

      render partial: "staffs/show", locals: {staff: _staff}, layout: false, status: :created
    else
      render json: {message: @staff.errors}, status: :bad_request
    end
  end

  def destroy
    @staff = ShelterStaff.find(params[:id])
    authorize @staff

    if @staff.destroy
      render json: @staff, status: :ok
    else
      render js: "alert('error deleting staff');"
    end
  end

  private

  def staff_params
    params.require(:shelter_staff).permit(:username, :role)
  end

end
