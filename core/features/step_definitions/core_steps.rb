# Login stuff
Given %r`not logged in$` do
  visit destroy_user_session_path
end

Given %r`not logged in as an administrator$` do
  visit destroy_administrator_session_path
end

Given /locale is (.+?)$/ do |locale|
  ::Refinery::I18n.current_locale = locale.to_sym if ::Refinery.i18n_enabled?
end

Given %r`(?:log|am logged) in as "([^\"]+)"$` do |login|
  @my_username = login
  visit refinery_login_path
  And %Q`enter the username "#{login}"`
  And %Q`enter the password "#{login}-123"`
  And "press the login button"
end

Then 'I should( not)? see a login form' do |negative|
  expect_opposite_if(negative) do
    response.should have_tag('form#new_user_session') do
      field_labeled('Username').should_not be_nil
      field_labeled('Password', :password).should_not be_nil
    end
  end
end

When %r`enter the username "(.+)"$` do |login|
  fill_in 'user_session[login]'   , :with => login
end

When %r`enter the password "(.+)-123"$` do |login|
  fill_in 'user_session[password]', :with => "#{login}-123"
end

When %r`enter the administrator username "(.+)"$` do |login|
  fill_in 'administrator_session[login]'   , :with => login
end

When %r`enter the administrator password "(.+)-123"$` do |login|
  fill_in 'administrator_session[password]', :with => "#{login}-123"
end

When %r`press the login button$` do
  click_button 'Sign in'
end

Then %r`not be allowed to log in$` do
  When %Q`log in as "#{@my_username}"`
  Then 'I should see a login form'
end

Then %r`be redirected to login$` do
  request.fullpath.should == refinery_login_path
end

Then /^"([^\"]*)" can log in$/ do |name|
  user = User.find_by_login!(name)
  visit refinery_login_path
  When %Q`I enter the username "#{name}"`
  And %Q`I enter the password "#{name}-123"`
  And 'I press the login button'
  Then 'I should not see a login form'
end

Then /^I should be redirected back to "([^\"]*)"$/ do |page_name|
  visit path_to(page_name)
end

Then /^Display the page$/ do
  puts "\n\n\n#{page.body.to_s}\n\n\n"
end

Then /^display "([^"]*)"$/ do |selector|
  puts "\n\n\n#{find(selector).native.to_html}\n\n\n"
end

