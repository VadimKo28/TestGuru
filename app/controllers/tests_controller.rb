class TestsController < ApplicationController
  before_action :authenticate_user!
  before_action :find_test, only: :start
  before_action :find_all_tests, only: %i[index start]

  def index
  end


  def start
    if @test.questions.empty?
      flash[:notice] = "У этого теста ещё нет вопросов"
      render :index
    else
      current_user.tests.push(@test)
      redirect_to current_user.test_passage(@test)
    end
  end

  private

  def find_test
    @test = Test.find(params[:id])
  end

  def find_all_tests
    @tests = Test.all
  end
end
