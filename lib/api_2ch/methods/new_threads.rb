module Api2ch
  class NewThreads
    def initialize(board)
      @board = board
    end

    def call
      response = HTTParty.get("#{BASE_URL}#{@board}/catalog_num.json")
      json     = JSON.parse(response.body)
      json['threads']
    end
  end
end
