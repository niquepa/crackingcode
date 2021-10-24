# frozen_string_literal: true

#  1   2   3   4
#  5   6   7   8
#  9  10  11  12
# 13  14  15  16
#

def rotateMatrix(matrix)
  res = []
  matrix.each_with_index do |row, i|
    row.each_with_index do |_item, j|
      res[j] = [] unless res[j]
      res[j][matrix.length - 1 - i] = matrix[i][j]
    end
  end
  res
end

matrix = [[1, 2, 3, 4], [5, 6, 7, 8], [9, 10, 11, 12], [13, 14, 15, 16]]
puts "rotate 90: #{rotateMatrix(matrix)}"
puts "rotate 180: #{rotateMatrix(rotateMatrix(matrix))}"
puts "rotate 270: #{rotateMatrix(rotateMatrix(rotateMatrix(matrix)))}"
puts "rotate 360: #{rotateMatrix(rotateMatrix(rotateMatrix(rotateMatrix(matrix))))}"

matrix = [[1, 2, 3, 4, 5, 6], [7, 8, 9, 10, 11, 12], [13, 14, 15, 16, 17, 18], [19, 20, 21, 22, 23, 24], [25, 26, 27, 28, 29, 30], [31, 32, 33, 34, 35, 36]]
puts "rotate 90: #{rotateMatrix(matrix)}"
puts "rotate 180: #{rotateMatrix(rotateMatrix(matrix))}"
puts "rotate 270: #{rotateMatrix(rotateMatrix(rotateMatrix(matrix)))}"
puts "rotate 360: #{rotateMatrix(rotateMatrix(rotateMatrix(rotateMatrix(matrix))))}"

def rotateMatrixInPlace(matrix)
  
end
