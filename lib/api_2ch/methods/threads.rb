module Api2ch
  class Threads
    def initialize(board, page)
      @board = board
      @page  = page
    end

    def call
      response = HTTParty.get("#{BASE_URL}#{@board}/#{@page}.json")
      JSON.parse(response.body)
    end
  end
end
