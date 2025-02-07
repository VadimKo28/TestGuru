class TestsController < ApplicationController
  before_action :find_author, only: %w[new create]
  before_action :find_test, only: %w[show]

  def index
    @tests = Test.all
  end

  def new
    @test = @author.author_tests.new
  end

  def create
    @test = @author.author_tests.new(test_params)

    if @test.save
      redirect_to @test
    else
      render :new
    end
  end

  def show
  end

  private

  def find_test
    @test = Test.find(params[:id])
  end

  def test_params
    params.require(:test).permit(:title, :level, :category_id)
  end

  def find_author
    @author = User.last
  end
end
