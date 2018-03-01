# Components to Develop

Build process for the testing website

## Apps = Branches

- [x] user-accounts [authentication, validations, error messages]
- [ ] user-accounts [omniauth]
- [ ] profile-associations [associations, validations, error messages]
- [ ] location-activity-features [associations, nested form, validations, error messages, scope methods]
- [ ] reservations [associations, nested form with join table, validations, error messages]
- [ ] user-interface-and-integration [asset-pipeline, etc.]

## Component Overview

- [x] Authenitication (create user with first_name, last_name, usernmae, email, password)
- [ ] User Profile (add address and one-or-more dogs to user)
- [ ] Location
- [ ] Activity
- [ ] Nested form -> location has_many activities
- [ ] Nested resource -> locations/:location_id/activities/:id
- [ ] Class methods -> locations, activities, etc.
- [ ] Reservations -> nested form many-to-many reservations to activities
- [ ] Validations, etc.

## Features

- [x] User authentication system
- [ ] Omniauth integration
- [ ] Associations, ex. has_many, belongs_to, has_many :through
- [ ] Validations
- [ ] Error messages
- [ ] Class level scope methods
- [ ] Nested form with custom attribute writer
- [ ] Nested form with custom attribute writer to join table
