# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)

def reset_table_autoincrement(name)
    ActiveRecord::Base.connection.execute("delete from sqlite_sequence where name='#{name}'")
end

Role.delete_all
reset_table_autoincrement "roles"
Role.create!([
    {name:"admin"},
    {name:"elfployee"},
    {name:"customer"},
])

Locale.delete_all
reset_table_autoincrement "locales"
Locale.create!([
    {code:"en", description:"English"},
    {code:"fr", description:"French"},
    {code:"es", description:"Spanish"}
])

Country.delete_all
reset_table_autoincrement "countries"
Country.create!([
    {code:"CAN", name:"Canada"},
    {code:"USA", name:"United States of America"},
    {code:"MEX", name:"Mexico"},
    {code:"FRA", name:"France"},
    {code:"ESP", name:"Spain"}
])

User.delete_all
reset_table_autoincrement "users"
User.create!([
    {
        login: "santa", name: "Nicholas Claus", email: "santa@northpole.com",
        country_id: 1, role_id: 1, locale_id: 1
    },
    {
        login: "e1", name: "Elf Canada", email: "canada@northpole.com",
        country_id: 1, role_id: 2, locale_id: 1
    },
    {
        login: "e2", name: "Elf USA", email: "usa@northpole.com",
        country_id: 2, role_id: 2, locale_id: 2
    },
    {
        login: "e3", name: "Elf Mexico", email: "mexico@northpole.com",
        country_id: 3, role_id: 2, locale_id: 3
    },
    {
        login: "e4", name: "Elf France", email: "france@northpole.com",
        country_id: 4, role_id: 2, locale_id: 2
    },
    {
        login: "e5", name: "Elf Spain", email: "spain@northpole.com",
        country_id: 5, role_id: 2, locale_id: 3
    },
    {
        login: "c1", name: "Easter Bunny", email: "bige@bunny.com",
        country_id: 5, role_id: 3, locale_id: 1
    }
])
