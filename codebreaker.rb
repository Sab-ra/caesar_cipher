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

  def initialize
    @input_file = ''
    @output_file = ''
    @password = ''
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
else
  puts "Didn't work :("
end
