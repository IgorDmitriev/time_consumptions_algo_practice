def naive_windowed_max_range(arr, window_size)

  max_range = nil
  max_window = []
  arr.each_cons(window_size) do |window|
    sorted = window.sort
    current_max_range = sorted.last - sorted.first
    max_range ||= current_max_range

    if max_range < current_max_range
      max_range = current_max_range
      max_window = window
    end


  end

  max_range
  p max_window
end

def optimized_windowed_max_range(arr, window_size)

  queue = Queue.new(window_size)

  arr.each { |el| queue.push(el) }

  max = queue.max
  # min = queue.min

  p max
  # p min
end

class Queue
  attr_reader :max

  def initialize(size)
    @size = size
    @queue = Array.new
    @max = 0
    @min = 0
  end

  def push(el)
    if @queue.size < @size
      @queue << el
    else
      @queue.shift
      @queue << el
      sorted = @queue.sort
      current_max = sorted.last - sorted.first
      # current_min =

      @max = current_max if current_max > @max
      # @min = current_min if current_min < @min
    end
  end

end

p optimized_windowed_max_range([1, 0, 2, 5, 4, 8], 2) == 4 # 4, 8
p optimized_windowed_max_range([1, 0, 2, 5, 4, 8], 3) == 5 # 0, 2, 5
p optimized_windowed_max_range([1, 0, 2, 5, 4, 8], 4) == 6 # 2, 5, 4, 8
p optimized_windowed_max_range([1, 3, 2, 5, 4, 8], 5) == 6 # 3, 2, 5, 4, 8
