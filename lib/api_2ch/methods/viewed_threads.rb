module Api2ch
  class ViewedThreads
    def initialize(board)
      @board = board
    end

    def call
      board_threads = make_request(@board)
      board_threads['threads'].map { |i| i['subject'].scrub! }
      board_threads['threads'].sort_by { |i| - i['views'] }
    end

    private

    def make_request(board)
      response = HTTParty.get("#{BASE_URL}#{@board}/threads.json")
      JSON.parse(response.body)
    end
  end
end
