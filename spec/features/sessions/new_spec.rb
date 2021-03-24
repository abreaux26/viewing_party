require "rails_helper"

RSpec.describe 'As a user' do
  before :each do
    allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(User.new)
    visit registration_path
  end

  describe 'When a user visits the "/registration" path' do
    it 'I see a welcome message' do
      welcome_message = "Welcome to Viewing Party!"

      expect(page).to have_content(welcome_message)
    end

    it 'I see a description to register for an account' do
      description = "Please Register for an Account"

      expect(page).to have_content(description)
    end

    it 'I see username field' do
      expect(page).to have_field('Username')
    end

    it 'I see email field' do
      expect(page).to have_field('Email')
    end

    it 'I see password field' do
      expect(page).to have_field('Password')
    end

    it 'I see password confirmation field' do
      expect(page).to have_field('Password Confirmation')
    end

    it 'I see registration button' do
      expect(page).to have_button('Register')
    end

    it 'I see a link to log in' do
      expect(page).to have_link("Already Registered? Log in Here")

      click_link("Already Registered? Log in Here")
      expect(current_path).to eq(root_path)
    end

    it 'I am redirected to the users dashboard page after I register successfully' do
      fill_in 'user[username]', with: 'user1'
      fill_in 'user[email]', with: 'user1@email.com'
      fill_in 'user[password]', with: 'password'
      fill_in 'user[password_confirmation]', with: 'password'

      click_button('Register')
      expect(current_path).to eq(dashboard_path)
    end

    it 'I see an error for an unsuccessful registration without username' do
      fill_in 'user[email]', with: 'user1@email.com'
      fill_in 'user[password]', with: 'password'
      fill_in 'user[password_confirmation]', with: 'password'

      click_button('Register')

      expect(page).to have_content("Username can't be blank")
    end

    it 'I see an error for an unsuccessful registration without email' do
      fill_in 'user[username]', with: 'user1'
      fill_in 'user[password]', with: 'password'
      fill_in 'user[password_confirmation]', with: 'password'

      click_button('Register')

      expect(page).to have_content("Email can't be blank")
    end

    it 'I see an error for an unsuccessful registration without password' do
      fill_in 'user[username]', with: 'user1'
      fill_in 'user[email]', with: 'user1@email.com'
      fill_in 'user[password_confirmation]', with: 'password'

      click_button('Register')

      expect(page).to have_content("Password can't be blank")
    end

    it 'I see an error for an unsuccessful registration without password confirmation' do
      fill_in 'user[username]', with: 'user1'
      fill_in 'user[email]', with: 'user1@email.com'
      fill_in 'user[password]', with: 'password'

      click_button('Register')

      expect(page).to have_content("Password confirmation required")
    end

    it 'I see an error for an unsuccessful registration without any fields filled in' do

      click_button('Register')

      expect(page).to have_content("can't be blank")
    end

    it 'I see an error for a user that already exists' do
      user1 = User.create!(username: 'user1', email: 'user1@email.com', password: 'password')

      fill_in 'user[username]', with: 'user1'
      fill_in 'user[email]', with: 'user1@email.com'
      fill_in 'user[password]', with: 'password'
      fill_in 'user[password_confirmation]', with: 'password'

      click_button('Register')

      expect(page).to have_content("has already been taken")
    end
  end
end
