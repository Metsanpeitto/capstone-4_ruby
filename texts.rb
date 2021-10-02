module Texts
  def self.text_intro
    puts <<-HEREDOC
         Please choose an option by entering a number:
         1 - List items
         2 - Create an item#{'         '}
         3 - Exit
         #{'    '}
    HEREDOC
  end

  def self.text_cr_categories
    puts <<-HEREDOC
         What item are you creating:
         1 - A book
         2 - A music album
         3 - A movie
         4 - A game
         #{'    '}
    HEREDOC
  end

  def self.text_list_intro
    puts <<-HEREDOC
         What list you want to see:
         1 - Books
         2 - Music albums
         3 - Movies
         4 - Games
         5 - Genres
         6 - Labels
         7 - Authors
         8 - Sources
         9 - Exit
         #{'    '}
    HEREDOC
  end

  def self.text_ci1(attribute)
    puts "Who is the #{attribute}"
  end

  def self.text_ci2(attribute)
    puts "What is the #{attribute}"
  end

  def self.text_ci3(category, attribute)
    puts "Is the #{category} #{attribute}"
  end

  def self.text_ci4(category)
    puts "How many years have pass since you played this #{category} "
  end

  def self.no_idea
    puts 'I have no idea what to do with that.'
  end

  def self.success(category)
    puts "#{category} successfully created!"
  end
end
