categories = Category.create!([{ title: 'Backend' }, { title: 'Frontend' }, { title: 'SQL' }])


users = User.create!([
    {name: 'Иванов Сергей Петрович', email: 'ivanov@46.ru', password: 'ivanov@46.ru'},
    {name: 'Петров Сергей Петрович', email: 'petrov@mail78.com', password: 'petrov@mail78.com'},
    {name: 'Сидоров Владимир Владимирович', email: 'sid22@gmail.com', password: 'sid22@gmail.com'}
  ])


tests = Test.create!([
  {title: 'Запросы ActiveRecord', category: categories[0], user_id: users[0].id},
  {title: 'Запросы SQL', category: categories[0], user_id: users[1].id, }
])

questions = Question.create!([
  {body: 'какой SQL оператор будет вызван при использовании ActiveRecord метода create', test: tests[0]},
  {body: 'На какие категории подразделяется SQL', test: tests[1]}
])


Answer.create!([
  {body: 'Test1', question: questions[0]},
  {body: 'Test2', question: questions[1]},
])

