require 'byebug'

def my_min(list)
  smallest = false
  list.each_with_index do |el1, idx1|
    smallest = true
    list.each_with_index do |el2, idx2|
      next if idx1 == idx2
      smallest = false if el1 > el2
    end
    return el1 if smallest == true
  end

end

def my_min2(list)
  smallest = 0
  list.each do |el|
    if smallest > el
      smallest = el
    end
  end
  smallest
end

def largest_contiguous_sub_sum(list)
  subsets = []
  list_size = list.size

  list.each_with_index do |el1, idx1|
    idx2 = idx1
    while idx2 < list_size
      subsets << list[idx1..idx2]
      idx2 += 1
    end
  end
  # debugger
  # p subsets
  subsets.max_by { |subset| subset.inject(&:+) }
end

list = [5, 3, -7]
p largest_contiguous_sub_sum(list)
list = [2, 3, -6, 7, -6, 7]
p largest_contiguous_sub_sum(list)
list = [-5, -1, -3]
p largest_contiguous_sub_sum(list)

def largest_contiguous_sub_sum2(list)
  max_sum = nil
  current_sum = nil

  list.each do |el|
    current_sum += el if current_sum

    current_sum ||= el
    max_sum ||= current_sum

    max_sum = current_sum if current_sum > max_sum

    current_sum = nil if current_sum < 0
    # current_sum += el if current_sum + el > 0

    # current_sum = nil if current_sum < 0

  end
  max_sum
end

list = [5, 3, -7]
p largest_contiguous_sub_sum2(list)
list = [2, 3, -6, 7, -6, 7]
p largest_contiguous_sub_sum2(list)
list = [-5, -1, -3]
p largest_contiguous_sub_sum2(list)










#
