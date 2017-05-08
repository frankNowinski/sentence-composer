# Sentence Composer

A simple Ruby app that receives a string as input and returns all possible valid sentences using the Annkissam Language. 

## Installation

1. Clone the repository
2. `cd` into the repo
3. Run 'bundle install' in the terminal 

## Test

In the root directory, execute `rspec` in the terminal. 

## Usage

To run the app using the CLI, enter `ruby bin/composer.rb {ARG}` into the terminal. Ex: `ruby bin/composer.rb abcdefg` will output: 
```
["a bc def g"]
["a bcd e fg"]
["abcd e fg"]
```

## Assumptions 
* The input is a String of alphabetical characters (no numbers or symbols). 
* The input doesn't contain any spaces. 
* The user enters the characters in the String in the order in which they want the sentence to be composed. 
