class Users::RegistrationsController < Devise::RegistrationsController

  private

  def sign_up_params
    params.require(resource_name).permit(:name, :last_name, :email, :password, :password_confirmation)
  end
end
