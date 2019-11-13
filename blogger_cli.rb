require 'pry'

class Author
  attr_accessor :name, :blogs

  def initialize(name)
    # should set the name as well as the blogs initial value (an array)
  end

  def add_blog(blog)
    # should do both associations
    # the blog should be added to the author's collection of blogs
    # the author should be set to the blogs author
  end

  def print_blogs
    # should iterate through the author's blogs and print out the info for the blog
  end
end

class Blog
  attr_accessor :title, :content, :author

  def initialize(title, content, author)
    # should set the title content
    # the author object should call add_blog while passing in this instance as an argument
  end

  def print_author_info
    # should print out "<blog.title> was written by <blog author's name>"
  end

  def print_author_blogs
    # should print out "Other blogs by <blog author's name>"
    # should iterate through the blogs authors
  end

  def print_blog_info
    # should print blog title, content, and the author's name
  end
end

author = Author.new("Shakespear")
hamlet = Blog.new("Hamlet", "Hamlet Stuff", author)
jomeo_and_rubylette = Blog.new("Jomeo And Rubylette", "Sad stuff", author)

# author.print_blogs # should print out all of the blogs of the author
# hamlet.print_author_blogs # should print out the blogs.author's blogs
# hamlet.print_blog_info # should print the information about one blog
# hamlet.print_author_info # should print out who the author is