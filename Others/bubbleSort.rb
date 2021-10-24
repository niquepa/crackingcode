


def bubbleSort(arr)
  swapped = false
  loop do
    swapped = false
    for i in (0..arr.length-2) do
      if arr[i] > arr[i+1]
        arr[i], arr[i+1] = arr[i+1], arr[i]
        swapped = true
      end
    end
    puts "arr:#{arr}"
    break if !swapped
  end
  arr
end


arr = [89, 14, 3, 847, 153, 219, 18, 24, 473]
puts "arr:#{arr}"
puts bubbleSort(arr).inspect