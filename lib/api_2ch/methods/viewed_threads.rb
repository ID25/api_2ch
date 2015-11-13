module Api2ch
  class ViewedThreads < Threads
    def call
      board_threads = get_response(:threads)
      board_threads['threads'].map { |thread| thread['subject'].scrub! }
      board_threads['threads'].sort_by { |thread| thread['views'] }.reverse
    end
  end
end
