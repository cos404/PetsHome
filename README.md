# BillyBo

### TODO:
- fix cyrillic case intenseve in the search
- tests
- refactoring
- request optimisation
- de locals
- fr locals
- be locals

### COMPLETE:
- addition work time to shelter
- addition employee and volunteers to shelter
- uploading images to shelters
- addition pets and associating with shelter
- pet and shelter policy
- edititng shelter can curator and employee
- role rights
- showing schedule on shelter page
- showing pets on shelter page
- uploading images to pets
- display shelter photos
- display pet photos
- rename app to "BillyBo"
- tune capistrano
- tune Action Mailer
- add user page
- fix pundit policies for guests
- add static page
- fix uploading photo WARNING, MAX ATTENTION
- add all inputs on sign up page
- add notification
- add new shelter schedule day_of_week on edit page
- add user edit page
- add search
- add human url
- add null value in pet birthday field
- add titles
- add pets edit page
- addition phone numbers to shelter
- en locals
- setting pet avatar\shelter cover
- fix search styles
- add shelter comments
- changing staff role
- add activity controller
- sorting shelters by distance on home page
- add shelters\pets\comments pagination
- fix delete photo js
- using geocoder services depending on the country(USA&EU==Google, CIS==Yandex)

### TODO_AP:
- add shelter controller functional
- add pet controller functional
- add user controller functional
- add actions to user list(activate, ban, deactivate)

### COMPLETE_AP:
- add stats to main page admin panel
- add home page in admin panel(/admin)
- add addition\deleting countries
- add addition\deleting regions
- add addition\deleting cities
- add users list
- add user edit page
- add shelters list
- add pets list
- add shelter edit page

### ENUMS:
- Staff
  - role
    - volunteer
    - employee
    - curator
 - Pet
   - subspecies
     - dog
     - cat
     - another
   - gender
     - boy
     - girl
   - size
     - s
     - m
     - l
- Schedule
  - day_of_week
    - monday
    - tuesday
    - wednesday
    - thursday
    - friday
    - saturday
    - sunday
- User
  - role
    - user
    - disagner
    - developer
    - moderator
    - admin

##PATHS:
- /shelters/new
- /shelters/:id
- /shelters/6/pets/new
- /search