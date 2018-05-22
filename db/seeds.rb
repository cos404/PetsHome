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


User.create!(
  email: "root@root.ru",
  password: "qwerty",
  password_confirmation: "qwerty",
  username: "Hash",
  confirmed_at:           "2017-06-30 21:42:22.989289",
  confirmation_sent_at:   "2017-06-30 21:40:47.864614",
  role: 4)
User.create!(
  email: "common_user@root.ru",
  password: "qwerty",
  password_confirmation: "qwerty",
  username: "COMMON_USER",
  confirmed_at:           "2017-06-30 21:42:22.989289",
  confirmation_sent_at:   "2017-06-30 21:40:47.864614")

Country.create!(
  id:         1,
  title:   'Беларусь')
Country.create!(
  id:         2,
  title:   'United States')

Region.create!(
  id:         1,
  country_id: 1,
  title:   'Магілёўская вобласць')
Region.create!(
  id:         2,
  country_id: 1,
  title:   'Мінская вобласць')
Region.create!(
  id:         3,
  country_id: 2,
  title:   'New York')
Region.create!(
  id:         4,
  country_id: 2,
  title:   'Idaho')

City.create!(
  region_id:  1,
  country_id: 1,
  title:   'Бабруйск')
City.create!(
  region_id:  2,
  country_id: 1,
  title:   'Барысаў')
City.create!(
  region_id:  3,
  country_id: 2,
  title:   'New York')
City.create!(
  region_id:  4,
  country_id: 2,
  title:   'Boise')



Shelter.create!(
  title:        'Добродетель',
  country_id:   1,
  region_id:    1,
  city_id:      1,
  street:       'Минская',
  house_number: '142А',
  about:  'Мы волонтеры официального БЗОЖ "ДОБРОДЕТЕЛЬ". На данным момент мы курируем и спасаем животных с БУКСАПа, который является пунктом временного содержания животных и их дальнейшего умерщвления!!Это не приют с питанием,это убой!',
  cover:        '',
  moderation:   true,
  verified:     true,
  user_id:      1)
Shelter.create!(
  title:        'Bideawee',
  country_id:   2,
  region_id:    3,
  city_id:      3,
  street:       'East 38th Street',
  house_number: '410',
  about:  'For more than 114 years, Bideawee has been the leading pet welfare organization serving metropolitan New York and Long Island. Through a vast array of services Bideawee cultivates and supports the life-long relationships between pets and the people who love them. Please explore the site and get to know more about how Bideawee can accompany you and your pet through your life-long journey together.',
  cover:        '',
  moderation:   false,
  verified:     true,
  user_id:      2)

Pet.create!(
  subspecies:     1,
  birthday:       '2012/03/29',
  name:           'Без имени',
  size:           2,
  gender:         0,
  vaccination:    true,
  diseases:       'Отсутствуют',
  sterilization:  true,
  color:          'Белая с палевыми пятнами',
  about:          'Девочка, вырастет полноценной лайкой. Обладает прекрасными сторожевыми качествами и звонким голосом. Может стать отличной спутницей для охоты! Из-за пережитых стрессов пока сторонится людей, но наши волонтеры над этим работают.',
  user_id:        1,
  shelter_id:     1)
Pet.create!(
  subspecies:     0,
  birthday:       '2012/11/12',
  name:           'Tucker',
  size:           1,
  gender:         1,
  vaccination:    false,
  diseases:       'No',
  sterilization:  false,
  color:          'Redhead with white spots',
  about:          "Tucker's sitting pose is too cute for words. This 4-month old kitty is available at our Manhattan location. Stop by and say hello during the holiday weekend!",
  user_id:        2,
  shelter_id:     2)

ShelterStaff.create!(
  user_id:    1,
  shelter_id: 1,
  role:    2)
ShelterStaff.create!(
  user_id:    2,
  shelter_id: 2,
  role:    1)