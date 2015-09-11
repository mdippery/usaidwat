require 'spec_helper'
require 'usaidwat/either'

module USaidWat
  describe Either do
    it 'should return the initial value if all operations are successful' do
      e = Right.new("value")
      e = e >> lambda { |res| Right.new(res.value.upcase) }
      expect(e).to be_kind_of(Right)
      expect(e.right?).to be true
      expect(e.value).to eq('VALUE')
    end

    it 'should return an error value if an operation is not successful' do
      e = Right.new("value")
      e = e >> lambda { |res| Right.new(res.value.count) rescue Left.new('No such method') }
      expect(e).to be_kind_of(Left)
      expect(e.left?).to be true
      expect(e.value).to eq('No such method')
    end

    it 'should return an error value if any operation in the chain fails' do
      e = Right.new("value")
      e = e >> lambda { |res| Right.new(e.value.upcase) }
      e = e >> lambda { |res| Right.new(res.value.count) rescue Left.new('No such method') }
      e = e >> lambda { |res| Right.new(res.value.capitalize) rescue Left.new('Chain failed') }
      expect(e).to be_kind_of(Left)
      expect(e.left?).to be true
      expect(e.value).to eq('No such method')
    end

    it 'should say it is left if it is a Left value' do
      e = Left.new('value')
      expect(e.left?).to be true
    end

    it 'should say it is not right if it is a Left value' do
      e = Left.new('value')
      expect(e.right?).to be false
    end

    it 'should say it is not left if it is a Right value' do
      e = Right.new('value')
      expect(e.left?).to be false
    end

    it 'should say it is right if it is a Right value' do
      e = Right.new('value')
      expect(e.right?).to be true
    end
  end
end
