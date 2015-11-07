module Api2ch
  class ViewedThreads < Threads
    def call
      board_threads = get_response(:threads)
      board_threads['threads'].map { |i| i['subject'].scrub! }
      board_threads['threads'].sort_by { |i| - i['views'] }
    end
  end
end
