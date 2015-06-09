puts 'Setup roles'
Role.find_or_create_by!(name: :admin)
Role.find_or_create_by!(name: :teacher)
Role.find_or_create_by!(name: :student)

puts 'Initializing users'
if User.find_by_email("#{ENV['ADMIN_EMAIL']}").blank?
  user = User.create(:email => "#{ENV['ADMIN_EMAIL']}", :password => "#{ENV['ADMIN_PWD']}", :password_confirmation => "#{ENV['ADMIN_PWD']}", :first_name => 'Adel', :last_name => 'Alahmad')
  user.add_role :admin
  user.save!
end
