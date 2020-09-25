require_relative "min_heap"

# This method uses a heap to sort an array.
# Time Complexity:  O(n log n)
# Space Complexity: O(n log n)
def heapsort(list)
  return list if list.length < 2

  heap = MinHeap.new

  list.each do |item| # n
    heap.add(item) # log n
  end

  y = 0
  while y < list.length
    list[y] = heap.remove
    y += 1
  end

  return list
end