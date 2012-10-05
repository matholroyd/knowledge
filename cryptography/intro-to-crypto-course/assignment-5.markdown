Question 1
Your goal this week is to write a program to compute discrete log modulo a prime p. Let g be some element in ℤ∗p and suppose you are given h in ℤ∗p such that h=gx where 1≤x≤240. Your goal is to find x. More precisely, the input to your program is p,g,h and the output is x. 

The trivial algorithm for this problem is to try all 240 possible values of x until the correct one is found, that is until we find an x satisfying h=gx in ℤp. This requires 240 multiplications. In this project you will implement an algorithm that runs in time roughly 240‾‾‾√=220 using a meet in the middle attack. 

Let B=220. Since x is less than B2 we can write the unknown x base B as x=x0B+x1 where x0,x1 are in the range [0,B−1]. Then

    h=gx=gx0B+x1=(gB)x0⋅gx1   in ℤp.

By moving the term gx1 to the other side we obtain

      h/gx1=(gB)x0      in ℤp.

The variables in this equation are x0,x1 and everything else is known: you are given g,h and B=220. Since the variables x0 and x1 are now on different sides of the equation we can find a solution using meet in the middle (Lecture 3.3):
First build a hash table of all possible values of the left hand side h/gx1 for x1=0,1,…,220.
Then for each value x0=0,1,2,…,220 check if the right hand side (gB)x0 is in this hash table. If so, then you have found a solution (x0,x1) from which you can compute the required x as x=x0B+x1.
The overall work is about 220 multiplications to build the table and another 220 lookups in this table. 

Now that we have an algorithm, here is the problem to solve:

   p=g=h=134078079299425970995740249982058461274793658205923933 \77723561443721764030073546976801874298166903427690031 \85818648605085375388281194656994643364900608417111717829880366207009516117596335367088558084999998952205 \59997945906392949973658374667057217647146031292859482967 \5428279466566527115212748467589894601965568323947510405045044356526437872806578864909752095244 \952783479245297198197614329255807385693795855318053 \2878928001494706097394108577585732452307673444020333

Each of these three numbers is about 153 digits. Find x such that h=gx in ℤp. 

To solve this assignment it is best to use an environment that supports multi-precision and modular arithmetic. In Python you could use the gmpy2 or numbthy modules. Both can be used for modular inversion and exponentiation. In C you can use GMP. In Java use a BigInteger class which can perform mod, modPow and modInverse operations.