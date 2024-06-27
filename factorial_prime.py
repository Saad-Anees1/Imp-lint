# Function to calculate the factorial of a number
def factorial(n):
    if n == 0:
        return 1
    else:
        return n * factorial(n-1)

# Function to check if a number is prime
def is_prime(num):
    if num < 2:
        return False
    for i in range(2, int(num**0.5) + 1):
        if num % i == 0:
            return False
    return True

# Function to generate a list of prime numbers up to a given number
def prime_numbers_up_to(n):
    primes = []
    for i in range(2, n + 1):
        if is_prime(i):
            primes.append(i)
    return primes

# Main block to test the functions
if __name__ == "__main__":
    number = 5
    print(f"Factorial of {number}: {factorial(number)}")
    
    up_to = 20
    primes = prime_numbers_up_to(up_to)
    print(f"Prime numbers up to {up_to}: {primes}")
