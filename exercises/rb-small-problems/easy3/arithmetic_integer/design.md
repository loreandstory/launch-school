# Arithmetic Integer Ruby Program

## Problem

Write a program that prompts the user for two positive integers, and then prints the results of the following operations on those two numbers:
- addition
- subtraction
- produxt
- quotient
- remainder
- power

This requires several steps, from validating the inputs, to performing each operation and then printing the operation performed along with its resulting value.

As all the operations and the order thereof are predetermined, there is no need for a loop. Each operation can be performed and have its results printed before moving onto the next operation and then the end of the file.

## Examples
	```
	==> Enter the first number:
	23
	==> Enter the second number:
	17
	==> 23 + 17 = 40
	==> 23 - 17 = 6
	==> 23 * 17 = 391
	==> 23 / 17 = 1
	==> 23 % 17 = 6
	==> 23 ** 17 = 141050039560662968926103
	```

## Data Structures

inputs: 2 positive integers
outputs: 6 performed operations along with their results.

rules:
- Prompt the user for the two positive intergers.
- Perform each operation and print the operation and its result.

## Algorithm

This problem is simple enough that I will go straight to psuedo code:

	```
	START
	SET int1 = prompt user for input
	SET int2 = prompt user for input
	
	SET add_ints = int1 + int2
	PRINT "$int1 + $int2 = $add_ints"
	SET subtr_ints = ...
	...

	```
