class AdminsBackoffice::AdminsController < AdminsBackofficeController
  # Antes de executar a ação 'update', chama o método 'verify_password'
  before_action :verify_password, only: [:update]
  # Antes de executar as ações 'edit' e 'update', chama o método 'set_admin'
  before_action :set_admin, only: [:edit, :update]

  # Ação para listar todos os administradores
  def index
    @admins = Admin.all    # Serve para listar todos os administradores
  end

  # Ação para criar um novo administrador
  def new
    @admin = Admin.new
  end

  # Ação para criar um novo administrador no banco de dados
  def create
    @admin = Admin.new(params_admin)
    if @admin.save()
      redirect_to admins_backoffice_admins_path, notice: "Administrador cadastrado com sucesso!"
    else
      render :new
    end
  end

  # Ação para carregar os dados de um administrador existente para edição
  def edit
  end

  # Ação para atualizar os dados de um administrador existente
  def update
    if @admin.update(params_admin)
      redirect_to admins_backoffice_admins_path, notice: "Administrador atualizado com sucesso!"
    else
      render :edit
    end
  end

  private

  # Método privado para definir os parâmetros aceitáveis para um administrador
  def params_admin
    params.require(:admin).permit(:email, :password, :password_confirmation)
  end

  # Método privado para encontrar e definir o administrador com base no ID fornecido
  def set_admin
    @admin = Admin.find(params[:id])
  end
  
  # Método privado para verificar se a senha e a confirmação de senha estão em branco
  # e removê-las dos parâmetros, se estiverem
  def verify_password 
    if params[:admin][:password].blank? && params[:admin][:password_confirmation].blank? 
      params[:admin].extract!(:password, :password_confirmation)
    end
  end
end
