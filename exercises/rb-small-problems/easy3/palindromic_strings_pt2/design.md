# Palindromic Strings

Write a method that returns true if the string passed as an argument is a palindrome, false otherwise. A palindrome reads the same forward and backward. Case and punctuation matter and are included.

## Problem
Take in a provided string and verify if that whole string is a palindrome(spaces, capitalization, and punctuation included). Return true if it is a palindrome, false if not.

Given: string to check if palindrome
Output: true/false

A palindrome is a string that is the same backwards and forwards. Easeiest way to check this would be to reverse the string and check if it equals the normal string. If the reversed string matches the original, the string is a palindrome.

## Test Cases
palindrome?('madam') == true
palindrome?('Madam') == false          # (case matters)
palindrome?("madam i'm adam") == false # (all characters matter)
palindrome?('356653') == true

## Data Structures
Input: array
OIutput: boolean

## Algorithm

1. Given an input string called string_orig
2. Reverse string_orig (reversed_str)
3. Check if reversed_str is equal to string_orig (is_palindrome)
4. Return is_palindrome
