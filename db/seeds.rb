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
	password_digest: 'test'
	)


10.times do
	User.create(
		name: FFaker::Name.name,
		email: FFaker::Internet.email,
		password_digest: 'test'
		)
end