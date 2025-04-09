class Admin::BadgesController < Admin::BaseController
  before_action :find_badge, only: %i[show edit update]
  def index
    @badges = Badge.all
  end

  def new
    @badge = Badge.new
  end

  def create
    @badge = Badge.new(badge_params)

    if @badge.save
      redirect_to admin_badges_path
    else
      render :new
    end
  end

  def show
  end

  def edit
  end

  def update
    if @badge.update(badge_params)
      redirect_to [:admin, @badge]
    else
      render :edit
    end
  end

  private

  def badge_params
    params.require(:badge).permit(:title, :image_url, :rule, :rule_attribute)
  end

  def find_badge
    @badge = Badge.find(params[:id])
  end
end
