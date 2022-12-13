#
# Ruby for Kids, Project 8: Code Breaker
# Programmed by: Chris Haupt
# Maintained by: S@bra
# A program that encrypt and decrypt documents
#
puts
puts "Code Breaker will encrypt and decrypt a file of your choice"
puts

class Caesar
end

class CodeBreaker

  COMMANDS = [ 'e', 'd' ]
  # COMMANDS = %w( e d )

  def initialize
    @input_file = ''
    @output_file = ''
    @password = ''
  end

  def get_command

    print "Do you want to (e)ncrypt or (d)ecrypt a file? "

    @command = gets.chomp.downcase

    if !COMMANDS.include?( @command )
      puts
      puts "Unknown command, sorry"
      return false
    end

    true
  end

  def get_input_file( input_file_directory = "./input_files" )

    puts
    print "Enter the name of the input file: "

    @input_file = gets.chomp
    
    if !File.exists?( "#{ input_file_directory }/#{ @input_file }" )
      puts
      puts "Ups! Can't find the input file"
      return false
    end

    true
  end

  def get_output_file( output_file_directory = "./output_files" )

    puts
    print "Enter the name of the output file: "

    @output_file = gets.chomp

    if File.exists?( "#{ output_file_directory }/#{ @output_file }" )
      puts
      puts "The output file already exists. Can't overwrite!"
      return false
    end

    true
  end


  def run

    if get_command && get_input_file && get_output_file && get_secret
      process_files
    else
      false
    end
  end
end

codebreaker = CodeBreaker.new

if codebreaker.run
  puts "All done!"
  puts
else
  puts "Didn't work :("
  puts
end
