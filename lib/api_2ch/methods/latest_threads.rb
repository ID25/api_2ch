module Api2ch
  class LatestThreads < Threads
    def call
      json = get_response(:catalog)
      res = {}
      json['threads'].each do |thread|
        res[thread['date']] = thread['comment']
      end
      res
    end
  end
end
