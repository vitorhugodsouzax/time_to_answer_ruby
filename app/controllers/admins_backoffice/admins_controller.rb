class AdminsBackoffice::AdminsController < AdminsBackofficeController
  def index
    @admins = Admin.all    #serve pra listar all admins
  end
end
