# Components to Develop

Build process for the testing website

## Apps = Branches

- [x] user-accounts [authentication, validations, error messages]
- [x] user-accounts [omniauth]
- [x] profile-associations [associations, validations, error messages] - *depends on user-accounts*
- [x] location-activity-features [associations, nested form, validations, error messages, scope methods]
- [ ] reservations [associations, nested form with join table, validations, error messages] - *depends on profile-associations*
- [ ] user-interface-and-integration [asset-pipeline, etc.]

## Component Overview

- [x] Authenitication (create user with first_name, last_name, usernmae, email, password)
- [x] User Profile (add address and one-or-more dogs to user)
- [x] Location
- [x] Activity
- [x] Nested form -> location has_many activities
- [x] Nested resource -> locations/:location_id/activities/:id
- [x] Class methods -> locations, activities, etc.
- [ ] Reservations -> nested form many-to-many reservations to activities
- [ ] Validations, etc.

## Features

- [x] User authentication system
- [x] Omniauth integration
- [ ] Associations, ex. has_many, belongs_to, has_many :through
- [ ] Validations
- [ ] Error messages
- [x] Class level scope methods
- [ ] Nested form with custom attribute writer
- [ ] Nested form with custom attribute writer to join table
