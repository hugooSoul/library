class UsersController < ApplicationController

  before_action :authenticate_user!, only: [:destroy]
  before_action :is_admin?, except: [:show, :update]

  def destroy
    @user = User.find(params[:id])

    if @user.destroy
      respond_to do |format|
        format.html { redirect_to admin_users_path }
        flash[:alert] = "User deleted"
        format.json { head :no_content }
      end
    end
  end



  private

  def is_admin?
    if current_user.admin? != true
      respond_to do |format|
        format.html { redirect_to root_path, flash: { notice: "No no no, you aren't authorized for this option!"} }
      end
    end
  end

end
