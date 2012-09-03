# Intro 

## Uses for crypto

- Secure/private communication
  - HTTPS
  - wireless
- File encryption
  - EFS
  - TrueCrypt
- Content protection
  - DVD -> CSS
  - BluRay -> AACS
- User authentication

## Secure communication + file encryption

- Goals
  - No eavesdropping
  - No tampering
- HTTPS/SSL
  - 1st part
    - Handshake
    - Share secret key
  - 2nd part
    - Record layer
    - Transmit data using shared secret key
- Encryption algorithm
  - Only use publicly know ciphers
  
## Symmetric key usage

- Single use (one time key)
  - Key used only once
  - Often down with email
- Multi use (many time keys)
  - Key used repeatedly
  - Encrypting multi files
  - Need to be more careful
  
## Other uses of crypt

- Digital signatures
  - Must be different for each data being signed
- Anonymous communication
  - Mix net
  - Can still be bi-directional
- Anonymous digital cash
  - Spending without merchant knowing buyer
  - How to prevent double spending
  
## Protocols

- Elections
  - How to enable anonymous elections 
  - Can't double vote
- Private auctions
  - Winner = highest bid
  - Payout = 2nd highest bid
- Secure multi-party communication 
- Theorem
  - Anything that can be done with a trusted authority, can be done without(!)
  - Remove authority
  - 

## Crypto magic

- Privately outsourcing computation
  - Possible to do encrypt search on google without google knowing the query/result
  - Theoretical at the moment
- Zero knowledge
  - N = p.q
  - Owner of p.q can prove p.q without giving away anything (e.g. p.q)
  
## Symmetric ciphers

- Alice and bob know k
- Substitution cipher
  - For 26 letters, key space is 26! (letter-to-letter table) 
  - Key size is 2^88
  - Big number, but doesn't make it secure
- Vigener cipher
  -  
  
## Data Encryption Standard (DES)

- Keys 2^56
- Insecure by today's standards
- 

## Discrete probability
  
- Probability distribution
  - Probabilities over U, such that sum of probabilities = 1
- Uniform distribution
  - Every value in U has equal probability of occurring
- Point distribution 
  - One value out of U has probability of 1 occurring, all others 0
- Event
  - Subset of values of U
  - Probability of event is [0, 1]
- Random variable
  - 
- Independence
  - Pr[A and B] = Pr[A] . Pr[B]
- XOR
  - Given randomly distribute Y and uniformatly distributed X, XOR of both is uniformly
  - Hence even if Y is heavily weighted to certain values, the probability distribution of the output is nonetheless uniformly distributed (given uniformly distributed X) 
   
## Birthday paradox

- Given Universe U, chance of sampling same message twice is ~ 1.2 x sqrt of U
- For birthdays, 1.2 x sqrt(365) ~ 23 
   
  
  

  
  
  
  
  




