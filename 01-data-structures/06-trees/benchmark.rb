require 'benchmark'
require_relative 'binary_heap/node'
require_relative 'binary_tree/node'
require_relative 'binary_tree/binary_search_tree'
require_relative 'binary_heap/binary_heap'

arr = []
(1..100000).each do |x|
  arr.push(x)
end
shuffled = arr.shuffle

root = Node.new(shuffled[0], shuffled[0])
heap = BinaryHeap.new(root)

root1 = Node.new(shuffled[0], shuffled[0])
tree1 = BinarySearchTree.new(root)

puts "inserting heap"
puts Benchmark.measure {

  (1...shuffled.size-1).each do |x|

    heap.insert(root, Node.new(shuffled[x], shuffled[x]))
  end
}
puts "finding 50000 in heap"
puts Benchmark.measure {
  heap.find(root, 50000)
}
puts "deleting in heap"
puts Benchmark.measure {
  heap.delete(root, 50000)

}


puts "inserting binary search tree"
puts Benchmark.measure {

(1...shuffled.size-1).each do |x|
  tree1.insert(root1, Node.new(shuffled[x], shuffled[x]))
end
}
puts "finding 50000 in binary search tree"
puts Benchmark.measure {
  tree1.find(root1, 50000)
}
puts "deleting in tree"
puts Benchmark.measure {
  tree1.delete(root1, 50000)
}
