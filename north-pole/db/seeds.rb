# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)

Role.create!([
    {name:"admin"},
    {name:"elfployee"}
])

Locale.create!([
    {code:"en", description:"English"},
    {code:"fr", description:"French"}
])

Country.create!([
    {code:"CAN", description:"Canada"},
    {code:"USA", description:"United States of America"},
    {code:"MEX", description:"Mexico"}
])