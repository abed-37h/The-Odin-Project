

def bubble_sort(original_array)
  array = original_array.map(&:clone)
  last = array.length - 1

  while last > 0
    for i in 0...last
      if array[i] > array[i + 1]
        array[i], array[i + 1] = array[i + 1], array[i]
      end
    end

    last -= 1
  end

  array
end

# Tests
puts bubble_sort([4,3,78,2,0,2]).to_s
puts bubble_sort([1]).to_s
puts bubble_sort([]).to_s
