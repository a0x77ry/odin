ALPHABET_LENGTH = 26

def caesar_cipher(str, shift)
    characters = str.split("")
    new_characters = []
    
    characters.each do |char|
        if (char.ord >= ?A.ord) and (char.ord <= ?Z.ord)            
            new_characters.push(char_shift(char, shift, ?A.ord, ?Z.ord))
        elsif (char.ord >= ?a.ord) and (char.ord <= ?z.ord)
            new_characters.push(char_shift(char, shift, ?a.ord, ?z.ord))
        else
            new_characters.push(char)
        end
    end

    new_characters.join
end

def char_shift(char, shift, start_code, end_code)
    if shift > 0
        real_shift = shift % ALPHABET_LENGTH

        if (char.ord + real_shift > end_code)
            new_char_code = (start_code - 1) + (real_shift - (end_code - char.ord))
        else
            new_char_code = char.ord + real_shift
        end

        new_char_code.chr
    end
end

puts caesar_cipher("What a string!", 5)