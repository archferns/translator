# frozen_string_literal: true

# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

user = User.create!(email: 'developer@example.com', password: 'password', confirmed_at: Time.zone.now)
project = user.projects.create!(name: 'My project')

10.times do |index|
  text = project.texts.create!(key: "key_#{index + 1}")
  text.translations.create!([
                              { locale: 'en', value: "Hello world #{index + 1}" },
                              { locale: 'pt', value: "Olá mundo #{index + 1}" }
                            ])
end
