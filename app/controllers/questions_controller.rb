class QuestionsController < ApplicationController
  rescue_from ActiveRecord::RecordNotFound, with: :rescue_with_question_not_found

  before_action :find_test
  before_action :find_question, only: %w[show destroy]

  def index
    @questions = @test.questions

    render inline: "<p>Все вопросы теста '<%= @test.title %>': <%= @questions.to_a %>!</p>"
  end

  def new
  end

  def create
    @test.questions.create(question_params)
    redirect_to "/"
  end


  def show
    render inline: "<p>Вопрос - <%= @question.body %>! теста - '<%= @test.title %>'</p>"
  end

  def destroy
    @question.delete
    redirect_to "/"
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
