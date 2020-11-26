# Guess the number game
import random
print('Hello, what is your name')
name=input()
print('Hello, ' + name + ' I am thinking of a number between 1 and 20')
number=random.randint(1,20)

print('DEBUG: Secret Number is ' +str(number))

for guess in range(1,7):
    print('Guess a number')
    g=int(input())
    if g<number:
        print('Your guess is too low')
    elif g>number:
        print('Your guess is too high')
    else:
        break #This condition is for correct Guess

if g==number:
    print('Good job ' + name+'! you took ' + str(guess)+ ' to guess')
else:
    print('Nope the number is ' + str(number))

