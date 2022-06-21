def caesar_cipher (string, cipher_key)
  ciphered_array = string.split("").map do |char|
    if char.upcase == char  #This conditional statement is meant to keep the same case for each character. If I understand correctly, I couldn't chain the block because it would try to call my custom method on a string, but it isn't defined as a string method.
      char = char.downcase
      char = character_conversion(char, cipher_key)
      char = char.upcase
    else
      character_conversion(char, cipher_key)
    end
  end
  p ciphered_array.join("")
end

def character_conversion (char, cipher_key) #This method is meant to cipher the string by applying the cipher key to each character's unique codepoints value.
  if cipher_key > 26  #All keys have an equivalent under the |26| range. If the key gets above or below one entire loop of the alphabet, the method starts bugging out as some characters at either end of the alphabet "overflows" out of the allowed codepoints range.
    cipher_key -= 26 until cipher_key <= 26
  elsif cipher_key < -26
    cipher_key += 26 until cipher_key >= -26
  end
  if (97..122).include?(char.codepoints[0]) == false then char = char   #This range is the allowed codepoints range. It corresponds to all letters of the alphabet. Anything else isn't ciphered.
  elsif char.codepoints[0] + cipher_key > 122 then char = ((char.codepoints[0] + cipher_key) - 26).chr  #These conditional statements are meant to wrap back to "a" (or "z" for negative keys). It's meant to work with the more manageable key value we calculated a bit earlier. Bigger keys would cause problems since even with + or - 26, they'd still overflow.
  elsif char.codepoints[0] + cipher_key < 97 then char = ((char.codepoints[0] + cipher_key) + 26).chr
  else char = (char.codepoints[0] + cipher_key).chr
  end
  return char
end


caesar_cipher("ALMsivi.", 15263)
caesar_cipher("ALMsivi.", 2)
caesar_cipher("ALMsivi.", 14)
caesar_cipher("ALMsivi.", -74)
caesar_cipher("ALMsivi.", -26)