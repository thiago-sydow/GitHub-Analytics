require 'mongo'

module Mongo_Connection

include Mongo

	def self.clear_mongo_collections
		@collTimeTrackingCommits.remove
	end


	def self.putIntoMongoCollTimeTrackingCommits(mongoPayload)
		@collTimeTrackingCommits.insert(mongoPayload)
	end

	def self.mongo_Connect(dbName = nil, collName = "Issues-Data")

		if ENV['MONGODB_URI']
			@client = MongoClient.from_uri(uri)
		else
			@client = MongoClient.new(ENV['MONGODB_URL'], ENV['MONGODB_PORT'])
		end

		dbName = dbName || ENV['MONGODB_DATABASE']

		@db = @client[dbName]

		@collTimeTrackingCommits = @db[collName]
	end

	def self.aggregate_test(input1)
		@collTimeTrackingCommits.aggregate(input1)
	end

end
