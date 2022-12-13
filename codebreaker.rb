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

  def initialize( shift )
    alphabet_lower = 'abcdefghijklmnopqrstuvwxyz'
    alphabet_upper = alphabet_lower.upcase
    alphabet = alphabet_lower + alphabet_upper

    index = shift % alphabet.size

    encrypted_alphabet = alphabet[ index.. ] + alphabet[ 0...index ]

    setup_lookup_tables( alphabet, encrypted_alphabet )
  end

  def setup_lookup_tables( decrypted_alphabet, encrypted_alphabet )
    @encryption_hash = {}
    @decryption_hash = {}

    0.upto( decrypted_alphabet.size ) do | index |
      @encryption_hash[ decrypted_alphabet[ index ]] = encrypted_alphabet[ index ]
      @decryption_hash[ encrypted_alphabet[ index ]] = decrypted_alphabet[ index ]
    end
  end

  def encrypt( string )
    result = []

    string.each_char do | c |
      if @encryption_hash[ c ]
        result << @encryption_hash[ c ]
      else
        result << c
      end
    end

    result.join
  end

  def decrypt( string )
    result = []

    string.each_char do | c |
      if @decryption_hash[ c ]
        result << @decryption_hash[ c ]
      else
        result << c
      end
    end

    result.join
  end

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

    @input_file = input_file_directory + '/' + @input_file
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

    @output_file = output_file_directory + '/' + @output_file
  end

  def get_secret

    puts
    print "Enter the secret password: "

    @password = gets.chomp
  end

  def convert( encoder, string )
    if @command == 'e'
      encoder.encrypt( string )
    else
      encoder.decrypt( string )
    end
  end

  def process_files
    
    encoder = Caesar.new( @password.size )

    File.open( @output_file, "w" ) do | output |
      IO.foreach ( @input_file ) do | line |
        converted_line = convert( encoder, line )
        output.puts converted_line
      end
    end
  end

  
  def run

    if get_command && get_input_file && get_output_file && get_secret
      process_files
      true
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
