students = [
  "Dr. Hannibal Lecter",
  "Darth Vader",
  "Nurse Ratched",
  "Michael Corleone",
  "Alex DeLarge",
  "The Wicked Witch of the West",
  "Terminator",
  "Freddy Krueger",
  "The Joker",
  "Joffrey Baratheon",
  "Norman Bates"
  ]
def print_header
  puts "The students of Villains Academy"
  puts "-------------"
end

def print_array(student_list)
  student_list.each { |student| puts student }
end

def print_footer(student_list)
  puts "Overall, we have #{student_list.size} great students"
end

print_header
print_array(students)
print_footer(students)