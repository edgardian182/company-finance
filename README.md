Expenses APP

TRICKS:
- Use @tab variable to change Active Tab in NavBar on application.html.erb


1. Define the DB diagram and create the models 
  Expense, Category, Type, User
2. Create the FORM in a MODAL way for a new Expense
  - Crea link con remote:true
  - Crea vista new.js.erb
  - Crea _modalForm.html.erb

  - FORM
    - remote: true
    - create action and save in expenses_controller.rb
    - create.js.erb
      => Llama un partial _row.html.erb donde esta la fila con la información recien creada para adjuntarle a la tabla actual


## README

This README would normally document whatever steps are necessary to get the
application up and running.

Things you may want to cover:

* Ruby version

* System dependencies

* Configuration

* Database creation

* Database initialization

* How to run the test suite

* Services (job queues, cache servers, search engines, etc.)

* Deployment instructions

* ...
