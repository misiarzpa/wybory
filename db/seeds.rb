# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
r1 = Role.create({name: "Okregowy", description: "Can provide data in one district"})
r2 = Role.create({name: "Centralny", description: "Can read and provide data from all districts"})
r3 = Role.create({name: "Admin", description: "Can perform any CRUD operation on any resource"})
 
u1 = User.create({name: "Sally", email: "sally@example.com", password: "aaaaaaaa", password_confirmation: "aaaaaaaa", role_id: r1.id})
u2 = User.create({name: "Sue", email: "sue@example.com", password: "aaaaaaaa", password_confirmation: "aaaaaaaa", role_id: r1.id})
u3 = User.create({name: "Kev", email: "kev@example.com", password: "aaaaaaaa", password_confirmation: "aaaaaaaa", role_id: r1.id})
u4 = User.create({name: "Jack", email: "jack@example.com", password: "aaaaaaaa", password_confirmation: "aaaaaaaa", role_id: r3.id})
 
i1 = District.create({name: "pierwszy", valid_votes: 98, voters: 100, voivodship_id:1, user_id: u1.id})
i2 = District.create({name: "drugi", valid_votes: 99, voters: 100, voivodship_id:1, user_id: u2.id})
i3 = District.create({name: "trzeci",valid_votes: 89, voters: 100, voivodship_id:1, user_id: u3.id})
