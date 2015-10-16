module Api2ch
  class Request
    def initialize(board = 'b')
      @board = board
    end

    def call_threads(board, page = 'index')
      Api2ch::Threads.new(board, page).call
    end

    def call_thread_posts(board, num)
      Api2ch::Posts.new(board, num).call
    end

    def most_viewed_threads(board)
      most_viewed(board)
    end

    protected

    def most_viewed(board)
      board_threads = make_request(board)
      board_threads['threads'].map     { |i| i['subject'].scrub! }
      board_threads['threads'].sort_by { |i| - i['views'] }
    end
  end
end
