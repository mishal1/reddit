def add_room(name = 'name')
  visit '/'
  click_link 'Add a room'
  fill_in 'Name', with: name
  fill_in 'Description', with: 'description'
  click_button 'Create Room'
end

def sign_up
  visit '/'
  click_link 'Sign up'
  fill_in 'Email', with: 'test@example.com'
  fill_in 'Password', with: 'testtest'
  fill_in 'Password confirmation', with: 'testtest'
  click_button 'Sign up'
end

def add_comment
  visit '/'
  click_link 'name'
  click_link 'Comment'
  fill_in 'Thoughts', with: 'user comment'
  click_button 'Leave comment'
end