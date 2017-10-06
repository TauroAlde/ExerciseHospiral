class FizzBuzz
  def initialize(var)
    @var = (1..var)
  end

  def div_cinco
    if @var % 5 == 0
     puts "buzz"
    end
  end

  def div_tres
    if @var % 3 == 0
     puts "fizz"
    end
  end

  def div_tres_and_cinco
    if @var % 5 == 0 && @var % 3 == 0
     puts "fizzbuzz"
    end
  end
end