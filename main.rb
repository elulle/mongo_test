puts "Starting test."
require 'mongoid'
require 'json'

puts "Trying to connect to db."

Mongoid.load!("mongoid.yml", :development)

puts "Managed to connect."


class Person
    include Mongoid::Document
    field :name
    field :email
end

puts "Defined Person class."

p = Person.new(:name => "Tom", :email => 'tom@example.com')

puts "Created new person."

p.save

puts "Saved person."

p2 = Person.first

puts "Retrieved person."

raise "Retrieved person not the same." unless p2.name == "Tom"

puts "Everything worked ok!"