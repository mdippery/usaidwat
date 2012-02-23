$LOAD_PATH.unshift File.join(File.dirname(__FILE__), '..', 'lib')
require 'usaidwat/utils'

describe 'USaidWat::Array' do
  it 'should return the longest string from a list of tuples' do
    list = [['Short Name', 0], ['Really Long Name', 1], ['Medium Name', 2]]
    list.longest_subreddit.should == 'Really Long Name'
  end
end
