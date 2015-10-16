require 'spec_helper'

describe Api2ch do

  request = Api2ch::Request.new

  it 'has a version number' do
    expect(Api2ch::VERSION).not_to be nil
  end

  describe '#call_threads' do
    json = request.call_threads('rf')

    it 'return right board title' do
      expect(json['BoardName']).to eq 'Убежище'
    end

    it 'return json threads' do
      expect(json['threads']).to be_an_instance_of(Array)
    end
  end

  describe '#call_thread_posts' do
    json = request.call_thread_posts('abu', 42375)

    it 'return json posts' do
      expect(json).to be_an_instance_of(Array)
    end
  end

  describe '#call_latest_bump_threads' do
    json = request.call_latest_bump_threads('pr')

    it 'return lastest bumped threads' do
      expect(json).to include { 'ньюфаг тред' }
    end
  end

  describe '#most_viewed_threads' do
    json = request.call_most_viewed_threads('rf')

    it 'return most viewed threads' do
      expect(json.map{ |i| i['views'] }).not_to include 0
    end
  end

  describe '#new_threads' do
    json = request.call_new_threads('b')
    time = DateTime.now

    it 'return recent created threads' do
      expect(json.first['date'][0..1].to_i).not_to be < time.strftime("%d").to_i
      expect(json).to be_an_instance_of(Array)
    end
  end
end
