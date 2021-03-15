# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

categories = Category.create!([
  { title: "Frontend" },
  { title: "Backend" },
  { title: "Machine learning" },
])

users = User.create!([
  { name: "Maxim", email: "brugunt@gmail.com", password: "f75hd5" },
  { name: "Polina", email: "poly_raven@gmail.com", password: "dfd456sd" },
  { name: "Dmitry", email: "dmitry@tut.by", password: "0sdret54" },
])

tests = Test.create!([
  { title: "HTML", category_id: categories[0].id },
  { title: "JavaScript", level: 1, category_id: categories[0].id },
  { title: "Ruby", level: 2, category_id: categories[1].id },
  { title: "Java", level: 3, category_id: categories[1].id },
  { title: "Python", level: 2, category_id: categories[2].id },
])

questions = Question.create!([
  { body: "What is the <a> tag used for?", test_id: tests[0].id },
  { body: "Choose the right statements for callbacks", test_id: tests[1].id },
  { body: "How many messages will be printed to the console? for(var i = 10; i < 35; i += 5) { console.log(i); }", test_id: tests[1].id },
  { body: "Select the method to get the whole inheritance chain for object", test_id: tests[2].id },
  { body: "What does the following code return? p [1, 2, 3, 4, 5].reduce {|m, x| m * x }", test_id: tests[2].id }, #120
  { body: "Does Java support multiple inheritance?", test_id: tests[3].id },
  { body: "How many arguments can lamda function take?", test_id: tests[4].id }, #any number of arguments
])

Answer.create!([
  { body: "To define header", question_id: questions[0].id },
  { body: "To print text", question_id: questions[0].id },
  { body: "To create links", correct: true, question_id: questions[0].id },

  { body: "A callback is a function passed as an argument to another function", correct: true, question_id: questions[1].id },
  { body: "Where callbacks really shine are in asynchronous functions, where one function has to wait for another function ", correct: true, question_id: questions[1].id },
  { body: "Javascript doesn't support callback functions", question_id: questions[1].id },

  { body: "5", question_id: questions[2].id },
  { body: "6", correct: true, question_id: questions[2].id },
  { body: "0", question_id: questions[2].id },
  { body: "7", question_id: questions[2].id },

  { body: ".class", question_id: questions[3].id },
  { body: ".superclass", question_id: questions[3].id },
  { body: ".ancestors ", correct: true, question_id: questions[3].id },

  { body: "15", question_id: questions[4].id },
  { body: "120", correct: true, question_id: questions[4].id },
  { body: "0", question_id: questions[4].id },

  { body: "Yes", correct: true, question_id: questions[5].id },
  { body: "No", question_id: questions[5].id },

  { body: "Any number of arguments", correct: true, question_id: questions[6].id },
  { body: "Only one argument", question_id: questions[6].id },
  { body: "No arguments", question_id: questions[6].id },
])

PassingTest.create!([
  { user_id: users[0].id, test_id: tests[0].id },
  { user_id: users[0].id, test_id: tests[2].id },
  { user_id: users[1].id, test_id: tests[4].id, passed: true },
  { user_id: users[2].id, test_id: tests[0].id },
  { user_id: users[2].id, test_id: tests[1].id },
  { user_id: users[2].id, test_id: tests[3].id, passed: true },
])
