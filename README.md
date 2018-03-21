# BillyBo

### TODO:
- setting pet avatar\shelter cover
- changing staff role
- add activity controller
- fix cyrillic case intenseve in the search
- add comments
- tests
- refactoring
- request optimisation
- de locals
- fr locals
- using geocoder services depending on the country(USA&EU==Google, CIS==Yandex)

### COMPLETE:
- addition work time to shelter
- addition employee and volunteers to shelter
- uploading images to shelters
- addition pets and associating with shelter
- pet and shelter policy
- edititng shelter can curator and employee
- role rigghts
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

%button.btn.btn-info.btn-sm#addStaff.mr-2= fa_icon("user-plus")
%div#staff
  %div
    %button.btn.btn-sm.btn-info.m-1= link_to "li", user_path(@shelter.user.username)
    = "#{@shelter.user.username}(curator)"
  - @shelter.shelter_staffs.each do |staff|
    %div
      %button.btn.btn-sm.btn-danger.m-1.deleteStaff{data:{user: staff.user.id}} x
      = "#{staff.user.username}(#{staff.role})"