class RepositoriesController < ApplicationController

  def index
    @repositories = []
    search_term = params[:search_term]

    if search_term.present?
      @repositories = GithubApiService.search_repositories(search_term.strip)
    end
  end
end