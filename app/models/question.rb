class Question < ApplicationRecord
  # Define a relação entre Question e Subject, onde Question pertence a um Subject.
  # A opção inverse_of especifica o nome do relacionamento inverso em Subject.
  belongs_to :subject, inverse_of: :questions
  
  # Define a relação entre Question e Answer, onde uma Question tem muitas Answers.
  has_many :answers
  
  # Permite que os atributos aninhados de Answers sejam aceitos ao criar ou atualizar uma Question.
  # O parâmetro :reject_if => :all_blank indica que os atributos de Answer serão rejeitados se estiverem em branco.
  # O parâmetro :allow_destroy => true permite a destruição de Answers associados através da Question.
  accepts_nested_attributes_for :answers, reject_if: :all_blank, allow_destroy: true


# Kaminari
 paginates_per 5


# Scopes

# Este escopo realiza uma pesquisa baseada em um termo fornecido.
# Ele traz todas as perguntas que contenham o termo pesquisado na descrição.
scope :_search_, ->(page, term) {
  includes(:answers) # Inclui as respostas associadas às perguntas para evitar consultas N+1
  .where("lower(description) LIKE ?", "%#{term.downcase}%") # Filtra as perguntas com descrições que contenham o termo pesquisado (insensível a maiúsculas e minúsculas)
  .page(page) # Pagina os resultados para a página especificada
}

# Este escopo traz as últimas perguntas ordenadas por data de criação.
scope :last_questions, ->(page) {
  includes(:answers) # Inclui as respostas associadas às perguntas para evitar consultas N+1
  .order('created_at desc') # Ordena as perguntas pela data de criação em ordem decrescente
  .page(page) # Pagina os resultados para a página especificada
}

end
