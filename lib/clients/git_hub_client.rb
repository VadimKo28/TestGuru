class GitHubClient
  def initialize
    @http_client = setup_http_client
  end

  def create_gist(params)
    @http_client.create_gist(params)
  end

  def success?
    @http_client.last_response.status == SUCCESS_CODE_STATUS
  end

  private

  SUCCESS_CODE_STATUS = 201
  private_constant :SUCCESS_CODE_STATUS

  def setup_http_client
    Octokit::Client.new(access_token: ENV['ACCESS_TOKEN'])
  end
end
