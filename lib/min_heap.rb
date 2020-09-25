class HeapNode
  attr_reader :key, :value

  def initialize(key, value)
    @key = key
    @value = value
  end
end

class MinHeap

  def initialize
    @store = []
  end

  # This method adds a HeapNode instance to the heap
  # Time Complexity: O(log n)
  # Space Complexity: O(log n)
  def add(key, value = key)
    @store << HeapNode.new(key.to_i, value)
    
    if @store.length > 1
      heap_up(@store.length - 1)
    end
  end

  # This method removes and returns an element from the heap
  #   maintaining the heap structure
  # Time Complexity: O(log n)
  # Space Complexity: O(log n)
  def remove()
    return nil if @store.empty?

    swap((@store.length - 1), 0)
    removed = @store.pop

    heap_down(0) unless @store.empty?

    return removed.value
  end


  # Used for Testing
  def to_s
    return "[]" if @store.empty?

    output = "["
    (@store.length - 1).times do |index|
      output += @store[index].value + ", "
    end

    output += @store.last.value + "]"
      
    return output
  end

  # This method returns true if the heap is empty
  # Time complexity: O(1)
  # Space complexity: O(1)
  def empty?
    return @store.length == 0
  end

  private

  # This helper method takes an index and
  #  moves it up the heap, if it is less than it's parent node.
  #  It could be **very** helpful for the add method.
  # Time complexity: O(log n)
  # Space complexity: O(log n)
  def heap_up(index)
    return @store if index == 0

    parent = (index - 1) / 2

    if @store[index].key < @store[parent].key
      swap(index, parent)
      heap_up(parent)
    end
  end

  # This helper method takes an index and 
  #  moves it up the heap if it's smaller
  #  than it's parent node.
  def heap_down(index)
    return if index == (@store.length - 1)

    right = index * 2 + 2
    left = index * 2 + 1

    return if @store[left].nil?

    if @store[right].nil? && @store[left].key < @store[index].key
      swap(left, index)
      heap_down(left)
    elsif !@store[right].nil?
      if @store[left].key < @store[right].key
        swap(left, index)
        heap_down(left)
      else
        swap(right, index)
        heap_down(right)
      end
    end
  end

  # If you want a swap method... you're welcome
  # ty chris, you da best
  def swap(index_1, index_2)
    temp = @store[index_1]
    @store[index_1] = @store[index_2]
    @store[index_2] = temp
  end
end