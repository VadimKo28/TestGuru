class TestsController < ApplicationController
  before_action :find_test, only: %w[show start]

  def index
    @tests = Test.all
  end

  def new
    @test = current_user.author_tests.new
  end

  def create
    @test = current_user.author_tests.new(test_params)

    if @test.save
      redirect_to @test
    else
      render :new
    end
  end

  def show
  end

  def start
    current_user.tests.push(@test)
    redirect_to current_user.test_passage(@test)
  end

  private

  def find_test
    @test = Test.find(params[:id])
  end

  def test_params
    params.require(:test).permit(:title, :level, :category_id)
  end
end
