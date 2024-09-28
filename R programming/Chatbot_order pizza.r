##chatbot order pizza
##1. values
pizza_menu <- c("classic", "super chesses", "chicken deluex", "seafood", "hawaiian")
pizza_price <- c(200, 350, 300, 400, 350)
drink_menu <- c("water", "cola", "juice", "chocolate", "coffee")
drink_price <- c(20, 25, 30, 35, 40)
list_menu <- list(pizza_menu, pizza_price, drink_menu, drink_price)

##2. Welcome message
pizza_order <- function() {
  print("Hello! welcome to my pizza HUB!!")
  welcome <- readline("What do you want today? pizza or drink??: ")
  if (tolower(welcome) == "pizza") {
    order_it <- readline("Which pizza would you like?: ")
    if (order_it %in% pizza_menu) {
      index <- match(order_it, pizza_menu)
      price <- pizza_price[index]
      print(paste("You ordered", order_it, "pizza. It costs", price, "THB."))
    } else {
      print("Sorry! That pizza is not available. Please try again.")
    }
  } else if (welcome == "drink") {
    order_it <- readline("Which drink would you like?: ")
    if (order_it %in% drink_menu) {
      index <- match(order_it, drink_menu)
      price <- drink_price[index]
      print(paste("You ordered", order_it, "drink. It costs", price, "THB."))
    } else {
      print("Sorry! That drink is not available. Please try again.")
    }
  } else {
    print("Sorry! I don't understand. Please say 'pizza' or 'drink'.")
  }
}
