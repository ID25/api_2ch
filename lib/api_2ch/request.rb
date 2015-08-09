module Api2ch

  class Request
    BASE_URL = 'https://2ch.hk/'

    def initialize(board = 'b')
      @board = board
    end

    def get_threads(board)
      make_request(board)
    end

    def most_viewed_threads(board)
      most_viewed(board)
    end

    protected

    def make_request(board)
      response = HTTParty.get("#{BASE_URL}#{board}/threads.json")
      JSON.parse(response.body)
    end

    def most_viewed(board)
      board_threads = make_request(board)
      board_threads['threads'].map { |i| i['subject'].scrub! }
      board_threads['threads'].sort_by { |i| - i['views'] }
    end
  end
end
