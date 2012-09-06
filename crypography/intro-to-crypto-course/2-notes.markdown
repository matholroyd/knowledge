# Symmetric cyphers

- Formal definition
  - for all m & k, D(k, E(k, m)) = m
- Need algorithm that finishes in a useful amount of time
  - E.g. efficient
  
## One time pad

- Vernam 
  - Key k same size as message m
  - C = m XOR k
  - Very secure, except the key is so long it becomes insecure in practice
  - Impractical, as key needs to be as long as message
  - E.g. when alice shares key with bob, might as well share the message if that channel is already secure
  
  
## Information Theoretic Security

- CT should reveal nothing about PT
- Perfect secrecy
  - True if probability of any pair of messages generating same cipher is uniform
- If I have perfect secrecy, the size of K >= M
  - Hence need to compromise between size and perfect secrecy

## Stream ciphers

- Use a short key to generate large key on the fly
- Use pseudo random generator to get from k to G(k)
- Not perfect secrecy, since len(k) < len(M)
- PRG needs to be unpreditable
  - Can't use first bits of output of G(k) to figure out whole of G(k)
  - If predictable, could hack e.g. email since know that first bits of mail is always "from:"
  - Formally, predictable if algorithm can predict some part of a message based on 
- Weak PRG to avoid (easy to predict)
  - Linear congr gen. 3 parameters
  - glibc random()

## Negligible and non-neglible

- No specific definition, but could say:
  - non-negligible if e >= 1/2^30 (likely to happen over 1 GB of data)
  - negligible if e <= 1/2^80 (wont likely happen) 
  
## One time pad attacks
 
- If reuse same key twice, XOR'ing to ciphers means 0 = same letter in both messages
  - c1 XOR c2 = m1 XOR m2
- Real world examples of reusing 
  - Venona
  - MS-PPTP
    - Client and server used the same one-time pad
- Don't use stream cipher for disk encryption, since changes will leak information
- Steam ciphers are 'malleable'
  - No provided integrity checking
  - Attacker changing C has a predictable effect on when decrypting modified C
  - Can use this to change "Bob" -> "Eve" if know "Bob" is in the cypher text 
  
## Stream ciphers used in practice

- RC4
  - Used in HTTPS and WEP
  - Should not be used any more
  - Weaknesses
    - Bias in initial output, slight bias in 2nd byte ( Pr[2nd byte] = 2/256 )
    - Pr[ 2 byte of 0] = 1/256^2 + 1/256^3
    - Related key attacks
  - Recommend if do use, throw away first bunch of bits, where the bias appears 
- CSS
  - Uses
    - DVD
    - GSM
    - Bluetooth (EO)
  - Broken
- eStream
  - PGR takes seed k + nonce r as input
  - k stays same
  - nonce always changes
  - Salsa20
    - 128 or 256 bit seek key
    - nonce 64 bit
    - Salsa20(k; r) = H(k, (r, 0)) || H(k (r, 1)) || ..
    - 64 bytes table
      - 4 byte constant 0
      - 16 byte k
      - 4 bytes constant 1
      - 8 bytes r
      - 8 bytes i
      - 4 bytes constant 2
      - 16 bytes k
      - 4 bytes constant 3
    - Apply function h to table, maps 64 bytes -> 64 bytes
      - Apply function h 10 times
      - Bit addition of 10 time table output with original table
  - Other eStream ciphers
    - Salsa12
    - Sosemanuk

## PRG definition

- Since PGR are limited by their seed, they can only output a tiny fraction of all possible outputs
- Nonetheless, we want the PGR output to be indistinguishable from a truly random output
- Bunch of tests to check for 'randomness'
  - Number of 1s and 0s should be ~1/2 each
  - Number of consecutive 00s, 11s, etc. should be ~1/4
  - Max number of consecutive 0s should be <= 10 x log(n)
- Technical
  - Not 100% provable that a PGR is random

## Secure cipher definition

- CT should reveal nothing about PT
- Semantic security
  - Perform experiment where Eve is trying to determine whether m0 or m1 was sent
  - If advantage is 0, Eve can't tell difference between to attacks
  - If advantage is 1, non-neglible, e.g. Eve can tell difference between to messages
- Steam ciphers are semantically secure
  - 

  
   