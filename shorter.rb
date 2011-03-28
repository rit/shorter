class Shorter
  ALPHANUM = "0123456789abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ"
  ALPHANUM_MAP = Hash[ALPHANUM.split('').zip((0..61).to_a)]
  RADIX = 62

  def initialize(str_or_int)
    @input = str_or_int
    @output = []
  end

  def to_i
    power = @input.size - 1
    total = 0
    @input.each_char do |c|
      total += ALPHANUM_MAP[c] * (RADIX**power)
      power -= 1
    end
    total
  end

  def to_s
    return ALPHANUM_MAP.index(@input) unless @input >= RADIX

    remainder = @input % RADIX
    result = @input / RADIX
    if result < RADIX
      @output << remainder
      @output << result
    else
      @output << remainder
      @input = result
      to_s
    end
    @output.map { |e| ALPHANUM_MAP.index(e) }.join('').reverse
  end
end
