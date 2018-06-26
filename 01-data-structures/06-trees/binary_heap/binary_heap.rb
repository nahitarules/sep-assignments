
require_relative 'node'

class BinaryHeap

  def initialize(root)
    @root = root
  end

  def insert(root, node)

    temp = ""
    if root.rating < node.rating && root.left == nil
      root.left = node
    elsif root.rating < node.rating && root.left != nil && root.right == nil
      root.right = node
      root = root.left
    elsif root.rating > node.rating
      temp = node
      node = root
      root = temp
      insert(root, node)
    end
  end

  def delete(root, data)
    if data == nil || root == nil
      return nil
    else
      deleted = find(root, data)
      if deleted == nil
        return nil
      else
        deleted.title = nil && deleted.rating = nil
      end
    end
  end

  def find(root, data)
    if root.nil? || data.nil?
      return nil
    else
      if root.title == data
        return root
      elsif root.left != nil
        find(root.left, data)
      elsif root.right != nil
        find(root.right, data)
      end
    end

  end

  def print
    children = []
    data = []

    data.push("#{@root.title}: #{@root.rating}")

    children.push(@root.left) if @root.left != nil

    children.push(@root.right) if @root.right != nil

    children.each do |i|
      data.push("#{i.title}: #{i.rating}")

      children.push(i.left) if i.left != nil

      children.push(i.right) if i.right != nil

      end
        puts data
    end
end
