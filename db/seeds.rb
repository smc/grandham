language = Language.where(name: 'Malayalam', short_code: 'ml', default: true).first_or_create!

if password = ENV['ADMIN_PASSWORD']
  user = User.new login: 'admin', email: 'admin@grandham.org', password: password, password_confirmation: password
  user.skip_confirmation!
  user.save

  User.first.set_as_super_admin(language)
end