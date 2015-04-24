class Calculator
  def sum(a,b)
    raise ArgumentError unless a.is_a?(Numeric)
    raise ArgumentError unless b.is_a?(Numeric)

    a+b
  end
end
