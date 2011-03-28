require 'shorter'

describe 'Shorter#to_i' do
  it 'converts "0" to 0' do
    Shorter.new('0').to_i.should == 0
  end

  it 'converts Z to 61' do
    Shorter.new('Z').to_i.should == 61
  end

  it 'converts 10 to 63' do
    Shorter.new('10').to_i.should == 62
  end

  it 'converts 100 to 3844 ' do
    Shorter.new('100').to_i.should == 3844
  end

  it 'converts 200 to ' do
    Shorter.new('200').to_i.should == 7688
  end

  it 'converts 110 to ' do
    Shorter.new('110').to_i.should == 3906
  end

  it 'converts "zZ" to' do
    Shorter.new('zZ').to_i.should == 2231
  end
end

describe 'Shorter#to_s' do
  it 'converts 10 to 10' do
    Shorter.new(10).to_s.should == 'a'
  end

  it 'converts 61 to Z' do
    Shorter.new(61).to_s.should == 'Z'
  end

  it 'converts 62 to Z' do
    Shorter.new(62).to_s.should == '10'
  end

  it 'converts 100 to 100' do
    Shorter.new(100).to_s.should == '1C'
  end

  it 'converts 1000 to ' do
    Shorter.new(1000).to_s.should == 'g8'
  end
end
