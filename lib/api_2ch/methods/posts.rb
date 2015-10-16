module Api2ch
  class Posts
    def initialize(board, num)
      @board = board
      @num   = num
    end

    def call
      response = HTTParty.get("#{BASE_URL}#{@board}/res/#{@num}.json")
      json     = JSON.parse(response.body)
      json['threads'].each do |thread|
        return thread['posts'].map { |post| post }
      end
    end
  end
end
