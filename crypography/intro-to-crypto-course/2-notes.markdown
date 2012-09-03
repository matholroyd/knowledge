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
