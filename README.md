# BillyBo

### TODO:
- using geocoder services depending on the country(USA&EU==Google, CIS==Yandex)
- add user edit page
- addition phone numbers to shelter
- changing staff role
- add new shelter schedule day_of_week on edit page
- add comments
- fix uploading photo
- add null value in pet birthday field
- add search
- add static page
- add notification
- fix pundit policies for guests
- add activity controller

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

### TODO_AP:
- add additional countries, regions, cities
- add user controller functional
- add shelter controller functional
- add pet controller functional


### COMPLETE_AP:
- add stats to main page admin panel
- add home page in admin panel(/admin)

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