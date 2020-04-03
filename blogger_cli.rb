require 'pry'

class Author
  attr_accessor :name, :blogs

  def initialize(name)
    # should set the name as well as the blogs initial value (an array)
    @name = name
    @blogs = []
  end

  def add_blog(blog)
    # should do both associations
    # the blog should be added to the author's collection of blogs
    # the author should be set to the blogs author
    @blogs << blog
    blog.author = self
  end

  def print_blogs
    # should iterate through the author's blogs and print out the info for the blog
    @blogs.each do |x|
      puts "#{x.title} #{x.content} #{x.author.name}"
    end
  end
end

class Blog
  attr_accessor :title, :content, :author

  def initialize(title, content, author)
    # should set the title content
    @title = title
    @content = content
    @author = author
    # the author object should call add_blog while passing in this instance as an argument
    author.add_blog(self)
  end

  def print_author_info
    # should print out "<blog.title> was written by <blog author's name>"
    puts "#{self.title} was written by #{self.author.name}"
  end

  def print_author_blogs
    # should print out "Other blogs by <blog author's name>"
    # should iterate through the blogs authors
    puts "Other blogs by #{self.author.name}"
    self.author.blogs.each do |blog|
      puts "#{blog.title}"
    end
  end

  def print_blog_info
    # should print blog title, content, and the author's name
    puts "#{self.title} #{self.content} #{self.author.name}"
  end
end

author = Author.new("Shakespear")
hamlet = Blog.new("Hamlet", "Hamlet Stuff", author)
jomeo_and_rubylette = Blog.new("Jomeo And Rubylette", "Sad stuff", author)

author2 = Author.new("Micah")
flatiron = Blog.new("Learn", "Ruby", author2)


author2.print_blogs # should print out all of the blogs of the author
flatiron.print_author_blogs # should print out the blogs.author's blogs
hamlet.print_blog_info # should print the information about one blog
hamlet.print_author_info # should print out who the author is
