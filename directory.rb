
def print_header
puts "The students of Villains Academy".center(40)
puts "------------".center(40)
end 
def print(students)
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
    puts "We have no students"
  elsif names.length == 1
    puts "We have 1 student"
  elsif
    puts "Overall, we have #{names.count} great students"
  end 
end 
def input_students
  students = []
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
        students << {name: name, cohort: cohort.downcase.to_sym, sex: sex, height: height, hobby: hobby}
        student_count = "Now we have #{students.count} student" 
        final_count = "#{student_count.to_s}s" if $count1 > 1
        puts final_count
      end 
  end 
  students
end 


$count1 = 0
$count = 1
students = input_students
print_header
print(students)
print_footer(students)
