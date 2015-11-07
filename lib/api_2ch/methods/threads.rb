module Api2ch
  class Threads
    def initialize(board, page = nil)
      @board = board
      @page = page
    end

    def full
      get_response(@page)
    end

    def call
      get_response(:threads)
    end

    private

    def get_response(page_name)
      response = HTTParty.get("#{BASE_URL}#{@board}/#{page_name}.json")
      JSON.parse(response.body)
    end
  end
end
