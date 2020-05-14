# frozen_string_literal: true

ALPHABET_LENGTH = 26

def caesar_cipher(str, shift)
  characters = str.split('')
  new_characters = []

  characters.each do |char|
    if ('A'..'Z').include?(char)
      new_characters.push(char_shift(char, shift, 'A'.ord, 'Z'.ord))
    elsif ('a'..'z').include?(char)
      new_characters.push(char_shift(char, shift, 'a'.ord, 'z'.ord))
    else
      new_characters.push(char)
    end
  end

  new_characters.join
end

def char_shift(char, shift, start_code, end_code)
  return unless shift.positive?

  real_shift = shift % ALPHABET_LENGTH

  new_char_code = if char.ord + real_shift > end_code
                    (start_code - 1) + (real_shift - (end_code - char.ord))
                  else
                    char.ord + real_shift
                  end

  new_char_code.chr
end

puts caesar_cipher('What a string!', 5)
