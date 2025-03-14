class Admin::TestsController < Admin::BaseController
  before_action :authenticate_user!
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
      redirect_to [:admin, @test], notice: t('.success')
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
end
