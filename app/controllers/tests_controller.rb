class TestsController < ApplicationController
  before_action :authenticate_user!
  before_action :find_test, only: :start

  def index
    # Показываю пользователю только те тесты, у которых есть вопросы
    @tests = Test.includes(:questions).where.not(questions: { id: nil }).distinct
  end


  def start
    current_user.tests.push(@test)
    redirect_to current_user.test_passage(@test)
  end

  private

  def find_test
    @test = Test.find(params[:id])
  end
end
