

def caesar_cipher(plaintext, shift_factor)
  cipher_array = plaintext.split('').map do |letter|
    if 'a'.ord <= letter.ord && letter.ord <= 'z'.ord
      ((letter.ord - 'a'.ord + shift_factor) % 26 + 'a'.ord).chr
    elsif 'A'.ord <= letter.ord && letter.ord <= 'Z'.ord
      ((letter.ord - 'A'.ord + shift_factor) % 26 + 'A'.ord).chr
    elsif '0'.ord <= letter.ord && letter.ord <= '9'.ord
      ((letter.ord - '0'.ord + shift_factor) % 10 + '0'.ord).chr
    else
      letter
    end
  end
  cipher_array.join('')
end

# Tests
puts caesar_cipher("What a string!", 5) # "Bmfy f xywnsl!"
puts caesar_cipher("Works for numbers: 842", 3) # "Zrunv iru qxpehuv: 175"
puts caesar_cipher("Max Hwbg Ikhcxvm - Knur", 7) # Try it ;)
