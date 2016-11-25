def bad_two_sum(arr, target_sum)
  arr.combination(2).select { |arr1| arr1.inject(:+) == target_sum }
end

def two_sum?(arr, target_sum)
  array = arr.sort

  array.each_with_index do |el, idx|
    el2 = target_sum - el
    arr_dup = array.dup
    arr_dup.delete_at(idx)
    bol = arr_dup.bsearch { |el1| el1 == el2 }
    return true if bol
  end
  false
end

def two_sum2?(arr, target_sum)
  hash = Hash.new(false)

  arr.each do |el|
    hash[el] = true
  end

  arr.each do |el|
    target = target_sum - el
    next if target == el
    return true if hash[target]
  end
  false
end
arr = [0, 1, 5, 7]
p two_sum2?(arr, 6) # => should be true
p two_sum2?(arr, 10) # => should be false

def sum_rec?(n, arr, target_sum)
  hash = Hash.new(false)

  arr.each do |el|
    hash[el] = true
  end

  return true if n == 1 && hash[target_sum]

  arr.each_with_index do |el, idx|
    arr_dup = arr.dup
    arr_dup.delete_at(idx)
    target = target_sum - el
    next if target == el
    return true if sum_rec?(n - 1, arr_dup, target)
  end
  false
end

p 'recursion sums'
arr = [0, 1, 5, 7, 3, 2, 10 , 2000 , 254]
p 'should be false'
p sum_rec?(4, arr, 1000000)
p '6?'
p sum_rec?(2, arr, 6)
p '17?'
p sum_rec?(4, arr, 17)
p '2011?'
p sum_rec?(4, arr, 2011)
