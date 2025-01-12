categories = Category.create!([{ title: 'Backend' }, { title: 'Frontend' }, { title: 'SQL' }])


users = User.create!([
    {name: 'Иванов Сергей Петрович', email: 'ivanov@46.ru'},
    {name: 'Петров Сергей Петрович', email: 'petrov@mail78.com'},
    {name: 'Сидоров Владимир Владимирович', email: 'sid22@gmail.com'}
  ])


tests = Test.create!([
  {title: 'Запросы ActiveRecord', category: categories[0], user: users[0]},
  {title: 'Запросы SQL', category: categories[0], user: users[1], }
])

questions = Question.create!([
  {body: 'какой SQL оператор будет вызван при использовании ActiveRecord метода create', test: tests[0]},
  {body: 'На какие категории подразделяется SQL', test: tests[1]}
])


Answer.create!([
  {question: questions[0]},
  {question: questions[1]},
])

