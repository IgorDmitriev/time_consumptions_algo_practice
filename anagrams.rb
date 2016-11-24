def first_anagram?(first, last)
  first.chars.permutation.to_a.map(&:join).include?(last)
end

def second_anagram?(first, last)
  # first_dup = first.chars
  last_dup = last.chars
  first.each_char do |el1|
    last_dup.each.with_index do |el2, idx2|
      if el1 == el2
        last_dup.delete_at(idx2)
      end
    end
  end
  return true if last_dup.empty?
  false
end


def third_anagram?(first, second)
  first.chars.sort == second.chars.sort

end


def fourth_anagram?(first, last)
  hash = Hash.new(0)
  (0...first.length).each do |idx|
    hash[first[idx]] += 1
    hash[last[idx]] -= 1
  end
  # hash.values.all? { |el| el == 0}
  hash.values.all?(&:zero?)
end

p fourth_anagram?("gizmo", "sally")
p fourth_anagram?("elvis", "lives")
