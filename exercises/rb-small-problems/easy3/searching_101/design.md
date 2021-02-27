# Searching 101 Program Design

## The Problem

Write a program that takes 6 numbers from the user and then prints a message listing whether the 6th number the user had given appears among the first 5 numbers.

## Problem Solving
- Prompt the user for for number input (assume all inputs will be intergers, not floats).
- Take the final 6th input and compare is to the other 5 inputs.
- If any of the first 5 inputs are equal to the 6th, print that the 6th number is found among the five and print the five.
- If none of the first 5 inputs match the 6th, print that the 6th number is not found among the five and print the five.
- Exit.

inputs:
- 5 integers requested and received from user as part of stock array
- 6th final integer requested and received from the user (checking number).

outputs:
- 6th integer input, whether its value was found withing the other five, then print the array of first five integer inputs.

rules:
- First five integers are only for creating the stock array.
- The 6th interger will be checked against all five to see if any match it/are equal to it.
- If any of the five match/are equal to the 6th, then the 6th number does appear amonng the 5, otherwise it does not.
- Print the 6th, whether found or not found, then the 5 in an array.

## Examples
	```
	==> Enter the 1st number:
	25
	==> Enter the 2nd number:
	15
	==> Enter the 3rd number:
	20
	==> Enter the 4th number:
	17
	==> Enter the 5th number:
	23
	==> Enter the last number:
	17
	The number 17 appears in [25, 15, 20, 17, 23].


	==> Enter the 1st number:
	25
	==> Enter the 2nd number:
	15
	==> Enter the 3rd number:
	20
	==> Enter the 4th number:
	17
	==> Enter the 5th number:
	23
	==> Enter the last number:
	18
	The number 18 does not appear in [25, 15, 20, 17, 23].
	```

## Data Structures

1st 5 integers: each stored in an array.
6th integer: by itself in own variable.
found_in_array: boolean value that alters whether the program prints "6th found in" or "6th not found in" as listed in examples above.

## Algorithm

Create a method that, when called (with an optional array length value named number_to_save) does the following:

1. Initialze a present in array variable called value_present_in and set it to false.
2. Initialize an empty array called saved_numbers
3. Initialize a variable called final_number.
4. Loop through and:
    a. Request the user to input a number until the loop has been executed number_to_save times
    b. Each iteration,print the loop number after requesting input.
5. After exiting loop, request the final_number, to be used to check the saved_numbers array.
6. Loop through the saved_numbers array and:
    a. Compare each value with the final_number value.
    b. If the daved_number value at and index matches the final_number, set value_present to true.
7. Print the final_number, whether found in saved_numbers array using value_present boolean, and then print the saved_numbers array and exit.
