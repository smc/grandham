language = Language.where(name: "Malayalam", short_code: "ml", default: true).first_or_create!

unless User.where(email: "admin@grandham.org").present?
  password = ENV["ADMIN_PASSWORD"]

  user = User.new login: "admin", email: "admin@grandham.org", password: password, password_confirmation: password
  user.skip_confirmation!
  user.save!

  user.set_as_super_admin(language)
end
