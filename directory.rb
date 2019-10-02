
#first we print the list of students


def input_students
  puts "Please enter the names of the students"
  puts " To finish, just hit return twice"
  students = []
  name = gets.chomp
  while !name.empty? do
    puts "Enter cohort"
    cohort = gets.chomp
    students << {name: name, cohort: cohort}
    puts "Now we have #{students.count} students"
    name = gets.chomp
  end
  students

end




def print_header
  puts "The Students of Villans Academy"
  puts "--------------"
end

def print(names)
  puts "Please give me a letter"
  letter = gets.chomp
  names.each.with_index do |student, index|
    if student[:name].downcase.start_with?(letter) && student[:name].length < 12
      puts "#{index + 1}.#{student[:name]} (#{student[:cohort]} cohort)"
    end

  end
end

#finally, we print the total number of students
def print_footer(names)
  if names.count == 1
  puts "Overall, we have #{names.count} great student"
else
  puts "Overall, we have #{names.count} great students"
end
end

def sort_by_cohort(students)
  students.sort_by{
    |student|
    student[:cohort] }
end

students = input_students
print_header
print(students)
print_footer(students)
