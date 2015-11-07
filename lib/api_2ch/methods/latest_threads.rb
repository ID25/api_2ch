module Api2ch
  class LatestThreads < Threads
    def call
      json = get_response(:catalog)
      @subjects = []
      @comments = []
      json['threads'].each do |thread|
        @subjects << thread['subject']
        @comments << thread['comment']
      end
      Hash[@subjects.zip(@comments)]
    end
  end
end
