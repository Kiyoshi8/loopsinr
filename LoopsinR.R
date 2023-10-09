### Loops in R

## generally speaking, loops allow you to repeat an operation.
## in R you may find the following loops: FOR, WHILE and REPEAT
## please take care about the brackets. The most common mistake when it comes to loops
## is not having all brackets closed or opened.
## you need the curly brackets{} to perform the command line in loops


## Loops come very often together with the if statement

# IF statement

# with this statement we can control which commands to execute
# under specified conditions.

# most of the time it comes with else alternative

# syntax: if (condition) {commands if T} else {commands if F}
## note that the else part is optional

x = 10

if (x < 15) {y = T}

if (x < 15) z = T
# when you have a short line with only one command, curly brackets are not needed
# but I do not recommend that - always use brackets to avoid mistakes


# introducing the else part

if (x < 9) {y=T} else {y=F}

# I recommend the following structure for if else codes

if (x <11) {
  y=T
} else {
  y=F
}

# By using "else if" you can nest numerous commands

x=7

if (x <7) {
  y=T
} else if (x==7) {
  y="Target"
}else{
  y=F
}

y

# FOR loops

# for loops allow a certain operation to be repeated a fixed nr of  times
# this is opposed to the while loop where the rep nr is not prefixed
# the syntax looks like this: for (name in vector) {commands}

for (i in 1:15) {print (i)}
for (z in 1:15) {print (z)}
# variable name does not matter although you will see i quite often

# to skip certain elements in the loop: next

for(i in 1:12){
  if(i==3)
    next
  print (i)}

# to break/stop the loop: break

for(i in 1:12){
  if(i==3)
    break
  print (i)}

# Break and Next are useful arguments which are also working in the other loop type

# Let us create the Fibonacci sequence, in this case the first 20 numbers.
# This is a famous sequence of numbers which
# is used e.g. in stock market predictions
# It starts with 2 x 1 and continues with the summation of the 2 preceding elements.

# with the first line we create an empty vector
Fibonacci = c()

# here we define the first two numbers
Fibonacci[1] = Fibonacci[2] =1

# and here we create the loop to calculate positions 3 to 20
for (i in 3:20) {Fibonacci[i] = Fibonacci[i-2] + Fibonacci[i-1]}

Fibonacci


## WHILE loop

# if we want to repeat statements, but we do not yet know about the pattern of repetition.
# as long as the condition the calculation is performed

# x meets condition (command in curly brackets is performed)

# syntax: while (condition) {commands}
x = 4

while(x < 5){
  x = x+10
  print(x)
}

# y does not meet condiiton
y = 6

while(y < 5){
  y = y+10
  print(y)
}

# let us walk through another Fibonacci example
# we want to know all Fibonacci numbers below 400.
# we do not know how many there are so we use the while loop

# we create the first 2 numbers
Fi1 =1
Fi2 =1

# and the basic Fibonacci vector, note that I put only Fi2 in it
# to have only 2x1 at the beginning
# the loop is going to fill the vector step by step
Fibonacci = c(Fi2)

# with the while statement we start the loop and define 400 as our condition
while (Fi2 < 400) {
  # vector of the previously calculated values and the new Fi2
  Fibonacci = c(Fibonacci, Fi2)
  oldFi2 = Fi2 # to convert Fi2 to the old Fi2 value, which later on gets Fi1
  Fi2 = Fi1+Fi2 # to update the latest number
  Fi1 = oldFi2} # to update Fi1 to the old Fi2
Fibonacci


# whole script
Fi1 = 1
Fi2 = 1
Fibonacci = c(Fi2)
while (Fi2 < 400) {
  Fibonacci = c(Fibonacci, Fi2)
  oldFi2 = Fi2
  Fi2 = Fi1+Fi2
  Fi1 = oldF12}
Fibonacci


# REPEAT loop

# this loop is used infrequently - however sometimes it can be useful
# the idea is to repeat a certain statement endlessly (difference to FOR)
# with the break statement we terminate the loop

# syntax: repeat {statement} if (condition) break

x = 1
repeat {
  x = x + 3
  if (x>99)
    break
print(x)}

# note that the position of the print command determines if x-3 or x is printed
# this can be seen in the last number output

x = 1
repeat {
  x = x + 3
  print(x)
  if (x>99)
    break}


### EXERCISES

# 1: create a simple loop ranging form 10:40.
# Print all the numbers and insert "My first FOR loop in R" when i is 22.

for (i in 10:40){
  if(i==22)
    print("My first For loop in R")
  print(i)}

# 2a: choose an appropriate loop to print all numbers <1000 in the lynx dataset

for (i in lynx) {
  if (i<1000)
  print(i)}

# 2b: now print the dataset as follows:
# trappings < 1000 should be replaced by "Low trapping rate"
# trappings > 1000 should appear as the actual number
# trapping = 1000 should be replaced by "Target rate"
### hint: watch the brackets and use "else if"

for (i in lynx){
  if(i<1000){
    print("Low trapping rate")
  } else if (i>1000) {
    print (i)
  } else{
    print("Target rate")}
}

# 3. while loop: if you look at the example code for
# the Fibonacci numbers which we calculated in the lecture
# can you work out a way to do the calculation without using oldFib?

Fi1 =1
Fi2 =1
Fibonacci =c(Fi2)
while (Fi2 < 400) {
  Fibonacci = c(Fibonacci, Fi2)
  Fi2 = Fi1+Fi2
  Fi1 = max(Fibonacci)}
Fibonacci

# 4. (HARD): write a function to calculate all prime numbers up to 100, starting form 2.
# In the solution I am using the Eratosthenes method (the oldest known systematic methos).
# hint: function "any" may help, modulus division: %%

PrimVec =function(n){
  # to start form 2
  if (n>=2) {
    # to further specify the sequence we want to work with
    s = seq(2,n)
    # p will be the container for our primes ,
    # numbers will be moved from s to p step by step if they meet the criteria
    p = c()
    # we start the loop
    for (i in seq(2,n)){
    # we use any to check that i (of this loop round) is still in s, multiples of i will be removed
      if (any(s==i)){
        # we store i if it meets our criteria in p together with the previous p
        p = c(p,i)
        # to search for numbers with a remainder at modulus division
        s = c(s[(s%%i) !=0],i)
      }}
    return(p) }
  # to specify the output if n < 2 (optional)
  else{
    stop("Input at least 2")
   }}
PrimVec(100)