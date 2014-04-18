require_relative '../github-analytics-data-download/controller'
require_relative '../github-analytics-analyze-data/issues_processor'

module Sinatra_Helpers

    def self.download_github_analytics_data(user, repo, githubObject, githubAuthInfo)
      userRepo = "#{user}/#{repo}" 
      Analytics_Download_Controller.controller(userRepo, githubObject, true, githubAuthInfo)
    end

    def self.analyze_issues_opened_per_user(user, repo, githubAuthInfo)
      userRepo = "#{user}/#{repo}" 
      Issues_Processor.analyze_issues_opened_per_user(userRepo, githubAuthInfo)
    end


end