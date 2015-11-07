module Api2ch
  class Posts
    def initialize(board, thread)
      @board = board
      @thread = thread
    end

    def call
      response = HTTParty.get("#{BASE_URL}#{@board}/res/#{@thread}.json")
      json = JSON.parse(response.body)
      json['threads'].each do |thread|
        return thread['posts'].map { |post| post }
      end
    end
  end
end
