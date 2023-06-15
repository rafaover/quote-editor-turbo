# frozen_string_literal: true

puts "\n== Seeding the database with fixtures =="
system("rails db:fixtures:load")
