module Api2ch
  class NewThreads < Threads
    def call
      get_response(:catalog_num)['threads']
    end
  end
end
