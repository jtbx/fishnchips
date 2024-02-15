D programs that calculate various mathematical values

## factors.d - calculate the factors of a number

To work out the factors of 31:

    ldc2 -run factors.d 31

## isfactor.d - determine whether a number is a factor of another

To determine whether 8 is a factor of 32:

    ldc2 -run isfactor.d 8 32

## hcf.d - calculate the highest common factor of two numbers

To work out the HCF of 12 and 28:

    ldc2 -run hcf.d 12 28

To keep it simple this program will write out a list of factors
for each number side-by-side.

## lcm.d - calculate the lowest common multiple of two numbers

To work out the LCM of 28 and 42:

    ldc2 -run lcm.d 28 42

To keep it simple this program will write out a list of multiples
for each number side-by-side.

## primes.d - generate a list of prime numbers up to a maximum value

To generate a list of primes up to 100:

    ldc2 -run primes.d

If an argument is supplied, the program will calculate primes up to that number:

    ldc2 -run primes.d 10

(outputs 2, 3, 5, and 7)
Two arguments can be supplied to specify a minimum as well:

    ldc2 -run primes.d 1 20

(outputs primes from 1 to 20)
