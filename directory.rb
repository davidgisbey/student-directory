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
end

def print_footer(names)
  if names.length == 0
    puts "We have no students\n"
  elsif names.length == 1
    puts "We have 1 student\n"
  elsif
    puts "Overall, we have #{names.count} great studentszn"
  end 
end 

def input_students
  def_cohort = "November"
  while true do 
      puts "Please enter the names of the student"
      puts "To finish, just hit return twice"
      name = gets[0..-2] 
        break if name.empty?
      puts "Please enter their cohort"
      cohort = gets.chomp
      cohort = def_cohort if cohort == "" 
      puts "Please enter the sex of the student"
      sex = gets.chomp
      puts "Please enter the students height in inches"
      height = gets.chomp
      puts "Please enter the students hobby"
      hobby = gets.chomp
      puts "If you are happy with input input yes if you made a typo input no"
      input = gets.chomp
      if input == "yes" 
        $count1 += 1
        @students << {name: name, cohort: cohort.downcase.to_sym, sex: sex, height: height, hobby: hobby}
        student_count = "Now we have #{@students.count} student" 
        final_count = "#{student_count.to_s}s" if $count1 > 1
        puts final_count
      end 
  end 
  @students
end 

def interactive_menu
    loop do 
    # 1. print the menu and ask the user what to do
    print_menu
    # 2. read the input and save it into a variable
    selection = gets.chomp
    # 3. do what the user has asked
    process(selection)
end 
end

def print_menu
  puts "1. Input the students"
  puts "2. Show the students"
  puts "3. Save the list to students.csv"
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
      input_students
    when "2"
      show_students
    when "3"
      save_students
    when "9"
      exit
    else
      puts "I don't know what you mean, try again"
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


interactive_menu
