module Api2ch

  class Request
    BASE_URL = 'https://2ch.hk/'

    def initialize(board = 'b')
      @board = board
    end

    def get_threads(board)
      make_request(board)
    end


    private

    def make_request(board)
      response = HTTParty.get("#{BASE_URL}#{board}/threads.json")
      JSON.parse(response.body)
    end
    
  end
  
end
