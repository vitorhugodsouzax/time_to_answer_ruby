class AdminsBackoffice::SubjectsController < AdminsBackofficeController
    # Antes de executar as ações 'edit' e 'update', chama o método 'set_subject'
    before_action :set_subject, only: [:edit, :update, :destroy]
  
    # Ação para listar todos os assuntos
    def index
      @subjects = Subject.all.page(params[:page]) # Lista todos os assuntos
    end
  
    # Ação para criar um novo assunto
    def new
      @subject = Subject.new
    end
  
    # Ação para criar um novo assunto no banco de dados
    def create
      @subject = Subject.new(params_subject)
      if @subject.save
        redirect_to admins_backoffice_subjects_path, notice: "Assunto/área cadastrado com sucesso!"
      else
        render :new
      end
    end
  
    # Ação para carregar os dados de um assunto existente para edição
    def edit
    end
  
    # Ação para atualizar os dados de um assunto existente
    def update
      if @subject.update(params_subject)
        redirect_to admins_backoffice_subjects_path, notice: "Assunto/área atualizado com sucesso!"
      else
        render :edit
      end
    end
  
    # Ação para excluir um assunto existente
    def destroy
      if @subject.destroy
        redirect_to admins_backoffice_subjects_path, notice: "Assunto/área excluído com sucesso!"
      else
        redirect_to admins_backoffice_subjects_path, alert: "Erro ao excluir o assunto/área!"
      end
    end
  
    private
  
    # Método privado para definir os parâmetros aceitáveis para um assunto
    def subject_params
      params.require(:subject).permit(:description)
    end
  
    # Método privado para encontrar e definir o assunto com base no ID fornecido
    def set_subject
      @subject = Subject.find(params[:id])
    end
  end
  