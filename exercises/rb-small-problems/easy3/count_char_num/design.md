# Counting the Number of Characters

## Need

Write a program that will prompt the user for input of a word or multiple words. Count how many letters are in the word(s) (excluding spaces), and give back the number of characters.

## Problem

I decided to make this one a bit more complicated, by also including checking the number of words and not just the number of letters.

I know there will be only 1 input: the string to deconstruct and find the number of characters and number of words.

The output will be the numbers of characters and words in the string, followed by the string itself.

## Examples and Test Cases

input: "walk" ==> 4 characters, 1 word

input: "walk, don't run" ==> 14 characters, 1 word

## Data structures

input: string
output:
- # characters: number, made by collecting number of non-space characters, with the spacing being ignored and removed prior to counting.
- # words: number, made by separating out words into arrays by removing/splitting at any spaces and punctuation and counting size of array left.

Insummary, from:
string input ==> ignore spaces and count characters ==> split on spaces or any punctuation to create array, check size of array to count words.

## Algorithm

1. Prompt user for string input.
2. Reduce the string by ignoring spaces and count the string's length to get the number of characters
    a. save this value in num_char variable.
3. Split the string at any spaces or punctuation, creating a words array.
4. Count the size of the words array and save the output to the num_words variable.
5. Return the num_char and num_words variables, followed by the original string the user input.

Psuedocode:

	```
	START
	SET string = get input from user
	SET num_char = reduce of string, counting everything but spaces in the string.
	SET arrayified_string = split string at any spaces or punctuation using a regex that matches any spaces or punctuation.
	SET num_words = size of the arrayified_string.
	PRINT num_chars, num_words, string
	```

