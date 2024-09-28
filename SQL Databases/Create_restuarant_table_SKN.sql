https://dbdiagram.io/d/restuarant_ER_kangsom-66a6190f8b4bb5230e8b8341

Table order_detail{
  staff_id int 
  customer_id int 
  branch_id int 
  menu_id int 
  order_date datetime
}

Table staff{
  staff_id int [pk]
  staff_name text
  salary real
}

Table customers{
  customer_id int [pk]
  customer_name text
}

Table branch{
  branch_id int [pk]
  branch_name text
}

Table menu{
  menu_id int [pk]
  menu_name text
  menu_price real
}
