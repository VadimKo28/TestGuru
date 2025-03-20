class GistsController < Admin::BaseController
  before_action :authenticate_user!
  before_action :set_test_passage
  before_action :init_client

  def create
    question = @test_passage.current_question

    gist = GistQuestionService.new(
      question: question,
      client: @client
    ).call

    if @client.success?
      Gist.create!(
        url: gist[:html_url],
        question_id: question.id,
        user_id: current_user.id
      )

      flash_options = { notice: t('.success', gist_link: gist[:html_url]) }
    else
      { alert: t('.failure')}
    end

    redirect_to @test_passage, flash_options
  end

  private

  def init_client
    @client = GitHubClient.new
  end

  def set_test_passage
    @test_passage = TestPassage.find(params[:test_passage_id])
  end
end
