module Api2ch
  class Threads
    def initialize(board, page = nil)
      @board = board
      @page = page
    end

    def full
      response = HTTParty.get("#{BASE_URL}#{@board}/#{@page}.json")
      JSON.parse(response.body)
    end

    def call
      response = HTTParty.get("#{BASE_URL}#{@board}/threads.json")
      JSON.parse(response.body)
    end
  end
end
