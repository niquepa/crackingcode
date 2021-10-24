class Test
  attr_accessor :name, :label, :ancho, :alto

  def initialize(name, label, ancho, alto)
    @name = name
    @label = label
    @ancho = ancho
    @alto = alto
  end

  def area
    @ancho * @alto
  end

end

o = Test.new('Carlos', 'Inge', 10, 20)

puts "area: #{o.area}"
puts "name: #{o.name}"