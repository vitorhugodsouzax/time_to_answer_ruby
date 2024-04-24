class UsersBackoffice::WelcomeController < UsersBackofficeController
  def index
    @user_statistic = current_user.user_statistic || UserStatistic.new
  end
end