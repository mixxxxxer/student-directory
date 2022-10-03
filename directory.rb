student_list = [
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
#print list of students
puts "The students of Villains Academy"
puts "-------------"
student_list.each { |student| puts student }
#print total data
puts "Overall, we have #{student_list.size} great students"