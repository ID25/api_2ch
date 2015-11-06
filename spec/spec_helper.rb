$LOAD_PATH.unshift File.expand_path('../../lib', __FILE__)
require 'api_2ch'

def to_time(string)
  Time.strptime(string.gsub(/[[:alpha:]]/, ''), '%d/%m/%y %H:%M:%S')
end
