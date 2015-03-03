require_relative 'github_data'
require_relative 'mongo'
require_relative 'convert_dates'
require 'parallel'

module Analytics_Download_Controller

	def self.controller(repo, object1, clearCollections = false, githubAuthInfo = {})
		# GitHub_Data.gh_authenticate(username, password)
		GitHub_Data.gh_sinatra_auth(object1)

		# MongoDb connection: DB URL, Port, DB Name, Collection Name
		Mongo_Connection.mongo_Connect

		# Clears the DB collections if clearCollections var in controller argument is true
		if clearCollections == true
			Mongo_Connection.clear_mongo_collections
		end

		#======Start of Issues=======
		GitHub_Data.get_open_issues(repo) { |issues| self.save_issues(repo, issues, githubAuthInfo) }
		GitHub_Data.get_closed_issues(repo) { |issues| self.save_issues(repo, issues, githubAuthInfo) }

		#======Repo Issue Events======
		#repoIssueEvents = GitHub_Data.get_repo_issue_events(repo)
		# puts repoIssueEvents.to_s
		#repoIssueEvents.each do |rie|

			#rie = Dates_Convert_For_MongoDB.convertRepoEventsDates(rie)

			#rie["downloaded_by_username"] = githubAuthInfo[:username]
			#rie["downloaded_by_userID"] = githubAuthInfo[:userID]
			#rie["repo"] = repo
			#rie["type"] = "Repo Issue Event"
			#rie["download_datetime"] = Time.now.utc
			#Mongo_Connection.putIntoMongoCollTimeTrackingCommits(rie)
		#end
	end

	private

	def self.save_issues(repo, issues, githubAuthInfo)
		issues.each_with_index do |i, index|
			i = Dates_Convert_For_MongoDB.convertIssueDatesForMongo(i)

			i["downloaded_by_username"] = githubAuthInfo[:username]
			i["downloaded_by_userID"] = githubAuthInfo[:userID]
			i["repo"] = repo
			i["type"] = "Issue"
			i["download_datetime"] = Time.now.utc

			Mongo_Connection.putIntoMongoCollTimeTrackingCommits(i)
			#puts "Saved issue #{index} of #{issues.size} in MongoDB"
		end
	end
end
