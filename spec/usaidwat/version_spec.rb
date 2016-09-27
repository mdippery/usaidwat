require 'spec_helper'

module USaidWat
  describe 'commit_hash' do
    let (:metadata) {{'commit' => 'v1.4.4-4-g11624e0',
                      'commit_hash' => '11624e069842b18860352db00de17e4880315477',
                      'build_date' => Time.new(2016, 9, 27, 11, 15, 5, '-07:00')}}

    it 'should return the first seven characters of the current commit' do
      expected = '11624e0'
      allow_any_instance_of(Gem::Specification).to receive(:metadata).and_return(metadata)
      actual = USaidWat::commit_hash
      expect(actual).to eq(expected)
    end
  end
end
