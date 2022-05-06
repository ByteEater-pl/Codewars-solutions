def binary_array_to_number(arr)
  arr.empty? ? 0 : arr[-1] + 2 * binary_array_to_number(arr[0..-2])
end
