require 'rubygems'
require 'openssl'
require 'digest/sha2'

# payload = "Plans for Blofeld's newest Doomsday Device. This is top secret!"
# sha256 = Digest::SHA2.new(256)
# aes = OpenSSL::Cipher.new("AES-256-CFB")
# iv = rand.to_s
# key = sha256.digest("Bond, James Bond")
# 
# aes.encrypt
# aes.key = key
# puts "key => #{key}"
# aes.iv = iv
# puts "iv => #{iv}"
# encrypted_data = aes.update(payload) + aes.final
# 
# puts encrypted_data
# 
# # aes = OpenSSL::Cipher.new("AES-256-CFB")
# aes.decrypt
# aes.key = key
# aes.iv = iv
# puts aes.update(encrypted_data) + aes.final


# ===========================

# def decrypt_with_iv_length(key, iv_length, cipher_with_iv)
#   aes = OpenSSL::Cipher.new("AES-128-CBC")
#   iv = cipher_with_iv[0, iv_length]
#   cipher = cipher_with_iv.sub(iv, '')
# 
#   iv, key, cipher = [iv, key, cipher].collect do |hex|
#     [hex].pack("H*")
#   end
# 
#   # puts "iv => #{iv}"
#   # puts "key => #{key}"
#   # puts "message_stream => #{cipher}"
# 
#   aes.decrypt
#   aes.key = key
#   aes.iv = iv
#   
#   aes.update(cipher) + aes.final
# end

def byte_array(hex)
  [hex].pack("H*")
end

def decrypt_cbc(key, cipher_with_iv)
  aes = OpenSSL::Cipher.new("AES-128-CBC")
  iv = cipher_with_iv[0, 16*2]
  cipher = cipher_with_iv.sub(iv, '')

  iv, key, cipher = [iv, key, cipher].collect { |x| byte_array x }

  aes.decrypt
  aes.key = key
  aes.iv = iv
  
  aes.update(cipher) + aes.final
end

def decrypt_ctr(key, cipher_with_iv)
  aes = OpenSSL::Cipher.new("AES-128-CFB")

  iv = cipher_with_iv[0, 16 * 2]
  cipher = cipher_with_iv.sub(iv, '')

  aes.decrypt
  aes.key = byte_array key
  
  result = ""
  cipher.split("").each_slice(16 * 2).collect(&:join).each_with_index do |chunk, i|
    iv_n = (iv.hex + i).to_s(16)
    aes.iv = byte_array iv_n
    result += aes.update(byte_array(chunk)) # + aes.final
  end
  
  result
  # aes.key = byte_array key
  # 
  # result = ""
  # cipher_with_ivs.split("").each_slice(32 + 32).collect(&:join).each do |chunk|
  #   iv = chunk[0, 32]
  #   cipher = chunk.sub(iv, '')
  #   
  #   aes.decrypt
  #   aes.iv = byte_array iv
  #   
  #   result += aes.update(byte_array(cipher)) + aes.final
  # end
  # 
  # result
end

def decrypt(key, cipher_with_iv, options)
  puts begin
    case options[:mode]
    when 'CBC'
      decrypt_cbc(key, cipher_with_iv)
    when 'CTR'
      decrypt_ctr(key, cipher_with_iv)
    else
    end
  end
end


# def decrypt(key, cipher_with_iv)
#   # (0..1000).each do |iv_length|
#     ok = true
#     result = nil
#     
#     begin
#       result = decrypt_with_iv_length key, iv_length, cipher_with_iv
#     rescue
#       ok = false
#     end
#     
#     if ok
#       puts result
#       break
#     end
#   end
# end



decrypt "140b41b22a29beb4061bda66b6747e14", "4ca00ff4c898d61e1edbf1800618fb2828a226d160dad07883d04e008a7897ee2e4b7465d5290d0c0e6c6822236e1daafb94ffe0c5da05d9476be028ad7c1d81",
  mode: 'CBC'
decrypt "140b41b22a29beb4061bda66b6747e14", "5b68629feb8606f9a6667670b75b38a5b4832d0f26e1ab7da33249de7d4afc48e713ac646ace36e872ad5fb8a512428a6e21364b0c374df45503473c5242a253",
  mode: 'CBC'
decrypt "36f18357be4dbd77f050515c73fcf9f2", "69dda8455c7dd4254bf353b773304eec0ec7702330098ce7f7520d1cbbb20fc388d1b0adb5054dbd7370849dbf0b88d393f252e764f1f5f7ad97ef79d59ce29f5f51eeca32eabedd9afa9329",
  mode: 'CTR'
decrypt "36f18357be4dbd77f050515c73fcf9f2", "770b80259ec33beb2561358a9f2dc617e46218c0a53cbeca695ae45faa8952aa0e311bde9d4e01726d3184c34451",
  mode: 'CTR'