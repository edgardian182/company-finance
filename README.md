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
  - NOTA: Si se van a subir archivos agregar al form authenticity_token: true y en el controlador respond_to do |format| para quesea enviado por HTML
    - remote: true
    - create action and save in expenses_controller.rb
    - create.js.erb
      => Llama un partial _row.html.erb donde esta la fila con la información recien creada para adjuntarle a la tabla actual

      *** En la acción EDIT fue necesario agregar un evento en edit.js.erb para editar varias veces un mismo gasto

3. FILTROS
- En un filtro se deben recibir las variables que filtran en un FORM
  * Por TYPE, CATEGORY, DATE

4. ENUM
- Se usa para dar varios posibles valores a un campo en el MODEL
  enum state: {Nuevo:0, Pendiente:1, Entregado:2, Pagado:3}
- En el form se debe pasar el String definido y no el Integer para guardarle
  <%= f.select :state, Order.states.keys.to_a, {class: "form-control"}  %>
    => Rails inteligentemente le asignará correctamente

5. COOKIES
  Please note that if you specify a :domain when setting a cookie, you must also specify the domain when deleting the cookie:

   cookies[:key] = {
     :value => 'a yummy cookie',
     :expires => 1.year.from_now,
     :domain => 'domain.com'
   }

   cookies.delete(:key, :domain => 'domain.com')
  The option symbols for setting cookies are:

  * :value - The cookie’s value or list of values (as an array).
  * :path - The path for which this cookie applies. Defaults to the root of the application.
  * :domain - The domain for which this cookie applies.
  * :expires - The time at which this cookie expires, as a Time object.
  * :secure - Whether this cookie is a only transmitted to HTTPS servers. Default is false.
  * :httponly - Whether this cookie is accessible via scripting or only HTTP. Defaults to fals


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
