# frozen_string_literal: true

def merge_arrays(left, right)
  merged_array = []
  until left.empty? || right.empty?
    merged_array << if left.first < right.first
                      left.shift
                    else
                      right.shift
                    end
  end
  right.empty? ? merged_array + left : merged_array + right
end

def merge_sort(arr)
  return arr if arr.length < 2

  left = merge_sort(arr.slice!(0, arr.length / 2))
  right = merge_sort(arr)
  merge_arrays(left, right)
end
