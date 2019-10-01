student_count = 11

#first we print the list of students

students = [
  "Dr. Hannibal Lector",
  "Darth Vader",
  "Nurse Ratched",
  "Michael Corleone",
  "Alex Delarge",
  "The Wicked Witch of the West",
  "Terminator",
  "Freddy Krueger",
  "The Joker",
  "Joffery Baratheon",
  "Norman Bates"]

puts "The Students of Villans Academy"
puts "--------------"

students.each do |student|
  puts student
end

#finally, we print the total number of students
puts "Overall, we have #{students.count} great students"
