# Viewing Party

This is the base repo for the [viewing party project](https://backend.turing.io/module3/projects/viewing_party) used for Turing's Backend Module 3.

### About this Project



## Local Setup

1. Fork and Clone the repo
2. Install gem packages: `bundle install`
3. Setup the database: `rails db:create`


## Versions

- Ruby 2.5.3

- Rails 5.2.4.3

Example wireframes to follow are found [here](https://backend.turing.io/module3/projects/viewing_party/wireframes)


# Viewing Party

Viewing party is an application which allows users to search for popular movies, view details and reviews of movies and invite friends to a scheduled party to watch the movie. It consumes The MovieDB API (https://developers.themoviedb.org/) to provide reviews and up to date info about movies.

Our database structure links users to friends and to viewing party events, with events being linked to a movie and other users who have been invited to attend that event.

![DB](https://user-images.githubusercontent.com/72584659/113029720-00aedf80-914a-11eb-9c06-b54648705240.png)


## Summary

  - [Getting Started](#getting-started)
  - [Runing the tests](#running-the-tests)
  - [Deployment](#deployment)
  - [API](#api)
  - [Authors](#authors)
  - [Acknowledgments](#acknowledgments)

## Getting Started

These instructions will get you a copy of the project up and running on
your local machine for development and testing purposes. See deployment
for notes on how to deploy the project on a live system.

### Prerequisites

You will need to install the mailcatcher gem locally in order to test the email functionality in the app.

    `gem install mailcatcher`

### Installing

1. Fork and clone the repo

2. Install the gem package

    `bundle install`

3. Create the database

    `rails db:create`

4. Migrate the existing Schema

    `rails db:migrate`

Optional: Seed the datebase
    `rails db:seed`

5. Add MovieDB API Key locally (See [API](#api) section for details.)

    Note: This app uses The MovieDB API to support most of it's functionality. Most tests will not pass and most parts of the app will not work without an API key added.

6. Run tests (See Runing the tests](#running-the-tests) section for more details)

    `bundle exec RSpec`

7. Start localhostserver

    `rails s`

8. Access localhost server in browser

    `localhost:3000`

![viewing_party_demo](https://user-images.githubusercontent.com/72584659/113209443-52319a00-9230-11eb-980d-d35822054642.gif)    


## Running the tests

1. All tests: insert `bundle exec rspec` in your terminal.
2. `feature` tests only: insert `bundle exec rspec spec/features` in your terminal.
3. `model` tests only: insert `bundle exec rspec spec/models` in your terminal.

### Break down into end to end tests

Below are two examples of a happy and sad path when trying to log in.

```
  it 'I am taken to my dashboard after a successful login' do
    fill_in :email, with: @user1.email
    fill_in :password, with: @user1.password

    click_button "Log In"

    expect(current_path).to eq(dashboard_path)

    expect(page).to have_content("Welcome #{@user1.username}!")
  end

  it 'I see an error for an unsuccessful login' do
    fill_in :email, with: @user1.email
    fill_in :password, with: "wrong password"

    click_on "Log In"

    expect(current_path).to eq(root_path)
    expect(page).to have_content("Invalid Credentials!")
  end
```

### And coding style tests

* We used `RuboCop` - static code analyzer and code formatter
* Steps to install [RuboCop](https://github.com/rubocop/rubocop)

```
Inspecting 22 files
.....C................

Offenses:

app/controllers/sessions_controller.rb:6:3: C: Metrics/MethodLength: Method has too many lines. [11/10]
  def create ...
  ^^^^^^^^^^

22 files inspected, 1 offense detected
```

## Deployment

### Heroku
1. Create with directory that contains rails app
  * `heroku create`
    * If you are unsure which stack to use, read this [article](https://devcenter.heroku.com/articles/stack)
2. Verify remote is running
  * `git config --list | grep heroku`
3. Deploy code - **never push anything but main branch**
  * `git push heroku main`
4. If no errors, migrate database
  * `heroku run rails db:migrate`

#### Visit App
1. Assign one **dyno** running the app
  * `heroku ps:scale web=1`
2. Check the state of app's dyno
  * `heroku ps`
3. Oopen the app in brower
  * `heroku open`

#### Remove an app
`heroku apps:destroy`

#### Drop,Create,Migrate,Seed Database
1. `heroku pg:reset DATABASE`
2. `heroku run rails db:migrate`
3. `heroku run rails db:seed`

## API
  There is currently one API being used in this application, [The Movie DB](https://www.themoviedb.org/?language=en-US). In order to consume this API and correctly use this application, you must follow these steps:

  1. **Sign up for MovieDB**
    - Go to the [MovieDB](https://www.themoviedb.org/?language=en-US) homepage and click *Join TMDb*.
    - Set up a new account, confirm your email, and redirect your browser back to the homepage.
  
  2. Once you are logged in and on the homepage, access your profile settings.
    - *You can do this by clicking the icon with your first initial on the top right of the screen(If you haven't set up a profile picture yet).*
  
  3. Navigate to the API tab within settings

  4. Request a new API key and fill out the forms provided
    - This might take 24 hours to process as the only one who can approve this key is the sight's true admin.
  
  5. Once you have your key, copy and paste your *Bearer Access Token* into a new `YML` file in the `config` folder of your application, along with an assigned variable.

  6. Within your `application.rb` file in `config`, add this within the class `Application`:
    `
      config.before_configuration do
      env_file = File.join(Rails.root, 'config', 'local_env.yml')
      YAML.load(File.open(env_file)).each do |key, value|
      ENV[key.to_s] = value
      end if File.exists?(env_file)
    end
    `
  7. Now, you have added the bearer token to your application! You are now open to accessing this API using your own designed service. If you would prefer to use the default service, please refer to the `movie_service.rb` file within `apps/services` to find the correct actions.
    ```

  8. You have successfully implemented the MovieDB API! To find the correct endpoints you would like to access, use [This URL](https://www.developers.themoviedb.org/).

## Authors

  - [Trevor Suter](https://github.com/Trevorsuter)
  - [Angel Breaux](https://github.com/abreaux26)
  - [Trevor Robinson](https://github.com/Trevor-Robinson)
