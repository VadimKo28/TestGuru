class GistQuestionService
  def initialize(user:, question:, client: nil)
    @question = question
    @user = user
    @test = question.test
    @client = client || GitHubClient.new
  end

  def call
    gist = @client.create_gist(gist_params)

    create_gist_to_db(gist) if @client.success?

    gist
  end

  private

  def gist_params
    {
      description: I18n.t('github_gist.params.description', test_title: @test.title),
      files: {
        'test-guru-question.txt' => { content: gist_content }
      }
    }
  end

  def create_gist_to_db(gist)
    Gist.create!(
      url: gist[:html_url],
      question_id: @question.id,
      user_id: @user.id
    )
  end

  def gist_content
    content = [@question.body]
    content += @question.answers.pluck(:body)
    content.join("\n")
  end
end
