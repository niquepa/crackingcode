

def merge(left, right)
  # puts "merge: left:#{left} right:#{right}"
  arr = []
  while(left.length > 0 && right.length > 0)
    if left[0] < right[0]
      arr.push(left.shift)
    else
      arr.push(right.shift)
    end
  end
  # puts "****** arr: #{arr} left:#{left} right:#{right}"
  arr.concat(left) if left.length > 0
  arr.concat(right) if right.length > 0
  # puts "****** arr: #{arr}"
  return arr
end

def mergeSort(arrayToSort)
  # puts "---- arrayToSort:#{arrayToSort}"
  return arrayToSort if arrayToSort.length < 2
  middle = (arrayToSort.length / 2).floor
  left = arrayToSort.slice(0,middle)
  right = arrayToSort.slice(middle,arrayToSort.length-1)

  # puts "mergeSort: middle:#{middle} left:#{left} right:#{right}"
  merge(mergeSort(left), mergeSort(right))

end

array = [10, 15, 2, 5, 17, 9, 14, 11, 6, 19, 4, 20, 1, 18, 3, 7, 13, 8, 12, 16]

puts mergeSort(array.slice(0,array.length-1)).inspect