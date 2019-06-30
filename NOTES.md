# Changes to Code

## `restaurants/new.html.erb`

- Add `#build_city` method directly into nested form
- Refer to this lab for example: [Has Many Through in Forms Lab](https://github.com/meg-gutshall/has-many-through-forms-rails-labs-v-000/blob/master/app/views/posts/_form.html.erb)

## `models/restaurant.rb`

- Remove `accepts_nested_attributes_for` macro
- Add writer method re: [Basic Nested Forms](https://learn.co/tracks/full-stack-web-development-v7/rails/associations-and-rails/basic-nested-forms) lesson (scroll to bottom 'Avoiding Duplicates' section)

## `controllers/restaurants_controller.rb`

- Remove `#build_city` method from controller
