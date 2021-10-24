class Node
  attr_reader :value

  attr_accessor :left, :right

  def initialize(value)
    @value = value
    @left = nil
    @right = nil
  end

end

def pushNode(node, value)
  if value > node.value
    if node.right
      pushNode(node.right, value)
    else
      node.right = Node.new(value)
    end
  elsif value < node.value
    if node.left
      pushNode(node.left, value)
    else
      node.left = Node.new(value)
    end
  end
end

def postOrderBST(node, res = [])
  postOrderBST(node.left, res) if node.left
  postOrderBST(node.right, res) if node.right
  res.push(node.value)
  res
end

def preOrderBST(node, res = [])
  res.push(node.value)
  preOrderBST(node.left, res) if node.left
  preOrderBST(node.right, res) if node.right
  res
end

def inOrderBST(node, res = [])
  inOrderBST(node.left, res) if node.left
  res.push(node.value)
  inOrderBST(node.right, res) if node.right
  res
end

def breadthFirst(node)
  queue=[]
  output=[]
  queue.push(node)
  while(!queue.empty?)
    current = queue.shift
    queue.push(current.left) if current.left
    queue.push(current.right) if current.right
    output.push(current.value)
  end
  puts "Bread-first Traversal"
  puts output.join(" ")
end

def preOrderBSTLevelAverage(node, output = [], level = 0)
  return if !node
  # puts "Level:#{level} pre:#{output[level]} value:#{node.value}"
  output[level] = if output[level]
                    [output[level][0] + node.value, output[level][1] + 1]
                  else
                    [node.value, 1]
                  end
  preOrderBSTLevelAverage(node.left, output, level + 1) if node.left
  preOrderBSTLevelAverage(node.right, output, level + 1) if node.right
  output
end

def breadthFirstTopTree(root)
  queue = []
  output = []
  uniq_level = []
  queue.push([root, 0])
  while(queue.length > 0)
    item = queue.shift
    current = item[0]
    level = item[1]
    unless uniq_level.include?(level)
      uniq_level.push(level)
      output.push(current.value) if level >= 0
      output.prepend(current.value) if level.negative?
    end
    queue.push([current.left, level-1]) if current.left
    queue.push([current.right, level+1]) if current.right
  end
  output
end

def lowestCommonAncestor(root, p, q)
  return root if root == p || root == q
  left_lca = lowestCommonAncestor(root.left, p, q) if root.left
  right_lca = lowestCommonAncestor(root.right, p, q) if root.right
  return root if (left_lca and right_lca)
  return left_lca ? left_lca : right_lca
end

# root = Node.new(4)
# onel = Node.new(7)
# oner = Node.new(9)
# oneltwol = Node.new(10)
# oneltwor = Node.new(2)
# oneltworthreer = Node.new(6)
# oneltworthreerfourl = Node.new(2)
# onertwor = Node.new(6)
#
# root.left = onel
# root.right = oner
# onel.left = oneltwol
# onel.right = oneltwor
# oneltwor.right = oneltworthreer
# oneltworthreer.left = oneltworthreerfourl
# oner.right = onertwor

#               5
#             /  \
#            2    6
#          /  \    \
#         1    4     8
#             /    /   \
#            3     7   9

arr = [5,6,2,4,1,8,7,9,3]

root = Node.new(arr.shift)
arr.each{|e| pushNode(root, e) }


###################################################
puts "POST ORDER: #{postOrderBST(root)}" # [1, 3, 4, 2, 7, 9, 8, 6, 5]
###################################################
puts "PRE ORDER: #{preOrderBST(root)}" # [5, 2, 1, 4, 3, 6, 8, 7, 9]
###################################################
puts "IN ORDER: #{inOrderBST(root)}" # [1, 2, 3, 4, 5, 6, 7, 8, 9]
###################################################
breadthFirst(root)     # 5 2 6 1 4 8 3 7 9
###################################################
puts "preOrderBSTLevelAveragex" # 5 4 4 6
res = []
preOrderBSTLevelAverage(root, [], 0).each do |level|
  res.push(level[0] / level[1])
end
puts res.join(' ')
###################################################
puts "Top Tree view"
puts breadthFirstTopTree(root).join(' ')
###################################################
puts "Lowest Common Ancestor: #{lowestCommonAncestor(root, root.left.left, root.left.right.left).value}" # 2

#
# 5 2 6 1 4 nil 8 nil nil 3 nil nil nil 7 9
# 0 - 5 = 2-6
# 1 = 2 = 1-4
# 2 = 6 = nil-8
# 3 = 1 = nil - nil
# 4 = 4 = 3 - nil
# 5 = nil = nil - nil
# 6 = 8 = 7 - 9
