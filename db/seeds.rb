# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
p 'Hello from seeds!!'
# tables = ['users']

# tables.each do |table|
# 	ActiveRecord::Base.connection.execute("TRUNCATE #{table} RESTART IDENTITY")
# end

User.destroy_all

User.create(
	name: 'Ashley', 
	email: 'ashley@ga.com',
	password: '123456',
	top_rope: '10c',
	lead: '10a',	
	boulder: 'v1',
	image: 'http://i.imgur.com/Oguyg9j.png'
	)
User.create(
	name: 'Chrissy', 
	email: 'chrissy@ga.com',
	password: '123456',
	gym: 'Dogpatch',
	top_rope: '10d',
	lead: '10b',
	boulder: 'v0',
	image: 'http://i.imgur.com/Sal4uax.png'
	)
User.create(
	name: 'Oliver', 
	email: 'oliver@ga.com',
	password: '123456',
	gym: 'Panet Granite',
	top_rope: '11b',
	lead: '10d',
	boulder: 'v5',
	image: 'http://i.imgur.com/tI5cMYL.png'
	)
User.create(
	name: 'Sera', 
	email: 'sera@ga.com',
	password: '123456',
	gym: 'Dogpatch',
	top_rope: '10c',
	lead: '10a',	
	boulder: 'v1',
	image: 'http://i.imgur.com/KAwNKAA.png'
	)
User.create(
	name: 'Beth', 
	email: 'beth@ga.com',
	password: '123456',
	gym: 'Panet Granite',
	top_rope: '10d',
	lead: '10b',
	boulder: 'v0'
	)
User.create(
	name: 'Junior', 
	email: 'junior@ga.com',
	password: '123456',
	gym: 'Mission Cliffs',
	top_rope: '10d',
	lead: '10b',
	boulder: 'v3'
	)
User.create(
	name: 'Gabriella', 
	email: 'gabriella@ga.com',
	password: '123456',
	gym: 'Dogpatch',
	top_rope: '10c',
	lead: '10a',	
	boulder: 'v1'
	)
User.create(
	name: 'Nathan', 
	email: 'nathan@ga.com',
	password: '123456',
	gym: 'Panet Granite',
	top_rope: '11b',
	lead: '10d',
	boulder: 'v5'
	)
User.create(
	name: 'Mercedes', 
	email: 'mercedes@ga.com',
	password: '123456',
	gym: 'Mission Cliffs',
	top_rope: '10d',
	lead: '10b',
	boulder: 'v0'
	)
User.create(
	name: 'Luke', 
	email: 'luke@ga.com',
	password: '123456',
	gym: 'Panet Granite',
	top_rope: '10c',
	lead: '10a',	
	boulder: 'v1'
	)

# 10.times do
# 	User.create(
# 		name: FFaker::Name.name,
# 		email: FFaker::Internet.email,
# 		password: '123456',
# 		gym: 'Panet Granite'
# 		)
# end