# README

## Getting Started

Ensure that you have Ruby 3.1.4 && Rails 7.0.8 installed.

Fork and/or Clone this Repo

Once on your local, `bundle install`.

In your terminal:
- Run `bundle exec rspec` to make sure all of your tests are passing.
- `rails db:{drop,create,seed,migrate}`

## Built With
<img src="https://logowik.com/content/uploads/images/heroku8748.jpg" alt="drawing" width="100"/>
<img src="https://logowik.com/content/uploads/images/circleci8026.jpg" alt="drawing" width="100"/>
<img src="https://logowik.com/content/uploads/images/ruby.jpg" alt="drawing" width="100"/>
<img src="https://logowik.com/content/uploads/images/rails5177.logowik.com.webp" alt="drawing" width="100"/>



### Testing

- `bundle exec rspec` will run all of the tests at once 
- For the SimpleCov coverage report in the terminal run `open coverage/index.html`

- If you want to run only a specific file use the following syntax: `bundle exec rspec spec/facades/geolocation_facade_spec.rb`
  -  Add `:11` to the end of the previous line if you only want to run the test starting on line 11. 


<br>

# Gems and testing 
<!-- - [Faraday](https://github.com/lostisland/faraday) gem to interact with APIs -->
- [JSONAPI Serializer](https://github.com/jsonapi-serializer/jsonapi-serializer) gem for formatting JSON responses
- [Pry](https://github.com/pry/pry) gem for debugging
- [Rspec-Rails](https://github.com/rspec/rspec-rails) Base of all testing in this Repo
- [Launchy](https://github.com/copiousfreetime/launchy) gem for inspection and debugging
- [Capybara](https://github.com/morris-lab/Capybara) gem for end to end testing 
- [ShouldaMatchers](https://github.com/thoughtbot/shoulda-matchers) gem for testing assertions
- [SimpleCov](https://github.com/simplecov-ruby/simplecov) gem for code coverage tracking
- [factory_bot](https://github.com/thoughtbot/factory_bot) gem to create models for testing data
- [Faker](https://github.com/faker-ruby/faker) gem to mock and stub test data

- [Postman](https://www.postman.com/) to check API endpoints

<br>

## API Endpoints

***Utilize `"http://localhost:3000/"` to access ALL endpoints.*** 

### Endpoint Details:

**Welcome Page**
  - **Welcome Index**
    - GET `/api/v1/welcome`

**Countries**
  - **All Countries**
    - GET `/api/v1/countries`

  - **SingleCountry with their associated breads** (Pass the endpoint a country name)
    - GET `/api/v1/countries/:country_name`

**Breads**
  - **All Breads**
    - GET `/api/v1/breads`

  - **Specific Bread Details** (pass the endpoint a bread name)
    - GET `/api/v1/breads/:bread_id`


**User CRUD**
 - **User Index**
    - GET `/api/v1/users`
