class Laptop
  ROW = 30

  def initialize(name, cpu, hdd, price)
    @name, @cpu, @hdd, @price = name, cpu, hdd, price
  end

  def name
    @name
  end

  def name=(name)
    @name = name
  end

  def cpu
    @cpu
  end

  def cpu=(val)
    @cpu = val
  end

  def hdd
    @hdd
  end

  def hdd=(val)
    @hdd = val
  end

  def price
    @price
  end

  def price=(val)
    @price= val
  end

  def to_s
    "#{@name.center(ROW)} | #{@cpu.center(ROW)} | #{@hdd.center(ROW)} | #{@price.center(ROW) }"
  end

end

laptops = []

laptops << Laptop.new('MacBook', '2.7 Intel I3879', '128 SSD', '1200$')
laptops << Laptop.new('Vintage', 'x8086', '8MB HDD 1200 rpm', '1100$')

puts laptops
