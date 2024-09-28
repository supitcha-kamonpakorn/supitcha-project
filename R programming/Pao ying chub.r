## variables
pao_ying_chub <- c("hammer", "scissor", "paper")
You_win <- 0
I_win <- 0
We_draw <- 0

##function
pao_ying_chub_game <- function() {

  print("Welcome to Pao Ying Chub Game")
  pao_ying_chub <- c("hammer", "scissor", "paper")
  Your_turn <- readline("Please select your choice: ")
  My_turn <- sample(pao_ying_chub, 1)

  if (Your_turn == My_turn) {
    print("We are Draw!")
    We_draw <<- We_draw + 1

  } else if ((Your_turn == "hammer" && My_turn == "scissor") ||
             (Your_turn == "scissor" && My_turn == "paper") ||
             (Your_turn == "paper" && My_turn == "hammer")) 
    {
    print("You Win!")
    You_win <<- You_win +1
  } 
    else {
    print("I Win!")
    I_win <<- I_win +1
  }
}

##play 10 games
loop_game <- function() {
  for (i in 1:10) {
    pao_ying_chub_game()
  }
  print("Game end thank you!!")
  print(paste0("User Wins:", You_win))
  print(paste0("I win:", I_win))
  print(paste0("We draw:", We_draw))
  You_win <<- 0
  I_win <<- 0
  We_draw <<- 0
}
