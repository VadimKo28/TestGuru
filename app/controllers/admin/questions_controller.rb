class Admin::QuestionsController < Admin::BaseController
  rescue_from ActiveRecord::RecordNotFound, with: :rescue_with_question_not_found

  before_action :find_test, only: %w[new create]
  before_action :find_question, only: %w[show destroy edit update]

  def new
    @question = @test.questions.new
  end

  def create
    @question = @test.questions.new(question_params)


    if @question.save
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
    if @question.update(question_params)
      redirect_to [:admin, @question]
    else
      render :edit
    end
  end

  def destroy
    @question.delete
    redirect_to test_questions_path(@question.test)
  end

  private

  def rescue_with_question_not_found
    render plain: 'Question was not found'
  end

  def find_test
    @test = Test.find(params[:test_id])
  end

  def find_question
    @question = Question.find(params[:id])
  end

  def question_params
    params.require(:question).permit(:body)
  end
end
