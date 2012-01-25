require 'helper'
require 'tempfile'

describe 'BloomFilter load & dump' do
  it 'should dump and load a filter' do
    file = Tempfile.new("bloom-filter-test")

    assert filter = BloomFilter.new(100)
    assert filter.insert("foo")
    assert filter.dump(file.path), "dump filter"
    assert filter = BloomFilter.load(file.path, 100)
    assert filter.exists?("foo")
    assert !filter.exists?("bar")
  end
end
