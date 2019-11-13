# Week 3 Challenge

In this challenge we will be associating blogs to authors.

## Instructions
- Run `bundle install` in the terminal
- Read the comments in `blogger_cli.rb` for each method defined.
- To run the code, in terminal type `ruby blogger_cli.rb`.

## Testing code
The `pry` gem will be installed via the gemfile when you run `bundle install`. Make use of `binding.pry` in your code to test your work.

## The Goal
At the bottom of `blogger_cli.rb` is some commented out code.
```
# author.print_blogs # should print out all of the blogs of the author
# hamlet.print_author_blogs # should print out the blogs.author's blogs
# hamlet.print_blog_info # should print the information about one blog
# hamlet.print_author_info # should print out who the author is
```

Make sure that each of the commented out lines do exactly what is described.

## Bonus
Try creating a Cli class which can take in user input in order for user's to input blog information and author information, and create unique Author's and Blogs from that information. An example:
```
Welcome to blogger!

Main Menu
Type '1' to list authors
Type '2' to list blogs
Type '3' to create a blog
Type 'exit' to exit program

input: 3

What is the author's name?

input: Bob

What is the title of the blog?

input: Bob or not to Bob

What is the content for the blog?

input: Definitely to Bob!

Blog created!

Main Menu
Type '1' to list authors
Type '2' to list blogs
Type '3' to create a blog
Type 'exit' to exit program

input: 1

Authors:
Bob
Bob's blogs:
1. Bob or not to Bob

Main Menu
Type '1' to list authors
Type '2' to list blogs
Type '3' to create a blog
Type 'exit' to exit program

input: 2

All created blogs:
1. Bob or not to Bob - Author: Bob

Main Menu
Type '1' to list authors
Type '2' to list blogs
Type '3' to create a blog
Type 'exit' to exit program

input: exit

Goodbye!
```

**Hint**

You will need to make sure to store all of your Author's and Blogs. Also make sure every Author is unique (something like a find_or_create method).
