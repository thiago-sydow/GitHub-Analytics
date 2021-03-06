require 'octokit'
require 'pp'
require 'json'


# Monkey Patch code to make Sawyer::Response allow me to access the Raw Body and not
# the Hypermedia version which is not does play friendly with MongoDB as it is not
# JSON and currently no code exists to convert to JSON
module Response
  attr_reader :response_body

  def initialize(agent, res, option = {})
    @response_body = res.body
    super
  end
end
# Prepend the module to override initialize
::Sawyer::Response.send :prepend, Response


module GitHub_Data

  PAGE_SIZE = 200

	def self.gh_sinatra_auth(ghUser)

		@ghClient = ghUser
		# Octokit.auto_paginate = true
		Octokit.per_page = PAGE_SIZE
		return @ghClient

	end

	def self.gh_authenticate(username, password)
		@ghClient = Octokit::Client.new(
										:login => username.to_s,
										:password => password.to_s,
										# :auto_paginate => true
										:per_page => PAGE_SIZE
										)
	end

	def self.get_closed_issues(repo)
		issueResultsClosed = @ghClient.list_issues(repo, {
			:state => :closed,
			:per_page => PAGE_SIZE
			})

		ghLastReponseClosed = @ghClient.last_response
    total_pages = ghLastReponseClosed.rels[:last].href.match(/page=(\d+)/)[1]

  	responseClosed = JSON.parse(@ghClient.last_response.response_body)

		while ghLastReponseClosed.rels.include?(:next) do
      page_number = ghLastReponseClosed.rels[:next].href.match(/page=(\d+)/)[1]
      ghLastReponseClosed = ghLastReponseClosed.rels[:next].get
      puts "Closed Issues - Page Number #{page_number} of #{total_pages}"
      yield JSON.parse(ghLastReponseClosed.response_body)
		end
	end

  def self.get_open_issues(repo)
		issueResultsOpen = @ghClient.list_issues(repo, {
			:state => :open,
			:per_page => PAGE_SIZE
			})

		ghLastReponseOpen = @ghClient.last_response
    total_pages = ghLastReponseOpen.rels[:last].href.match(/page=(\d+)/)[1]
		responseOpen = JSON.parse(@ghClient.last_response.response_body)

		while ghLastReponseOpen.rels.include?(:next) do
      page_number = ghLastReponseOpen.rels[:next].href.match(/page=(\d+)/)[1]
      ghLastReponseOpen = ghLastReponseOpen.rels[:next].get
      puts "Open Issues - Page Number #{page_number} of #{total_pages}"
      yield JSON.parse(ghLastReponseOpen.response_body)
		end
	end

	def self.get_Issue_Comments(repo, issueNumber)
		puts "5: #{@ghClient.rate_limit.remaining}"
		issueComments = @ghClient.issue_comments(repo, issueNumber, {
			:per_page => PAGE_SIZE
			})

		ghLastReponseComments = @ghClient.last_response
		responseComments = JSON.parse(@ghClient.last_response.response_body)

		while ghLastReponseComments.rels.include?(:next) do
			puts "6: #{@ghClient.rate_limit.remaining}"
			ghLastReponseComments = ghLastReponseComments.rels[:next].get
			responseComments.concat(JSON.parse(ghLastReponseComments.response_body))
		end

		return responseComments
	end

	def self.get_repo_issue_events(repo)
		issueResultsOpen = @ghClient.repository_issue_events(repo, {
			:per_page => PAGE_SIZE
			})
		ghLastReponseRepoIssueEvents = @ghClient.last_response
		responseRepoEvents = JSON.parse(@ghClient.last_response.response_body)

		while ghLastReponseRepoIssueEvents.rels.include?(:next) do
			ghLastReponseRepoIssueEvents = ghLastReponseRepoIssueEvents.rels[:next].get
			responseRepoEvents.concat(JSON.parse(ghLastReponseRepoIssueEvents.response_body))
		end
		return responseRepoEvents
	end

end
