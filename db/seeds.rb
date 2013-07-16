# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

Product.create({ title: "Agile Web Development with Rails 4", description: "Rails just keeps on changing. Both Rails 3 and 4, as well as Ruby 1.9 and 2.0, bring hundreds of improvements, including new APIs and substantial performance enhancements. The fourth edition of this award-winning classic has been reorganized and refocused so it’s more useful than ever before for developers new to Ruby and Rails.", image_url: "agile.jpg", price: 25.99 })

Product.create({ title: "CoffeeScript is JavaScript done right. It provides all of JavaScript’s functionality wrapped in a cleaner, more succinct syntax. In the first book on this exciting new language, CoffeeScript guru Trevor Burnham shows you how to hold onto all the power and flexibility of JavaScript while writing clearer, cleaner, and safer code.", image_url: "coffee.jpg", price: 17.99 })

Product.create({ title: "The RSpec Book: Behaviour-Driven Development with RSpec, Cucumber, and Friends", description: "Behaviour-Driven Development (BDD) gives you the best of Test Driven Development, Domain Driven Design, and Acceptance Test Driven Planning techniques, so you can create better software with self-documenting, executable tests that bring users and developers together with a common language.", image_url: "rspec.jpg", price: 22.99 })

