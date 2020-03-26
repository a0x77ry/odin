def bubble_sort(arr)
  (arr.length - 1).downto(1) do |index|
    sorted = true

    index.times do |i|
      if (arr[i] <=> arr[i+1]) > 0
        sorted = false
        arr[i], arr[i+1] = arr[i+1], arr[i]
      end
    end

    break if sorted
  end

  arr
end

puts bubble_sort([4,3,78,2,0,2])

def bubble_sort_by(arr)
  (arr.length - 1).downto(1) do |index|
    sorted = true

    index.times do |i|
      if yield(arr[i], arr[i+1]) > 0
        sorted = false
        arr[i], arr[i+1] = arr[i+1], arr[i]
      end
    end

    break if sorted
  end

  arr
end

sorted_array = bubble_sort_by(["hi","hello","hey"]) do |left,right|
  left.length - right.length
end

puts sorted_array
