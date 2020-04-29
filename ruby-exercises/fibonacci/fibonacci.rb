# frozen_string_literal: true

def fibs(num)
  results = [0, 1]
  return [0] if num.zero?

  return results if num == 1

  (2..num).each { |pos| results << results[pos - 1] + results[pos - 2] }
  results
end

def fibs_rec(num)
  return [0, 1].slice(0, num + 1) if num <= 1

  arr = fibs_rec(num - 1)
  arr << arr[-1] + arr[-2]
end
