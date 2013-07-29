# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)


Product.create([{title: "Information Coding, 2006", description: "Digital print (ed. 25). Image 33 x 41 cm.", image_url: "InformationCoding.jpg", price: 250}, {title: "Hypertextual analysis, 2005", description: "Digital print (ed. 25). Image 37 x 20 cm.", image_url: "HypertextualAnalysis.jpg", price: 250} , {title: "Syntactic Sugar, 2007", description: "Mixed-media monoprint, 36 x 26 cm.", image_url: "SyntacticSugar.jpg", price: 350}, {title: "Open Source Framework, 2008", description: "Digital print (ed. 25). Image 19 x 13 cm.", image_url: "OpenSourceFramework.jpg", price: 120}, {title: "Qubit", description: "Mixed-media painting on paper, 2009. 3 pieces 76 x 56 cm.", image_url: "Qubit.jpg", price: 1600}])