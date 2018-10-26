require "csv"
@students = [] 
$count1 = 0
$count = 1

def print_header
puts "The students of Villains Academy".center(40)
puts "------------".center(40)
end 

def print_students_list(students)
    while true do 
      students.each do |student|
       if student[:name].length < 12 && student[:name].downcase.chars[0] == "h"
         puts "#{$count}. #{student[:name]}, #{student[:cohort]} cohort, #{student[:sex]}, #{student[:height]}, #{student[:hobby]}."
         $count +=1
        elsif 
         $count +=1
       end
     end 
     break if students.length == $count - 1
    end 
    $count = 1
end

def print_footer(names)
  if names.length == 0
    puts "We have no students\n"
  elsif names.length == 1
    puts "We have 1 student\n"
  elsif
    puts "Overall, we have #{names.count} great students"
  end 
end 

def input_students
  def_cohort = "November"
  while true do 
    puts "Please enter the names of the student"
    puts "To finish, just hit return twice"
    name = STDIN.gets[0..-2]
      break if name.empty?
    puts "Please enter their cohort"
    cohort = STDIN.gets.chomp
    cohort = def_cohort if cohort == "" 
    puts "Please enter the sex of the student"
    sex = STDIN.gets.chomp
    puts "Please enter the students height in inches"
    height = STDIN.gets.chomp
    puts "Please enter the students hobby"
    hobby = STDIN.gets.chomp
    puts "If you are happy with input input yes if you made a typo input no"
    input = STDIN.gets.chomp
    if input == "yes" 
      add_students(name, cohort, sex, height, hobby)
      student_count = "Now we have #{@students.count} student" 
      puts "#{student_count.to_s}s" if student_count.length > 1
      puts "#{student_count.to_s}" if student_count.length == 1
    end 
  end 
  @students
end 

def interactive_menu
  load_students("students.csv")
  loop do 
  # 1. print the menu and ask the user what to do
  print_menu
  # 2. read the input and save it into a variable
  selection = STDIN.gets.chomp
  # 3. do what the user has asked
  process(selection)
  end 
end

def print_menu
  puts "1. Input the students"
  puts "2. Show the students"
  puts "3. Save the list to students.csv"
  puts "4. Load the list from students.csv"
  puts "9. Exit" # 9 because we'll be adding more items  
end

def show_students
  print_header
  print_students_list(@students)
  print_footer(@students)
end

def process(selection)
  case selection
    when "1"
      puts "\nYou selected Input students."
      input_students
    when "2"
      puts "\nYou selected show students."
      show_students
    when "3"
      puts "\n which file would you like to save to?"
      filename = gets.chomp
      puts "opening #{filename}"
      save_students(filename)
    when "4"
      puts "\n which file would you like to load?"
      filename = gets.chomp
      puts "opening #{filename}"
      load_students(filename)
    when "9"
      puts "\nYou selected exit."
      exit
    else
      puts "I don't know what you mean, try again"
  end
end
	
def save_students(filename)
  CSV.open(filename, "w") do |file|
    @students.each do |student|
     file << [student[:name], student[:cohort], student[:sex], student[:height], student[:hobby]]
  end
end
end 

def load_students(filename)
  CSV.open(filename, "r") do |file|
    file.each do |line|
    name, cohort, sex, height, hobby = line
    add_students(name, cohort, sex, height, hobby)
   end
  end
end 

def try_load_students
  filename = ARGV.first
  return if filename.nil?
  if File.exists?(filename)
    load_students(filename)
     puts "Loaded #{@students.count} from #{filename}"
  else
    puts "Sorry, #{filename} doesn't exist."
    exit
  end
end


def add_students(name, cohort, sex, height, hobby)
  @students << {name: name, cohort: cohort.downcase.to_sym, sex: sex, height: height, hobby: hobby}
end 


try_load_students
interactive_menu
