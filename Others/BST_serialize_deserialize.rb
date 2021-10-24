# Definition for a binary tree node.
# class TreeNode
#     attr_accessor :val, :left, :right
#     def initialize(val)
#         @val = val
#         @left, @right = nil, nil
#     end
# end

# Encodes a tree to a single string.
#
# @return {string}
def serialize(root)
  res = []
  queue = []
  queue.push(root) if root
  while(!queue.empty?)
    node = queue.shift
    if node
      res.push(node.val)
      queue.push(node.left || nil)
      queue.push(node.right || nil)
    else
      res.push(nil)
    end
  end
  res
end

def createNode(index, data)
  queue = []
  head = TreeNode.new(data.shift) if data[0]
  queue.push(head)
  while(!queue.empty?)
    node = queue.shift
    left = data.shift
    right = data.shift
    node.left = left ? TreeNode.new(left) : nil
    queue.push(node.left) if node.left
    node.right = right ? TreeNode.new(right) : nil
    queue.push(node.right) if node.right
  end
  head
end

# Decodes your encoded data to tree.
#
# @param {string} data
# @return {TreeNode}
def deserialize(data)
  createNode(0, data) if !data.empty?
end


# Your functions will be called as such:
# deserialize(serialize(data))