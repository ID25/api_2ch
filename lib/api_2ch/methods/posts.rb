module Api2ch
  class Posts
    def initialize(board, thread)
      @board = board
      @thread = thread
    end

    def call
      response = HTTParty.get("#{BASE_URL}#{@board}/res/#{@thread}.json")
      json = JSON.parse(response.body)
      json['threads'].first['posts']
    end
  end
end
