# Specifications for the Rails Assessment

Specs:
- [x] Using Ruby on Rails for the project
- [x] Include at least one has_many relationship (x has_many y; e.g. User has_many Recipes) -- I have three has_many relationships, a User has_many Reviews, a Restaurant has_many Reviews, and a City has_many Restaurants
- [x] Include at least one belongs_to relationship (x belongs_to y; e.g. Post belongs_to User) -- A Restaurant belongs_to a City and a Review belongs_to a Restaurant and a User
- [x] Include at least two has_many through relationships (x has_many y through z; e.g. Recipe has_many Items through Ingredients) -- A Restaurant has_many Users through Reviews and a User has_many Restaurants through Reviews
- [x] Include at least one many-to-many relationship (x has_many y through z, y has_many x through z; e.g. Recipe has_many Items through Ingredients, Item has_many Recipes through Ingredients) -- A Restaurant has_many Users through Reviews and User has_many Restaurants through Reviews
- [x] The "through" part of the has_many through includes at least one user submittable attribute, that is to say, some attribute other than its foreign keys that can be submitted by the app's user (attribute_name e.g. ingredients.quantity) -- The "through" part is the reviews, where a User submits content of the Review and a star rating
- [x] Include reasonable validations for simple model objects (list of model objects with validations e.g. User, Recipe, Ingredient, Item) -- Restaurants has a validation that the name is present, and a custom validation that the name and address cannot be the same. City has a validation that the name is present and unique. Review has a validation that there is content and it does not exceed 500 characters, and that the star rating is between 0-5. User has a validation that the password is at least 8 characters, the username is present, unique and max of 50 characters, and the email is present, unique, max length of 255 characters and has correct formatting.
- [x] Include a class level ActiveRecord scope method (model object & class method name and URL to see the working feature e.g. User.most_recipes URL: /users/most_recipes) -- I have two scope methods for reviews, that sorts the reviews based on rating, either high-to-low (restaurants/1/reviews?utf8=✓&review=High+to+Low&commit=Filter) or low-to-high (restaurants/1/reviews?utf8=✓&review=Low+to+High&commit=Filter).
- [x] Include signup (how e.g. Devise) Bcrypt
- [x] Include login (how e.g. Devise) Bcrypt
- [x] Include logout (how e.g. Devise) Bcrypt
- [x] Include third party signup/login (how e.g. Devise/OmniAuth) Bcrypt/OmniAuth with Google
- [x] Include nested resource show or index (URL e.g. users/2/recipes) -- restaurants/1/reviews
- [x] Include nested resource "new" form (URL e.g. recipes/1/ingredients/new) -- restaurants/1/reviews/new
- [x] Include form display of validation errors (form URL e.g. /recipes/new) -- I have a 'errors' partial that is included at each form

Confirm:
- [x] The application is pretty DRY
- [x] Limited logic in controllers
- [x] Views use helper methods if appropriate
- [x] Views use partials if appropriate