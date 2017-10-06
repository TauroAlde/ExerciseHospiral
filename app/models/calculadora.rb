class Calculadora

  attr_accessor :memori, :num1, :num2

  def run_operation(operator)
    if self.memori.nil? and !num2.nil?
      self.memori = num1.send(operator, num2)
    elsif !self.memori.nil? and !num2.nil?
      "Ya hay un valor en la memoria"
    elsif !self.memori.nil? and num2 == nil
        self.memori = num1.send(operator, self.memori)
    elsif self.memori.nil? and num2 == nil
      self.memori = num1
      "Esperando segundo argumento"
    end
  end

  def set_numbers(num1, num2)
    @num1 = num1
    @num2 = num2
  end

  def suma(num1, num2 = nil)
    set_numbers(num1, num2)
    run_operation("+")
  end

  def resta(num1, num2 = nil)
    set_numbers(num1, num2)
    run_operation("-")
  end

  def div(num1, num2 = nil)
    set_numbers(num1, num2)
    run_operation("/")
  end

  def mult(num1, num2 = nil)
    set_numbers(num1, num2)
    run_operation("*")
  end

  def exp(num1, num2 = nil)
    set_numbers(num1, num2)
    run_operation("**")
  end

  def pord(num1, num2 = nil)
    if memori.nil? and !num2.nil?
      @memori = num1 * (num2.to_f/100)
    elsif !@memori.nil? and !num2.nil?
      "Ya hay un valor en la memoria"
    elsif !memori.nil? and num2 == nil
        @memori = num1 * (@memori.to_f/100)
    elsif @memori.nil? and num2 == nil
      @memori = num1
      "Esperando segundo argumento"
    end
  end

  def raiz(num1)
    Math.sqrt(num1)
  end

  def limpiar
    @memori = nil
  end
end