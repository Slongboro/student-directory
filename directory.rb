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

def print_header
  puts "The Students of Villans Academy"
  puts "--------------"
end

def print(names)
  names.each do |student|
    puts student
  end
end

#finally, we print the total number of students
def print_footer(names)
  puts "Overall, we have #{names.count} great students"
end

print_header
print(students)
print_footer(students)
