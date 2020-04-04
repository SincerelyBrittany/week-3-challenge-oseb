require 'pry'

class Author
  attr_accessor :name, :blogs

  @@all = []
  def initialize(name)
    # should set the name as well as the blogs initial value (an array)
    @name = name
    @blogs = []
    save
  end

  def save
     @@all << self
   end

   def self.all
     @@all
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
  @@all = []
  @@titles = []
  def initialize(title, content, author)
    # should set the title content
    @title = title
    @content = content
    @author = author
    # the author object should call add_blog while passing in this instance as an argument
    author.add_blog(self)
    @@titles = title
    save
  end

  def save
     @@all << self

   end

   def self.all
     @@all
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

class Cli
  def start
    puts "Welcome to blogger!"
    puts
    puts
    main
  end

  attr_accessor :Author, :Blog, :author, :blog
  ## Bonus
  #Try creating a Cli class which can take in user input in order for user's to input blog information
  #and author information, and create unique Author's and Blogs from that information.

  def main
   puts "Main Menu
        Type '1' to list authors
        Type '2' to list blogs
        Type '3' to create a blog
        Type 'exit' to exit program"
        text = gets.chomp
        menuselection(text)
    end

    def list_blog
      # puts "#{Blog.all.count}"
      Blog.all.each do |blog|
        puts "#{blog.title}"
      end
    end

    def list_author
      # puts "#{Blog.all.count}"
    Author.all.each do |author|
        puts "#{author.name}"
      end
    end

    def menuselection(text)
      if text == "1"
        list_author
        puts "End of Author List"
        puts "Returning to Main Menu"
        main
      elsif text == "2"
        # puts "this is 2"
        list_blog
        puts "End of Author List"
        puts "Returning to Main Menu"
        main
      elsif text == "3"
        create_blog
      elsif text == "exit"
        exit
      else
        puts "Please Type '1', '2', '3', or 'exit'"
        main
    end
  end

    def create_blog
        puts "What is the author's name?"
        author_input = gets.chomp
        author = Author.new(author_input)
        # puts "#{author_input}"
        # puts "#{author}"

        puts "What is the title of the blog?"
        title_input = gets.chomp
        # puts "#{title_input}"

        puts "What is the content for the blog?"
        content_input = gets.chomp
        new_blog = Blog.new(title_input,content_input,author)
        # puts "#{content_input}"
        # puts "#{new_blog}"
        puts
        puts
        puts "Blog created!"
        puts
        puts
        puts "Returning to Main Menu"
        main
      end
end



# author = Author.new("Shakespear")
# hamlet = Blog.new("Hamlet", "Hamlet Stuff", author)
# jomeo_and_rubylette = Blog.new("Jomeo And Rubylette", "Sad stuff", author)
#
# author2 = Author.new("Micah")
# flatiron = Blog.new("Learn", "Ruby", author2)

# author2.print_blogs # should print out all of the blogs of the author
# flatiron.print_author_blogs # should print out the blogs.author's blogs
# hamlet.print_blog_info # should print the information about one blog
# hamlet.print_author_info # should print out who the author is

Cli.new.start
