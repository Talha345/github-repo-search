class RepositoriesController < ApplicationController
  def index
    @repositories = []
    search_term = params[:search_term]
    page = params[:page] || 1

    if search_term.present?
      response = GithubApiService.search_repositories(search_term.strip, page)
      @repositories = response["items"]
      total_count = response["total_count"] > 1000 ? 1000 : response["total_count"] # Since Github API only returns the first 1000 records

      @pagy = Pagy.new(count: total_count, page: page)
    end
  end
end