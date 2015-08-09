module Api2ch

  class Thread < Request

    def posts(board)
      thread_list(board)
    end

    private

    def thread_list(board)
      posts = make_request(board)
      arr = []
      posts['threads'].map { |i| arr << i["num"] }
      post_list = arr.uniq.map(&:to_i)

      post_list.each do |num|
        @post_thread = []
        @post_thread << HTTParty.get("#{BASE_URL}#{board}/res/#{num}.json")
      end
      op_posts = []
      @post_thread.each do |res|
        op_posts << JSON.parse(res.body)
      end
    end
    
  end
    
end
