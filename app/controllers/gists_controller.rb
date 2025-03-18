class GistsController < Admin::BaseController
  before_action :authenticate_user!
  before_action :set_test_passage

  def create
    begin
      gist = GistQuestionService.new(
        user: current_user,
        question: @test_passage.current_question
      ).call

      flash_options = gist ? { notice: t('.success', gist_link: gist[:html_url]) } : { alert: t('.failure')}
    rescue ActiveRecord::RecordInvalid => e
      flash_options = { alert: t('.record_invalid', error: e.message) }
    end

    redirect_to @test_passage, flash_options
  end

  private

  def set_test_passage
    @test_passage = TestPassage.find(params[:test_passage_id])
  end
end
