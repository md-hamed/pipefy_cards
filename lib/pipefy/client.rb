require "graphql/client"
require "graphql/client/http"

module Pipefy
  class Client
    def initialize
      @client = Graphlient::Client.new('https://app.pipefy.com/queries',
        headers: { 'Content-Type': 'application/json',
                   'Authorization': "Bearer #{PipefyCards::Application.secrets.pipefy_token}"
                 }
      )
    end

    def query(graph, criteria)
      @client.query(graph, criteria).original_hash['data']['organization']
    end
  end
end
