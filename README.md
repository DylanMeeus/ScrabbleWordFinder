# ScrabbleWordFinder

Finds possible words given a sequence of letters. Written in Haskell

Returns the longest matching words given a series of characters. 
Need to pass a wordlist from which to look up the words. 

Example usage: ./helper "ollehi" english.txt True

When the last argument is true, it will return the longest possible words. When the argument is False, it will keep running until it has found all words that can be made with the provided letters. If you think of this as a tree, imagine a breadth-first search, and returning an entire layer of the tree.

You can find some word lists [here](http://www.gwicks.net/dictionaries.htm).


------

## TO-DO

I plan to extend this with the following two options

* find prefix
* find postfix

find prefix: Given a series of characters, and a word, find which letters you can prefix the word with to still make a valid word.
find postfix: Given a series of characters, and a word, find which letters you can add to the word to still make a valid word.