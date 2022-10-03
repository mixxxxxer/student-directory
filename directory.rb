=begin
students = [
  { name: "Dr. Hannibal Lecter", cohort: :november },
  { name: "Darth Vader", cohort: :november },
  { name: "Nurse Ratched", cohort: :november },
  { name: "Michael Corleone", cohort: :november },
  { name: "Alex DeLarge", cohort: :november },
  { name: "The Wicked Witch of the West", cohort: :november },
  { name: "Terminator", cohort: :november },
  { name: "Freddy Krueger", cohort: :november },
  { name: "The Joker", cohort: :november },
  { name: "Joffrey Baratheon", cohort: :november },
  { name: "Norman Bates", cohort: :november }
  ]
=end
def input_student
  students = []
  puts "Please, add name"
  puts "Enter twice instead of a name, if you finish."
  name = gets.chomp
  puts "Please, add date of birthday (11.11.1111)"
  date = gets.chomp
  puts "Please, cohort"
  cohort = gets.chomp
  while !name.empty? do
    students << {name: name, date: date, cohort: cohort}
    puts "Now we have #{students.count} students"
    puts "Please, add name"
    name = gets.chomp
    if !name.empty? 
      puts "Please, add date of birthday (11.11.1111)"
      date = gets.chomp
      puts "Please, cohort"
      cohort = gets.chomp
    end
  end
  students
end

def print_header
  puts "The students of Villains Academy"
  puts "-------------"
end

def print_array(student_list)
  student_list.each_with_index { |student, id| 
    #if student[:name].length >= 12 // print only students, whose name longer then 12
    #if student[:name][0].downcase == "a" // print students, whose name starts from "a"
    puts "#{id + 1}.#{student[:name].ljust(30)} #{student[:date].ljust(10)} #{("(" + student[:cohort]).rjust(15)} cohort)" 
  }
end

def print_footer(student_list)
  puts "Overall, we have #{student_list.size} great students"
end

print_header
students = input_student
print_array(students)
print_footer(students)