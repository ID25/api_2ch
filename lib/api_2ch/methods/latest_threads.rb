module Api2ch
  class LatestThreads
    def initialize(board)
      @board = board
    end

    def call
      response = HTTParty.get("#{BASE_URL}#{@board}/catalog.json")
      json = JSON.parse(response.body)
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
