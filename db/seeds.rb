User.destroy_all

@user_1 = User.create(first_name: "Bob", last_name: "Cobb", email: "bobcobb@net.com", username: "bobcobb", password: "hello1")
@user_2 = User.create(first_name: "Hal", last_name: "Hope", email: "halhope@net.com", username: "halhope", password: "hello1")
@user_3 = User.create(first_name: "Kal", last_name: "Kool", email: "kalkool@net.com", username: "kalkool", password: "hello1")