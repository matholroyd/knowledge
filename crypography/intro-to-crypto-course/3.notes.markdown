# Blockciphers

## What is block cipher

- Has encryption + decryption algorithms, E and D
- plaintext size = ciphertext size
- Splits input into blocks (of size n bits)
- Blocks encrypted over several 'rounds'
- 3DES
  - n = 64 bits
  - k = 168 bits
  - 48 rounds
- AES
  - n = 128 bits
  - k = 128, 192, 256 bits
  - 10 rounds

## Pseudo Random Permutation (PRP) 

- User interchangeably to describe blockcipher
- Formally abstraction of a block cipher
- Basically something is PRP if:
  1. Exists efficient algorithm that deterministically maps X -> X (where X is set of values)
  1. The function E(k, x) is one-to-one
  1. Exists efficient inversion algorithm D(k, y)
- PRP is basically a Pseudo Random Function (PRF) but with more constraints

## Secure PRFs
  
- Similar to other checks, run experiment 
  - Attacker is trying to guess if output came from truly random RF, or from Pseudo RF 
  - If attacker cannot tell, then PRF is said to be secure

## Turning a PRF into a PRG

- Let F = K x {0,1}^n -> {0,1}^n be a secure PRF
- Let G = K -> {0,1}^(nt) is securePRG if
  - G(k) = F(k, 0) || F(k, 1) || ... || F(k, t)
- Trivial to parallelize this
  - Each processor gets block plus F(k, .)

## DES

- For block ciphers, key k is typically expanded in to k1, k2,..kn, which are then applied to the different rounds, respectively
- Hence to define a block cipher, need to define
  1. Key expansion algorithm
  1. Round algorithm R(k, m)
- Core idea
  - Feistel Network
  - Used in many block ciphers, though not AES
- Theorem
  - If start with secure PRF, 3-round Feistel produces a secure PRP
  - Hence can generate a PRP from a PRF
- 16 round Feistel network
  - Each round uses same function, different key
  - Key k expanded to 16 48-bit round keys
- 3DES
  - E(k1, D(k2, E(k3, m)))
  - E-D-E so if put in same k for each step, gives same result as original DES 
  - k is 56 x 3 = 168 bits
  - Simple attack ~ 2^112
- DESX
  - EX = EX((k1, k2, k3), m) = k1 xor E(k2, m xor k3)
  - Simple attack in 2^(64 + 56) = 2^120
    - Easy...
    - Need to search (half of k1) + (half of k3) space = 64/2 + 64/2 = 64
    - So 56 attack + 64 attack = 2^120
  - Note if only xor on one side, does nothing
    - Several implementations of DESX incorrectly do this - beware!

## Attacks on block cipher

- Side channel attack
  - By measuring time to do E/D can extract key
    - Can do this if E happening on one processor core
    - Hostile code on another core
    - Hostile code measures cache misses
  - By measuring power usage to do E/D can extract key
    - Bits of k can be read off the power usage graph over time
- Fault attacks
  - Computing errors in the last round expose the secret k
  - Even small errors in calculating can complete expose k
  - Hence make sure output is correct before out put
- Hence do not implement crypto primitives yourself!
- Quantum attacks
  - Can do exhaustive search in X^(1/2) vs X on normal computer
  - Hence
    - DES solvable 2^28
    - 128-AES with n 2^64 (considered doable today)

## AES

- Subs-Perm network
  - All bits changed on each round (feistel only changes half)
  - Substitution rounds must be all invertible (unlike DES)
- Can tweak AES for performance vs code/memory size tradeoff
  - Good example is Javascript AES
  - Send no precomputed tables
  - Compute tables on client side
- Attack
  - Related keys can be attacked in AES-256

## Building own block cipher

- 