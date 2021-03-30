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

Viewing party is an application in which users can explore movie options and create a viewing party event for the user and friend's.

This initially appeared on
[gist](https://gist.github.com/PurpleBooth/109311bb0361f32d87a2), but as
I can no longer open that page as there are too many comments, I have
moved it here.

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

What things you need to install the software and how to install them

    Give examples

### Installing

A step by step series of examples that tell you how to get a development
env running

Say what the step will be

    Give the example

And repeat

    until finished

End with an example of getting some data out of the system or using it
for a little demo

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

Explain what these tests test and why

    Give an example

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

  - [Contributor Covenant](https://www.contributor-covenant.org/) - Used
    for the Code of Conduct
  - [Creative Commons](https://creativecommons.org/) - Used to choose
    the license

## Authors

  - **Billie Thompson** - *Provided README Template* -
    [PurpleBooth](https://github.com/PurpleBooth)

See also the list of
[contributors](https://github.com/PurpleBooth/a-good-readme-template/contributors)
who participated in this project.

## Acknowledgments

  - Hat tip to anyone whose code was used
  - Inspiration
  - etc
