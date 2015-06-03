# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
ItemKind.create([{ name: 'hours' }, { name: 'service' }, { name: 'product' }, { name: 'days' }, { name: 'deposit' }, { name: 'expenses' }])
Company.create(name: 'KOCO', street_1: 'Blackwell', street_2: 'Hatton', city: 'Warwickshire', town: 'Warwick', post_code: 'CV35');
