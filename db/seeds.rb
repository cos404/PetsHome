# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)


Role.create(title:  :user)
Role.create(title:  :moderator)
Role.create(title:  :administrator)

User.create!(
  email: "root@root.ru",
  password: "qwerty",
  password_confirmation: "qwerty",
  username: "Hash",
  confirmed_at:           "2017-06-30 21:42:22.989289",
  confirmation_sent_at:   "2017-06-30 21:40:47.864614",
  role_id: 3)


User.create!(
  email: "common_user@root.ru",
  password: "qwerty",
  password_confirmation: "qwerty",
  username: "COMMON_USER",
  confirmed_at:           "2017-06-30 21:42:22.989289",
  confirmation_sent_at:   "2017-06-30 21:40:47.864614")

Country.create!(
  eng:  'Belarus',
  rus:  'Беларусь',
  bel:  'Беларусь',
  fr:   'Bélarus',
  de:   'Weißrussland',
  es:   'Belarús'
)

Country.create!(
  eng:  'United States',
  rus:  'Соединенные штаты',
  bel:  'Злучаныя штаты',
  fr:   'États Unis',
  de:   'Vereinigte Staaten',
  es:   'Estados Unidos'
)