def substrings(str, dictionary)
    str.downcase!
    subs = {}
    words_substrs = []
    words = str.split
    
    words.each do |word|
        word_subs = get_substrings(word)
        words_substrs += word_subs
    end

    words_substrs.each do |substr|
        dictionary.each do |word|
            if substr == word
                subs[word] = subs[word] == nil ? 1 : subs[word] + 1
            end
        end
    end

    subs
end

def get_substrings(str)
    substrs = []

    (0..str.length - 1).each do |i|
        substrs.push(str[0..i])
        (i..str.length - 1).each do |inner_i|
            substrs.push(str[i..inner_i])
        end
    end

    substrs.uniq
end

#testing
dictionary = ["below","down","go","going","horn","how","howdy","it","i","low","own","part","partner","sit"]
puts substrings("below", dictionary)
puts substrings("Howdy partner, sit down! How's it going?", dictionary)