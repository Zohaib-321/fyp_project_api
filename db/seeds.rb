# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
Distributor.create(name:"zohaib", license:"xnxx",number:"909023920")

# manfactor

Manufactor.create(name:"babayala", license:"xxx",address:"dsdsds",number:"909023920",distributor_id: "1")

# medstore

 Medstore.create(name:"miakhalifa", license:"xvideos",number:"123",address:"johar town")

 # medicines

 Medicine.create(name:"panadol", molecule:"paracetamole",price:"150",batch_no:"ds",exp_date:3,manf_date:233,manufactors_id:"1")

 #orders

 Order.create(items:"entamizole",price:"5500",)

# #
 Stock.create(quantity:"156",medicines_id: "1")
 order_items.create(quantity: '54')