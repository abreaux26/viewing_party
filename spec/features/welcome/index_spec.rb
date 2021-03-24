require "rails_helper"

RSpec.describe 'When a user visits the root path' do
  before :each do
    @user1 = User.create!(username: 'user1', email: 'user1@email.com', password: 'password')
    allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(@user1)
    visit root_path
  end

  it 'I see a welcome message' do
    welcome_message = "Welcome to Viewing Party!"

    expect(page).to have_content(welcome_message)
  end

  it 'I see a brief description of the application' do
    description = "Watch scheduled movies with friends!"

    expect(page).to have_content(description)
  end

  it 'I see email and password fields' do
    expect(page).to have_field('Email')
    expect(page).to have_field('Password')
  end

  it 'I see a button to log in' do
    expect(page).to have_button("Log In")
  end

  it 'I see a link to registration' do
    expect(page).to have_link("Registration")

    click_link("Registration")
    expect(current_path).to eq(new_user_path)
  end

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
end
