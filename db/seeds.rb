# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

Category.destroy_all
TodoItem.destroy_all

study = Category.create(name: "Study")
life = Category.create(name: "Life")

TodoItem.create(title: "Workbook", description: "UTAS Fishing Workbook", category: study, due_date: Date.today)
TodoItem.create(title: "Project", description: "CodeAcademy T2 Project", category: study, due_date: Date.today+1)
TodoItem.create(title: "Grocery Shopping", description: "Buy coffee, bread, milk", category: life, due_date: Date.today+5)
