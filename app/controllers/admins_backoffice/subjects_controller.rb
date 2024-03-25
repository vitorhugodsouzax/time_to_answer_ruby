class AdminsBackoffice::SubjectsController < AdminsBackofficeController
    # Antes de executar a ação 'update', chama o método 'verify_password'

    # Antes de executar as ações 'edit' e 'update', chama o método 'set_subjects'
    before_action :set_subjects, only: [:edit, :update, :destroy]
  
    # Ação para listar todos os administradores
    def index
      @subjects = Subjects.all .page params[:page] # Serve para listar todos os administradores
      end
  
    # Ação para criar um novo administrador
    def new
      @subject = Subject.new
    end
  
    # Ação para criar um novo administrador no banco de dados
    def create
      @subject = Subject.new(params_subject)
      if @subject.save()
        redirect_to admins_backoffice_subjects_path, notice: "Administrador cadastrado com sucesso!"
      else
        render :new
      end
    end
  
    # Ação para carregar os dados de um administrador existente para edição
    def edit
    end
  
    # Ação para atualizar os dados de um administrador existente
    def update
      if @subject.update(params_subject)
        redirect_to admins_backoffice_subjects_path, notice: "Assunto/area atualizado com sucesso!"
      else
        render :edit
      end
    end
  
    def destroy
      if @subject.destroy
      redirect_to admins_backoffice_subjects_path, notice:
     "Assunto/area excluído com sucesso!"
      else
      render :index
      end
      end
  
    private
  
    # Método privado para definir os parâmetros aceitáveis para um administrador
    def params_subject
      params.require(:subject).permit(:description)
    end
  
    # Método privado para encontrar e definir o administrador com base no ID fornecido
    def set_subjects
      @subject = Subject.find(params[:id])
    end
    
  end
  