=begin
p: each char in the encrypted str is 13 chars after the char  
in: encrypted string, out: decrypted string

- create a hash map of chars to appropriate chars
- map through each char and replace with appropriate char
=end
ROT_KEY = {'A' => 'N', 'B' => 'O', 'C' => 'P', 'D' => 'Q', 'E' => 'R', 'F' => 'S', 'G' => 'T', 'H' => 'U', 'I' => 'V', 'J' => 'W', 'K' => 'X', 'L' => 'Y', 'M' => 'Z', 'N' => 'A', 'O' => 'B', 'P' => 'C', 'Q' => 'D', 'R' => 'E', 'S' => 'F', 'T' => 'G', 'U' => 'H', 'V' => 'I', 'W' => 'J', 'X' => 'K', 'Y' => 'L', 'Z' => 'M', 'a' => 'n', 'b' => 'o', 'c' => 'p', 'd' => 'q', 'e' => 'r', 'f' => 's', 'g' => 't', 'h' => 'u', 'i' => 'v', 'j' => 'w', 'k' => 'x', 'l' => 'y', 'm' => 'z', 'n' => 'a', 'o' => 'b', 'p' => 'c', 'q' => 'd', 'r' => 'e', 's' => 'f', 't' => 'g', 'u' => 'h', 'v' => 'i', 'w' => 'j', 'x' => 'k', 'y' => 'l', 'z' => 'm'}

def decrypt_rot13(str)
  str.chars.map { |char| ROT_KEY[char] || char }.join
end

# solution with `ord`/`chr`
# def decrypt_rot13(str)
#   str.chars.map do |char|
#     case char
#     when 'A'..'M', 'a'..'m'
#       (char.ord + 13).chr
#     when 'N'..'Z', 'n'..'z'
#       (char.ord - 13).chr
#     else
#       char
#     end
#   end.join
# end


p decrypt_rot13("Nqn Ybirynpr") == "Ada Lovelace"
p decrypt_rot13("Tenpr Ubccre") == "Grace Hopper"
p decrypt_rot13("Nqryr Tbyqfgvar") == "Adele Goldstine"
p decrypt_rot13("Nyna Ghevat") == "Alan Turing"
p decrypt_rot13("Puneyrf Onoontr") == "Charles Babbage"
p decrypt_rot13("Noqhyynu Zhunzznq ova Zhfn ny-Xujnevmzv") == "Abdullah Muhammad bin Musa al-Khwarizmi"
p decrypt_rot13("Wbua Ngnanfbss") == "John Atanasoff"
p decrypt_rot13("Ybvf Unvog") == "Lois Haibt"
p decrypt_rot13("Pynhqr Funaaba") == "Claude Shannon"
p decrypt_rot13("Fgrir Wbof") == "Steve Jobs"
p decrypt_rot13("Ovyy Tngrf") == "Bill Gates"
p decrypt_rot13("Gvz Orearef-Yrr") == "Tim Berners-Lee"
p decrypt_rot13("Fgrir Jbmavnx") == "Steve Wozniak"
p decrypt_rot13("Xbaenq Mhfr") == "Konrad Zuse"
p decrypt_rot13("Fve Nagbal Ubner") == "Sir Antony Hoare"
p decrypt_rot13("Zneiva Zvafxl") == "Marvin Minsky"
p decrypt_rot13("Lhxvuveb Zngfhzbgb") == "Yukihiro Matsumoto"
p decrypt_rot13("Unllvz Fybavzfxv") == "Hayyim Slonimski"
p decrypt_rot13("Tregehqr Oynapu") == "Gertrude Blanch"