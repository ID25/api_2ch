module Api2ch

  class Thread < Request

    def posts(board)
      posts = make_request(board)
      thread_list(posts)
    end

    private

    def thread_list(posts)
      arr = []
      posts['threads'].map { |i| arr << i["num"] }
      post_list = arr.uniq.map(&:to_i)

      post_list.each do |num|
        @post_thread = []
        # fix @board variable to dynamic variable
        @post_thread << HTTParty.get("#{BASE_URL}#{@board}/res/#{num}.json")
      end
      final = []
      @post_thread.each do |res|
        final << JSON.parse(res.body)
      end
    end
    
  end
    
end
