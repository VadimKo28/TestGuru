class TestsController < ApplicationController
  before_action :find_author, only: %w[new create]
  before_action :find_test, only: %w[show start]
  before_action :find_user, only: :start


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

  def start
    @user.tests.push(@test)
    redirect_to @user.test_passage(@test)
  end

  private

  def find_user
    @user = User.last
  end

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
