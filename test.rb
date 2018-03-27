module ReadWriteExecute

  # @param [String] permissionString
  #   UNIX permission string
  # @return [Integer]
  #   Numerical representation of given permissions
  def self.symbolic_to_octal(permission_string)

    count = 0
    all_values_array = []
    final_array = []

    permission_string.each_char do |k|

      set_of_3_chars = permission_string[count, permission_string.length/3]
      return final_array.join('').to_i if set_of_3_chars == ''

      set_of_3_chars.each_char do |val|
        if val == 'r'
          each_value = 4
        elsif val == 'w'
          each_value = 2
        elsif val == 'x'
          each_value = 1
        else
          each_value = 0
        end

        all_values_array << each_value
      end

      final_array << all_values_array[0]+all_values_array[1]+all_values_array[2]
      all_values_array.clear

      count+=3
    end
  end
end

puts ReadWriteExecute.symbolic_to_octal("rwxr-x-w-")
# Should yield 752

