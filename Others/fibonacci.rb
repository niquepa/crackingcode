# frozen_string_literal: true
# Documentation
class Fib
  attr_reader :max, :fib_count

  def initialize(max_count)
    @fib_count = 0
    @max = max_count
  end

  def perform
    (0..@max).each do |i|
      # puts "i:#{i} value:#{calc_fib(i)}"
      calc_fib(i)
    end
    puts "The total number of times the calculateFibAt method was used was #{fib_count}."
  end

  private

  def calc_fib(n)
    @fib_count += 1
    return n if n < 2

    calc_fib(n - 2) + calc_fib(n - 1)
  end
end

class FibMemo
  attr_reader :max, :memo, :fib_count

  def initialize(max_count)
    @fib_count = 0
    @max = max_count
    @memo = []
  end

  def perform
    (0..@max).each do |i|
      # puts "i:#{i} value:#{calc_fib(i)}"
      @memo[i] = calc_fib(i)
    end
    # puts "The total number of times the calculateFibAt method was used was #{fib_count}."
  end

  private

  def calc_fib(n)
    @fib_count += 1
    return @memo[n] if @memo[n]

    return n if n < 2

    calc_fib(n - 2) + calc_fib(n - 1)
  end
end

class FibFaster
  attr_reader :max

  def initialize(max_count)
    @max = max_count
  end

  def perform
    sequence = [0, 1]
    position = 2
    while position <= @max do
      sequence[position] = sequence[position-2] + sequence[position-1]
      position += 1
    end
    sequence
  end


end

# Fib.new(35).perform
require 'benchmark'
Benchmark.bm do |bm|
  bm.report('10') { Fib.new(10).perform }
  bm.report('20') { Fib.new(20).perform }
  bm.report('30') { Fib.new(30).perform }
  bm.report('35') { Fib.new(35).perform }
end

Benchmark.bm do |bm|
  bm.report('10') { FibMemo.new(10).perform }
  bm.report('20') { FibMemo.new(20).perform }
  bm.report('30') { FibMemo.new(30).perform }
  bm.report('35') { FibMemo.new(35).perform }
  bm.report('50') { FibMemo.new(50).perform }
  bm.report('100') { FibMemo.new(100).perform }
end

Benchmark.bm do |bm|
  bm.report('10') { FibFaster.new(10).perform }
  bm.report('20') { FibFaster.new(20).perform }
  bm.report('30') { FibFaster.new(30).perform }
  bm.report('35') { FibFaster.new(35).perform }
  bm.report('50') { FibFaster.new(50).perform }
  bm.report('100') { FibFaster.new(100).perform }
end