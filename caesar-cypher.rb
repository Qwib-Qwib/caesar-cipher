require 'pry-byebug'

def caesar_cipher (string, cipher_key)
  original_text_array = string.split("")
  new_text_array = original_text_array.map do |char|
    if char.upcase == char  #This conditional statement is meant to keep the same case for each character. Didn't manage to chain it for some reason.
      char = char.downcase
      char = character_conversion(char, cipher_key)
      char = char.upcase
    else
      character_conversion(char, cipher_key)
    end
  end
  p new_text_array.join("")
end

def character_conversion (char, cipher_key) #This method is meant to "cipherize" the string by applying the cipher key to each character's unique codepoints value.
  if cipher_key > 26  #All keys have an equivalent under the |26| range. If the key gets above or below one entire loop of the alphabet, the method starts bugging out as some characters at either end of the alphabet "overflows" out of the allowed codepoints range.
    cipher_key -= 26 until cipher_key <= 26
  elsif cipher_key < -26
    cipher_key += 26 until cipher_key >= -26
  end
  if (97..122).include?(char.codepoints[0]) == false then char = char   #This range is the allowed codepoints range. It corresponds to all letters of the alphabet. Anything else isn't cipherized.
  elsif char.codepoints[0] + cipher_key > 122 then char = ((char.codepoints[0] + cipher_key) - 26).chr  #These conditional statements are meant to wrap back to "a" (or "z" for negative keys). It's meant to work with the more manageable key value we calculated a bit earlier. Bigger keys would cause problems since even with + or - 26, they'd still overflow.
  elsif char.codepoints[0] + cipher_key < 97 then char = ((char.codepoints[0] + cipher_key) + 26).chr
  else char = (char.codepoints[0] + cipher_key).chr
  end
  return char
end


caesar_cipher("Bonjour les pingouins.", -27)