require 'spec_helper'

describe Api2ch do
  request = Api2ch::Request.new(board: 'b')

  it 'has a version number' do
    expect(Api2ch::VERSION).not_to be nil
  end

  describe '#call_threads' do
    json = request.call_threads(board: 'pr')

    it 'return right board title' do
      expect(json['board']).to eq('pr')
    end

    it 'return json threads' do
      expect(json['threads']).to be_an_instance_of(Array)
    end
  end

  describe '#call_full_threads' do
    json = request.call_full_threads

    it 'return right board title' do
      expect(json['BoardName']).to eq '/Б/ред'
    end

    it 'return json threads' do
      expect(json['threads']).to be_an_instance_of(Array)
    end

    context 'when page incorrect' do
      incorrect_json = request.call_full_threads(page: 'page')

      it 'return error message' do
        expect(incorrect_json[:message]).to eq('Not Found')
      end
    end
  end

  describe '#call_thread_posts' do
    thread = request.call_threads['threads'].first['num']
    json = request.call_thread_posts(thread: thread)

    it 'return json posts' do
      expect(json).to be_an_instance_of(Array)
    end

    context 'when thread number incorrect' do
      incorrect_json = request.call_thread_posts(thread: 0)

      it 'return error message' do
        expect(incorrect_json[:message]).to eq('Not Found')
      end
    end
  end

  describe '#call_latest_bump_threads' do
    json = request.call_latest_bump_threads

    it 'return hash' do
      expect(json.class).to eq(Hash)
    end
  end

  describe '#most_viewed_threads' do
    json = request.call_most_viewed_threads

    it 'return most viewed threads' do
      expect(json.map { |i| i['views'] }).not_to include 0
    end

    it 'return threads sorted by view' do
      expect(json.map { |i| i['views'] }.each_cons(2).all? { |curr, prev| prev <= curr }).to eq(true)
    end
  end

  describe '#new_threads' do
    json = request.call_new_threads

    it 'return recent created threads' do
      expect(to_time(json[0]['date'])).to be >= to_time(json[1]['date'])
      expect(json).to be_an_instance_of(Array)
    end
  end
end
