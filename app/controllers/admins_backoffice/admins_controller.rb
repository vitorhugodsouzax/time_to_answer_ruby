class AdminsBackoffice::AdminsController < AdminsBackofficeController
  def index
    @admins = Admin.all    #serve pra listar all admins
  end



  def edit
    @admin = Admin.find(params[:id])

  end

end
