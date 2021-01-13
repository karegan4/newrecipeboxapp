# Specifications for the Rails Assessment

Specs:
- [x] Use the Ruby on Rails framework
- [x] Include at least one has_many relationship 
  - A User has_many Categories and has_many recipes
- [x] Include at least one belongs_to relationship 
  - A Recipe belongs_to a User and belongs_to a Category
- [x] Include at least two has_many through relationships 
  - A User has_many Categories through Recipes
  - A Category has_many Users through Recipes
- [x] Include at least one many-to-many relationship 
  - User model and Categories model have a many-to-many relationship
- [ ] Include at least one class level ActiveRecord scope
  method. Must be chainable, meaning that you use ActiveRecord Query methods with it (such as .where and .order) rather than native ruby methods (such as #find_all or #sort)
  - 
- [x] Include reasonable validations for simple model objects (list of model objects with validations e.g. User, Recipe, Ingredient, Item)
  - A User must have a name, email and password. The email address must be unique.
- [ ] Include a class level ActiveRecord scope method (model object & class method name and URL to see the working feature e.g. User.most_recipes URL: /users/most_recipes)
  - 
- [x] Include signup 
- [x] Include login 
- [x] Include logout 
- [x] Include third party signup/login (OmniAuth)
  - Users can sign in with a Facebook account
- [x] Include nested resource show or index (URL e.g. users/2/recipes)
  - Navigating to '/categories/:id/recipes' shows all recipes in that category and '/categories/:id/recipes/:id' shows show page for individual recipe
- [x] Include nested resource "new" form (URL e.g. recipes/1/ingredients/new)
  - A new recipe is created at '/categories/:id/recipes/new'
- [ ] Include form display of validation errors (form URL e.g. /recipes/new)
  - 

Confirm:
- [ ] The application is pretty DRY
- [ ] Limited logic in controllers
- [ ] Views use helper methods if appropriate
- [ ] Views use partials if appropriate
