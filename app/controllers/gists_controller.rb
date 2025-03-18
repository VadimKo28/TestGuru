class GistsController < Admin::BaseController
  before_action :authenticate_user!
  before_action :set_test_passage

  def create
    gist = GistQuestionService.new(
      user: current_user,
      question: @test_passage.current_question
    ).call

    flash_options = gist ? { notice: t('.success', gist_link: gist[:html_url]) } : { alert: t('.failure')}

    redirect_to @test_passage, flash_options
  end

  private

  def set_test_passage
    @test_passage = TestPassage.find(params[:test_passage_id])
  end
end
