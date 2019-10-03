@students = []

def print_menu
  puts "1. Input the students"
  puts "2. Show the students"
  puts "3. Save the list to students.csv"
  puts "4. Loads the list from students.csv"
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
  when "3"
    save_students
  when "4"
    load_students
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
    process(STDIN.gets.chomp)
  end
end

#first we print the list of students
def input_students
  puts " To finish, just hit return twice"
  puts "Please enter the names of the students"

  name = STDIN.gets.chomp
  while !name.empty? do
    puts "Enter cohort"
    cohort = STDIN.gets.chomp
    @students << {name: name, cohort: cohort.to_sym}
    puts "Now we have #{@students.count} students"
    name = STDIN.gets.chomp
  end

end

def save_students
  # open the file for writing
  file = File.open("students.csv", "w")
  # iterate over the array of students
  @students.each do |student|
    student_data = [student[:name], student[:cohort]]
    csv_line = student_data.join(",")
    file.puts csv_line
  end
  file.close
end

def load_students(filename = "students.csv")
  file = File.open(filename, "r")
  file.readlines.each do |line|
  name, cohort = line.chomp.split(',')
    @students << {name: name, cohort: cohort.to_sym}
  end
  file.close
end

def try_load_students
  filename = ARGV.first # first argument from the command line
  puts filename
  return if filename.nil? # get out of the method if it isn't given
  if File.exists?(filename) # if it exists]
    load_students(filename)
    puts "Loaded #{@students.count} from #{filename}"
  else # if it doesn't exist
    puts "Sorry, #{filename} doesn't exist."
    exit # quit the program
  end
end

def print_header
  puts "The Students of Villans Academy"
  puts "--------------"
end

def print_students_list
  puts "Please give me a letter"
  letter = STDIN.gets.chomp.downcase
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

try_load_students
interactive_menu
