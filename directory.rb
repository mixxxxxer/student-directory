@students = []

def input_student
  puts "Please, add name"
  puts "Enter twice instead of a name, if you finish."
  name = STDIN.gets.chomp
  puts "Please, add date of birthday (11.11.1111)"
  date = STDIN.gets.chomp
  puts "Please, cohort"
  cohort = STDIN.gets.chomp
  while !name.empty? do
    @students << {name: name, date: date, cohort: cohort}
    puts "Now we have #{@students.count} students"
    puts "Please, add name"
    name = STDIN.gets.chomp
    if !name.empty? 
      puts "Please, add date of birthday (11.11.1111)"
      date = STDIN.gets.chomp
      puts "Please, cohort"
      cohort = STDIN.gets.chomp
    end
  end
end

def save_students
  file = File.open("students.csv", "w")
  @students.each do |student|
    student_data = [student[:name], student[:date], student[:cohort]]
    csv_line = student_data.join(",")
    file.puts csv_line
  end
  file.close
end

def try_load_students
  filename = ARGV.first
  return if filename.nil?
  if File.exist?(filename)
    load_students(filename)
     puts "Loaded #{@students.count} from #{filename}"
  else
    puts "Sorry, #{filename} doesn't exist."
    exit
  end
end

def load_students(filename = "students.csv")
  file = File.open(filename, "r")
  file.readlines.each do |line|
  name, date, cohort = line.chomp.split(',')
    @students << {name: name, date: date, cohort: cohort.to_sym}
  end
  file.close
end

def print_header
  puts "The students of Villains Academy"
  puts "-------------"
end

def print_array
  if !@students.empty?
    @students.each_with_index do |student, id| 
    #if student[:name].length >= 12 // print only students, whose name longer then 12
    #if student[:name][0].downcase == "a" // print students, whose name starts from "a"
    puts "#{id + 1}.#{student[:name].ljust(30)} #{student[:date].ljust(10)} #{("(" + student[:cohort].to_s).rjust(15)} cohort)" 
    end
  end
end

def print_footer
  if @students.empty? 
    puts "Oh, we haven`t students(((" 
  else
    puts "Overall, we have #{@students.size} great students"
  end
end

def show_students
  print_header
  print_array
  print_footer
end

def print_menu
  puts "Choose command:"
  puts "1. Input the students"
  puts "2. Show the students"
  puts "3. Save the list to students.csv"
  puts "4. Load the list from students.csv"
  puts "0. Exit"
end

def user_decision(answer)
  case answer
    when "1" then input_student
    when "2" then show_students
    when "3" then save_students
    when "4" then load_students
    when "0" then exit
  else
    puts "Wrong answer"
  end
end

def interactive_menu
  loop do
    print_menu
    user_decision(STDIN.gets.chomp)
  end
end

try_load_students
interactive_menu