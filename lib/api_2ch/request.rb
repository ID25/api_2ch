module Api2ch
  class Request
    def initialize(board = 'b')
      @board = board
    end

    def call_full_threads(board, page = 'index')
      Api2ch::Threads.new(board, page).full
    end

    def call_threads(board)
      Api2ch::Threads.new(board, nil).call
    end

    def call_thread_posts(board, num)
      Api2ch::Posts.new(board, num).call
    end

    def call_latest_bump_threads(board)
      Api2ch::LatestThreads.new(board).call
    end

    def call_most_viewed_threads(board)
      Api2ch::ViewedThreads.new(board).call
    end

    def call_new_threads(board)
      Api2ch::NewThreads.new(board).call
    end
  end
end
