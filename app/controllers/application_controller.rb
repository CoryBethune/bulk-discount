require './app/facade/repo_search'
class ApplicationController < ActionController::Base

  # before_action :repo_name,
  #               :number_of_commits

  def welcome

  end

  private

  def error_message(errors)
    errors.full_messages.join(', ')
  end

  # def repo_name
  #   repo_search = RepoSearch.new
  #   @repo = repo_search.repo_information
  # end

  # def number_of_commits
  #   commit_search = CommitSearch.new
  #   @commits = commit_search.commit_information
  # end
end
