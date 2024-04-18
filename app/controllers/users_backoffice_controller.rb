class UsersBackofficeController < ApplicationController
    before_action :authenticate_user!
    before_action :build_profile
  layout 'users_backoffice'

  private

  def build_profile
    current_user.build_user_profille if current_user.user_profille.blank?
  end
end
