# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

ComplaintType.create(user_id: 16, name: "Commute", color: "#B03060",)
ComplaintType.create(user_id: 16, name: "Netflix", color: "#FE9A76")

Complaint.create(complaint_type_id: 1, severity: 2, complaint_text: "There was a delay on the 4 train getting home.")