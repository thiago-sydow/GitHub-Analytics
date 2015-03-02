require_relative './mongo'

module Time_Analyzer

	def self.controller
		Mongo_Connection.mongo_Connect("GitHub-TimeTracking", "TimeTrackingCommits")
	end

end
