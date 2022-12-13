#
# Ruby for Kids, Project 8: Code Breaker
# Programmed by: Chris Haupt
# Maintained by: S@bra
# A program that encrypt and decrypt documents
#
puts
puts "Code Breaker will encrypt and decrypt a file of your choice"
puts

codebreaker = CodeBreaker.new

if codebreaker.run
  puts "All done!"
else
  puts "Didn't work :("
end
