module UserDataHelper
  def github_url(author, repo)
    link_to 'проект TestGuru', "https://github.com/#{author}/#{repo}", target: '_blank'
  end
end
