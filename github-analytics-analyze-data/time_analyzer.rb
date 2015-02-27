require_relative './mongo'

module Time_Analyzer

	def self.controller

		Mongo_Connection.mongo_Connect(ENV['MONGODB_URL'], ENV['MONGODB_PORT'], "GitHub-TimeTracking", "TimeTrackingCommits")

	end

end
