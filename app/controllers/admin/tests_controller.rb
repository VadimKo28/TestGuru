class Admin::TestsController < Admin::BaseController
  before_action :set_tests, only: %w[index update_inline]
  before_action :find_test, only: %w[show start update_inline edit update destroy]

  def index
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

  def edit
  end

  def update
    if @test.update(test_params)
      redirect_to [:admin, @test]
    else
      render :edit
    end
  end

  def update_inline
    if @test.update(test_params)
      redirect_to admin_tests_path
    else
      render :index
    end
  end

  def destroy
    @test.delete
    redirect_to admin_tests_path
  end

  private

  def find_test
    @test = Test.find(params[:id])
  end

  def set_tests
    @tests = Test.all
  end

  def test_params
    params.require(:test).permit(:title, :level, :category_id, :displayed, :timer)
  end
end
