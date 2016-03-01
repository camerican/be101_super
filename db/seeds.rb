# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
heroes = Hero.create([
  {id: 1, name: "Superman", superpower: "Everything",species: "Alien"},
  {id: 2, name: "Batman", superpower: "Rich", species: "Human"},
  {id: 3, name: "The Thing", superpower: "Bad skin", species:"Human"}
  ])
