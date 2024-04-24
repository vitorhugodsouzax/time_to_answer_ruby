class UsersBackoffice::ProfileController < ApplicationController
  before_action :set_user

  def edit
    @user.build_user_profille if @user.user_profille.blank?
  end

  def update
    if @user.update(params_for_user)
      bypass_sign_in(@user)
      unless params_user[:user_profille_attributes][:avatar]
        redirect_to users_backoffice_profile_path, notice: "Usuário atualizado com sucesso!"
      end
    else
      render :edit
    end    
  end

  private

  def set_user
    @user = current_user
  end

  def params_for_user
    params.require(:user).permit(:first_name, :last_name, :email, :password, :password_confirmation,
                                  user_profille_attributes: [:id, :address, :gender, :birthdate, :avatar])
  end

  def verify_password
    if params[:user][:password].blank? && params[:user][:password_confirmation].blank?
      params[:user].extract!(:password, :password_confirmation)
    end
  end
end
