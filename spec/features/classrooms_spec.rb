require 'rails_helper'
require 'capybara/rspec'
require 'capybara/rails'


feature 'Index - Without Classrooms', js: true do
  before(:each) do
    visit(classrooms_path)
  end

  scenario 'Displays the correct no classrooms message on empty classrooms' do
    expect(page).to have_content('No Classrooms, Please Create One!')
    expect(page).to_not have_selector('table')
  end
end

feature 'Index - With Classrooms', js: true do
  scenario 'Displays the classrooms table when classrooms in the database' do
    # Manual - Long Hand.
    classroom_name = 'DPL'
    Classroom.create(name: classroom_name, code: 'PROG 101', teacher: 'Jake')
    visit(classrooms_path)
    # Use FactoryGirl Instead - Recommended.
    expect(page).to have_selector('table')
    expect(page).to have_content(classroom_name)
  end

  scenario 'New Button goes to the new form' do
  	visit(classrooms_path)
  	click_link('New Classroom')
  end

  scenario 'New Button goes to the new form and creates user' do
  	visit(classrooms_path)
  	click_link('New Classroom')
  	fill_in 'Name', :with => 'Dev Point Labs'
  	fill_in 'Code', :with => 'ALG 303'
  	fill_in 'Teacher', :with => 'Matthew'
  	fill_in 'Student count', :with => '9'
  	fill_in 'Category', :with => 'Snickers Bar'
  	check 'Active'
  	click_button('Create Classroom')
  end


  scenario 'Show link goes to the correct show template' do
  	classroom_name = 'DPL'
    Classroom.create(name: classroom_name, code: 'PROG 101', teacher: 'Jake')
    visit(classrooms_path)
  	click_link('Show')
  end

  scenario 'Edit link goes to the correct edit template' do
  	classroom_name = 'DPL'
    Classroom.create(name: classroom_name, code: 'PROG 101', teacher: 'Jake')
    visit(classrooms_path)
  	click_link('Edit')
  end

  scenario 'Delete links works and removes classroom' do
  	classroom_name = 'DPL'
    Classroom.create(name: classroom_name, code: 'PROG 101', teacher: 'Jake')
    visit(classrooms_path)
  	click_link('Destroy')
  	page.driver.brower.switch_to.alert.accept
  	expect(page).to have_content('No Classrooms, Please Create One!')
  end
end






