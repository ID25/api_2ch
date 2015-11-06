module Api2ch
  class Request
    def initialize(board = 'b')
      @board = board
    end

    def call_full_threads(page = 'index')
      Api2ch::Threads.new(@board, page).full
    end

    def call_threads
      Api2ch::Threads.new(@board).call
    end

    def call_thread_posts(thread_number)
      Api2ch::Posts.new(@board, thread_number).call
    end

    def call_latest_bump_threads
      Api2ch::LatestThreads.new(@board).call
    end

    def call_most_viewed_threads
      Api2ch::ViewedThreads.new(@board).call
    end

    def call_new_threads
      Api2ch::NewThreads.new(@board).call
    end
  end
end
