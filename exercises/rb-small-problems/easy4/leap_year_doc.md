# Leap Year Checker

## Problem

Write a method that takes any year greater that 0 as an input, and that returns true if the year is a leap year and false if it is not.

### Rules

Leap years occur...

- every year that is divisible by 4.
  * unless it is also divisible by 100.
    * but it still is a leap year if the year that is div by 100 is also div by 400.

## Examples and Test Cases

leap_year?(2016) == true
leap_year?(2015) == false
leap_year?(2100) == false
leap_year?(2400) == true
leap_year?(240000) == true
leap_year?(240001) == false
leap_year?(2000) == true
leap_year?(1900) == false
leap_year?(1752) == true
leap_year?(1700) == false
leap_year?(1) == false
leap_year?(100) == false
leap_year?(400) == true

## Data Structures

Keep it numeric - use modulus to calculate

## Algorithm

1. Given an input year as an integeter.
2. Start a boolean variable called is_leapyear and set to false.
3. Perform year mod 4, if the remainder is zero, set is_leapyear to true.
4. Perform year mod 100, if the remainder is zero, set is_leapyear to false.
5. Perform year mod 400, if the remainder is zero, set is_leapyear to true.

## Code on!
