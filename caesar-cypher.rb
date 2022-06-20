require 'pry-byebug'

def caesar_cipher (string, cipher_key)
  original_text_array = string.split("")
  new_text_array = original_text_array.map do |char|
    if char.upcase == char
      char = char.downcase
      char = character_conversion(char, cipher_key)
      char = char.upcase
    else
      character_conversion(char, cipher_key)
    end
  end
  p new_text_array.join("")
end

def character_conversion (char, cipher_key)
  if (97..122).include?(char.codepoints[0]) == false then char = char
  elsif char.codepoints[0] + cipher_key > 122 then char = ((char.codepoints[0] + cipher_key) - 26).chr
  elsif char.codepoints[0] + cipher_key < 97 then char = ((char.codepoints[0] + cipher_key) + 26).chr
  else char = (char.codepoints[0] + cipher_key).chr
  end
  return char
end


caesar_cipher("Bonjour les pingouins.", -42)