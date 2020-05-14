# frozen_string_literal: true

require './caesar_cipher'

describe '#caesar_cipher' do
  it 'shifts a single lower case letter to the right by a specified number' do
    expect(caesar_cipher('a', 6)).to eql('g')
  end

  it 'shifts a single upper case letter to the right by a specified number' do
    expect(caesar_cipher('A', 6)).to eql('G')
  end

  it 'shifts a string of lower case letters by a specified number' do
    expect(caesar_cipher('string', 5)).to eql('xywnsl')
  end

  it 'shifts a string of upper case letters by a specified number' do
    expect(caesar_cipher('STRING', 5)).to eql('XYWNSL')
  end

  it 'shifts a string of mixed case letters by a specified number.'\
    ' Leaves other charachers unchanged' do
    expect(caesar_cipher('What a string!', 5)).to eql('Bmfy f xywnsl!')
  end
end
