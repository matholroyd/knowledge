# Blockciphers continued

## Deterministic counter mode (DETCTR)


## Security for many-time key

- Need to protect against attacker who can request encrypting of any plain text attacker chooses
  - E.g. attacker emails 
- Therefore problem with any encryption scheme where message M always encrypts to the same cipher C. Trivial for attack to break semantic security.
- Solution 1 - randomized encryption
  - CT will need to increase at least by the number of 'random bits'
  - May not be problem with big files, but could be too expensive for small messages, e.g. packets.
- Solution 2 - nonce-based encryption
  - Encryption algorithm E(k, m, n) (nonce)
  - Nonce need not be hidden/secret
  - Nonce must be unique for each message
  - Method 1
    - Encryptor keeps state of current nonce
    - Nonce does not need to be transmitted if transmission order is predictable
  - Method 2
    - Random nonce
    - Need to transmit nonce
    - Useful when multiple devices involved 
  - Security
    - Should be secure even if nonce chosen by adversary
    - Force adversary to choose unique nonces (very important)
 
## Cipher Block Chaining (CBC)

- Use Intialization Vector (IV)
  - IV must be non-predictable
  - Common mistake, e.g. ins SSL/TLS 1.1
- Using nonce
  - Must use nonce + unique key for the first encryption step so first IV is non-predictable
  - 
- Padding
  - What to do if last block is not same length as block?
  - If n bytes missing, paid with n bytes of n
  - If no bytes missing, add dummy block
  
  
