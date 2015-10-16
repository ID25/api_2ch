require 'spec_helper'

describe Api2ch do
  it 'has a version number' do
    expect(Api2ch::VERSION).not_to be nil
  end

  describe '#call_threads' do
    request = Api2ch::Request.new
    json    = request.call_threads('rf')

    it 'return right board title' do
      expect(json['BoardName']).to eq 'Убежище'
    end

    it 'return json threads' do
      expect(json['threads']).to be_an_instance_of(Array)
    end
  end

  describe '#call_thread_posts' do
    request = Api2ch::Request.new
    json    = request.call_thread_posts('abu', 42375)

    it 'return json posts' do
      expect(json).to be_an_instance_of(Array)
    end
  end

  describe '#call_latest_bump_threads' do
    request = Api2ch::Request.new
    json    = request.call_latest_bump_threads('pr')

    it 'return lastest bumped threads' do
      expect(json).to include { 'ньюфаг тред' }
    end
  end

  describe '#most_viewed_threads' do
    request = Api2ch::Request.new
    json    = request.call_most_viewed_threads('rf')

    it 'return most viewed threads' do
      expect(json.map{ |i| i['views'] }).not_to include 0
    end
  end
end
