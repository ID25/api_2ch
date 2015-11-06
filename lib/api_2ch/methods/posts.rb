module Api2ch
  class Posts
    def initialize(board, thread_number)
      @board = board
      @thread_number = thread_number
    end

    def call
      response = HTTParty.get("#{BASE_URL}#{@board}/res/#{@thread_number}.json")
      json = JSON.parse(response.body)
      json['threads'].each do |thread|
        return thread['posts'].map { |post| post }
      end
    end
  end
end
