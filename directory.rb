@students = []

def print_menu
  puts "1. Input the students"
  puts "2. Show the students"
  puts "9. Exit" # 9 because we'll be adding more items
end

def show_students
  print_header
  print_students_list
  print_footer
end

def process(selection)
  case selection
  when "1"
    input_students
  when "2"
    show_students
  when "9"
    exit
  else
    puts "I don't know what you mean, try again"
  end
end

def interactive_menu
  loop do
    # 1. print the menu and ask the user what to do
    print_menu
    # 2. read the input and save it into a variable
    process(gets.chomp)
  end
end

#first we print the list of students
def input_students
  puts " To finish, just hit return twice"
  puts "Please enter the names of the students"

  name = gets.chomp
  while !name.empty? do
    puts "Enter cohort"
    cohort = gets.chomp
    @students << {name: name, cohort: cohort}
    puts "Now we have #{@students.count} students"
    name = gets.chomp
  end

end

def print_header
  puts "The Students of Villans Academy"
  puts "--------------"
end

def print_students_list
  puts "Please give me a letter"
  letter = gets.chomp
  @students.each.with_index do |student, index|
    if student[:name].downcase.start_with?(letter) && student[:name].length < 12
      puts "#{index + 1}.#{student[:name]} (#{student[:cohort]} cohort)"
    end

  end
end

#finally, we print the total number of students
def print_footer
  if @students.count == 1
  puts "Overall, we have #{@students.count} great student"
else
  puts "Overall, we have #{@students.count} great students"
end
end

def sort_by_cohort
  @students.sort_by{
    |student|
    student[:cohort] }
end

interactive_menu