def parse_number_string(string)
  number_found = /^(?<sign>-?)(?<integer_part>\d+)\.?(?<fractional_part>\d*)/ =~ string

  if number_found != nil
    valid_number = true
  else
    valid_number = false
  end

  [valid_number, sign, integer_part, fractional_part]
end

def number_compiler(number_string, before_decimal_boolean)
  conversion_key = {
    "0" => 0,
    "1" => 1,
    "2" => 2,
    "3" => 3,
    "4" => 4,
    "5" => 5,
    "6" => 6,
    "7" => 7,
    "8" => 8,
    "9" => 9,
  }

  compiled_number = 0
  prepared_num_array = number_string.chars.reverse

  compilation_range = before_decimal_boolean ? (0...prepared_num_array.length) : (-prepared_num_array.length..-1)

  compilation_range.each do |index|
    element = prepared_num_array[index]
    current_number = conversion_key[element]

    compiled_number += current_number * (10 ** index)
  end

  compiled_number
end

def string_to_integer(number_string)
  valid_number, sign, integer_part, fractional_part = parse_number_string(number_string)

  return 0 unless valid_number

  compiled_integer_part = number_compiler(integer_part, true) if integer_part != nil
  compiled_fractional_part = number_compiler(fractional_part, false) if fractional_part != nil

  final_compilation = compiled_integer_part + compiled_fractional_part.to_f

  if sign == "-"
    -final_compilation
  else
    final_compilation
  end
end

p string_to_integer('4321') == 4321
p string_to_integer('570') == 570
p string_to_integer('-1234.234123sasd') == -1234.234123
p string_to_integer('asdf') == 0
