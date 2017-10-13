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
Role.create(title:  :disagner)
Role.create(title:  :developer)

Role.create(title:  :volunteer)
Role.create(title:  :employee)
Role.create(title:  :curator)

Role.create(title:  :moderator)
Role.create(title:  :administrator)

User.create!(
  email: "root@root.ru",
  password: "qwerty",
  password_confirmation: "qwerty",
  username: "Hash",
  confirmed_at:           "2017-06-30 21:42:22.989289",
  confirmation_sent_at:   "2017-06-30 21:40:47.864614",
  role_id: 8)
User.create!(
  email: "common_user@root.ru",
  password: "qwerty",
  password_confirmation: "qwerty",
  username: "COMMON_USER",
  confirmed_at:           "2017-06-30 21:42:22.989289",
  confirmation_sent_at:   "2017-06-30 21:40:47.864614")

Country.create!(
  id:         1,
  title_en:   'Belarus',
  title_ru:   'Беларусь',
  title_be:   'Беларусь',
  title_fr:   'Bélarus',
  title_de:   'Weißrussland',
  title_es:   'Belarús')
Country.create!(
  id:         2,
  title_en:   'United States',
  title_ru:   'Соединенные штаты',
  title_be:   'Злучаныя штаты',
  title_fr:   'États Unis',
  title_de:   'Vereinigte Staaten',
  title_es:   'Estados Unidos')

Region.create!(
  id:         1,
  country_id: 1,
  title_en:   'Mogilev Region',
  title_ru:   'Могилёвская о́бласть',
  title_be:   'Магілёўская вобласць',
  title_fr:   'Région de Mahiliow',
  title_de:   'Mogilev-Region',
  title_es:   'provincia de Maguilov')
Region.create!(
  id:         2,
  country_id: 1,
  title_en:   'Minsk Region',
  title_ru:   'Минская область',
  title_be:   'Мінская вобласць',
  title_fr:   'Région de Minsk',
  title_de:   'Minsk region',
  title_es:   'Región de Minsk')
Region.create!(
  id:         3,
  country_id: 2,
  title_en:   'New York',
  title_ru:   'Нью Йорк',
  title_be:   'Нью Ёрк',
  title_fr:   'New York',
  title_de:   'New York',
  title_es:   'Nueva York')
Region.create!(
  id:         4,
  country_id: 2,
  title_en:   'Idaho',
  title_ru:   'Айдахо',
  title_be:   'Айдаха',
  title_fr:   'Idaho',
  title_de:   'Idaho',
  title_es:   'Idaho')

City.create!(
  region_id:  1,
  title_en:   'Bobruisk',
  title_ru:   'Бобруйск',
  title_be:   'Бабруйск',
  title_fr:   'Bobrouïsk',
  title_de:   'Bobruisk',
  title_es:   'Bobruisk')
City.create!(
  region_id:  2,
  title_en:   'Borisov',
  title_ru:   'Борисов',
  title_be:   'Барысаў',
  title_fr:   'Borisov',
  title_de:   'Borisov',
  title_es:   'Borisov')
City.create!(
  region_id:  3,
  title_en:   'New York',
  title_ru:   'Нью Йорк',
  title_be:   'Нью Ёрк',
  title_fr:   'New York',
  title_de:   'New York',
  title_es:   'Nueva York')
City.create!(
  region_id:  4,
  title_en:   'Boise',
  title_ru:   'Бойсэ',
  title_be:   'Boise',
  title_fr:   'Boise',
  title_de:   'Boise',
  title_es:   'Boise')



Shelter.create!(
  title:        'Добродетель',
  country_id:   1,
  region_id:    1,
  city_id:      1,
  street:       'Минская',
  house_number: '142А',
  about:  'Мы волонтеры официального БЗОЖ "ДОБРОДЕТЕЛЬ". На данным момент мы курируем и спасаем животных с БУКСАПа, который является пунктом временного содержания животных и их дальнейшего умерщвления!!Это не приют с питанием,это убой!',
  cover:        '',
  working:      true,
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
  working:      true,
  verified:     true,
  user_id:      2)

Pet.create!(
  subspecies:     1,
  birthday:       '2012/03/29',
  name:           'Без имени',
  euthanasia:     false,
  size:           2,
  gender:         1,
  vaccination:    'Привита',
  diseases:       'Отсутствуют',
  sterilization:  true,
  color:          'Белая с палевыми пятнами',
  about:          'Девочка, вырастет полноценной лайкой. Обладает прекрасными сторожевыми качествами и звонким голосом. Может стать отличной спутницей для охоты! Из-за пережитых стрессов пока сторонится людей, но наши волонтеры над этим работают.',
  user_id:        1,
  shelter_id:     1)
Pet.create!(
  subspecies:     2,
  age_years:      1,
  age_months:     3,
  name:           'Tucker',
  euthanasia:     false,
  size:           1,
  gender:         2,
  vaccination:    'No',
  diseases:       'No',
  sterilization:  false,
  color:          'Redhead with white spots',
  about:          "Tucker's sitting pose is too cute for words. This 4-month old kitty is available at our Manhattan location. Stop by and say hello during the holiday weekend!",
  user_id:        2,
  shelter_id:     2)

ShelterStaff.create!(
  user_id:    1,
  shelter_id: 1,
  role_id:    6)
ShelterStaff.create!(
  user_id:    2,
  shelter_id: 2,
  role_id:    5)