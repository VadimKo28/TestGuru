class Admin::AnswersController < Admin::BaseController
  before_action :find_question, only: %w[new create]

  before_action :find_answer, only: %w[show edit update destroy]

  def new
    @answer = @question.answers.new
  end

  def create
    @answer = @question.answers.new(answer_params)

    if @answer.save
      redirect_to [:admin, @question]
    else
      render :new
    end
  end

  def show
  end

  def edit
  end

  def update
    if @answer.update(answer_params)
      redirect_to admin_answer_path(id: @answer.id)
    else
      render :edit
    end
  end

  def destroy
    @answer.delete
    redirect_to [:admin, @question]
  end

  private

  def find_answer
    @answer = Answer.find(params[:id])
  end

  def find_question
    @question = Question.find(params[:question_id])
  end

  def answer_params
    params.require(:answer).permit(:body, :correct)
  end
end
